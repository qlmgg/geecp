<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;
use think\Model;
use app\manager\model\GeeProduct; // 产品表
use app\manager\model\GeeProductGroup; // 产品组表
use app\manager\model\GeeProductClass; // 产品分类表
use app\manager\model\GeeProductType; // 产品类型表
use app\manager\model\GeeUser; //

/**
 * VPS表
 */
class GeeVps extends Model
{
  protected $name = "Vps";

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
}
