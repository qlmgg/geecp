<?php
namespace app\index\controller;

use app\index\model\GeeWebroute;
use app\manager\model\GeeAnnexconfig; // 请求类
use app\manager\model\GeeEmailconfig; //验证函数类库
use app\manager\model\GeeLog; //SMTP邮件类库
use app\manager\model\GeeMsgmodel; //七牛云存储类库
use app\manager\model\GeePicture; //百度云存储类库
use app\manager\model\GeeProductType; // 日志表
use app\manager\model\GeeUser; // 文件表
use app\manager\model\GeeWebbasic; // 系统SMTP邮件配置表
use BaiduBce\Services\Bos\BosClient; // 基本信息表
use phpmailer\phpmailer; // 消息模板表
use tegic\qiniu\Qiniu; // 附件设置表
use think\Controller; // 用户表
use think\Request; // 前台路由表
// 产品类型表

/**
 * 前置操作
 */
class Common extends Controller
{
    protected $_userInfo;

    // public function __construct(Request $request)
    // {
        // config('template.view_path', $request->module());
        // parent::__construct($request);
    // }

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
        
        if (isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {
            $user = new GeeUser();
            //JWT 数据
            $res = jwt_decode($_COOKIE['token']);
            $res = object_toArray($res);
            $res = $user->where('id = ' . $res['jti']['user_id'])->find();
            $this->_userInfo = $res;
            $this->assign("userinfo", $res);
            session('_userInfo', $res);
            // dump($res);

            if (!$res) {
                return $this->redirect('index/Login/index');
            }

            //路由数据
            $protype = new GeeProductType();
            $route = new GeeWebroute();
            $sruri = strpos($_SERVER['REQUEST_URI'],'?')?strstr($_SERVER['REQUEST_URI'],'?',true):$_SERVER['REQUEST_URI'];
            $redirectUrl = $sruri;
            $nowredirectUrl = explode('/', explode('.', $redirectUrl)[0]);
            $showname = str_replace('.html','',str_replace('/console','',$redirectUrl));
            $showname = $showname == '' ? '/index':$showname;
            $show = $route->where('`name` = "'.$showname.'"')->find();
            // dump($showname);
            // dump($show);
            $this->assign('nowShow',$show);
            if($show['is_show'] == '1' || !!$show['s_id'] || !!strpos($showname, 'index') || !!strpos($showname, 'list')){
              //产品路由分类
              $typelist = $protype->order('id')->select();
              $routelist = array();
              foreach ($typelist as $k => $v) {
                  $routes = $route->where('`f_id` = 0 and `is_pro` = ' . $v['id'])->where('is_show = "1" and status="1"')->order('id')->select();
                  $typelist[$k]['child'] = array();
                  $child = [];
                  foreach ($routes as $key => $var) {
                      $child[$key] = array();
                      $child[$key] = $var;
                  }
                  $typelist[$k]['child'] = $child;
              }
              $this->assign('webroutelist', $typelist);
              //当前路由父级模块
              $startRoute1 = $route->order('id')->select();
              $nowRoutes = $route->where('code = "' . $nowredirectUrl[count($nowredirectUrl) - 1] . '"')->find();
              if ($nowRoutes['s_id']) {
                  $srinfo = $route->where('id = ' . $nowRoutes['s_id'])->find();
                  $this->assign('srinfo', $srinfo);
                  // dump($nowRoutes);
              }
              $nowStart = $this->nowRoute($startRoute1, $redirectUrl);
              if ($nowStart['f_id'] != 0) {
                  $topRoute = $route->where('id = ' . $nowStart['f_id'])->where('is_show = "1" and status="1"')->find();
              } else {
                  $topRoute = $nowStart;
              }
              $this->assign("topRoute", $topRoute);
              //路由集合
              $r_lists = $this->routeList();
              $this->assign("r_lists", $r_lists);
              if ($nowStart) {
                  $this->assign("nowStart", $nowStart);
                  // dump($nowStart);
              }
            }
            // dump(passToHash('111111'));
        } elseif(strpos(request()->url(),'wxpay') !== false){
          // return true;
        } else {
          $request = Request::instance();
          $domain = $request->domain().$request->url();
            return $this->redirect('index/Login/index',['redirect'=>$domain]);
        }
    }

    /**
     * 整合路由
     */
    public function routeList($fid = 0)
    {
        $route = new GeeWebroute();
        $routes = $route->where(' f_id = ' . $fid)->where('is_show = "1" and status = "1"')->order('id')->select();
        $routes = list_toArray($routes);
        foreach ($routes as $key => $var) {
            $routes[$key]['child'] = [];
            $routes[$key]['child'] = $this->routeList($var['id']);
        }
        return $routes;
    }

    /**
     * 获取当前路由
     */
    public function nowRoute($startRoute1, $redirectUrl)
    {
        $route = new GeeWebroute();
        foreach ($startRoute1 as $key => $var) {
            if (vali_data('url', $var['code'])) {
                $varCode = $var['code'];
            } else {
                $varCode = '/' . $var['code'];
            }
            // dump(strstr($redirectUrl,$varCode.'/'));

            if (strstr($redirectUrl, $varCode . '/') !== false) {
                $nowStart = $var;
                $routeRes = routeAnalysis($var['id']);
                foreach ($routeRes as $k => $v) {
                    if ($redirectUrl === $varCode . '/' . $v['code'] || $redirectUrl === $varCode . '/' . $v['code'] . '.html') {
                        $nowStart['child'] = $v;
                    }
                }
            }
        }
        // dump($nowStart);

        return $nowStart;
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
        $filetypes = array('png', 'jpg', 'jpeg', 'gif');
        if (!in_array(trim(strrchr($file->getInfo()['type'], '/'), '/'), $filetypes) || filesize($file->getInfo()['tmp_name']) > 1024 * 1024 * 2) {
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
                $url = $client->putObjectFromString($bucketName, $filenames, $fileurl);
                $resurl = $annexConfig['bos_domain'] . '/' . $filenames;
                $data['url'] = $resurl;
                $data['sha1'] = '';
                $data['md5'] = '';
                $picture->save($data);
                $ret['data'] = $resurl;

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
        return json($ret);
    }
    // /**
    //  * @name 解析邮件模板
    //  */
    // public function sendEmail()
    // {
    //     $id = $_GET['tempId'];
    //     //获取消息模板
    //     $temp = new GeeMsgmodel();
    //     $tempInfo = $temp->where('id = ' . $id)->find();
    //     $title = $tempInfo['name'];
    //     $content = $tempInfo['content'];

    //     //获取基本信息可使用变量配置
    //     $basic = new GeeWebbasic();
    //     $basicInfo = $basic->where('id = 1')->field('name,email,url,logo,icp,beian,idc,isp')->find();
    //     $basicInfo = $basicInfo->toArray();
    //     //转义变量内容
    //     foreach ($basicInfo as $k => $v) {
    //         if ($k == 'logo') {
    //             $content = str_replace("{basic_" . $k . "}", $v, $content);
    //         } else {
    //             $content = str_replace("{basic_" . $k . "}", $v, $content);
    //         }
    //     }

    //     //邮件随机验证码
    //     $emailCode = mt_rand(100000, 999999);
    //     //转义邮件随机验证码
    //     $content = str_replace("{email_code}", $emailCode, $content);
    //     session('emailCode', $emailCode);

    //     //短信随机验证码
    //     $smsCode = mt_rand(100000, 999999);
    //     //转义短信随机验证码
    //     $content = str_replace("{sms_code}", $smsCode, $content);
    //     session('smsCode', $smsCode);

    //     // dump($basicInfo);
    //     // dump($content);
    //     // exit;
    //     $res = sendEmail(['email' => 'xiao.song@qiduo.net', 'title' => $title, 'content' => $content]);
    //     // dump($res);
    //     return $res;
    // }

}
