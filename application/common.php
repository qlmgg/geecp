<?php
// +----------------------------------------------------------------------
// | 公告配置文件
// +----------------------------------------------------------------------
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

use app\manager\model\GeeEmailconfig; //验证函数类库
use app\manager\model\GeeMsglog; // 消息日志表
use app\manager\model\GeeMsgmodel; // 消息模板表
use app\manager\model\GeeSmsapi; // 短信API信息表
use app\manager\model\GeeWebbasic; // 短信API信息表
use Firebase\JWT\JWT; // JWT
use PHPMailer\PHPMailer\PHPMailer; // 消息模板表
use think\Request; // 交易记录表
use zoujingli\Wechat\Loader;

//引入公共方法
include_once 'common/function/sys_common.php';
include 'vendor/autoload.php';
// 应用公共文件
/**
 * 将模型 select 查询后结果转为数组
 * @param array $value select 查询后数组
 */
function toArray(&$value)
{
  foreach ($value as &$var) {
    if (gettype($var) == 'array') {
      $var = $var;
    } else {
      $var = $var->toArray();
    }
  }
}
/**
 * 将分页查询出数据转为数组
 * @param array $value 分页查询后数组
 */
function list_toArray($value)
{
  $data = [];
  foreach ($value as $key => $var) {
    if (gettype($var) == 'array') {
      $data[$key] = $var;
    } else {
      $data[$key] = $var->toArray();
    }
  }
  return $data;
}
/**
 * 将分页查询出数据转为数组并附带产品类型
 * @param array $value 分页查询后数组
 * @param string $type 产品名称或产品类型
 */
function list_pro_toArray($value, $type)
{
  $data = [];
  foreach ($value as $key => $var) {
    if (gettype($var) == 'array') {
      $data[$key] = $var;
      $data[$key]['type'] = $type;
    } else {
      $data[$key] = $var->toArray();
      $data[$key]['type'] = $type;
    }
  }
  return $data;
}
/**
 * PHP stdClass Object转array
 * @param array $value 查询后stdClass
 */
function object_toArray($array)
{
  if (is_object($array)) {
    $array = (array) $array;
  }
  if (is_array($array)) {
    foreach ($array as $key => $value) {
      $array[$key] = object_toArray($value);
    }
  }
  return $array;
}
/**
 * 线转树
 * @param Array $arr 需要处理的数组
 * @param String $keyName 作为分类的字段
 */
function Array2Tree($arr, $keyName)
{
  $res = array_reduce($arr, function ($a, $b) {
    $keys = $b[$a['k']];
    if (!$a[$keys]) {
      $a[$keys] = [];
    }
    array_push($a[$keys], $b);
    return $a;
  }, ['k' => $keyName]);
  unset($res['k']);
  return $res;
}

/**
 * 判断是否全部为中文
 * @param string $str 要判断的字符串
 */
function is_gb2312($str)
{
  //新疆等少数民族可能有·
  if (strpos($str, '·')) {
    //将·去掉，看看剩下的是不是都是中文
    $str = str_replace("·", '', $str);
    if (preg_match('/^[\x7f-\xff]+$/', $str)) {
      return true; //全是中文
    } else {
      return false; //不全是中文
    }
  } else {
    if (preg_match('/^[\x7f-\xff]+$/', $str)) {
      return true; //全是中文
    } else {
      return false; //不全是中文
    }
  }
}

/**
 * 判断是否全部是字母和数字
 * @param string $str 要判断的字符串
 */
function is_alnum($str)
{
  $is = preg_match('/^\w*$/', $str);
  return $is;
}
/**
 * 将字符串转成double
 */
function to_double($str)
{
  return sprintf("%.2f", (float) $str);
}
/**
 * 字符串|换行
 */
function to_verticalbar($str)
{
  // dump($str);
  return str_replace('|', '<br>', $str);
}

/*获取客户端真实的IP*/
function get_ip()
{
  //判断服务器是否允许$_SERVER
  if (isset($_SERVER)) {
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
      $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
      $realip = $_SERVER['HTTP_CLIENT_IP'];
    } else {
      $realip = $_SERVER['REMOTE_ADDR'];
    }
  } else {
    //不允许就使用getenv获取
    if (getenv("HTTP_X_FORWARDED_FOR")) {
      $realip = getenv("HTTP_X_FORWARDED_FOR");
    } elseif (getenv("HTTP_CLIENT_IP")) {
      $realip = getenv("HTTP_CLIENT_IP");
    } else {
      $realip = getenv("REMOTE_ADDR");
    }
  }

  return $realip;
}

function getClientIp()
{
  if (getenv('HTTP_CLIENT_IP')) {
    $ip = getenv('HTTP_CLIENT_IP');
  }
  if (getenv('HTTP_X_REAL_IP')) {
    $ip = getenv('HTTP_X_REAL_IP');
  } elseif (getenv('HTTP_X_FORWARDED_FOR')) {
    $ip = getenv('HTTP_X_FORWARDED_FOR');
    $ips = explode(',', $ip);
    $ip = $ips[0];
  } elseif (getenv('REMOTE_ADDR')) {
    $ip = getenv('REMOTE_ADDR');
  } else {
    $ip = '0.0.0.0';
  }

  return $ip;
}
/*把IP传入新浪API返回数据获取ip的真实归属地*/
function get_ipfrom($ip = '')
{
  if (empty($ip)) {
    $ip = GetIps();
  }
  $res = @file_get_contents('http://ip.taobao.com/service/getIpInfo.php?ip=' . $ip);
  return $res;
}
/**
 * 数组转xml字符
 * @param  string     $xml xml字符串
 **/
function arrayToXml($data)
{
  if (!is_array($data) || count($data) <= 0) {
    return false;
  }
  $xml = "<xml>";
  foreach ($data as $key => $val) {
    if (is_numeric($val)) {
      $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
    } else {
      $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
    }
  }
  $xml .= "</xml>";
  return $xml;
}

/**
 * 将xml转为array
 * @param  string     $xml xml字符串或者xml文件名
 * @param  bool     $isfile 传入的是否是xml文件名
 * @return array    转换得到的数组
 */
function xmlToArray($xml, $isfile = false)
{
  //禁止引用外部xml实体
  libxml_disable_entity_loader(true);
  if ($isfile) {
    if (!file_exists($xml)) {
      return false;
    }

    $xmlstr = file_get_contents($xml);
  } else {
    $xmlstr = $xml;
  }
  $result = json_decode(json_encode(simplexml_load_string($xmlstr, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
  return $result;
}

use think\validate; // token Sdk

/**
 * jwt 加密
 */
function jwt_encode($arg, $time = 2)
{
  $key = "CourtesyCostsNothing";
  $num = 60 * 60 * $time; // 有效期 单位:秒
  $time = time();
  // foreach($arg as $key => $var){
  //     $token[$key]=$var;
  // }
  $token = [];
  $token["iss"] = "system"; //签发者 可以为空
  $token['iat'] = $time;
  $token["nbf"] = $time; //在什么时候jwt开始生效  （这里表示生成100秒后才生效）
  $token['exp'] = $time + $num;
  $token['sub'] = '/';
  $token['jti'] = $arg;
  $jwt = JWT::encode($token, $key, 'HS256');
  return $jwt;
}
/**
 * jwt 解密
 */
function jwt_decode($jwt)
{
  $key = "CourtesyCostsNothing";
  // dump($jwt);
  $decoded = JWT::decode($jwt, $key, ['HS256']);
  return $decoded;
}

/**
 * 判断是否手机浏览器
 */
function isMobile()
{
  // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
  if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
    return true;
  }
  // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
  if (isset($_SERVER['HTTP_VIA'])) {
    // 找不到为flase,否则为true
    return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
  }
  // 无脑法，判断手机发送的客户端标志,兼容性有待提高。其中'MicroMessenger'是电脑微信
  if (isset($_SERVER['HTTP_USER_AGENT'])) {
    $clientkeywords = array('nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile', 'MicroMessenger');
    // 从HTTP_USER_AGENT中查找手机浏览器的关键字
    if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
      return true;
    }
  }
  // 协议法，因为有可能不准确，放到最后判断
  if (isset($_SERVER['HTTP_ACCEPT'])) {
    // 如果只支持wml并且不支持html那一定是移动设备
    // 如果支持wml和html但是wml在html之前则是移动设备
    if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
      return true;
    }
  }
  return false;
}
/**
 * 判断是否为微信浏览器
 */
function isWeixin()
{
  if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
    return true;
  } else {
    return false;
  }
}
/**
 * 判断是否为小程序
 */
function isWeixinapp()
{
  if (request()->header("content-type") == null && request()->header("accept") != null) {
    return false; //网页请求
  } else {
    return true; //小程序请求
  }
}
/**
 * 截取并返回字符串首位字符
 */
function strFirst($str)
{
  return mb_substr($str, 0, 1, "utf-8");
}

/**
 * 解析后台路由并返回子项
 */
function routeAnalysis($fid)
{
  if (!$fid) {
    return '';
  }
  $res = db('v2mroute')->where('`f_id` = ' . $fid . ' and `is_show` = "1"')->order('id')->select();
  if ($res) {
    object_toArray($res);
  }
  return $res;
}
/**
 * 解析前台路由并返回子项
 */
function webRouteAnalysis($fid)
{
  if (!$fid) {
    return '';
  }
  $hasFid = db('webroute')->where('id = ' . $fid)->find();

  if ($hasFid['f_id'] != 0) {
    $res = webRouteAnalysis($hasFid['f_id']);
    // dump($res);
    // exit;
  } else {
    $res = db('webroute')->where('`is_show` = "1" and `f_id` = ' . $fid)->order('id')->select();
    if ($res) {
      object_toArray($res);
    }
  }

  return $res;
}

/**
 * 解析前台子路由路由并返回
 */
function webRouteChildAnalysis($fid)
{
  if (!$fid) {
    return '';
  }
  $res = db('webroute')->where('`is_show` = "1" and `f_id` = ' . $fid)->order('id')->select();
  if ($res) {
    object_toArray($res);
  }

  return $res;
}

/**
 * 当前二级导航解析
 */
function seekarr($arr = array(), $key, $val)
{
  $res = array();
  if ($arr) {
    foreach ($arr as $k => $v) {
      if ($v[$key] == $val) {
        $res = $v;
        return $res;
      } else {
        if (isset($v['child']) && !empty($v['child'])) {
          $res = seekarr($v['child'], $key, $val);
        } else {
          $res = null;
        }
      }
    }
    return $res;
  } else {
    return '';
  }
}

/*
 * 密码转hash
 */
function passToHash($pass)
{
  $options = [
    'cost' => 11,
  ];
  return password_hash($pass, PASSWORD_BCRYPT, $options);
}

/**
 * 格式化公钥
 */
function formatPukey($encryptionKey)
{
  $pem = chunk_split($encryptionKey, 64, "\n");
  $pem = "-----BEGIN PUBLIC KEY-----\n" . $pem . "-----END PUBLIC KEY-----\n";
  return $pem;
}

/**
 * 加密公钥
 */
function pubkeyEncrypt($source_data, $pu_key)
{
  $data = "";
  $dataArray = str_split($source_data, 117);
  foreach ($dataArray as $value) {
    $encryptedTemp = "";
    openssl_public_encrypt($value, $encryptedTemp, $pu_key);
    $data .= base64_encode($encryptedTemp);
  }
  return $data;
}

/*
 * 获取请求头
 */
function get_header($name = '')
{
  if ($name) {
    return apache_request_headers()[$name];
  }
  return apache_request_headers();
}

/**
 * curl 调用接口
 * @param {String} $url URI请求地址
 * @param {Array} $params 传入参数
 * @param {String} $method 请求类型 GET|POST|PUT
 * @param {Array} $header 请求头
 * @param {Number} $timeout 超时 单位秒
 * @return \SimpleXMLElement
 */
function send($url, $params, $method = 'GET', $header = array(), $timeout = 5)
{
  // POST 提交方式的传入 $params 必须是字符串形式
  $opts = array(
    CURLOPT_TIMEOUT => $timeout,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_SSL_VERIFYHOST => false,
    CURLOPT_HTTPHEADER => $header,
  );
  $ch = curl_init();
  /* 根据请求类型设置特定参数 */
  switch (strtoupper($method)) {
    case 'GET':
      $opts[CURLOPT_URL] = $url . '&' . http_build_query($params);
      break;
    case 'POST':
      $opts[CURLOPT_URL] = $url;
      $opts[CURLOPT_POST] = true;
      $opts[CURLOPT_POSTFIELDS] = json_encode($params);
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
  curl_setopt_array($ch, $opts);
  $data = curl_exec($ch);
  $error = curl_error($ch);
  $information = curl_getinfo($ch);
  // dump($ch);
  // dump($data);
  // dump($opts);
  // dump($information);
  // exit;
  return $data;
}
/**
 * @name 解析消息模板公共变量
 * @param {Array} $data 传入配置项
 * @param {String} $data['mark'] 消息模板标识
 * @param {String} $data['to'] 接收人联系方式  手机号|邮箱
 * @param {Array} $data['params'] 传递参数 例如：['云主机名称','897112','{basic_name}']
 */
function parseMsgPublic($data = [])
{
  $ret = [
    'status' => 200,
    'msg' => '操作成功',
    'data' => '',
  ];
  // dump($data);

  //获取基本信息可使用变量配置
  $basic = new GeeWebbasic();
  $basicInfo = $basic->where('id = 1')->field('name,email,url,logo,icp,beian,idc,isp')->find();

  $basicInfo = $basicInfo->toArray();
  //邮件随机验证码
  $emailCode = mt_rand(100000, 999999);
  $smsCode = mt_rand(100000, 999999);

  //公共变量定义
  $_public_params = [
    'basic_name' => $basicInfo['name'],
    'basic_email' => $basicInfo['email'],
    'basic_url' => $basicInfo['url'],
    'basic_logo' => $basicInfo['logo'],
    'basic_icp' => $basicInfo['icp'],
    'basic_beian' => $basicInfo['beian'],
    'basic_idc' => $basicInfo['idc'],
    'basic_isp' => $basicInfo['isp'],
    'email_code' => $emailCode,
    'sms_code' => $smsCode,
  ];
  //转义参数中的公共变量
  foreach ($data['params'] as $k => $v) {
    if ($_public_params[$v]) {
      $data['params'][$k] = $_public_params[$v];
    }
  }
  // dump($data);

  $res = sendMessage($data);
  return $res;
}

/**
 * @name 解析消息模板
 * @param {Array} $data 传入配置项
 * @param {String} $data['mark'] 消息模板标识
 * @param {String} $data['to'] 接收人联系方式  手机号|邮箱
 * @param {Array} $data['params'] 传递参数
 */
function sendMessage($data = [])
{
  // $data = $_POST;
  $temp = new GeeMsgmodel();
  $mlog = new GeeMsglog();
  $ret = [
    'status' => 200,
    'msg' => '操作成功',
    'data' => '',
  ];
  //获取消息模板
  $tempInfo = $temp->where('mark = "' . $data['mark'] . '"')->find();
  if (!$tempInfo) {
    $ret['status'] = 422;
    $ret['msg'] = '参数错误！请传入正确的参数';
    return json_encode($ret);
  }
  $title = $tempInfo['name'];
  $content = $tempInfo['content'];

  //提取模板中的变量
  $strPattern = "/(?<={)[^}]+/";
  $arrMatches = [];
  preg_match_all($strPattern, $content, $arrMatches);
  //消息模板转义
  // dump($arrMatches);
  foreach ($arrMatches as $k => $v) {
    foreach ($v as $key => $var) {
      //假如为公共模板
      $content = str_replace("{" . $var . "}", $data['params'][$key], $content);
    }
  }
  // dump($data);
  // dump($content);
  // exit;

  $savelog = $mlog->save([
    'type' => $tempInfo['type'],
    'to' => $data['to'],
    'name' => $tempInfo['name'],
    'content' => $content,
  ]);
  switch ($tempInfo['type']) {
    case '0':
      // session($data['mark'], $smsCode);
      //短信验证码
      $sapi = new GeeSmsapi();
      $sapiInfo = $sapi->where('id = 1')->find();
      if (!$sapiInfo) {
        $ret['status'] = 422;
        $ret['msg'] = '参数错误！请传入正确的参数';
        return json_encode($ret);
      }
      $sendInfo = [
        'accessKey' => $sapiInfo['ak'],
        'mobile' => $data['to'],
        'parameter' => $data['params'],
        'signId' => (int) $sapiInfo['signid'],
        'templateId' => (int) $tempInfo['model_id'],
      ];
      // dump($sendInfo);
      // dump($content);
      // return;
      $res = sendSms($sendInfo);
      break;
    case '1':
      //短信通知
      $sapi = new GeeSmsapi();
      $sapiInfo = $sapi->where('id = 1')->find();
      if (!$sapiInfo) {
        $ret['status'] = 422;
        $ret['msg'] = '参数错误！请传入正确的参数';
        return json_encode($ret);
      }
      $sendInfo = [
        'accessKey' => $sapiInfo['ak'],
        'mobile' => $data['to'],
        'parameter' => $data['params'],
        'signId' => (int) $sapiInfo['signid'],
        'templateId' => (int) $tempInfo['model_id'],
      ];
      $res = sendSms($sendInfo);
      break;
    case '2':
      //邮件验证码
      // session($data['mark'], $emailCode);
      $res = sendEmail(['email' => $data['to'], 'title' => $title, 'content' => $content]);
      if (json_decode($res, true)['status'] != 200) {
        $ret['status'] = 500;
        $ret['msg'] = json_decode($res, true)['msg'];
        return json_decode($ret);
      }
      break;
    case '3':
      //邮件通知
      $res = sendEmail(['email' => $data['to'], 'title' => $title, 'content' => $content]);
      if (json_decode($res, true)['status'] != 200) {
        $ret['status'] = 500;
        $ret['msg'] = json_decode($res, true)['msg'];
        return json_decode($ret);
      }
      break;
  }
  $res = json_decode($res, true);
  $resdata = json_decode($res['data'], true);
  $resdata = json_decode($resdata, true);
  // dump($resdata);
  // dump($resdata['code']);
  // dump($resdata['code'] !== 200);
  if ($resdata['code'] !== 200) {
    $ret['status'] = $resdata['code'];
    $ret['msg'] = $resdata['message'];
    return json_encode($ret);
  }
  $ret['data'] = $res;
  // dump(json_decode($res));
  // dump($content);
  // exit;
  return json_encode($ret);
}

/**
 * @name 公共请求短信接口
 * @param {Array} $data 传入配置项
 * @param {String} $data['accessKey'] 短信API配置 AK
 * @param {String} $data['mobile'] 接收人手机号
 * @param {Array}  $data['parameter'] 短信接收动态参数 如：['云主机1号','845575']
 * @param {Number} $data['signId'] 短信API配置 签名ID
 * @param {Number} $data['templateId'] 短信模板ID
 */
function sendSms($data = [])
{
  // dump($data);
  // exit;
  $mlog = new GeeMsglog();
  $res = send('https://isvapi.geecp.com/v1/userSendMessage/sendMessage', $data, 'POST', array(
    "Content-type: application/json;charset=UTF-8",
  ));
  $ret = [
    'status' => 200,
    'msg' => '操作成功',
    'data' => json_encode($res),
  ];
  $minfo = $mlog->where('`to` = "' . $data['mobile'] . '"')->order('id desc')->find();
  $mlog->where('`id` = ' . $minfo['id'])->update(['res' => json_encode($res)]);
  // dump($data);
  // dump($res);
  return json_encode($ret);
}

/**
 * @name 公共邮件SMTP请求
 * @param {Array} $data 传入配置项
 * @param {String} $data['email'] 收件人邮箱
 * @param {Text} $data['title'] 邮件主体标题
 * @param {Text} $data['content'] 邮件主体内容
 */
function sendEmail($data = [])
{
  $ret = [
    'status' => 200,
    'msg' => '操作成功',
    'data' => '',
  ];
  $isEmail = new GeeEmailconfig();
  $emailInfo = $isEmail->where('id = 1')->find();
  $temp = new GeeMsgmodel();
  if (!$emailInfo) {
    $ret['status'] = 422;
    $ret['msg'] = '请在后台填写邮件配置';
    return $ret;
  }
  if (!$data['email']) {
    $ret['status'] = 422;
    $ret['msg'] = "请传入收件人邮箱";
    return $ret;
  }

  $mail = new PHPMailer(); //实例化
  $mail->IsSMTP(); // 启用SMTP
  $mail->Host = $emailInfo['host']; //SMTP服务器 以qq邮箱为例子
  $mail->Port = $emailInfo['port']; //邮件发送端口
  $mail->SMTPAuth = true; //启用SMTP认证
  $mail->SMTPSecure = $emailInfo['secure']; // 设置安全验证方式为ssl
  $mail->CharSet = "UTF-8"; //字符集
  $mail->Encoding = "base64"; //编码方式
  $mail->Username = $emailInfo['username']; //发件人邮箱
  $mail->Password = $emailInfo['password']; //发件人密码 ==>重点：是授权码，不是邮箱密码
  $mail->From = $emailInfo['email']; //发件人邮箱
  $mail->FromName = $emailInfo['emailname']; //发件人姓名

  //根据邮件模板选择邮件标题
  $mail->Subject = $data['title']; //邮件标题
  if ($data && is_array($data)) {
    $mail->AddAddress($data['email']); //添加收件人邮箱
    $mail->IsHTML(true); //支持html格式内容
    $mail->Body = $data['content']; //邮件主体内容

    //发送成功就删除
    if ($mail->Send()) {
      if (!$mail->ErrorInfo) {
        return json_encode($ret);
      }

      $ret['status'] = 422;
      $ret['msg'] = "Mailer Error: " . $mail->ErrorInfo;
      return json_encode($ret);
    } else {

      $ret['status'] = 422;
      if ($mail->ErrorInfo) {
        $ret['msg'] = "Mailer Error: " . $mail->ErrorInfo;
      } else {
        $ret['msg'] = "网络错误！请再次尝试";
      }
      return json_encode($ret);
    }
  }
}

/*
 * 正则验证
 */
function vali_data($rule, $data)
{
  switch ($rule) {
    case 'empty':
      return !empty($data);
      break;
    case 'pwd':
      return preg_match('/^.{6,18}$/', $data);
      break;
    case 'email':
      $isemail = "/^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[-.])+([a-z]{2,5})$/ims";
      return preg_match($isemail, $data);
      break;
    case 'phone':
      return preg_match('/^(1[3-9][0-9])\d{8}$/', $data);
      break;
    case 'idcard':
      return preg_match('/^[1-9]\d{5}(19|20)\d{2}[01]\d[0123]\d\d{3}[xX\d]$/', $data);
      break;
    case 'url':
      return (substr($data, 0, 7) == 'http://' || substr($data, 0, 8) == 'https://' || substr($data, 0, 2) == '//') ? true : false;
      break;
    case 'port':
      return preg_match('/[1-9]{1,5}/', $data) && $data <= 65535;
      break;
    case 'ftpname':
      return preg_match('/^[a-zA-Z][\w]{5,16}$/', $data);
      break;
    case 'vpspw':
      return preg_match('/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,100}$/', $data);
      break;
    case 'cspwd':
      return preg_match('/^([a-z0-9\.\@\!\#\$\%\^\*\(\)]){8,32}$/i', $data);
      break;
  }
}

/**
 * 随机码
 */
function randcode($len)
{
  // 密码字符集，可任意添加你需要的字符
  $chars = array(
    'A', 'B', 'C', 'D',
    'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  );
  // 在 $chars 中随机取 $len 个数组元素键名
  $keys = array_rand($chars, $len);
  $code = '';
  for ($i = 0; $i < $len; $i++) {
    // 将 $len 个数组元素连接成字符串
    $code .= $chars[$keys[$i]];
  }
  return $code;
}

/**
 * 随机名称
 */
function rand_name($length = 8, $small = '')
{
  // // 密码字符集，可任意添加你需要的字符
  // $chars = array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
  //     'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
  //     't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D',
  //     'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
  //     'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  //     '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
  // // 在 $chars 中随机取 $length 个数组元素键名
  // $keys = array_rand($chars, $length);
  // $name = '';
  // for ($i = 0; $i < $length; $i++) {
  //     // 将 $length 个数组元素连接成字符串
  //     $name .= $chars[$keys[$i]];
  // }
  $chars = '0123456789abcdefghknopqrstuvxyz';
  $count = strlen($chars) - 1;
  $code = '';
  while (strlen($code) < $length) {
    $code .= substr($chars, rand(0, $count), 1);
  }
  return !!$small ? strtolower($code) : $code;
}

/**
 * 验证随机名称
 */
function vali_name($key, $val, $len, $func)
{
  if (!is_int($val) && !is_bool($val)) {
    $w = '"' . $val . '"';
  }
  $has = db('billing')->where('`' . $key . '` = ' . $w)->find();
  if ($has) {
    $vali = vali_name($key, $func($len), $len, $func);
    return $vali;
  } else {
    return $val;
  }
}
/**
 * 随机名称
 */
function rand_small_name($length = 8)
{
  // 密码字符集，可任意添加你需要的字符
  $chars = array(
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
    'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9'
  );
  // 在 $chars 中随机取 $length 个数组元素键名
  $keys = array_rand($chars, $length);
  $name = '';
  for ($i = 0; $i < $length; $i++) {
    // 将 $length 个数组元素连接成字符串
    $name .= $chars[$keys[$i]];
  }
  return $name;
}

/**
 * 随机密码
 */
function rand_password($length = 8)
{
  // 密码字符集，可任意添加你需要的字符
  $chars = array(
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
    'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D',
    'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!',
    '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_',
    '[', ']', '{', '}', '<', '>', '~', '`', '+', '=', ',',
    '.', ';', ':', '/', '?', '|'
  );
  // 在 $chars 中随机取 $length 个数组元素键名
  $keys = array_rand($chars, $length);
  $password = '';
  for ($i = 0; $i < $length; $i++) {
    // 将 $length 个数组元素连接成字符串
    $password .= $chars[$keys[$i]];
  }
  return $password;
}

/**
 * 将字符串参数变为数组
 * @param $query
 * @return array array (size=10)
 */
function convertUrlQuery($query)
{
  $queryParts = explode('&', $query);
  $params = array();
  foreach ($queryParts as $param) {
    $item = explode('=', $param);
    $params[$item[0]] = $item[1];
  }
  return $params;
}

// 安全过滤
function safe_html($html)
{
  $elements = [
    'html' => [],
    'body' => [],
    'a' => ['target', 'href', 'title', 'class', 'style'],
    'abbr' => ['title', 'class', 'style'],
    'address' => ['class', 'style'],
    'area' => ['shape', 'coords', 'href', 'alt'],
    'article' => [],
    'aside' => [],
    'audio' => ['autoplay', 'controls', 'loop', 'preload', 'src', 'class', 'style'],
    'b' => ['class', 'style'],
    'bdi' => ['dir'],
    'bdo' => ['dir'],
    'big' => [],
    'blockquote' => ['cite', 'class', 'style'],
    'br' => [],
    'caption' => ['class', 'style'],
    'center' => [],
    'cite' => [],
    'code' => ['class', 'style'],
    'col' => ['align', 'valign', 'span', 'width', 'class', 'style'],
    'colgroup' => ['align', 'valign', 'span', 'width', 'class', 'style'],
    'dd' => ['class', 'style'],
    'del' => ['datetime'],
    'details' => ['open'],
    'div' => ['class', 'style'],
    'dl' => ['class', 'style'],
    'dt' => ['class', 'style'],
    'em' => ['class', 'style'],
    'font' => ['color', 'size', 'face'],
    'footer' => [],
    'h1' => ['class', 'style'],
    'h2' => ['class', 'style'],
    'h3' => ['class', 'style'],
    'h4' => ['class', 'style'],
    'h5' => ['class', 'style'],
    'h6' => ['class', 'style'],
    'header' => [],
    'hr' => [],
    'i' => ['class', 'style'],
    'img' => ['src', 'alt', 'title', 'width', 'height', 'id', 'class'],
    'ins' => ['datetime'],
    'li' => ['class', 'style'],
    'mark' => [],
    'nav' => [],
    'ol' => ['class', 'style'],
    'p' => ['class', 'style'],
    'pre' => ['class', 'style'],
    's' => [],
    'section' => [],
    'small' => [],
    'span' => ['class', 'style'],
    'sub' => ['class', 'style'],
    'sup' => ['class', 'style'],
    'strong' => ['class', 'style'],
    'table' => ['width', 'border', 'align', 'valign', 'class', 'style'],
    'tbody' => ['align', 'valign', 'class', 'style'],
    'td' => ['width', 'rowspan', 'colspan', 'align', 'valign', 'class', 'style'],
    'tfoot' => ['align', 'valign', 'class', 'style'],
    'th' => ['width', 'rowspan', 'colspan', 'align', 'valign', 'class', 'style'],
    'thead' => ['align', 'valign', 'class', 'style'],
    'tr' => ['rowspan', 'align', 'valign', 'class', 'style'],
    'tt' => [],
    'u' => [],
    'ul' => ['class', 'style'],
    'video' => ['autoplay', 'controls', 'loop', 'preload', 'src', 'height', 'width', 'class', 'style'],
    'embed' => ['src', 'height', 'align', 'width', 'class', 'style', 'type', 'pluginspage', 'wmode', 'play', 'loop', 'menu', 'allowscriptaccess', 'allowfullscreen'],
    'source' => ['src', 'type'],
  ];
  $html = strip_tags($html, '<' . implode('><', array_keys($elements)) . '>');
  $xml = new \DOMDocument();
  libxml_use_internal_errors(true);
  if (!strlen($html)) {
    return '';
  }
  if ($xml->loadHTML('<meta http-equiv="Content-Type" content="text/html; charset=utf-8">' . $html)) {
    foreach ($xml->getElementsByTagName("*") as $element) {
      if (!isset($elements[$element->tagName])) {
        $element->parentNode->removeChild($element);
      } else {
        for ($k = $element->attributes->length - 1; $k >= 0; --$k) {
          if (!in_array($element->attributes->item($k)->nodeName, $elements[$element->tagName])) {
            $element->removeAttributeNode($element->attributes->item($k));
          } elseif (in_array($element->attributes->item($k)->nodeName, ['href', 'src', 'style', 'background', 'size'])) {
            $_keywords = ['javascript:', 'javascript.:', 'vbscript:', 'vbscript.:', ':expression'];
            $find = false;
            foreach ($_keywords as $a => $b) {
              if (false !== strpos(strtolower($element->attributes->item($k)->nodeValue), $b)) {
                $find = true;
              }
            }
            if ($find) {
              $element->removeAttributeNode($element->attributes->item($k));
            }
          }
        }
      }
    }
  }
  $html = substr($xml->saveHTML($xml->documentElement), 12, -14);
  $html = strip_tags($html, '<' . implode('><', array_keys($elements)) . '>');
  return $html;
}

/**
 * 支付宝测试
 */
function alipay($post, $notify_url, $return_url, $ishtml = false)
{
  $config = Config('alipay');
  // $deal = new GeeDeal();
  $arr = [
    'app_id' => $config['app_id'],
    'merchant_private_key' => $config['merchant_private_key'],
    'notify_url' => $notify_url,
    'return_url' => $return_url,
    'charset' => $config['charset'],
    'sign_type' => $config['sign_type'],
    'gatewayUrl' => $config['gatewayUrl'],
    'alipay_public_key' => $config['alipay_public_key'],
  ];
  vendor('alipay.AlipayTradeService');
  vendor('alipay.AlipayTradePagePayContentBuilder');
  $out_trade_no = trim($post['trade_no']);
  $subject = trim($post['subject']);
  $total_amount = trim($post['total_amount']);
  $body = trim($post['body']);
  $payRequestBuilder = new \AlipayTradePagePayContentBuilder();
  $payRequestBuilder->setBody($body);
  $payRequestBuilder->setSubject($subject);
  $payRequestBuilder->setTotalAmount($total_amount);
  $payRequestBuilder->setOutTradeNo($out_trade_no);
  $aop = new \AlipayTradeService($arr);
  $response = $aop->pagePay($payRequestBuilder, $arr['return_url'], $arr['notify_url']);
  if ($ishtml) {
    // dump($response);
    return $response;
  } else {
    var_dump($response);
  }
}

/**
 * 风格时间
 * @param int $time 开始时间,结束时间
 */
function statistics_time($time = array(), $type = null)
{
  if ($type == 'hour') {
    $stimestamp = strtotime($time['start_time']);
    $etimestime = strtotime($time['end_time']);
    //计算日期段内有多少小时
    $days = ($etimestime - $stimestamp) / 3600 + 1;
    //保存每天日期
    $date = array();
    /* for循环本周一到周日 */
    for ($i = 0; $i < $days; $i++) {
      $date[] = date("Y-m-d H", $stimestamp + (3600 * $i));
    }
  } else {
    $stimestamp = strtotime($time['start_time']);
    $etimestime = strtotime($time['end_time']);
    //计算日期段内有多少天
    $days = ($etimestime - $stimestamp) / 86400 + 1;
    //保存每天日期
    $date = array();
    /* for循环本周一到周日 */
    for ($i = 0; $i < $days; $i++) {
      $date[] = date("Y-m-d", $stimestamp + (86400 * $i));
    }
  }
  return $date;
}
/**
 * hideStar 用户名、邮箱、手机账号中间字符串以*隐藏
 */
function hideStar($str)
{
  if (strpos($str, '@')) {
    $email_array = explode("@", $str);
    $prevfix = (strlen($email_array[0]) < 4) ? "" : substr($str, 0, 3);
    $count = 0;
    $str = preg_replace('/([\d\w+_-]{0,100})@/', '********@', $str, -1, $count);
    $rs = $prevfix . $str;
  } else {
    $pattern = '/(1[0-9]{1}[0-9])[0-9]{4}([0-9]{4})/i';
    if (preg_match($pattern, $str)) {
      $rs = preg_replace($pattern, '$1****$2', $str);
    } else {
      $rs = substr($str, 0, 3) . "***" . substr($str, -1);
    }
  }
  return $rs;
}

/**
 * 获取微信操作对象（单例模式）
 * @staticvar array $wechat 静态对象缓存对象
 * @param type $type 接口名称 ( Card|Custom|Device|Extend|Media|Oauth|Pay|Receive|Script|User ) 
 * @return \Wehcat\WechatReceive 返回接口对接
 */
function &load_wechat($type = '')
{
  static $wechat = array();
  $index = md5(strtolower($type));
  if (!isset($wechat[$index])) {
    // 定义微信公众号配置参数（这里是可以从数据库读取的哦）
    $options = array(
      'token'           => '', // 填写你设定的key
      'appid'           => config('wxpay.appid'), // 填写高级调用功能的app id, 请在微信开发模式后台查询
      'appsecret'       => config('wxpay.appsecret'), // 填写高级调用功能的密钥
      'encodingaeskey'  => '', // 填写加密用的EncodingAESKey（可选，接口传输选择加密时必需）
      'mch_id'          => config('wxpay.mchid'), // 微信支付，商户ID（可选）
      'partnerkey'      => config('wxpay.key'), // 微信支付，密钥（可选）
      'ssl_cer'         => '', // 微信支付，双向证书（可选，操作退款或打款时必需）
      'ssl_key'         => '', // 微信支付，双向证书（可选，操作退款或打款时必需）
      'cachepath'       => '', // 设置SDK缓存目录（可选，默认位置在Wechat/Cache下，请保证写权限）
    );
    \Wechat\Loader::config($options);
    $wechat[$index] = \Wechat\Loader::get($type);
  }
  return $wechat[$index];
}

function guestbook($tempId, $params)
{
  //此处模拟前端表单ajax提交
  $openid = session('_userInfo')['openid'];
  // $time_str = strtotime(date("Y-m-d 0:0:0", time()));
  //提交成功，触发信息推送
  $data = [
    'touser' => $openid,
    'template_id' => $tempId,
    'url' => "http://" . $_SERVER['SERVER_NAME'],
    'topcolor' => "#333",
    'data' => $params
  ];

  $get_all_access_token = get_all_access_token();

  $json_data = json_encode($data); //转化成json数组让微信可以接收
  $url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" . $get_all_access_token; //模板消息请求URL

  $res = https_request($url, urldecode($json_data)); //请求开始
  $res = json_decode($res, true);

  return $res;

  if ($res['errcode'] == 0 && $res['errcode'] == "ok") {
    return ['code' => 1];
  } else {
    return ['code' => -4];
  }
}

function https_request($url, $data = null)
{
  $curl = curl_init();
  curl_setopt($curl, CURLOPT_URL, $url);
  curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
  curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
  if (!empty($data)) {
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
  }
  curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
  $output = curl_exec($curl);
  curl_close($curl);
  return $output;
}

function get_all_access_token()
{
  $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . config('wxpay.appid') . '&secret=' . config('wxpay.appsecret');
  $res = https_request($url);
  $access_token = json_decode($res, true)['access_token'];
  return $access_token;
}




if (!function_exists('copydirs')) {

  /**
   * 复制文件夹
   * @param string $source 源文件夹
   * @param string $dest   目标文件夹
   */
  function copydirs($source, $dest)
  {
    //保存记录
    static $fileslog = array();

    if (!is_dir($dest)) {
      mkdir($dest, 0755, true);
    }
    foreach ($iterator = new RecursiveIteratorIterator(
      new RecursiveDirectoryIterator($source, RecursiveDirectoryIterator::SKIP_DOTS),
      RecursiveIteratorIterator::SELF_FIRST
    ) as $item) {
      if ($item->isDir()) {
        $sontDir = $dest . DS . $iterator->getSubPathName();
        if (!is_dir($sontDir)) {
          mkdir($sontDir, 0755, true);
        }
      } else {
        copy($item, $dest . DS . $iterator->getSubPathName());
        $fileslog[] = $dest . DS . $iterator->getSubPathName();
      }
    }

    return $fileslog;
  }
}

if (!function_exists('rmdirs')) {

  /**
   * 删除文件夹
   * @param string $dirname  目录
   * @param bool   $withself 是否删除自身
   * @return boolean
   */
  function rmdirs($dirname, $withself = true)
  {
    if (!is_dir($dirname)) {
      return false;
    }
    $files = new RecursiveIteratorIterator(
      new RecursiveDirectoryIterator($dirname, RecursiveDirectoryIterator::SKIP_DOTS),
      RecursiveIteratorIterator::CHILD_FIRST
    );

    foreach ($files as $fileinfo) {
      $todo = ($fileinfo->isDir() ? 'rmdir' : 'unlink');
      $todo($fileinfo->getRealPath());
    }
    if ($withself) {
      @rmdir($dirname);
    }
    return true;
  }
}

if (!function_exists('setconfig')) {

  /**
   * 修改config的函数
   * @param $arr1 配置前缀
   * @param $arr2 数据变量
   * @return bool 返回状态
   */
  function setconfig($pat, $rep)
  {
    /**仅支持二维数组
     * 原理就是 打开config配置文件 然后使用正则查找替换 然后在保存文件.
     * 传递的参数为2个数组 前面的为配置 后面的为数值.  正则的匹配为单引号
     * setconfig(['geecp','version'],['1.0.2']);
     *
     */
    if (is_array($pat) && is_array($rep)) {
      $pats[0] = '/\'' . $pat[0] . '\'\s*\[?([\s\S]+)\'' . $pat[1] . '\'\s*=>\'?(.*)\'?/';
      if ($rep[0] == "true" || $rep[0] == "false") {
        $reps[0] = "'" . $pat[0] . "'" . "$1'$pat[1]' => " . $rep[0] . ",";
      } else {
        $reps[0] = "'" . $pat[0] . "'" . "$1'$pat[1]' => " . "'" . $rep[0] . "',";
      }

      $fileurl = APP_PATH . "config.php";
      ksort($pats);
      ksort($reps);
      $string = file_get_contents($fileurl); //加载配置文件

      $string = preg_replace($pats, $reps, $string);

      // 正则查找然后替换
      file_put_contents($fileurl, $string); // 写入配置文件
      return true;
    } else {
      return false;
    }
  }
}

if (!function_exists('diffDate')) {
  /**

   * 计算两个时间戳之间相差的日时分秒

   * @param $date1 开始时间

   * @param $date2 结束时间

   * @return array

   */
  function diffDate($date1, $date2)
  {
    $datetime1 = new \DateTime($date1);
    $datetime2 = new \DateTime($date2);
    $interval = $datetime1->diff($datetime2);
    $time['year'] = $interval->format('%Y');
    $time['month'] = $interval->format('%m');
    $time['day'] = $interval->format('%d');
    $time['hour'] = $interval->format('%H');
    $time['min'] = $interval->format('%i');
    $time['sec'] = $interval->format('%s');
    $time['days'] = $interval->format('%a'); // 两个时间相差总天数
    return $time;
  }
}

if (!function_exists('checkauth')) {
  /**
   * @param string $accesskey ask钥匙
   * @param array $param 授权域名domainName,授权ip ipAdressip,安装目录runningDirectory
   * @return array|bool
   */
  function checkauth($accesskey = "", $param = [])
  {
    $url = config("geecp.auth_url") . config("geecp.auth_api")['authorized-purchase-api-doModById'];

    $param['accessKey'] = $accesskey;
    $param['domainName'] = $_SERVER['HTTP_HOST'];
    $param['ipAdress'] = gethostbyname($_SERVER['HTTP_HOST']);
    $param['runningDirectory'] = ROOT_PATH;

    $res = json_decode(\gee\Http::post($url, $param), true);

    $result = [];

    if ($res['retHead']['code'] != '0000000') {
      $result['status'] = $res['retHead']['code'];
      $result['msg'] = $res['retHead']['message'];
      $result['url'] = $res['retBody']['url'];
      return $result;
    } else {
      return true;
    }
  }
}

if (!function_exists('get_auth_ask')) {

  /**获取授权accesskey
   * @param string $id 用户id
   * @return array|bool
   */
  function get_auth_ask($id = '')
  {
    $url = config("geecp.auth_url") . config("geecp.auth_api")['authorized-purchase-api-doModById'];

    $param['accessKey'] = $id;
    $param['type'] = 'update';
    // $param['domainName'] = $_SERVER['HTTP_HOST'];
    // $param['ipAdress'] = gethostbyname($_SERVER['HTTP_HOST']);
    // dump($url);
    // dump($param);
    $res = json_decode(\gee\Http::post($url, $param), true);
    // $res = json_decode(send($url, $param, 'POST', array("Content-type: application/json;charset=UTF-8")),true);

    $result = [];
    // dump($res);
    if ($res['retHead']['code'] != '0000000') {
      $result['status'] = $res['retHead']['code'];
      $result['msg'] = $res['retHead']['message'];
      $result['url'] = $res['retBody']['url'];
      return $result;
    } else {
      return true;
    }
  }
}
