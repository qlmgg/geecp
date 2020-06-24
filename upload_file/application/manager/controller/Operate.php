<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * nc: ylsq
 */

namespace app\manager\controller;

use app\manager\controller\Common; // 前置操作
use app\manager\model\GeeLog;
use app\manager\model\GeeOperateBanner; //
use think\Controller;

class Operate extends Common
{
    public function index()
    {
        return $this->redirect('manager/Operate/banner');
    }
    function banner() {
        $ob = new GeeOperateBanner();
        $list = $ob->order('sort desc, id desc')->select();
        $this->assign('list', $list);
        return $this->fetch('Operate/banner');
    }
    public function banneradd()
    {
        $ob = new GeeOperateBanner();
        if ($_GET['id']) {
            $obInfo = $ob->where('id = ' . $_GET['id'])->find();
        }
        $this->assign('info', $obInfo);
        return $this->fetch('Operate/banneradd');
    }
    public function banneraddauth()
    {
        $log = new GeeLog();
        $ob = new GeeOperateBanner();
        $ainfo = session('_adminInfo');
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        
        $id = $data['id'];
        unset($data['id']);
        unset($data['file']);
        if (!isset($data['url']) || empty($data['url'])) {
            $ret['status'] = 422;
            $ret['msg'] = '轮播图图片提交有误！';
            return json_encode($ret);
        }
        if ($data['status'] != 0 && $data['status'] != 1) {
            $ret['status'] = 422;
            $ret['msg'] = '轮播图状态提交有误！';
            return json_encode($ret);
        }
        
        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $obcres = $ob->save($data, $w);
            if ($obcres) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 修改了轮播图ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $obcres = $ob->save($data);
            if ($obcres) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 添加了轮播图ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
        return json_encode($ret);
    }
    public function bannerdel()
    {
        $ob = new GeeOperateBanner();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if (request()->isDelete()) {
            $log = new GeeLog();
            $id = request()->param()['id'];
            $delob = $ob->where('id = ' . $id)->delete();
            if ($delob) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 删除了轮播图ID ' . $id,
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
    function class ()
    {
        $nc = new GeeNewsclass();
        $list = $nc->order('id desc')->select();
        $this->assign('list', $list);
        return $this->fetch('News/class');
    }
    public function addclass()
    {
        $nc = new GeeNewsclass();
        if ($_GET['id']) {
            $ncInfo = $nc->where('id = ' . $_GET['id'])->find();
        }
        $this->assign('info', $ncInfo);
        return $this->fetch('News/addclass');
    }
    public function addclassauth()
    {
        $log = new GeeLog();
        $nc = new GeeNewsclass();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];

        $id = $data['id'];
        unset($data['id']);
        if (!isset($data['name']) || empty($data['name'])) {
            $ret['status'] = 422;
            $ret['msg'] = '分类名称提交有误！';
            return json_encode($ret);
        }
        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $ncres = $nc->save($data, $w);
            if ($ncres) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 修改了新闻分类ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $ncres = $nc->save($data);
            if ($ncres) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 添加了新闻分类ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
        return json_encode($ret);
    }
    public function delclass()
    {
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if (request()->isDelete()) {
            $nc = new GeeNewsclass();
            $log = new GeeLog();
            $id = request()->param()['id'];
            $delnc = $nc->where('id = ' . $id)->delete();
            if ($delnc) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 删除了新闻分类ID ' . $id,
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

}
