<?php
namespace app\index\controller;

use app\index\model\GeeUser; // 日志表
use app\manager\model\GeeWebbasic; // 员工表
use app\manager\model\GeeOperateBanner; //
use think\Controller;

// 基本信息表

class Home extends Controller
{
    protected $_userInfo;
    /**
     * 前置操作
     */
    public function _initialize()
    {
        //判定是否安装
        if (!sys_is_installed() && $this->request->module() != 'install') {
            return $this->redirect('/install/step1');
        }

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
        }
    }

    public function h_index()
    {
        $ob = new GeeOperateBanner();
        $banner = $ob->where('status = "1"')->select();
        $this->assign('banner',$banner);
        return $this->fetch('Home/index');
    }

    public function h_about()
    {
        return $this->fetch('Home/about');
    }

    public function h_activity()
    { 
        return $this->fetch('Home/activity_2020_02_19');
    }

    public function h_agent()
    {
        return $this->fetch('Home/agent');
    }

    public function h_cdn()
    {
        return $this->fetch('Home/cdn');
    }

    public function h_domain()
    {
        return $this->fetch('Home/domain');
    }

    public function h_ecs()
    {
        return $this->fetch('Home/ecs');
    }

    public function h_miss()
    {       
        return $this->fetch('Home/404');
    }

    public function h_host()
    {
        return $this->fetch('Home/host');
    }

    public function h_idc()
    {
        return $this->fetch('Home/idc');
    }

    public function h_ssl()
    {
        return $this->fetch('Home/ssl');
    }

    public function h_vps()
    {
        return $this->fetch('Home/vps');
    }
}
