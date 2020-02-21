<?php
namespace app\admin\model;

use think\Model;
use app\admin\model\GeeProduct; // 产品表

/**
 * 云主机表
 */
class GeeCloudserver extends Model
{
    protected $name = "Cloudserver";
    public function getStatussAttr($var, $data)
    {
        switch ($data['status']) {
            case '1':
                return '运行';
                break;
            case '2':
                return '关机';
                break;
            case '3':
                return '挂起';
                break;
            case '4':
                return '关机中';
                break;
            case '5':
                return '创建';
                break;
            case '8':
                return '重装';
                break;
            case '11':
                return '迁移';
                break;
            case '12':
                return '迁移完成';
                break;
            case '13':
                return '暂停';
                break;
        }
    }
    public function getProConfigAttr($var, $data)
    {

      $pro = new GeeProduct();
      $item = $pro->where('id = '.$data['pro_id'])->find()->toArray();
      $d = explode("|", $item['describe']);
      return $d;
    }
}
