<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\host\easypanel\common\library;

defined('WHM_CALL_METHOD') or define('WHM_CALL_METHOD', 'POST');
class WhmCall
{
    private $callName = '';
    private $url = '';
    public function __construct($callName)
    {
        $this->callName = $callName;
    }
    public function addParam($name,$value)
    {
        if($this->url!=""){
            $this->url.='&';
        }
        $this->url.=$name."=".urlencode($value);
    }
    public function getCallName()
    {
        return $this->callName;
    }
    public function buildUrl($skey)
    {
        $r = rand();
        $src = $this->callName.$skey.$r;
        $s = md5($src);
        return  "api/?c=whm&a=".$this->callName."&r=".$r."&s=".$s;
    }
    public function buildPostData()
    {
        return $this->url;
    }

}


?>
