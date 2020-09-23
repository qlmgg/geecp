<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\controller;

use app\manager\model\GeeAddons; // 插件表
use app\manager\model\GeeLog; // 日志表
use think\Config;
use ZipArchive;

// PHP自带zip解析
class Addons extends Common
{
    public $ret = [
        'status' => 200,
        'msg' => '操作成功',
        'data' => '',
    ];
    public function index()
    {
        return $this->redirect('manager/Addons/list');
    }
    public function list() {
        $addons = new GeeAddons();
        // dump(config('geecp.ak'));
        $data = ["accessKey" => config('geecp.ak')];
        $res = send(config('geecp.auth_url') . '/market/userApplication/queryList', $data, 'POST', array(
            "Content-type: application/json;charset=UTF-8",
        ));

        $res = json_decode($res, true);
        // dump($res);

        //从线上获取已购买应用列表

        //对比本地应用列表 存在即更新 不存在则添加

        // dump($res);
        if ($res['code'] === 200) {
            if (!empty($res['dataMap'])) {
                foreach ($res['dataMap'] as $k => $v) {
                    if ($addons->where('name = "' . $v['application']['applicationPlug']['code'] . '"')->find()) {
                        $addons->where('name = "' . $v['application']['applicationPlug']['code'] . '"')->update([
                            'range' => $v['application']['applicationPlug']['range'],
                            'config' => $v['application']['applicationPlug']['config'],
                            'license' => $v['application']['applicationSkuList'][0]['url'],
                            'version' => 'v1.0.1',
                        ]);
                    } else {
                        $newAddons = [
                            'name' => $v['application']['applicationPlug']['code'],
                            'author' => $v['application']['developer']['name'],
                            'range' => $v['application']['applicationPlug']['range'],
                            'config' => $v['application']['applicationPlug']['config'],
                            'title' => $v['application']['name'],
                            'introduce' => '',
                            'version' => 'v1.0.1',
                            'license' => $v['application']['applicationSkuList'][0]['url'],
                            'is_list' => 0,
                            'status' => 0,
                        ];
                        $addons->save($newAddons);
                    }
                    // dump($v);
                }
            } else {
                $this->assign('warning', '暂无购买插件');
            }
        } else {
            $this->assign('warning', $res['message']);
        }
        $list = $addons->select();
        $this->assign('list', $list);
        $this->assign('count', count($list));
        return $this->fetch('Addons/index');
    }

    public function install()
    {
        $data = $_GET;
        $addons = new GeeAddons();
        $log = new GeeLog();
        $item = $addons->where('id = ' . $data['id'])->find();
        $way = $item['name'];
        $range = $item['range'];
        //下载插件
        $url = $item['license'];
        $downres = json_decode(file_get_contents($url), true) ? json_decode(file_get_contents($url), true) : file_get_contents($url);
        // dump($downres);
        // return;
        if (isset($downres['code']) && $downres['code'] != 0) {
            $ret['status'] = 500;
            $ret['msg'] = $downres['msg'];
            return $ret;
        }
        $file = file_get_contents($url);
        file_put_contents(ROOT_PATH . 'public/uploads/plugs/' . $way . '.zip', $file);
        //解压插件
        $zip = new ZipArchive;
        $zipres = $zip->open(ROOT_PATH . 'public/uploads/plugs/' . $way . '.zip');
        if ($zipres === true) {
            //解压缩到test文件夹
            $zip->extractTo(ROOT_PATH);
            $zip->close();
        } else {
            $ret['status'] = 500;
            $ret['msg'] = 'failed, code:' . $zipres;
            return $ret;
        }
        // dump(ROOT_PATH);
        // exit;
        //引入addons 相关 range 的插件主控
        $path = ROOT_PATH . '/addons/' . $range . '/' . $range . '.php';
        include_once $path;
        $className = '\addons\\' . $range . '\\' . $range;
        $plug = new $className();
        //执行插件中的安装操作
        $res = $plug->install($way);
        $addons->where('id = ' . $data['id'])->update(['status' => 2]);

        $saveInfo = [
            'content' => $this->_adminInfo['name'] . ' 安装了插件 ' . $way,
            'ip' => get_ip(),
        ];
        $logres = $log->save($saveInfo);
        return $res;
    }
    public function uninstall()
    {
        $data = $_GET;
        $addons = new GeeAddons();
        $log = new GeeLog();
        $item = $addons->where('id = ' . $data['id'])->find();
        $way = $item['name'];
        $range = $item['range'];
        // dump($way);
        $path = ROOT_PATH . '/addons/' . $range . '/' . $range . '.php';
        include_once $path;
        $className = '\addons\\' . $range . '\\' . $range;
        $plug = new $className();
        //执行插件中的安装操作
        $res = $plug->uninstall($way);
        $addons->where('id = ' . $data['id'])->update(['status' => 0]);
        $saveInfo = [
            'content' => $this->_adminInfo['name'] . ' 卸载了插件 ' . $way,
            'ip' => get_ip(),
        ];
        $logres = $log->save($saveInfo);
        return $res;
    }
    public function on()
    {
        $data = $_GET;
        $addons = new GeeAddons();
        $log = new GeeLog();
        $addons->where('id = ' . $data['id'])->update(['status' => '2']);
        $saveInfo = [
            'content' => $this->_adminInfo['name'] . ' 启用了插件 ' . $way,
            'ip' => get_ip(),
        ];
        $logres = $log->save($saveInfo);
        $this->redirect('manager/Addons/index');
    }
    public function off()
    {
        $data = $_GET;
        $addons = new GeeAddons();
        $log = new GeeLog();
        $addons->where('id = ' . $data['id'])->update(['status' => '1']);
        $saveInfo = [
            'content' => $this->_adminInfo['name'] . ' 禁用了插件 ' . $way,
            'ip' => get_ip(),
        ];
        $logres = $log->save($saveInfo);
        $this->redirect('manager/Addons/index');
    }
}
