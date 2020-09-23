<?php

namespace app\manager\command;

use app\index\model\GeeCdn; //
use app\index\model\GeeDomain; //
use app\index\model\GeeHost;
use app\index\model\GeeSmartsite; //
use app\index\model\GeeProduct; //
use app\index\model\GeeProductClass; //
use app\manager\model\GeeCloudserver; //
use app\manager\model\GeeServer; //
use app\manager\model\GeeUser; //
use app\manager\model\GeeVps; //
use think\console\Command; //
use think\console\Input; //
use think\console\Output;
use app\manager\model\GeeMsgmodel; // 消息模板表
use app\manager\model\GeeMsglog; // 消息日志表


class SendMessage extends Command
{
  protected function configure()
  {
    $this->setName('SendMessage')->setDescription("计划任务 SendMessage");
  }

  protected function execute(Input $input, Output $output)
  {
    $output->writeln('Date Crontab job start...');
    /*** 这里写计划任务列表集 START ***/

    //执行 高防CDN过期消息提醒任务
    $this->sendCdnMessage();

    //执行 域名过期消息提醒任务
    $this->sendDomainMessage();

    //执行 云主机过期消息提醒任务
    $this->sendCloudserverMessage();

    //执行 虚拟主机过期消息提醒任务
    $this->sendHostMessage();

    //执行 租用托管主机过期消息提醒任务
    $this->sendServerMessage();

    //执行 智能建站站点过期消息提醒任务
    $this->sendSmartsiteMessage();

    //执行 VPS主机过期消息提醒任务
    $this->sendVpsMessage();

    /*** 这里写计划任务列表集 END ***/
    $output->writeln('Date Crontab job end...');
  }

  //针对CDN产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendCdnMessage()
  {
    $u = new GeeUser();
    $cdn = new GeeCdn();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    //即将到期CDN
    $list = $cdn->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      $name = db($v['plug_type'])->where('id = ' . $v['pro_id'])->value('name');
      parseMsgPublic([
        'mark' => 'cdnOverdue',
        'to' => $to,
        'params' => [
          $name,
        ],
      ]);

      $pinfo = $p->where('id = ' . $v['pro_id'])->find();
      $pcname = $pc->where('id = ' . $pinfo['type'])->value('name');
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "cdnOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的 ' . $pcname . ' ' . $name . ' 即将到期,请您尽快续费'],
        'type' => ['value' => $pcname],
        'content' => ['value' => $pcname . ': ' . $name . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- CDN ---------------');
    // exit;
  }
  //针对Domain产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendDomainMessage()
  {
    $u = new GeeUser();
    $d = new GeeDomain();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    //即将到期Domain
    $list = $d->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      parseMsgPublic([
        'mark' => 'domainOverdue',
        'to' => $to,
        'params' => [
          $v['domainname'],
        ],
      ]);
      
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "domainOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的域名 ' . $v['domainname'] . ' 即将到期,请您尽快续费'],
        'type' => ['value' => '域名'],
        'content' => ['value' => '域名: ' . $v['domainname'] . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- Domain ---------------');
    // exit;
  }
  //针对Host产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendHostMessage()
  {
    $u = new GeeUser();
    $h = new GeeHost();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    // dump((time() - 60 * 60 * 24 * 15));
    //即将到期 Host
    $list = $h->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      $name = db($v['plug_type'])->where('id = ' . $v['pro_id'])->value('name');
      parseMsgPublic([
        'mark' => 'hostOverdue',
        'to' => $to,
        'params' => [
          $name,
        ],
      ]);
      
      $pinfo = $p->where('id = ' . $v['pro_id'])->find();
      $pcname = $pc->where('id = ' . $pinfo['type'])->value('name');
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "hostOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的 ' . $pcname . ' ' . $name . ' 即将到期,请您尽快续费'],
        'type' => ['value' => $pcname],
        'content' => ['value' => $pcname . ': ' . $name . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- Host ---------------');
    // exit;
  }
  //针对Cloudserver产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendCloudserverMessage()
  {
    $u = new GeeUser();
    $cs = new GeeCloudserver();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    //即将到期 云主机
    $list = $cs->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      parseMsgPublic([
        'mark' => 'cloudserverOverdue',
        'to' => $to,
        'params' => [
          $v['name'],
        ],
      ]);
      
      $pinfo = $p->where('id = ' . $v['pro_id'])->find();
      $pcname = $pc->where('id = ' . $pinfo['type'])->value('name');
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "cloudserverOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的 ' . $pcname . ' ' . $v['name'] . ' 即将到期,请您尽快续费'],
        'type' => ['value' => $pcname],
        'content' => ['value' => $pcname . ': ' . $v['name'] . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- Cloudserver ---------------');
    // exit;
  }
  //针对Server产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendServerMessage()
  {
    $u = new GeeUser();
    $s = new GeeServer();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    //即将到期主机
    $list = $s->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      parseMsgPublic([
        'mark' => 'serverOverdue',
        'to' => $to,
        'params' => [
          $v['name'],
        ],
      ]);
      
      $pinfo = $p->where('id = ' . $v['pro_id'])->find();
      $pcname = $pc->where('id = ' . $pinfo['type'])->value('name');
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "serverOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的 ' . $pcname . ' ' . $v['name'] . ' 即将到期,请您尽快续费'],
        'type' => ['value' => $pcname],
        'content' => ['value' => $pcname . ': ' . $v['name'] . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- Server ---------------');
    // exit;
  }
  //针对Smartsite产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendSmartsiteMessage()
  {
    $u = new GeeUser();
    $s = new GeeSmartsite();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    //即将到期主机
    $list = $s->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      parseMsgPublic([
        'mark' => 'smartOverdue',
        'to' => $to,
        'params' => [
          $v['name'],
        ],
      ]);
      $pinfo = $p->where('id = ' . $v['pro_id'])->find();
      $pcname = $pc->where('id = ' . $pinfo['type'])->value('name');
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "smartOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的 ' . $pcname . ' ' . $v['name'] . ' 即将到期,请您尽快续费'],
        'type' => ['value' => $pcname],
        'content' => ['value' => $pcname . ': ' . $v['name'] . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- Smartsite ---------------');
    // exit;
  }
  //针对Vps产品 对所有15天以内即将到期的用户发送短信或邮件提醒
  private function sendVpsMessage()
  {
    $u = new GeeUser();
    $v = new GeeVps();
    $mm = new GeeMsgmodel();
    $ml = new GeeMsglog();
    $p = new GeeProduct();
    $pc = new GeeProductClass();
    //即将到期Vps主机
    $list = $v->where('end_time <= ' . (time() + 60 * 60 * 24 * 30) . ' and end_time >= ' . time())->select();
    // var_dump(list_toArray($list));
    foreach ($list as &$v) {
      $to = $u->where('id = ' . $v['user_id'])->value('email');
      $name = db($v['plug_type'])->where('id = ' . $v['pro_id'])->value('name');
      parseMsgPublic([
        'mark' => 'vpsOverdue',
        'to' => $to,
        'params' => [
          $name,
        ],
      ]);
      $pinfo = $p->where('id = ' . $v['pro_id'])->find();
      $pcname = $pc->where('id = ' . $pinfo['type'])->value('name');
      $uname = $u->where('id = ' . $v['user_id'])->value('name');
      $wxtid = $mm->where('mark = "vpsOverdue"')->find()['wx_temp_id'];
      $params = [
        'title' => ['value' => '尊敬的用户您好，您的 ' . $pcname . ' ' . $v['name'] . ' 即将到期,请您尽快续费'],
        'type' => ['value' => $pcname],
        'content' => ['value' => $pcname . ': ' . $v['name'] . '到期时间 '.date('Y年m月d日',$v['end_time'])],
        'endtime' => ['value' => date('Y年m月d日',$v['end_time'])],
        'user' => ['value' => $uname],
        'remark' => ['value' => '为了不影响您使用，请您尽快续费！']
      ];

      $res = guestbook($wxtid, $params);
    }
    var_dump('--------------- Vps ---------------');
    // exit;
  }
}
