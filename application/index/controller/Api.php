<?php

namespace app\index\controller;

use app\manager\model\GeeAddons; // 前置操作
use app\manager\model\GeeDomainContact; //用户表
// use app\index\model\GeeDeal; //收支明细表
use app\manager\model\GeeDomainPrice; //交易记录表
use app\manager\model\GeeProduct; //订单表
use app\manager\model\GeeProductClass; //订单表
use app\manager\model\GeeProductGroup; //产品分类表
use app\index\controller\Common; //产品分类表
use app\index\model\GeeBilling; //
use app\index\model\GeeDomain; //产品组表
use app\index\model\GeeOrder; //产品表
use app\index\model\GeeProConfig; //插件表
use app\index\model\GeeUser; //产品购买配置表
use app\index\model\GeeServer; //产品购买配置表

use think\Controller;

// 请求类

class Api extends Controller
{
  /**
   * 支付宝同步接口
   */
  public function return_url()
  {
    // $deal = new GeeDeal();
    $u = new GeeUser();
    $o = new GeeOrder();
    $b = new GeeBilling();
    $pc = new GeeProConfig();

    $post = input();
    // $post = $request->param();
    //写在文本里看一下参数
    $data = json_encode($post);
    file_put_contents("alipaytext.txt", $data);

    vendor('alipay.AlipayTradeService');
    $alipaySevice = new \AlipayTradeService(Config('alipay'));
    $alipaySevice->writeLog(var_export($post, true));
    $result = $alipaySevice->check($post);

    // $deal->where('num = ' . $post['out_trade_no'])->update(['dealnum' => $post['trade_no']]);
    if ($post['trade_status'] == "TRADE_SUCCESS") {
      //操作数据库 修改状态
      $dinfo = $b->where('order_number = ' . $post['out_trade_no'])->find();
      $uinfo = $u->where('id = ' . $dinfo['user_id'])->find();
      $selfPro = json_decode($dinfo['pro_list'], false);
      if ($dinfo['order_type'] == '0') {
        $uinfo = $u->where('id = ' . $dinfo['user_id'])->find();
        $u->where('id = ' . $dinfo['user_id'])->update(['balance' => ((float) $uinfo['balance'] + (float) $dinfo['money'])]);
      } else {
        $pcs = $pc->where('order_number = "' . $post['out_trade_no'] . '"')->find();
        $configs = $pcs ? json_decode($pcs['config'], true) : '';
        if ($pcs && $configs && $configs['_create_putData']) {
          if ($configs['_create_putData']['class'] == 'domain') {
            $d = new GeeDomain();
            $dc = new GeeDomainContact();
            $dp = new GeeDomainPrice();
            $pro = new GeeProduct();
            $addons = new GeeAddons();
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            // dump($configs['_create_putData']);
            foreach ($configs['_create_putData']['data'] as $k => $v) {
              // dump($v);
              $suffix = '.' . explode(".", $v['domainname'])[1];
              $dpinfo = $dp->where('domain = "' . $suffix . '"')->find();
              $proinfo = $pro->where('id = ' . $dpinfo['pro_id'])->find();
              $adninfo = $addons->where('id = ' . $proinfo['plug'])->find();
              if ($configs['_create_putData']['action'] != 'domainRenew') {
                $dcinfo = $dc->where('id = ' . $v['userid'])->find();
                $userid = json_decode($dcinfo['contact_id'], true)[$proinfo['name']]['value'];
              }
              // dump(json_decode($dcinfo['contact_id'],true));
              if ($configs['_create_putData']['action'] == 'domainRenew') {
                $putData = [
                  'way' => $adninfo['name'],
                  'pro_id' => $dpinfo['pro_id'],
                  'function' => 'control',
                  'action' => $configs['_create_putData']['action'],
                  'data' => [
                    "domainname" => $v['domainname'],
                    "years" => $v['years'],
                    "exptme" => $v['exptme'],
                  ],
                ];
              } else {
                $putData = [
                  'way' => $adninfo['name'],
                  'pro_id' => $dpinfo['pro_id'],
                  'function' => 'control',
                  'action' => 'createDom',
                  'data' => [
                    'userid' => $userid,
                    'domainname' => $v['domainname'],
                    'years' => $v['years'],
                    'domainpass' => $v['domainpass'],
                    'dns1' => $v['dns1'],
                    'dns2' => $v['dns2'],
                  ],
                ];
              }
              // dump($v);
              // dump($putData);

              $res = $plug->$func($putData);
              $res = json_decode($res, true);
              if ($res['status'] == 'failed') {
                $ret['status'] = 400;
                $ret['msg'] = '请求超时！请联系管理员处理！错误码:' . explode(' ', $res['data'])[0];
                $isfailed = true;
                break;
              } else {
                if ($configs['_create_putData']['action'] == 'domainRenew') {
                  $save = [
                    'user_id' => $dinfo['user_id'],
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->where('domainname = "' . $v['domainname'] . '"')->update($save);
                } else {
                  $save = [
                    'user_id' => $dinfo['user_id'],
                    'userid' => $userid,
                    'domainname' => $v['domainname'],
                    'years' => $v['years'],
                    'domainpass' => $v['domainpass'],
                    'isname' => 0,
                    'dns' => json_encode(['dns1' => $v['dns1'], 'dns2' => $v['dns2']]),
                    'status' => 0,
                    'r_status' => 0,
                    'newstas' => 0,
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->save($save);
                  //发起短信请求
                  parseMsgPublic([
                    'mark' => 'domainRegister',
                    'to' => session('_userInfo')['phone'],
                    'params' => [
                      $v['domainname'],
                      'basic_name',
                    ],
                  ]);
                }
              }
            }
            // return;

            // dump($ret);
            if ($isfailed) {
              // dump($uinfo['balance']);
              // dump($info['money']);
              $userup = db('user')->where('id = ' . session('_userInfo')['id'])->update([
                'balance' => ((float) session('_userInfo')['balance'] - (float) $dinfo['money']) + (float) $dinfo['money'],
              ]);
              return json_encode($ret);
            }
          } else if ($configs['_create_putData']['class'] == 'vps') {
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }
            // dump($configs);
            // dump($configs['_create_putData']);
            // dump($putData);
            // return ;
            $res = $plug->$func($putData);
            // dump($res);
            // exit;
            if (json_decode($res, true)['status'] != 200) {
              $ret['status'] = json_decode($res, true)['status'];
              $ret['msg'] = json_decode($res, true)['msg'];
              return json_encode($ret);
            }
          } else if ($configs['_create_putData']['class'] == 'host') {

            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }

            $res = $plug->$func($putData);
          } else {
            //vps 或 其他通用插件类购买
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }
            $res = $plug->$func($putData);
          }
        } else {
          //租用物理服务器
          $server = new GeeServer();
          $selfPro = object_toArray($selfPro);
          foreach ($selfPro as $k => $v) {
            if ($v['pro_type'] == 'server') {
              if ($dinfo['order_type'] == 'renew') {
                $sinfo = $server->where('id', (int) $v['id'])->find();
                $dt = date('Y-m-d H:i:s', $sinfo['end_time']);
                $updata = [
                  'server_added' => $v['added'],
                  'end_time' => strtotime(date("Y-m-d H:i:s", strtotime($dt . "+" . (int) $v['years'] . " month"))),
                ];
                if ($sinfo['status'] == 1) {
                  $updata['status'] = 3;
                }
                $server->where('id = ' . $v['id'])->update($updata);
              } else {
                $sinfo = [
                  'pro_group_id' => $v['group_id'],
                  'pro_id' => $v['pro_id'],
                  'server_added' => $v['added'],
                  'name' => $v['hostname'],
                  'user_id' => $v['user_id'],
                  'remake' => $v['remake'],
                  'username' => $v['username'],
                  'password' => $v['password'],
                  'osgroup' => (int) $v['osgroup'],
                  'ostype' => (int) $v['ostype'],
                  'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . (int) $v['years'] . " month"))),
                  'status' => '0',
                ];
                $server->save($sinfo);
                // //发起短信请求
                // $res = parseMsgPublic([
                //   'mark' => 'serverRegister',
                //   'to' => session('_userInfo')['phone'],
                //   'params' => [
                //     $v['hostname'],
                //   ],
                // ]);
              }
            }
          }
        }
      }
      // $b->where('order_number = ' . $post['out_trade_no'])->update(['status' => 2]);
      $o->where('number = ' . $post['out_trade_no'])->update(['status' => 1]);
      $b->where('order_number = ' . $post['out_trade_no'])->update(['status' => 1]);
      echo "SUCCESS";
      $this->redirect('console/Billing/order');
    } else {
      // $deal->where('num = ' . $post['out_trade_no'])->update(['status' => 3]);
      $o->where('number = ' . $post['out_trade_no'])->update(['status' => 2]);
      $b->where('order_number = ' . $post['out_trade_no'])->update(['status' => 0]);
      $this->redirect('console/Billing/order');
      // echo "SUCCESS";
    }
    //写在文本里看一下参数
    $data = json_encode($post);
    file_put_contents("alipaytext.txt", $data);
    // $this->redirect('console/Index/index');
  }
  /**
   * 支付宝异步接口
   */
  public function notify_url()
  {
    // $deal = new GeeDeal();
    $u = new GeeUser();
    $o = new GeeOrder();
    $b = new GeeBilling();
    $pc = new GeeProConfig();

    $post = input();
    // $post = $request->param();
    //写在文本里看一下参数
    $data = json_encode($post);
    file_put_contents("alipaytext.txt", $data);

    vendor('alipay.AlipayTradeService');
    $alipaySevice = new \AlipayTradeService(Config('alipay'));
    $alipaySevice->writeLog(var_export($post, true));
    $result = $alipaySevice->check($post);

    // $deal->where('num = ' . $post['out_trade_no'])->update(['dealnum' => $post['trade_no']]);
    if ($post['trade_status'] == "TRADE_SUCCESS") {
      //操作数据库 修改状态
      $dinfo = $b->where('order_number = ' . $post['out_trade_no'])->find();
      $uinfo = $u->where('id = ' . $dinfo['user_id'])->find();
      $selfPro = json_decode($dinfo['pro_list'], false);
      if ($dinfo['order_type'] == '0') {
        $uinfo = $u->where('id = ' . $dinfo['user_id'])->find();
        $u->where('id = ' . $dinfo['user_id'])->update(['balance' => ((float) $uinfo['balance'] + (float) $dinfo['money'])]);
      } else {
        $pcs = $pc->where('order_number = "' . $post['out_trade_no'] . '"')->find();
        $configs = $pcs ? json_decode($pcs['config'], true) : '';
        if ($pcs && $configs && $configs['_create_putData']) {
          if ($configs['_create_putData']['class'] == 'domain') {
            $d = new GeeDomain();
            $dc = new GeeDomainContact();
            $dp = new GeeDomainPrice();
            $pro = new GeeProduct();
            $addons = new GeeAddons();
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            // dump($configs['_create_putData']);
            foreach ($configs['_create_putData']['data'] as $k => $v) {
              // dump($v);
              $suffix = '.' . explode(".", $v['domainname'])[1];
              $dpinfo = $dp->where('domain = "' . $suffix . '"')->find();
              $proinfo = $pro->where('id = ' . $dpinfo['pro_id'])->find();
              $adninfo = $addons->where('id = ' . $proinfo['plug'])->find();
              if ($configs['_create_putData']['action'] != 'domainRenew') {
                $dcinfo = $dc->where('id = ' . $v['userid'])->find();
                $userid = json_decode($dcinfo['contact_id'], true)[$proinfo['name']]['value'];
              }
              // dump(json_decode($dcinfo['contact_id'],true));
              if ($configs['_create_putData']['action'] == 'domainRenew') {
                $putData = [
                  'way' => $adninfo['name'],
                  'pro_id' => $dpinfo['pro_id'],
                  'function' => 'control',
                  'action' => $configs['_create_putData']['action'],
                  'data' => [
                    "domainname" => $v['domainname'],
                    "years" => $v['years'],
                    "exptme" => $v['exptme'],
                  ],
                ];
              } else {
                $putData = [
                  'way' => $adninfo['name'],
                  'pro_id' => $dpinfo['pro_id'],
                  'function' => 'control',
                  'action' => 'createDom',
                  'data' => [
                    'userid' => $userid,
                    'domainname' => $v['domainname'],
                    'years' => $v['years'],
                    'domainpass' => $v['domainpass'],
                    'dns1' => $v['dns1'],
                    'dns2' => $v['dns2'],
                  ],
                ];
              }
              // dump($v);
              // dump($putData);

              $res = $plug->$func($putData);
              $res = json_decode($res, true);
              if ($res['status'] == 'failed') {
                $ret['status'] = 400;
                $ret['msg'] = '请求超时！请联系管理员处理！错误码:' . explode(' ', $res['data'])[0];
                $isfailed = true;
                break;
              } else {
                if ($configs['_create_putData']['action'] == 'domainRenew') {
                  $save = [
                    'user_id' => $dinfo['user_id'],
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->where('domainname = "' . $v['domainname'] . '"')->update($save);
                } else {
                  $save = [
                    'user_id' => $dinfo['user_id'],
                    'userid' => $userid,
                    'domainname' => $v['domainname'],
                    'years' => $v['years'],
                    'domainpass' => $v['domainpass'],
                    'isname' => 0,
                    'dns' => json_encode(['dns1' => $v['dns1'], 'dns2' => $v['dns2']]),
                    'status' => 0,
                    'r_status' => 0,
                    'newstas' => 0,
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->save($save);
                  //发起短信请求
                  parseMsgPublic([
                    'mark' => 'domainRegister',
                    'to' => session('_userInfo')['phone'],
                    'params' => [
                      $v['domainname'],
                      'basic_name',
                    ],
                  ]);
                }
              }
            }
            // return;

            // dump($ret);
            if ($isfailed) {
              // dump($uinfo['balance']);
              // dump($info['money']);
              $userup = db('user')->where('id = ' . session('_userInfo')['id'])->update([
                'balance' => ((float) session('_userInfo')['balance'] - (float) $dinfo['money']) + (float) $dinfo['money'],
              ]);
              return json_encode($ret);
            }
          } else if ($configs['_create_putData']['class'] == 'vps') {
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }
            // dump($configs);
            // dump($configs['_create_putData']);
            // dump($putData);
            // return ;
            $res = $plug->$func($putData);
            // dump($res);
            // exit;
            if (json_decode($res, true)['status'] != 200) {
              $ret['status'] = json_decode($res, true)['status'];
              $ret['msg'] = json_decode($res, true)['msg'];
              return json_encode($ret);
            }
          } else if ($configs['_create_putData']['class'] == 'host') {

            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }

            $res = $plug->$func($putData);
          } else {
            //vps 或 其他通用插件类购买
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }
            $res = $plug->$func($putData);
          }
        } else {
          //租用物理服务器
          $server = new GeeServer();
          $selfPro = object_toArray($selfPro);
          foreach ($selfPro as $k => $v) {
            if ($v['pro_type'] == 'server') {
              if ($dinfo['order_type'] == 'renew') {
                $sinfo = $server->where('id', (int) $v['id'])->find();
                $dt = date('Y-m-d H:i:s', $sinfo['end_time']);
                $updata = [
                  'server_added' => $v['added'],
                  'end_time' => strtotime(date("Y-m-d H:i:s", strtotime($dt . "+" . (int) $v['years'] . " month"))),
                ];
                if ($sinfo['status'] == 1) {
                  $updata['status'] = 3;
                }
                $server->where('id = ' . $v['id'])->update($updata);
              } else {
                $sinfo = [
                  'pro_group_id' => $v['group_id'],
                  'pro_id' => $v['pro_id'],
                  'server_added' => $v['added'],
                  'name' => $v['hostname'],
                  'user_id' => $v['user_id'],
                  'remake' => $v['remake'],
                  'username' => $v['username'],
                  'password' => $v['password'],
                  'osgroup' => (int) $v['osgroup'],
                  'ostype' => (int) $v['ostype'],
                  'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . (int) $v['years'] . " month"))),
                  'status' => '0',
                ];
                $server->save($sinfo);
                // //发起短信请求
                // $res = parseMsgPublic([
                //   'mark' => 'serverRegister',
                //   'to' => session('_userInfo')['phone'],
                //   'params' => [
                //     $v['hostname'],
                //   ],
                // ]);
              }
            }
          }
        }
      }
      // $b->where('order_number = ' . $post['out_trade_no'])->update(['status' => 2]);
      $o->where('number = ' . $post['out_trade_no'])->update(['status' => 1]);
      $b->where('order_number = ' . $post['out_trade_no'])->update(['status' => 1]);
      echo "SUCCESS";
    } else {
      // $deal->where('num = ' . $post['out_trade_no'])->update(['status' => 3]);
      $o->where('number = ' . $post['out_trade_no'])->update(['status' => 2]);
      $b->where('order_number = ' . $post['out_trade_no'])->update(['status' => 0]);
      $this->redirect('console/Billing/order');
      // echo "SUCCESS";
    }
    //写在文本里看一下参数
    $data = json_encode($post);
    file_put_contents("alipaytext.txt", $data);
  }
  /**
   * 微信登录异步接口
   */
  public function wxlogin(){
    $u = new GeeUser();
    $appid = config('wxpay.appid'); //公众号唯一标识
    $secret = config('wxpay.appsecret'); //应用秘钥
    //$code是回调的时候地址上带的 只需要get方式接收就可以了
    $code = $_GET["code"]; 
    //获取传过来的值
    $uid = $_GET["uid"];
    //第一步:取得openid
    $oauth2Url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=$appid&secret=$secret&code=$code&grant_type=authorization_code";
    $oauth2 = $this->getJson($oauth2Url);
    //第二步:根据全局access_token和openid查询用户信息 
    $access_token = $oauth2["access_token"]; 
    $openid = $oauth2['openid']; 
    $get_user_info_url = "https://api.weixin.qq.com/sns/userinfo?access_token=$access_token&openid=$openid&lang=zh_CN";
    $userinfo = $this->getJson($get_user_info_url);
    
    
    //写入数据库微信用户
    // M()->startTrans();//开启事务
    // $n = M("zp_user"); //写入的表
    $openid = $data['openid'] = $userinfo['openid']; //微信用户openid
    $data['sex'] = $userinfo['sex']; //性别 
    $data['headimgurl'] = $userinfo['headimgurl']; //头像
    $data['province'] = $userinfo['province']; //地区sheng
    $data['city'] = $userinfo['city']; //地区shi
    $data['subscribe_time'] = time(); //时间
    $data['qr_scene'] = $uid; //传过的值
    $data['nickname'] = $userinfo['nickname']; //昵称
    // file_put_contents("wxlogin.txt", json_encode($userinfo));
    // file_put_contents("wxloginuinfo.txt", json_encode($_GET));
    $saveRes = $u->where('id = '.$uid)->update(['openid'=>$userinfo['openid']]);
    
    if($saveRes){
        echo '<script>alert("绑定成功");window.opener=null;window.close();</script>';
    } else {
        echo '<script>alert("绑定失败");window.opener=null;window.close();</script>';
    }
    // $z = $n->lock(true)->add($data);
    // if(!$z)
    // {
    // M()->rollback();//回滚
    // $this->error('添加错误!');
    // }else{
    // M()->commit();//事务提交
    // }
  }
  /**
   * 微信支付同步回调
   */
  public function wx_return_url()
  {
  }

  /**
   * 微信支付异步回调
   */
  public function wx_notify_url()
  {

    $u = new GeeUser();
    $o = new GeeOrder();
    $b = new GeeBilling();
    $pc = new GeeProConfig();

    // $post = input();
    // // $post = $request->param();
    // //写在文本里看一下参数
    // $data = json_encode($post);
    // file_put_contents("weixintext.txt", $data);

    //$xml = $GLOBALS['HTTP_RAW_POST_DATA']; //返回的xml
    $xml = file_get_contents("php://input");
    //$results = db('fund') -> where('id',1) -> update(['a'=>$xml]);exit();
    $xmlArr = $this->Init($xml);
    file_put_contents(dirname(__FILE__) . '/xml.txt', $xml); //记录日志 支付成功后查看xml.txt文件是否有内容 如果有xml格式文件说明回调成功

    $out_trade_no = $xmlArr['out_trade_no']; //订单号
    $total_fee = $xmlArr['total_fee'] / 100; //回调回来的xml文件中金额是以分为单位的
    $result_code = $xmlArr['result_code']; //状态
    //$result = db('order') -> where(['order' => $out_trade_no]) -> find();
    //if($result['price'] == $total_fee){
    if ($result_code == 'SUCCESS') { 
      //数据库操作
      //处理数据库操作 例如修改订单状态 给账户充值等等 

      //操作数据库 修改状态
      $dinfo = $b->where('order_number = ' . $out_trade_no)->find();
      $uinfo = $u->where('id = ' . $dinfo['user_id'])->find();
      $selfPro = json_decode($dinfo['pro_list'], false);
      if ($dinfo['order_type'] == '0') {
        $uinfo = $u->where('id = ' . $dinfo['user_id'])->find();
        $u->where('id = ' . $dinfo['user_id'])->update(['balance' => ((float) $uinfo['balance'] + (float) $dinfo['money'])]);
      } else {
        $pcs = $pc->where('order_number = "' . $out_trade_no . '"')->find();
        $configs = $pcs ? json_decode($pcs['config'], true) : '';
        if ($pcs && $configs && $configs['_create_putData']) {
          if ($configs['_create_putData']['class'] == 'domain') {
            $d = new GeeDomain();
            $dc = new GeeDomainContact();
            $dp = new GeeDomainPrice();
            $pro = new GeeProduct();
            $addons = new GeeAddons();
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            // dump($configs['_create_putData']);
            foreach ($configs['_create_putData']['data'] as $k => $v) {
              // dump($v);
              $suffix = '.' . explode(".", $v['domainname'])[1];
              $dpinfo = $dp->where('domain = "' . $suffix . '"')->find();
              $proinfo = $pro->where('id = ' . $dpinfo['pro_id'])->find();
              $adninfo = $addons->where('id = ' . $proinfo['plug'])->find();
              if ($configs['_create_putData']['action'] != 'domainRenew') {
                $dcinfo = $dc->where('id = ' . $v['userid'])->find();
                $userid = json_decode($dcinfo['contact_id'], true)[$proinfo['name']]['value'];
              }
              // dump(json_decode($dcinfo['contact_id'],true));
              if ($configs['_create_putData']['action'] == 'domainRenew') {
                $putData = [
                  'way' => $adninfo['name'],
                  'pro_id' => $dpinfo['pro_id'],
                  'function' => 'control',
                  'action' => $configs['_create_putData']['action'],
                  'data' => [
                    "domainname" => $v['domainname'],
                    "years" => $v['years'],
                    "exptme" => $v['exptme'],
                  ],
                ];
              } else {
                $putData = [
                  'way' => $adninfo['name'],
                  'pro_id' => $dpinfo['pro_id'],
                  'function' => 'control',
                  'action' => 'createDom',
                  'data' => [
                    'userid' => $userid,
                    'domainname' => $v['domainname'],
                    'years' => $v['years'],
                    'domainpass' => $v['domainpass'],
                    'dns1' => $v['dns1'],
                    'dns2' => $v['dns2'],
                  ],
                ];
              }
              // dump($v);
              // dump($putData);

              $res = $plug->$func($putData);
              $res = json_decode($res, true);
              if ($res['status'] == 'failed') {
                $ret['status'] = 400;
                $ret['msg'] = '请求超时！请联系管理员处理！错误码:' . explode(' ', $res['data'])[0];
                $isfailed = true;
                break;
              } else {
                if ($configs['_create_putData']['action'] == 'domainRenew') {
                  $save = [
                    'user_id' => $dinfo['user_id'],
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->where('domainname = "' . $v['domainname'] . '"')->update($save);
                } else {
                  $save = [
                    'user_id' => $dinfo['user_id'],
                    'userid' => $userid,
                    'domainname' => $v['domainname'],
                    'years' => $v['years'],
                    'domainpass' => $v['domainpass'],
                    'isname' => 0,
                    'dns' => json_encode(['dns1' => $v['dns1'], 'dns2' => $v['dns2']]),
                    'status' => 0,
                    'r_status' => 0,
                    'newstas' => 0,
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->save($save);
                  //发起短信请求
                  parseMsgPublic([
                    'mark' => 'domainRegister',
                    'to' => session('_userInfo')['phone'],
                    'params' => [
                      $v['domainname'],
                      'basic_name',
                    ],
                  ]);
                }
              }
            }
            // return;

            // dump($ret);
            if ($isfailed) {
              // dump($uinfo['balance']);
              // dump($info['money']);
              $userup = db('user')->where('id = ' . session('_userInfo')['id'])->update([
                'balance' => ((float) session('_userInfo')['balance'] - (float) $dinfo['money']) + (float) $dinfo['money'],
              ]);
              return json_encode($ret);
            }
          } else if ($configs['_create_putData']['class'] == 'vps') {
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }
            // dump($configs);
            // dump($configs['_create_putData']);
            // dump($putData);
            // return ;
            $res = $plug->$func($putData);
            // dump($res);
            // exit;
            if (json_decode($res, true)['status'] != 200) {
              $ret['status'] = json_decode($res, true)['status'];
              $ret['msg'] = json_decode($res, true)['msg'];
              return json_encode($ret);
            }
          } else if ($configs['_create_putData']['class'] == 'host') {

            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }

            $res = $plug->$func($putData);
          } else {
            //vps 或 其他通用插件类购买
            $plug = new $configs['_create_putData']['plug']();
            $func = $configs['_create_putData']['class'];
            $putData = $configs['_create_putData']['data'];
            if (!$putData['function']) {
              $putData['function'] = $configs['_create_putData']['function'];
            }
            $res = $plug->$func($putData);
          }
        } else {
          //租用物理服务器
          $server = new GeeServer();
          $selfPro = object_toArray($selfPro);
          foreach ($selfPro as $k => $v) {
            if ($v['pro_type'] == 'server') {
              if ($dinfo['order_type'] == 'renew') {
                $sinfo = $server->where('id', (int) $v['id'])->find();
                $dt = date('Y-m-d H:i:s', $sinfo['end_time']);
                $updata = [
                  'server_added' => $v['added'],
                  'end_time' => strtotime(date("Y-m-d H:i:s", strtotime($dt . "+" . (int) $v['years'] . " month"))),
                ];
                if ($sinfo['status'] == 1) {
                  $updata['status'] = 3;
                }
                $server->where('id = ' . $v['id'])->update($updata);
              } else {
                $sinfo = [
                  'pro_group_id' => $v['group_id'],
                  'pro_id' => $v['pro_id'],
                  'server_added' => $v['added'],
                  'name' => $v['hostname'],
                  'user_id' => $v['user_id'],
                  'remake' => $v['remake'],
                  'username' => $v['username'],
                  'password' => $v['password'],
                  'osgroup' => (int) $v['osgroup'],
                  'ostype' => (int) $v['ostype'],
                  'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . (int) $v['years'] . " month"))),
                  'status' => '0',
                ];
                $server->save($sinfo);
                // //发起短信请求
                // $res = parseMsgPublic([
                //   'mark' => 'serverRegister',
                //   'to' => session('_userInfo')['phone'],
                //   'params' => [
                //     $v['hostname'],
                //   ],
                // ]);
              }
            }
          }
        }
      }
      // $b->where('order_number = ' . $out_trade_no)->update(['status' => 2]);
      $o->where('number = ' . $out_trade_no)->update(['status' => 1]);
      $b->where('order_number = ' . $out_trade_no)->update(['status' => 1]);

      return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
      echo 'SUCCESS'; //返回成功给微信端 一定要带上不然微信会一直回调8次
      exit;
    } else { //失败
      // $deal->where('num = ' . $out_trade_no)->update(['status' => 3]);
      $o->where('number = ' . $out_trade_no)->update(['status' => 2]);
      $b->where('order_number = ' . $out_trade_no)->update(['status' => 0]);
      $this->redirect('console/Billing/order');
      return false;
      exit;
    }
  }
  public function Init($xml)
  {
    $array_data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
    return $array_data;
  }
  //微信签名算法
  private function WxSign($param)
  {
    $signkey = 'xxx'; //秘钥
    $sign = '';
    foreach ($param as $key => $val) {
      $sign .= $key . '=' . $val . '&';
    }
    $sign .= 'key=' . $signkey;
    $sign = strtoupper(MD5($sign));
    return $sign;
  }
  function getJson($url){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); 
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE); 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $output = curl_exec($ch);
    curl_close($ch);
    return json_decode($output, true);
   }
}
