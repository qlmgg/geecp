<?php
namespace app\index\model;
use think\Model;
use app\manager\model\GeeProduct; // 用户组表

/**
 * VPS表
 */
class GeeVps extends Model
{
    protected $name = 'Vps';
    protected $table = 'gee_vps';
	//用户类型
    public function getProductTypeAttr($var,$data)
    {
        $pro = new GeeProduct();
        return  $pro->where('id = '.$data['product_id'])->find()['name'];
    }
}
