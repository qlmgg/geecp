/*
 Navicat Premium Data Transfer

 Source Server         : localhosts
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : gee

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 28/08/2020 16:15:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gee_accesskey
-- ----------------------------
DROP TABLE IF EXISTS `gee_accesskey`;
CREATE TABLE `gee_accesskey`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ak` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AccessKey',
  `sk` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SecretKey',
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_addons
-- ----------------------------
DROP TABLE IF EXISTS `gee_addons`;
CREATE TABLE `gee_addons`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件标识',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件作者',
  `range` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件所属模块',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件配置',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件介绍',
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权费',
  `is_list` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否包含列表 0:包含 1:不包含',
  `status` int(11) NULL DEFAULT 0 COMMENT '插件状态 0:未安装 1:未启用 2: 已启用',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_adminuser
-- ----------------------------
DROP TABLE IF EXISTS `gee_adminuser`;
CREATE TABLE `gee_adminuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码盐值',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` int(11) NULL DEFAULT NULL COMMENT '最后登录时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '员工状态 0:正常 1锁定',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `group_id` int(11) NULL DEFAULT 8 COMMENT '员工组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_annexconfig
-- ----------------------------
DROP TABLE IF EXISTS `gee_annexconfig`;
CREATE TABLE `gee_annexconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('0','ftp','bos','qiniu','oss') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '附件管理类型',
  `ftp_sever` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FTP服务器(文件读取地址)',
  `ftp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FTP账号',
  `ftp_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FTP密码',
  `ftp_port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FTP端口号',
  `ftp_pasv` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否开启被动模式 0:不开启 1:开启',
  `ftp_ssl` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否开启ssl链接 0:不开启 1:开启',
  `ftp_timeout` int(11) NULL DEFAULT 60 COMMENT '超时时间 默认60 单位s',
  `ftp_remoteroor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片服务器根目录',
  `bos_ak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '百度云存储AK',
  `bos_sk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '百度云存储sk',
  `bos_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '百度云存储bucket',
  `bos_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '百度云存储绑定域名',
  `qiniu_ak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储AK',
  `qiniu_sk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储SK',
  `qiniu_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储bucket',
  `qiniu_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储绑定域名',
  `oss_ak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云OSS存储AK',
  `oss_sk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云OSS存储SK',
  `oss_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云OSS存储bucket',
  `oss_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云OSS存储绑定域名',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_annexconfig
-- ----------------------------
INSERT INTO `gee_annexconfig` VALUES (1, '0', NULL, NULL, NULL, '', '0', '0', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', 1558084404, 1587457290);

-- ----------------------------
-- Table structure for gee_billing
-- ----------------------------
DROP TABLE IF EXISTS `gee_billing`;
CREATE TABLE `gee_billing`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `pro_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买产品合计 0:账户充值',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `manager_id` int(11) NULL DEFAULT NULL COMMENT '代理商支付时代理商ID',
  `type` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '交易类型 0:消费 1:充值 2:提现 3:退款 4:产品交易',
  `order_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单类型 0:不是订单 1:购买 2:续费 3:升级',
  `money` double(255, 2) NOT NULL COMMENT '交易金额',
  `use_rebates` double(255, 2) NULL DEFAULT NULL COMMENT '所使用返点',
  `industry_manager_id` int(11) NULL DEFAULT NULL COMMENT '所属代理商ID',
  `create_rebates_money` double(255, 2) NULL DEFAULT NULL COMMENT '产生返点金额',
  `balance` double(255, 2) NOT NULL COMMENT '交易后余额',
  `cash` double(255, 2) NULL DEFAULT NULL COMMENT '现金',
  `coupon_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用代金券ID',
  `channel_type` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '渠道类型 0:账户余额 1:第三方支付',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单备注',
  `status` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '交易状态 0:未支付 1:已支付 2:已取消',
  `order_status` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单状态 0:不是订单 1:已支付 2:待支付 3:已取消 4:已作废',
  `is_invoice` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否可开发票 0:不可 1:可开',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 302 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_cdn
-- ----------------------------
DROP TABLE IF EXISTS `gee_cdn`;
CREATE TABLE `gee_cdn`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `plug_id` int(11) NULL DEFAULT NULL COMMENT '所属插件id,product表的id,本系统产品',
  `plug_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件数据表',
  `plug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '接口的套餐类型',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id,插件明细表id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_cdn_easypanel
-- ----------------------------
DROP TABLE IF EXISTS `gee_cdn_easypanel`;
CREATE TABLE `gee_cdn_easypanel`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT 'host套餐类型',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_cloudserver
-- ----------------------------
DROP TABLE IF EXISTS `gee_cloudserver`;
CREATE TABLE `gee_cloudserver`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户ID',
  `plug_id` int(11) NULL DEFAULT NULL COMMENT '所属插件ID',
  `plug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '所用产品ID',
  `virtual_id` int(11) NULL DEFAULT NULL COMMENT '云主机ID(插件)',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '云主机名称(实际)',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '云主机名称',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '数据中心ID',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '节点ID',
  `os_id` int(11) NULL DEFAULT NULL COMMENT '操作系统',
  `os_versions_id` int(11) NULL DEFAULT NULL COMMENT '操作系统版本',
  `templates_id` int(11) NULL DEFAULT NULL COMMENT '操作系统模板ID',
  `sys_disk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统盘存储 GB (默认40GB免费)',
  `cds_disk` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'CDS云磁盘 GB 默认40GB',
  `mbps` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '带宽峰值',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `private_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内网IP',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理密码',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '云主机状态  0到期 1运行，2关机，3挂起，4关机中，5创建，8重装，11迁移，12迁移完成，13暂停',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_coupon
-- ----------------------------
DROP TABLE IF EXISTS `gee_coupon`;
CREATE TABLE `gee_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代金券码',
  `type` int(1) NULL DEFAULT NULL COMMENT '代金券类型 1:满减 2:折扣',
  `range` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '代金券可使用范围 0:通用 其他:产品类型',
  `reuse` int(11) NULL DEFAULT NULL COMMENT '代金券复用次数 0:无限制 其他:限制次数',
  `use_number` int(11) NULL DEFAULT NULL COMMENT '代金券已使用次数',
  `value` int(11) NULL DEFAULT NULL COMMENT '代金券优惠金额 类型为1时填金额 否则填折扣比率',
  `minvalue` int(11) NULL DEFAULT NULL COMMENT '最低可使用消费额度 0:无限制 其他:最低可使用金额',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '代金券所属用户',
  `status` int(1) NULL DEFAULT NULL COMMENT '代金券状态 0:未使用 1:使用中 2:已使用 3:已到期 4:已作废',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_dns
-- ----------------------------
DROP TABLE IF EXISTS `gee_dns`;
CREATE TABLE `gee_dns`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `plug_id` int(11) NULL DEFAULT NULL COMMENT '所属插件id,product表的id,本系统产品',
  `plug_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件数据表',
  `plug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '接口的套餐类型',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id,插件明细表id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_dns_dnspod
-- ----------------------------
DROP TABLE IF EXISTS `gee_dns_dnspod`;
CREATE TABLE `gee_dns_dnspod`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `domain_id` int(11) NULL DEFAULT NULL COMMENT 'dnspod域名Id',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `level` tinyint(1) NULL DEFAULT NULL COMMENT 'vip版本',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_dns_recordlist
-- ----------------------------
DROP TABLE IF EXISTS `gee_dns_recordlist`;
CREATE TABLE `gee_dns_recordlist`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `record_id` int(11) NULL DEFAULT NULL COMMENT '接口记录Id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `dns_dnspod_id` int(11) NULL DEFAULT NULL COMMENT '域名关联id',
  `sub_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机记录',
  `record_type` enum('A','AAAA','CNAME','MX','NS','TXT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录类型',
  `record_line_id` int(11) NULL DEFAULT NULL COMMENT '线路的ID',
  `record_line` tinyint(1) NULL DEFAULT NULL COMMENT '解析线路 0:默认 1:电信 2:移动 3:联通 4:教育网 5:百度',
  `value` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录值',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `mx` tinyint(1) NULL DEFAULT NULL COMMENT '范围1-20, MX记录必选',
  `ttl` int(11) NULL DEFAULT NULL COMMENT 'TTL 5分钟:300,10分钟:600,1小时:3600',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_domain
-- ----------------------------
DROP TABLE IF EXISTS `gee_domain`;
CREATE TABLE `gee_domain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `domainname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `userid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '联系人ID',
  `domainpass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名密码',
  `isname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为姓名域名 0:普通域名 1:姓名域名',
  `dns` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'DNS服务器 [{dns1: \"\"},{dns2:\"\"}]',
  `status` int(11) NULL DEFAULT NULL COMMENT '域名状态 0:待审核 1:审核中 2:正常 3:审核未通过',
  `r_status` int(11) NULL DEFAULT NULL COMMENT '备案状态 0:未备案 1:备案审核中 2:正常 3:审核未通过',
  `r_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名状态 具体看美橙文档',
  `d_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名命名状态 具体看美橙文档',
  `domaintype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名状态 具体看美橙文档',
  `newstas` int(11) NULL DEFAULT NULL COMMENT '域名隐私保护 0:关闭 1:开启',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_domain_cndns
-- ----------------------------
DROP TABLE IF EXISTS `gee_domain_cndns`;
CREATE TABLE `gee_domain_cndns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `userid` int(11) NULL DEFAULT NULL COMMENT '联系人ID',
  `domainname` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域名',
  `years` int(11) NULL DEFAULT NULL COMMENT '注册年限',
  `domainpass` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域名密码',
  `isname` int(11) NULL DEFAULT NULL COMMENT '是否为姓名域名 0:普通域名 1:姓名域名',
  `dns` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'DNS服务器 [{dns1: \"\"},{dns2:\"\"}]',
  `status` int(11) NULL DEFAULT NULL COMMENT '域名状态 0:待审核 1:审核中 2:正常 3:审核未通过',
  `r_status` int(11) NULL DEFAULT NULL COMMENT '备案状态 0:未备案 1:备案审核中 2:正常 3:审核未通过',
  `newstas` int(11) NULL DEFAULT NULL COMMENT '域名隐私保护 0:关闭 1:开启',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_domain_contact
-- ----------------------------
DROP TABLE IF EXISTS `gee_domain_contact`;
CREATE TABLE `gee_domain_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名所有者(英文) 至少包含一个空格',
  `lastname_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓(英文)',
  `firstname_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名(英文)',
  `country_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家代码(英文)  中国 CN',
  `state_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份(英文)',
  `city_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市(英文)',
  `address_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址(英文)',
  `company_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名所有者(中文) 企业长度至少6位 个人长度至少2位  (1汉字=2位)',
  `lastname_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓(中文)',
  `firstname_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名(中文)',
  `country_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家代码(中文)',
  `state_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份(中文)',
  `city_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市(中文)',
  `address_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址(中文)',
  `zipcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `usertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名类型 (O:企业  I:个人)',
  `idtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
  `idnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
  `ischecked` int(11) NULL DEFAULT NULL COMMENT '审核状态 0:未审核 1:待审核 2:通过 3:失败 5:未上传资料 6:黑名单 8:上传中',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 1:正常 2:禁用',
  `contact_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '联系人模板ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_domain_price
-- ----------------------------
DROP TABLE IF EXISTS `gee_domain_price`;
CREATE TABLE `gee_domain_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '域名后缀',
  `origin_price` double(11, 2) NULL DEFAULT NULL COMMENT '原价(元/年)',
  `price` double(11, 2) NULL DEFAULT NULL COMMENT '促销价(元/年)',
  `recharge` double(11, 2) NULL DEFAULT NULL COMMENT '续费价(元/年)',
  `transferin` double(11, 2) NULL DEFAULT NULL COMMENT '转入价(元/年)',
  `twelvemonth` double(11, 2) NULL DEFAULT NULL COMMENT '一年价',
  `biennia` double(11, 2) NULL DEFAULT NULL COMMENT '两年价',
  `triennium` double(11, 2) NULL DEFAULT NULL COMMENT '三年价',
  `quadrennium` double(11, 2) NULL DEFAULT NULL COMMENT '四年价',
  `lustrum` double(11, 2) NULL DEFAULT NULL COMMENT '五年价',
  `decade` double(11, 2) NULL DEFAULT NULL COMMENT '十年价',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '所使用产品ID',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_emailconfig
-- ----------------------------
DROP TABLE IF EXISTS `gee_emailconfig`;
CREATE TABLE `gee_emailconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP服务器',
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP端口',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP密码',
  `secure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP验证方式',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP发件人信箱',
  `emailname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'SMTP发件人姓名',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_emailconfig
-- ----------------------------
INSERT INTO `gee_emailconfig` VALUES (1, '', '', '', '', '', '', '', 1557975644, 1557991905);

-- ----------------------------
-- Table structure for gee_host
-- ----------------------------
DROP TABLE IF EXISTS `gee_host`;
CREATE TABLE `gee_host`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `plug_id` int(11) NULL DEFAULT NULL COMMENT '所属插件id,product表的id,本系统产品',
  `plug_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件数据表',
  `plug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '接口的套餐类型',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id,插件明细表id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_host_direct
-- ----------------------------
DROP TABLE IF EXISTS `gee_host_direct`;
CREATE TABLE `gee_host_direct`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT 'host套餐类型',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_host_easypanel
-- ----------------------------
DROP TABLE IF EXISTS `gee_host_easypanel`;
CREATE TABLE `gee_host_easypanel`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT 'host套餐类型',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_invoice
-- ----------------------------
DROP TABLE IF EXISTS `gee_invoice`;
CREATE TABLE `gee_invoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '申请用户',
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发票号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发票抬头',
  `money` double(255, 2) NOT NULL COMMENT '发票金额',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票内容',
  `type` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发票类型 0:普通发票 1:增值税专用发票',
  `status` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '发票状态 0:审核中 1:已寄出 2:已取消 3:未通过',
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票备注',
  `n_type` int(11) NULL DEFAULT NULL COMMENT '普票类型 0:个人普票 1:企业类普票',
  `taxpayerno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行名称',
  `bankuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户账号',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '开户银行地址',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所留电话',
  `addr_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `addr_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人所在地区',
  `addr_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人街道地址',
  `addr_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮政编码',
  `addr_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人联系电话',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_invoice_addr
-- ----------------------------
DROP TABLE IF EXISTS `gee_invoice_addr`;
CREATE TABLE `gee_invoice_addr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `province` int(11) NULL DEFAULT NULL COMMENT '省份',
  `city` int(11) NULL DEFAULT NULL COMMENT '城市',
  `district` int(11) NULL DEFAULT NULL COMMENT '区域',
  `region` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所在地区 省+市+区总合',
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细地址',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `is_defualt` int(11) NULL DEFAULT NULL COMMENT '是否为默认地址 0:不是 1:是',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_invoice_info
-- ----------------------------
DROP TABLE IF EXISTS `gee_invoice_info`;
CREATE TABLE `gee_invoice_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '发票类型 0:增值税普通发票 1:增值税专用发票',
  `n_type` int(11) NULL DEFAULT NULL COMMENT '普票类型 0:个人普票 1:企业类普票',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发票抬头',
  `taxpayerno` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纳税人识别号',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行名称',
  `bankuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户账号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_log
-- ----------------------------
DROP TABLE IF EXISTS `gee_log`;
CREATE TABLE `gee_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志内容',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作IP',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1378 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_msglog
-- ----------------------------
DROP TABLE IF EXISTS `gee_msglog`;
CREATE TABLE `gee_msglog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息类型',
  `to` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接收人',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息模板名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `res` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请求结果',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 352 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_msgmodel
-- ----------------------------
DROP TABLE IF EXISTS `gee_msgmodel`;
CREATE TABLE `gee_msgmodel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '模板类型 0:短信验证码 1:短信通知  2:邮件验证码 3:邮件通知',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板标识',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板内容',
  `model_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板ID',
  `wx_temp_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '微信模板ID',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '模板状态 0:可用 1:禁用',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_msgmodel
-- ----------------------------
INSERT INTO `gee_msgmodel` VALUES (1, '3', 'defaultEmail', '默认测试邮件', '这是一个默认邮件模板\n网站名称：{basic_name}|\n联系邮箱：{basic_email}|\n网站首页域名：{basic_url}|\nlogo图片路径：{basic_logo}|\nICP备案：{basic_icp}|\n网安备案：{basic_beian}|\nIDC备案：{basic_idc}|\nISP备案：{basic_isp}|\n自定义变量：{basic_qwejo}|\n邮件随机验证码：{email_code}|\n短信随机验证码：{sms_code}', NULL, NULL, '0', 1557988637, 1585123324);
INSERT INTO `gee_msgmodel` VALUES (13, '3', 'serverOverdue', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器{name}即将到期，请尽快续费以免服务器过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (4, '0', 'registerCode', '注册验证码模版', '您正在注册{basic_name}账号，验证码为{sms_code}，请勿将验证码告诉他人。', '10002', NULL, '0', 1585553037, 1585553432);
INSERT INTO `gee_msgmodel` VALUES (5, '0', 'retrieveCode', '找回密码验证码模版', '您正在操作找回{basic_name}账号密码，您的验证码为{sms_code},请勿将验证码告诉他人。', '10003', NULL, '0', 1585553123, 1585553183);
INSERT INTO `gee_msgmodel` VALUES (6, '0', 'changeMobileCode', '修改手机号', '您正在操作修改手机号操作，您的验证码为{sms_code}，请勿将验证码告诉他人。', '10004', NULL, '0', 1585553168, 1585553168);
INSERT INTO `gee_msgmodel` VALUES (7, '1', 'domainRegister', '域名注册成功', '尊敬的用户您好，您的域名{S1}已经成功注册，请登陆控制台进行操作。感谢您对{basic_name}的支持。', '10005', NULL, '0', 1585553263, 1585553550);
INSERT INTO `gee_msgmodel` VALUES (8, '1', 'cloudserverRegister', '云主机开通短信', '尊敬的用户您好，您的云主机实例{s1}已经开通，有效期至{s3}。请您登陆控制台进行操作。', '10006', NULL, '0', 1585553309, 1585553536);
INSERT INTO `gee_msgmodel` VALUES (9, '0', 'cloudserverReseter', '云主机重置密码验证码', '尊敬的用户您好，您正在重置云主机实例{s1}的管理密码，验证码为{sms_code}，请勿告知他人。', '10007', NULL, '0', 1585553352, 1585553523);
INSERT INTO `gee_msgmodel` VALUES (10, '1', 'vhostRegister', '虚拟主机开通成功', '尊敬的用户您好，您的虚拟主机{s2}已经开通，请您登陆控制台进行操作。', '10008', NULL, '0', 1585553401, 1585553504);
INSERT INTO `gee_msgmodel` VALUES (11, '1', 'serverRegister', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器{name}已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', '10009', NULL, '0', 1585553463, 1585553467);
INSERT INTO `gee_msgmodel` VALUES (12, '1', 'serverDelivery', '物理服务器交付', '尊敬的用户您好，您的物理机实例{s2}已经成功交付，请您登陆控制台查看。', '10010', NULL, '0', 1585553495, 1585553495);
INSERT INTO `gee_msgmodel` VALUES (14, '3', 'cdnOverdue', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (15, '3', 'domainOverdue', '域名过期提醒', '尊敬的用户您好，您的域名{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (16, '3', 'hostOverdue', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (17, '3', 'cloudserverOverdue', '云服务器过期提醒', '尊敬的用户您好，您的云服务器{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (18, '3', 'vpsOverdue', '云主机VPS过期提醒', '尊敬的用户您好，您的云主机VPS{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (19, '3', 'smartOverdue', '智能建站过期提醒', '尊敬的用户您好，您的智能站点{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', 'urIfHGH9Md8L64px8mctlV9M8UOEd9l3LLcwSYjqZfE', '0', 1590976629, 1598518524);

-- ----------------------------
-- Table structure for gee_news
-- ----------------------------
DROP TABLE IF EXISTS `gee_news`;
CREATE TABLE `gee_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻标题',
  `cover` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻封面',
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻简介',
  `cont` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻内容',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '新闻分类ID',
  `tags` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新闻标签',
  `view` int(11) NULL DEFAULT NULL COMMENT '阅读数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序 越大越前',
  `status` int(11) NULL DEFAULT 0 COMMENT '新闻状态 0:隐藏 1:显示',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_newsclass
-- ----------------------------
DROP TABLE IF EXISTS `gee_newsclass`;
CREATE TABLE `gee_newsclass`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_operate_banner
-- ----------------------------
DROP TABLE IF EXISTS `gee_operate_banner`;
CREATE TABLE `gee_operate_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片路由',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态 0:隐藏 1:显示',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_order
-- ----------------------------
DROP TABLE IF EXISTS `gee_order`;
CREATE TABLE `gee_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `pro_id` int(11) NOT NULL COMMENT '产品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type` enum('0','1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '订单类型 0:消费 1:充值 2:提现 3:退款 4:产品交易',
  `remarks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单备注',
  `money` double(255, 2) NOT NULL COMMENT '交易金额',
  `balance` double(255, 2) NOT NULL COMMENT '交易后余额',
  `product` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交易产品合计',
  `cash` double(255, 2) NULL DEFAULT NULL COMMENT '现金支付',
  `channel_type` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '渠道类型 0:余额支付 1:第三方支付',
  `status` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '交易状态 0:未支付 1:已支付 2:支付失败',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_osgroup
-- ----------------------------
DROP TABLE IF EXISTS `gee_osgroup`;
CREATE TABLE `gee_osgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统名称',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_osgroup
-- ----------------------------
INSERT INTO `gee_osgroup` VALUES (1, 'CentOs', 'root', 9, 1574661455, 1574672282);
INSERT INTO `gee_osgroup` VALUES (2, 'Windows', 'Administrator', 0, 1574663512, 1574672295);
INSERT INTO `gee_osgroup` VALUES (3, 'Ubuntu', 'ubuntu', 0, 1574672319, 1574672319);
INSERT INTO `gee_osgroup` VALUES (4, 'Debian', 'root', 0, 1582098886, 1585026983);

-- ----------------------------
-- Table structure for gee_ostype
-- ----------------------------
DROP TABLE IF EXISTS `gee_ostype`;
CREATE TABLE `gee_ostype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统版本名称',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '所属操作系统',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `model_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '镜像模板ID (特定插件用 如云主机)',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_ostype
-- ----------------------------
INSERT INTO `gee_ostype` VALUES (1, 'CentOs 7.6 ', 1, 0, '[{\"name\":\"nokvm\",\"id\":7}]', 1574661500, 1582098734);
INSERT INTO `gee_ostype` VALUES (2, 'CentOs 7.2', 1, 0, NULL, 1574661588, 1582098755);
INSERT INTO `gee_ostype` VALUES (3, 'Windows server 2016', 2, 0, NULL, 1574663546, 1582098827);
INSERT INTO `gee_ostype` VALUES (4, 'Windows server 2012 R2', 2, 0, NULL, 1574663555, 1582098806);
INSERT INTO `gee_ostype` VALUES (5, 'windows server 2008 R2', 2, 0, NULL, 1574663561, 1587014533);
INSERT INTO `gee_ostype` VALUES (6, 'Ubuntu Server 18.04.1 LTS 64位', 3, 0, NULL, 1574672328, 1574672328);
INSERT INTO `gee_ostype` VALUES (7, 'Ubuntu16.04 amd64', 3, 0, NULL, 1574672338, 1582098966);
INSERT INTO `gee_ostype` VALUES (8, 'Debian10.2', 4, 0, NULL, 1582098925, 1582098925);
INSERT INTO `gee_ostype` VALUES (9, 'Debian9.9', 4, 0, NULL, 1582098945, 1585027074);

-- ----------------------------
-- Table structure for gee_picture
-- ----------------------------
DROP TABLE IF EXISTS `gee_picture`;
CREATE TABLE `gee_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片链接',
  `sha1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sha1',
  `md5` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'md5',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_picture
-- ----------------------------
INSERT INTO `gee_picture` VALUES (1, 'https://ylsq.cdn.bcebos.com/1558341347744682.png', '', '', 1558341347, 1558341347);
INSERT INTO `gee_picture` VALUES (2, 'https://ylsq.cdn.bcebos.com/1558341399879898.png', '', '', 1558341399, 1558341399);
INSERT INTO `gee_picture` VALUES (3, 'https://ylsq.cdn.bcebos.com/1558341751672715.jpeg', '', '', 1558341752, 1558341752);
INSERT INTO `gee_picture` VALUES (4, 'https://ylsq.cdn.bcebos.com/1572935071179500.png', '', '', 1572935071, 1572935071);
INSERT INTO `gee_picture` VALUES (5, 'https://ylsq.cdn.bcebos.com/1572937554456840.png', '', '', 1572937554, 1572937554);
INSERT INTO `gee_picture` VALUES (6, 'https://ylsq.cdn.bcebos.com/1572937669828394.png', '', '', 1572937670, 1572937670);
INSERT INTO `gee_picture` VALUES (7, 'https://ylsq.cdn.bcebos.com/1572937697818693.png', '', '', 1572937698, 1572937698);
INSERT INTO `gee_picture` VALUES (8, 'https://ylsq.cdn.bcebos.com/1572941554904025.png', '', '', 1572941554, 1572941554);
INSERT INTO `gee_picture` VALUES (9, 'https://ylsq.cdn.bcebos.com/1572941555174641.png', '', '', 1572941555, 1572941555);
INSERT INTO `gee_picture` VALUES (10, 'https://ylsq.cdn.bcebos.com/1572942455565577.png', '', '', 1572942455, 1572942455);
INSERT INTO `gee_picture` VALUES (11, 'https://ylsq.cdn.bcebos.com/1572942479574173.png', '', '', 1572942479, 1572942479);
INSERT INTO `gee_picture` VALUES (12, 'https://ylsq.cdn.bcebos.com/1572942805484442.png', '', '', 1572942805, 1572942805);
INSERT INTO `gee_picture` VALUES (13, 'https://ylsq.cdn.bcebos.com/1572943078292983.png', '', '', 1572943078, 1572943078);
INSERT INTO `gee_picture` VALUES (14, 'https://ylsq.cdn.bcebos.com/157294373239425.png', '', '', 1572943732, 1572943732);
INSERT INTO `gee_picture` VALUES (15, 'https://ylsq.cdn.bcebos.com/1572944416711090.png', '', '', 1572944416, 1572944416);
INSERT INTO `gee_picture` VALUES (16, 'https://ylsq.cdn.bcebos.com/1572944519180179.png', '', '', 1572944520, 1572944520);
INSERT INTO `gee_picture` VALUES (17, 'https://ylsq.cdn.bcebos.com/1572944606199115.png', '', '', 1572944606, 1572944606);
INSERT INTO `gee_picture` VALUES (18, 'https://ylsq.cdn.bcebos.com/1572945257160972.png', '', '', 1572945257, 1572945257);
INSERT INTO `gee_picture` VALUES (19, 'https://ylsq.cdn.bcebos.com/157294630642593.png', '', '', 1572946307, 1572946307);
INSERT INTO `gee_picture` VALUES (20, 'https://ylsq.cdn.bcebos.com/157294631198743.png', '', '', 1572946311, 1572946311);
INSERT INTO `gee_picture` VALUES (21, 'https://ylsq.cdn.bcebos.com/1572948455678960.png', '', '', 1572948455, 1572948455);
INSERT INTO `gee_picture` VALUES (22, 'https://ylsq.cdn.bcebos.com/1572948458902518.png', '', '', 1572948458, 1572948458);
INSERT INTO `gee_picture` VALUES (23, 'https://ylsq.cdn.bcebos.com/1573004829365866.png', '', '', 1573004830, 1573004830);
INSERT INTO `gee_picture` VALUES (24, 'https://ylsq.cdn.bcebos.com/1573008335591469.png', '', '', 1573008336, 1573008336);
INSERT INTO `gee_picture` VALUES (25, 'https://ylsq.cdn.bcebos.com/1573020883357834.png', '', '', 1573020883, 1573020883);
INSERT INTO `gee_picture` VALUES (26, 'https://ylsq.cdn.bcebos.com/1573025860842735.png', '', '', 1573025861, 1573025861);
INSERT INTO `gee_picture` VALUES (27, 'https://ylsq.cdn.bcebos.com/1573026041952018.png', '', '', 1573026042, 1573026042);
INSERT INTO `gee_picture` VALUES (28, 'https://ylsq.cdn.bcebos.com/1573027041893797.png', '', '', 1573027041, 1573027041);
INSERT INTO `gee_picture` VALUES (29, 'https://ylsq.cdn.bcebos.com/1573027378568645.png', '', '', 1573027378, 1573027378);
INSERT INTO `gee_picture` VALUES (30, 'https://ylsq.cdn.bcebos.com/1575278057769276.jpeg', '', '', 1575278058, 1575278058);
INSERT INTO `gee_picture` VALUES (31, 'https://ylsq.cdn.bcebos.com/1575278102808462.jpeg', '', '', 1575278103, 1575278103);
INSERT INTO `gee_picture` VALUES (32, 'https://ylsq.cdn.bcebos.com/1575278271764929.jpeg', '', '', 1575278271, 1575278271);
INSERT INTO `gee_picture` VALUES (33, 'https://ylsq.cdn.bcebos.com/1575278347739953.jpeg', '', '', 1575278348, 1575278348);
INSERT INTO `gee_picture` VALUES (34, 'https://ylsq.cdn.bcebos.com/1575280241595859.jpeg', '', '', 1575280241, 1575280241);
INSERT INTO `gee_picture` VALUES (35, 'https://ylsq.cdn.bcebos.com/1575280553395250.jpeg', '', '', 1575280554, 1575280554);
INSERT INTO `gee_picture` VALUES (36, 'https://ylsq.cdn.bcebos.com/1575342139531096.jpeg', '', '', 1575342140, 1575342140);
INSERT INTO `gee_picture` VALUES (37, 'https://ylsq.cdn.bcebos.com/1575343976713522.jpeg', '', '', 1575343976, 1575343976);
INSERT INTO `gee_picture` VALUES (38, 'https://ylsq.cdn.bcebos.com/1575343989337132.jpeg', '', '', 1575343989, 1575343989);
INSERT INTO `gee_picture` VALUES (39, 'https://ylsq.cdn.bcebos.com/1575344019110553.jpeg', '', '', 1575344019, 1575344019);
INSERT INTO `gee_picture` VALUES (40, 'https://ylsq.cdn.bcebos.com/1575352240744859.jpeg', '', '', 1575352241, 1575352241);
INSERT INTO `gee_picture` VALUES (41, 'https://ylsq.cdn.bcebos.com/1575352390530427.jpeg', '', '', 1575352391, 1575352391);
INSERT INTO `gee_picture` VALUES (42, 'https://ylsq.cdn.bcebos.com/1575361864209774.jpeg', '', '', 1575361864, 1575361864);
INSERT INTO `gee_picture` VALUES (43, 'https://ylsq.cdn.bcebos.com/157542603642559.jpeg', '', '', 1575426037, 1575426037);
INSERT INTO `gee_picture` VALUES (44, 'https://ylsq.cdn.bcebos.com/1575427586803617.jpeg', '', '', 1575427586, 1575427586);
INSERT INTO `gee_picture` VALUES (45, 'https://ylsq.cdn.bcebos.com/1575427616136494.jpeg', '', '', 1575427618, 1575427618);
INSERT INTO `gee_picture` VALUES (46, 'https://ylsq.cdn.bcebos.com/1575428071976714.jpeg', '', '', 1575428072, 1575428072);
INSERT INTO `gee_picture` VALUES (47, 'https://ylsq.cdn.bcebos.com/1575428074350282.jpeg', '', '', 1575428075, 1575428075);
INSERT INTO `gee_picture` VALUES (48, 'https://ylsq.cdn.bcebos.com/1576663497381689.png', '', '', 1576663498, 1576663498);
INSERT INTO `gee_picture` VALUES (49, 'https://ylsq.cdn.bcebos.com/1576739359122674.png', '', '', 1576739360, 1576739360);
INSERT INTO `gee_picture` VALUES (50, 'https://ylsq.cdn.bcebos.com/1576739547493077.png', '', '', 1576739547, 1576739547);
INSERT INTO `gee_picture` VALUES (51, 'https://ylsq.cdn.bcebos.com/1576739562488948.png', '', '', 1576739562, 1576739562);
INSERT INTO `gee_picture` VALUES (52, 'https://ylsq.cdn.bcebos.com/1576739607123266.png', '', '', 1576739607, 1576739607);
INSERT INTO `gee_picture` VALUES (53, 'https://ylsq.cdn.bcebos.com/157673985627459.png', '', '', 1576739857, 1576739857);
INSERT INTO `gee_picture` VALUES (54, 'https://ylsq.cdn.bcebos.com/1584941513376796.jpeg', '', '', 1584941515, 1584941515);
INSERT INTO `gee_picture` VALUES (55, 'https://ylsq.cdn.bcebos.com/1584941739670726.jpeg', '', '', 1584941741, 1584941741);
INSERT INTO `gee_picture` VALUES (56, 'https://ylsq.cdn.bcebos.com/1584941779832032.jpeg', '', '', 1584941781, 1584941781);
INSERT INTO `gee_picture` VALUES (57, 'https://ylsq.cdn.bcebos.com/1584942667218329.png', '', '', 1584942668, 1584942668);
INSERT INTO `gee_picture` VALUES (58, 'https://ylsq.cdn.bcebos.com/1585291820738408.png', '', '', 1585291821, 1585291821);
INSERT INTO `gee_picture` VALUES (59, 'https://ylsq.cdn.bcebos.com/1585291861235283.png', '', '', 1585291861, 1585291861);
INSERT INTO `gee_picture` VALUES (60, 'https://ylsq.cdn.bcebos.com/1585292271200449.png', '', '', 1585292271, 1585292271);
INSERT INTO `gee_picture` VALUES (61, 'https://ylsq.cdn.bcebos.com/1585292316753573.png', '', '', 1585292317, 1585292317);
INSERT INTO `gee_picture` VALUES (62, '/uploads/20200411/5e9167ad64904.png', '8fde65177f28a16706fe3b86ace7e2573f94cc4d', '2204f6d7c2a4abbc133d69f38a8f5968', 1586587565, 1586587565);
INSERT INTO `gee_picture` VALUES (63, '/uploads/20200413/5e93fc4080bb7.png', '13708a13f06415c957e276a977d4c82fdfcefa03', 'ac7e231ac995a0a35a4c675f783cd874', 1586756672, 1586756672);
INSERT INTO `gee_picture` VALUES (64, '/uploads/20200413/5e93fc468a952.png', '1c2686c19775000fb06e9634cad7e4144e7a284a', '95c0c92db05271b8da2ce13cbc8c976e', 1586756678, 1586756678);
INSERT INTO `gee_picture` VALUES (65, '/uploads/20200413/5e93fc4948c2a.png', '13708a13f06415c957e276a977d4c82fdfcefa03', 'ac7e231ac995a0a35a4c675f783cd874', 1586756681, 1586756681);
INSERT INTO `gee_picture` VALUES (66, '/uploads/20200413/5e93fc4bb18ad.png', '13708a13f06415c957e276a977d4c82fdfcefa03', 'ac7e231ac995a0a35a4c675f783cd874', 1586756683, 1586756683);
INSERT INTO `gee_picture` VALUES (67, '/uploads/20200413/5e93ff397fae5.png', '5476f816057f936ca0c93f5e0e3ed146c512da4a', '964ec4ea74ccd3b1f7e11a354a719ade', 1586757433, 1586757433);
INSERT INTO `gee_picture` VALUES (68, '/uploads/20200413/5e9400506578d.png', '13708a13f06415c957e276a977d4c82fdfcefa03', 'ac7e231ac995a0a35a4c675f783cd874', 1586757712, 1586757712);
INSERT INTO `gee_picture` VALUES (69, '/uploads/20200413/5e940052f0380.png', '13708a13f06415c957e276a977d4c82fdfcefa03', 'ac7e231ac995a0a35a4c675f783cd874', 1586757714, 1586757714);
INSERT INTO `gee_picture` VALUES (70, '/uploads/20200413/5e940054e5c3a.png', '1c2686c19775000fb06e9634cad7e4144e7a284a', '95c0c92db05271b8da2ce13cbc8c976e', 1586757716, 1586757716);
INSERT INTO `gee_picture` VALUES (71, '/uploads/20200413/5e94005723a95.png', '5476f816057f936ca0c93f5e0e3ed146c512da4a', '964ec4ea74ccd3b1f7e11a354a719ade', 1586757719, 1586757719);
INSERT INTO `gee_picture` VALUES (72, '/uploads/20200421/5e9e8f2967660.jpg', '9567cb657c1fd8d11f7a21176c1f7b03132c11f9', 'c7e47cb336c2c4fafe46cfb3de80d343', 1587449641, 1587449641);
INSERT INTO `gee_picture` VALUES (73, '/uploads/20200421/5e9e905239198.png', 'a6549d58defb1216d6bb23839feee91d5d960617', '43d23144c843c2ef88969e9312fb06ae', 1587449938, 1587449938);
INSERT INTO `gee_picture` VALUES (74, 'https://ylsq.cdn.bcebos.com/1587449967534329.png', '', '', 1587449967, 1587449967);
INSERT INTO `gee_picture` VALUES (75, 'https://ylsq.cdn.bcebos.com/1587450044636703.png', '', '', 1587450045, 1587450045);
INSERT INTO `gee_picture` VALUES (76, 'https://ylsq.cdn.bcebos.com/1587450045705512.png', '', '', 1587450045, 1587450045);
INSERT INTO `gee_picture` VALUES (77, '/uploads/20200421/5e9e913514e5a.mp4', '0db3c96627764b8eee85be8cb0697290ef841c84', '18cc16388799104159e5033b957a430e', 1587450165, 1587450165);
INSERT INTO `gee_picture` VALUES (78, '/uploads/20200421/5e9e96bcae13e.png', '5e29cfeefbe63bd73dc4ff248b8812f4a02cd5a7', '27c11e0be47e50944ec08a65cd4d0296', 1587451580, 1587451580);
INSERT INTO `gee_picture` VALUES (79, '/uploads/20200421/5e9e96c100256.gif', '7ec8753a5bfca5f804bfcf74d1d6df367ae1817e', 'b966a80e78f4e6b3d2997293f420db3c', 1587451585, 1587451585);
INSERT INTO `gee_picture` VALUES (80, 'https://ylsq.cdn.bcebos.com/1587451622596830.mp4', '', '', 1587451624, 1587451624);
INSERT INTO `gee_picture` VALUES (81, 'https://ylsq.bj.bcebos.com/1587453763982917.mp4', '', '', 1587453764, 1587453764);
INSERT INTO `gee_picture` VALUES (82, 'https://ylsq.bj.bcebos.com/1587456913188117.mp4', '', '', 1587456913, 1587456913);
INSERT INTO `gee_picture` VALUES (83, 'https://ylsq.bj.bcebos.com/1587456965938786.mp4', '', '', 1587456966, 1587456966);
INSERT INTO `gee_picture` VALUES (84, 'http://qiniu.geestack.cn/0db3c96627764b8eee85be8cb0697290ef841c841587457067', '', '', 1587457068, 1587457068);
INSERT INTO `gee_picture` VALUES (85, '/uploads/20200506/5eb266a50126e.jpg', 'a7e35e5e8e1b9bcb4abb0ed80a7a1ae27649df70', '246a58e2ec948ae72be0e038347a4252', 1588749989, 1588749989);
INSERT INTO `gee_picture` VALUES (86, '/uploads/20200515/5ebe4865f04f7.png', 'd4e9f9d40a17f4a0c359f2006f785bb85b5e908e', 'd75a00ac02cb768e7b05bd046ca24492', 1589528677, 1589528677);
INSERT INTO `gee_picture` VALUES (87, '/uploads/20200515/5ebe556267a6e.png', 'd4e9f9d40a17f4a0c359f2006f785bb85b5e908e', 'd75a00ac02cb768e7b05bd046ca24492', 1589532002, 1589532002);
INSERT INTO `gee_picture` VALUES (88, '/uploads/20200515/5ebe558ba013a.png', 'd4e9f9d40a17f4a0c359f2006f785bb85b5e908e', 'd75a00ac02cb768e7b05bd046ca24492', 1589532043, 1589532043);
INSERT INTO `gee_picture` VALUES (89, '/uploads/20200806/5f2b67961eaa3.png', '621518ec2e46b24133c801c8b29cd00f38d8e874', 'df83d2bbd898ac17da2376f33598839d', 1596680086, 1596680086);
INSERT INTO `gee_picture` VALUES (90, '/uploads/20200806/5f2b97dd2ad8e.jpg', '9567cb657c1fd8d11f7a21176c1f7b03132c11f9', 'c7e47cb336c2c4fafe46cfb3de80d343', 1596692445, 1596692445);
INSERT INTO `gee_picture` VALUES (91, '/uploads/20200806/5f2b97e1624b9.jpg', '8d5f9cdd8fc18ae485568b8e79bcb5ea0ca5b8e7', '1d439a649a16186bc7066807e567707c', 1596692449, 1596692449);

-- ----------------------------
-- Table structure for gee_pro_config
-- ----------------------------
DROP TABLE IF EXISTS `gee_pro_config`;
CREATE TABLE `gee_pro_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品配置',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_product
-- ----------------------------
DROP TABLE IF EXISTS `gee_product`;
CREATE TABLE `gee_product`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '产品类型 1:虚拟主机  2:VPS主机  3:云服务器  4:SSL证书  5:域名 6:其他',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '产品分组',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述',
  `email_model` int(11) NOT NULL COMMENT '开通产品时会发送的邮件模板id',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品标签',
  `update_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '可用于升级的套餐',
  `month` double(255, 2) NULL DEFAULT NULL COMMENT '月价格',
  `quarter` double(255, 2) NULL DEFAULT NULL COMMENT '季度价格',
  `semestrale` double(255, 2) NULL DEFAULT NULL COMMENT '半年价格',
  `years` double(255, 2) NULL DEFAULT NULL COMMENT '年价格',
  `biennium` double(255, 2) NULL DEFAULT NULL COMMENT '两年价格',
  `triennium` double(255, 2) NULL DEFAULT NULL COMMENT '三年价格',
  `agentprice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '代理价格json',
  `rebates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购买产生返点json',
  `sort` int(11) NULL DEFAULT NULL COMMENT '产品排序',
  `plug` int(11) NULL DEFAULT NULL COMMENT '所用插件ID',
  `plug_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '插件配置项',
  `added` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品增值服务',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_product_class
-- ----------------------------
DROP TABLE IF EXISTS `gee_product_class`;
CREATE TABLE `gee_product_class`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类标识',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '分类状态 0:禁用 1:启用',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_product_class
-- ----------------------------
INSERT INTO `gee_product_class` VALUES (11, 'DNS解析', 'dns', '1', 1586936651, 1586936651);
INSERT INTO `gee_product_class` VALUES (2, 'VPS主机', 'vps', '1', 0, 0);
INSERT INTO `gee_product_class` VALUES (3, '云服务器', 'chost', '0', 0, 0);
INSERT INTO `gee_product_class` VALUES (4, 'SSL证书', 'ssl', '0', 0, 1585019102);
INSERT INTO `gee_product_class` VALUES (5, '域名', 'domain', '1', 0, 0);
INSERT INTO `gee_product_class` VALUES (999, '其他', 'other', '0', 0, 0);
INSERT INTO `gee_product_class` VALUES (8, '物理服务器租用', 'server', '1', 1573543543, 1573543551);
INSERT INTO `gee_product_class` VALUES (9, '云主机', 'cloudserver', '1', 0, 0);
INSERT INTO `gee_product_class` VALUES (10, '虚拟主机', 'host', '1', 1582266896, 1582266896);
INSERT INTO `gee_product_class` VALUES (12, '高防CDN', 'cdn', '1', 0, 0);
INSERT INTO `gee_product_class` VALUES (13, '智能建站', 'smartsite', '1', 1590458287, 1590458287);

-- ----------------------------
-- Table structure for gee_product_group
-- ----------------------------
DROP TABLE IF EXISTS `gee_product_group`;
CREATE TABLE `gee_product_group`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `slogan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分组标语',
  `sort` int(11) NULL DEFAULT NULL COMMENT '组排序',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '所属分类',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_product_type
-- ----------------------------
DROP TABLE IF EXISTS `gee_product_type`;
CREATE TABLE `gee_product_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型标识',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_product_type
-- ----------------------------
INSERT INTO `gee_product_type` VALUES (1, '计算', '', 0, 1560152069);
INSERT INTO `gee_product_type` VALUES (2, '网络', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (3, '存储和CDN', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (5, '安全和管理', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (15, '其他', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (4, '数据库', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (7, '网站服务', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (6, '数据分析', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (8, '智能多媒体服务', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (9, '物联网服务', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (10, '人工智能', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (11, '数字营销云', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (12, '区块链', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (13, '应用服务', '', 0, 0);
INSERT INTO `gee_product_type` VALUES (14, '云市场', '', 0, 0);

-- ----------------------------
-- Table structure for gee_rebates_log
-- ----------------------------
DROP TABLE IF EXISTS `gee_rebates_log`;
CREATE TABLE `gee_rebates_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `pro_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属产品',
  `rebates` double(255, 2) NULL DEFAULT NULL COMMENT '产生返点金额',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_server
-- ----------------------------
DROP TABLE IF EXISTS `gee_server`;
CREATE TABLE `gee_server`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_group_id` int(11) NULL DEFAULT NULL COMMENT '产品分组ID',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `server_added` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '增值服务选项',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机名称',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公网IP',
  `intranetip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内网IP',
  `username` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主机账号',
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主机密码',
  `osgroup` int(11) NULL DEFAULT NULL COMMENT '操作系统类型',
  `ostype` int(11) NULL DEFAULT NULL COMMENT '操作系统版本',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `remake` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `status` int(11) NULL DEFAULT NULL COMMENT '主机状态 0:开通中 1:已到期 2:正在重装系统 3:正在运行 4:服务器异常',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_server_added
-- ----------------------------
DROP TABLE IF EXISTS `gee_server_added`;
CREATE TABLE `gee_server_added`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '增值服务标识',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '增值服务名称',
  `slogan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '增值服务描述',
  `type` int(11) NULL DEFAULT NULL COMMENT '增值服务类型 1:单选 2:下拉 3输入框',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_server_added_items
-- ----------------------------
DROP TABLE IF EXISTS `gee_server_added_items`;
CREATE TABLE `gee_server_added_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '增值服务名称',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '所属服务ID',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `month` double(255, 2) NULL DEFAULT NULL COMMENT '月价格',
  `quarter` double(255, 0) NULL DEFAULT NULL COMMENT '季度价格',
  `semestrale` double(255, 0) NULL DEFAULT NULL COMMENT '半年价格',
  `years` double(255, 0) NULL DEFAULT NULL COMMENT '年价格',
  `agentprice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '代理价格json',
  `rebates` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购买产生返点json',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_smartsite
-- ----------------------------
DROP TABLE IF EXISTS `gee_smartsite`;
CREATE TABLE `gee_smartsite`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `plug_id` int(11) NULL DEFAULT NULL COMMENT '所属插件id,product表的id,本系统产品',
  `plug_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件数据表',
  `plug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '接口的套餐类型',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id,插件明细表id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_smartsite_nicenic
-- ----------------------------
DROP TABLE IF EXISTS `gee_smartsite_nicenic`;
CREATE TABLE `gee_smartsite_nicenic`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `ftpserver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件返回值:服务器名或域名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `plug_pro_id` int(11) NULL DEFAULT NULL COMMENT '插件返回时的id',
  `type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品使用 类型 对应插件product_id',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_smsapi
-- ----------------------------
DROP TABLE IF EXISTS `gee_smsapi`;
CREATE TABLE `gee_smsapi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ak` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息APIAK',
  `signid` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签名ID',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_smsapi
-- ----------------------------
INSERT INTO `gee_smsapi` VALUES (1, '', '', 1585551686, 1585551686);

-- ----------------------------
-- Table structure for gee_staffgroup
-- ----------------------------
DROP TABLE IF EXISTS `gee_staffgroup`;
CREATE TABLE `gee_staffgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_staffgroup
-- ----------------------------
INSERT INTO `gee_staffgroup` VALUES (8, '超级管理员', 1557380521, 1587021519);
INSERT INTO `gee_staffgroup` VALUES (9, '财务审核', 1557380533, 1557380533);
INSERT INTO `gee_staffgroup` VALUES (10, '销售', 1557380542, 1557380549);

-- ----------------------------
-- Table structure for gee_system_info
-- ----------------------------
DROP TABLE IF EXISTS `gee_system_info`;
CREATE TABLE `gee_system_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `versions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统版本',
  `charset` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '字符集',
  `devinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '开发商信息',
  `officesite` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '官方网站',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ群',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客服电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间  可当作更新时间用',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_ticket
-- ----------------------------
DROP TABLE IF EXISTS `gee_ticket`;
CREATE TABLE `gee_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` int(11) NULL DEFAULT NULL COMMENT '提交用户id',
  `replierid` int(11) NULL DEFAULT NULL COMMENT '接收人id',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工单描述',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相关截图',
  `status` int(11) NULL DEFAULT 0 COMMENT '工单状态 0:待接入 1:处理中 2:待回复 3:待您确认 4:已撤销 5:已完成',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单类型 ',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_ticket_details
-- ----------------------------
DROP TABLE IF EXISTS `gee_ticket_details`;
CREATE TABLE `gee_ticket_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NULL DEFAULT NULL COMMENT '所属工单id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工单标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相关截图',
  `fromid` int(11) NULL DEFAULT NULL COMMENT '发言人ID',
  `replierid` int(11) NULL DEFAULT NULL COMMENT '接收人ID',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_user
-- ----------------------------
DROP TABLE IF EXISTS `gee_user`;
CREATE TABLE `gee_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名(英文)',
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '密码',
  `salt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加密盐值',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `is_email` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '邮箱验证 0:未认证 1:已认证',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `is_phone` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '手机验证 0:未认证 1:已认证',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固话',
  `type` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户类型 0:个人 1:企业',
  `balance` double(255, 2) NULL DEFAULT 0.00 COMMENT '用户余额',
  `invoice_money` double(11, 2) NULL DEFAULT 0.00 COMMENT '已开票金额',
  `free_money` double(255, 2) NULL DEFAULT 0.00 COMMENT '开票冻结金额',
  `rebates_money` double(255, 2) NULL DEFAULT NULL COMMENT '返点金额',
  `make_rebates_money` double(255, 2) NULL DEFAULT NULL COMMENT '产生返点金额',
  `use_rebates_money` double(255, 2) NULL DEFAULT NULL COMMENT '已使用返点金额',
  `presented_money` double(255, 2) NULL DEFAULT NULL COMMENT '平台赠送金额',
  `create_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '用户组ID',
  `manager_id` int(11) NULL DEFAULT NULL COMMENT '所属代理商ID',
  `manager_code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所属代理商编码',
  `manager_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所属代理商备注',
  `approve` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户认证 0:未认证 1:已认证',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `realverify` int(11) NULL DEFAULT NULL COMMENT '认证审核 0:未提交申请 1:审核中 2:审核成功 3: 审核失败',
  `status` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户状态 0:正常 1:欠费 2:锁定',
  `last_login_time` int(11) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_user_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `gee_user_enterprise`;
CREATE TABLE `gee_user_enterprise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '组织类型 0:企业 1:其他组织',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称/字号名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照注册号/组织机构代码',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照扫描件/组织机构代码证扫描件',
  `is_individual` int(11) NULL DEFAULT NULL COMMENT '是否为个体工商户  0:否 1:是',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `status` int(11) NULL DEFAULT NULL COMMENT '审核状态  0:审核中 1:审核成功 2:审核失败',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_user_realnames
-- ----------------------------
DROP TABLE IF EXISTS `gee_user_realnames`;
CREATE TABLE `gee_user_realnames`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `verify` int(255) NULL DEFAULT NULL COMMENT '审核状态 0:审核中 1:审核通过',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `gee_usergroup`;
CREATE TABLE `gee_usergroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `is_agent` int(11) NULL DEFAULT NULL COMMENT '是否为代理商分组 0:不是 1:是',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_usergroup
-- ----------------------------
INSERT INTO `gee_usergroup` VALUES (2, '青铜代理', 1, 1557364810, 1588150461);
INSERT INTO `gee_usergroup` VALUES (3, '白银代理', 1, 1557364818, 1588150439);
INSERT INTO `gee_usergroup` VALUES (4, '黄金代理', 1, 1557364828, 1588150470);
INSERT INTO `gee_usergroup` VALUES (5, '铂金代理', 1, 1557364839, 1588150455);
INSERT INTO `gee_usergroup` VALUES (6, '钻石代理', 1, 1557364845, 1588150446);
INSERT INTO `gee_usergroup` VALUES (1, '普通用户', NULL, 1557364855, 1557364855);

-- ----------------------------
-- Table structure for gee_v2mroute
-- ----------------------------
DROP TABLE IF EXISTS `gee_v2mroute`;
CREATE TABLE `gee_v2mroute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由标识',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路由路径',
  `f_id` int(11) NOT NULL COMMENT '上级ID',
  `s_id` int(11) NOT NULL COMMENT '从属id',
  `is_show` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否展示 0:不展示 1:展示',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由图标',
  PRIMARY KEY (`id`, `s_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1021 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_v2mroute
-- ----------------------------
INSERT INTO `gee_v2mroute` VALUES (1, '业务', 'service', '/service', 0, 0, '1', 1557194766, 1557194766, 'iconchanpinku');
INSERT INTO `gee_v2mroute` VALUES (2, '域名管理', 'domain', '/service/domain', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (3, '主机管理', 'host', '/service/host', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (4, '租用托管', 'server', '/service/server', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (5, '工单', 'ticket', '/ticket', 0, 0, '1', 1557194766, 1557194766, 'icongongdanliebiao');
INSERT INTO `gee_v2mroute` VALUES (6, '工单列表', 'list', '/ticket/list', 5, 5, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (7, '工单分类', 'group', '/ticket/group', 5, 5, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (8, '产品', 'product', '/product', 0, 0, '1', 1557194766, 1557194766, 'iconcaidanguanli');
INSERT INTO `gee_v2mroute` VALUES (46, '产品类型', 'type', '/product/type', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (16, '用户', 'user', '/user', 0, 0, '1', 1557194766, 1557194766, 'iconyonghuguanli');
INSERT INTO `gee_v2mroute` VALUES (17, '用户列表', 'list', '/user/list', 16, 16, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (18, '用户分组', 'group', '/user/group', 16, 16, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (19, '财务', 'finance', '/finance', 0, 0, '1', 1557194766, 1557194766, 'iconcaiwu');
INSERT INTO `gee_v2mroute` VALUES (20, '总览', 'index', '/finance/index', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (21, '财务明细', 'details', '/finance/details', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (24, '充值记录', 'recharge', '/finance/recharge', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (25, '订单列表', 'order', '/finance/order', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (26, '发票管理', 'invoice', '/finance/invoice', 19, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (27, '员工', 'staff', '/staff', 0, 0, '1', 1557194766, 1557194766, 'iconyonghu');
INSERT INTO `gee_v2mroute` VALUES (28, '员工列表', 'list', '/staff/list', 27, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (29, '员工分组', 'group', '/staff/group', 27, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (30, '扩展', 'addons', '/addons', 0, 0, '1', 1557194766, 1557194766, 'iconManagementDeploymen8');
INSERT INTO `gee_v2mroute` VALUES (31, '插件列表', 'list', '/addons/list', 30, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (32, '详细', 'details', '/addons/details', 30, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (33, '应用市场', 'https://addon.geecp.com', 'https://addon.geecp.com', 0, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (999, '系统', 'system', '/system', 0, 0, '1', 1557194766, 1557194766, 'iconCloudCommunication-1');
INSERT INTO `gee_v2mroute` VALUES (35, '基本信息', 'basic', '/system/basic', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (36, '邮件设置', 'email', '/system/email', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (37, '短信设置', 'sms', '/system/sms', 999, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (38, '支付设置', 'pay', '/system/pay', 999, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (39, '消息模板', 'template', '/system/template', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (40, '附件设置', 'annex', '/system/annex', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (43, '产品列表', 'list', '/product/list', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (47, '导航管理', 'routes', '/routes', 0, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (48, '添加导航', 'add', '/routes/add', 47, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (49, '添加验证', 'addAuth', '/routes/addAuth', 47, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (50, '删除路由', 'del', '/routes/del', 47, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (51, '产品分类', 'class', '/product/class', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (52, '添加分类', 'addclass', '/product/addclass', 8, 51, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (53, '添加分类验证', 'addclassAuth', '/product/addclassAuth', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (54, '删除分类', 'delclass', '/product/delclass', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (59, '工单接入', 'join', '/ticket/join', 5, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (57, '工单详情', 'details', '/ticket/details', 5, 5, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (58, '工单回复', 'reply', '/ticket/reply', 5, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (60, '增值服务', 'added', '/product/added', 8, 8, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (61, '新增增值服务组', 'addaddedgroup', '/product/addaddedgroup', 8, 60, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (62, '新增增值服务', 'addadded', '/product/addadded', 8, 60, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (63, '新增增值服务组验证', 'addaddedgroupAuth', '/product/addaddedgroupAuth', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (64, '删除增值服务组', 'deladdedgroup', '/product/deladdedgroup', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (65, '新增增值服务验证', 'addaddedAuth', '/product/addaddedAuth', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (66, '删除增值服务', 'deladded', '/product/deladded', 8, 0, '0', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (67, '交付物理服务器', 'delivery', '/service/delivery', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (68, '交付物理服务器验证', 'deliveryauth', '/service/deliveryauth', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (69, '删除订单', 'delorder', '/finance/delorder', 19, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (71, '操作系统', 'os', '/product/os', 8, 0, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (79, '获取物理服务器信息', 'getserver', '/service/getserver', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (73, '添加操作系统', 'addosgroup', '/product/addosgroup', 8, 71, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (74, '添加操作系统验证', 'addosgroupAuth', '/product/addosgroupAuth', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (75, '删除操作系统', 'delosgroup', '/product/delosgroup', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (76, '添加操作系统版本', 'addostype', '/product/addostype', 8, 71, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (77, '添加操作系统验证', 'addostypeAuth', '/product/addostypeAuth', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (78, '删除操作系统版本', 'delostype', '/product/delostype', 8, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (80, '编辑物理服务器信息', 'editserver', '/service/editserver', 1, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (81, '实名认证', 'realverify', '/user/realverify', 16, 16, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (82, '通过认证', 'passreal', '/user/passreal', 16, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (83, '拒绝认证', 'rejectreal', '/user/rejectreal', 16, 0, '0', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (84, '企业认证', 'enterpriseverify', '/user/enterpriseverify', 16, 16, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (85, '通过认证', 'passenterprise', '/user/passenterprise', 16, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (86, '拒绝认证', 'rejectenterprise', '/user/rejectenterprise', 16, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (9, '云主机产品管理', 'vps', '/service/vps', 1, 1, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (87, '通过发票申请', 'passinvoice', '/finance/passinvoice', 19, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (88, '拒绝发票申请', 'nopassinvoice', '/finance/nopassinvoice', 19, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (89, '编辑发票信息', 'editinvoice', '/finance/editinvoice', 19, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (91, '续费VPS', 'renewvps', '/service/renewvps', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (92, 'vps控制面板', 'vpsmanager', '/service/vpsmanager', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (97, '提交域名价格', 'adddomainpriceauth', '/service/adddomainpriceauth', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (95, '域名价格', 'domainprice', '/service/domainprice', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (96, '信息模板', 'domaintempaudit', '/service/domaintempaudit', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (98, '域名接口测试', 'domainchecked', '/service/domainchecked', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (99, '云平台', 'cloudservice', '/cloudservice', 0, 0, '1', 0, 0, 'iconyunpingtaianquan');
INSERT INTO `gee_v2mroute` VALUES (100, '系统升级', 'update', '/cloudservice/update', 99, 0, '1', 0, 0, '');
INSERT INTO `gee_v2mroute` VALUES (101, '注册站点', 'regsite', '/cloudservice/regsite', 99, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (102, '云服务诊断', 'diagnose', '/cloudservice/diagnose', 99, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (103, '信息模板详情', 'domaintempauditdetail', '/service/domaintempauditdetail', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (104, '订单详情', 'detailsinfo', '/finance/detailsinfo', 19, 25, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (105, '短信API设置', 'smsapi', '/system/smsapi', 999, 0, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (106, '短信API设置验证', 'smsapiAuth', '/system/smsapiAuth', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (107, '新闻', 'news', '/news', 0, 0, '1', 0, 0, 'iconxinwenguanli');
INSERT INTO `gee_v2mroute` VALUES (108, '新闻列表', 'list', '/news/list', 107, 0, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (109, '新闻分类', 'class', '/news/class', 107, 0, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (110, '新闻设置', 'addnews', '/news/addnews', 107, 108, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (111, '新闻设置验证', 'addnewsauth', '/news/addnewsauth', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (112, '新闻分类设置', 'addclass', '/news/addclass', 107, 109, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (113, '新闻分类设置验证', 'addclassauth', '/news/addclassauth', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (114, '用户充值', 'recharge', '/user/recharge', 16, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (115, '新闻删除', 'delnews', '/news/delnews', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (116, '新闻分类删除', 'delclass', '/news/delclass', 107, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (117, '前台模板设置', 'model', '/system/model', 999, 0, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (118, '前台模板应用', 'usemodel', '/system/usemodel', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (119, '前台模板卸载', 'uninstallmodel', '/system/uninstallmodel', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (120, '域名控制面板', 'todomainmanager', '/service/todomainmanager', 1, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (121, '新增产品', 'add', '/product/add', 8, 43, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (122, '新增产品组', 'addgroup', '/product/addgroup', 8, 43, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (122, '新增产品类型', 'addtype', '/product/addtype', 8, 46, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (123, '新增用户', 'useradd', '/user/useradd', 16, 17, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (124, '新增用户组', 'groupadd', '/user/groupadd', 16, 18, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (125, '添加员工', 'staffadd', '/staff/staffadd', 28, 28, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (126, '添加员工分组', 'groupadd', '/staff/groupadd', 28, 29, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (127, '新增消息模板', 'addtemplate', '/system/addtemplate', 999, 39, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (128, '运营', 'operate', '/operate', 0, 0, '1', 0, 0, 'icondiannao');
INSERT INTO `gee_v2mroute` VALUES (129, '轮播图管理', 'banner', '/operate/banner', 128, 128, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (130, '轮播图添加', 'banneradd', '/operate/banneradd', 128, 129, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (131, '轮播图删除', 'bannerdel', '/operate/bannerdel', 128, 129, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (132, '轮播图添加验证', 'banneraddauth', '/operate/banneraddauth', 128, 129, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (133, '高防CDN管理', 'cdn', '/service/cdn', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (134, '高防CDN控制面板', 'cdnmanager', '/service/cdnmanager', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (135, '高防CDN续费', 'renewcdn', '/service/renewcdn', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (136, '虚拟主机控制面板', 'hostmanager', '/service/hostmanager', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (137, '虚拟主机续费', 'renewhost', '/service/renewhost', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (138, '消息群发', 'subMessaging', '/system/subMessaging', 999, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (139, '产品分类状态管理', 'changeClassStatus', '/product/changeClassStatus', 8, 0, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (140, '智能建站管理', 'smartsite', '/service/smartsite', 1, 1, '1', 1557194766, 1557194766, '');
INSERT INTO `gee_v2mroute` VALUES (141, '智能建站控制面板', 'managersmartsite', '/service/managersmartsite', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (142, '智能建站续费', 'renewsmartsite', '/service/renewsmartsite', 1, 1, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (143, '代金券管理', 'coupon', '/finance/coupon', 19, 19, '1', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (144, '代金券创建', 'couponadd', '/finance/couponadd', 19, 143, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (145, '代金券删除', 'coupondel', '/finance/coupondel', 19, 143, '0', 0, 0, NULL);
INSERT INTO `gee_v2mroute` VALUES (146, '代金券赋予', 'coupontouser', '/finance/coupontouser', 19, 143, '0', 0, 0, NULL);

-- ----------------------------
-- Table structure for gee_vhost
-- ----------------------------
DROP TABLE IF EXISTS `gee_vhost`;
CREATE TABLE `gee_vhost`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '所属用户',
  `service_id` int(11) NOT NULL COMMENT '所属服务',
  `status` enum('0','1','2','-1','-2','-4') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '主机状态 0:运行 1:暂停 2:管理员停止 -1:未开设 -2:已经删除 -4:状态未确定',
  `paytype` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '支付方式 0:余额支付 1:支付宝支付 2:微信支付 3:现金支付',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `domain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '绑定域名',
  `ftp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_vps
-- ----------------------------
DROP TABLE IF EXISTS `gee_vps`;
CREATE TABLE `gee_vps`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `plug_id` int(11) NULL DEFAULT NULL COMMENT '所属插件id',
  `plug_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件数据表',
  `plug_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插件名称',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '产品id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_vps_chshuju
-- ----------------------------
DROP TABLE IF EXISTS `gee_vps_chshuju`;
CREATE TABLE `gee_vps_chshuju`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_vps_chuangmeng
-- ----------------------------
DROP TABLE IF EXISTS `gee_vps_chuangmeng`;
CREATE TABLE `gee_vps_chuangmeng`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_vps_xingwai
-- ----------------------------
DROP TABLE IF EXISTS `gee_vps_xingwai`;
CREATE TABLE `gee_vps_xingwai`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_vps_zoneidc
-- ----------------------------
DROP TABLE IF EXISTS `gee_vps_zoneidc`;
CREATE TABLE `gee_vps_zoneidc`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口回传vpspassword',
  `attach` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '接口回传备注',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器内部IP',
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '开通时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gee_webbasic
-- ----------------------------
DROP TABLE IF EXISTS `gee_webbasic`;
CREATE TABLE `gee_webbasic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系邮箱',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站首页域名',
  `logo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo url地址',
  `logo1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '深色LOGO',
  `favicon` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'favicon',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '网站描述',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '网站SEO关键字',
  `icp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ICP备案',
  `beian` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '网安备案',
  `idc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IDC备案',
  `isp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ISP备案',
  `maintain` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '维护模式 0:关闭 1:开启',
  `maintaininfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '维护模式下首页展示内容(可为html)',
  `code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '第三方统计代码(内容为html)',
  `account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户名称(线下汇款用)',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行(线下汇款用)',
  `account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '汇款账号(线下汇款用)',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_webbasic
-- ----------------------------
INSERT INTO `gee_webbasic` VALUES (1, 'GEECP', '975827527@qq.com', 'https://www.geecp.com', '/uploads/20200413/5e940054e5c3a.png', '/uploads/20200413/5e940052f0380.png', '/uploads/20200413/5e94005723a95.png', 'GEECP', 'GEECP', 'ICP', 'BEIAN', 'IDC', 'ISP', '0', 'GEECP', 'GEECP', 'GEECP', 'GEECP', 'GEECP', 0, 1598236593);

-- ----------------------------
-- Table structure for gee_webroute
-- ----------------------------
DROP TABLE IF EXISTS `gee_webroute`;
CREATE TABLE `gee_webroute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由名称',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路由路径',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由标识',
  `f_id` int(11) NOT NULL COMMENT '上级ID',
  `s_id` int(11) NULL DEFAULT 0 COMMENT '从属ID',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '路由状态 0:禁用 1:启用',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由图标',
  `is_show` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否展示到列表中 0:不展示 1:展示',
  `is_customize` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否为自定义导航展示 0:不是 1:是',
  `is_pro` int(11) NULL DEFAULT 0 COMMENT '所属产品类型',
  `is_plug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属插件',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 331 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_webroute
-- ----------------------------
INSERT INTO `gee_webroute` VALUES (1, '基本信息', '/basic', 'basic', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (2, '账号信息', '/basic/info', 'info', 1, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (3, '安全设置', '/basic/safety', 'safety', 1, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (4, '实名认证', '/basic/auth', 'auth', 1, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (6, '云虚拟主机', '/host', 'host', 0, NULL, '0', 'icon-cvh', '0', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (7, '云主机VPS', '/vps', 'vps', 0, NULL, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1557194766, 1560335621);
INSERT INTO `gee_webroute` VALUES (8, '云主机', '/cloudserver', 'cloudserver', 0, NULL, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (9, '域名管理', '/domain', 'domain', 0, NULL, '1', 'icon-cdm', '1', '0', 1, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (10, '云解析', '/analysis', 'analysis', 0, NULL, '1', 'icon-dns', '0', '0', 1, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (11, '工单管理', '/ticket', 'ticket', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (12, '工单列表', '/ticket/list', 'list', 11, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (13, '创建工单', '/ticket/add', 'add', 11, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (14, '消息管理', '/message', 'message', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (132, '财务总览', '/billing/overview', 'overview', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (16, '安全认证', '/safetyauth', 'safetyauth', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1557194766, 1557194766);
INSERT INTO `gee_webroute` VALUES (136, '收支明细', '/billing/dealrecord', 'dealrecord', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (134, '消费总览', '/consumption/overview', 'overview', 133, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (135, '账单明细', '/consumption/list', 'list', 133, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (133, '消费中心', '/billing/consumption', 'consumption', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (131, '财务中心', '/billing', 'billing', 0, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (130, '支付状态', '/buy/paystatus', 'paystatus', 127, 127, '1', '', '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (129, '线上支付', '/buy/onlinepay', 'onlinepay', 127, 127, '1', '', '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (128, '确认订单', '/buy/confirm', 'confirm', 127, 127, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (127, '购买产品', '/buy', 'buy', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (126, '实例', '/vps/index', 'index', 7, NULL, '1', NULL, '1', '0', 0, NULL, 'VPS实例列表', 1559807152, 1560335597);
INSERT INTO `gee_webroute` VALUES (138, '发票管理', '/billing/invoice', 'invoice', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (139, '发票列表', '/invoice/list', 'list', 138, 138, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (140, '发票信息管理', '/invoice/template', 'template', 138, 138, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (141, '寄送地址', '/invoice/addresslist', 'addresslist', 138, 138, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (142, '订单管理', '/billing/order', 'order', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (143, '续费管理', '/billing/renew', 'renew', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (144, '退订管理', '/billing/refund', 'refund', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (145, '可退款订单', '/refund/list', 'list', 144, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (146, '退订记录', '/refund/record', 'record', 144, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (147, '合同管理', '/billing/contract', 'contract', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (148, '资源账单', '/consumption/resource', 'resource', 133, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (182, '账号信息', '/iam', 'iam', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (150, '充值', '/billing/recharge', 'recharge', 131, 132, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (151, '提现', '/billing/withdraw', 'withdraw', 131, 132, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (152, '购买验证', '/buy/pay', 'pay', 127, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (153, '工单详情', '/ticket/details', 'details', 11, 12, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (154, '创建工单验证', '/ticket/addauth', 'addauth', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (155, '工单回复', '/ticket/reply', 'reply', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (156, '工单确认', '/ticket/confirm', 'confirm', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (157, '撤销工单', '/ticket/cancel', 'cancel', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (158, '删除工单', '/ticket/del', 'del', 11, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (159, '充值验证', '/billing/rechargeauth', 'rechargeauth', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (160, '接口API', '/api', 'api', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (161, '支付宝同步', '/api/return_url', 'return_url', 160, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (162, '支付宝异步', '/api/notify_url', 'notify_url', 160, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (163, '账单详情', '/billing/dealrecorddetails', 'dealrecorddetails', 131, 136, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (166, '服务器租用', '/server', 'server', 0, NULL, '1', 'icon-dcc', '1', '0', 1, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (165, '取消订单', '/billing/cancelorder', 'cancelorder', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (167, '租用物理服务器', '/server/add', 'add', 166, 168, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (168, '服务器租用管理', '/server/index', 'index', 166, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (169, '获取物理服务器产品', '/server/getAddedItems', 'getAddedItems', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (170, '获取价格', '/server/getPrice', 'getPrice', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (171, '获取物理服务器增值服务', '/server/getAdded', 'getAdded', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (172, '租用物理服务器验证', '/server/addAuth', 'addAuth', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (173, '获取物理服务器密码', '/server/getpass', 'getpass', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (174, '重装操作系统', '/server/resetos', 'resetos', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (176, '删除订单', '/billing/delorder', 'delorder', 131, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (177, '获取操作系统版本', '/server/getOstypes', 'getOstypes', 166, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (178, '订单详情', '/billing/orderdetails', 'orderdetails', 131, 142, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (179, '物理服务器详情', '/server/detail', 'detail', 166, 168, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (180, '编辑服务器信息', '/server/edits', 'edits', 166, 168, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (181, '获取历史消费趋势', '/consumption/gethistory', 'gethistory', 133, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (183, '用户中心', '/iam/overview', 'overview', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (184, '安全认证', '/iam/accesslist', 'accesslist', 182, 182, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (185, '个人认证', '/iam/cpersonal', 'cpersonal', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (186, '企业认证', '/iam/ccompany', 'ccompany', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (187, '账号信息编辑', '/iam/baseinfoedit', 'baseinfoedit', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (189, '提交实名认证信息', '/iam/subauth', 'subauth', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (190, '修改基本信息', '/iam/baseinfoedit', 'baseinfoedit', 182, 182, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (191, '提交企业认证信息', '/iam/subcompany', 'subcompany', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (192, '提交发票信息', '/invoice/subtemp', 'subtemp', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (193, '提交发票地址', '/invoice/subaddress', 'subaddress', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (194, '删除发票地址', '/invoice/deladdress', 'deladdress', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (195, '发票申请', '/invoice/applyinvoice', 'applyinvoice', 138, 138, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (196, '提交发票申请', '/invoice/subapplyinvoice', 'subapplyinvoice', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (197, '取消发票申请', '/invoice/cancelInvoice', 'cancelInvoice', 138, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (198, '域名概览', '/domain/index', 'index', 9, 200, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (199, '域名搜索', '/domain/search', 'search', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (200, '域名管理', '/domain/manage', 'manage', 9, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (201, '域名价格', '/domain/price', 'price', 9, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (202, '信息模板', '/domain/model', 'model', 9, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (203, '域名搜索接口', '/domain/searchdomain', 'searchdomain', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (204, '域名查询接口', '/domain/searchdomaininfo', 'searchdomaininfo', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (205, '获取域名清单价格', '/domain/getDomainListPrice', 'getDomainListPrice', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (206, '创建域名订单', '/domain/add', 'add', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (207, '创建联系人信息验证', '/domain/modelAuth', 'modelAuth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (208, '删除联系人信息', '/domain/modeldel', 'modeldel', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (209, '创建域名验证', '/domain/addAuth', 'addAuth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (210, '域名续费', '/domain/recharge', 'recharge', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (211, '域名详情', '/domain/detail', 'detail', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (212, '前往域名控制台', '/domain/tomanager', 'tomanager', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (213, '更变域名隐私保护', '/domain/whoisProtect', 'whoisProtect', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (214, '更变域名所有者', '/domain/transform', 'transform', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (215, '更变域名所有者验证', '/domain/transformauth', 'transformauth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (216, '更变域名DNS', '/domain/changens', 'changens', 9, 200, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (217, '更变域名DNS验证', '/domain/changensAuth', 'changensAuth', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (218, '生成域名证书', '/domain/certification', 'certification', 9, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (219, '新增AKSK', '/addaccessAuth', 'addaccessAuth', 0, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (220, '新增AKSK', '/iam/addaccessAuth', 'addaccessAuth', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (221, '修改AKSK说明', '/iam/editaccessIntro', 'editaccessIntro', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (222, '删除AKSK', '/iam/delaccess', 'delaccess', 182, NULL, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (223, '主机服务', '/cloudserver/clientarea', 'clientarea', 8, 224, '1', NULL, '0', '1', 1, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (224, '实例列表', '/cloudserver/list', 'list', 8, NULL, '1', NULL, '1', '1', 1, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (232, 'VPS关闭', '/vps/off', 'off', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (226, '创建VPS', '/vps/add', 'add', 7, 224, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (227, '创建VPS验证', '/vps/addAuth', 'addAuth', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (228, '更新VPS', '/vps/up', 'up', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (229, '释放VPS', '/vps/del', 'del', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (230, '续费VPS', '/vps/renew', 'renew', 7, 224, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (231, 'VPS开启', '/vps/on', 'on', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (233, '修改VPS密码', '/vps/changepass', 'changepass', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (234, '获取VPS产品信息', '/vps/getProItem', 'getProItem', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (235, '获取VPS价格', '/vps/getPrice', 'getPrice', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (236, 'VPS控制台', '/vps/manager', 'manager', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (237, '创建实例', '/cloudserver/create', 'create', 8, 224, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (238, '获取价格', '/cloudserver/getprice', 'getprice', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (239, '获取配置列表', '/cloudserver/getprolist', 'getprolist', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (240, '获取操作系统', '/cloudserver/getostype', 'getostype', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (241, '获取产品价格', '/cloudserver/getPrice', 'getPrice', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (242, '创建云主机订单', '/cloudserver/addauth', 'addauth', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (243, '获取监控信息', '/cloudserver/getmontoring', 'getmontoring', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (244, '设置云主机电源状态', '/cloudserver/virtual_power', 'virtual_power', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (245, '链接云主机vnc', '/cloudserver/tovnc', 'tovnc', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (246, '重装操作系统', '/cloudserver/toresetos', 'toresetos', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (247, '创建快照', '/cloudserver/createsnapshot', 'createsnapshot', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (248, '恢复快照', '/cloudserver/setsnapshot', 'setsnapshot', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (249, '删除快照', '/cloudserver/delsnapshot', 'delsnapshot', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (250, '创建备份', '/cloudserver/createbackups', 'createbackups', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (251, '恢复备份', '/cloudserver/setbackups', 'setbackups', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (252, '删除备份', '/cloudserver/delbackups', 'delbackups', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (253, '修改密码', '/cloudserver/changepass', 'changepass', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (254, '登录', '/login', 'login', 0, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (255, '获取注册验证码', '/login/getregcode', 'getregcode', 254, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (256, '获取忘记密码验证码', '/login/getretcode', 'getretcode', 254, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (257, '获取修改手机验证码', '/iam/sendrstcode', 'sendrstcode', 182, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (258, '旧手机号确认', '/iam/changeoldphone', 'changeoldphone', 182, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (259, '新手机号验证', '/iam/changenewphone', 'changenewphone', 182, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (260, '获取重置vps密码短信验证码', '/vps/getresetcode', 'getresetcode', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (261, '云虚拟主机', '/host', 'host', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1555555555, 1555555555);
INSERT INTO `gee_webroute` VALUES (262, '云虚拟主机管理', '/host/index', 'index', 261, 0, '1', NULL, '1', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (263, '创建云虚拟主机站点', '/host/add', 'add', 261, 261, '1', NULL, '1', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (264, '创建云虚拟主机验证', '/host/addAuth', 'addAuth', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (265, '获取云虚拟主机的价格', '/host/getprice', 'getprice', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 1222222222, 1555555555);
INSERT INTO `gee_webroute` VALUES (266, '云虚拟主机控制器', '/host/manager', 'manager', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555, 555555);
INSERT INTO `gee_webroute` VALUES (267, '云虚拟主机修改密码', '/host/changepass', 'changepass', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (268, '云解析', '/dns', 'dns', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 18888888, 18888888);
INSERT INTO `gee_webroute` VALUES (269, '云解析管理', '/dns/index', 'index', 268, 0, '1', NULL, '1', '0', 0, NULL, NULL, 888888, 8888);
INSERT INTO `gee_webroute` VALUES (270, '添加域名', '/dns/add_dns', 'add_dns', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 2222, 222);
INSERT INTO `gee_webroute` VALUES (271, '更新状态', '/dns/update_status', 'update_status', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 22222, 2222);
INSERT INTO `gee_webroute` VALUES (272, '解析记录', '/dns/recordlist', 'recordlist', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 11111111, 11111111);
INSERT INTO `gee_webroute` VALUES (273, '解析展示', '/dns/record', 'record', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 2111111, 1111111);
INSERT INTO `gee_webroute` VALUES (274, '解析添加', '/dns/record_add', 'record_add', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 11111, 1111);
INSERT INTO `gee_webroute` VALUES (275, '首页', '/home', 'home', 0, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (276, 'VPS产品', '/home/h_vps', 'h_vps', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (278, '生态合作', '/home/h_agent', 'h_agent', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (279, '云服务器', '/home/h_ecs', 'h_ecs', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (280, '内容分发网络CDN', '/home/h_cdn', 'h_cdn', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (281, '关于我们', '/home/h_about', 'h_about', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (282, '域名服务', '/home/h_domain', 'h_domain', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (283, '虚拟主机', '/home/h_host', 'h_host', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (284, '专属服务器', '/home/h_idc', 'h_idc', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (285, 'SSL证书服务', '/home/h_ssl', 'h_ssl', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (286, '促销活动', '/home/h_activity', 'h_activity', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (288, '首页', '/home/h_index', 'h_index', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (290, '代理商管理', '/agent', 'agent', 0, 0, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (291, '代理商信息', '/agent/index', 'index', 290, 290, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (292, '客户管理', '/agent/client', 'client', 290, 290, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (293, '编辑客户', '/agent/clientauth', 'clientauth', 290, 290, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (294, '客户资源', '/agent/resource', 'resource', 290, 290, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (295, '绑定代理商', '/agent/bind', 'bind', 290, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (296, '绑定代理商验证', '/agent/bindauth', 'bindauth', 290, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (297, '解析编辑', '/dns/record_edit', 'record_edit', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 222222, 222222);
INSERT INTO `gee_webroute` VALUES (298, '解析记录删除', '/dns/record_del', 'record_del', 268, 268, '1', NULL, '0', '0', 0, NULL, NULL, 22222222, 2222222);
INSERT INTO `gee_webroute` VALUES (299, '获取代理商历史数据', '/agent/gethistory', 'gethistory', 290, 290, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (300, '高防CDN', '/cdn', 'cdn', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (303, '创建高防CDN', '/cdn/add', 'add', 300, 302, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (302, '高防CDN管理', '/cdn/index', 'index', 300, 300, '1', NULL, '1', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (304, '创建高防CDN验证', '/cdn/addAuth', 'addAuth', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (305, '获取高防CDN价格', '/cdn/getprice', 'getprice', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (306, '高防CDN控制面板', '/cdn/manager', 'manager', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (307, '高防CDN修改密码', '/cdn/changepass', 'changepass', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (308, '获取虚拟主机密码', '/host/getpass', 'getpass', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (309, '获取高防CDN密码', '/cdn/getpass', 'getpass', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (310, '更新VPS列表信息', '/vps/updatelist', 'updatelist', 7, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (311, '更新Server列表信息', '/server/updatelist', 'updatelist', 166, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (312, '更新Host列表信息', '/host/updatelist', 'updatelist', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (313, '更新Dns列表信息', '/dns/updatelist', 'updatelist', 268, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (314, '更新Cloudserver列表信息', '/cloudserver/updatelist', 'updatelist', 8, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (315, '更新Cdn列表信息', '/cdn/updatelist', 'updatelist', 300, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (316, '更新Domain列表信息', '/domain/updatelist', 'updatelist', 9, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (317, '智能建站', '/smartsite', 'smartsite', 0, 0, '1', 'icon-ecs', '1', '0', 1, NULL, NULL, 1555555555, 1555555555);
INSERT INTO `gee_webroute` VALUES (318, '智能建站管理', '/smartsite/index', 'index', 317, 0, '1', NULL, '1', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (319, '创建智能建站', '/smartsite/add', 'add', 317, 317, '1', NULL, '1', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (320, '创建智能建站验证', '/smartsite/addAuth', 'addAuth', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 12222222, 1222222222);
INSERT INTO `gee_webroute` VALUES (321, '获取智能建站价格', '/smartsite/getprice', 'getprice', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 1222222222, 1555555555);
INSERT INTO `gee_webroute` VALUES (323, '智能建站控制器', '/smartsite/manager', 'manager', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555, 555555);
INSERT INTO `gee_webroute` VALUES (324, '智能建站修改密码', '/smartsite/changepass', 'changepass', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 155555555, 15555555);
INSERT INTO `gee_webroute` VALUES (325, '智能建站获取密码', '/smartsite/getpass', 'getpass', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (326, '智能建站列表更新', '/smartsite/updatelist', 'updatelist', 317, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (327, '代金券列表', '/billing/coupon', 'coupon', 131, NULL, '1', NULL, '1', '0', 0, NULL, NULL, 1560335597, 1560335597);
INSERT INTO `gee_webroute` VALUES (329, '获取新闻列表', '/home/getnews', 'getnews', 275, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);
INSERT INTO `gee_webroute` VALUES (330, '删除Host信息', '/host/del', 'del', 261, 0, '1', NULL, '0', '0', 0, NULL, NULL, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
