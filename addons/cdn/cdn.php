<?php
namespace addons\cdn;

use app\manager\model\GeeProduct;
use app\manager\model\GeeWebroute; // 后台路由表
use think\Addons; // 前台路由表
use think\Db; // 插件表
use ZipArchive; // 产品表
// PHP自带zip解析
class cdn extends Addons
{
    //安装
    public function install($plug_name = '')
    {
        // TODO: Implement install() method.
        if ($plug_name) {
            $way = $plug_name;
            $path = $way . '/' . $way . '.php';
            include_once $path;
            $className = '\addons\cdn\\' . $way . '\\' . $way;
            $result = new $className();
            $installRes = $result->install();
            return $installRes;
        }
    }
    //卸载
    public function uninstall($plug_name = '')
    {
        // TODO: Implement uninstall() method.
        if ($plug_name) {
            $way = $plug_name;
            $path = $way . '/' . $way . '.php';
            include_once $path;
            $className = '\addons\host\\' . $way . '\\' . $way;
            $result = new $className();
            $installRes = $result->uninstall();
            return $installRes;
        }
    }
    //主控
    public function cdn($data)
    {
        // dump($data);
        if ($data['plug_id']) {
            $pro = new GeeProduct();
            $proinfo = $pro->where('id = ' . $data['plug_id'])->find();
            $where['id'] = $proinfo['plug'];
        }
        // dump($data['plug_id']);
        if ($data['addons_id']) {
            $where['id'] = $data['addons_id'];
        }
        //查询哪一个分类插件的状态为启用,并调用方法
        $where['range'] = 'cdn';
        $where['status'] = 2;
        $res = Db::name('addons')->where($where)->find();
        // dump($where);
        if ($res) {
            $way = $res['name'];
            $path = $way . '/controller/' . $way . '.php';
            include_once $path;
            $className = '\addons\cdn\\' . $way . '\controller\\' . $way;
            $result = new $className();
            $function = $data['function'];
            // $data['data']['plug_id'] = $res['id'];
            $code = $result->$function($data);
        } else {
            $code = '0';
        }
        return $code;
    }
}
