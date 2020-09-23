<?php

namespace app\index\controller;

use app\index\controller\Common; //
use app\index\model\GeeBilling; //
use app\index\model\GeeDomain;
use app\index\model\GeeProConfig; //
use app\index\model\GeeServer; //
use app\index\model\GeeServerAdded; //
use app\index\model\GeeServerAddedItems; //
use app\index\model\GeeUserEnterprise; //
use app\manager\model\GeeAddons; //
use app\manager\model\GeeDomainContact; //
use app\manager\model\GeeDomainPrice; //
use app\manager\model\GeeLog; //
use app\manager\model\GeeProduct; //
use app\manager\model\GeeProductClass; //
use app\manager\model\GeeProductGroup; //
use app\manager\model\GeeRebatesLog; //
use app\manager\model\GeeUser; //
use app\manager\model\GeeCoupon; //
use app\manager\model\GeeUsergroup; //
use think\Controller;

class Buy extends Common
{
  /**
   * 确认订单
   */
  public function confirm()
  {
    if (!$_SESSION['_pro_info']) {
      echo '<script>window.history.go(-1);</script>';
      exit;
    }
    $c = new GeeCoupon();
    $info = $_SESSION['_pro_info'];
    $order = $_SESSION['_pro_order'];
    // dump($info);
    // dump($order);
    // dump($_SESSION);
    $class = [];
    $money = 0;
    foreach ($_SESSION['_pro_info'] as $k => $v) {
      $class[$k] = $v['class'];
      $str = $v['price'];
      //中文标点
      $char = ",。、！？：；﹑•＂…‘’“”〝〞∕¦‖—　〈〉﹞﹝「」‹›〖〗】【»«』『〕〔》《﹐﹕︰﹔！¡？¿﹖﹌﹏﹋＇´ˊˋ―﹫︳︴¯＿￣﹢﹦﹤‐­˜﹟﹩﹠﹪﹡﹨﹍﹉﹎﹊ˇ︵︶︷︸︹︿﹀︺︽︾ˉ﹁﹂﹃﹄︻︼（）";

      $pattern = array(
        '/[' . $char . ']/u', //中文标点符号
        '/[ ]{2,}/',
      );
      $price = preg_replace($pattern, '', $str);
      $money += (float) str_replace(",", "", $price);
    }
    $class = array_unique($class);
    if (count($class) <= 1) {
      $this->assign('proname', $class[0]);
    } else {
      $this->assign('proname', '组合型产品');
    }
    //获取可用代金券
    $types = [];
    $like['range'] = array('or');
    $tprice = 0;
    foreach ($info as $k => $v) {
      $types[] = $v['pro_type'];
      $tprice += $v['price'];
      array_unshift($like['range'], array('like', '%' . $v['pro_type'] . '%'));
    }
    array_unshift($like['range'], array('like', '%0%'));

    //对应代金券可用范围
    // dump($types);
    // dump($like);
    $cw = [
      'user_id' => session('_userInfo')['id'],
      'status' => 0,
      'minvalue' => ['<=', $tprice],
      'end_time' => ['>', time()]
    ];

    $clists = $c->where($cw)->where($like)->select();
    $clists = list_toArray($clists);
    $clist = [];
    //筛选未使用到上限的代金券
    foreach ($clists as &$v) {
      if ($v['use_number'] < $v['reuse']) {
        $clist[] = $v;
      }
    }

    $this->assign('info', $info);
    $this->assign('order', $order);
    $this->assign('money', number_format(str_replace(",", "", $money), 2));
    $this->assign('clist', $clist);
    // dump($clist);
    // dump($_SESSION);
    // dump($info);
    // dump($tprice);
    // dump($order);

    unset($_SESSION['_pro_info']);
    unset($_SESSION['_pro_order']);
    return $this->fetch('Buy/confirm');
  }
  /**
   * 计算代金券折扣价格
   */
  public function countCoupon($d)
  {
    $u = new GeeUser();
    $c = new GeeCoupon();
    $b = new GeeBilling();
    $d = $_POST ? $_POST : $d;

    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];

    if (!$d['cid']) {
      $ret['status'] = 401;
      $ret['msg'] = '请选择代金券!';
      return json_encode($ret);
    }
    if (!$d['oid']) {
      $ret['status'] = 400;
      $ret['msg'] = '非法操作!';
      return json_encode($ret);
    }
    $cinfo = $c->where('id = ' . $d['cid'] . ' and user_id = ' . session('_userInfo')['id'])->find();
    $oinfo = $b->where('`order_number` = "' . $d['oid'] . '"')->find();
    if (!$cinfo || !$oinfo) {
      $ret['status'] = 400;
      $ret['msg'] = '非法操作!';
      return json_encode($ret);
    }
    if ($cinfo['end_time'] < time()) {
      $ret['status'] = 402;
      $ret['msg'] = '代金券过期!';
      return json_encode($ret);
    }
    if ($cinfo['use_number'] >= $cinfo['reuse']) {
      $ret['status'] = 403;
      $ret['msg'] = '代金券可用次数上限!';
      return json_encode($ret);
    }
    $proconfig = json_decode($oinfo['pro_list'], true);
    // dump($proconfig);

    $class = [];
    $money = 0;
    foreach ($proconfig as $k => $v) {
      $class[$k] = $v['class'];
      $str = $v['price'];
      //中文标点
      $char = ",。、！？：；﹑•＂…‘’“”〝〞∕¦‖—　〈〉﹞﹝「」‹›〖〗】【»«』『〕〔》《﹐﹕︰﹔！¡？¿﹖﹌﹏﹋＇´ˊˋ―﹫︳︴¯＿￣﹢﹦﹤‐­˜﹟﹩﹠﹪﹡﹨﹍﹉﹎﹊ˇ︵︶︷︸︹︿﹀︺︽︾ˉ﹁﹂﹃﹄︻︼（）";

      $pattern = array(
        '/[' . $char . ']/u', //中文标点符号
        '/[ ]{2,}/',
      );
      $price = preg_replace($pattern, '', $str);

      $remission = 0.00;
      $resPrice = 0.00;
      if (strpos($cinfo['range'], '0') !== false || !!strpos($cinfo['range'], $v['pro_type'] !== false)) {
        if ($cinfo['type'] == 1) {
          $remission = $cinfo['value'];
          $resPrice = $price - $remission > 0 ? $price - $remission : 0.01;
        } else {
          $resPrice = $price  * $cinfo['value'] / 100;
          $remission = $price - $resPrice;
        }
      }

      $money += (float) str_replace(",", "", $price);
    }
    // dump($money);
    $ret['data'] = [];
    $ret['data']['remission'] = $remission;
    $ret['data']['resPrice'] = $resPrice;
    $ret['data']['totalPrice'] = $money;
    // dump($ret);
    return $ret;
  }
  /**
   * 线上支付
   */
  public function onlinepay()
  {
    $billing = new GeeBilling();
    $u = new GeeUser();
    $ug = new GeeUsergroup();
    $c = new GeeCoupon();

    $order_id = $_GET['order'];
    $info = $billing->where('`order_number` = "' . $order_id . '"' . ' and user_id = ' . session('_userInfo')['id'])->find();
    if (!$info) {
      echo '<script>alert("非法操作!");window.location.href="/console/billing/order";</script>';
      exit;
    }
    //订单存在代金券
    $coupon_id = $info['coupon_id'] ? $info['coupon_id'] : $_GET['couponid'];

    if ($coupon_id) {
      $cinfo = $c->where('id = ' . $coupon_id . ' and user_id = ' . session('_userInfo')['id'])->find();
      if (!$cinfo) {
        echo '<script>alert("非法操作!");window.location.href="/console/billing/order";</script>';
        exit;
      }
      $billing->where('`order_number` = "' . $order_id . '"')->update([
        'coupon_id' => $coupon_id
      ]);
      $cupdate = [
        'use_number' => $cinfo['use_number'] + 1,
      ];
      if ($cinfo['use_number'] >= $cinfo['reuse']) {
        $cupdate['status'] = 2;
      } else {
        $cupdate['status'] = 1;
      }
      $c->where('id = ' . $coupon_id . ' and user_id = ' . session('_userInfo')['id'])->update($cupdate);
      $data = [
        'cid' => $coupon_id,
        'oid' => $order_id
      ];
      // dump($data);
      $priceinfo = $this->countCoupon($data);
      if ($priceinfo['status'] == 200) {
        $prices = $priceinfo['data'];
      }
      if ($prices['totalPrice'] == $info['money']) {
        $billing->where('`order_number` = "' . $order_id . '"')->update([
          'money' => $prices['resPrice'],
        ]);
        $info['money'] = $prices['resPrice'];
      }
      // dump($prices);
      $prolist = json_decode($info['pro_list']);
    }

    if ($info['status'] != '0' && ($info['order_status'] != '0' && $info['order_status'] != '2')) {
      return $this->redirect('index/Billing/order');
    }

    $uinfo = $u->where('id = ' . session('_userInfo')['id'])->find();
    $uginfo = $ug->where('id = ' . $uinfo['group_id'])->find();
    //当前用户是否为代理商
    if ($uginfo['is_agent']) {
      $aid = $uginfo['id'];
    }
    $money = (float) $info['money'];
    $balance = (float) $uinfo['balance'];
    $rebates_money = (float) $uinfo['rebates_money'];
    $totalBlance = $balance + $rebates_money;
    $cashPay = $money > $totalBlance ? 0 : ($money - $rebates_money < 0 ? 0 : $money - $rebates_money);

    //用户代理商信息
    if ($uinfo['manager_id']) {
      $ue = new GeeUserEnterprise();
      $agentinfo = $u->where('id = ' . $uinfo['manager_id'])->find();
      $agentinfo['ename'] = $ue->where('user_id = ' . $agentinfo['id'])->find()['name'];
    }
    // dump($agentinfo);

    $this->assign('prolist', $prolist); //当前产品信息
    $this->assign('money', $money); //当前订单金额
    $this->assign('userinfo', $uinfo); //当前用户信息
    $this->assign('uginfo', $uginfo); //当前用户组信息
    $this->assign('totalBlance', $totalBlance); //总余额
    $this->assign('cashPay', $cashPay); //余额需支付金额
    $this->assign('agent', $agentinfo); //代理商信息

    // dump($_SESSION);
    return $this->fetch('Buy/onlinepay');
  }
  /**
   * 付款接口
   */
  public function pay()
  {
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];
    $data = $_POST;
    // dump($data);
    // exit;
    $billing = new GeeBilling();
    $info = $billing->where('`order_number` = "' . $data['order'] . '"')->find();
    $up_w['id'] = $info['id'];
    if ($info['manager_id']) {
      $user = db('user')->where('id = ' . $info['manager_id'])->find();
    } else {
      $user = db('user')->where('id = ' . $info['user_id'])->find();
    }

    if ($info['status'] != '0' && ($info['order_status'] != '0' && $info['order_status'] != '2')) {
      $ret['status'] = 400;
      $ret['msg'] = '该订单状态已更变';
      return json_encode($ret);
    }
    if ((int) $data['type'] == 1) {
      //第三方支付
      if ($data['catype'] == '2') {
        //支付宝支付
        $billing_save_data['cash'] = '1';
        $prolist = json_decode($info['pro_list']);
        if ($prolist != '0' && $prolist) {
          $name = "";
          foreach ($prolist as $k => $v) {
            $v = object_toArray($v);
            if ($k != 0) {
              $name .= ',' . $v['class'];
            } else {
              $name .= $v['class'];
            }
          }
        }
        /**
         * 支付必要传参
         */
        $paypost['trade_no'] = $data['order'];
        $paypost['total_amount'] = (float) $info['money'];
        $paypost['subject'] = $info['pro_list'] == '0' ? '账户充值' : '产品购买';
        $paypost['body'] = $info['pro_list'] == '0' ? '账户充值 - 金额为:' . to_double($info['money']) : '产品购买 - 购买产品:' . $name;
        $html = alipay($paypost, 'http://' . $_SERVER['HTTP_HOST'] . '/api/notify_url', 'http://' . $_SERVER['HTTP_HOST'] . '/api/return_url', 1);
      } elseif ($data['catype'] == '3') {
        //微信支付
        $url = 'http://' . $_SERVER['HTTP_HOST'] . '/buy/wxpay?order='.$data['order'];
        $html = file_get_contents($url);
        // dump($_SERVER['HTTP_HOST']);
        // echo $html;
      }
    } elseif ((int) $data['type'] == 2) {
      //代理商支付
      $billing_save_data = [
        'manager_id' => $user['manager_id'],
      ];
      $info_up = $billing->save($billing_save_data, $up_w);
      if (!$info_up) {
        $ret['status'] = 400;
        $ret['msg'] = '请求超时！';
        return json_encode($ret);
      }
      $ret['data'] = url('index/billing/order');
      return json_encode($ret);
    } else {
      if ($data['use_rebates']) {
        //使用返点支付
        $oMoney = (float) $info['money'];
        $balance = (float) $user['balance'];
        $rebates = (float) $user['rebates_money'];

        if (($balance + $rebates) < $oMoney) {
          $ret['status'] = 400;
          $ret['msg'] = '余额不足';
          return json_encode($ret);
        }
        /**
         * 返点支付时优先减去使用返点
         * 扣款流程:
         * 订单金额大于使用返点时 优先减去返点 再减去余额
         * 运算逻辑:
         * [订单金额小于使用返点时只扣除返点]
         * 返点 = 返点金额 - 订单金额
         * 余额 = 当前余额
         * [订单金额大于使用返点时]
         * 返点 = 0
         * 余额 = 当前余额 - (订单金额 - 使用返点)
         */
        $nowRebates = $rebates - $oMoney > 0 ? $rebates - $oMoney : 0;
        $userup = db('user')->where('id = ' . session('_userInfo')['id'])->update([
          'rebates_money' => $nowRebates,
          'balance' => $nowRebates <= 0 ? $balance - ($oMoney - $rebates) : $balance,
        ]);
      } else {
        //余额支付
        if ((float) $user['balance'] < (float) $info['money']) {
          $ret['status'] = 400;
          $ret['msg'] = '余额不足';
          return json_encode($ret);
        }
        $userup = db('user')->where('id = ' . session('_userInfo')['id'])->update(['balance' => (float) $user['balance'] - (float) $info['money']]);
      }
      // dump($user);
      // dump($info);
      // return;
      if (!$userup) {
        $ret['status'] = 400;
        $ret['msg'] = '余额扣款失败！';
        return json_encode($ret);
      }
      $pc = new GeeProConfig();
      //执行所属产品操作
      if ($info['pro_list'] != '0' && $info['pro_list']) {
        $pcs = $pc->where('order_number = "' . $data['order'] . '"')->find();
        $configs = json_decode($pcs['config'], true);
        $selfPro = json_decode($info['pro_list'], false);
        // dump($info);
        // dump($pcs);
        // dump($configs);
        // dump($selfPro);
        // dump($configs['_create_putData']);
        // return;
        if ($configs['_create_putData']) {
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
                    'user_id' => session('_userInfo')['id'],
                    'end_time' => strtotime(date("Y-m-d H:i:s", strtotime("+" . ((int) $v['years'] * 12) . " month"))),
                  ];
                  $d->where('domainname = "' . $v['domainname'] . '"')->update($save);
                } else {
                  $save = [
                    'user_id' => session('_userInfo')['id'],
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
              // dump(session('_userInfo')['balance']);
              // dump($info['money']);
              $userup = db('user')->where('id = ' . session('_userInfo')['id'])->update([
                'balance' => ((float) session('_userInfo')['balance'] - (float) $info['money']) + (float) $info['money'],
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
          } else {
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
            // $ret['status'] = 400;
            // $ret['msg'] = '请求超时！';
            // return json_encode($ret);
          }
        } else {
          //物理服务器操作
          $this->serverpay($selfPro, $info);
        }
      }
    }
    //计算产品产生返点金额
    $u = new GeeUser();
    $ug = new GeeUsergroup();
    $pro = new GeeProduct();
    $uinfo = $u->where('id = ' . session('_userInfo')['id'])->find();
    $uginfo = $ug->where('id = ' . $uinfo['group_id'])->find();
    $nowuinfo = $uinfo;
    $nowuginfo = $uginfo;
    //当前用户为代理商
    if ($uginfo['is_agent']) {
      $aid = $uginfo['id']; //代理等级id
    } else {
      //当前用户是否存在所属代理商
      if ($uinfo['manager_id']) {
        $uinfo = $u->where('id = ' . $uinfo['manager_id'])->find();
        $uginfo = $ug->where('id = ' . $uinfo['group_id'])->find();
        $aid = $uginfo['id'];
      }
    }
    //允许进行代理商返点增加
    if ($aid) {
      $rebates = 0;
      foreach (json_decode($info['pro_list'], true) as $k => $v) {
        // dump($v);
        $pinfo = $pro->where('id = ' . $v['pro_id'])->find();
        $aplist = json_decode($pinfo['agentprice'], true);
        //获取当前产品折扣比例
        if ($v['years'] >= 36) {
          //三年
          $ap = $aplist['triennium'][$aid];
        } elseif ($v['years'] >= 24) {
          //两年
          $ap = $aplist['biennium'][$aid];
        } elseif ($v['years'] >= 12) {
          //一年
          $ap = $aplist['years'][$aid];
        } elseif ($v['years'] >= 6) {
          //半年
          $ap = $aplist['semestrale'][$aid];
        } elseif ($v['years'] >= 3) {
          //季度
          $ap = $aplist['quarter'][$aid];
        } else {
          //每月
          $ap = $aplist['month'][$aid];
        }
        $ap = $ap / 100;
        $rebates += (float) $v['price'] - ((float) $v['price'] * $ap);
        $rl = new GeeRebatesLog();
        $rl->save([
          'ordernumber' => $data['order'],
          'user_id' => session('_userInfo')['id'],
          'pro_type' => $v['pro_type'],
          'rebates' => $rebates,
        ]);
      }

      /**
       * 当前用户不为代理商 为自己增加产生返点金额 为代理商增加返点金额
       * 当前用户为代理商 为自己增加返点金额
       */
      if (!$nowuginfo['is_agent']) {
        $u->where('id = ' . $nowuinfo['id'])->update([
          'make_rebates_money' => $nowuinfo['make_rebates_money'] + $rebates,
        ]);
        $u->where('id = ' . $uinfo['id'])->update([
          'rebates_money' => $uinfo['rebates_money'] + $rebates,
        ]);
      } else {
        $u->where('id = ' . $uinfo['id'])->update([
          'rebates_money' => $uinfo['rebates_money'] + $rebates,
        ]);
      }
      $billing_save_data['industry_manager_id'] = $uinfo['id'];
      $billing_save_data['create_rebates_money'] = $rebates;
    }

    // dump($html);
    // dump(json_encode($ret));
    // return ;
    $billing_save_data['channel_type'] = $data['type'];
    $billing_save_data['balance'] = (float) $user['balance'] - (float) $info['money'];
    if ((int) $data['type']) {
      $billing_save_data['status'] = '0';
    } else {
      $billing_save_data['status'] = '1';
    }
    $billing_save_data['order_status'] = '1';
    $billing_save_data['is_invoice'] = '1';
    $billing_save_data['use_rebates'] = $data['use_rebates'];
    $info_up = $billing->save($billing_save_data, $up_w);
    if (!$info_up) {
      $ret['status'] = 400;
      $ret['msg'] = '请求超时！';
      return json_encode($ret);
    }
    // dump($_SESSION);
    // dump($res);
    //支付宝支付
    if ($html) {
      echo $html;
      return;
    }
    return json_encode($ret);
  }
  public function paystatus()
  {
    return $this->fetch('Buy/paystatus');
  }
  /**
   * 微信支付静态页
   */
  public function wxpay()
  {
    header("Content-type:text/html;charset=utf-8");

    require VENDOR_PATH . '/wxpay/WxPay.Api.php'; //引入微信支付
    
    $billing = new GeeBilling();
    $info = $billing->where('`order_number` = "' . $_GET['order'] . '"')->find();
    // dump($info);
    $prolist = json_decode($info['pro_list']);
    if ($prolist != '0' && $prolist) {
      $name = "";
      foreach ($prolist as $k => $v) {
        $v = object_toArray($v);
        if ($k != 0) {
          $name .= ',' . $v['class'];
        } else {
          $name .= $v['class'];
        }
      }
    }
    $paypost['subject'] = $info['pro_list'] == '0' ? '账户充值' : '产品购买';
    $paypost['body'] = $info['pro_list'] == '0' ? '账户充值 - 金额为: ￥' . to_double($info['money']) : '产品购买 - 购买产品:' . $name;

    $input = new \WxPayUnifiedOrder(); //统一下单
    $config = new \WxPayConfig(); //配置参数
    //$paymoney = input('post.paymoney'); //支付金额
    $paymoney = $info['money']; //测试写死
    $out_trade_no = $_GET['order']; //商户订单号(自定义)
    $goods_name = $paypost['body']; //商品名称(自定义)
    $input->SetBody($paypost['subject']);
    $input->SetAttach($goods_name);
    $input->SetOut_trade_no($out_trade_no);
    $input->SetTotal_fee($paymoney * 100); //金额乘以100
    $input->SetTime_start(date("YmdHis"));
    $input->SetTime_expire(date("YmdHis", time() + 600));
    $input->SetGoods_tag($paypost['subject']);
    $input->SetNotify_url("http://".$_SERVER['HTTP_HOST']."/api/wx_notify_url"); //回调地址
    $input->SetTrade_type("NATIVE");
    $input->SetProduct_id($out_trade_no); //商品id
    $result = \WxPayApi::unifiedOrder($config, $input);
    // dump($input);
    // dump($out_trade_no);
    // dump($goods_name);
    // dump($paymoney);
    // dump($result);
    if ($result['result_code'] == 'SUCCESS' && $result['return_code'] == 'SUCCESS') {
      $url = $result["code_url"];
      $this->assign('url', $url);
      $this->assign('money', $paymoney);
      $this->assign('num', $_GET['order']);
    } else {
      $this->error('参数错误');
    }
    return $this->fetch('Buy/wxpay');
  }
  /**
   * 物理服务器支付成功操作函数
   */
  public function serverpay($selfPro, $info)
  {
    $server = new GeeServer();
    $selfPro = object_toArray($selfPro);
    foreach ($selfPro as $k => $v) {
      // dump($v['pro_type']);
      if ($v['pro_type'] == 'server') {
        // dump($info);
        if ($info['order_type'] == 'renew') {
          $sinfo = $server->where('id', (int) $v['id'])->find();
          // dump($v['id']);
          $dt = date('Y-m-d H:i:s', time());
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
          // dump($sinfo);
          // return;
          $server->save($sinfo);
          //发起短信请求
          $res = parseMsgPublic([
            'mark' => 'serverRegister',
            'to' => session('_userInfo')['phone'],
            'params' => [
              $v['hostname'],
            ],
          ]);
        }
      }
    }
  }
}
