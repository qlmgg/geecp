<?php

namespace addons\host\direct\controller;

use Exception;
use think\Controller;
use think\Db;
use addons\host\direct\controller\HTTPSocket;
use think\helper\Str;

class direct extends Controller
{
  /**
   * 主控端接口
   * @param $data  所传参数
   * @param $data['data']  访问接口时的其余附带参数
   * @return json
   */
  public function control($data = [])
  {
    $sock = new HTTPSocket();

    $ret = [
      'status' => 200,
      'msg' => '操作成功！',
      'data' => '',
    ];
    // dump($data);
    if (empty($data['action']) || !isset($data['action'])) {
      $ret['status'] = 422;
      $ret['msg'] = '请求接口异常！接口不存在。';
      return $ret;
    }
    $product = Db::name('product')->where('id = ' . $data['plug_id'])->find();
    //公共参数
    $config = json_decode($product['plug_config'], true);
    $token = $config['token'];
    $sdata['timeStamp'] = time();
    $sdata['randomStr'] = 'Ab1Anv';
    $sdata['token'] = $token; //token 自行配置的令牌，不清楚可看概述章节。
    $oldsdata = $sdata;
    sort($sdata, SORT_STRING);
    $str = implode($sdata);
    $signature = md5($str);
    $signature = strtoupper($signature); //最终得到加密后全大写的签名
    $_URI = 'http://' . $config['host'] . ':' . $config['port'] . '/';
    // dump($config);
    // dump($data);
    // exit;
    $sock->connect($config['host'], $config['port']);
    $sock->set_login($config['username'], $config['password']);
    // dump($data);
    switch ($data['action']) {
        //direct虚拟主机创建
      case 'activate':
        // CMD_API_ACCOUNT_USER
        // $url = $_URI . '/CMD_API_ACCOUNT_USER?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'POST';  qinqinwoYa
        $pass = strtolower($this->random_code_type(8, "alpha-number"));
        $createSub = [
          'action' => 'create',
          'add' => 'Submit',
          'username' => strtolower(Str::random(8)),
          'email' => session('_userInfo')['email'],
          'passwd' => $pass,
          'passwd2' => $pass,
          'domain' => $data['data']['domain'],
          'package' => $config['product_id'],
          'ip' => explode(',', $config['serverip'])[array_rand(explode(',', $config['serverip']), 1)],
          'notify' => 'yes'
        ];
        $sock->query('/CMD_API_ACCOUNT_USER', $createSub);
        break;
        //direct虚拟主机详情
      case 'getinfo':
        // $url = $_URI . '/api/virtual/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'GET';
        break;
        //direct虚拟主机续费
      case 'renew':
        $proinfo = Db::name('host_direct')->where('name = "' . $data['data']['hostname'] . '"')->find();
        // dump($proinfo);
        if ($proinfo['end_time'] < time()) {
          $renewSub = [
            'suspend' => 'Unsuspend',
            'select0' => $data['data']['hostname'],
          ];
          $sock->query('/CMD_API_SELECT_USERS', $renewSub);
        }
        break;
        // case 'stop':

        // break;
        //direct虚拟主机升级
      case 'update':
        // $url = $_URI . '/api/virtual/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'PUT';
        break;
        //direct虚拟主机软删除
      case 'delvirtual':
        // $url = $_URI . '/api/virtual/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'DELETE';
        break;
        //云主机软删除恢复
      case 'virtual_restore':
        // $url = $_URI . '/api/virtual_restore/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'GET';
        break;
        //云主机重装系统
      case 'virtual_reset_system':
        // $url = $_URI . '/api/virtual_reset_system/' . $data['virtualid'] . '/' . $data['tempid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'GET';
        break;
        //虚拟主机修改密码
      case 'changepw':
        $changeSub = [
          'username' => $data['data']['hostname'],
          'passwd' => $data['data']['password'],
          'passwd2' => $data['data']['password']
        ];
        $sock->query('/CMD_API_USER_PASSWD', $changeSub);
        break;
        //链接VNC
      case 'manager':
        $post = '<form id="sub" action="' . $_URI . 'CMD_LOGIN" method="post">
          <input type="hidden" name="token" value=""><input type="hidden" name="username" value="' . $data['data']['hostname'] . '"><input type="hidden" name="password" value="' . $data['data']['password'] . '"></form>';
        $post = $post . '<script>document.forms["sub"].submit()</script>';
        return $post;
        break;
        //云主机运行状态
      case 'virtual_run_status':
        // $url = $_URI . '/api/virtual_run_status/' . $data['virtualid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'GET';
        break;
        //虚拟主机停机锁定
      case 'pause':
        $proinfo = Db::name('host_direct')->where('name = "' . $data['data']['hostname'] . '"')->find();
        $pauseSub = [
          'suspend' => 'Suspend',
          'select0' => $data['data']['hostname'],
        ];
        $sock->query('/CMD_API_SELECT_USERS', $pauseSub);
        break;
        //获取全部套餐
      case 'plan':
        // $url = $_URI . '/api/plan?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'GET';
        break;
        //获取指定套餐
      case 'plan_get':
        // $url = $_URI . '/api/plan/' . $data['planid'] . '?time=' . $oldsdata['timeStamp'] . '&random=' . $oldsdata['randomStr'] . '&signature=' . $signature;
        // $data['method'] = 'GET';
        break;
      default:
        break;
    }
    // if ($data['action'] != 'renewvirtual') {
    //   $_d = $data['method'] == 'GET' ? [] : $data['data'];
    //   // dump($data);
    //   // dump($_d);
    //   // return;
    //   $_r = $this->send($url, $_d, $data['method']);
    //   // dump($url);
    //   // dump(json_decode($_r, true));
    //   // dump($_r);
    // }

    // dump($ret);
    // $resinfo = json_decode($_r, true);
    $resinfo = $sock->fetch_parsed_body();
    // dump($config);
    // dump($data);
    // dump($product);
    // dump($proinfo['end_time']);
    // dump(time());
    // dump($proinfo['end_time'] < time());
    dump($resinfo);
    exit;

    switch ($data['action']) {
        //创建云主机
      case 'activate':
        if (isset($resinfo['error']) && $resinfo['error'] == "0") {
          // dump($resinfo);
          // $createSub;
          $saveData = [
            'user_id' => session('_userInfo')['id'],
            'product_id' => $data['plug_id'],
            'name' => $createSub['username'],
            'password' => $createSub['passwd'],
            'attach' => $data['data']['domain'],
            'ip' => $createSub['ip'],
            'type' => 1,
            'status' => '正常',
            'create_time' => time(),
            'update_time' => time(),
            'end_time' => strtotime("+" . $data['data']['month'] . " month", time()),
          ];
          $saveres = Db::name('host_direct')->insert($saveData);

          $save = [
            'user_id' => $data['user_id'],
            'plug_id' => $data['plug_id'],
            'plug_type' => 'host_direct',
            'plug_name' => 'direct',
            'type' => $data['type'],
            'pro_id' => Db::name('host_direct')->where('name = "' . $createSub['username'] . '" and password = "' . $createSub['passwd'] . '"')->find()['id'],
            'status' => '正常',
            'create_time' => time(),
            'update_time' => time(),
            'end_time' => strtotime("+" . $data['data']['month'] . " month", time()),
          ];
          $saveres1 = Db::name('host')->insert($save);
        } else {
          $ret['status'] = 500;
          $ret['msg'] = $resinfo['details'];
        }
        break;
      case 'renew':
        $endTime = '';
        //续费云主机
        if ($proinfo && $proinfo['end_time'] < time()) {
          $save = [
            'status' => '正常',
            'update_time' => time(),
            'end_time' => strtotime("+" . $data['data']['month'] . " month", time()),
          ];
        } else {
          $save = [
            'status' => '正常',
            'update_time' => time(),
            'end_time' => strtotime("+" . $data['data']['month'] . " month", $proinfo['end_time']),
          ];
        }
        Db::name('host')->where('pro_id = ' . $proinfo['id'])->update($save);
        Db::name('host_direct')->where('id = ' . $proinfo['id'])->update($save);
        break;
      case 'changepw':
        if (isset($resinfo['error']) && $resinfo['error'] == "0") {
          Db::name('host_direct')->where('name = "' . $data['data']['hostname'] . '"')->update(['password' => $data['data']['password']]);
        }
        break;
    }

    // echo $saveres;
    // echo $saveres1;
    // dump(isset($resinfo['error']));
    // dump($resinfo);
    // dump($resinfo['error'] == "0");
    // exit;
    if ($data['action'] == 'manager') {
      // $ret['data'] = $url;
      // $ret['data'] = $_r;
    } else {
      // $ret['data'] = json_decode($_r, true);
    }
    return json_encode($ret);
  }

  /**
   * 更新vps列表数据
   * @param $data  所传参数
   * @param $data['user_id']  所属用户ID
   * @return json
   */
  public function updateList($data = [])
  {
    $v = Db::name('host');
    $host = Db::name('host_direct');
    $easymodel = Db::name('host_direct');
    // $plug= $this->control();
    if ($data['data']['user_id'] == '-1') {
      $vpsList = $host->select();
    } else {
      $vpsList = $host->where('user_id = ' . $data['data']['user_id'])->select();
    }
    // dump($vpsList);
    try {
      foreach ($vpsList as $k => $v) {
        // dump($v);
        if ($v['end_time'] < time()) {
          $endSave = [
            'status' => '已过期'
          ];
          Db::name('host')->where('pro_id = ' . $v['id'])->update($endSave);
          Db::name('host_direct')->where('id = ' . $v['id'])->update($endSave);
          // $id['id'] = $v['id'];
          $putData = [
            'plug_id' => $v['product_id'],
            'user_id' => $data['user_id'],
            'action' => 'pause',
            'data' => [
              'hostname' => $v['name'],
            ],
            'attach' => '',
            'openX' => ""
          ];
          $res = $this->control($putData);
          // dump($res);
          // exit;
        }
        $res = json_decode($res, true);


        //主鸡的创建站点已经删除,但数据库记录还在
        if (isset($res['type']) && $res['status'] == '404' && $res['type'] == "getVh") {

          $easymodel->where(["id" => $v['id']])->update(['status' => '已删除']);
        }

        //host站点过期
        if ($v['end_time'] < time()) {
          $easymodel->where(["id" => $v['id']])->update(['status' => '已过期']);
        }
      }
    } catch (WhmException $exception) {
      echo $exception->getMessage();
      die();
    }
  }
  /**
   * curl 调用接口
   * @param $aData
   * @return \SimpleXMLElement
   */
  private function send($url, $params, $method = 'GET', $header = array(), $timeout = 5)
  {

    // POST 提交方式的传入 $params 必须是字符串形式
    $opts = array(
      CURLOPT_TIMEOUT => $timeout,
      CURLOPT_RETURNTRANSFER => 1,
      CURLOPT_SSL_VERIFYPEER => false,
      CURLOPT_SSL_VERIFYHOST => false,
      CURLOPT_HTTPHEADER => $header,
    );

    /* 根据请求类型设置特定参数 */
    switch (strtoupper($method)) {
      case 'GET':
        $opts[CURLOPT_URL] = $url . '&' . http_build_query($params);
        break;
      case 'POST':
        $params = http_build_query($params);
        $opts[CURLOPT_URL] = $url;
        $opts[CURLOPT_POST] = 1;
        $opts[CURLOPT_POSTFIELDS] = $params;
        break;
      case 'DELETE':
        $opts[CURLOPT_URL] = $url;
        $opts[CURLOPT_HTTPHEADER] = array("X-HTTP-Method-Override: DELETE");
        $opts[CURLOPT_CUSTOMREQUEST] = 'DELETE';
        $opts[CURLOPT_POSTFIELDS] = $params;
        break;
      case 'PUT':
        $params = http_build_query($params);
        $opts[CURLOPT_URL] = $url;
        $opts[CURLOPT_POST] = 0;
        $opts[CURLOPT_CUSTOMREQUEST] = 'PUT';
        $opts[CURLOPT_POSTFIELDS] = $params;
        break;
      default:
        throw new Exception('不支持的请求方式！');
    }

    /* 初始化并执行curl请求 */
    $ch = curl_init();
    curl_setopt_array($ch, $opts);
    $data = curl_exec($ch);
    $error = curl_error($ch);
    // dump($data);
    return $data;
  }

  public function random_code_type($length = 8, $type = 'alpha-number')
  {
    $code_arr = array(
      'alpha' => 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
      'number' => '0123456789',
      'sign'  => '#$@*-_',
    );

    $type_arr = explode('-', $type);

    foreach ($type_arr as $t) {
      if (!array_key_exists($t, $code_arr)) {
        trigger_error("Can not generate type ($t) code");
      }
    }

    $chars = '';

    foreach ($type_arr as $t) {
      $chars .= $code_arr[$t];
    }
    $chars = str_shuffle($chars);
    $number = $length > strlen($chars) - 1 ? strlen($chars) - 1 : $length;
    return substr($chars, 0, $number);
  }
}
