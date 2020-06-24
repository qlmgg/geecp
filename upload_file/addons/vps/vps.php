<?php
namespace addons\vps;

use app\manager\model\GeeProduct;
use app\manager\model\GeeUser; // 后台路由表
use app\manager\model\GeeWebroute; // 后台路由表
use think\Addons; // 前台路由表
use think\Db; // 插件表
// 产品表
// PHP自带zip解析
class vps extends Addons
{
    //安装
    public function install($plug_name = '')
    {
        // TODO: Implement install() method.
        if ($plug_name) {
            $way = $plug_name;
            $path = $way . '/' . $way . '.php';
            include_once $path;
            $className = '\addons\vps\\' . $way . '\\' . $way;
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
            $className = '\addons\vps\\' . $way . '\\' . $way;
            $result = new $className();
            $installRes = $result->uninstall();
            return $installRes;
        }
    }
    //主控
    public function vps($data)
    {
        // dump($data);
        if ($data['plug_id']) {
            $pro = new GeeProduct();
            $proinfo = $pro->where('id = ' . $data['plug_id'])->find();
            $where['id'] = $proinfo['plug'];
        }
        if ($data['addons_id']) {
            $where['id'] = $data['addons_id'];
        }
        //查询哪一个分类插件的状态为启用,并调用方法
        $where['range'] = 'vps';
        $where['status'] = '2';
        $res = Db::name('addons')->where($where)->find();

        if ($res) {
            $way = $res['name'];
            $path = $way . '/controller/' . $way . '.php';
            include_once $path;
            $className = '\addons\vps\\' . $way . '\controller\\' . $way;
            $result = new $className();
            $function = $data['function'];
            // $data['data']['plug_id'] = $res['id'];
            $code = $result->$function($data);
        } else {
            $code = '0';
        }
        return $code;
    }
    //创建成功后进行短信发送
    public function sendMsg($data)
    {
      // $u = new GeeUser();
        //发起短信请求
        parseMsgPublic([
            'mark' => $data['mark'],
            'to' => session('_userInfo')['phone'],
            'params' => $data['params'],
        ]);
        // dump($data);
    }
}
