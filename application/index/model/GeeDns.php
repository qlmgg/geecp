<?php
namespace app\index\model;

use think\Model;
use app\manager\model\GeeProduct; // Dns产品表

/**
 * Dns表
 */
class GeeDns extends Model
{
    protected $name = 'Host';
    protected $table = 'gee_dns';

    // 开启时间字段自动写入
    protected $autoWriteTimestamp = true;
    // 定义时间字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
    //用户类型
    public function getProductTypeAttr($var, $data)
    {
        $pro = new GeeProduct();
        return  $pro->where('id = '.$data['product_id'])->find()['name'];
    }

    public function user()
    {
        return $this->belongsTo('app\index\model\GeeUser', 'user_id', 'id');
    }
}
