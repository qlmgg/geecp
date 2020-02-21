<?php
// +----------------------------------------------------------------------
// | Gee 安装模块
// +----------------------------------------------------------------------
// | Author: 依然范儿特西 <3151775165@qq.com>
// +----------------------------------------------------------------------

namespace app\install\controller;
use think\Controller;
use think\Db;
use think\facade\View;

require_once __DIR__ . '/../data/function.php';

class Index extends Controller
{
    protected function initialize()
    {
        if (sys_is_installed()) {
            $this->error('网站已经安装','/');
        }
        if (!is_writable(GEE_DATA)) {
            abort(500, '目录' . realpath(GEE_ROOT . 'data') . '无法写入！');
        }
    }

    // 安装首页
    public function step1()
    {
        return $this->fetch(":step1");
    }

    //安装检测
    public function step2()
    {
        $check_data = [];
        $check_data['phpversion'] = @phpversion();
        $check_data['os']         = PHP_OS;

        //模块检测
        $result_model = sys_install_model_check();
        //文件检测
        $result_file = sys_install_file_check();
        //依赖函数检测
        $result_fun = sys_install_fun_check();

        $total_error_num = 0;
        if($result_model & $result_file & $result_fun){
            $total_error_num = $result_model['error_num'] + $result_file['error_num'] + $result_fun['error_num'];
            echo $result_model['error_num'];
        }

        $this->assign([
            'check_data'   =>  $check_data,
            'result_envir' => $result_model['data'],
            'result_file'  => $result_file['data'],
            'result_fun'  =>  $result_fun['data'],
            'total_error_num'=>$total_error_num,
        ]);

        return $this->fetch(":step2");

    }

    //配置数据库以及管理信息
    public function step3()
    {
        return $this->fetch(":step3");
    }

    //安装数据库
    public function step4()
    {
        session(null);
        if ($this->request->isPost()) {
            $request_data = $this->request->param();
            /**
             * code
             * 此处增加字段校验
             */
            //数据库链接信息
            $dbConfig             = [];
            $dbConfig['type']     = "mysql";
            $dbConfig['hostname'] = $request_data['db_hostname'];
            $dbConfig['username'] = $request_data['db_username'];
            $dbConfig['password'] = $request_data['db_password'];
            $dbConfig['hostport'] = $request_data['db_hostport'];
            $dbConfig['charset']  = 'utf8mb4';

            //管理员信息
            $admin_name    = $request_data['admin_name'];
            $admin_pswd    = $request_data['admin_pswd'];  //6-32位
            $admin_pswd_re = $request_data['admin_pswd_re'];
            $admin_email   = $request_data['admin_email'];

            /**
             * code
             * 校验两次密码是否一直
             */
            try {
                 //创建数据库
                $db_connect    = Db::connect($dbConfig);
                $db_database_name = $request_data['db_database'];
                $create_database_sql    = "CREATE DATABASE IF NOT EXISTS `{$db_database_name}` DEFAULT CHARACTER SET " . $dbConfig['charset'];
                $db_connect->execute($create_database_sql);

                $dbConfig['database'] = $db_database_name;
                $dbConfig['prefix']   = 'gee_';

                //读取sql文件
                $all_sql  = sys_install_list_sql(dirname(__DIR__) . '/data/gee.sql', $dbConfig['prefix'], $dbConfig['charset']);

                //暂存
                session('install.error', 0);
                session('install.db_config', $dbConfig);
                session('install.all_sql', $all_sql);
                session('install.admin_info', [
                    'username' => $admin_name,
                    'password'  => $admin_pswd,
                    'email' => $admin_email
                ]);

                return $this->fetch(":step4");

            } catch (\Exception $e) {

                $this->error('请求错误');
            }
        } else {
            $this->error('非法请求方式');
        }
    }


    //执行安装
    public function action()
    {
        $dbConfig = session('install.db_config');
        $all_sql  = session('install.all_sql');

        if (empty($dbConfig) || empty($all_sql)) {
            return json(['staus'=>'1','message'=>'非法安装','result'=>'']);
        }

        $sqlIndex = $this->request->param('sql_index', 0, 'intval');

        $db = Db::connect($dbConfig);

        if ($sqlIndex >= count($all_sql)) {
            $installError = session('install.error');
            session("install.step",'4');
            return json(['staus'=>'2','done' => 2,'message'=>'安装完成','result'=>$installError]);
        }
        $sqlToExec = $all_sql[$sqlIndex] . ';';
        $result_list_sql = sys_install_execute_sql($db, $sqlToExec);
        if ($result_list_sql['result'] == 'success') {
            $result_data = [
                'sql'       => $sqlToExec,
                'message' =>$result_list_sql['message'],
            ];
            return json(
                [
                    'staus'=>'2',
                    'done' => 1,
                    'message'=>$result_list_sql['message'],
                    'result'=>$installError
                ]);
        } else {
            $installError = session('install.error');
            $installError = empty($installError) ? 0 : $installError;
            session('install.error', $installError + 1);
            $result_data = [
                'sql'       => $sqlToExec,
                'exception' => $result_list_sql['exception'],
                'installError'=>$installError,
            ];
            return json(
                [
                    'staus'=>'1',
                    'done' => 1,
                    'message'=>$result_list_sql['message'],
                    'result'=>$result_data
                ]);
        }
    }


    //创建管理员账户
    public function create_admin()
    {
        $dbConfig = session('install.db_config');
        $admin_info = session('install.admin_info');
        if (empty($dbConfig)  || empty($admin_info)) {
            return json(['staus'=>'1','message'=>'非法安装']);
        }
        try {
            $now_time = time();
            $admin_indata = [
                'id'=>'1',
                'username'=>$admin_info['username'],
                'email'=>$admin_info['email'],
                'password'=>password_hash($admin_info['password'],PASSWORD_DEFAULT),
                'create_time'=>$now_time,
                'update_time'=>$now_time,
            ];
            Db::name('adminuser')->insert($admin_indata);
        } catch (\Exception $e) {
            return json(['staus'=>'1','message'=>'管理员信息导入失败'.$e->getMessage()]);
        }
        return json(['staus'=>'2','message'=>'网站创建完成']);
    }


    //更新数据库配置
    public function update_dbconfig()
    {   
        $dbConfig = session('install.db_config');
        if (!empty($dbConfig)) {
            try {
                //读取系统配置内容
                $dbconfig_path = APP_PATH . 'database.php';
                $site_conf = htmlentities(file_get_contents($dbconfig_path));
                //替换配置项
                foreach ($dbConfig as $key => $value) {
                    $pats = '/\'' . $key . '\'(.*?)\',/';
                    $reps = "'". $key. "'". "			=> " . "'".$value ."',";
                    $site_conf = preg_replace($pats, $reps, $site_conf); // 正则查找然后替换
                }
                if (!file_exists($dbconfig_path)) {
                    mkdir($dbconfig_path, 0777, true);
                }
                $result = file_put_contents($dbconfig_path, stripslashes(htmlspecialchars_decode($site_conf)));    
            } catch (\Exception $e) {
                return json(['staus'=>'1','message'=>'配置文件更新失败']); 
            }
            return json(['staus'=>'2','message'=>'配置文件更新完成']); 
        }else{
            return json(['staus'=>'1','message'=>'非法操作']); 
        }
    }

    //安装完成
    public function step5()
    {
        if (session("install.step") == 4) {
            @touch(GEE_DATA . 'install.lock');
            return $this->fetch(":step5");
        } else {
            $this->redirect("/install/step1");
        }
    }


    //测试数据库密码
    public function testDbPwd()
    {
        if ($this->request->isPost()) {
            $dbConfig         = $this->request->param();
            $dbConfig['type'] = "mysql";

            $supportInnoDb = false;

            try {
                $engines = Db::connect($dbConfig)->query("SHOW ENGINES;");
                foreach ($engines as $engine) {
                    if ($engine['Engine'] == 'InnoDB' && $engine['Support'] != 'NO') {
                        $supportInnoDb = true;
                        break;
                    }
                }
            } catch (\Exception $e) {
                $this->error('数据库账号或密码不正确！' . $e->getMessage());
            }
            if ($supportInnoDb) {
                $this->success('验证成功！');
            } else {
                $this->error('数据库账号密码验证通过，但不支持InnoDb!');
            }
        } else {
            $this->error('非法请求方式！');
        }

    }






}

