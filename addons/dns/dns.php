<?php
namespace addons\dns;

use think\Addons;
use think\Db;
use \think\Route;
use app\manager\model\GeeRoute; // 后台路由表
use app\manager\model\GeeWebroute; // 前台路由表
use app\manager\model\GeeAddons; // 插件表
use ZipArchive; // PHP自带zip解析

class dns extends Addons
{
    //安装
    public function install($plug_name='')
    {
        // TODO: Implement install() method.
        if ($plug_name) {
            $way = $plug_name;
            $path = $way.'/'.$way.'.php';
            include_once $path;
            $className = '\addons\dns\\'.$way.'\\'.$way;
            $result= new $className();
            $installRes = $result->install();
            return $installRes;
        }
    }
    //卸载
    public function uninstall($plug_name='')
    {
        // TODO: Implement uninstall() method.
        if ($plug_name) {
            $way = $plug_name;
            $path = $way.'/'.$way.'.php';
            include_once $path;
            $className = '\addons\dns\\'.$way.'\\'.$way;
            $result= new $className();
            $installRes = $result->dns();
            return $installRes;
        }
    }
    //主控
    public function dns($data)
    {
        //查询哪一个分类插件的状态为启用,并调用方法
        // $where['range']='domain';
        // $where['status']='2';
        // $res=Db::name('addons')->where($where)->find();

        if ($data['way']) {
            $way=$data['way'];
            $path = $way.'/controller/'.$way.'.php';
            include_once $path;
            $className = '\addons\dns\\'.$way.'\controller\\'.$way;
            $result= new $className();
            $function=$data['function'];
            // $data['data']['plug_id'] = $res['id'];
            $code=$result->$function($data);
        // dump($code);
        } else {
            $code='0';
        }
        return $code;
    }
}
