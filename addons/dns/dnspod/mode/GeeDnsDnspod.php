<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */

namespace addons\dns\dnspod\model;
use think\Model;


class GeeDnsDnspod extends Model
{
    protected $auto = [];
    protected $insert = [];
    protected $update = [];
    protected $table = 'gee_dns_dnspod';

    // 开启时间字段自动写入
    protected $autoWriteTimestamp = true;

    // 定义时间字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    public function recordlist()
    {
        return $this->hasMany('\addons\dns\dnspod\model\GeeDnsRecordlist', 'dns_dnspod_id', 'id');
    }
}
