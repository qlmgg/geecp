<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\dns\dnspod\common\library;

class DNSPod
{
    private $Token = 'id,token';	//请填入自己申请的密钥（格式：id,token）
    private $UserAgent = 'MJJDDNS/1.0(153555712@qq.com)';

    public static $url = 'https://dnsapi.cn/';

    //域名扩展的状态
    public static $ext_status = [
          "notexist" => "域名没有注册",
          "dnserror" => "DNS设置错误",
          ""=>"正常"
    ];

    /*
     * 记录类型
     */
    public static $RecordType =[
        'A' => 'A',
        'AAAA' => 'AAAA',
        'CNAME'=>'CNAME',
        'MX'=>'MX',
        'NS'=>'NS',
        'TXT'=>'TXT'
    ];

    //线路
    public static $record_line =[
        '0'=>'默认',
        '1'=>'电信',
        '2'=>'移动',
        '3'=>'联通',
        '4'=>'教育网',
        '5'=>'百度'
    ];

    public static $TtlType =[
        '300'=>'5分钟',
        '600'=>'10分钟',
        '3600'=>'1小时'
    ];

    public function __construct()
    {
        $data = include_once ADDON_PATH.'dns/dnspod/config.php';

        $this->Token=$data['id'].','.$data['token'];

        $this->UserAgent=$data['UserAgent'];
    }

    public function post($data, $url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_USERAGENT, $this->UserAgent);
        $data['login_token'] = $this->Token;
        $data['format'] = 'json';	//返回的数据格式，可选，默认为xml，建议用json
        $data['lang'] = 'cn';	//返回的错误语言，可选，默认为en，建议用cn
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        $rst = curl_exec($ch);
        curl_close($ch);
        return json_encode(json_decode($rst, true), JSON_UNESCAPED_UNICODE);
    }

    /**获取帐户信息
     * @return mixed
     */
    public function UserDetail()
    {
        $url  = self::$url.'User.Detail';
        $data = array();
        return $this->post($data, $url);
    }

    /**获取用户日志
     * @return mixed
     */
    public function UserLog()
    {
        $url = self::$url.'User.Log';
        $data = array();
        return $this->post($data, $url);
    }

    /**添加域名名称
     * @param $domain
     * @return mixed
     */
    public function DomainCreate($domain, $group_id = '', $is_mark = '')
    {
        $url = self::$url.'Domain.Create';

        $data = array(
            'domain'=>$domain
        );

        if (!empty($group_id)) {
            $data = array_merge($data, compact('group_id'));
        }

        if (!empty($is_mark)) {
            $data = array_merge($data, compact('is_mark'));
        }

        return $this->post($data, $url);
    }

    /**获取域名列表
     * @return mixed
     */
    public function DomainList()
    {
        $url = self::$url.'Domain.List';
        $data = array();
        return $this->post($data, $url);
    }

    /**
     * @param $domain 域名
     * @return string
     */
    public function DomainRemove($domain)
    {
        $url = self::$url.'Domain.Remove';
        $data = array(
            'domain' => $domain
        );
        return $this->post($data, $url);
    }

    /**设置域名状态
     * @param $domain
     * @param string $status
     * @return string
     */
    public function DomainStatus($domain, $status='enable')
    {
        $url = self::$url.'Domain.Status';

        $data = array(
            'domain' => $domain,
            'status' => $status
        );
        return $this->post($data, $url);
    }

    /**获取域名信息
     * @param $domain
     * @return string
     */
    public function DomainInfo($domain)
    {
        $url = self::$url.'Domain.Info';

        $data = array(
            'domain' => $domain,
        );
        return $this->post($data, $url);
    }

    /**根据域名id获取信息
     * @param $domain
     * @return string
     */
    public function DomainIdInfo($domain_id)
    {
        $url = self::$url.'Domain.Info';

        $data = array(
            'domain_id' => $domain_id,
        );
        return $this->post($data, $url);
    }
    /**添加记录
     * @param $parm
     * @return string
     */
    public function RecordCreate($parm)
    {
        $url = self::$url.'Record.Create';
        // $data['domain'] = $parm['domain'];
        $data['domain_id'] = $parm['domain_id'];

        if(!$data['domain']){
            $data['domain_id'] = $parm['domain_id'];
            unset($data['domain']);
        }

        $data['sub_domain'] = $parm['sub_domain'];
        $data['record_type'] = $parm['record_type'];
        $data['record_line_id'] = $parm['record_line_id'];
        $data['value'] = $parm['value'];
        $data['mx'] = $parm['mx'];

        $data = array_filter($data);
        return $this->post($data, $url);
    }

    /**记录列表
     * @param $domain_id 域名id
     * @return mixed
     */
    public function RecordList($domain_id)
    {
        $url = self::$url.'Record.List';
        $data['domain_id'] = $domain_id;
        return $this->post($data, $url);
    }

    /**删除记录
     * @param $domain_id 域名ID
     * @param $record_id  记录ID
     * @return string
     */
    public function RecordRemove($domain_id,$record_id)
    {
        $url = self::$url.'Record.Remove';

        $data['domain_id'] = $domain_id;
        $data['record_id'] = $record_id;

        return $this->post($data, $url);

    }
    public function RecordInfo($domain_id, $record_id)	//获取记录信息
    {
        $url = self::$url.'Record.Info';
        $data['domain_id'] = $domain_id;
        $data['record_id'] = $record_id;
        return $this->post($data, $url);
    }

    public function RecordRemark($domain_id, $record_id, $remark)	//设置记录备注
    {
        $url = self::$url.'Record.Remark';
        $data['domain_id'] = $domain_id;
        $data['record_id'] = $record_id;
        $data['remark'] = $remark;
        return $this->post($data, $url);
    }

    public function RecordDdns($domain_id, $record_id, $sub_domain, $ip)	//更新动态DNS记录
    {
        $url = self::$url.'Record.Ddns';
        $data['record_line'] = '默认';	//线路
        $data['domain_id'] = $domain_id;
        $data['record_id'] = $record_id;
        $data['sub_domain'] = $sub_domain;
        $data['record_id'] = $record_id;
        $data['value'] = $ip;
        return $this->post($data, $url);
    }

    /*
    上面的方法都是调用DNSPod的官方API
    但是官方限制5次更新DDNS如果IP不变则锁定
    故下面的方法会手动检测变动，IP未变动则不更新记录
    */
    public function UpdateDdns($domain_id, $record_id, $ip)
    {
        date_default_timezone_set('Asia/Shanghai');	//设置时区
        $this->RecordRemark($domain_id, $record_id, date('Y-m-d H:i:s'));	//更新备注为当前时间
        $res = $this->RecordInfo($domain_id, $record_id);	//	获取记录
        $arr = json_decode($res, true);	//返回json转为数组
        if ($arr['record']['value'] == '' || $arr['record']['sub_domain'] == '') {
            $res = '请求失败！';
        } else {
            if ($arr['record']['value'] == $ip) {
                $res = 'IP未变动，备注已经更新！';
            } else {
                $this->RecordDdns($domain_id, $record_id, $arr['record']['sub_domain'], $ip);
                $res = $arr['record']['sub_domain'] . '->' . $ip;	//子域名重新指向结果
            }
        }
        return $res;
    }
}
