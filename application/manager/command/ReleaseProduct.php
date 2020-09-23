<?php
namespace app\manager\command;

use app\index\model\GeeBilling; //
use app\index\model\GeeCdn; //
use app\index\model\GeeSmartsite; //
use app\index\model\GeeDomain; //
use app\index\model\GeeHost;
use app\manager\model\GeeCloudserver; //
use app\manager\model\GeeServer; //
use app\manager\model\GeeUser; //
use app\manager\model\GeeVps; //
use app\manager\model\GeeMsglog; //
use app\manager\model\GeeCoupon; //
use think\console\Command; //
use think\console\Input; //
use think\console\Output;

class ReleaseProduct extends Command
{
    protected function configure()
    {
        $this->setName('ReleaseProduct')->setDescription("计划任务 ReleaseProduct");
    }

    protected function execute(Input $input, Output $output)
    {
        $output->writeln('Date Crontab job start...');
        /*** 这里写计划任务列表集 START ***/

        //执行 高防CDN过期释放任务
        $this->releaseCdn();

        //执行 域名过期释放任务
        $this->releaseDomain();

        //执行 云主机过期释放任务
        $this->releaseCloudserver();

        //执行 虚拟主机过期释放任务
        $this->releaseHost();

        //执行 租用托管主机过期释放任务
        $this->releaseServer();

        //执行 智能建站站点过期释放任务
        $this->releaseSmartsite();

        //执行 VPS主机过期释放任务
        $this->releaseVps();

        //执行 清理超过30天的消息发送记录
        $this->releaseMsglog();

        /*** 这里写计划任务列表集 END ***/
        $output->writeln('Date Crontab job end...');
    }

    //针对CDN产品 对所有过期30天以后的产品进行删除
    private function releaseCdn()
    {
        $u = new GeeUser();
        $cdn = new GeeCdn();
        //过期30天 CDN
        $cdn->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- CDN ---------------');
        // exit;
    }
    //针对Domain产品 对所有过期30天以后的产品进行删除
    private function releaseDomain()
    {
        $u = new GeeUser();
        $d = new GeeDomain();
        //过期30天 Domain
        $d->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- Domain ---------------');
        // exit;
    }
    //针对Host产品 对所有过期30天以后的产品进行删除
    private function releaseHost()
    {
        $u = new GeeUser();
        $h = new GeeHost();
        //过期30天 Domain
        $h->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- Host ---------------');
        // exit;
    }
    //针对Cloudserver产品 对所有过期30天以后的产品进行删除
    private function releaseCloudserver()
    {
        $u = new GeeUser();
        $cs = new GeeCloudserver();
        //过期30天 云主机
        $cs->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- Cloudserver ---------------');
        // exit;
    }
    //针对Server产品 对所有过期30天以后的产品进行删除
    private function releaseServer()
    {
        $u = new GeeUser();
        $s = new GeeServer();
        //过期30天 主机
        $s->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- Server ---------------');
        // exit;
    }
    //针对Smartsite产品 对所有过期30天以后的产品进行删除
    private function releaseSmartsite()
    {
        $u = new GeeUser();
        $s = new GeeSmartsite();
        //过期30天 主机
        $s->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- Smartsite ---------------');
        // exit;
    }
    //针对Vps产品 对所有过期30天以后的产品进行删除
    private function releaseVps()
    {
        $u = new GeeUser();
        $v = new GeeVps();
        //过期30天 Vps主机
        $v->where('end_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
        var_dump('--------------- Vps ---------------');
        // exit;
    }
    //针对消息记录 对所有超过30天的消息记录进行删除
    private function releaseMsglog()
    {
      $ml = new GeeMsglog();
      //过期30天 消息记录
      $ml->where('create_time <= ' . (time() - 60 * 60 * 24 * 30))->delete();
      var_dump('--------------- MsgLog ---------------');
    }
}
