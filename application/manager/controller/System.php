<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\controller;

use app\manager\controller\Common; // 前置操作
use app\manager\model\GeeAnnexconfig; // 请求类
use app\manager\model\GeeEmailconfig;
use app\manager\model\GeeLog; // 日志表
use app\manager\model\GeeMsgmodel; // 系统信息表
use app\manager\model\GeeSmsapi; // 系统SMTP邮件配置表
use app\manager\model\GeeWebbasic; // 消息模板表
use think\Cache; // 附件设置表
use think\Config;
use think\Controller;
use think\Request;
// 消息API表

class System extends Common
{
    public function index()
    {
        return $this->redirect('manager/System/basic');
    }
    public function basic()
    {
        $basic = new GeeWebbasic();
        $basicInfo = $basic->where('id = 1')->find();
        if ($basicInfo) {
            $this->assign('info', $basicInfo);
        }
        // dump($this->_adminInfo);
        return $this->fetch('System/basic');
    }
    //基础信息数据提交操作
    public function basicAuth()
    {
        $basic = new GeeWebbasic();
        $log = new GeeLog();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        //如果是修改基础信息
        if (isset($data['id']) && !empty($data['id'])) {
            $id = $data['id'];
            unset($data['id']);
            foreach ($data as $key => $var) {
                if (empty($var) && $var != '0') {
                    unset($data[$key]);
                }
            }
        }
        if (!isset($data['name']) || empty($data['name'])) {
            $ret['status'] = 422;
            $ret['msg'] = '网站名称提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['email']) || !vali_data('email', $data['email'])) {
            $ret['status'] = 422;
            $ret['msg'] = '联系邮箱提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['url']) || !vali_data('url', $data['url'])) {
            $ret['status'] = 422;
            $ret['msg'] = '网站首页域名提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['logo']) || empty($data['logo'])) {
            $ret['status'] = 422;
            $ret['msg'] = 'Logo提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['alipay_app_id']) || empty($data['alipay_app_id'])) {
            $ret['status'] = 422;
            $ret['msg'] = '支付宝商户ID提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['alipay_merchant_private_key']) || empty($data['alipay_merchant_private_key'])) {
            $ret['status'] = 422;
            $ret['msg'] = '支付宝商户私钥提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['alipay_alipay_public_key']) || empty($data['alipay_alipay_public_key'])) {
            $ret['status'] = 422;
            $ret['msg'] = '支付宝商户公钥提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['wxpay_img']) || empty($data['wxpay_img'])) {
            $ret['status'] = 422;
            $ret['msg'] = '微信公众号关注图提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['wxpay_appid']) || empty($data['wxpay_appid'])) {
            $ret['status'] = 422;
            $ret['msg'] = '微信公众号ID提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['wxpay_mchid']) || empty($data['wxpay_mchid'])) {
            $ret['status'] = 422;
            $ret['msg'] = '微信商户号提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['wxpay_appsecret']) || empty($data['wxpay_appsecret'])) {
            $ret['status'] = 422;
            $ret['msg'] = '微信公众号私钥提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['wxpay_key']) || empty($data['wxpay_key'])) {
            $ret['status'] = 422;
            $ret['msg'] = '微信商户支付秘钥提交有误！';
            return json_encode($ret);
        }
        

        unset($data['file']);
        setconfig(['alipay', 'app_id'], [$data['alipay_app_id']]);
        setconfig(['alipay', 'merchant_private_key'], [$data['alipay_merchant_private_key']]);
        setconfig(['alipay', 'alipay_public_key'], [$data['alipay_alipay_public_key']]);
        unset($data['alipay_app_id']);
        unset($data['alipay_merchant_private_key']);
        unset($data['alipay_alipay_public_key']);

        setconfig(['wxpay', 'img'], [$data['wxpay_img']]);
        unset($data['wxpay_img']);
        setconfig(['wxpay', 'appid'], [$data['wxpay_appid']]);
        unset($data['wxpay_appid']);
        setconfig(['wxpay', 'mchid'], [$data['wxpay_mchid']]);
        unset($data['wxpay_mchid']);
        setconfig(['wxpay', 'key'], [$data['wxpay_appsecret']]);
        unset($data['wxpay_appsecret']);
        setconfig(['wxpay', 'appsecret'], [$data['wxpay_key']]);
        unset($data['wxpay_key']);

        
        setconfig(['geecp', 'certification'], [$data['certification']]);
        unset($data['certification']);

        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $basicres = $basic->save($data, $w);
            if ($basicres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 修改了基本信息 ',
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $basicres = $basic->save($data);
            if ($basicres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 添加了基本信息 ',
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
    }
    public function email()
    {
        $email = new GeeEmailconfig();
        $emailInfo = $email->where('id = 1')->find();
        if ($emailInfo) {
            $this->assign('info', $emailInfo);
        }
        return $this->fetch('System/email');
    }
    //邮件配置数据提交操作
    public function emailAuth()
    {
        $email = new GeeEmailconfig();
        $log = new GeeLog();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        //如果是修改邮件配置
        if (isset($data['id']) && !empty($data['id'])) {
            $id = $data['id'];
            unset($data['id']);
            foreach ($data as $key => $var) {
                if (empty($var) && $var != '0') {
                    unset($data[$key]);
                }
            }
        }
        if (!isset($data['host']) || empty($data['host'])) {
            $ret['status'] = 422;
            $ret['msg'] = 'SMTP服务器提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['port']) || !vali_data('port', $data['port'])) {
            $ret['status'] = 422;
            $ret['msg'] = 'SMTP端口提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['username']) || empty($data['username'])) {
            $ret['status'] = 422;
            $ret['msg'] = 'SMTP用户名提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['password']) || empty($data['password'])) {
            $ret['status'] = 422;
            $ret['msg'] = 'SMTP密码提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['email']) || !vali_data('email', $data['email'])) {
            $ret['status'] = 422;
            $ret['msg'] = '发件人信箱提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['emailname']) || empty($data['emailname'])) {
            $ret['status'] = 422;
            $ret['msg'] = '发件人姓名提交有误！';
            return json_encode($ret);
        }
        unset($data['file']);
        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $emailres = $email->save($data, $w);
            if ($emailres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 修改了邮件配置 ',
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $emailres = $email->save($data);
            if ($emailres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 添加了邮件配置 ',
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
    }
    //消息API设置
    public function smsapi()
    {
        $sapi = new GeeSmsapi();
        $info = $sapi->where('id = 1')->find();
        $this->assign('info', $info);
        return $this->fetch('System/smsapi');
    }
    //修改消息api设置
    public function smsapiAuth()
    {
        $sapi = new GeeSmsapi();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];

        if (!isset($data['ak']) || empty($data['ak'])) {
            $ret['status'] = 422;
            $ret['msg'] = 'AK提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['signid']) || empty($data['signid'])) {
            $ret['status'] = 422;
            $ret['msg'] = '签名ID提交有误！';
            return json_encode($ret);
        }
        $has = $sapi->where('id = 1')->find();
        if ($has) {
            $sapi->where('id = 1')->update($data);
        } else {
            $data['id'] = 1;
            $sapi->save($data);
        }
        return json_encode($ret);
    }
    //消息模板列表
    public function template()
    {
        $template = new GeeMsgmodel();
        $templateList = $template->order('id desc')->select();
        $this->assign('list', $templateList);
        $this->assign('mlist',json_encode($templateList));
        // dump(json_encode($templateList));
        // dump($templateList);
        return $this->fetch('System/templatelist');
    }
    //消息模板添加页面
    public function addtemplate()
    {
        if ($_GET['id']) {
            $id = $_GET['id'];
            $template = new GeeMsgmodel();
            $templateInfo = $template->where('id = ' . $id)->find();
            $this->assign('info', $templateInfo);
        }
        return $this->fetch('System/addtemplate');
    }

    //消息模板提交操作
    public function addtemplateAuth()
    {
        $template = new GeeMsgmodel();
        $log = new GeeLog();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        //如果是修改消息模板
        if (isset($data['id']) && !empty($data['id'])) {
            $id = $data['id'];
            unset($data['id']);
            foreach ($data as $key => $var) {
                if (empty($var) && $var != '0') {
                    unset($data[$key]);
                }
            }
        } else {
            //如果是新增消息模板
            $hasTemplate = $template->where('mark = "' . $data['mark'] . '"')->find();
            if ($hasTemplate) {
                $ret['status'] = 422;
                $ret['msg'] = '模板标识已存在！';
                return json_encode($ret);
            }
        }
        if (!isset($data['mark']) || empty($data['mark'])) {
            $ret['status'] = 422;
            $ret['msg'] = '模板标识提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['name']) || empty($data['name'])) {
            $ret['status'] = 422;
            $ret['msg'] = '名称提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['content']) || empty($data['content'])) {
            $ret['status'] = 422;
            $ret['msg'] = '模板内容提交有误！';
            return json_encode($ret);
        }

        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $templateres = $template->save($data, $w);
            if ($templateres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 修改了消息模板 ' . $data['name'],
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $templateres = $template->save($data);
            if ($templateres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 添加了消息模板 ' . $data['name'],
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
    }

    //消息群发
    public function subMessaging(){
      $ret = [
        'status' => 200,
        'msg' => '操作成功',
        'data' => ''
      ];
      $data = $_POST;
      $mm = new GeeMsgmodel();
      // \think\Loader::import('PHPExcel.PHPExcel');
      vendor("PHPExcel.PHPExcel");
      $objPHPExcel = new \PHPExcel();
      $file = $_FILES['file'];
      if(!$file){
        $ret['status'] = 400;
        $ret['msg'] = '请上传接收人文件!';
        return json_encode($ret);
      }
      if(!$data['type']){
        $ret['status'] = 401;
        $ret['msg'] = '请选择发送类型!';
        return json_encode($ret);
      }
      if(!$data['model']){
        $ret['status'] = 402;
        $ret['msg'] = '请选择发送模板!';
        return json_encode($ret);
      }
      $mark = $mm->where('id = '.$data['model'])->value('mark');
      // dump($mark);
        //获取后缀名并改为小写
        $extension = strtolower(pathinfo($file['name'],PATHINFO_EXTENSION));
        //判断Excel版本
        if ($extension=='xlsx'){
            $readobj = \PHPExcel_IOFactory::createReader('excel2007');
        }else{
            $readobj = \PHPExcel_IOFactory::createReader('excel5');
        }
        //读取数据并处理
        $res = $readobj->load($file['tmp_name']);
        $arr = $res->getSheet(0)->toArray();
        // dump($arr);
        foreach($arr as &$v){
          if($v[0]){
            // dump($v[0]);
            
            $sres = parseMsgPublic([
              'mark' => $mark,
              'to' => $v[0],
              'params' => [],
            ]);
            $sres = json_decode($res,true);
            if($res['status'] != 200){
              $ret['status'] = $res['status'];
              $ret['msg'] = $res['msg'];
              return json_encode($ret);
            }
          }
        }
        return json_encode($ret);
      // dump($file);
      // dump($data);
    }

    //删除模板
    public function deltemplate()
    {
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if (request()->isDelete()) {
            $template = new GeeMsgmodel();
            $log = new GeeLog();
            $id = request()->param()['id'];
            $delTemplate = $template->where('id = ' . $id)->delete();
            if ($delTemplate) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 删除了消息模板ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
            }
        } else {
            $ret['status'] = 500;
            $ret['msg'] = '操作超时';
        }
        return json_encode($ret);
    }
    //禁用模板
    public function disatemplate()
    {
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if (request()->isPut()) {
            $template = new GeeMsgmodel();
            $log = new GeeLog();
            $id['id'] = request()->param()['id'];
            $disabledTemplate = $template->save(['status' => request()->param()['status']], $id);
            if ($disabledTemplate) {
                $saveInfo = [
                    'content' => request()->param()['status'] == '2' ? $this->_adminInfo['name'] . ' 禁用了消息模板ID ' . $id['id'] : $this->_adminInfo['name'] . ' 解禁了消息模板ID ' . $id['id'],
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
            }
        } else {
            $ret['status'] = 500;
            $ret['msg'] = '操作超时';
        }
        return json_encode($ret);
    }
    public function pay()
    {

        return $this->fetch('System/pay');
    }
    //附件设置
    public function annex()
    {
        $annex = new GeeAnnexconfig();
        $annexInfo = $annex->where('id = 1')->find();
        if ($annexInfo) {
            $this->assign('info', $annexInfo);
        }
        return $this->fetch('System/annex');
    }
    //附件设置数据提交操作
    public function annexAuth()
    {
        $annex = new GeeAnnexconfig();
        $log = new GeeLog();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        $data['id'] = 1;
        //如果是修改附件设置
        if (isset($data['id']) && !empty($data['id'])) {
            $id = $data['id'];
            unset($data['id']);
            foreach ($data as $key => $var) {
                if (empty($var) && $var != '0') {
                    unset($data[$key]);
                }
            }
        }
        if ($data['type'] == 'ftp') {
            if (!isset($data['ftp_sever']) || !vali_data('url', $data['ftp_sever'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'FTP服务器域名提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['ftp_name']) || empty($data['ftp_name'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'FTP账号提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['ftp_pwd']) || empty($data['ftp_pwd'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'FTP密码提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['ftp_port']) || empty($data['ftp_port'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'FTP端口号提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['ftp_timeout']) || empty($data['ftp_timeout'])) {
                $ret['status'] = 422;
                $ret['msg'] = '超时时间提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['ftp_remoteroor']) || empty($data['ftp_remoteroor'])) {
                $ret['status'] = 422;
                $ret['msg'] = '图片服务器根目录提交有误！';
                return json_encode($ret);
            }
        } elseif ($data['type'] == 'bos') {
            if (!isset($data['bos_ak']) || empty($data['bos_ak'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'AK提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['bos_sk']) || empty($data['bos_sk'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'SK提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['bos_bucket']) || empty($data['bos_bucket'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'Bucket提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['bos_domain']) || !vali_data('url', $data['bos_domain'])) {
                $ret['status'] = 422;
                $ret['msg'] = '绑定域名提交有误！';
                return json_encode($ret);
            }
        } elseif ($data['type'] == 'qiniu') {
            if (!isset($data['qiniu_ak']) || empty($data['qiniu_ak'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'AK提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['qiniu_sk']) || empty($data['qiniu_sk'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'SK提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['qiniu_bucket']) || empty($data['qiniu_bucket'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'Bucket提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['qiniu_domain']) || !vali_data('url', $data['qiniu_domain'])) {
                $ret['status'] = 422;
                $ret['msg'] = '绑定域名提交有误！';
                return json_encode($ret);
            }

        } elseif ($data['type'] == 'oss') {
            if (!isset($data['oss_ak']) || empty($data['oss_ak'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'AK提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['oss_sk']) || empty($data['oss_sk'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'SK提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['oss_bucket']) || empty($data['oss_bucket'])) {
                $ret['status'] = 422;
                $ret['msg'] = 'Bucket提交有误！';
                return json_encode($ret);
            }
            if (!isset($data['oss_domain']) || !vali_data('url', $data['oss_domain'])) {
                $ret['status'] = 422;
                $ret['msg'] = '绑定域名提交有误！';
                return json_encode($ret);
            }
        }
        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $annexres = $annex->save($data, $w);
            if ($annexres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 修改了附件设置 ',
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $annexres = $annex->save($data);
            if ($annexres) {
                $saveInfo = [
                    'content' => $this->_adminInfo['name'] . ' 添加了附件设置 ',
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
    }
    //前台可用模板列表
    public function model()
    {
        $dirList = $this->recurDir('./../public/template');
        foreach ($dirList as $k => $v) {
          if(is_file('./template/' . $v . '/config.json')){
            // 从文件中读取数据到PHP变量
            $config = file_get_contents('./template/' . $v . '/config.json');
            // 用参数true把JSON字符串强制转成PHP数组
            $info = json_decode($config, true);
            // dump($info);
            $dirinfo[] = [
                //模板名称
                'name' => $info['name'],
                //模板封面
                'cover' => is_file('./template/' . $v . '/cover.jpg') ? '/template/' . $v . '/cover.jpg' : '',
                //模板目录
                'src' => './public/template/' . $v,
                //模板类型 0:整站 1:代码块 默认整站
                'type' => 0,
                //模板简介
                'intro' => $info['intro'],
                //模板版本
                'version' => $info['version'],
                //模板作者
                'author' => $info['author'],
                //是否正在使用
                'is_use' => str_replace("/", "", Config('template.theme')) === $v,
            ];
          } else {
            continue;
          }
        }
        // dump($dirinfo);
        $this->assign('dirinfo', $dirinfo);
        return $this->fetch('System/model');
    }
    //应用模板
    public function usemodel()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if (!$data['tempname']) {
            $ret['status'] = 422;
            $ret['msg'] = '请选择您想要应用的模板!';
            return json_encode($ret);
        }
        setconfig(['template', 'theme'], [$data['tempname'] . '/']);
        setconfig(['view_replace_str', '__TEMP__'], ['/template/'.$data['tempname'].'/themes']);
        Cache::clear();
        $this->deldir(TEMP_PATH);
        // array_map( 'unlink', glob( TEMP_PATH.DS.'.php' ) );
        $log = new GeeLog();
        $saveInfo = [
            'content' => session('_adminInfo')['name'] . ' 应用了前台模板 ' . $data['tempname'],
            'ip' => get_ip(),
        ];
        $logres = $log->save($saveInfo);
        return json_encode($ret);
    }
    //卸载模板
    public function uninstallmodel()
    {
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if ($data['tempname'] === 'default') {
            $ret['status'] = 421;
            $ret['msg'] = '默认模板不能进行卸载!';
            return json_encode($ret);
        }
        if (!$data['tempname']) {
            $ret['status'] = 422;
            $ret['msg'] = '请选择您想要卸载的模板!';
            return json_encode($ret);
        }
        if (config('template.theme') === $data['tempname'] . '/') {
            $ret['status'] = 423;
            $ret['msg'] = '该模板正在使用中!请切换模板后再进行卸载';
            return json_encode($ret);
        }
        $this->deldir('./template/' . $data['tempname']);
        $log = new GeeLog();
        $saveInfo = [
            'content' => session('_adminInfo')['name'] . ' 卸载了前台模板 ' . $data['tempname'],
            'ip' => get_ip(),
        ];
        $logres = $log->save($saveInfo);
        return json_encode($ret);

    }
    /**
     * 获取路径下的一级目录
     * $pathName {String} 需要查找目录的路径
     */
    public function recurDir($pathName)
    {
        //将结果保存在result变量中
        $result = array();
        $temp = array();
        $calls = 0;
        //判断传入的变量是否是目录
        if (!is_dir($pathName) || !is_readable($pathName)) {
            return null;
        }
        //取出目录中的文件和子目录名,使用scandir函数
        $allFiles = scandir($pathName);
        unset($allFiles[0]);
        unset($allFiles[1]);
        return $allFiles;
    }

    /**
     * 删除指定文件夹以及文件夹下的所有文件
     * $dir {String} 需要删除目录的路径
     */
    public function deldir($dir)
    {
        //先删除目录下的文件：
        $dh = opendir($dir);
        while ($file = readdir($dh)) {
            if ($file != "." && $file != "..") {
                $fullpath = $dir . "/" . $file;
                if (!is_dir($fullpath)) {
                    unlink($fullpath);
                } else {
                    deldir($fullpath);
                }
            }
        }

        closedir($dh);
        //删除当前文件夹：
        if (rmdir($dir)) {
            return true;
        } else {
            return false;
        }
    }
}
