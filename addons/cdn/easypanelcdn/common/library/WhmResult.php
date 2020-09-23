<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\cdn\easypanelcdn\common\library;

class WhmResult
{
    public $status = '';
    private $result = array();
    //api数据
    private $data=array();

    public function add($name,$value)
    {
        $this->result[$name][] = $value;
    }
    public function get($name,$index=0)
    {
        $value = $this->result[$name];
        return $value[$index];
    }
    public function getAll($name)
    {
        return $this->result[$name];
    }
    public function getCode()
    {
        return intval($this->status);
    }
    //获取数据
    public function getData(){
        return $this->data;
    }

    //设置数据
    public function setData($name,$value){
        $this->data[$name] = $value;
    }
}