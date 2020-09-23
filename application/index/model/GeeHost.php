<?php
namespace app\index\model;
use think\Model;
use app\manager\model\GeeProduct; // 用户组表
use app\manager\model\GeeUser; //

/**
 * Host表
 */
class GeeHost extends Model
{
    protected $name = 'Host';
    protected $table = 'gee_host';
	//用户类型
    public function getProductTypeAttr($var,$data)
    {
        $pro = new GeeProduct();
        return  $pro->where('id = '.$data['product_id'])->find()['name'];
    }

    public function getUserAttr($var,$data)
    {
        $u = new GeeUser();
        return  $u->where('id = '.$data['user_id'])->find()['name'];
    }
    public function getProListAttr($var,$data)
    {
        $class = new GeeProductClass();
        $group = new GeeProductGroup();
        $pro = new GeeProduct();
        $item = $pro->where('id = '.$data['product_id'])->find()->toArray();
        $d = explode("|", $item['describe']);
        foreach($d as $k=>$v){
          $dhtml .= $v.'<br/>';
        }
        $html = '产品名称：'.$item["name"].'<br />'.$dhtml;
        // dump($item);
        return $html;
    }
    
    public function getPassAttr($var,$data)
    {
        return  db($data['plug_type'])->where('id = '.$data['pro_id'])->find()['password'];
    }
}
