<?php

namespace app\index\controller;

use app\manager\model\GeeAddons; //前置操作
use app\manager\model\GeeCloudserver; // 插件表
use app\index\controller\Common; //财务表
use app\index\model\GeeBilling; //域名表
use app\index\model\GeeDomain; //物理服务器表
use app\index\model\GeeServer; //云主机表
use app\index\model\GeeHost; //虚拟主机表
use app\index\model\GeeCdn; //高防CDN表
use app\index\model\GeeSmartsite; //智能建站表
use app\index\model\GeeTicket; //工单表
use app\index\model\GeeVps;

//VPS表

class Index extends Common
{
  public function index()
  {
    if (!isset($_COOKIE['token']) && !empty($_COOKIE['token']) && jwt_decode($_COOKIE['token'])) {
      return $this->redirect('index/Login/index');
    }
    //数据统计
    $o = new GeeBilling();
    $t = new GeeTicket();
    $ocount = $o->where('user_id = ' . session('_userInfo')['id'] . ' and `status` = "0" ')->count();
    $tcount = $t->where('fromid = ' . session('_userInfo')['id'])->count();
    $this->assign('ocount', $ocount);
    $this->assign('tcount', $tcount);
    //消费统计
    $b = new GeeBilling();
    //默认历史消费趋势
    $times_sc = statistics_time(['start_time' => date('Y-m-d', strtotime('-30 day')), 'end_time' => date('Y-m-d', strtotime('0 day'))]);
    foreach ($times_sc as $k => $v) {
      /* 时间条件 */
      $map = array();
      $map["time"] = array(array('egt', strtotime($v . " 00:00:00")), array('ELT', strtotime($v . " 23:59:59")));
      /* 当天所消费金额 */
      $binfo = $b->where(array('create_time' => $map['time']))->where('type = "0" or type = "4"')->where('status = "1"')->where('user_id = ' . session('_userInfo')['id'])->select();
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
    //消费统计
    $map = [];
    $map["time"] = [['egt', strtotime(date('Y-m-d', strtotime('-30 day')) . " 00:00:00")], ['ELT', strtotime(date('Y-m-d', strtotime('0 day')) . " 23:59:59")]];
    $blist = $b->where('type = "0" or type = "4"')->where('status = "1"')->where(['create_time' => $map['time']])->where('user_id = ' . session('_userInfo')['id'])->select();
    $allblist = [];
    foreach ($blist as $k => $v) {
      $prolist = json_decode($v['pro_list'], true);
      foreach ($prolist as $key => $val) {
        array_push($allblist, [
          'name' => $val['class'],
          'value' => str_replace(",", "", $val['price']),
        ]);
      }
    }
    $tree = Array2Tree($allblist, 'name');
    $new_arr = [];
    foreach ($allblist as $key => $val) {
      $new_arr[$val['name']][] = $val;
    }
    $proTree = [];
    foreach ($tree as $k => $v) {
      $price = 0;
      foreach ($v as $key => $val) {
        $price += (float) $val['value'];
      }
      array_push($proTree, [
        'name' => $k,
        'value' => $price,
      ]);
    }
    if (empty($proTree)) {
      array_push($proTree, [
        'name' => '',
        'value' => 0,
      ]);
    }
    $allPrice = 0;
    foreach ($proTree as $k => $v) {
      $allPrice += (float) $v['value'];
    }
    $this->assign('proTree', $proTree);
    $this->assign('allPrice', $allPrice);
    //域名统计
    $d = new GeeDomain();
    $dcount = $d->where('user_id = ' . session('_userInfo')['id'])->count();
    $dvcount = $d->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $decount = $d->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $endcount = $d->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();
    $this->assign('dcount', $dcount);
    $this->assign('dvcount', $dvcount);
    $this->assign('decount', $decount);
    $this->assign('endcount', $endcount);
    //VPS主机
    $vps = new GeeVps();
    $vcount = $vps->where('user_id = ' . session('_userInfo')['id'])->count();
    $vucount = $vps->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $vecount = $vps->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $vendcount = $vps->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();

    $this->assign('vcount', $vcount);
    $this->assign('vucount', $vucount);
    $this->assign('vecount', $vecount);
    $this->assign('vendcount', $vendcount);

    //物理服务器
    $s = new GeeServer();
    $scount = $s->where('user_id = ' . session('_userInfo')['id'])->count();
    $sucount = $s->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $secount = $s->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $sendcount = $s->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();

    $this->assign('scount', $scount);
    $this->assign('sucount', $sucount);
    $this->assign('secount', $secount);
    $this->assign('sendcount', $sendcount);

    //云主机
    $cs = new GeeCloudserver();
    $cscount = $cs->where('user_id = ' . session('_userInfo')['id'])->count();
    $csucount = $cs->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $csecount = $cs->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $csendcount = $cs->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();

    $this->assign('cscount', $cscount);
    $this->assign('csucount', $csucount);
    $this->assign('csecount', $csecount);
    $this->assign('csendcount', $csendcount);
    //虚拟主机
    $ht = new GeeHost();
    $htcount = $ht->where('user_id = ' . session('_userInfo')['id'])->count();
    $htucount = $ht->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $htecount = $ht->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $htendcount = $ht->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();

    $this->assign('htcount', $htcount);
    $this->assign('htucount', $htucount);
    $this->assign('htecount', $htecount);
    $this->assign('htendcount', $htendcount);
    //高防CDN
    $cdn = new GeeCdn();
    $cdncount = $cdn->where('user_id = ' . session('_userInfo')['id'])->count();
    $cdnucount = $cdn->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $cdnecount = $cdn->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $cdnendcount = $cdn->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();

    $this->assign('cdncount', $cdncount);
    $this->assign('cdnucount', $cdnucount);
    $this->assign('cdnecount', $cdnecount);
    $this->assign('cdnendcount', $cdnendcount);
    //智能建站
    $ss = new GeeSmartsite();
    $sscount = $ss->where('user_id = ' . session('_userInfo')['id'])->count();
    $ssucount = $ss->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . time())->count();
    $ssecount = $ss->where('user_id = ' . session('_userInfo')['id'])->where('end_time >= ' . (time() - 60 * 60 * 24 * 30) . ' and end_time <= ' . time())->count();
    $ssendcount = $ss->where('user_id = ' . session('_userInfo')['id'])->where('end_time <= ' . time())->count();

    $this->assign('sscount', $sscount);
    $this->assign('ssucount', $ssucount);
    $this->assign('ssecount', $ssecount);
    $this->assign('ssendcount', $ssendcount);

    return $this->fetch('Index/index');
  }
}
