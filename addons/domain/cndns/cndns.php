<?php
namespace addons\domain\cndns;
use think\Addons;
use \think\Db;
use \think\Route;
use app\manager\model\GeeRoute; // 后台路由表
use app\index\model\GeeWebroute; // 前台路由表
use app\index\model\GeeDomain; // 前台路由表
use app\manager\model\GeeAddons; // 插件表
use ZipArchive; // PHP自带zip解析
class cndns extends Addons
{
    public  $ret = [
          'status'=>200,
          'msg'=>'操作成功',
          'data'=>''
        ];
    //安装
    public function install()
    {
        // TODO: Implement install() method.
        $ret['status'] = 200;
        $ret['msg'] = '操作成功';

        //创建关联数据表
        // 创建连接
        $dbinfo = config("database");
        $conn = mysqli_connect($dbinfo['hostname'], $dbinfo['username'], $dbinfo['password'], $dbinfo['database']);
        // 检测连接
        if (!$conn) {
            die("连接失败: " . mysqli_connect_error());
        }
        return $ret;
    }
    //卸载
    public function uninstall()
    {
        // TODO: Implement uninstall() method.
        $ret['status'] = 200;
        $ret['msg'] = '操作成功';
        $dbinfo = config("database");
        //删除数据表 与 相关数据
        $conn = mysqli_connect($dbinfo['hostname'], $dbinfo['username'], $dbinfo['password'], $dbinfo['database']);
        // 检测连接
        if (!$conn) {
            die("连接失败: " . mysqli_connect_error());
        }
        $domain = new GeeDomain();
        // if($domain->where('plug_name = "cndns"')->select()){
        //   $domain->where('plug_name = "cndns"')->delete();
        // }
        // return $ret;

        //先删除目录下的文件：
        $dir = './../addons/domain/cndns';
        $this->deldir($dir);
        $dir = './../application/cndns';
        $this->deldir($dir);
        return $ret;
    }

    //删除
    public function deldir($dir){
      if(is_dir($dir)){
        $dh=opendir($dir);
        while ($file=readdir($dh)) {
          if($file!="." && $file!="..") {
              $fullpath=$dir."/".$file;
              if(!is_dir($fullpath)) {
                unlink($fullpath);
              } else {
                $this->deldir($fullpath);
              }
          }
        }
        // exit;
        closedir($dh);
        //删除当前文件夹：
        if(rmdir($dir)) {
          return true;
        } else {
          return false;
        }
    }
  }
}

