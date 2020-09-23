<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * nc: ylsq
 */

namespace app\manager\controller;

use app\manager\controller\Common; // 前置操作
use app\manager\model\GeeLog; // 请求类
use app\manager\model\GeeNews; //新闻表
use app\manager\model\GeeNewsclass; // 新闻分类表
use think\Controller;

class News extends Common
{
    public function index()
    {
        return $this->redirect('manager/News/list');
    }
    function list() {
        $n = new GeeNews();
        $list = $n->order('id desc')->select();
        $this->assign('list', $list);
        $test = $n->where('id = 2')->find();
        $this->assign('test', $test);
        return $this->fetch('News/list');
    }
    public function addnews()
    {
        $n = new GeeNews();
        $nc = new GeeNewsclass();
        if ($_GET['id']) {
            $nInfo = $n->where('id = ' . $_GET['id'])->find();
        }
        $nClass = $nc->order('id desc')->select();
        $this->assign('info', $nInfo);
        $this->assign('class', $nClass);
        return $this->fetch('News/addnews');
    }
    public function addnewsauth()
    {
        $log = new GeeLog();
        $n = new GeeNews();
        $nc = new GeeNewsclass();
        $ainfo = session('_adminInfo');
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        
        $id = $data['id'];
        unset($data['id']);
        if (!isset($data['title']) || empty($data['title'])) {
            $ret['status'] = 422;
            $ret['msg'] = '新闻标题提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['cover']) || empty($data['cover'])) {
            $ret['status'] = 422;
            $ret['msg'] = '新闻封面提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['class_id']) || empty($data['class_id'])) {
            $ret['status'] = 422;
            $ret['msg'] = '新闻分类提交有误！';
            return json_encode($ret);
        }
        if (!isset($data['cont']) || empty($data['cont'])) {
            $ret['status'] = 422;
            $ret['msg'] = '新闻内容提交有误！';
            return json_encode($ret);
        }
        if ($data['status'] != 0 && $data['status'] != 1) {
            $ret['status'] = 422;
            $ret['msg'] = '新闻状态提交有误！';
            return json_encode($ret);
        }
        unset($data['file']);
        
        if (isset($id) && !empty($id)) {
            $w['id'] = $id;
            $ncres = $n->save($data, $w);
            if ($ncres) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 修改了新闻ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        } else {
            $ncres = $n->save($data);
            if ($ncres) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 添加了新闻ID ' . $id,
                    'ip' => get_ip(),
                ];
                $logres = $log->save($saveInfo);
                return json_encode($ret);
            }
        }
        return json_encode($ret);
    }
    public function delnews()
    {
        $n = new GeeNews();
        $data = $_POST;
        $ret = [
            'status' => 200,
            'msg' => '操作成功',
            'data' => '',
        ];
        if (request()->isDelete()) {
            $log = new GeeLog();
            $id = request()->param()['id'];
            $deln = $n->where('id = ' . $id)->delete();
            if ($deln) {
                $saveInfo = [
                    'content' => session('_adminInfo')['name'] . ' 删除了新闻ID ' . $id,
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
