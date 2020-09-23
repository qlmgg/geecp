<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */

namespace addons\host\easypanel\model;
use think\Model;


class GeeHostEasypanel extends Model
{
    protected $auto = [];
    protected $insert = [];
    protected $update = [];
    protected $table = 'gee_host_easypanel';

    // 开启时间字段自动写入
    protected $autoWriteTimestamp = true;

    // 定义时间字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

}
