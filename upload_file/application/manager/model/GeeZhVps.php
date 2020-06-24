<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\model;
use think\Model;
use app\manager\model\GeeProduct; // 用户组表

/**
 * 纵横VPS表
 */
class GeeZhVps extends Model
{
    protected $name = "ZhVp";

	//用户类型
    public function getProductTypeAttr($var,$data)
    {
        $pro = new GeeProduct();
        return  $pro->where('id = '.$data['product_id'])->find()['name'];
    }
}
