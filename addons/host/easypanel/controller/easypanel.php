<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\host\easypanel\controller;

use addons\host\easypanel\common\library\WhmException;
use addons\host\easypanel\model\GeeHostEasypanel;
use app\index\model\GeeHost;
use think\Controller;
use think\Db;
use think\Config;
use think\Exception;
use think\exception\PDOException;
use think\helper\Str;
use think\Loader;
use think\Request;

class easypanel extends Controller{

    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        defined('WHM_CALL_METHOD') or define('WHM_CALL_METHOD', 'POST');
    }

    /**
     * 主控端接口
     * @param $data  所传参数
     * @param $data['plug_id']  传入的接口产品id(将根据产品id去获取相关配置)
     * @param $data['data']  访问接口时的其余附带参数
     * @param $data['action']  即将访问的接口名称
     * @param $data['attach']  访问接口时附带的请求备注
     * @param $data['openX']   访问接口时附带的?
     * @return json
     */
    public function control($data=[]){
      $ret = [
        'status'=>200,
        'msg'=>'操作成功！',
        'data'=>''
      ];
    //  dump($data);
      if(empty($data['action']) || !isset($data['action'])){
        $ret['status'] = 422;
        $ret['msg'] = '请求接口异常！接口不存在.';
        return $ret;
      }
      
      // dump($data);
        $product = Db::name('product')->where('id = '.$data['plug_id'])->find();
        // dump($product['plug_config']);
        $request = Request::instance();
        $config=json_decode($product['plug_config'],true);

        $_URI = $config['serverip'];
        $port = $config['prot'];
        $skey = $config['skey'];
        $easypanel= new \addons\host\easypanel\common\helper\easypanel();
        $params["serverip"]  = $_URI;
        $params["prot"] =$port;
        $params["serveraccesshash"]=$skey;


        $easypanel->easypanel_make_whm($params);
      // dump($easypanel);

      if($data['action'] != 'manager'){
        $product = Db::name('product')->where('id = '.$data['plug_id'])->find();
        $config = json_decode($product['plug_config'],true);
        $data['userid'] = isset($data['user_id']) ? $data['user_id']:1;

      }
      $pay_length =isset($data['data']['month']) ? $data['data']['month']:0;
      $easymodel = new GeeHostEasypanel();
      $hostmodel = new GeeHost();
      //  $data['action'] ="changepw";
      try{
          switch($data['action']){
              case 'getinfo':
                  //查询host

                  $params['username'] =isset($data['data']['hostname']) ? $data['data']['hostname']:"";
                  $info = $easypanel->easypanel_GetinfoHost($params);
                  $ret['data']=$info;
                  $ret['msg']="查询host成功";

                  break;
              case 'activate':
                  //开通网站
                  $params['username']=strtolower(Str::random(11))."_".$data['userid'];
                  $params['passwd']=$easypanel-> random_code_type(8,"alpha-number-sign");
                  $params['product_id']=isset($data['host_type']) ? $data['host_type']:0;
                  $params['month']=isset($data['data']['month']) ? $data['data']['month']:0;
                  $easypanel->easypanel_Createvhost($params);
                  $ret['msg']="开通网站成功";
                  break;
              case 'renew':

                  //续费VPS
                  $params["username"]=isset($data['data']['hostname']) ? $data['data']['hostname'] :"";
                  $params['month']=isset($data['data']['month']) ? $data['data']['month']:0;
                  $params['product_id']=isset($data['data']['productid']) ? $data['data']['productid']:1;


                  $hostdata = $hostmodel->find($data['id']);
                  $start = date("Y-m-d",$hostdata->getData('create_time'));
                  $end = date("Y-m-d",$hostdata['end_time']);

                  $diff = diffDate($start,$end);
                  if(!empty($diff['month'])){
                      $params['month'] = intval($params['month']) + intval($diff['month']);

                  }elseif (!empty($diff['year'])){
                      $params['month'] = intval($params['month']) + (intval($diff['year'])*12);
                  }

                  $easypanel->easypanel_addExpireTime($params);
                  // dump($url);
                  break;
              case 'update':
                  //升级VPS
                  break;
              case 'changepw':
                  //修改密码
                  $params["username"]=isset($data['data']['hostname']) ? $data['data']['hostname'] :"";
                  $params["password"]=isset($data['data']['password']) ? $data['data']['password'] :"";
                  $easypanel->easypanel_ChangePassword($params);
                  $ret['msg']="修改站点密码成功";
                  break;
              case 'manager':

                  $url = "http://".$_URI.":".$port."/vhost/?c=session&a=loginForm";
                  // dump($url);
                  // exit;
                  $post = '<form id="sub" action="'.$url.'" method="post"><input type="hidden" name="hostname" value="'.$data['data']['hostname'].'"/><input type="hidden" name="hostpassword" value="'.$data['data']['password'].'"/></form>';
                  $post = $post.'<script>document.forms["sub"].submit()</script>';
                  return $post;
                  break;
          }
      }catch (WhmException $whmException){
          if($whmException->type =="getVh"){
              $ret['status'] =404;
              $ret['type'] ="getVh";
              $ret['msg']=$params['username']."host站点名字不存在";

          }else{

              $ret['msg']=$whmException->getMessage();
          }
       //  var_dump($ret);die();
          return json_encode($ret,JSON_UNESCAPED_UNICODE);

      }
        Db::startTrans();
        try {


            if($data['action'] == 'activate'){


                $saveData = [
                    'user_id'=> $data['user_id'],
                    'product_id'=> $data['plug_id'],
                    'name'=>$params['username'],
                    'password'=>$params['passwd'],
                    'attach'=>"创建网站",
                    'end_time'=>strtotime("+$pay_length month",time()),
                    'type'=>isset($data['host_type']) ? $data['host_type']:null,
                    'ip'=> "",
                    'status'=> "正常"
                ];
                $resut = $easymodel->save($saveData);

                $id = $easymodel->getLastInsID();
                $savevpsres = Db::name('host')->insert(
                    [
                        'user_id'=>$data['user_id'],
                        'status'=> "正常",
                        'plug_id'=>$data['plug_id'],
                        'plug_type'=>'host_easypanel',
                        'plug_name'=>'easypanel',
                        'pro_id'=>$id,
                        'type'=>isset($data['host_type']) ? $data['host_type']:null,
                        'create_time'=>time(),
                        'update_time'=>time(),
                        'end_time'=>strtotime("+$pay_length month",time())
                    ]);
            } else if($data['action'] == 'getinfo'){

            } else if($data['action'] == 'changepw'){
                $easymodel->where(["name"=>$params["username"]])->update(['password'=>$params["password"]]);
              //  $up = Db::name('vps_zoneidc')->where('name = "'.$data['data']['vpsname'].'"')->update(['password'=>$data['data']['password']]);
            } else if($data['action'] == 'renew'){
                $hostdata->save(["end_time"=>strtotime("+".$params['month']." month",time()-3600)]);
                $easymodel->save(
                    ["end_time"=>strtotime("+".$params['month']." month",time()-3600)],
                    [
                        "user_id"=>$data['userid'],
                        "name"=>$data['data']['hostname']
                    ]
                );
            } else if($data['action'] == 'update'){
                $ret['data'] = '';
                $up = Db::name('host_easypanel')->where('name = "'.$data['data']['hostname'].'"')->update(['end_time'=>$res['endtime']]);
            }
            Db::commit();
        }catch (PDOException $PDOException){
            Db::rollback();
            $ret['msg']=$PDOException->getMessage();
            $ret['status']=500;
        }
      //  var_dump($ret);die();
      // dump(json_encode($ret));
      return json_encode($ret,JSON_UNESCAPED_UNICODE);
    }
    /**
     * 更新vps列表数据
     * @param $data  所传参数
     * @param $data['user_id']  所属用户ID
     * @return json
     */
    public function updateList($data=[]){
      // $v = Db::name('host');
      // $host = Db::name('host_easypanel');
      // $easymodel = new GeeHostEasypanel();
      // // $plug= $this->control();
      // if($data['data']['user_id'] == '-1'){
      //   $vpsList = $host->select();
      // } else {
      //   $vpsList = $host->where('user_id = '.$data['data']['user_id'])->select();
      // }
      // try{
      //     foreach($vpsList as $k=>$v){
      //         $id['id'] = $v['id'];
      //         $putData = [
      //             'plug_id'=>$v['product_id'],
      //             'user_id'=> $data['user_id'],
      //             'action'=>'getinfo',
      //             'data'=>[
      //                 'hostname'=> $v['name'],
      //             ],
      //             'attach'=>'',
      //             'openX'=>""
      //         ];
      //         $res = $this->control($putData);
      //         $res = json_decode($res,true);

      //         //主鸡的创建站点已经删除,但数据库记录还在
      //         if (isset($res['type']) && $res['status']=='404' && $res['type'] =="getVh"){

      //             $easymodel->where(["id"=>$v['id']])->update(['status'=>'已删除']);

      //         }

      //         //host站点过期
      //         if($v['end_time'] <time()){
      //             $easymodel->where(["id"=>$v['id']])->update(['status'=>'已过期']);
      //         }
      //     }
      // }catch (WhmException $exception){
      //       echo $exception->getMessage();die();
      // }

    }

    /**
     * curl 调用接口
     * @param $aData
     * @return \SimpleXMLElement
     */
    private function send($_URI='',$Data=''){
      $curl = curl_init();
      curl_setopt($curl, CURLOPT_URL, $_URI);
      curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
      curl_setopt($curl, CURLOPT_POST, true);
      curl_setopt($curl, CURLOPT_POSTFIELDS, $Data);
      $return =  curl_exec($curl);
      // dump(mb_convert_encoding($return,'utf-8','GB2312'));
      return mb_convert_encoding($return,'utf-8','GB2312');
  }
}