<?php
// +----------------------------------------------------------------------
// | Gee 安装使用公共方法
// +----------------------------------------------------------------------
// | Author: 依然范儿特西 <3151775165@qq.com>
// +----------------------------------------------------------------------


//模块检测
function sys_install_model_check(){
    $success_msg_content = '<span class="success"></span>';
    $error_msg_content   = '<span class="error"></span>';
    $err_num = 0;
    $envir_check_data               = [];  //环境检测   
    //pdo
    if (class_exists('pdo')) {
        $envir_check_data['pdo'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['pdo'] = $error_msg_content.' 未开启';
        $err_num++;
    }
    //pdo_mysql
    if (extension_loaded('pdo_mysql')) {
        $envir_check_data['pdo_mysql'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['pdo_mysql'] = $error_msg_content.' 未开启';
        $err_num++;
    }
    //curl
    if (extension_loaded('curl')) {
        $envir_check_data['curl'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['curl'] = $error_msg_content.' 未开启';
        $err_num++;
    }
    //gd
    if (extension_loaded('gd')) {
        $envir_check_data['gd'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['gd'] = $error_msg_content.' 未开启';
        if (function_exists('imagettftext')) {
            $envir_check_data['gd'] .= '<br>'.$error_msg_content.' FreeType Support未开启';
        }
        $err_num++;
    }
    //mbstring
    if (extension_loaded('mbstring')) {
        $envir_check_data['mbstring'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['mbstring'] = $error_msg_content.' 未开启';
        if (function_exists('imagettftext')) {
            $envir_check_data['mbstring'] .= '<br>'.$error_msg_content.' FreeType Support未开启';
        }
        $err_num++;
    }
    //fileinfo
    if (extension_loaded('fileinfo')) {
        $envir_check_data['fileinfo'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['fileinfo'] = $error_msg_content.' 未开启';
        $err_num++;
    }

    //ZipArchive  扩展名： php_zip
    if (extension_loaded('php_zip')) {
        $envir_check_data['php_zip'] = $success_msg_content.' 已开启';
    } else {
        $envir_check_data['php_zip'] = $error_msg_content.' 未开启';
        $err_num++;
    }
    //file_uploads
    if (ini_get('file_uploads')) {
        $envir_check_data['upload_size'] = $success_msg_content.' ' . ini_get('upload_max_filesize');
    } else {
        $envir_check_data['upload_size'] = $error_msg_content.' 禁止上传';
        $err_num++;
    }
    //开启后就可以用 $HTTP_RAW_POST_DATA 接收post raw data，不过通常也可以使用 php://input
    if (version_compare(phpversion(), '5.6.0', '>=') && version_compare(phpversion(), '7.0.0', '<') && ini_get('always_populate_raw_post_data') != -1) {
        $envir_check_data['always_populate_raw_post_data']          = $error_msg_content.' 未关闭';
        $envir_check_data['show_always_populate_raw_post_data_tip'] = true;
        $err_num++;
    } else {
        $envir_check_data['always_populate_raw_post_data'] = $success_msg_content.' 已关闭';
    }
    $result =  [
        'err_num'=>$err_num,
        'data'=>$envir_check_data,
    ];
    return $result;
}

//文件权限检测
function sys_install_file_check(){
    $success_msg_content = '<span class="success"></span>';
    $error_msg_content   = '<span class="error"></span>';
    $err_num = 0;
    $file_check_data = [];
    //database.php
    $file_path_database = APP_PATH.'database.php';
    if (is_writable($file_path_database)) {
        $file_check_data['./application/database.php'] = $success_msg_content.' 可写';
    } else {
        $file_check_data['./application/database.php'] = $error_msg_content.' 不可写';
        $err_num++;
    }
    //config.php
    $file_path_config = APP_PATH.'config.php';
    if (is_writable($file_path_config)) {
        $file_check_data['./application/config.php'] = $success_msg_content.' 可写';
    } else {
        $file_check_data['./application/config.php'] = $error_msg_content.' 不可写';
        $err_num++;
    }
    //runtime
    $file_path_runtime = GEE_ROOT.'runtime';
    if (is_writable($file_path_runtime)) {
        $file_check_data['./runtime'] = $success_msg_content.' 可写';
    } else {
        $file_check_data['./runtime'] = $error_msg_content.' 不可写';
        $err_num++;
    }
    //data
    $file_path_data = GEE_ROOT.'data';
    if (is_writable($file_path_data)) {
        $file_check_data['./data'] = $success_msg_content.' 可写';
    } else {
        $file_check_data['./data'] = $error_msg_content.' 不可写';
        $err_num++;
    }

    $result =  [
        'err_num'=>$err_num,
        'data'=>$file_check_data,
    ];
    return $result;
}

//函数依赖性检测
function  sys_install_fun_check(){
    $success_msg_content = '<span class="success"></span>';
    $error_msg_content   = '<span class="error"></span>';
    $err_num = 0;
    $check_data_fun = [];
    //gd
    if(function_exists('gd_info')){
        $check_data_fun['gd_info'] = $success_msg_content.' 支持';
    } else {
        $check_data_fun['gd_info'] = $error_msg_content.' 不支持';
        $err_num++;
    }
    //session_start
    if (function_exists('session_start')) {
        $check_data_fun['session'] = $success_msg_content.' 支持';
    } else {
        $check_data_fun['session'] = $error_msg_content.' 不支持';
        $err_num++;
    }
    //file_get_contents
    if (function_exists('file_get_contents')) {
        $check_data_fun['file_get_contents'] = $success_msg_content.' 支持';
    } else {
        $check_data_fun['file_get_contents'] = $error_msg_content.' 不支持';
        $err_num++;
    }
    //mysqli_connect
    if (function_exists('mysqli_connect')) {
        $check_data_fun['mysqli_connect'] = $success_msg_content.' 支持';
    } else {
        $check_data_fun['mysqli_connect'] = $error_msg_content.' 不支持';
        $err_num++;
    }
    
    $result = [
        'err_num'=>$err_num,
        'data'=>$check_data_fun,
    ];
    return $result;
}

/**
 * 切分SQL文件成多个可以单独执行的sql语句
 * @param        $file            string sql文件路径
 * @param        $tablePre        string 表前缀
 * @param string $charset         字符集
 * @param string $defaultTablePre 默认表前缀
 * @param string $defaultCharset  默认字符集
 * @return array
 */
function sys_install_list_sql($file, $tablePre, $charset = 'utf8mb4', $defaultTablePre = 'gee_', $defaultCharset = 'utf8mb4')
{
    if (file_exists($file)) {
        //读取SQL文件
        $sql = file_get_contents($file);
        $sql = str_replace("\r", "\n", $sql);
        $sql = str_replace("BEGIN;\n", '', $sql);//兼容 navicat 导出的 insert 语句
        $sql = str_replace("COMMIT;\n", '', $sql);//兼容 navicat 导出的 insert 语句
        $sql = str_replace($defaultCharset, $charset, $sql);
        $sql = trim($sql);
        //替换表前缀
        $sql  = str_replace(" `{$defaultTablePre}", " `{$tablePre}", $sql);
        $sqls = explode(";\n", $sql);
        return $sqls;
    }
    return [];
}


//执行sql
function sys_install_execute_sql($db, $sql)
{
    $sql = trim($sql);
    preg_match('/CREATE TABLE .+ `([^ ]*)`/', $sql, $matches);
    if ($matches) {
        $table_name = $matches[1];
        $msg        = "创建数据表{$table_name}";
        try {
            $db->execute($sql);
            return [
                'result'   => 'success',
                'message' => $msg . ' 成功！'
            ];
        } catch (\Exception $e) {
            return [
                'result'     => 'fail',
                'message'   => $msg . ' 失败！',
                'exception' => $e->getTraceAsString()
            ];
        }
    } else {
        try {
            $db->execute($sql);
            return [
                'result'   => 'success',
                'message' => 'SQL执行成功!'.$sql
            ];
        } catch (\Exception $e) {
            return [
                'result'     => 'fail',
                'message'   => 'SQL执行失败！',
                'exception' => $e->getTraceAsString()
            ];
        }
    }
}


?>