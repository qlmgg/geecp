<?php

namespace gee;

use gee\Http;
use RecursiveDirectoryIterator;
use RecursiveIteratorIterator;
use think\Config;
use think\Db;
use think\Exception;
use ZipArchive;

/**
 * 更新服务
 * @package think
 */
class Service
{

  /**
   * 远程下载更新包
   *
   * @param   string $name 更新包名称
   * @param   array $extend 扩展参数
   * @return  string
   * @throws  UpdateException
   * @throws  Exception
   */
  public static function download($name, $extend = [])
  {
    $addonTmpDir = RUNTIME_PATH . 'update' . DS;
    if (!is_dir($addonTmpDir)) {
      @mkdir($addonTmpDir, 0755, true);
    }
    $tmpFile = $addonTmpDir . $name . ".zip";

    //如果文件已存在,直接返回
    if (file_exists($tmpFile)) {
      return $tmpFile;
    }

    $options = [
      CURLOPT_CONNECTTIMEOUT => 30,
      CURLOPT_TIMEOUT        => 30,
      CURLOPT_SSL_VERIFYPEER => false,
      CURLOPT_HTTPHEADER     => [
        'X-REQUESTED-WITH: XMLHttpRequest'
      ]
    ];
    $ret = Http::sendRequest(self::getServerUrl() . '/' . $name . ".zip", [], 'GET', $options);
    if ($ret['ret']) {
      if (substr($ret['msg'], 0, 1) == '{') {
        $json = (array) json_decode($ret['msg'], true);
        //如果传回的是一个下载链接,则再次下载
        if ($json['data'] && isset($json['data']['url'])) {
          array_pop($options);
          $ret = Http::sendRequest($json['data']['url'], [], 'GET', $options);
          if (!$ret['ret']) {
            //下载返回错误，抛出异常
            throw new UpdateException($json['msg'], $json['code'], $json['data']);
          }
        } else {
          //下载返回错误，抛出异常
          throw new UpdateException($json['msg'], $json['code'], $json['data']);
        }
      }
      if ($write = fopen($tmpFile, 'w')) {
        fwrite($write, $ret['msg']);
        fclose($write);
        return $tmpFile;
      }
      throw new Exception("没有权限写入临时文件");
    }
    throw new Exception("无法下载远程文件");
  }

  /**
   * 解压更新包
   *
   * @param   string $name 更新包名称
   * @return  string
   * @throws  Exception
   */
  public static function unzip($name)
  {
    $file = RUNTIME_PATH . 'update' . DS . $name . '.zip';
    $dir = RUNTIME_PATH . $name . DS;
    if (class_exists('ZipArchive')) {
      $zip = new ZipArchive;
      if ($zip->open($file) !== TRUE) {
        throw new Exception('Unable to open the zip file');
      }
      if (!$zip->extractTo($dir)) {
        $zip->close();
        throw new Exception('Unable to extract the file');
      }
      $zip->close();
      return $dir;
    }
    throw new Exception("无法执行解压操作，请确保ZipArchive安装正确");
  }


  /**
   * 是否有冲突
   *
   * @param   string $name 更新包名称
   * @return  boolean
   * @throws  UpdateException
   */
  public static function noconflict($name)
  {
    // 检测冲突文件
    $list = self::getGlobalFiles($name, true);
    if ($list) {
      //发现冲突文件，抛出异常
      throw new UpdateException("发现冲突文件", -3, ['conflictlist' => $list]);
    }
    return true;
  }

  /**
   * 导入SQL
   *
   * @param   string $name 更新包名称
   * @return  boolean
   */
  public static function importsql($name)
  {
    $sqlFile = RUNTIME_PATH . $name . DS . 'update.sql';
    if (is_file($sqlFile)) {
      $lines = file($sqlFile);
      $templine = '';
      foreach ($lines as $line) {
        if (substr($line, 0, 2) == '--' || $line == '' || substr($line, 0, 2) == '/*')
          continue;

        $templine .= $line;
        if (substr(trim($line), -1, 1) == ';') {
          // $templine = str_ireplace('__PREFIX__', config('database.prefix'), $templine);
          //  $templine = str_ireplace('INSERT INTO ', 'INSERT IGNORE INTO ', $templine);
          try {
            Db::getPdo()->exec($templine);
          } catch (\PDOException $e) {
            //$e->getMessage();
          }
          $templine = '';
        }
      }
    }
    return true;
  }



  /**
   * 更新
   *
   * @param   string $name 更新包名称
   * @param   boolean $force 是否覆盖
   * @param   array $extend 扩展参数
   * @return  boolean
   * @throws  Exception
   * @throws  UpdateException
   */
  public static function update($name, $force = false, $extend = [])
  {


    $version = self::getVersion($name);

    if (!version_compare($version, config('geecp.version'), '>')) {
      throw new Exception('版本号错误');
    }

    $name = $name . '-' . $version;
    // 远程下载更新包
    $tmpFile = Service::download($name, $extend);


    // 解压
    $updateDir = Service::unzip($name);

    try {

      if (!$force) {
        Service::noconflict($name);
      }
    } catch (UpdateException $e) {
      @rmdirs($updateDir);
      throw new UpdateException($e->getMessage(), $e->getCode(), $e->getData());
    } catch (Exception $e) {
      @rmdirs($updateDir);
      throw new Exception($e->getMessage());
    }


    foreach (self::getCheckDirs() as $k => $dir) {
      if (is_dir($updateDir . $dir)) {
        $fileslog = copydirs($updateDir . $dir, ROOT_PATH . $dir);
      }
    }

    // 移除临时文件
    @rmdirs($updateDir);

    // 导入
    Service::importsql($name);

    //更新版本号
    setconfig(['geecp', 'version'], [$version]);
    $file_path = ROOT_PATH . DS . "/public/v.txt";
    $fp = fopen($file_path, "w");  //w是写入模式，文件不存在则创建文件写入。
    $len = fwrite($fp, $version);
    fclose($fp);

    return true;
  }

  /**
   * 获取更新包在全局的文件
   *
   * @param   string $name 更新包名称
   * @return  array
   */
  public static function getGlobalFiles($name, $onlyconflict = false)
  {
    $list = [];
    $appDir =  RUNTIME_PATH . $name . DS;
    // 扫描更新包目录是否有覆盖的文件
    foreach (self::getCheckDirs() as $k => $dir) {
      $checkDir = ROOT_PATH . DS . $dir . DS;
      if (!is_dir($checkDir))
        continue;
      //检测到存在更新包外目录
      if (is_dir($appDir . $dir)) {
        //匹配出所有的文件
        $files = new RecursiveIteratorIterator(
          new RecursiveDirectoryIterator($appDir . $dir, RecursiveDirectoryIterator::SKIP_DOTS),
          RecursiveIteratorIterator::CHILD_FIRST
        );

        foreach ($files as $fileinfo) {
          if ($fileinfo->isFile()) {
            $filePath = $fileinfo->getPathName();
            $path = str_replace($appDir, '', $filePath);
            if ($onlyconflict) {
              $destPath = ROOT_PATH . $path;
              if (is_file($destPath)) {
                if (filesize($filePath) != filesize($destPath) || md5_file($filePath) != md5_file($destPath)) {
                  $list[] = $path;
                }
              }
            } else {
              $list[] = $path;
            }
          }
        }
      }
    }
    return $list;
  }



  /**
   * 获取远程服务器
   * @return  string
   */
  protected static function getServerUrl()
  {
    return config('geecp.api_url');
  }

  /**
   * 获取检测的全局文件夹目录
   * @return  array
   */
  protected static function getCheckDirs()
  {
    return [
      'addons',
      'extend',
      'application',
      'public'
      //'thinkphp',
    ];
  }

  /**
   * 获取更新版本号
   * @return string
   */
  public static function getVersion()
  {

    $str = str_replace(".", '', config('geecp.version')) + 1;
    $version = join('.', preg_split('//u', $str));
    $version = ltrim(rtrim($version, '.'), '.');

    return $version;
  }

  /**
   * 获取更新包的文件列表
   * @param $name
   * @return array
   */
  public static function getfilesNum($name)
  {

    $list = [];
    $appDir =  RUNTIME_PATH . $name . DS;

    if (is_dir($appDir)) {
      //匹配出所有的文件
      $files = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($appDir, RecursiveDirectoryIterator::SKIP_DOTS),
        RecursiveIteratorIterator::CHILD_FIRST
      );

      foreach ($files as $fileinfo) {
        if ($fileinfo->isFile()) {
          $filePath = $fileinfo->getPathName();
          $path = str_replace($appDir, '', $filePath);
          $list[] = $path;
        }
      }
    }
    return $list;
  }
}
