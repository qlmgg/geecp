<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\controller;

use app\manager\model\GeeAnnexconfig; // 请求类
use app\manager\model\GeeEmailconfig; //系统SMTP邮件配置表
use app\manager\model\GeeLog; //系统日志表
use app\manager\model\GeeMsglog; // 消息日志表
use app\manager\model\GeeMsgmodel; // 短信API信息表
use app\manager\model\GeePicture; //消息模板表
use app\manager\model\GeeRoute; //图片表
use app\manager\model\GeeSmsapi; // 管理路由表
use app\manager\model\GeeV2mroute; // v2管理路由表
use app\manager\model\GeeWebbasic; // 控制路由表
use BaiduBce\Services\Bos\BosClient; // 百度云存储库
use BaiduBce\Services\Bos\BosOptions; // 百度云存储库
use phpmailer\phpmailer; // 文件表
use tegic\qiniu\Qiniu; // 七牛库
use think\Controller; // 基本信息表
use think\Request;
use think\Config;

// 消息模板表
// 附件设置表

/**
 * 前置操作
 */
class Common extends Controller
{
  protected $_adminInfo;
  /**
   * 前置操作
   */
  public function _initialize()
  {
    $basic = new GeeWebbasic();
    //网站基本数据
    $basicInfo = $basic->where('id = 1')->find();
    $this->_basicInfo = $basicInfo;
    $this->assign("basicInfo", $basicInfo);
    session('_basicInfo', $basicInfo);

    $file_path = ROOT_PATH . DS . "/public/v.txt";
    if (file_exists($file_path)) {
      $vt = file_get_contents($file_path); //将整个文件内容读入到一个字符串中
      $vt = str_replace("\r\n", "<br />", $vt);
    }

    if($vt != config('geecp.veversion')){
      setconfig(['geecp','version'],[$vt]);
    }

    try {
      if (isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {
        //JWT 数据
        $res = jwt_decode($_COOKIE['token']);
        $res = object_toArray($res);
        $this->_adminInfo = $res;
        $this->assign("admininfo", $res['jti']);
        session('_adminInfo', $res['jti']);
        //路由数据
        $route = new GeeV2mroute();
        // dump($_SERVER['REQUEST_URI']);
        $sruri = strpos($_SERVER['REQUEST_URI'], '?') ? strstr($_SERVER['REQUEST_URI'], '?', true) : $_SERVER['REQUEST_URI'];
        $showname = str_replace('.html', '', str_replace('/manager/v2', '', $sruri));
        $show = $route->where('name = "' . $showname . '"')->find();
        // dump($showname);
        //展示型路由进行路由匹配查询
        if ($show['is_show'] == '1' || !!$show['s_id'] || !!strpos($showname, 'index') || !!strpos($showname, 'list')) {
          $startRoute = $route->where('`f_id` = 0 and `is_show` = "1"')->order('id asc')->select();
          toArray($startRoute);
          $this->assign("startRoute", $startRoute);
          //当前路由数据
          $redirectUrl = $sruri;
          foreach ($startRoute as $key => $var) {
            if (vali_data('url', $var['code'])) {
              $varCode = $var['code'];
            } else {
              $varCode = '/manager/v2/' . $var['code'];
            }
            // dump($var);
            if (strstr($redirectUrl, $varCode) !== false) {
              $nowStart = $var;
              $routeRes = routeAnalysis($var['id']);
              foreach ($routeRes as $k => $v) {
                $nowStart['child'][$k] = $v;
                if ($redirectUrl === $varCode . '/' . $v['code'] || $redirectUrl === $varCode . '/' . $v['code'] . '.html' || $v['id'] === $show['s_id']) {
                  $nowStart['child'][$k]['checked'] = true;
                }
              }
              break;
            }
          }
          // $this->assign("topRoute", $topRoute);
          if ($nowStart) {
            $this->assign("nowStart", $nowStart);
          }
        }
      } else {
        return $this->redirect('manager/Login/index');
      }
    } catch (\Firebase\JWT\ExpiredException $e) {
      // dump($e);
      return $this->redirect('manager/Login/index');
    }
  }

  /**
   * @name 公共单图上传
   */
  public function uploadimg()
  {
    $file = request()->file('file');
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];
    $annex = new GeeAnnexconfig();
    $annexConfig = $annex->where('id = 1')->find();
    $picture = new GeePicture();
    $filetypes = array('png', 'jpg', 'jpeg', 'gif', 'mp4', 'mp3', 'zip', 'rar');
    $contType = array('image/png', 'image/jpeg', 'image/jpeg', 'image/gif', 'video/mp4', 'audio/mpeg', 'application/zip', 'application/x-rar');
    $bosoption = [
      BosOptions::CONTENT_TYPE => $file->getInfo()['type']
    ];
    // dump($bosoption);
    // dump($file->getInfo()['type']);
    // return;
    if (!in_array(trim(strrchr($file->getInfo()['type'], '/'), '/'), $filetypes) || filesize($file->getInfo()['tmp_name']) > 1024 * 1024 * 4) {
      $ret['status'] = 422;
      $ret['msg'] = '上传失败；文件格式或文件大小不符合规范';
      return json($ret);
    }
    if ($annexConfig) {
      if ($annexConfig['type'] == 'ftp') {

        return;
      } elseif ($annexConfig['type'] == 'bos') {
        $BOS_TEST_CONFIG = [
          'credentials' => [
            'accessKeyId' => $annexConfig['bos_ak'],
            'secretAccessKey' => $annexConfig['bos_sk'],
          ],
          'endpoint' => $annexConfig['bos_domain'],
        ];
        $client = new BosClient($BOS_TEST_CONFIG);
        $bucketName = '';

        $fileurl = file_get_contents($file->getInfo()['tmp_name']);
        $filenames = time() . rand(0, 999999) . '.' . trim(strrchr($file->getInfo()['type'], '/'), '/');
        $url = $client->putObjectFromString($bucketName, $filenames, $fileurl, $bosoption);
        $resurl = $annexConfig['bos_domain'] . '/' . $filenames;
        $data['url'] = $resurl;
        $data['sha1'] = '';
        $data['md5'] = '';
        $picture->save($data);
        $ret['data'] = $resurl;
        $ret['state'] = "SUCCESS";
        $ret['url'] = $resurl;
        $ret['title'] = $filenames;
        $ret['original'] = '';
        $ret['type'] = '';
        $ret['size'] = '';

        return json($ret);
      } elseif ($annexConfig['type'] == 'qiniu') {
        $qiniu = new Qiniu($annexConfig['qiniu_ak'], $annexConfig['qiniu_sk'], $annexConfig['qiniu_bucket']);
        $res = $qiniu->upload();
        if ($res) {
          $resurl = $annexConfig['qiniu_domain'] . '/' . $res;
          $data['url'] = $resurl;
          $data['sha1'] = '';
          $data['md5'] = '';
          $picture->save($data);
          $ret['data'] = $resurl;
          $ret['state'] = "SUCCESS";
          $ret['url'] = $resurl;
          $ret['title'] = $res;
          $ret['original'] = '';
          $ret['type'] = '';
          $ret['size'] = '';
        } else {
          $ret['status'] = 422;
          $ret['msg'] = '上传失败；' . $res;
        }
        // dump($resurl);
        return json($ret);
      } elseif ($annexConfig['type'] == 'oss') {

        return;
      }
    }
    // 移动到框架应用根目录/public/uploads/ 目录下
    $info = $file->rule('uniqid')->move(ROOT_PATH . 'public/uploads/' . date("Ymd"));
    if ($info) {
      $data['url'] = '/uploads/' . date("Ymd") . '/' . $info->getSaveName();
      $data['sha1'] = $info->hash('sha1');
      $data['md5'] = $info->hash('md5');
      $picture->save($data);
      // 成功上传后 获取上传信息
      $ret['data'] = '/uploads/' . date("Ymd") . '/' . $info->getSaveName();
    } else {
      $ret['status'] = 422;
      $ret['msg'] = $file->getError();
    }
    $ret['state'] = "SUCCESS";
    $ret['url'] = $ret['data'];
    $ret['title'] = $info->getSaveName();
    $ret['original'] = '';
    $ret['type'] = '';
    $ret['size'] = '';
    return json($ret);
  }
  /**
   * @name 解析邮件模板
   */
  public function sendEmail()
  {
    $id = $_GET['tempId'];
    //获取消息模板
    $temp = new GeeMsgmodel();
    $tempInfo = $temp->where('id = ' . $id)->find();
    $title = $tempInfo['name'];
    $content = $tempInfo['content'];

    //获取基本信息可使用变量配置
    $basic = new GeeWebbasic();
    $basicInfo = $basic->where('id = 1')->field('name,email,url,logo,icp,beian,idc,isp')->find();
    // dump($basicInfo);
    $basicInfo = $basicInfo->toArray();
    //转义变量内容
    foreach ($basicInfo as $k => $v) {
      if ($k == 'logo') {
        $content = str_replace("{basic_" . $k . "}", $v, $content);
      } else {
        $content = str_replace("{basic_" . $k . "}", $v, $content);
      }
    }

    //邮件随机验证码
    $emailCode = mt_rand(100000, 999999);
    //转义邮件随机验证码
    $content = str_replace("{email_code}", $emailCode, $content);
    session('emailCode', $emailCode);

    //短信随机验证码
    $smsCode = mt_rand(100000, 999999);
    //转义短信随机验证码
    $content = str_replace("{sms_code}", $smsCode, $content);
    session('smsCode', $smsCode);

    // dump($basicInfo);
    // dump($content);
    // exit;
    $res = sendEmail(['email' => $_GET['get'], 'title' => $title, 'content' => $content]);
    // dump($res);
    return $res;
  }

  /**
   * @name 解析消息模板
   */
  public function sendMessage()
  {
    $data = $_POST;
    //获取消息模板
    $temp = new GeeMsgmodel();
    $mlog = new GeeMsglog();
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];
    parseMsgPublic([
      'mark' => $data['mark'],
      'to' => $data['to'],
      'params' => json_decode($data['params'], true),
    ]);
    return json_encode($ret);
  }
}
