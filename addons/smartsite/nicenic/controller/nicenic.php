<?php

namespace addons\smartsite\nicenic\controller;

use think\Controller;
use think\Db;
use Addons\Smartsite\Smartsite;
use Exception;


class nicenic extends Controller
{
  /**
   * 主控端接口
   * @param $data  所传参数
   * @param $data['plug_id']  传入的接口产品id(将根据产品id去获取相关配置)
   * @param $data['data']  访问接口时的其余附带参数
   * @param $data['action']  即将访问的接口名称
   * @param $data['attach']  访问接口时附带的请求备注
   * @param $data['openX']   访问接口时附带的?
   * @return json
   */
  public function control($data = [])
  {
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
    if (!$data['plug_id']) {
      $ret['status'] = 422;
      $ret['msg'] = '请求接口参数异常！请确认参数。';
      return $ret;
    }
    // if ($data['action'] != 'manager') {
    $product = Db::name('product')->where('id = ' . $data['plug_id'])->find();
    $config = json_decode($product['plug_config'], true);
    $vtime = number_format(microtime(true), 2, '', '');
    $putData['userid'] = $config['user'];
    $putData['userstr'] = md5($config['user'] . $config['pass'] . $config['email'] . $vtime);
    $putData['category'] = $config['category'];
    $putData['action'] = $data['action'];
    $putData['vtime'] = $vtime;
    // }
    // dump($putData);

    $_URI = $config['uri'];
    switch ($data['action']) {
      case 'getinfo':
        //查询建站宝盒
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        break;
      case 'activate':
        //购买建站宝盒
        $putData['productid'] = $config['productid'];
        $putData['vyear'] = $data['data']['year'];
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        $putData['password'] = $data['data']['password'];
        $putData['wwwroot'] = $config['wwwroot'];
        $putData['wxapp'] = $config['wxapp'];
        $putData['bdapp'] = $config['bdapp'];
        $putData['booktype'] = '';
        break;
      case 'renew':
        //续费建站宝盒
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        $putData['vyear'] = $data['data']['year'];
        $putData['expdate'] = $data['data']['end_time'];
        break;
      case 'uprenew':
        //升级建站宝盒
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        $putData['upgrade_productid'] = $data['data']['upgrade_productid'];
        $putData['booktype'] = $data['data']['booktype'];
        break;
      case 'changepwd':
        //修改密码
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        $putData['newpwd'] = $data['data']['newpwd'];
        break;
      case 'loginurl':
        //获取Nicebox建站宝盒的登陆URL
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        break;
      case 'updateinfo':
        //更新Nicebox建站宝盒FTP信息
        $putData['ftpserver'] = $data['data']['ftpserver'];
        $putData['ftpuser'] = $data['data']['ftpuser'];
        $putData['newftpserver'] = $data['data']['newftpserver'];
        $putData['newftpuser'] = $data['data']['newftpuser'];
        $putData['newpwd'] = $data['data']['newpwd'];
        $putData['wwwroot'] = $data['data']['wwwroot'];
        break;
    }
    // return;
    // $res = $this->send($url);
    // $_d = $data['method'] == 'GET' ? [] : $data['data'];
    $res = $this->send($_URI, $putData, 'POST');
    // dump($url);
    // dump($putData);
    // dump($res);

    // $res = convertUrlQuery($res);
    if ($res['ret'] == '0') {
      $ret['status'] = 401;
      $ret['msg'] = $res['freehosinfo'];
      return json_encode($ret);
    }
    if ($data['action'] == 'activate') {
      if ($res['returncode'] == 200) {
        $saveData = [
          'user_id' => $data['user_id'],
          'product_id' => $data['plug_id'],
          'ftpserver' => $res['ftpserver'],
          'name' => $res['ftpuser'],
          'password' => $res['password'],
          'attach' => $res['attach'],
          'end_time' => strtotime($res['deaddate']),
          'plug_pro_id' => $res['id'],
          'type' => $res['productid'],
          'status' => $res['status'],
          'create_time' => time(),
          'update_time' => time(),
        ];
        $saveres = Db::name('smartsite_nicenic')->insert($saveData);
        if (!$saveres) {
          $ret['status'] = 500;
          $ret['msg'] = '操作超时！';
        }
        $savesmartsiteres = Db::name('smartsite')->insert(['user_id' => $data['user_id'], 'plug_id' => $data['plug_id'], 'plug_type' => 'smartsite_nicenic', 'plug_name' => 'nicenic', 'pro_id' => Db::name('smartsite_nicenic')->where('ftpserver = "' . $res['ftpserver'] . '"')->find()['id'], 'create_time' => time(), 'update_time' => time()]);

        // parseMsgPublic([
        //   'mark' => 'cloudserverRegister',
        //   'to' => session('_userInfo')['phone'],
        //   'params' => [
        //     $res['ftpserver'],
        //     date("Y-m-d H:i:s", strtotime($res['endtime'])),
        //   ],
        // ]);
      }
    } else if ($data['action'] == 'getinfo') {
      $ret['data'] = $res;
    } else if ($data['action'] == 'changepwd') {
      $ret['data'] = '';
      $up = Db::name('smartsite_nicenic')->where('ftpserver = "' . $data['data']['ftpserver'] . '"')->update(['password' => $data['data']['newpwd']]);
    } else if ($data['action'] == 'renew') {
      $ret['data'] = '';
      $up = Db::name('smartsite_nicenic')->where('ftpserver = "' . $data['data']['ftpserver'] . '"')->update(['end_time' => strtotime($res['deaddate'])]);
    } else if ($data['action'] == 'update') {
      $ret['data'] = '';
      $up = Db::name('smartsite_nicenic')->where('ftpserver = "' . $data['data']['ftpserver'] . '"')->update(['type' => $res['productid'], 'end_time' => strtotime($res['deaddate'])]);
    }
    // dump(json_encode($ret));
    return json_encode($ret);
  }
  /**
   * 更新smartsite列表数据
   * @param $data  所传参数
   * @param $data['user_id']  所属用户ID
   * @return json
   */
  public function updateList($data = [])
  {
    // $v = Db::name('smartsite');
    $smartsite = Db::name('smartsite_nicenic');
    // $plug= $this->control();
    if ($data['data']['user_id'] == '-1') {
      $smartsiteList = $smartsite->select();
    } else {
      $smartsiteList = $smartsite->where('user_id = ' . $data['data']['user_id'])->select();
    }
    // dump($smartsiteList);
    if ($smartsiteList) {
      foreach ($smartsiteList as $k => $v) {
        $id['id'] = $v['id'];
        $putData = [
          'plug_id' => $v['product_id'],
          'user_id' => $data['user_id'],
          'action' => 'getinfo',
          'data' => [
            'ftpserver' => $v['ftpserver'],
            'ftpuser' => $v['name'],
          ],
          'attach' => '',
          'openX' => "",
        ];
        $res = $this->control($putData);
        $res = json_decode($res, true);
        // dump($res);
        if ($res['msg'] == '服务器不存在！') {
          // $smartsite->where('id = ' . $v['id'])->delete();
          // Db::name('smartsite')->where('pro_id = ' . $v['id'])->delete();
        } else {
          if ($res['data']['returncode'] !== 200) {
            $smartsite->where('id = ' . $v['id'])->update(['password' => $res['data']['password'], 'status' => $res['data']['status'], 'ftpserver' => $res['data']['ftpserver'], 'name' => $res['data']['ftpuser'], 'type' => $res['data']['productid'], 'plug_pro_id' => $res['data']['id'], 'end_time' => strtotime($res['data']['deaddate']), 'update_time' => time()]);
            Db::name('smartsite')->where('pro_id = ' . $v['id'])->update(['status' => $res['data']['status'], 'end_time' => strtotime($res['data']['deaddate']), 'update_time' => time()]);
          }
        }
      }
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
    header('Content-Type:text/xml; charset=utf-8');
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
    // dump($data);
    $data = (array) simplexml_load_string($data, 'SimpleXMLElement', LIBXML_NOCDATA);
    $error = curl_error($ch);
    // dump($data);
    return $data;
  }
}
