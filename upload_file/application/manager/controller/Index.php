<?php
/*
 * Author: 叶落深秋 <975827527@qq.com>
 * User: ylsq
 */

namespace app\manager\controller;

use app\manager\model\GeeCloudserver; // 
use app\index\model\GeeBilling; // 
use app\index\model\GeeDomain; // 
use app\index\model\GeeServer; // 
use app\index\model\GeeTicket; // 
use app\index\model\GeeUser; //
use app\index\model\GeeVps; //
use app\index\model\GeeHost; //
use app\index\model\GeeCdn; //
use app\index\model\GeeSmartsite; //
use app\manager\controller\Common; //
use think\Controller;

class Index extends Common
{
  public function index()
  {
    if (!isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {
      return $this->redirect('manager/Login/index');
    }
    //用户数据
    $u = new GeeUser();
    $reg = $u->count();
    $puser = $u->where('type = "0"')->count();
    $euser = $u->where('type = "1"')->count();
    $this->assign('reg', $reg);
    $this->assign('puser', $puser);
    $this->assign('euser', $euser);
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
    $this->assign('all', $all);
    $this->assign('now', $now);
    $this->assign('pay', $pay);
    $this->assign('pmoney', $pmoney);
    //工单数据
    $t = new GeeTicket();
    $ft = $t->where('status = 0')->count();
    $wt = $t->where('status = 2')->count();
    $allt = $t->count();
    $this->assign('ft', $ft);
    $this->assign('wt', $wt);
    $this->assign('allt', $allt);
    //注册用户统计
    //默认注册用户
    $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
    foreach ($times_sc as $k => $v) {
      /* 时间条件 */
      $map = array();
      $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
      /* 当天注册用户 */
      $ucount = $u->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->count();
      $historical[$k]['date'] = $v;
      $historical[$k]['value'] = $ucount ? $ucount : 0;
      $hdate[$k] = $v;
      $hval[$k] = $ucount ? $ucount : 0;
    }
    $this->assign('uhistorical', $historical);
    $this->assign('uhdate', $hdate);
    $this->assign('uhval', $hval);
    //消费统计
    $b = new GeeBilling();
    //默认历史消费趋势
    $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
    foreach ($times_sc as $k => $v) {
      /* 时间条件 */
      $map = array();
      $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
      /* 当天所消费金额 */
      $binfo = $b->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->select();
      $money = 0;
      foreach ($binfo as $key => $val) {
        $money += (float) str_replace(",", "", $val['money']);
      }
      $historical[$k]['date'] = $v;
      $historical[$k]['value'] = to_double((float) $money);
      $hdate[$k] = $v;
      $hval[$k] = to_double((float) $money);
    }
    $this->assign('historical', $historical);
    $this->assign('hdate', $hdate);
    $this->assign('hval', $hval);
    //订单数据统计
    $b = new GeeBilling();
    //默认历史消费趋势
    $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
    foreach ($times_sc as $k => $v) {
      /* 时间条件 */
      $map = array();
      $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
      /* 当天所消费金额 */
      $bnum = $b->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->count();
      $historical[$k]['date'] = $v;
      $historical[$k]['value'] = $bnum;
      $hdate[$k] = $v;
      $hval[$k] = $bnum;
    }
    $this->assign('oistorical', $historical);
    $this->assign('odate', $hdate);
    $this->assign('oval', $hval);
    //域名统计
    $d = new GeeDomain();
    $dcount = $d->count();
    $dvcount = $d->where('end_time >= ' . time())->count();
    $decount = $d->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $endcount = $d->where('end_time <= ' . time())->count();
    $this->assign('dcount', $dcount);
    $this->assign('dvcount', $dvcount);
    $this->assign('decount', $decount);
    $this->assign('endcount', $endcount);
    //VPS主机
    $vps = new GeeVps();
    $vcount = $vps->count();
    $vucount = $vps->where('end_time >= ' . time())->count();
    $vecount = $vps->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $vendcount = $vps->where('end_time <= ' . time())->count();

    $this->assign('vcount', $vcount);
    $this->assign('vucount', $vucount);
    $this->assign('vecount', $vecount);
    $this->assign('vendcount', $vendcount);

    //物理服务器
    $s = new GeeServer();
    $scount = $s->count();
    $sucount = $s->where('end_time >= ' . time())->count();
    $secount = $s->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $sendcount = $s->where('end_time <= ' . time())->count();

    $this->assign('scount', $scount);
    $this->assign('sucount', $sucount);
    $this->assign('secount', $secount);
    $this->assign('sendcount', $sendcount);

    //云主机
    $cs = new GeeCloudserver();
    $cscount = $cs->count();
    $csucount = $cs->where('end_time >= ' . time())->count();
    $csecount = $cs->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $csendcount = $cs->where('end_time <= ' . time())->count();

    $this->assign('cscount', $cscount);
    $this->assign('csucount', $csucount);
    $this->assign('csecount', $csecount);
    $this->assign('csendcount', $csendcount);
    //虚拟主机
    $ht = new GeeHost();
    $htcount = $ht->count();
    $htucount = $ht->where('end_time >= ' . time())->count();
    $htecount = $ht->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $htendcount = $ht->where('end_time <= ' . time())->count();

    $this->assign('htcount', $htcount);
    $this->assign('htucount', $htucount);
    $this->assign('htecount', $htecount);
    $this->assign('htendcount', $htendcount);
    //高防CDN
    $cdn = new GeeCdn();
    $cdncount = $cdn->count();
    $cdnucount = $cdn->where('end_time >= ' . time())->count();
    $cdnecount = $cdn->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $cdnendcount = $cdn->where('end_time <= ' . time())->count();

    $this->assign('cdncount', $cdncount);
    $this->assign('cdnucount', $cdnucount);
    $this->assign('cdnecount', $cdnecount);
    $this->assign('cdnendcount', $cdnendcount);
    //智能建站
    $ss = new GeeSmartsite();
    $sscount = $ss->count();
    $ssucount = $ss->where('end_time >= ' . time())->count();
    $ssecount = $ss->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $ssendcount = $ss->where('end_time <= ' . time())->count();

    $this->assign('sscount', $sscount);
    $this->assign('ssucount', $ssucount);
    $this->assign('ssecount', $ssecount);
    $this->assign('ssendcount', $ssendcount);

    return $this->fetch('Index/index');
  }

  public function gethistory()
  {
    $data = $_POST;
    $ret = [
      'status' => 200,
      'msg' => '操作成功',
      'data' => '',
    ];

    $times_sc = '';
    switch ($data['time']) {
      case 'today':
        $times_sc = statistics_time(['start_time' => date('Y-m-d H:i:s', strtotime('-24 hour')), 'end_time' => date('Y-m-d H:i:s', strtotime('0 hour'))], 'hour');
        break;
      case 'week':
        $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-7 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
        break;
      case 'month':
        $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
        break;
      case 'years':
        $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-365 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
        break;
      default:
        $ret['status'] = 422;
        $ret['msg'] = '网络错误！请稍后再试';
        return json_encode($ret);
        break;
    }
    if ($data['type'] == 'user') {
      //注册用户统计
      $u = new GeeUser();
      foreach ($times_sc as $k => $v) {
        /* 时间条件 */
        $map = array();
        if ($data['type'] == 'today') {
          $map["time"] = array(array('egt', strtotime($v . " :00:00")), array('ELT', strtotime($v . "59:59")));
        } else {
          $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
        }
        /* 当天注册用户 */
        $ucount = $u->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->count();
        $historical[$k]['date'] = $v;
        $historical[$k]['value'] = $ucount ? $ucount : 0;
        $hdate[$k] = $v . ':' . date('i:s');
        $hval[$k] = $ucount ? $ucount : 0;
      }
      $ret['data'] = [
        'uhistorical' => $historical,
        'date' => $hdate,
        'data' => $hval,
      ];
      return json_encode($ret);
    } elseif ($data['type'] == 'order') {
      //订单数据统计
      $b = new GeeBilling();
      //默认历史消费趋势
      // $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
      foreach ($times_sc as $k => $v) {
        /* 时间条件 */
        $map = array();
        if ($data['type'] == 'today') {
          $map["time"] = array(array('egt', strtotime($v . " :00:00")), array('ELT', strtotime($v . "59:59")));
        } else {
          $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
        }
        /* 当前时段所有订单统计 */
        $bnum = $b->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->count();
        $historical[$k]['date'] = $v;
        $historical[$k]['value'] = $bnum;
        $hdate[$k] = $v;
        $hval[$k] = $bnum;
      }

      $ret['data'] = [
        'uhistorical' => $historical,
        'date' => $hdate,
        'data' => $hval,
      ];
      return json_encode($ret);
    } elseif ($data['type'] == 'trading') {
      //消费统计
      $b = new GeeBilling();
      foreach ($times_sc as $k => $v) {
        /* 时间条件 */
        $map = array();
        if ($data['type'] == 'today') {
          $map["time"] = array(array('egt', strtotime($v . " :00:00")), array('ELT', strtotime($v . "59:59")));
        } else {
          $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
        }
        /* 当天所消费金额 */
        $binfo = $b->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->select();
        $money = 0;
        foreach ($binfo as $key => $val) {
          $money += (float) str_replace(",", "", $val['money']);
        }
        $historical[$k]['date'] = $v;
        $historical[$k]['value'] = to_double((float) $money);
        $hdate[$k] = $v;
        $hval[$k] = to_double((float) $money);
      }
      $ret['data'] = [
        'uhistorical' => $historical,
        'date' => $hdate,
        'data' => $hval,
      ];
      return json_encode($ret);
    } else {
      $ret['status'] = 422;
      $ret['msg'] = '网络错误！请稍后再试';
      return json_encode($ret);
    }
  }
}
