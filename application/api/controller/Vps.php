<?php
namespace app\index\controller;
use app\index\controller\Common; // 前置操作
use app\manager\model\GeeProductClass; //产品分类表
use app\manager\model\GeeProductGroup; //产品组表
use app\manager\model\GeeProduct; //产品表
use app\manager\model\GeeAddons; //插件表
use app\index\model\GeeVps; //vps表
use app\index\model\GeeProConfig; //产品购买配置表
use app\index\model\GeeBilling; //订单表
use think\Db;
use think\Cache;
class Vps extends Common
{
    public function index()
    {
      $vps = new GeeVps();
      $list = $vps->where('user_id = '.session('_userInfo')['id'])->order('id desc')->paginate(10);
      foreach($list as $k=>$v){
          $item = Db::name($v['plug_type'])->where('id = '.$v['pro_id'])->find();
          if($item){
            foreach($item as $key=>$var){
              if($key == 'id'){
                continue;
              }
              $v[$key] = $var;
            }
          }
      }
      $this->assign('list',$list);
      return $this->fetch('Vps/index');
    }
    public function updatelist(){
      $vps = new GeeVps();
      $addons = new GeeAddons();
      $plug= new \addons\vps\vps();
      $way = $addons->where('`range` = "vps" and `status` = 2')->select();
      foreach($way as $k=>$w){
        //引入已启用的vps插件表
        $putData = [
          'function'=>'updateList',
          'addons_id'=> $w['id'],
          'data'=>[
            'user_id'=> session('_userInfo')['id'],
            'action'=>'',
            'data'=>[
            ]
          ]
        ];
        $plug->vps($putData);
      }
    }
    public function add()
    {
      $group = new GeeProductGroup();
      $pro = new GeeProduct();
      if($_GET['id']){
        $item = $pro->where('id = '.$_GET['pro_id'])->find();
        $itemgroup = $group->where('id',$item['group_id'])->find();
        $this->assign('progroup',$itemgroup['name']);
        $this->assign('proname',$item['name']);
        $items = explode(',',$item['update_list']);
        // dump($items);
        if(!empty($items[0])){
	        foreach($items as $k=>$v){
	          $proItems[$k] = $pro->where('id = '.$v)->find();
	        }
        }
      } else {
        $proItems = $pro->where('type=2')->select();
      }
      $groups = [];
      $groupList = [];
      // dump($proItems);
      foreach($proItems as $k=>$v){
        $groups[$k] = $v['group_id'];
      }
      $groups = array_unique($groups);
      $num = 0;
      foreach($groups as $k=>$v){
        $groupList[$num] = $group->where('id = '.$v)->find();
        $num++;
      }
      $groupList = list_toArray($groupList);
      $timeKey =  array_column( $groupList, 'sort'); //取出数组中sort的一列，返回一维数组
      array_multisort($timeKey, SORT_DESC, $groupList);//排序，根据$sort 排序
      $this->assign('group', $groupList);
      if($_GET['id']){
        foreach($items as $k=>$v){
          $defualtPro[$k] = $pro->where('id = '.$v.' and group_id = '.$groupList[0]['id'])->find();
        }
        // $defualtPro = $pro->where('group_id = '.$groupList[0]['id'])->select();
      } else {
        $defualtPro = $pro->where('group_id = '.$groupList[0]['id'])->order('sort desc')->select();
      }
      $this->assign('prolist',$defualtPro);
      return $this->fetch('Vps/add');
    }
    /**
     * 创建VPS
     */
    public function addAuth(){
      $data = $_POST;
      $class = new GeeProductClass();
      $group = new GeeProductGroup();
      $pro = new GeeProduct();
      $pc = new GeeProConfig();
      $billing = new GeeBilling();
      $plug= new \addons\vps\vps();
      $item = $pro->where('id = '.$data['pro_id'])->find();
      $pro_id = json_decode($item['plug_config'],true)['product_id'];
    	$ret = [
    		'status'=> 200,
    		'msg'=> '操作成功',
    		'data'=> ''
      ];
      $userinfo = session('_userInfo');
      if($userinfo['realverify'] != 2){
        $ret['status'] = 422;
        $ret['msg'] = '请先进行实名认证!';
        return json_encode($ret);
      }
      if((int)$data['pay_length'] / 12 >= 1){
        $years = number_format((int)$data['pay_length'] / 12,0);
      } else{
        $years = '0.'.$data['pay_length'];
      }
      if(!$data['type']){
        $action = 'activate';
        $datas = [
          'year'=> $years,
          'idc'=> '',
          'productid'=> $pro_id
        ];
        $type = 'create';
      } else if($data['type'] == 'renew'){
        $action = 'renew';
        $datas = [
          'year'=> $years,
          'vpsname'=> $data['name']
        ];
        $type = 'renew';
      } else if($data['type'] == 'update'){
        $action = 'update';
        $datas = [
          'vpsname'=> $data['name']
        ];
        $type = 'update';
      } else {
        $ret['status'] = 422;
        $ret['msg'] = '非法操作！';
        return $ret;
      }
      $plugAddr = '\addons\vps\vps';
      $putData = [
        'plug'=> $plugAddr,
        'class'=>'vps',
        'function'=>'control',
        'data'=>[
          'plug_id'=>$data['pro_id'],
          'user_id'=> session('_userInfo')['id'],
          'action'=>$action,
          'data'=>$datas,
          'attach'=>'',
          'openX'=>""
        ]
      ];
      // dump($putData);
      // exit;
      $items = $pro->where('id = '.$data['pro_id'])->find();
      $_SESSION['_create_putData'] = $putData;
      $pinfo = [
        [
          'group'=> $group->where('id = '.$items['group_id'])->value('name'),
          'class'=> $class->where('id = '.$items['type'])->value('title'),
          'pro_id'=>$data['pro_id'],
          'pro_type' => $class->where('id = ' . $items['type'])->value('name'),
          'name'=>$items['name'],
          'type'=>$type,
          'num'=>$data['num'],
          'config'=>$items['describe'],
          'years'=>$data['pay_length'],
          'price'=> str_replace(",","",json_decode($this->getPrice(['type'=>$data['type'],'pro_id'=>$data['pro_id'],'pay_length'=>$data['pay_length'],'id'=>$data['id'],'name'=>$data['name']]),true)['data']['price'])
        ]
      ];
      $_SESSION['_pro_info'] = $pinfo;
      // dump($_SESSION);
      // dump($putData);
      // dump($pinfo);
      // return;
      $price = 0;
      foreach($_SESSION['_pro_info'] as $k=>$v){
        $str = $v['price'];
        //中文标点
        $char = ",。、！？：；﹑•＂…‘’“”〝〞∕¦‖—　〈〉﹞﹝「」‹›〖〗】【»«』『〕〔》《﹐﹕︰﹔！¡？¿﹖﹌﹏﹋＇´ˊˋ―﹫︳︴¯＿￣﹢﹦﹤‐­˜﹟﹩﹠﹪﹡﹨﹍﹉﹎﹊ˇ︵︶︷︸︹︿﹀︺︽︾ˉ﹁﹂﹃﹄︻︼（）";

        $pattern = array(
            '/['.$char.']/u', //中文标点符号
            '/[ ]{2,}/'
        );
        $prices = preg_replace($pattern, '', $str);
        $price += str_replace(",","",$prices);
      }
      $number = $this->vali_name('number',rand_name(8),8,'rand_name');
      $order_number = date('Ymdhis', time()) . rand(10000, 99999);

      $pcConfig['order_number'] = $order_number;
      $pcConfig['config'] = json_encode([
        '_create_putData' => $putData,
        '_pro_info' => $pinfo
      ]);
      $pc->save($pcConfig);
      $billing_save = [
        'number'=> $number,
        'order_number'=>$order_number,
        'pro_list'=>json_encode($_SESSION['_pro_info']),
        'user_id'=>session('_userInfo')['id'],
        'type'=>'0',
        'order_type'=>$type,
        'money'=>(double)str_replace(",","",$price),
        'balance'=>(double)session('_userInfo')['balance'] - (double)$_SESSION['_pro_info']['price'],
        'cash'=>0,
        'channel_type'=>'0',
        'remarks'=>'',
        'status'=>'0',
        'order_status'=>'2',
      ];
      $_SESSION['_pro_order'] = $billing_save['order_number'];
      $billing->save($billing_save);
      return json_encode($ret);
    }
    /**
     * 验证随机名称
     */
    public function vali_name($key,$val,$len,$func){
      if(!is_int($val) && !is_bool($val)){
        $w = '"'.$val.'"';
      }
      $has = db('billing')->where('`'.$key.'` = '.$w)->find();
      if($has){
        $vali = $this->vali_name($key,$func($len),$len,$func);
        return $vali;
      } else {
        return $val;
      }
    }
    /**
     * 删除资源
     */
    public function del(){
    	$ret = [
    		'status'=> 200,
    		'msg'=> '操作成功',
    		'data'=> ''
    	];
    	if(request()->isDelete()){
    		$vps = new GeeVps();
    		$id = request()->param()['id'];
    		$del = $vps->where('id = '.$id)->delete();
    	} else {
    		$ret['status'] = 500;
    		$ret['msg'] = '操作超时';
      }
      return json_encode($ret);
    }
    /**
     * 释放资源
     */
    public function release(){
    	$ret = [
    		'status'=> 200,
    		'msg'=> '操作成功',
    		'data'=> ''
    	];
    	if(request()->isDelete()){
        $vps = new GeeVps();
    		$id = request()->param()['id'];
        $item = $vps->where('id = '.$id)->find();
        $item['end_time'] = Db::name($item['plug_type'])->where('id = '.$item['pro_id'])->find()['end_time'];
        if($item['end_time'] <= time()){
          $del = $vps->where('id = '.$id)->delete();
          Db::name($item['plug_type'])->where('id = '.$item['pro_id'])->delete();
        } else {
          $ret['status'] = 500;
          $ret['msg'] = '过期资源才可以释放';
        }
    	} else {
    		$ret['status'] = 500;
    		$ret['msg'] = '操作超时';
      }
      return json_encode($ret);

    }
    /**
     * 获取重置短信验证码
     */
    public function getresetcode(){
      $data = $_POST;
      $ret = [
          'status' => 200,
          'msg' => '操作成功！',
      ];
      
      if (!isset($data['phone']) || !vali_data('phone', $data['phone'])) {
          $ret['status'] = 422;
          $ret['msg'] = '手机号提交有误！';
          return json_encode($ret);
      }

      // 判断是否有验证码 处在 60秒内有效期
      if (Cache::get('cloudserverReseter:' . $data['phone'])) {
          $old_cache_data = Cache::get('cloudserverReseter:' . $data['phone']);
          $last_time = $old_cache_data['send_time'];
          if ($last_time + 60 > time()) {
              $ret['status'] = 422;
              $ret['msg'] = '请等60秒后,再次发送验证码！';
              return json_encode($ret);
          }
      }
      //短信随机验证码
      $smsCode = mt_rand(100000, 999999);
      $expire_time = time() + 300;
      $cache_data = [
          'phone' => $data['phone'],
          'code' => $smsCode,
          'expire_time' => $expire_time, #过期时间
          'send_time' => time(), #发送时间
      ];
      cache('cloudserverReseter:' . $data['phone'], $cache_data, 300);

      //发起短信请求
      $res = parseMsgPublic([
          'mark' => 'cloudserverReseter',
          'to' => $data['phone'],
          'params' => [
              'basic_name',
              $smsCode,
          ],
      ]);
      $res = json_decode($res,true);
      if($res['status'] != 200){
        $ret['status'] = $res['status'];
        $ret['msg'] = $res['msg'];
        return json_encode($ret);
      }

      // dump(Cache::has('cloudserverReseter:' . $data['phone']));
      // dump(cache('cloudserverReseter:' . $data['phone']));
      return json_encode($ret);
    }
    /**
     * 修改密码
     */
    public function changepass(){
      $data = $_POST;
      $plug= new \addons\vps\vps();
    	$ret = [
    		'status'=> 200,
    		'msg'=> '操作成功',
    		'data'=> ''
      ];
      if(!isset($data['password']) || !vali_data('vpspw',$data['password'])){
        $ret['status'] = 401;
        $ret['msg'] = '新密码有误！';
      }
      // dump('cloudserverReseter:' . $data['phone']);
      //验证短信码
      if (Cache::get('cloudserverReseter:' . $data['phone'])) {
          $old_cache_data = Cache::get('cloudserverReseter:' . $data['phone']);
          if ($old_cache_data['code'] != $data['smscode']) {
              $ret['status'] = 422;
              $ret['msg'] = '短信验证码不正确！';
              return json_encode($ret);
          }
      } else {
        $ret['status'] = 422;
        $ret['msg'] = '未发送短信验证码或短信验证码已过期!';
        return json_encode($ret);
      }
      $putData = [
        'function'=>'control',
        'plug_id'=>$data['pro_id'],
        'action'=>'changepw',
        'data'=>[
          'vpsname'=> $data['vpsname'],
          'password'=> $data['password']
        ],
        'attach'=>'',
        'openX'=>""
      ];
      $res = $plug->vps($putData);
      // dump($res);
      return $res;
    }
    /**
     * 前往控制面板
     */
    public function manager(){
      $data = $_GET;
      $plug= new \addons\vps\vps();
      $putData = [
        'function'=>'control',
          'plug_id'=>$data['pro_id'],
          'user_id'=> $this->_userInfo['id'],
          'action'=> 'manager',
          'data'=>[
            'vpsname'=>$data['vpsname'],
            'password'=>$data['password']
          ],
          'attach'=>'',
          'openX'=>""
      ];
      $res = $plug->vps($putData);
      // dump($res);
      echo $res;
    }
    /**
     * 获取分组下的产品类型
     */
    public function getProItem(){
      $id = $_POST['id'];
      $pro = new GeeProduct();
      if($_POST['type'] == 'update'){
        $pro = new GeeProduct();
        $item = $pro->where('id = '.$_POST['pro_id'])->find();
        $items = explode(',',$item['update_list']);
        $num = 0;
        foreach($items as $k=>$v){
          $proitem = $pro->field('plug_config,update_list',true)->where('id = '.$v.' and group_id = '.$_POST['id'])->find();
          if($proitem){
            $proList[$num] = $proitem;
          } else {
            continue;
          }
          $num++;
        }
        // $proList=array_filter($proList);
        // $proList = $pro->where('group_id = '.$id)->select();
      } else {
        $proList = $pro->field('plug_config,update_list',true)->where('group_id = '.$id)->select();
      }
      return json_encode($proList);
    }
    /**
     * 获取价格
     */
    public function getPrice(){
      $data = $_POST;
      $pro = new GeeProduct();
    	$ret = [
    		'status'=> 200,
    		'msg'=> '操作成功',
    		'data'=> ''
      ];
      if($data['type'] != 'renew'){

      }
      $item = $pro->where('id = '.$data['pro_id'])->find();
      $pro_id = json_decode($item['plug_config'],true)['product_id'];
      if($data['type'] != 'update'){
        //固定换算价格
        switch($data['pay_length']){
          case 1:
          $lengthPrice = $item['month'] * 1;
          break;
          case 2:
          $lengthPrice = $item['month'] * 2;
          break;
          case 3:
          $lengthPrice = $item['quarter'] * 1;
          break;
          case 4:
          $lengthPrice = $item['quarter'] * 1 + $item['month'] * 1;
          break;
          case 5:
          $lengthPrice = $item['quarter'] * 1 + $item['month'] * 2;
          break;
          case 6:
          $lengthPrice = $item['semestrale'] * 1;
          break;
          case 7:
          $lengthPrice = $item['semestrale'] * 1 + $item['month'] * 1;
          break;
          case 8:
          $lengthPrice = $item['semestrale'] * 1 + $item['month'] * 2;
          break;
          case 9:
          $lengthPrice = $item['semestrale'] * 1 + $item['quarter'] * 1;
          break;
          case 10:
          $lengthPrice = $item['years'];
          break;
          case 11:
          $lengthPrice = $item['years'];
          break;
          case 12:
          $lengthPrice = $item['years'];
          break;
          case 24:
          $lengthPrice = $item['biennium'];
          break;
          case 36:
          $lengthPrice = $item['triennium'];
          break;
          default:
          $ret['status'] = 422;
          $ret['msg'] = '非法操作！';
          return json_encode($ret);
          break;
        }
      } else {
        $lengthPrice = $item['month'] * 1;
      }

      $ret['data'] = ['price'=>number_format($lengthPrice,2)];
      return json_encode($ret);
    }
}
