<?php
/**
 * Author: 镜面王子 <153555712@qq.com>
 * User: jingmian
 */
namespace addons\host\easypanel\common\helper;
use addons\host\easypanel\common\library\WhmCall;
use addons\host\easypanel\common\library\WhmClient;

class easypanel{
    public static $product_id=array(
        "0"=>"自由套餐",
        "1"=>"基本套餐",
        "2"=>"专业套餐",
        "3"=>"增强套餐",
        "4"=>"企业套餐",
    );
    public function easypanel_ConfigOptions() {

        # Should return an array of the module options for each product - maximum of 24

        $configarray = array(
            "CDN"				=> array("Type" => "yesno", "Description" => "是否为CDN网站"),				//1
            "空间类型(模块名)"			=> array("Type" => "text", "Options" => "php:php52"),							//2
            "web配额" 			=> array( "Type" => "text", "Size" => "5", "Description" => "MB" ),	//3
            "数据库类型"			=> array( "Type" => "dropdown", "Options" => "mysql,sqlsrv"),		//4
            "数据库配额" 		=> array( "Type" => "text", "Size" => "5", "Description" => "MB" ),	//5
            "FTP" 				=> array( "Type" => "yesno", "Description" => "是否允许ftp" ),		//6
            "独立日志" 			=> array( "Type" => "yesno", "Description" => "是否开启独立日志" ),	//7
            "绑定域名数" 		=> array( "Type" => "text", "Size" => "5"),							//8
            "连接数"			=> array( "Type" => "text", "Size" => "5"),							//9
            "带宽限制"			=> array( "Type" => "text", "Size" => "5","Description" => "K/S"),	//10
            "默认绑定到子目录" 	=> array( "Type" => "text","Size"=>"20"),							//11
            "允许绑定子目录" 		=> array( "Type" => "yesno", "Description" => "是否允许绑定域名到子目录"),//12
            "最多绑定子目录数" 	=> array( "Type" => "text","Size"=>"5"),							//13
            "流量限制"			=> array( "Type" => "text","Size"=>"5","Description" => "GB/月"),	//14
            "管理变量"			=> array( "Type" => "text","Size"=>"12"),							//15
            "工作数"			=> array( "Type" => "text","Size"=>"5"),							//16
            "附加参数"			=> array("Type" => "text",'Size'=>'12'),							//17
            "SSL"				=> array("Type" => "yesno", "Description"=>"支持SSL"),          //18
            "定时任务"			=> array("Type" => "text", 'Size'=>"5", "Description"=>"条"),       //19
        );
        return $configarray;
    }
    public function easypanel_make_whm($params) {
        $whm = new \addons\host\easypanel\common\library\WhmClient();
        $whm->setUrl('http://'.$params["serverip"].':'.$params["prot"].'/');
        $whm->setSecurityKey($params["serveraccesshash"]);
        return $whm;
    }
    public function easypanel_call($whmCall,$params)
    {
        $whm = $this->easypanel_make_whm($params);
        $result = $whm->call($whmCall,300);
        if ($result===false) {
            return "不能连接到主机";
        }
        if ($result->getCode()==200) {

            if(count($result->getData())>=2){
                return $result->getData();
            }
            return "success";
        }
        return $result->status;
    }
    public function easypanel_update_account($params,$edit)
    {
        $whmCall = new WhmCall('add_vh');
        $whmCall->addParam('name', $params["username"]);
        $whmCall->addParam('passwd',$params["password"]);
        $whmCall->addParam('cdn',($params["configoption1"]== 'on' ? 1 : 0));
        $templete = preg_replace("/\:.+/","",$params["configoption2"]);
        $whmCall->addParam('templete',$templete); //原先的
        $subtemplete = preg_replace("/^.+?\:/","",$params["configoption2"]);
        $subtemplete = !empty($subtemplete) ? $subtemplete : "php52" ;
        $whmCall->addParam('subtemplete',$subtemplete); //原先的
        $whmCall->addParam('module',""); //是否选择旧格式,
        $whmCall->addParam('web_quota',intval($params["configoption3"]));
        $whmCall->addParam('db_type',$params["configoption4"]);
        $whmCall->addParam('db_quota',intval($params["configoption5"]));
        $whmCall->addParam('ftp',($params["configoption6"]== 'on'?1:0));
        $whmCall->addParam('log_file',($params["configoption7"]== 'on'?1:0));
        $whmCall->addParam('domain',$params["configoption8"]);
        $whmCall->addParam('max_connect',$params["configoption9"]);
        //$whmCall->addParam('speed_limit',intval($params["configoption10"])*1024);	//原先以B为单位
        $whmCall->addParam('speed_limit', intval($params["configoption10"]));
        $whmCall->addParam('subdir',$params["configoption11"]);
        $whmCall->addParam('subdir_flag',($params["configoption12"]== 'on'?1:0));
        $whmCall->addParam('max_subdir',intval($params["configoption13"]));
        //$whmCall->addParam('flow',$params["configoption14"]);
        $whmCall->addParam('flow_limit',intval($params["configoption14"]));
        $whmCall->addParam('envs',$params["configoption15"]);
        $whmCall->addParam('max_worker',$params["configoption16"]);
        $whmCall->addParam('vhost_domains',$params["domain"]);
        $whmCall->addParam('htaccess',1);
        $whmCall->addParam('access',1);
        if (trim($params["configoption17"]) != "") {
            /*附加参数处理*/
            $explode = explode('&', $params["configoption17"]);
            //多个参数
            if (is_array($explode)) {
                foreach($explode as $e) {
                    $k = explode('=', $e);
                    if ($k[0]=='c' || $k[0]=='a' || $k[0] == 's' || $k[0] == 'r') {
                        continue;
                    }
                    $whmCall->addParam($k[0],$k[1]);
                }
                //一个参数
            }else {
                $k = explode('=',$params["configoption17"]);
                if (is_array($k)) {
                    if ($k[0]=='c' || $k[0]=='a' || $k[0] == 's' || $k[0] == 'r') {
                        // continue;
                    }
                    $whmCall->addParam($k[0],$k[1]);
                }
            }
        }
        //$whmCall->addParam('port',$params['configoption18']);
        $whmCall->addParam('port',($params["configoption18"] == 'on'?"80,443s":"80"));
        if(!empty($params['configoption19'])){
            $whmCall->addParam('cron',$params['configoption19']);
        }

        if ($edit) {
            $whmCall->addParam('edit',1);
        }
        $whmCall->addParam('init',1);
        return $this->easypanel_call($whmCall,$params);
    }
    public function easypanel_CreateAccount($params) {
        if ($params['username']=="") {
            return "username cann't be empty";
        }
        return $this->easypanel_update_account($params,false);
    }

    public function easypanel_TerminateAccount($params) {

        $whmCall = new WhmCall('del_vh');
        $whmCall->addParam('name', $params["username"]);
        return $this->easypanel_call($whmCall,$params);
    }

    public function easypanel_SuspendAccount($params) {

        $whmCall = new WhmCall('update_vh');
        $whmCall->addParam('name', $params["username"]);
        $whmCall->addParam('status',1);
        return $this->easypanel_call($whmCall,$params);
    }

    public function easypanel_UnsuspendAccount($params) {
        $whmCall = new WhmCall('update_vh');
        $whmCall->addParam('name', $params["username"]);
        $whmCall->addParam('status',0);
        return $this->easypanel_call($whmCall,$params);
    }

    public function easypanel_ChangePassword($params) {

        $whmCall = new WhmCall('change_password');
        $whmCall->addParam('name', $params["username"]);
        $whmCall->addParam('passwd',$params["password"]);
        return $this->easypanel_call($whmCall,$params);
    }

    public function easypanel_ChangePackage($params) {
        return $this->easypanel_update_account($params,true);
    }

    public function easypanel_GetinfoHost($params) {
        $whmCall = new WhmCall('getVh');
        $whmCall->addParam('name', $params["username"]);
        return $this->easypanel_call($whmCall,$params);
    }

    //创建站点
    /**init : 1  //表示创建
     *name:网站账号,数据库账号,ftp账号同步
     *passwd:网站密码,数据库密码，ftp密码同步(只创建时同步)
     * product_id 产品ID
     * @param $params
     * @return string
     */
    public function easypanel_Createvhost($params){
        $name = isset($params["username"]) ? $params["username"]:"";

        $passwd = isset($params["passwd"]) ? $params["passwd"]:"";

        $product_id =isset($params["product_id"]) ? $params["product_id"]:"0";

        $month =isset($params["month"]) ? $params["month"]:0;

        $db_quota =isset($params["db_quota"]) ? $params["db_quota"]:0;

        $db_type =isset($params["db_type"]) ? $params["db_type"]:"mysql";

        $whmCall = new WhmCall('add_vh');
        $whmCall->addParam('name', $name);
        $whmCall->addParam('passwd', $passwd);
        $whmCall->addParam('product_id', $product_id);
        $whmCall->addParam('month', $month);
        $whmCall->addParam('db_quota', $db_quota);
        $whmCall->addParam('db_type', $db_type);

        return $this->easypanel_call($whmCall,$params);
    }

    //修改站点信息

    public function easypanel_Editvhost($params,$edit = true){

        $name = isset($params["username"]) ? $params["username"]:"";

        $month =isset($params["month"]) ? $params["month"]:0;
        $product_id =isset($params["product_id"]) ? $params["product_id"]:"0";

        $whmCall = new WhmCall('add_vh');
        $whmCall->addParam('name', $name);

        $whmCall->addParam('product_id', $product_id);
        $whmCall->addParam('month', $month);
        if ($edit) {
            $whmCall->addParam('edit',1);
        }
        return $this->easypanel_call($whmCall,$params);


    }

    //续费
    public function easypanel_addExpireTime($params){
        $name = isset($params["username"]) ? $params["username"]:"";

        $month =isset($params["month"]) ? $params["month"]:0;
        $product_id =isset($params["product_id"]) ? $params["product_id"]:"0";

        $whmCall = new WhmCall('addExpireTime');
        $whmCall->addParam('name', $name);

        $whmCall->addParam('product_id', $product_id);
        $whmCall->addParam('month', $month);

        return $this->easypanel_call($whmCall,$params);
    }

    public function easypanel_ClientArea($params) {

        # Output can be returned like this, or defined via a clientarea.tpl template file (see docs for more info)

        $code = '<form action="http://'.$params["serverip"].':3312/vhost/?c=session&a=login" method="post" target="_blank">
<input type="hidden" name="username" value="'.$params["username"].'" />
<input type="hidden" name="passwd" value="'.$params["password"].'" />
<input type="submit" value="登录" />
</form>';
        return $code;

    }

    public function easypanel_AdminLink($params) {

        $code = '<form action="http://'.$params["serverip"].':'.$params["port"].'/admin/?c=session&a=login" method="post" target="_blank">
<input type="hidden" name="username" value="'.$params["serverusername"].'" />
<input type="hidden" name="passwd" value="'.$params["serverpassword"].'" />
<input type="submit" value="登录管理" />
</form>';
        return $code;

    }

    public function easypanel_LoginLink($params) {

        echo "<a href=\"http://".$params["serverip"].":".$params["port"]."/vhost/?username=".$params["username"]."\" target=\"_blank\" style=\"color:#cc0000\">登录easypanel</a>";

    }

    public function easypanel_reboot($params) {

        # Code to perform reboot action goes here...

        return "还未实现";

    }

    public function easypanel_shutdown($params) {

        return "还未实现";

    }

    public function easypanel_ClientAreaCustomButtonArray() {
        $buttonarray = array(
            //"Reboot Server" => "reboot",
        );
        return $buttonarray;
    }

    public function easypanel_AdminCustomButtonArray() {
        $buttonarray = array(
            //"Reboot Server" => "reboot",
            //"Shutdown Server" => "shutdown",
        );
        return $buttonarray;
    }

    public function easypanel_extrapage($params) {
        $pagearray = array(
            'templatefile' => 'example',
            'breadcrumb' => ' > <a href="#">Example Page</a>',
            'vars' => array(
                'var1' => 'demo1',
                'var2' => 'demo2',
            ),
        );
        return $pagearray;
    }

    public function easypanel_UsageUpdate($params) {

        //还没实现
        $serverid = $params['serverid'];
        $serverhostname = $params['serverhostname'];
        $serverip = $params['serverip'];
        $serverusername = $params['serverusername'];
        $serverpassword = $params['serverpassword'];
        $serveraccesshash = $params['serveraccesshash'];
        $serversecure = $params['serversecure'];

        # Run connection to retrieve usage for all domains/accounts on $serverid

        # Now loop through results and update DB

        foreach ($results AS $domain=>$values) {
            update_query("tblhosting",array(
                "diskused"=>$values['diskusage'],
                "dislimit"=>$values['disklimit'],
                "bwused"=>$values['bwusage'],
                "bwlimit"=>$values['bwlimit'],
                "lastupdate"=>"now()",
            ),array("server"=>$serverid,"domain"=>$values['domain']));
        }

    }

    public function easypanel_AdminServicesTabFields($params) {

        $result = select_query("mod_customtable","",array("serviceid"=>$params['serviceid']));
        $data = mysql_fetch_array($result);
        $var1 = $data['var1'];
        $var2 = $data['var2'];
        $var3 = $data['var3'];
        $var4 = $data['var4'];

        $fieldsarray = array(
            'Field 1' => '<input type="text" name="modulefields[0]" size="30" value="'.$var1.'" />',
            'Field 2' => '<select name="modulefields[1]"><option>Val1</option</select>',
            'Field 3' => '<textarea name="modulefields[2]" rows="2" cols="80">'.$var3.'</textarea>',
            'Field 4' => $var4, # Info Output Only
        );
        return $fieldsarray;

    }

    public function easypanel_AdminServicesTabFieldsSave($params) {
        update_query("mod_customtable",array(
            "var1"=>$_POST['modulefields'][0],
            "var2"=>$_POST['modulefields'][1],
            "var3"=>$_POST['modulefields'][2],
        ),array("serviceid"=>$params['serviceid']));
    }

    public function random_code_type($length = 8,$type = 'alpha-number'){
        $code_arr = array(
            'alpha' => 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
            'number'=> '0123456789',
            'sign'  => '#$@*-_',
        );

        $type_arr = explode('-',$type);

        foreach($type_arr as $t){
            if( ! array_key_exists($t,$code_arr)){
                trigger_error("Can not generate type ($t) code");
            }
        }

        $chars = '';

        foreach($type_arr as $t){
            $chars .= $code_arr[$t];
        }
        $chars = str_shuffle($chars);
        $number = $length > strlen($chars) - 1 ? strlen($chars) - 1:$length;
        return substr($chars,0,$number);
    }
}


?>