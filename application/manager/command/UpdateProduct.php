<?php

namespace app\manager\command;

use app\index\model\GeeCdn; //
use app\index\model\GeeDns; //
use app\index\model\GeeDomain; //
use app\index\model\GeeHost;
use app\manager\model\GeeAddons;
use app\manager\model\GeeCloudserver; //
use app\manager\model\GeeDomainPrice; //
use app\manager\model\GeeMsgmodel; //
use app\manager\model\GeeProduct; //
use app\manager\model\GeeProductClass; //
use app\manager\model\GeeServer; //
use app\manager\model\GeeUser; //
use app\manager\model\GeeVps; //
use app\manager\model\GeeCoupon; //
use think\console\Command; //
use think\console\Input; //
use think\console\Output;

class UpdateProduct extends Command
{
  protected function configure()
  {
    $this->setName('UpdateProduct')->setDescription("计划任务 UpdateProduct");
  }

  protected function execute(Input $input, Output $output)
  {
    $output->writeln('Date Crontab job start...');
    /*** 这里写计划任务列表集 START ***/

    // //执行 CDN产品更新任务
    // $this->updateProductCdn();

    // //执行 CloudServer产品更新任务
    // $this->updateProductCloudserver();

    // //执行 DNS产品更新任务
    // $this->updateProductDns();

    // //执行 Domain产品更新任务
    // $this->updateProductDomain();

    //执行 Host产品更新任务
    $this->updateProductHost();

    // //执行 Server产品更新任务
    // $this->updateProductServer();

    // //执行 Smartsite产品更新任务
    // $this->updateProductSmartsite();

    // //执行 VPS主机产品更新任务
    // $this->updateProductVps();

    // //执行 修改代金券到期状态
    // $this->updateCoupon();

    /*** 这里写计划任务列表集 END ***/
    $output->writeln('Date Crontab job end...');
  }

  //针对CDN产品 更新CDN列表状态
  private function updateProductCdn()
  {
    $cdn = new GeeCdn();
    $addons = new GeeAddons();
    $plug = new \addons\cdn\cdn();
    $way = $addons->where('`range` = "cdn" and `status` = 2')->select();
    foreach ($way as $k => $w) {
      //引入已启用的cdn插件表
      $putData = [
        'function' => 'updateList',
        'addons_id' => $w['id'],
        'data' => [
          'user_id' => '-1',
          'action' => '',
          'data' => [],
        ],
      ];
      $plug->cdn($putData);
    }
  }
  //针对CloudServer产品 更新CloudServer产品列表状态
  private function updateProductCloudserver()
  {
    $cs = new GeeCloudserver();
    $plug = new \addons\cloudserver\cloudserver();
    $list = $cs->select();
    foreach ($list as $k => $v) {
      //已到期
      if ($v['end_time'] <= time()) {
        $list[$k]['status'] = 0;
        $cs->where('id = ' . $v['id'])->update(['status' => 0]);
        $putData = [
          'way' => $v['plug_name'],
          'pro_id' => $v['pro_id'],
          'plug_id' => $v['pro_id'],
          'function' => 'control',
          'action' => 'virtual_pause',
          'virtualid' => $v['virtual_id'],
        ];
        $plug->cloudserver($putData);
      } elseif ($v['end_time'] > time()) {
        $list[$k]['status'] = 1;
        $cs->where('id = ' . $v['id'])->update(['status' => 1]);
        $putData = [
          'way' => $v['plug_name'],
          'pro_id' => $v['pro_id'],
          'plug_id' => $v['pro_id'],
          'function' => 'control',
          'action' => 'virtual_restore_pause',
          'virtualid' => $v['virtual_id'],
        ];
        $plug->cloudserver($putData);
      }
    }
  }
  //针对DNS产品 更新DNS列表状态
  private function updateProductDns()
  {
    $dns = new GeeDns();
    $addons = new GeeAddons();
    $plug = new \addons\dns\dns();
    $way = $addons->where('`range` = "dns" and `status` = 2')->select();
    foreach ($way as $k => $w) {
      //引入已启用的dns插件表
      $putData = [
        'way' => $w['name'],
        'function' => 'updateList',
        'addons_id' => $w['id'],
        'data' => [
          'user_id' => '-1',
          'action' => '',
          'data' => [],
        ],
      ];
      $plug->dns($putData);
    }
  }
  //针对Domain产品 更新Domain列表状态
  private function updateProductDomain()
  {
    $d = new GeeDomain();
    $dp = new GeeDomainPrice();
    $pro = new GeeProduct();
    $addons = new GeeAddons();
    $plug = new \addons\domain\domain();
    $list = $d->select();
    foreach ($list as $k => $v) {
      $suffix = '.' . explode(".", $v['domainname'])[1];
      $dpinfo = $dp->where('domain = "' . $suffix . '"')->find();
      $proinfo = $pro->where('id = ' . $dpinfo['pro_id'])->find();
      $adninfo = $addons->where('id = ' . $proinfo['plug'])->find();
      $putData = [
        'way' => $adninfo['name'],
        'pro_id' => $dpinfo['pro_id'],
        'function' => 'control',
        'action' => 'domainDetail',
        'data' => [
          'domainname' => $v['domainname'],
        ],
      ];
      $adnres = $plug->domain($putData);
      $adnres = json_decode($adnres, true);
      // dump($adnres);
      $v['runstate'] = $adnres['data'][0]['runstate'];
      $v['dnvcstate'] = $adnres['data'][0]['dnvcstate'];
      $v['domaintype'] = $adnres['data'][0]['domaintype'];

      $d->where('id = ' . $v['id'])->update([
        'r_state' => $v['runstate'],
        'd_state' => $v['dnvcstate'],
        'domaintype' => $v['domaintype'],
        'domainpass' => $adnres['data'][0]['password'],
        'userid' => $adnres['data'][0]['userid'],
        'dns' => json_encode([
          'dns1' => ['host' => $adnres['data'][0]['host1'], 'ip' => $adnres['data'][0]['hostip1']],
          'dns2' => ['host' => $adnres['data'][0]['host2'], 'ip' => $adnres['data'][0]['hostip2']],
          'dns3' => ['host' => $adnres['data'][0]['host3'], 'ip' => $adnres['data'][0]['hostip3']],
          'dns4' => ['host' => $adnres['data'][0]['host4'], 'ip' => $adnres['data'][0]['hostip4']],
          'dns5' => ['host' => $adnres['data'][0]['host5'], 'ip' => $adnres['data'][0]['hostip5']],
          'dns6' => ['host' => $adnres['data'][0]['host6'], 'ip' => $adnres['data'][0]['hostip6']],
        ]),
        'end_time' => strtotime($adnres['data'][0]['ExpireTime']),
        'newstas' => $adnres['data'][0]['d_constt'],
        'isname' => $adnres['data'][0]['isNameDomain'],
      ]);
    }
  }
  //针对Host产品 更新Host列表状态
  private function updateProductHost()
  {
    $host = new GeeHost();
    $addons = new GeeAddons();
    $plug = new \addons\host\host();
    $way = $addons->where('`range` = "host" and `status` = 2')->select();
    foreach ($way as $k => $w) {
      //引入已启用的host插件表
      $putData = [
        'function' => 'updateList',
        'addons_id' => $w['id'],
        'data' => [
          'user_id' => '-1',
          'action' => '',
          'data' => [],
        ],
      ];
      $plug->host($putData);
      // dump(json_decode(json_encode($w),true));
    }
    
    // dump('--------------------------------------');
    exit;
  }
  //针对Server产品 更新Server列表状态
  private function updateProductServer()
  {
    $server = new GeeServer();
    $serverlist = $server->where('status != 1')->select();
    foreach ($serverlist as $k => $v) {
      if ($v['end_time'] <= time()) {
        $server->where('id = ' . $v['id'])->update(['status' => 1]);
      }
    }
  }
  private function updateProductSmartsite()
  {
    $addons = new GeeAddons();
    $plug = new \addons\smartsite\smartsite();
    $way = $addons->where('`range` = "smartsite" and `status` = 2')->select();
    foreach ($way as $k => $w) {
      //引入已启用的smartsite插件表
      $putData = [
        'function' => 'updateList',
        'addons_id' => $w['id'],
        'data' => [
          'user_id' => session('_userInfo')['id'],
          'action' => '',
          'data' => []
        ]
      ];
      $plug->smartsite($putData);
    }
  }
  //针对Vps产品 更新VPS列表状态
  private function updateProductVps()
  {
    $vps = new GeeVps();
    $addons = new GeeAddons();
    $plug = new \addons\vps\vps();
    $way = $addons->where('`range` = "vps" and `status` = 2')->select();
    foreach ($way as $k => $w) {
      //引入已启用的vps插件表
      $putData = [
        'function' => 'updateList',
        'addons_id' => $w['id'],
        'data' => [
          'user_id' => '-1',
          'action' => '',
          'data' => [],
        ],
      ];
      $plug->vps($putData);
    }
  }

  //针对代金券 对所有过期代金券进行状态修改
  private function updateCoupon()
  {
    $c = new GeeCoupon();
    $c->where('end_time < ' . time())->update([
      'status' => 3
    ]);
  }
}
