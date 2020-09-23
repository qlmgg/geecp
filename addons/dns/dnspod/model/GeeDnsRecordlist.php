<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */

namespace addons\dns\dnspod\model;

use addons\dns\dnspod\common\library\DNSPod;
use think\Model;

class GeeDnsRecordlist extends Model
{
    protected $auto = [];
    protected $insert = [];
    protected $update = [];
    protected $table = 'gee_dns_recordlist';

    // 开启时间字段自动写入
    protected $autoWriteTimestamp = true;

    // 定义时间字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';


    /**记录类型
     * @return array
     */
    public function getRecordTypeList()
    {
        return DNSPod::$RecordType;
    }

    /**解析线路
     * @return array
     */
    public function getRecordLineList()
    {
        return DNSPod::$record_line;
    }

    /**获取ttl类型
     * @return array
     */
    public function getTtlTypeList()
    {
        return DNSPod::$TtlType;
    }

    protected function getRecordLineAttr($value)
    {
        return DNSPod::$record_line[$value];
    }

    protected function getTtlAttr($value, $data)
    {
        $arr=["300"=>"5分钟","600"=>"10分钟","3600"=>"1小时"];
        return $arr[$value];
    }

    public function dnsdomain(){
        return $this->belongsTo('\addons\dns\dnspod\model\GeeDnsDnspod', 'dns_dnspod_id', 'id');
    }

}
