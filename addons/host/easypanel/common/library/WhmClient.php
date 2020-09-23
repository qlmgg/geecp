<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\host\easypanel\common\library;



class WhmClient
{
    public $skey = '';
    //public $auth='';
    public $whm_url='';
    public $err_msg='';
    private $result;


    public function setSecurityKey($skey)
    {
        $this->skey = $skey;
    }
    public function setAuth($user,$password)
    {
        //$this->auth = "Basic ".base64_encode($user.":".$password);
    }
    public function setUrl($url)
    {
        $this->whm_url = $url;
    }
    /*
    failed return false.otherwise return WhmResult
    */
    public function call(WhmCall $call,$tmo=0)
    {
        $this->result = array();
        //echo "whm call=".$call->getCallName().",tmo=".$tmo."<br>";
        $opts = array(
            'http'=>array(
                'method'=>WHM_CALL_METHOD
                //'header'=>"Authorization: ".$this->auth."\r\n"
            )
        );
        if (WHM_CALL_METHOD=='POST') {
            $opts['http']['content'] = $call->buildPostData();
        }
        if ($tmo>0) {
            $opts['http']['timeout'] = $tmo;
        }
        $url = $this->whm_url.$call->buildUrl($this->skey);
        if (WHM_CALL_METHOD!='POST') {
            $url.='&'.$call->buildPostData();
        }
        $msg = @file_get_contents($url, false, stream_context_create($opts));
        if($msg === FALSE){
            $this->err_msg = "cann't connect to host";
            return false;
        }

    //    try{

            $xml = new \SimpleXMLElement($msg);
           // print_r($xml);die();
            $result = new WhmResult;
            foreach($xml->children() as $key =>$child){
                if($child->getName()=='result'){
                    $result->status = $child['status'];
                    $result->setData("code",intval($child['status']));
                    foreach($child->children() as $k=>$node)
                    {
                        $result->setData($node->getName(),(string)$node);
                        $result->add($node->getName(), $node[0]);
                    }
                    if(intval($child['status']) !='200'){
                        throw new WhmException("错误代码:".intval($child['status']),500,$call->getCallName());
                    }

                    break;
                }
            }
            return $result;
            /*
        } catch (WhmException $e) {

            $ret = [
                'status'=>intval($result->status),
                'msg'=>'操作失败！错误代码:'.$e->getMessage(),
                'data'=>$e->getMessage()
            ];

            echo json_encode($ret,JSON_UNESCAPED_UNICODE);die();

        }
            */
    }
    public function get($name,$index=0)
    {
        $value = $this->result[$name];
        if(!$value){
            return false;
        }
        if($index>=count($value)){
            return false;
        }
        return $value[$index];
    }
    public function setParam($name,$value)
    {
    }
    public function getLastError()
    {
        return $this->err_msg;
    }


}