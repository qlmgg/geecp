<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\controller;

use app\manager\model\GeeBilling; //
use app\manager\model\GeeInvoice; //
use app\manager\model\GeeCoupon; //
use app\manager\model\GeeProductClass; //
use app\manager\model\GeeLog;
use app\manager\model\GeeUser; //
use app\manager\controller\Common; //
use think\Controller;
use think\Exception;

class Finance extends Common
{
  public function index()
  {
    //订单数据
    $o = new GeeBilling();
    $all = $o->count(); //总订单
    $now = $o->where('create_time >= ' . strtotime(date('Y-m-d') . " 00:00:00") . ' and create_time <= ' . strtotime(date('Y-m-d') . " 23:59:59"))->count(); //今日订单
    $pay = $o->where('`status` = "1" ')->count(); //已付款订单
    //总交易流水
    $paymoney = $o->where('`status` = "1" ')->select();
    $pmoney = 0;
    foreach ($paymoney as $k => $v) {
      $pmoney += $v['money'];
    }
    //累计充值金额
    $accruinglist = $o->where('`pro_list` = "0" ')->select();
    $accruing  = 0;
    foreach ($accruinglist as $k => $v) {
      $accruing += $v['money'];
    }
    $this->assign('accruing', $accruing);
    //未消费金额
    $u = new GeeUser();
    $ulist = $u->select();
    $unspentAmount = 0;
    foreach ($ulist as $k => $v) {
      //用户余额 + (用户返点金额 - 用户已使用返点金额) + 平台赠送金额
      $unspentAmount += $v['balance'] + ($v['presented_money'] - $v['use_rebates_money']) + $v['presented_money'];
    }
    $this->assign('unspentAmount', $unspentAmount);
    //已消费金额
    $aconsumedlist = $o->where('`type` = "0" and `status` = 1 ')->select();
    $amountConsumed  = 0;
    foreach ($aconsumedlist as $k => $v) {
      $amountConsumed += $v['money'];
    }
    $this->assign('amountConsumed', $amountConsumed);
    //今日充值金额
    $todayaccruinglist = $o->where('create_time >= ' . strtotime(date('Y-m-d') . " 00:00:00") . ' and create_time <= ' . strtotime(date('Y-m-d') . " 23:59:59"))->where('`pro_list` = "0" ')->select();
    $todayaccruing  = 0;
    foreach ($todayaccruinglist as $k => $v) {
      $todayaccruing += $v['money'];
    }
    $this->assign('todayaccruing', $todayaccruing);
    //今日消费金额
    $todaypay = $o->where('create_time >= ' . strtotime(date('Y-m-d') . " 00:00:00") . ' and create_time <= ' . strtotime(date('Y-m-d') . " 23:59:59"))->where('`status` = "1" ')->select();
    $todaypayaccruing  = 0;
    foreach ($todaypay as $k => $v) {
      $todaypayaccruing += $v['money'];
    }
    $this->assign('todaypayaccruing', $todaypayaccruing);
    //今日订单数
    $this->assign('now', $now);
    //今日退款金额
    //累计退款金额



    return $this->fetch('Finance/index');
  }
  public function details()
  {
    $business = new GeeBilling();
    $list = $business->order('id desc')->select();
    $this->assign('list', $list);
    return $this->fetch('Finance/details');
  }
  public function detailsinfo()
  {
    $o = new GeeBilling();
    $info = $o->where('order_number = ' . ($_GET['order'] ? $_GET['order'] : ''))->find();
    if (!$info) {
      return $this->redirect('manager/Finance/details');
    }
    $pros = json_decode($info['pro_list'], false);
    $pros = object_toArray($pros);
    $info['prolist'] = $pros;
    $info['proname'] = count($pros) > 1 ? '多产品' : $pros[0]['class'];
    $this->assign('info', $info);
    return $this->fetch('Finance/detailsinfo');
  }
  public function recharge()
  {
    $business = new GeeBilling();
    $list = $business->where('type="1"')->order('id desc')->select();
    $this->assign('list', $list);
    return $this->fetch('Finance/recharge');
  }
  public function order()
  {
    $business = new GeeBilling();
    $list = $business->where('pro_list <> "0"')->order('id desc')->select();
    $this->assign('list', $list);
    return $this->fetch('Finance/order');
  }
  public function invoice()
  {
    $invoice = new GeeInvoice();
    $list = $invoice->order('id desc')->select();
    $this->assign('list', $list);
    return $this->fetch('Finance/invoice');
  }
  //编辑发票信息
  public function editinvoice()
  {
    $user = new GeeUser();
    $log = new GeeLog();
    $i = new GeeInvoice();
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];

    if (!isset($data['number']) || empty($data['number'])) {
      $ret['status'] = 422;
      $ret['msg'] = '请输入发票号!';
      return json_encode($ret);
    }
    if (!isset($data['express']) || empty($data['express'])) {
      $ret['status'] = 422;
      $ret['msg'] = '请输入快递单号!';
      return json_encode($ret);
    }
    $res = $i->where('id = ' . $data['id'])->update([
      'number' => $data['number'],
      'express' => $data['express'],
    ]);
    if ($res) {
      return json_encode($ret);
    } else {
      $ret['status'] = 422;
      $ret['msg'] = '网络异常!请稍后再试';
      return json_encode($ret);
    }
  }
  //通过发票申请
  public function passinvoice()
  {
    $user = new GeeUser();
    $log = new GeeLog();
    $i = new GeeInvoice();
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];

    if (!isset($data['number']) || empty($data['number'])) {
      $ret['status'] = 422;
      $ret['msg'] = '请输入发票号!';
      return json_encode($ret);
    }
    if (!isset($data['express']) || empty($data['express'])) {
      $ret['status'] = 422;
      $ret['msg'] = '请输入快递单号!';
      return json_encode($ret);
    }
    $iinfo = $i->where('id = ' . $data['id'])->find();
    $uinfo = $user->where('id = ' . $iinfo['user_id'])->find();
    // dump($uinfo);
    // dump($iinfo);
    // return;
    $res = $i->where('id = ' . $data['id'])->update([
      'status' => '1',
      'number' => $data['number'],
      'express' => $data['express'],
    ]);
    // dump($uinfo);
    // return;
    if ($res) {
      //通过后  用户开票 冻结金额减少本次开票金额   已开票金额累加本次开票金额
      $user->where('id = ' . $iinfo['user_id'])->update([
        'invoice_money' => (float) $uinfo['invoice_money'] + (float) $iinfo['money'],
        'free_money' => (float) $uinfo['free_money'] - (float) $iinfo['money'],
      ]);
      return json_encode($ret);
    } else {
      $ret['status'] = 422;
      $ret['msg'] = '网络异常!请稍后再试';
      return json_encode($ret);
    }
  }
  //拒绝发票申请
  public function nopassinvoice()
  {
    $user = new GeeUser();
    $log = new GeeLog();
    $i = new GeeInvoice();
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];

    $iinfo = $i->where('id = ' . $data['id'])->find();
    $uinfo = $user->where('id = ' . $iinfo['user_id'])->find();
    $res = $i->where('id = ' . $data['id'])->update([
      'status' => '3',
    ]);
    if ($res) {
      //拒绝后  用户开票 冻结金额减少本次开票金额
      $user->where('id = ' . $iinfo['user_id'])->update([
        'free_money' => (float) $uinfo['free_money'] - (float) $iinfo['money'],
      ]);
      return json_encode($ret);
    } else {
      $ret['status'] = 422;
      $ret['msg'] = '网络异常!请稍后再试';
      return json_encode($ret);
    }
  }
  public function coupon()
  {
    $u = new GeeUser();
    $c = new GeeCoupon();
    $pc = new GeeProductClass();
    $aunum = $u->count();
    $list = $c->order('id desc')->select();
    $unum = $u->where('status = "0"')->count();
    $pclist = $pc->where('status = "1"')->order('id desc')->select();
    $userlist = $u->where('status = "0"')->select();
    $this->assign('aunum', $aunum);
    $this->assign('list', $list);
    $this->assign('unum', $unum);
    $this->assign('pclist', $pclist);
    $this->assign('userlist', $userlist);
    return $this->fetch('Finance/coupon');
  }
  public function couponadd()
  {

    $u = new GeeUser();
    $l = new GeeLog();
    $c = new GeeCoupon();
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];
    // dump($data);
    if (empty($data['id'])) {
      unset($data['id']);
    } else {
      unset($data['number']);
      $day = $data['day'];
      unset($data['day']);
    }

    //验证值正确性
    foreach ($data as $k => $v) {
      if (empty($v) && $v != '0') {
        $e = true;
        break;
      }
    }
    if ($e) {
      $ret['status'] = 421;
      $ret['msg'] = '请提交正确的值!';
      return json_encode($ret);
    }
    //用户随机领取
    if ($data['totype'] == 2) {
      $ulist = $u->where('status = "0"')->select();
      $ulist = list_toArray($ulist);
    }
    // dump($ulist);
    // try {
      //生成代金券
      if ($data['number']) {
        //根据生成数量循环生成代金券
        for ($i = 0; $i < $data['number']; $i++) {
          $save = [
            'code' => randcode(8),
            'type' => $data['type'],
            'range' => $data['range'],
            'reuse' => $data['reuse'],
            'use_number' => 0,
            'value' => $data['value'],
            'minvalue' => $data['minvalue'],
            'status' => $data['status'],
            'user_id' => '',
            'create_time' => time(),
            'update_time' => time(),
            'end_time' => strtotime("+" . $data['day'] . " day", time()),
          ];

          if ($data['totype'] == 2) {
            $save['user_id'] = $ulist[$i]['id'];
          }

          $c->insert($save);
        }
        $saveInfo = [
          'content' => session('_adminInfo')['name'] . '生成了 ' . $data['number'] . ' 张代金券',
          'ip' => get_ip(),
        ];
        $l->save($saveInfo);
      } else {
        //修改代金券
        //根据生成数量循环生成代金券
        $save = [
          'type' => $data['type'],
          'range' => $data['range'],
          'reuse' => $data['reuse'],
          'value' => $data['value'],
          'minvalue' => $data['minvalue'],
          'status' => $data['status'],
          'update_time' => time(),
          'end_time' => strtotime("+" . $day . " day", time()),
        ];

        if (!$day) {
          unset($save['end_time']);
        }
        if ($data['id']) {
          unset($save['create_time']);
          $c->where('id = ' . $data['id'])->update($save);
        }

        $saveInfo = [
          'content' => session('_adminInfo')['name'] . '修改了ID: ' . $data['id'] . ' 代金券',
          'ip' => get_ip(),
        ];
        $l->save($saveInfo);
      }
      return json_encode($ret);
    // } catch (Exception $e) {
    //   $ret['status'] = 422;
    //   $ret['msg'] = '网络异常!请稍后再试';
    //   return json_encode($ret);
    // }
  }

  public function coupondel()
  {
    $l = new GeeLog();
    $c = new GeeCoupon();
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];
    try {
      $c->where('id = ' . $data['id'])->delete();
      $saveInfo = [
        'content' => session('_adminInfo')['name'] . '删除了代金券 ID:' . $data['id'],
        'ip' => get_ip(),
      ];
      $l->save($saveInfo);
      return json_encode($ret);
    } catch (Exception $e) {
      $ret['status'] = 422;
      $ret['msg'] = '网络异常!请稍后再试';
      return json_encode($ret);
    }
  }
  public function coupontouser()
  {
    $l = new GeeLog();
    $c = new GeeCoupon();
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];
    try {
      $c->where('id = ' . $data['id'])->update([
        'user_id' => $data['user_id']
      ]);
      $saveInfo = [
        'content' => session('_adminInfo')['name'] . '赋予了用户 ID:' . $data['user_id'] . ' 一张代金券 ID:' . $data['id'],
        'ip' => get_ip(),
      ];
      $l->save($saveInfo);
      return json_encode($ret);
    } catch (Exception $e) {
      $ret['status'] = 422;
      $ret['msg'] = '网络异常!请稍后再试';
      return json_encode($ret);
    }
  }
}
