<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;
use think\Model;
use app\manager\model\GeeProductClass; //产品分类表
/**
 * 产品表
 */
class GeeProduct extends Model
{
  protected $name = "Product";
	//用户状态
  public function getTypeClassAttr($var,$data)
  {
    $class = new GeeProductClass();
    return $class->where('id = '.$data['type'])->value('title');
  }
}
