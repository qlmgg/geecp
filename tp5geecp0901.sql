/*
 Navicat Premium Data Transfer

 Source Server         : localhosts
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : tp5geecp

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 01/09/2020 14:14:15
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
-- Records of gee_accesskey
-- ----------------------------
INSERT INTO `gee_accesskey` VALUES (18, '6y2rpvk4x9p805bsquf1uhsafcr5n9cz', 'u4tvgqxkrzx9uy7tf5s1zv91av0dzonz', '地图用', 25, 1578648262, 1578648262);
INSERT INTO `gee_accesskey` VALUES (17, 'k4k1c93rf2tytqbvktv7degoygtk66er', 'azq9a0vuksgz7zut0pshxgb04otg0nxd', '短信用1.0', 25, 1578648255, 1578648255);
INSERT INTO `gee_accesskey` VALUES (16, 'ak6ez2c6dernzqs74sg5ygft1npszf8v', 'uvprk9ruetgpf7fx043cn8obgpp7ovg1', '上传图片1.0', 25, 1578648248, 1578648248);
INSERT INTO `gee_accesskey` VALUES (21, '6fg4s5kpvcoygeq1vkg4sfgu8v3xh9ko', 'o258eas5yegbfyc82orvdsr612hhv54z', '', 25, 1597392766, 1597392766);

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
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_addons
-- ----------------------------
INSERT INTO `gee_addons` VALUES (53, 'dnspod', '七朵云', 'dns', '{\"user\": {\"type\": \"text\",\"value\": \"\"},\"password\": {\"type\": \"password\",\"value\": \"\"},\"product_id\": {\"type\": \"text\",\"value\": \"\"},\"machine_room\": {\"type\": \"text\",\"value\": \"\"},\"type\": {\"type\": \"text\",\"value\": \"\",\"title\":\"dnspod\"}}', 'dnspod', NULL, '1.0.0', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (3, 'zoneidc', '七朵云', 'vps', '{\"user\": {\"type\": \"text\",\"value\": \"\"},\"password\": {\"type\": \"password\",\"value\": \"\"},\"product_id\": {\"type\": \"text\",\"value\": \"\"},\"machine_room\": {\"type\": \"text\",\"value\": \"\"}}', '纵横IDC', NULL, 'v1.0.1', 'https://geecloud.su.bcebos.com/geecloud/87310072111169539.zip', '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (47, 'cndns', '七朵云', 'domain', '{\"username\":{\"type\":\"text\",\"value\":\"\"},\"password\":{\"type\":\"password\",\"value\":\"\"},\"email\":{\"type\":\"text\",\"value\":\"\"}}', '美橙互联', NULL, 'v1.0.1', 'https://geecloud.su.bcebos.com/geecloud/87310379012587527.zip', '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (48, 'nokvm', '七朵云', 'cloudserver', '{\"uri\":{\"type\":\"text\",\"value\":\"\"},\"token\":{\"type\":\"text\",\"value\":\"\"},\"eipprice\":{\"type\":\"text\",\"value\":\"\",\"title\":\"带宽价格\",\"place\":\"每1Mbps\"},\"cdsprice\":{\"type\":\"text\",\"value\":\"\",\"title\":\"云磁盘价格\",\"place\":\"每1GB\"},\"areas_id\":{\"type\":\"text\",\"value\":\"\",\"title\":\"数据中心ID\",\"place\":\"\"},\"nodes_id\":{\"type\":\"text\",\"value\":\"\",\"title\":\"计算节点ID\",\"place\":\"\"},\"core\":{\"type\":\"text\",\"value\":\"\",\"title\":\"核心数\",\"place\":\"\"},\"cpu_mode\":{\"type\":\"text\",\"value\":\"\",\"title\":\"处理器模式\",\"place\":\"0:显示 1:隐藏\"},\"memory\":{\"type\":\"text\",\"value\":\"\",\"title\":\"内存\",\"place\":\"单位为MB\"},\"sys_disk_mode\":{\"type\":\"text\",\"value\":\"\",\"title\":\"系统盘模式\",\"place\":\"可输入值为writeback | writethrough | unsafe | directsync\"},\"sys_disk_iops\":{\"type\":\"text\",\"value\":\"\",\"title\":\"系统盘IOPS\",\"place\":\"\"},\"sys_disk_read\":{\"type\":\"text\",\"value\":\"\",\"title\":\"系统盘读取\",\"place\":\"\"},\"sys_disk_write\":{\"type\":\"text\",\"value\":\"\",\"title\":\"系统盘写入\",\"place\":\"\"},\"data_disk_mode\":{\"type\":\"text\",\"value\":\"\",\"title\":\"云磁盘模式\",\"place\":\"可输入值为writeback | writethrough | unsafe | directsync\"},\"data_disk_iops\":{\"type\":\"text\",\"value\":\"\",\"title\":\"云磁盘IOPS\"},\"data_disk_read\":{\"type\":\"text\",\"value\":\"\",\"title\":\"云磁盘读取\"},\"data_disk_write\":{\"type\":\"text\",\"value\":\"\",\"title\":\"云磁盘写入\"},\"snapshoot\":{\"type\":\"text\",\"value\":\"\",\"title\":\"快照数\"},\"backups\":{\"type\":\"text\",\"value\":\"\",\"title\":\"备份数\"},\"ip_num\":{\"type\":\"text\",\"value\":\"\",\"title\":\"分配IP数\"},\"flow_limit\":{\"type\":\"text\",\"value\":\"\",\"title\":\"限制流量\",\"place\":\"上行+下行总数 GB\"},\"nat_acl_limit\":{\"type\":\"text\",\"value\":\"\",\"title\":\"转发策略限制条数\"},\"nat_web_limit\":{\"type\":\"text\",\"value\":\"\",\"title\":\"NAT建站限制数\"}}', 'nokvm', NULL, 'v1.0.1', 'https://geecloud.su.bcebos.com/geecloud/87310448075997190.zip', '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (49, 'chshuju', '七朵云', 'vps', '{\"user\": {\"type\": \"text\",\"value\": \"\"},\"password\": {\"type\": \"password\",\"value\": \"\"},\"product_id\": {\"type\": \"text\",\"value\": \"\"},\"machine_room\": {\"type\": \"text\",\"value\": \"\"}}', '彩虹云主机', NULL, 'v1.0.1', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (50, 'xingwai', '七朵云', 'vps', '{\"uri\":{\"type\":\"text\",\"value\":\"\"},\"manageuri\":{\"type\":\"text\",\"value\":\"\"},\"user\": {\"type\": \"text\",\"value\": \"\"},\"password\": {\"type\": \"password\",\"value\": \"\"},\"product_id\": {\"type\": \"text\",\"value\": \"\"},\"machine_room\": {\"type\": \"text\",\"value\": \"\"}}', '星外', NULL, 'v1.0.1', 'https://geecloud.su.bcebos.com/geecloud/87310581719105543.zip', '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (51, 'chuangmeng', '七朵云', 'vps', '{\"uri\":{\"type\":\"text\",\"value\":\"\"},\"manageuri\":{\"type\":\"text\",\"value\":\"\"},\"changepwuri\":{\"type\":\"text\",\"value\":\"\"},\"user\": {\"type\": \"text\",\"value\": \"\"},\"password\": {\"type\": \"password\",\"value\": \"\"},\"product_id\": {\"type\": \"text\",\"value\": \"\"},\"machine_room\": {\"type\": \"text\",\"value\": \"\"}}', '创梦', NULL, '1.0', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (52, 'easypanel', '七朵云', 'host', '{\"serverip\": {\"type\": \"text\",\"value\": \"\",\"title\":\"通信地址\"},\"prot\": {\"type\": \"text\",\"value\": \"\",\"title\":\"通信端口\"},\"skey\": {\"type\": \"password\",\"value\": \"\",\"title\":\"通信密钥\"}}', 'easypanel主机', NULL, '1.0.0', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (54, 'easypanelcdn', '七朵云', 'cdn', '{\"serverip\": {\"type\": \"text\",\"value\": \"\",\"title\":\"通信地址\"},\"prot\": {\"type\": \"text\",\"value\": \"\",\"title\":\"通信端口\"},\"skey\": {\"type\": \"password\",\"value\": \"\",\"title\":\"通信密钥\"}}', 'easypanel主机', NULL, '1.0.0', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (55, 'nicenic', '七朵云', 'smartsite', '{\"uri\": {\"type\": \"text\",\"value\": \"\",\"title\":\"通信地址\"},\"user\": {\"type\": \"text\",\"value\": \"\",\"title\":\"用户名\"},\"pass\": {\"type\": \"password\",\"value\": \"\",\"title\":\"用户密码\"},\"email\": {\"type\": \"text\",\"value\": \"\",\"title\":\"电子邮箱\"},\"category\": {\"type\": \"text\",\"value\": \"nicebox\",\"title\":\"产品类型\"},\"productid\": {\"type\": \"text\",\"value\": \"\",\"title\":\"对应产品标识\"},\"wwwroot\": {\"type\": \"text\",\"value\": \"\",\"title\":\"网站根目录\",\"place\":\"如www或wwwroot等,可留空或字母数字1-30位组成\"},\"wxapp\": {\"type\": \"text\",\"value\": \"\",\"title\":\"微信小程序版本\",\"place\":\"1 展示版;2 商城版;3 分销版;不需要留空或填0\"},\"bdapp\": {\"type\": \"text\",\"value\": \"\",\"title\":\"百度小程序版本\",\"place\":\"1 展示版;2 商城版;不需要留空或填0\"}}', 'nicenic智能建站', NULL, '1.0.0', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (61, 'direct', '七朵云', 'host', '{\"serverip\": {\"type\": \"text\",\"value\": \"\",\"title\":\"可分配IP地址\",\"place\":\"多个IP以,隔开\"},\"host\": {\"type\": \"text\",\"value\": \"\",\"title\":\"API通信地址\"},\"port\": {\"type\": \"text\",\"value\": \"\",\"title\":\"API通信端口\"},\"username\": {\"type\": \"text\",\"value\": \"\",\"title\":\"通信账号\"},\"password\": {\"type\": \"password\",\"value\": \"\",\"title\":\"通信密钥\"},\"product_id\": {\"type\": \"text\",\"value\": \"\",\"title\":\"包\"}}', 'direct主机', '', '1.0.0', NULL, '0', 2, NULL, NULL);
INSERT INTO `gee_addons` VALUES (62, 'westdomain', '七朵云', 'domain', '{\"username\":{\"type\":\"text\",\"value\":\"\"},\"password\":{\"type\":\"password\",\"value\":\"\"},\"email\":{\"type\":\"text\",\"value\":\"\"}}', '西部数码域名', NULL, 'v1.0.1', 'https://geecloud.su.bcebos.com/geecloud/87310379012587527.zip', '0', 2, NULL, NULL);

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
-- Records of gee_adminuser
-- ----------------------------
INSERT INTO `gee_adminuser` VALUES (1, 'admin', 'xiao.song@qiduo.net', '13789398868', '$2y$11$VdMG2QNj/d/QOSEhmZIYBeqmHHluwO/NOGBjA/5e8b1tnR5gifq2G', '', '::1', 1557120679, 1598520823, 1598520823, '0', '超级管理员', 8);
INSERT INTO `gee_adminuser` VALUES (2, 'ylsq', '975827527@qq.com', '13789398868', '$2y$11$qQ9UaQFTqXPuqIH09EOmnuo8LboAla4L9L6Z1vS1tBmNk1gK.ktRe', NULL, '::1', 1557385353, 1558062805, 1588046107, '0', '詹孝松', 8);

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
INSERT INTO `gee_annexconfig` VALUES (1, '0', 'admin', 'admin', '123456', '', '0', '0', 0, '', '7f6c56d21e614761ab8b4e24c87894e1', '52b6b87bdde3403ca909a41c1b9ff1f6', 'ylsq', 'https://ylsq.bj.bcebos.com', 'zhPJnjM_qEE0mpKp99rL2BSBrH-w4gEsXtcTd4i7', 'JeA4dtj0shvY99qxQYr787ITXS05OuFoQnpGKYBx', 'ylsq', 'http://qiniu.geestack.cn', '', '', '', '', 1558084404, 1587457290);

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
) ENGINE = MyISAM AUTO_INCREMENT = 311 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_billing
-- ----------------------------
INSERT INTO `gee_billing` VALUES (19, 'chBHLTX1', 'abcdefghijklmnopqrstvwxy02356789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 9852.01, 0.00, NULL, '0', '', '1', '1', '1', 1561002411, 1561088971);
INSERT INTO `gee_billing` VALUES (20, 'kpAHKV27', 'abcefghijklmnopqrstuvwxyz0345789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-16G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a16GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a150G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"899.00\"}]', 25, NULL, '0', 'create', 899.00, NULL, NULL, NULL, 8953.01, 0.00, NULL, '0', '', '1', '1', '1', 1561089736, 1561089740);
INSERT INTO `gee_billing` VALUES (25, 'cejyAFW6', 'abcefhjklmnopqrstvwxyz0123456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-32G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a32GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a200G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"2\",\"price\":\"2,798.00\"}]', 25, NULL, '0', 'create', 2798.00, NULL, NULL, NULL, 6155.01, 0.00, NULL, '0', '', '1', '1', '1', 1561097731, 1561097788);
INSERT INTO `gee_billing` VALUES (24, 'txIJLNOS', 'abcdefhijklmnopqsuvwxyz013456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-16G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a16GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a150G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"3\",\"price\":\"2,697.00\"}]', 25, NULL, '0', 'create', 2697.00, NULL, NULL, NULL, 8953.00, 0.00, NULL, '0', '', '0', '2', '0', 1561097317, 1561097317);
INSERT INTO `gee_billing` VALUES (23, 'hvyGV239', 'abcdefhijklnopqrstuvwxyz02456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-32G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a32GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a200G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"36\",\"price\":\"41,970.00\"}]', 25, NULL, '0', 'create', 41970.00, NULL, NULL, NULL, 8953.00, 0.00, NULL, '0', '', '0', '2', '0', 1561096922, 1561096922);
INSERT INTO `gee_billing` VALUES (26, 'ajrzAHT9', 'abcdefgijklmnpqrtuvwxyz013456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 6106.01, 0.00, NULL, '0', '', '1', '1', '1', 1561098725, 1561099000);
INSERT INTO `gee_billing` VALUES (27, 'bchwAJNU', 'abcdfghijkmnoprstuvwxyz012345789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-16G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a16GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a150G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"5\",\"price\":\"4,495.00\"}]', 25, NULL, '0', 'create', 4495.00, NULL, NULL, NULL, 1611.01, 0.00, NULL, '0', '', '1', '1', '1', 1561099151, 1561099158);
INSERT INTO `gee_billing` VALUES (28, 'aetvFKM0', 'abcdefgiklmnopqstuvwxy0123456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 1562.01, 0.00, NULL, '0', '', '1', '1', '1', 1561102269, 1561102792);
INSERT INTO `gee_billing` VALUES (29, 'bxBGIKX4', 'abcdghiklmnopqrstuwxyz0123456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 1513.01, 0.00, NULL, '0', '', '1', '1', '1', 1561103048, 1561103058);
INSERT INTO `gee_billing` VALUES (30, 'aklpsCF9', 'abcdefhijkloprstuvwxyz0123456789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1463.01, 0.00, NULL, '0', '', '1', '1', '1', 1573195860, 1573195865);
INSERT INTO `gee_billing` VALUES (31, 'lxHOUZ01', 'abcdefghijlmnopqrstvwxy012356789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1413.01, 0.00, NULL, '0', '', '1', '1', '1', 1573195955, 1573195960);
INSERT INTO `gee_billing` VALUES (32, 'ghqrKWX3', 'abcdefgiklmnopqrstvxyz0123456789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1363.01, 0.00, NULL, '0', '', '1', '1', '1', 1573196002, 1573196006);
INSERT INTO `gee_billing` VALUES (33, 'beqwJMU1', 'bcdefghijklmnoqrstuwxyz012356789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1313.01, 0.00, NULL, '0', '', '1', '1', '1', 1573196551, 1573196555);
INSERT INTO `gee_billing` VALUES (34, 'ehszGKU0', 'abcdefhijlmnopqrstvwxyz012456789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1263.01, 0.00, NULL, '0', '', '1', '1', '1', 1573196871, 1573196917);
INSERT INTO `gee_billing` VALUES (35, 'kruyJMY7', 'abcdefghiklmnoprstuvwx0123456789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1263.00, 0.00, NULL, '0', '', '0', '2', '0', 1573197299, 1573197299);
INSERT INTO `gee_billing` VALUES (36, 'dFGOTUY9', 'abcdefghijklmnorstuvwxyz03456789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1263.00, 0.00, NULL, '0', '', '0', '2', '0', 1573197396, 1573197396);
INSERT INTO `gee_billing` VALUES (37, 'jlrRSW68', 'abcdfghijklmnopqrstuvxy012456789', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 1263.00, 0.00, NULL, '0', '', '0', '2', '0', 1573197440, 1573197440);
INSERT INTO `gee_billing` VALUES (38, 'noFHOT45', 'acdfghijklmnopqrstuvwxy012356789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1213.01, 0.00, NULL, '0', '', '1', '1', '1', 1573197579, 1573197652);
INSERT INTO `gee_billing` VALUES (39, 'hjmoACF2', 'abcdfghijklmnoqrtuvwxyz012345679', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1163.01, 0.00, NULL, '0', '', '1', '1', '1', 1573197893, 1573197977);
INSERT INTO `gee_billing` VALUES (40, 'cdhnoJL1', 'abcdfhijkmnpqrstuvwxyz0123456789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1163.00, 0.00, NULL, '0', '', '0', '2', '0', 1573198018, 1573198018);
INSERT INTO `gee_billing` VALUES (41, 'bloqswDE', 'abcdeghijklmnopqrstvwxy012345789', '[{\"group\":\"\\u9999\\u6e2f\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u9999\\u6e2f\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]', 25, NULL, '0', 'create', 50.00, NULL, NULL, NULL, 1113.01, 0.00, NULL, '0', '', '1', '1', '1', 1573198341, 1573198364);
INSERT INTO `gee_billing` VALUES (42, 'doHKLPXZ', 'abcdefhjklmopqrsuvwxyz0123456789', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1103.01, 0.00, NULL, '0', '', '1', '1', '1', 1573198829, 1573198834);
INSERT INTO `gee_billing` VALUES (43, 'fhEJQR38', 'abcdefghijlmnopqtuvwxyz012345789', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1093.01, 0.00, NULL, '0', '', '1', '1', '1', 1573198862, 1573198870);
INSERT INTO `gee_billing` VALUES (44, 'aptvyBJ2', 'abcdefghijklnopqrstuvwxz01356789', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1083.01, 0.00, NULL, '0', '', '1', '1', '1', 1573198990, 1573198995);
INSERT INTO `gee_billing` VALUES (45, 'befklEGY', 'abcefghijklmnopqrtuvwyz023456789', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1073.01, 0.00, NULL, '0', '', '1', '1', '1', 1573199046, 1573199051);
INSERT INTO `gee_billing` VALUES (46, 'duCFPU29', 'acdefghijklmnopqrstuvwyz12356789', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1063.01, 0.00, NULL, '0', '', '1', '1', '1', 1573199093, 1573199097);
INSERT INTO `gee_billing` VALUES (47, 'gABLV368', 'abcdefghijkmnoprstuvwxz012356789', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1053.01, 0.00, NULL, '0', '', '1', '1', '1', 1573199128, 1573199133);
INSERT INTO `gee_billing` VALUES (48, 'efhGIMZ3', 'bcdefghijklmnoprstuwxyz012345679', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u670d\\u52a1\\u5668\\u6d4b\\u8bd5\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\",\"years\":\"1\",\"price\":\"11.00\"}]', 25, NULL, '0', 'create', 11.00, NULL, NULL, NULL, 1031.01, 0.00, NULL, '0', '', '1', '1', '1', 1573199259, 1573199508);
INSERT INTO `gee_billing` VALUES (49, 'mtFIJV06', '2019110805565136824', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 1041.84, 1.00, NULL, '1', '账户充值 - 金额为:0.01', '1', '1', '1', 1573207011, 1573524575);
INSERT INTO `gee_billing` VALUES (50, 'ciklnAG1', '2019111111170982277', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 1041.99, 0.00, NULL, '0', '账户充值 - 金额为:0.01', '1', '1', '1', 1573442229, 1573461915);
INSERT INTO `gee_billing` VALUES (51, 'joJLQZ05', '2019111104071854522', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u670d\\u52a1\\u5668\\u6d4b\\u8bd5\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\",\"years\":\"1\",\"price\":\"11.00\"}]', 25, NULL, '0', 'renew', 11.00, NULL, NULL, NULL, 1042.01, 0.00, NULL, '0', '', '2', '2', '0', 1573459638, 1573459638);
INSERT INTO `gee_billing` VALUES (52, 'abnsAJNV', '2019111104364719496', '0', 25, NULL, '1', '0', 200.00, NULL, NULL, NULL, 842.00, 0.00, NULL, '1', '账户充值 - 金额为:200', '2', '0', '1', 1573461407, 1573461407);
INSERT INTO `gee_billing` VALUES (53, 'eyAGMT36', '2019111210144344109', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 1041.84, 1.00, NULL, '1', '账户充值 - 金额为:0.01', '0', '1', '1', 1573524884, 1573526959);
INSERT INTO `gee_billing` VALUES (54, 'dnzAHO18', '2019111212321663661', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 992.85, 1.00, NULL, '1', '', '0', '1', '1', 1573533136, 1573535846);
INSERT INTO `gee_billing` VALUES (55, 'ejEMY249', '2019111202134410672', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1041.85, 0.00, NULL, '0', '', '2', '2', '0', 1573539224, 1573539224);
INSERT INTO `gee_billing` VALUES (56, 'bhAFGJKV', '2019111202141872134', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1031.85, 1.00, NULL, '1', '', '2', '1', '1', 1573539258, 1573540045);
INSERT INTO `gee_billing` VALUES (57, 'gimpqxyK', '2019111202404112095', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 1001.85, 0.00, NULL, '0', '', '1', '1', '1', 1573540841, 1573540969);
INSERT INTO `gee_billing` VALUES (58, 'inoZ0467', '2019111202484271291', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 1001.84, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1573541322, 1573541322);
INSERT INTO `gee_billing` VALUES (59, 'abijmvLQ', '2019111202503867438', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u670d\\u52a1\\u5668\\u6d4b\\u8bd5\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\",\"years\":\"1\",\"price\":\"11.00\"}]', 25, NULL, '0', 'renew', 11.00, NULL, NULL, NULL, 990.85, 0.00, NULL, '0', '', '1', '1', '1', 1573541438, 1573541444);
INSERT INTO `gee_billing` VALUES (60, 'oPRX0179', '2019111202525742199', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 980.85, 0.00, NULL, '0', '', '1', '1', '1', 1573541577, 1573541589);
INSERT INTO `gee_billing` VALUES (61, 'xyFM1239', '2019111202550816291', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 980.85, 0.00, NULL, '0', '', '0', '2', '0', 1573541708, 1573541708);
INSERT INTO `gee_billing` VALUES (62, 'eiquFLVW', '2019111202565834722', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 970.84, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1573541818, 1573541818);
INSERT INTO `gee_billing` VALUES (63, 'dkryEQY5', '2019111203040765644', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 950.85, 0.00, NULL, '0', '', '1', '1', '1', 1573542247, 1573542257);
INSERT INTO `gee_billing` VALUES (64, 'psACDJRT', '2019111203212232721', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 930.85, 0.00, NULL, '0', '', '2', '2', '0', 1573543282, 1573543282);
INSERT INTO `gee_billing` VALUES (65, 'jkpAJLVX', '2019111203352943480', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 820.85, 0.00, NULL, '0', '', '1', '1', '1', 1573544129, 1573544176);
INSERT INTO `gee_billing` VALUES (66, 'gilmotFT', '2019111203363968332', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 810.85, 0.00, NULL, '0', '', '1', '1', '1', 1573544199, 1573544205);
INSERT INTO `gee_billing` VALUES (67, 'ryzEFHV4', '2019111401515323118', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 810.84, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1573710713, 1573710713);
INSERT INTO `gee_billing` VALUES (91, 'hlqvLVWY', '2019111910134029224', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u5bbf\\u8fc1\\u5feb\\u901f\\u673a\\u578bI\\u578b\",\"type\":\"create\",\"num\":\"1\",\"config\":\"kkkk\",\"years\":\"4\",\"price\":\"1,129.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"24\",\"hostname\":\"gpstKU24\",\"added\":\"{\\\"CC\\\":\\\"\\u5f00\\u542f\\\",\\\"ddosfree\\\":\\\"\\u9ed8\\u8ba4 5 IP DDOS \\u9632\\u62a4\\\",\\\"ddospro\\\":\\\"\\u514d\\u8d39 10G DDOS \\u9632\\u62a4\\u670d\\u52a1\\\",\\\"ip\\\":\\\"\\u5347\\u7ea7\\u81f3 \\/29 5\\u4e2a\\u53ef\\u7528IP \\\",\\\"bandwidth\\\":\\\"\\u514d\\u8d39100M\\uff08\\u76f4\\u8fde\\u5e26\\u5bbd\\uff09\\u670d\\u52a1\\\",\\\"memory\\\":\\\"\\u9ed8\\u8ba4 16GB \\u5185\\u5b58\\\",\\\"HDD1\\\":\\\"\\u9ed8\\u8ba4 1TB SATA HDD \\u786c\\u76d8\\\",\\\"HDD2\\\":\\\"\\u589e\\u52a0 1TB SATA HDD \\u786c\\u76d8\\\",\\\"cn2\\\":\\\"CN2\\/GIA \\u5347\\u7ea7\\u9009\\u9879 42\\u5143\\/M\\\"}\",\"remake\":\"\",\"user_id\":25}]', 25, NULL, '0', 'create', 1129.00, NULL, NULL, NULL, 11786.85, 0.00, NULL, '0', '', '1', '1', '1', 1574129620, 1574129626);
INSERT INTO `gee_billing` VALUES (121, 'dAELMRU1', '2019112702534293991', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"953.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"test-v-1\",\"added\":\"{\\\"HDD2\\\":46,\\\"cn2\\\":53}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":null,\"password\":null}]', 25, NULL, '0', 'create', 953.00, NULL, NULL, NULL, 4793.85, 0.00, NULL, '0', '', '1', '1', '1', 1574837622, 1574837632);
INSERT INTO `gee_billing` VALUES (90, 'agvEKOZ2', '2019111909505893621', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u5bbf\\u8fc1\\u5feb\\u901f\\u673a\\u578bII\\u578b\",\"type\":\"create\",\"num\":\"1\",\"config\":\"kkkkkkkkkk\",\"years\":\"2\",\"price\":\"2,528.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"23\",\"hostname\":\"\\u6d4b\\u8bd5\",\"added\":\"{\\\"CC\\\":\\\"\\u5f00\\u542f\\\",\\\"ddosfree\\\":\\\"\\u5347\\u7ea7\\u81f3 \\/29 \\u9632\\u62a4\\u670d\\u52a1\\\",\\\"ddospro\\\":\\\"\\u5347\\u7ea7\\u81f3 20G DDOS \\u9632\\u62a4\\u670d\\u52a1\\\",\\\"dk\\\":\\\"10\\\"}\",\"remake\":\"\\u6d4b\\u8bd5\\u7528\",\"user_id\":25}]', 25, NULL, '0', 'create', 2528.00, NULL, NULL, NULL, 785.85, 0.00, NULL, '0', '', '1', '1', '1', 1574128258, 1574128273);
INSERT INTO `gee_billing` VALUES (119, 'eEJLPRWX', '2019112702414870467', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"953.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"muAJKLV2\",\"added\":\"{\\\"HDD2\\\":46,\\\"cn2\\\":53}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":null,\"ostype\":null}]', 25, NULL, '0', 'create', 953.00, NULL, NULL, NULL, 5749.85, 0.00, NULL, '0', '', '1', '1', '1', 1574836908, 1574836915);
INSERT INTO `gee_billing` VALUES (120, 'cehorwyL', '2019112702471321788', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"noBFKQU4\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 5746.85, 0.00, NULL, '0', '', '1', '1', '1', 1574837233, 1574837305);
INSERT INTO `gee_billing` VALUES (117, 'hntEJPZ8', '2019112702320579399', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"adeguF01\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 17286.85, 0.00, NULL, '0', '', '0', '2', '0', 1574836325, 1574836325);
INSERT INTO `gee_billing` VALUES (118, 'szBMU079', '2019112702324328192', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u5bbf\\u8fc1\\u5feb\\u901f\\u673a\\u578bII\\u578b\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"kkkkkkkkkk\",\"years\":\"6\",\"price\":\"10584.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"23\",\"hostname\":\"aqwCJZ48\",\"added\":\"{\\\"CC\\\":18,\\\"ddosfree\\\":20,\\\"ddospro\\\":22,\\\"dk\\\":\\\"54,10\\\"}\",\"remake\":\"\",\"user_id\":25}]', 25, NULL, '0', 'create', 10584.00, NULL, NULL, NULL, 6702.85, 0.00, NULL, '0', '', '1', '1', '1', 1574836363, 1574836404);
INSERT INTO `gee_billing` VALUES (92, 'bcloxP17', '2019111906141036372', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"4\",\"price\":\"983.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"klEIWX39\",\"added\":\"{\\\"HDD2\\\":\\\"\\u589e\\u52a0 2TB SATA HDD \\u786c\\u76d8\\\",\\\"cn2\\\":\\\"CN2\\/GIA \\u5347\\u7ea7\\u9009\\u9879 42\\u5143\\/M\\\"}\",\"remake\":\"12321\",\"user_id\":25}]', 25, NULL, '0', 'create', 983.00, NULL, NULL, NULL, 9820.85, 0.00, NULL, '0', '', '1', '1', '1', 1574158450, 1574158539);
INSERT INTO `gee_billing` VALUES (122, 'qFKMNP59', '2019112702555847482', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"test-v-2\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"test123456\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4791.85, 0.00, NULL, '0', '', '1', '1', '1', 1574837758, 1574837774);
INSERT INTO `gee_billing` VALUES (94, 'adfmLN36', '2019112103271033860', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u5bbf\\u8fc1\\u5feb\\u901f\\u673a\\u578bII\\u578b\",\"type\":\"create\",\"num\":\"1\",\"config\":\"kkkkkkkkkk\",\"years\":\"12\",\"price\":\"2,262.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"23\",\"hostname\":\"bdpqt479\",\"added\":\"{\\\"CC\\\":18,\\\"ddosfree\\\":19,\\\"ddospro\\\":21,\\\"dk\\\":\\\"54,1\\\"}\",\"remake\":\"\",\"user_id\":25}]', 25, NULL, '0', 'create', 2262.00, NULL, NULL, NULL, 9818.85, 0.00, NULL, '0', '', '1', '1', '1', 1574321230, 1574321429);
INSERT INTO `gee_billing` VALUES (124, 'hsKLNOS8', '2019112810085394535', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"biCDFNR5\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4790.85, 1.00, NULL, '1', '', '0', '1', '1', 1574906933, 1574908742);
INSERT INTO `gee_billing` VALUES (125, 'ijvBDW09', '2019112802511924881', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"dhoqIMS7\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"123123\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4790.85, 0.00, NULL, '0', '', '1', '1', '1', 1574923879, 1574923884);
INSERT INTO `gee_billing` VALUES (126, 'gryALW48', '2019112803043359739', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"oBCFHL39\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4789.85, 0.00, NULL, '0', '', '1', '1', '1', 1574924673, 1574924677);
INSERT INTO `gee_billing` VALUES (127, 'anBIJL56', '2019112803084260101', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"ciHORUX8\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4788.85, 0.00, NULL, '0', '', '1', '1', '1', 1574924922, 1574924926);
INSERT INTO `gee_billing` VALUES (128, 'eixIOSTZ', '2019112805520671392', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"diluL149\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4787.85, 0.00, NULL, '0', '', '1', '1', '1', 1574934726, 1574934732);
INSERT INTO `gee_billing` VALUES (129, 'hjsxyzI4', '2019120206043694695', '0', 25, NULL, '1', '0', 200.00, NULL, NULL, NULL, 4587.85, NULL, NULL, '1', '账户充值 - 金额为:200', '0', '0', '1', 1575281076, 1575281076);
INSERT INTO `gee_billing` VALUES (110, 'fgqszAZ8', '2019112104534510064', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u5bbf\\u8fc1\\u5feb\\u901f\\u673a\\u578bII\\u578b\",\"type\":\"create\",\"num\":\"1\",\"config\":\"kkkkkkkkkk\",\"years\":\"1\",\"price\":\"2428.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"23\",\"hostname\":\"klmIOPS3\",\"added\":\"{\\\"CC\\\":18,\\\"ddosfree\\\":20,\\\"ddospro\\\":22,\\\"dk\\\":\\\"54,1\\\"}\",\"remake\":\"\",\"user_id\":25}]', 25, NULL, '0', 'create', 2428.00, NULL, NULL, NULL, 7390.85, 0.00, NULL, '0', '', '1', '1', '1', 1574326425, 1574326534);
INSERT INTO `gee_billing` VALUES (116, 'luxyzEG7', '2019112204151360013', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u5bbf\\u8fc1\\u5feb\\u901f\\u673a\\u578bII\\u578b\",\"type\":\"renew\",\"id\":\"7\",\"num\":\"1\",\"config\":\"kkkkkkkkkk\",\"years\":\"3\",\"price\":\"5068.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"23\",\"hostname\":\"ikCINX23\",\"added\":\"{\\\"CC\\\":18,\\\"ddosfree\\\":20,\\\"ddospro\\\":22,\\\"dk\\\":\\\"54,10\\\"}\",\"remake\":\"undefined\",\"user_id\":25}]', 25, NULL, '0', 'renew', 5068.00, NULL, NULL, NULL, 17286.85, 0.00, NULL, '0', '', '1', '1', '1', 1574410513, 1574410939);
INSERT INTO `gee_billing` VALUES (132, 'fxEINSV4', '2019122012480720783', '0', 25, NULL, '1', '0', 200.00, NULL, NULL, NULL, 4587.85, NULL, NULL, '1', '账户充值 - 金额为:200', '0', '0', '1', 1576817287, 1576817287);
INSERT INTO `gee_billing` VALUES (133, 'hrzDIM25', '2019122506101463714', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"opAFMOY3\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4787.85, 0.00, NULL, '0', '', '0', '2', '0', 1577268614, 1577268614);
INSERT INTO `gee_billing` VALUES (135, 'givwIV04', '2020010301514411780', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 4787.85, 0.00, NULL, '0', '', '0', '2', '0', 1578030704, 1578030704);
INSERT INTO `gee_billing` VALUES (138, 'cmprwAD9', '2020010603170082294', '0', 25, NULL, '1', '0', 500.00, NULL, NULL, NULL, 4239.85, NULL, NULL, '1', '账户充值 - 金额为:500', '0', '0', '1', 1578295020, 1578295020);
INSERT INTO `gee_billing` VALUES (141, 'aqzGJKM9', '2020011002515538979', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 4729.61, 0.00, NULL, '0', '', '1', '1', '1', 1578639115, 1578639214);
INSERT INTO `gee_billing` VALUES (140, 'astEV046', '2020010702143923599', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"num\":1,\"years\":120,\"price\":\"10.00\"}]', 25, NULL, '0', 'renew', 10.00, NULL, NULL, NULL, 4739.61, 0.00, NULL, '0', '', '0', '2', '0', 1578377679, 1578377679);
INSERT INTO `gee_billing` VALUES (142, 'n4zf61ue', '2020012110344355800', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4726.61, 0.00, NULL, '0', '', '1', '1', '1', 1579574083, 1579574650);
INSERT INTO `gee_billing` VALUES (143, 'vnqfo2q4', '2020012111150124731', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4724.61, 0.00, NULL, '0', '', '1', '1', '1', 1579576501, 1579578004);
INSERT INTO `gee_billing` VALUES (156, '17ctoxgb', '2020021011132551317', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4709.93, 0.00, NULL, '0', '', '0', '2', '0', 1581347605, 1581347605);
INSERT INTO `gee_billing` VALUES (155, 'vcdc81z2', '2020021010115477680', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4715.13, 0.00, NULL, '0', '', '0', '2', '0', 1581343914, 1581343914);
INSERT INTO `gee_billing` VALUES (158, 'p72pb8zs', '2020022009060066455', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4703.17, 0.00, NULL, '0', '', '1', '1', '1', 1582203960, 1582204095);
INSERT INTO `gee_billing` VALUES (159, '53bvoo4k', '2020022009092382344', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4702.65, 0.00, NULL, '0', '', '1', '1', '1', 1582204163, 1582204183);
INSERT INTO `gee_billing` VALUES (160, 'zgsvqgr2', '2020022009153839438', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4702.13, 0.00, NULL, '0', '', '1', '1', '1', 1582204538, 1582204557);
INSERT INTO `gee_billing` VALUES (161, 'ay0u6h2g', '2020022104395767234', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4701.61, 0.00, NULL, '0', '', '1', '1', '1', 1582274397, 1582274411);
INSERT INTO `gee_billing` VALUES (162, 'u5k91bdc', '2020022107170558500', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'create', 0.52, NULL, NULL, NULL, 4701.09, 0.00, NULL, '0', '', '1', '1', '1', 1582283825, 1582283841);
INSERT INTO `gee_billing` VALUES (163, 'ckua6syq', '2020022407544630920', '[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":1,\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]', 25, NULL, '0', 'renew', 0.52, NULL, NULL, NULL, 4699.53, 0.00, NULL, '0', '', '1', '1', '1', 1582545286, 1582545452);
INSERT INTO `gee_billing` VALUES (164, 'e1rp7qkx', '2020040304431219422', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:ylsq2018.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"}]', 25, NULL, '0', 'create', 8.00, NULL, NULL, NULL, 4699.53, 0.00, NULL, '0', '', '0', '2', '0', 1585903392, 1585903392);
INSERT INTO `gee_billing` VALUES (165, 'r3o4zr1a', '2020040711055328215', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 4689.53, 0.00, NULL, '0', '', '1', '1', '1', 1586228753, 1586229068);
INSERT INTO `gee_billing` VALUES (166, 'tta3rcbd', '2020040711142565759', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 4689.53, 0.00, NULL, '0', '', '0', '2', '0', 1586229265, 1586229265);
INSERT INTO `gee_billing` VALUES (167, 'b198suat', '2020040701160165093', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 4679.53, 0.00, NULL, '0', '', '1', '1', '1', 1586236561, 1586236587);
INSERT INTO `gee_billing` VALUES (168, 'bhz4o5n9', '2020040701295927484', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 4679.53, 0.00, NULL, '0', '', '0', '2', '0', 1586237399, 1586237399);
INSERT INTO `gee_billing` VALUES (169, '0ucv0565', '2020040701591393622', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4669.53, 0.00, NULL, '0', '', '0', '2', '0', 1586239153, 1586239153);
INSERT INTO `gee_billing` VALUES (170, 'ek53gbuu', '2020040810231192030', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"test\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\\u6d4b\\u8bd5\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"123456\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 4667.53, 0.00, NULL, '0', '', '1', '1', '1', 1586312591, 1586312598);
INSERT INTO `gee_billing` VALUES (171, 'ndh3xgv6', '2020041302410121586', '[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u6d4b\\u8bd5\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u6d4b\\u8bd5\\u865a\\u62df\\u4e3b\\u673a\",\"years\":\"1\",\"month\":\"1\",\"price\":\"2.00\"}]', 25, NULL, '0', 'create', 2.00, NULL, NULL, NULL, 4667.53, 0.00, NULL, '0', '', '0', '2', '0', 1586760061, 1586760061);
INSERT INTO `gee_billing` VALUES (172, 'x55ttnte', '2020041604053711406', '[{\"group\":\"\\u6d4b\\u8bd5\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"TEST-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u6d4b\\u8bd5\\u670d\\u52a1\\u5668\",\"years\":\"1\",\"price\":\"1417.01\",\"pro_type\":\"server\",\"group_id\":15,\"pro_id\":\"25\",\"hostname\":\"test001\",\"added\":\"{\\\"CC\\\":18,\\\"ddosfree\\\":19,\\\"ddospro\\\":21,\\\"ip\\\":30,\\\"bandwidth\\\":36,\\\"memory\\\":38,\\\"HDD1\\\":44,\\\"HDD2\\\":46,\\\"cn2\\\":53,\\\"dk\\\":54}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"4\",\"ostype\":\"9\",\"username\":\"root\",\"password\":\"123456\"}]', 25, NULL, '0', 'create', 1417.01, NULL, NULL, NULL, 416.50, 0.00, NULL, '0', '', '1', '1', '1', 1587024337, 1587024462);
INSERT INTO `gee_billing` VALUES (173, 'dear5xr0', '2020041604184710778', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"testqqq\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"123123\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 415.50, 0.00, NULL, '0', '', '1', '1', '1', 1587025127, 1587025133);
INSERT INTO `gee_billing` VALUES (174, '72e7a8d0', '2020042004330162251', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"renew\",\"id\":\"19\",\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"5\",\"price\":\"5.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"obxvnaq0\",\"added\":\"{\\\"HDD2\\\":null,\\\"cn2\\\":null}\",\"remake\":\"undefined\",\"user_id\":25,\"osgroup\":\"undefined\",\"ostype\":\"undefined\",\"username\":\"undefined\",\"password\":\"undefined\"}]', 25, NULL, '0', 'renew', 5.00, NULL, NULL, NULL, 410.50, 0.00, NULL, '0', '', '1', '1', '1', 1587371581, 1587371586);
INSERT INTO `gee_billing` VALUES (175, '5r7voo0k', '2020042005050424187', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"renew\",\"id\":\"20\",\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"5\",\"price\":\"5.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"1qpa87s7\",\"added\":\"{\\\"HDD2\\\":null,\\\"cn2\\\":null}\",\"remake\":\"undefined\",\"user_id\":25,\"osgroup\":\"undefined\",\"ostype\":\"undefined\",\"username\":\"undefined\",\"password\":\"undefined\"}]', 25, NULL, '0', 'renew', 5.00, NULL, NULL, NULL, 395.50, 0.00, NULL, '0', '', '1', '1', '1', 1587373504, 1587373525);
INSERT INTO `gee_billing` VALUES (190, 'xgaf0e2a', '2020042003284469065', '[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"12\",\"month\":\"12\",\"price\":\"11.00\"}]', 25, NULL, '0', 'create', 11.00, NULL, NULL, NULL, 384.50, 0.00, NULL, '0', NULL, '2', '2', '0', 1587367724, 1587367724);
INSERT INTO `gee_billing` VALUES (191, '8o5hsq5g', '2020042401355193074', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"36\",\"price\":\"100.00\"}]', 25, NULL, '0', 'renew', 100.00, NULL, NULL, NULL, 3295.50, 0.00, NULL, '0', '', '1', '1', '1', 1587706551, 1587706564);
INSERT INTO `gee_billing` VALUES (192, '4fpobqup', '2020050702250623823', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"26coxa6h\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"2\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 13292.50, 0.00, NULL, '0', '', '1', '1', '1', 1588832706, 1588834347);
INSERT INTO `gee_billing` VALUES (193, 'k0qpatd4', '2020050703141667723', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"ga0vz5cy\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 13288.50, 0.00, NULL, '0', '', '1', '1', '1', 1588835656, 1588837524);
INSERT INTO `gee_billing` VALUES (194, '41c4dsh3', '2020050703464618984', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"6hzxn6du\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 13280.50, 0.00, NULL, '0', '', '1', '1', '1', 1588837606, 1588841651);
INSERT INTO `gee_billing` VALUES (195, '42r5abqo', '2020050704365951166', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"36\",\"price\":\"64.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"xg808zop\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":31,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 31, NULL, '0', 'create', 64.00, NULL, NULL, NULL, 20.00, 0.00, NULL, '0', '', '0', '2', '0', 1588840619, 1588840619);
INSERT INTO `gee_billing` VALUES (196, 'osnrhkyq', '2020050704372020308', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"12\",\"price\":\"18.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"th10kh4b\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":31,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 31, NULL, '0', 'create', 18.00, NULL, NULL, NULL, 2.00, 0.00, NULL, '0', '', '1', '1', '1', 1588840640, 1588842133);
INSERT INTO `gee_billing` VALUES (197, 'zyk520n9', '2020050704392841243', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"12\",\"price\":\"18.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"n1orfkeg\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":26,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 26, NULL, '0', 'create', 18.00, NULL, NULL, NULL, 182.00, 0.00, NULL, '0', '', '1', '1', '1', 1588840768, 1588842186);
INSERT INTO `gee_billing` VALUES (198, '8z0cveo8', '2020050705111637873', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"h3ecdu1n\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 13280.50, 0.00, NULL, '0', '', '2', '2', '0', 1588842676, 1588842676);
INSERT INTO `gee_billing` VALUES (199, 'bycoad1f', '2020050809243230156', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"qtk27ft2\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 13278.50, 0.00, NULL, '0', '', '1', '1', '1', 1588901072, 1588918650);
INSERT INTO `gee_billing` VALUES (200, 'n50c227q', '2020050809253893813', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"113.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"66k7v9pb\",\"added\":\"{\\\"HDD2\\\":46,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 113.00, NULL, NULL, NULL, 13166.50, 0.00, NULL, '0', '', '1', '1', '1', 1588901138, 1588920033);
INSERT INTO `gee_billing` VALUES (201, 'o1ypt30a', '2020050809260562969', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"36\",\"price\":\"25264.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"teeb6x0b\",\"added\":\"{\\\"HDD2\\\":51,\\\"cn2\\\":53}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 25264.00, NULL, NULL, NULL, 13280.50, 0.00, NULL, '0', '', '2', '2', '0', 1588901165, 1588901165);
INSERT INTO `gee_billing` VALUES (202, 'f2q3eda4', '2020050803030137164', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"tpuny5v6\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":26,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 26, NULL, '0', 'create', 1.00, NULL, NULL, NULL, 182.00, 0.00, NULL, '0', '', '0', '2', '0', 1588921381, 1588921381);
INSERT INTO `gee_billing` VALUES (203, 'o2brku1f', '2020050804443842373', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"renew\",\"id\":\"43\",\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"c7es4zae\",\"added\":\"{\\\"HDD2\\\":null,\\\"cn2\\\":null}\",\"remake\":\"undefined\",\"user_id\":25,\"osgroup\":\"undefined\",\"ostype\":\"undefined\",\"username\":\"undefined\",\"password\":\"undefined\"}]', 25, 31, '0', 'renew', 1.00, NULL, NULL, NULL, 13185.00, 0.00, NULL, '0', '', '1', '1', '1', 1588927478, 1588930549);
INSERT INTO `gee_billing` VALUES (204, '4t59xux7', '2020050911514085029', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"7ed1sy3u\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 1.00, 25, 0.50, 13185.00, 0.00, NULL, '0', '', '1', '1', '1', 1588996300, 1588996311);
INSERT INTO `gee_billing` VALUES (205, 'tca19rqc', '2020051109290945969', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"36\",\"price\":\"64.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"xcafuskx\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":26,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 26, NULL, '0', 'create', 64.00, 0.00, 25, 32.00, 118.00, 0.00, NULL, '0', '', '1', '1', '1', 1589160549, 1589160557);
INSERT INTO `gee_billing` VALUES (206, 'cfzperdg', '2020051109322838952', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"36\",\"price\":\"64.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"0fkx9o47\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":26,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 26, NULL, '0', 'create', 64.00, 0.00, 25, 32.00, 54.00, 0.00, NULL, '0', '', '1', '1', '1', 1589160748, 1589160754);
INSERT INTO `gee_billing` VALUES (207, 'ur92zzcv', '2020051109500719412', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"36\",\"price\":\"64.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"cnr0bbos\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":26,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 26, 25, '0', 'create', 64.00, 30.00, 25, 32.00, 13122.00, 0.00, NULL, '0', '', '1', '1', '1', 1589161807, 1589161920);
INSERT INTO `gee_billing` VALUES (208, '4b06qfgp', '2020051405585039912', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:yukatoo.com\",\"num\":1,\"years\":12,\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, NULL, NULL, NULL, 13186.00, 0.00, NULL, '0', '', '0', '2', '0', 1589450330, 1589450330);
INSERT INTO `gee_billing` VALUES (209, 'envv35dv', '2020051502275049290', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, NULL, NULL, NULL, 13186.00, 0.00, NULL, '0', '', '0', '2', '0', 1589524070, 1589524070);
INSERT INTO `gee_billing` VALUES (210, '34837hsq', '2020051502275063391', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, NULL, NULL, NULL, 13186.00, 0.00, NULL, '0', '', '0', '2', '0', 1589524070, 1589524070);
INSERT INTO `gee_billing` VALUES (211, '798g7xxb', '2020051502275314108', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, NULL, NULL, NULL, 13186.00, 0.00, NULL, '0', '', '0', '2', '0', 1589524073, 1589524073);
INSERT INTO `gee_billing` VALUES (212, 'zf49ynpb', '2020051502354377686', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, NULL, NULL, NULL, 13186.00, 0.00, NULL, '0', '', '0', '2', '0', 1589524543, 1589524543);
INSERT INTO `gee_billing` VALUES (213, 'e61ro1vf', '2020051502385957514', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, 0.00, 25, 0.00, 13141.50, 0.00, NULL, '0', '', '1', '1', '1', 1589524739, 1589524747);
INSERT INTO `gee_billing` VALUES (214, 'to1953ud', '2020051502393411084', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, 0.00, 25, 0.00, 13119.50, 0.00, NULL, '0', '', '1', '1', '1', 1589524774, 1589524781);
INSERT INTO `gee_billing` VALUES (215, '495nn3vd', '2020051502400645720', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 25, NULL, '0', 'create', 22.00, 0.00, 25, 0.00, 13097.50, 0.00, NULL, '0', '', '1', '1', '1', 1589524806, 1589524812);
INSERT INTO `gee_billing` VALUES (216, 'cbnupn4t', '2020051811115237251', '[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"pro_type\":\"cdn\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 26, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 53.99, 0.00, NULL, '0', '', '1', '1', '1', 1589771512, 1589771544);
INSERT INTO `gee_billing` VALUES (217, 'a9xz83b8', '2020051811145049170', '[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"pro_type\":\"cdn\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 26, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 53.98, 0.00, NULL, '0', '', '1', '1', '1', 1589771690, 1589771696);
INSERT INTO `gee_billing` VALUES (218, 'vvxeqbxn', '2020051811212925659', '[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"pro_type\":\"cdn\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 26, NULL, '0', 'create', 0.01, NULL, NULL, NULL, 53.98, 0.00, NULL, '0', '', '0', '2', '0', 1589772089, 1589772089);
INSERT INTO `gee_billing` VALUES (219, 'k400o98a', '2020051811425143919', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"renew\",\"id\":\"47\",\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"9yztgfvt\",\"added\":\"{\\\"HDD2\\\":null,\\\"cn2\\\":null}\",\"remake\":\"undefined\",\"user_id\":26,\"osgroup\":\"undefined\",\"ostype\":\"undefined\",\"username\":\"undefined\",\"password\":\"undefined\"}]', 26, NULL, '0', 'renew', 1.00, 0.00, 25, 0.50, 52.98, 0.00, NULL, '0', '', '1', '1', '1', 1589773371, 1589773376);
INSERT INTO `gee_billing` VALUES (220, '14a10h8p', '2020051801501771177', '[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"pro_type\":\"cdn\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.01, 25, 0.00, 13097.49, 0.00, NULL, '0', '', '1', '1', '1', 1589781017, 1589781101);
INSERT INTO `gee_billing` VALUES (246, '4sg09bgp', '2020060104231738562', '[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"update\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"undefined\",\"month\":\"undefined\",\"price\":\"4.00\"}]', 25, NULL, '0', 'update', 4.00, 0.00, 25, 0.00, 12889.97, 0.00, NULL, '0', '', '1', '1', '1', 1590999797, 1591000062);
INSERT INTO `gee_billing` VALUES (222, '8812sxnu', '2020051905513798194', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"2rvdou5f\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 0.00, 25, 0.50, 13074.97, 0.00, NULL, '0', '', '1', '1', '1', 1589881897, 1589881930);
INSERT INTO `gee_billing` VALUES (223, 'vv84e1nu', '2020052001181068092', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528-\\u9999\\u6e2f\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"Starter-E3-1230 V2\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"E3-1230 V2 4\\u6838\\u5fc38\\u7ebf\\u7a0b|\\n16GB DDR3 ECC\\u5185\\u5b58|\\n1000G Enterprise HDD\\u786c\\u76d8|\\n\\/29\\uff0c5\\u4e2a\\u53ef\\u7528IP|\\n100Mbps\\u5e26\\u5bbd 30M CN2\\u56de\\u56fd|\\n\\u514d\\u8d3910GbpsDDOS\\u9632\\u62a4\\n\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":13,\"pro_id\":\"22\",\"hostname\":\"q4bno83k\",\"added\":\"{\\\"HDD2\\\":0,\\\"cn2\\\":0}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 0.50, 25, 0.50, 13073.97, 0.00, NULL, '0', '', '1', '1', '1', 1589951890, 1589954587);
INSERT INTO `gee_billing` VALUES (224, 'p4qqhatc', '2020052105271776294', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"pro_type\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"2\",\"month\":\"2\",\"price\":\"44.00\"}]', 39, NULL, '0', 'create', 44.00, NULL, NULL, NULL, 0.00, 0.00, NULL, '0', '', '0', '2', '0', 1590053237, 1590053237);
INSERT INTO `gee_billing` VALUES (225, 'xdh153oh', '2020052105294489116', '[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"pro_type\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]', 39, NULL, '0', 'create', 22.00, NULL, NULL, NULL, 0.00, 0.00, NULL, '0', '', '0', '2', '0', 1590053384, 1590053384);
INSERT INTO `gee_billing` VALUES (226, '8ur8dsgq', '2020052510485934192', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"20\",\"pro_type\":\"vps\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, 0.50, 25, 10.00, 13064.47, 0.00, NULL, '0', '', '1', '1', '1', 1590374939, 1590374968);
INSERT INTO `gee_billing` VALUES (227, '7h254zqe', '2020052601125451622', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"32\",\"pro_type\":\"vps\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]', 25, NULL, '0', 'create', 1.00, 1.00, 25, 1.00, 13063.97, 0.00, NULL, '0', '', '1', '1', '1', 1590469974, 1590469983);
INSERT INTO `gee_billing` VALUES (260, '5yoqzr79', '2020061504314667739', '[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]', 25, NULL, '0', 'create', 4.00, NULL, NULL, NULL, 12889.95, 0.00, NULL, '0', '', '0', '2', '0', 1592209906, 1592209906);
INSERT INTO `gee_billing` VALUES (261, '0bhua8np', '2020081010463815871', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"b5v3g88b\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"123546\"}]', 25, NULL, '0', 'create', 1.00, 0.00, 25, 0.00, 12888.95, 1.00, NULL, '1', '', '0', '1', '1', 1597027598, 1597028063);
INSERT INTO `gee_billing` VALUES (262, '4e7ez40p', '2020081102114254950', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"envt9ov5\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 0.00, 25, 0.00, 12888.95, 0.00, NULL, '1', '', '0', '1', '1', 1597126302, 1597127671);
INSERT INTO `gee_billing` VALUES (263, '3e2c19hv', '2020081102344469110', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"hxhqteba\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 0.00, 25, 0.00, 12888.95, 1.00, NULL, '1', '', '0', '1', '1', 1597127684, 1597140563);
INSERT INTO `gee_billing` VALUES (264, 'ecfuxxo8', '2020081106133044686', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"1xa97oqd\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 0.00, 25, 0.00, 12888.95, 0.00, NULL, '1', '', '0', '1', '1', 1597140810, 1597140845);
INSERT INTO `gee_billing` VALUES (265, 'tdsynu7q', '2020081201542877839', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597211670, 1597211670);
INSERT INTO `gee_billing` VALUES (266, '3cn558ot', '2020081201544960964', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597211689, 1597211689);
INSERT INTO `gee_billing` VALUES (267, 'a2z59ru1', '2020081201581310216', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597211893, 1597211893);
INSERT INTO `gee_billing` VALUES (268, '43hgdve6', '2020081201585760442', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597211937, 1597211937);
INSERT INTO `gee_billing` VALUES (253, '3unax098', '2020061010474691106', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"test1111\",\"added\":\"{}\",\"remake\":\"123\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12889.96, 1.00, '6', '0', '', '1', '1', '1', 1591757266, 1591854998);
INSERT INTO `gee_billing` VALUES (243, 'kbzsq7dd', '2020060109405825756', '[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]', 25, NULL, '0', 'create', 4.00, 0.00, 25, 0.00, 12901.97, 0.00, NULL, '0', '', '1', '1', '1', 1590975658, 1590975826);
INSERT INTO `gee_billing` VALUES (244, '5k1kyqv0', '2020060110270990778', '[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]', 25, NULL, '0', 'create', 4.00, 0.00, 25, 0.00, 12897.97, 0.00, NULL, '0', '', '1', '1', '1', 1590978429, 1590978436);
INSERT INTO `gee_billing` VALUES (245, '2r0f25p4', '2020060110463067638', '[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]', 25, NULL, '0', 'renew', 4.00, 0.00, 25, 0.00, 12893.97, 0.00, NULL, '0', '', '1', '1', '1', 1590979590, 1590979712);
INSERT INTO `gee_billing` VALUES (254, 'xu8qf88h', '2020061109362121514', '[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"3\",\"pro_type\":\"vps\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]', 25, NULL, '0', 'create', 49.00, NULL, NULL, NULL, 12889.97, 0.00, '6', '0', '', '0', '2', '0', 1591839381, 1591839381);
INSERT INTO `gee_billing` VALUES (255, 'z8ux840c', '2020061112323241261', '[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"20\",\"pro_type\":\"vps\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]', 25, NULL, '0', 'create', 10.00, NULL, NULL, NULL, 12889.97, 0.00, '6', '0', '', '0', '2', '0', 1591849952, 1591849952);
INSERT INTO `gee_billing` VALUES (269, '1reradaq', '2020081201590963493', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597211950, 1597211950);
INSERT INTO `gee_billing` VALUES (270, 'd5axz44a', '2020081202072085576', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597212440, 1597212440);
INSERT INTO `gee_billing` VALUES (271, 'doqckekv', '2020081202125551036', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597212775, 1597212775);
INSERT INTO `gee_billing` VALUES (272, 'tsxh6z96', '2020081202133138200', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597212811, 1597212811);
INSERT INTO `gee_billing` VALUES (273, '859obqef', '2020081202291217082', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597213752, 1597213752);
INSERT INTO `gee_billing` VALUES (274, '0euergq4', '2020081202333264606', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597214012, 1597214012);
INSERT INTO `gee_billing` VALUES (275, 'byu7oogt', '2020081202395419201', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597214394, 1597214394);
INSERT INTO `gee_billing` VALUES (276, 'cryeqbgp', '2020081202401684942', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597214416, 1597214416);
INSERT INTO `gee_billing` VALUES (258, 'qya149nd', '2020061102035971395', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"99s3r4d0\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12889.95, 0.00, '6', '0', '', '1', '1', '1', 1591855439, 1591855776);
INSERT INTO `gee_billing` VALUES (277, 'y72yuhog', '2020081202514489576', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597215104, 1597215104);
INSERT INTO `gee_billing` VALUES (278, 'f2z4n6he', '2020081204043640789', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597219476, 1597219476);
INSERT INTO `gee_billing` VALUES (279, '24bgasxb', '2020081205260966484', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597224369, 1597224369);
INSERT INTO `gee_billing` VALUES (280, 'yuf4yzk2', '2020081205263824805', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597224398, 1597224398);
INSERT INTO `gee_billing` VALUES (281, '3ava3o59', '2020081205265890076', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597224418, 1597224418);
INSERT INTO `gee_billing` VALUES (282, '64qxtxgf', '2020081205272527859', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597224446, 1597224446);
INSERT INTO `gee_billing` VALUES (283, 'pun4u1c9', '2020081205331663073', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597224796, 1597224796);
INSERT INTO `gee_billing` VALUES (284, 'ckdfn894', '2020081205345272811', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597224892, 1597224892);
INSERT INTO `gee_billing` VALUES (285, 'y2g60d1d', '2020081205495530669', '0', 25, NULL, '1', '0', 0.01, NULL, NULL, NULL, 12889.94, NULL, NULL, '1', '账户充值 - 金额为:0.01', '0', '0', '1', 1597225795, 1597225795);
INSERT INTO `gee_billing` VALUES (286, 'zb972nba', '2020081303592675142', '[{\"group\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668-\\u5bbf\\u8fc1\",\"class\":\"\\u7269\\u7406\\u670d\\u52a1\\u5668\\u79df\\u7528\",\"name\":\"\\u6d4b\\u8bd5\",\"type\":\"create\",\"id\":0,\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\",\"years\":\"1\",\"price\":\"1.00\",\"pro_type\":\"server\",\"group_id\":14,\"pro_id\":\"39\",\"hostname\":\"oe424ptd\",\"added\":\"{}\",\"remake\":\"\",\"user_id\":25,\"osgroup\":\"1\",\"ostype\":\"1\",\"username\":\"root\",\"password\":\"\"}]', 25, NULL, '0', 'create', 1.00, 0.00, 25, 0.00, 12888.95, 0.00, NULL, '0', '', '1', '1', '1', 1597305566, 1597305575);
INSERT INTO `gee_billing` VALUES (287, 'yc8gob2e', '2020081909223637364', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, NULL, NULL, NULL, 12888.95, 0.00, NULL, '0', '', '0', '2', '0', 1597800156, 1597800156);
INSERT INTO `gee_billing` VALUES (288, 'yag2hyaz', '2020081903132948574', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.40, 0.00, NULL, '0', '', '1', '1', '1', 1597821209, 1597902407);
INSERT INTO `gee_billing` VALUES (289, '26cpacf7', '2020081903230660916', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.53, 0.00, NULL, '0', '', '1', '1', '1', 1597821786, 1597895841);
INSERT INTO `gee_billing` VALUES (290, 'cu275xeq', '2020082011582592510', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.52, 0.00, NULL, '0', '', '1', '1', '1', 1597895905, 1597895916);
INSERT INTO `gee_billing` VALUES (291, 'tfnbdrcv', '2020082012004358385', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.51, 0.00, NULL, '0', '', '1', '1', '1', 1597896044, 1597896053);
INSERT INTO `gee_billing` VALUES (292, '39sectz7', '2020082001090796133', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.42, 0.00, NULL, '0', '', '1', '1', '1', 1597900147, 1597902249);
INSERT INTO `gee_billing` VALUES (293, 'c57gyuz3', '2020082002283967867', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.39, 0.00, NULL, '0', '', '1', '1', '1', 1597904919, 1597904931);
INSERT INTO `gee_billing` VALUES (294, 'egx4nz8k', '2020082002350982305', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.38, 0.00, NULL, '0', '', '1', '1', '1', 1597905309, 1597905319);
INSERT INTO `gee_billing` VALUES (295, '5z8nz4hg', '2020082005005428950', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'create', 0.01, 0.00, 25, 0.00, 12888.37, 0.00, NULL, '0', '', '1', '1', '1', 1597914054, 1597914069);
INSERT INTO `gee_billing` VALUES (296, 'x2yssdx2', '2020082109560399612', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'renew', 0.01, 0.00, 25, 0.00, 12888.26, 0.00, NULL, '0', '', '1', '1', '1', 1597974963, 1597991618);
INSERT INTO `gee_billing` VALUES (297, 'n3k6xaq8', '2020082105434917422', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'renew', 0.01, 0.00, 25, 0.00, 12888.25, 0.00, NULL, '0', '', '1', '1', '1', 1598003029, 1598003038);
INSERT INTO `gee_billing` VALUES (298, 'que4c0pa', '2020082106033581553', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'renew', 0.01, 0.00, 25, 0.00, 12888.24, 0.00, NULL, '0', '', '1', '1', '1', 1598004215, 1598004239);
INSERT INTO `gee_billing` VALUES (299, '52hyx4r5', '2020082201543239763', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'renew', 0.01, 0.00, 25, 0.00, 12888.23, 0.00, NULL, '0', '', '1', '1', '1', 1598075672, 1598075682);
INSERT INTO `gee_billing` VALUES (300, '7ocfge6d', '2020082202280525106', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'renew', 0.01, NULL, NULL, NULL, 12888.23, 0.00, NULL, '0', '', '0', '2', '0', 1598077685, 1598077685);
INSERT INTO `gee_billing` VALUES (301, 'ctgt2yz2', '2020082203441995967', '[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]', 25, NULL, '0', 'renew', 0.01, NULL, NULL, NULL, 12888.22, 0.00, NULL, '0', '', '0', '2', '0', 1598082259, 1598082259);
INSERT INTO `gee_billing` VALUES (302, 'c5d41ohs', '2020082705173892666', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:kslei212.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]', 25, 25, '0', 'create', 222.00, NULL, NULL, NULL, 12888.21, 0.00, NULL, '0', '', '0', '2', '0', 1598519858, 1598520792);
INSERT INTO `gee_billing` VALUES (303, 'cne5zq8b', '2020082705421229839', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"pro_type\":\"domain\",\"num\":1,\"years\":12,\"price\":\"1.00\"}]', 25, NULL, '0', 'renew', 1.00, NULL, NULL, NULL, 12888.21, 0.00, NULL, '0', '', '0', '2', '0', 1598521332, 1598521332);
INSERT INTO `gee_billing` VALUES (304, 'vc4kk53z', '2020082705433236642', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"pro_type\":\"domain\",\"num\":1,\"years\":12,\"price\":\"1.00\"}]', 25, NULL, '0', 'renew', 1.00, NULL, NULL, NULL, 12888.21, 0.00, NULL, '0', '', '0', '2', '0', 1598521412, 1598521412);
INSERT INTO `gee_billing` VALUES (305, 'qov6va96', '2020082705585492207', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:hdhdge2.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]', 25, NULL, '0', 'create', 222.00, NULL, NULL, NULL, 12888.21, 0.00, NULL, '0', '', '0', '2', '0', 1598522334, 1598522334);
INSERT INTO `gee_billing` VALUES (306, 's8dttchn', '2020082803015953596', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"pro_type\":\"domain\",\"num\":1,\"years\":12,\"price\":\"1.00\"}]', 25, NULL, '0', 'renew', 1.00, NULL, NULL, NULL, 12888.21, 0.00, NULL, '0', '', '0', '2', '0', 1598598119, 1598598119);
INSERT INTO `gee_billing` VALUES (307, 'tdu2a0or', '2020082804504881064', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsfefsfsf.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]', 25, NULL, '0', 'create', 222.00, NULL, NULL, NULL, 10843.21, 0.00, NULL, '0', '', '0', '2', '0', 1598604648, 1598604648);
INSERT INTO `gee_billing` VALUES (308, 'hoppa07c', '2020082804563273249', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsfefsfsf.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]', 25, NULL, '0', 'create', 222.00, NULL, NULL, NULL, 10621.21, 0.00, NULL, '0', '', '0', '2', '0', 1598604992, 1598604992);
INSERT INTO `gee_billing` VALUES (309, 'a5znspk3', '2020082806070722100', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsfefsfsf.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]', 25, NULL, '0', 'create', 222.00, NULL, NULL, NULL, 8623.21, 0.00, NULL, '0', '', '0', '2', '0', 1598609227, 1598609227);
INSERT INTO `gee_billing` VALUES (310, '9fknf2us', '2020082806092736676', '[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsfefsfsf.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]', 25, NULL, '0', 'create', 222.00, NULL, NULL, NULL, 8401.21, 0.00, NULL, '0', '', '0', '2', '0', 1598609367, 1598609367);

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
-- Records of gee_cdn
-- ----------------------------
INSERT INTO `gee_cdn` VALUES (43, 25, 38, 'cdn_easypanel', 'easypanelcdn', NULL, 53, '正常', 1589781101, 1589781101, 1592459501);

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
-- Records of gee_cdn_easypanel
-- ----------------------------
INSERT INTO `gee_cdn_easypanel` VALUES (53, 25, 38, 'sfpotezebif_25', 'vQNLeu#l', '创建网站', '', NULL, '已过期', 1589781101, 1589781101, 1592459501);

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
-- Records of gee_cloudserver
-- ----------------------------
INSERT INTO `gee_cloudserver` VALUES (5, 25, 28, 'nokvm', 28, 94, 'ecs-rRK', 'instance-56dsbb9x', 2, 7, 28, 1, 7, '-', '50', '1', '156.227.53.253', '10.0.73.25', 'q123123!', '0', 1582204557, 1582204557, 1584710138);
INSERT INTO `gee_cloudserver` VALUES (6, 25, 28, 'nokvm', 28, 96, 'ecs-jar', 'instance-pebb6cvg', 2, 7, 28, 1, 7, '-', '50', '1', '156.227.53.209', '10.0.88.150', 'q123123!', '0', 1582274411, 1582274411, 1584779997);
INSERT INTO `gee_cloudserver` VALUES (7, 25, 28, 'nokvm', 28, 97, 'ecs-wTv', 'instance-ec0dfbax', 2, 7, 28, 1, 7, '-', '50', '1', '156.227.53.246', '10.0.102.106', 'qdca@123', '0', 1582283841, 1582545451, 1585050886);

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
-- Records of gee_coupon
-- ----------------------------
INSERT INTO `gee_coupon` VALUES (10, 'GNO12578', 1, '0', 1, 0, 1, 1, 0, 0, 1592205010, 1592205010, 1592291410);
INSERT INTO `gee_coupon` VALUES (8, 'ABEGIPT8', 1, 'server', 1, 0, 1, 100, 25, 0, 1591686049, 1591767519, 1591863015);
INSERT INTO `gee_coupon` VALUES (9, 'ABDIJOR1', 1, '0', 1, 0, 1, 1, 0, 0, 1591868355, 1591868355, 1591954755);
INSERT INTO `gee_coupon` VALUES (6, 'BDOPQRWX', 2, '0', 1, 1, 1, 1, 25, 2, 1591680193, 1591855322, 1593583322);

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
-- Records of gee_dns
-- ----------------------------
INSERT INTO `gee_dns` VALUES (7, 25, 53, 'dns_dnspod', 'dnspod', 0, 8, '正常', 1587462998, 1587462998, NULL);
INSERT INTO `gee_dns` VALUES (8, 25, 53, 'dns_dnspod', 'dnspod', 0, 9, '正常', 1587609350, 1587609350, NULL);

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
-- Records of gee_dns_dnspod
-- ----------------------------
INSERT INTO `gee_dns_dnspod` VALUES (8, 25, 53, 83141847, 'heelo.com', NULL, 'DNS设置错误', 1587462998, 1587608266, NULL);
INSERT INTO `gee_dns_dnspod` VALUES (9, 25, 53, 83160257, 'geecp.com', NULL, 'DNS设置错误', 1587609350, 1587609362, NULL);

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
-- Records of gee_dns_recordlist
-- ----------------------------
INSERT INTO `gee_dns_recordlist` VALUES (8, 25, NULL, 53, 8, 'fsfs', 'A', NULL, 0, '120.22.123', '正常', 0, 300, 1587518944, 1587518944, NULL);
INSERT INTO `gee_dns_recordlist` VALUES (9, 25, NULL, 53, 8, 'gsg', 'AAAA', NULL, 0, '22.11.22.11', '正常', 0, 300, 1587518990, 1587518990, NULL);
INSERT INTO `gee_dns_recordlist` VALUES (10, 25, 16894439, 53, 8, 'sfs', 'A', NULL, 0, '22.11.22.11', '正常', 0, 600, 1587543284, 1587543284, NULL);
INSERT INTO `gee_dns_recordlist` VALUES (19, 25, NULL, 53, 8, 'dgg', 'A', NULL, 0, '23.123.213.2', NULL, 0, 300, 1587561704, 1587561704, NULL);

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
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '所使用产品ID',
  `domaintype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名状态 具体看美橙文档',
  `newstas` int(11) NULL DEFAULT NULL COMMENT '域名隐私保护 0:关闭 1:开启',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `end_time` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_domain
-- ----------------------------
INSERT INTO `gee_domain` VALUES (1, 25, 'wx118.top', NULL, NULL, NULL, '{\"dns1\":{\"host\":null,\"ip\":null},\"dns2\":{\"host\":null,\"ip\":null},\"dns3\":{\"host\":null,\"ip\":null},\"dns4\":{\"host\":null,\"ip\":null},\"dns5\":{\"host\":null,\"ip\":null},\"dns6\":{\"host\":null,\"ip\":null}}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1553653692, 1553653692, 0);

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
-- Records of gee_domain_contact
-- ----------------------------
INSERT INTO `gee_domain_contact` VALUES (23, 'Zhan Xiao Song', 'Zhan', 'Xiao Song', 'CN', 'An Hui Sheng', 'Su Zhou Shi', 'Yong Qiao Qu Shou Gang Shou Yu 10Dong 1Dan Yuan 803Shi', '詹孝松', '詹', '孝松', '中国', '安徽省', '宿州市', '埇桥区首钢首御10栋1单元803室', '200000', '+86.13789398868', '+86.13789398868', '975827527@qq.com', 'I', 'SFZ', '430405199707121012', 1, '1', '{\"cndns\":{\"pro_id\":26,\"value\":\"11036540\"}}', 25, 1577780137, 1577780137);
INSERT INTO `gee_domain_contact` VALUES (24, 'Zhan Xiao Song', 'Zhan', 'Xiao Song', 'CN', 'An Hui Sheng', 'Su Zhou Shi', 'Yong Qiao Qu Shou Gang Shou Yu 10Dong 1Dan Yuan 803Shi', '詹孝松', '詹', '孝松', '中国', '安徽省', '宿州市', '埇桥区首钢首御10栋1单元803室', '200003', '+86.13789398868', '+86.13789398868', '975827527@qq.com', 'I', 'SFZ', '430405199707121012', 1, '1', '{\"cndns\":{\"pro_id\":26,\"value\":\"11036570\"}}', 25, 1577780250, 1577780250);
INSERT INTO `gee_domain_contact` VALUES (25, 'Fu Tao', 'Fu', 'Tao', 'CN', 'An Hui Sheng', 'Su Zhou Shi', 'Su Zhou Shi Yong Qiao Qu Gao Xin Qu Yun Ji Suan Ji Di AZuo 3Lou', '付涛', '付', '涛', '中国', '安徽省', '宿州市', '宿州市埇桥区高新区云计算基地A座3楼', '234300', '+86.13816141440', '+86.13816141440', 'domain@qiduo.net', 'I', NULL, NULL, 1, '1', '{\"cndns\":{\"pro_id\":26,\"value\":\"10212940\"}}', 25, 1577780250, 1577780250);
INSERT INTO `gee_domain_contact` VALUES (26, 'z qwe', 'z', 'qwe', 'CN', 'Shang Hai', 'Yang Pu Qu', 'Yang Pu Qu 222', 'zqwe', 'z', 'qwe', '中国', '上海', '杨浦区', '杨浦区222', '000000', '+86.13777777777', '+86.13777777777', '97582755@qq.com', 'I', 'SFZ', '430405119707121011', 2, '1', '{\"cndns\":{\"pro_id\":26,\"value\":\"11150680\"}}', 25, 1587019012, 1587019012);

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
  `is_default` tinyint(1) NULL DEFAULT 1 COMMENT '1:默认,0:不默认',
  `pro_id` int(11) NULL DEFAULT NULL COMMENT '所使用产品ID',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_domain_price
-- ----------------------------
INSERT INTO `gee_domain_price` VALUES (1, '.com', 1.00, 0.01, 1.00, 1.00, 0.01, 0.02, 0.03, 0.04, 0.05, 0.10, 'HOT', '网络服务首选经典域名,新用户25元', 1, 26, 1577090913, 1577090913);
INSERT INTO `gee_domain_price` VALUES (2, '.top', 1.00, 0.01, 1.00, 1.00, 0.01, 0.02, 0.03, 0.04, 0.05, 0.10, 'HOT', '巅峰，顶级', 1, 44, 1577091212, 1577091212);
INSERT INTO `gee_domain_price` VALUES (3, '.cn', 1.00, 0.01, 1.00, 1.00, 1.00, 2.00, 3.00, 4.00, 7.00, 10.00, 'HOT', '测试描述1', 1, 26, 1577251874, 1577251874);
INSERT INTO `gee_domain_price` VALUES (4, '.xyz', 10.00, 8.00, 10.00, 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'HOT', '火爆、好记、有创意', 1, 26, 1577426862, 1577426862);
INSERT INTO `gee_domain_price` VALUES (5, '.net', 80.00, 40.00, 80.00, 80.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'HOT', '网络服务首选经典域名', 1, 26, 1577426914, 1577426914);
INSERT INTO `gee_domain_price` VALUES (6, '.com.cn', 30.00, 30.00, 30.00, 30.00, 30.00, 60.00, 94.00, 120.00, 158.00, 318.00, 'HOT', '中国公司专属域名', 1, 26, 1578389011, 1578389011);
INSERT INTO `gee_domain_price` VALUES (7, '.shop', 188.00, 15.00, 188.00, 188.00, 15.00, 366.00, 391.00, 600.00, 767.00, 1707.00, 'HOT', '网上店铺专属域名', 1, 26, 1578389187, 1578389187);
INSERT INTO `gee_domain_price` VALUES (8, '.vip', 48.00, 25.00, 48.00, 48.00, 48.00, 96.00, 121.00, 160.00, 217.00, 457.00, 'HOT', 'vip专属域名，彰显你的身份', 1, 26, 1578389316, 1578389316);
INSERT INTO `gee_domain_price` VALUES (9, '.site', 33.00, 33.00, 33.00, 333.00, 222.00, 22.00, 888.00, 33.00, 33.00, 33.00, 'HOT', '西部', 1, 44, 1598513671, 1598513671);

-- ----------------------------
-- Table structure for gee_domain_westdomain
-- ----------------------------
DROP TABLE IF EXISTS `gee_domain_westdomain`;
CREATE TABLE `gee_domain_westdomain`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `gee_emailconfig` VALUES (1, 'smtp.qq.com', '465', '975827527@qq.com', 'kjdywnepczxjbeji', 'ssl', '975827527@qq.com', '叶落深秋', 1557975644, 1557991905);

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
-- Records of gee_host
-- ----------------------------
INSERT INTO `gee_host` VALUES (33, 25, 36, 'host_easypanel', 'easypanel', NULL, 43, '正常', 1589524082, 1589524082, 1592202482);
INSERT INTO `gee_host` VALUES (34, 25, 36, 'host_easypanel', 'easypanel', NULL, 44, '正常', 1589524525, 1589524525, 1592202925);
INSERT INTO `gee_host` VALUES (35, 25, 36, 'host_easypanel', 'easypanel', NULL, 45, '正常', 1589524553, 1589524553, 1592202953);
INSERT INTO `gee_host` VALUES (36, 25, 36, 'host_easypanel', 'easypanel', NULL, 46, '正常', 1589524588, 1589524588, 1592202988);
INSERT INTO `gee_host` VALUES (37, 25, 36, 'host_easypanel', 'easypanel', NULL, 47, '正常', 1589524730, 1589524730, 1592203130);
INSERT INTO `gee_host` VALUES (38, 25, 36, 'host_easypanel', 'easypanel', NULL, 48, '正常', 1589524747, 1589524747, 1592203147);
INSERT INTO `gee_host` VALUES (39, 25, 36, 'host_easypanel', 'easypanel', NULL, 49, '正常', 1589524781, 1589524781, 1592203181);
INSERT INTO `gee_host` VALUES (40, 25, 36, 'host_easypanel', 'easypanel', NULL, 50, '正常', 1589524812, 1589524812, 1592203212);
INSERT INTO `gee_host` VALUES (42, 25, 43, 'host_direct', 'direct', NULL, 52, '正常', 1597904931, 1597904931, 1600583331);
INSERT INTO `gee_host` VALUES (43, 25, 43, 'host_direct', 'direct', NULL, 53, '正常', 1597905318, 1597905318, 1600583718);
INSERT INTO `gee_host` VALUES (44, 25, 43, 'host_direct', 'direct', NULL, 54, '已过期', 1597914069, 1598075681, 1595235669);

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
-- Records of gee_host_direct
-- ----------------------------
INSERT INTO `gee_host_direct` VALUES (54, 25, 43, 'jlvhjgtx', 'test123', 'test3.com', '106.12.37.210', 1, '已过期', 1597914069, 1598075681, 1595235669);
INSERT INTO `gee_host_direct` VALUES (52, 25, 43, 'idguwmjq', 'test123', 'test.com', '106.12.37.210', 1, '正常', 1597904931, 1597904931, 1600583331);
INSERT INTO `gee_host_direct` VALUES (53, 25, 43, 'dujgomgm', 'osg1mxxt', 'test1.com', '106.12.37.210', 1, '正常', 1597905318, 1597905318, 1600583718);

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
-- Records of gee_host_easypanel
-- ----------------------------
INSERT INTO `gee_host_easypanel` VALUES (42, 25, 33, 'knosabmzmql_25', '123456789', '创建网站', '', 3, '已过期', 1582880919, 1582880919, 1585386519);
INSERT INTO `gee_host_easypanel` VALUES (43, 25, 36, 'gvilstykujq_25', '0jJ8ut2e', '创建网站', '', NULL, '已过期', 1589524082, 1589524082, 1592202482);
INSERT INTO `gee_host_easypanel` VALUES (44, 25, 36, 'gewahmawede_25', 'udyf8WcZ', '创建网站', '', NULL, '已过期', 1589524525, 1589524525, 1592202925);
INSERT INTO `gee_host_easypanel` VALUES (45, 25, 36, 'asxfcdyxysy_25', 'M9CNv3EQ', '创建网站', '', NULL, '已过期', 1589524553, 1589524553, 1592202953);
INSERT INTO `gee_host_easypanel` VALUES (46, 25, 36, 'pgesxvfzseg_25', 'ogvCL4Mh', '创建网站', '', NULL, '已过期', 1589524588, 1589524588, 1592202988);
INSERT INTO `gee_host_easypanel` VALUES (47, 25, 36, 'bcvltilsypf_25', '#Q46pVEJ', '创建网站', '', NULL, '已过期', 1589524730, 1589524730, 1592203130);
INSERT INTO `gee_host_easypanel` VALUES (48, 25, 36, 'xazwgwhmxgo_25', 'Dt1x*ZL2', '创建网站', '', NULL, '已过期', 1589524747, 1589524747, 1592203147);
INSERT INTO `gee_host_easypanel` VALUES (49, 25, 36, 'wbgrfwsikyr_25', 'xJ3@pYS0', '创建网站', '', NULL, '已过期', 1589524781, 1589524781, 1592203181);
INSERT INTO `gee_host_easypanel` VALUES (50, 25, 36, 'wzzarsjixoe_25', '123456', '创建网站', '', NULL, '已过期', 1589524812, 1589524812, 1592203212);

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
-- Records of gee_invoice
-- ----------------------------
INSERT INTO `gee_invoice` VALUES (1, 25, '', '测试1', 500.00, '', '0', '2', '', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576461956, 1576461956);
INSERT INTO `gee_invoice` VALUES (2, 25, '321', '测试1', 500.00, '', '0', '1', '321', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576461963, 1576461963);
INSERT INTO `gee_invoice` VALUES (3, 25, '1232', '测试1', 500.00, '', '0', '1', '1232', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576462006, 1576462006);
INSERT INTO `gee_invoice` VALUES (4, 25, '1232', '测试1', 500.00, '', '0', '1', '123', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576462038, 1576462038);
INSERT INTO `gee_invoice` VALUES (5, 25, '', '测试1', 500.00, '', '0', '3', '', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576462058, 1576462058);
INSERT INTO `gee_invoice` VALUES (6, 25, '', '测试1', 3000.00, '', '0', '3', '', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576462573, 1576462573);
INSERT INTO `gee_invoice` VALUES (7, 25, '', '测试1', 25960.00, '', '0', '2', '', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', NULL, '13755464455', 1576462605, 1576462605);
INSERT INTO `gee_invoice` VALUES (9, 25, '123456', '测试1', 500.00, '', '0', '1', '321456', '', 0, NULL, NULL, NULL, NULL, NULL, '詹小松', '安徽省宿州市埇桥区', '的机器文件', '000000', '13755464455', 1576477526, 1576477526);

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
-- Records of gee_invoice_addr
-- ----------------------------
INSERT INTO `gee_invoice_addr` VALUES (1, '詹小松', NULL, NULL, NULL, '上海市辖区', '网球和分区无法前往', '000000', '13789398858', 0, 25, 1575525960, 1575525960);
INSERT INTO `gee_invoice_addr` VALUES (2, '詹小松', NULL, NULL, NULL, '安徽省宿州市埇桥区', '的机器文件', '000000', '13755464455', 1, 25, 1575525979, 1575525979);

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
-- Records of gee_invoice_info
-- ----------------------------
INSERT INTO `gee_invoice_info` VALUES (1, 0, 0, '测试1', '', '', '', '', '', 25, 1575445628, 1575445628);

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
) ENGINE = MyISAM AUTO_INCREMENT = 1381 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_log
-- ----------------------------
INSERT INTO `gee_log` VALUES (1372, ' 修改了基本信息 ', '::1', 1598236593, 1598236593);
INSERT INTO `gee_log` VALUES (1371, ' 修改了基本信息 ', '::1', 1598236547, 1598236547);
INSERT INTO `gee_log` VALUES (1370, ' 修改了基本信息 ', '::1', 1598235412, 1598235412);
INSERT INTO `gee_log` VALUES (1369, ' 修改了基本信息 ', '::1', 1598235403, 1598235403);
INSERT INTO `gee_log` VALUES (1368, ' 修改了基本信息 ', '::1', 1598235397, 1598235397);
INSERT INTO `gee_log` VALUES (1367, ' 修改了基本信息 ', '::1', 1598235390, 1598235390);
INSERT INTO `gee_log` VALUES (1366, ' 修改了基本信息 ', '::1', 1598235157, 1598235157);
INSERT INTO `gee_log` VALUES (1365, ' 修改了基本信息 ', '::1', 1598235148, 1598235148);
INSERT INTO `gee_log` VALUES (1364, ' 修改了基本信息 ', '::1', 1598234924, 1598234924);
INSERT INTO `gee_log` VALUES (1363, ' 修改了基本信息 ', '::1', 1598234878, 1598234878);
INSERT INTO `gee_log` VALUES (1362, '超级管理员 登录了，登录IP为：::1', '::1', 1598233685, 1598233685);
INSERT INTO `gee_log` VALUES (1361, '超级管理员 登录了，登录IP为：::1', '::1', 1598082337, 1598082337);
INSERT INTO `gee_log` VALUES (1360, '超级管理员 登录了，登录IP为：::1', '::1', 1597917818, 1597917818);
INSERT INTO `gee_log` VALUES (1359, ' 修改了产品 direct测试产品1', '::1', 1597895709, 1597895709);
INSERT INTO `gee_log` VALUES (1358, ' 修改了产品 direct测试产品1', '::1', 1597895641, 1597895641);
INSERT INTO `gee_log` VALUES (1357, ' 修改了产品 direct测试产品1', '::1', 1597894805, 1597894805);
INSERT INTO `gee_log` VALUES (1356, '超级管理员 登录了，登录IP为：::1', '::1', 1597894781, 1597894781);
INSERT INTO `gee_log` VALUES (1355, ' 修改了产品 direct测试产品1', '::1', 1597890910, 1597890910);
INSERT INTO `gee_log` VALUES (1354, '超级管理员 登录了，登录IP为：::1', '::1', 1597887357, 1597887357);
INSERT INTO `gee_log` VALUES (1353, ' 修改了产品 direct测试产品1', '::1', 1597820616, 1597820616);
INSERT INTO `gee_log` VALUES (1352, ' 修改了产品 direct测试产品1', '::1', 1597818668, 1597818668);
INSERT INTO `gee_log` VALUES (1351, '超级管理员 登录了，登录IP为：::1', '::1', 1597818664, 1597818664);
INSERT INTO `gee_log` VALUES (1350, ' 修改了产品 direct测试产品1', '::1', 1597801771, 1597801771);
INSERT INTO `gee_log` VALUES (1349, '超级管理员 登录了，登录IP为：::1', '::1', 1597800993, 1597800993);
INSERT INTO `gee_log` VALUES (1348, '超级管理员 应用了前台模板 default', '::1', 1597743371, 1597743371);
INSERT INTO `gee_log` VALUES (1347, '超级管理员 登录了，登录IP为：::1', '::1', 1597743361, 1597743361);
INSERT INTO `gee_log` VALUES (1346, ' 修改了产品 direct测试产品1', '::1', 1597740093, 1597740093);
INSERT INTO `gee_log` VALUES (1345, ' 添加了产品 direct测试产品1', '::1', 1597739217, 1597739217);
INSERT INTO `gee_log` VALUES (1344, ' 添加了产品组 direct测试主机分组', '::1', 1597736060, 1597736060);
INSERT INTO `gee_log` VALUES (1343, '超级管理员 登录了，登录IP为：::1', '::1', 1597736016, 1597736016);
INSERT INTO `gee_log` VALUES (1342, '超级管理员 应用了前台模板 crumina', '::1', 1597714781, 1597714781);
INSERT INTO `gee_log` VALUES (1341, '超级管理员 登录了，登录IP为：::1', '::1', 1597714769, 1597714769);
INSERT INTO `gee_log` VALUES (1340, '超级管理员 应用了前台模板 default', '::1', 1597657564, 1597657564);
INSERT INTO `gee_log` VALUES (1339, '超级管理员 应用了前台模板 crumina', '::1', 1597657186, 1597657186);
INSERT INTO `gee_log` VALUES (1338, '超级管理员 登录了，登录IP为：::1', '::1', 1597657097, 1597657097);
INSERT INTO `gee_log` VALUES (1337, '超级管理员 应用了前台模板 dnspod', '::1', 1597656847, 1597656847);
INSERT INTO `gee_log` VALUES (1336, '超级管理员 应用了前台模板 test', '::1', 1597655387, 1597655387);
INSERT INTO `gee_log` VALUES (1335, '超级管理员 应用了前台模板 dnspod', '::1', 1597655148, 1597655148);
INSERT INTO `gee_log` VALUES (1334, '超级管理员 应用了前台模板 default', '::1', 1597654362, 1597654362);
INSERT INTO `gee_log` VALUES (1333, '超级管理员 应用了前台模板 default', '::1', 1597654308, 1597654308);
INSERT INTO `gee_log` VALUES (1332, '超级管理员 应用了前台模板 default', '::1', 1597654251, 1597654251);
INSERT INTO `gee_log` VALUES (1331, '超级管理员 应用了前台模板 default', '::1', 1597654033, 1597654033);
INSERT INTO `gee_log` VALUES (1330, '超级管理员 应用了前台模板 dnspod', '::1', 1597654005, 1597654005);
INSERT INTO `gee_log` VALUES (1329, '超级管理员 应用了前台模板 default', '::1', 1597653986, 1597653986);
INSERT INTO `gee_log` VALUES (1328, '超级管理员 应用了前台模板 crumina', '::1', 1597653574, 1597653574);
INSERT INTO `gee_log` VALUES (1327, '超级管理员 登录了，登录IP为：::1', '::1', 1597649846, 1597649846);
INSERT INTO `gee_log` VALUES (1326, ' 修改了基本信息 ', '::1', 1597198628, 1597198628);
INSERT INTO `gee_log` VALUES (1325, ' 修改了基本信息 ', '::1', 1597198621, 1597198621);
INSERT INTO `gee_log` VALUES (1324, ' 修改了基本信息 ', '::1', 1597198610, 1597198610);
INSERT INTO `gee_log` VALUES (1323, '超级管理员 登录了，登录IP为：::1', '::1', 1597194819, 1597194819);
INSERT INTO `gee_log` VALUES (1322, '超级管理员 登录了，登录IP为：::1', '::1', 1597109044, 1597109044);
INSERT INTO `gee_log` VALUES (1321, '超级管理员 登录了，登录IP为：::1', '::1', 1596857770, 1596857770);
INSERT INTO `gee_log` VALUES (1320, '超级管理员 登录了，登录IP为：::1', '::1', 1596857012, 1596857012);
INSERT INTO `gee_log` VALUES (1319, '超级管理员 登录了，登录IP为：::1', '::1', 1596778983, 1596778983);
INSERT INTO `gee_log` VALUES (1318, '超级管理员 登录了，登录IP为：::1', '::1', 1596704550, 1596704550);
INSERT INTO `gee_log` VALUES (1317, '超级管理员 修改了轮播图ID 1', '::1', 1596693530, 1596693530);
INSERT INTO `gee_log` VALUES (1316, '超级管理员 修改了轮播图ID 1', '::1', 1596693512, 1596693512);
INSERT INTO `gee_log` VALUES (1315, '超级管理员 添加了新闻分类ID ', '::1', 1596692488, 1596692488);
INSERT INTO `gee_log` VALUES (1314, '超级管理员 修改了新闻ID 2', '::1', 1596692468, 1596692468);
INSERT INTO `gee_log` VALUES (1313, '超级管理员 登录了，登录IP为：::1', '::1', 1596692433, 1596692433);
INSERT INTO `gee_log` VALUES (1312, '超级管理员 修改了新闻ID 2', '::1', 1596680837, 1596680837);
INSERT INTO `gee_log` VALUES (1311, '超级管理员 修改了新闻ID 2', '::1', 1596680370, 1596680370);
INSERT INTO `gee_log` VALUES (1310, '超级管理员 修改了轮播图ID 1', '::1', 1596677043, 1596677043);
INSERT INTO `gee_log` VALUES (1309, '超级管理员 登录了，登录IP为：::1', '::1', 1596677024, 1596677024);
INSERT INTO `gee_log` VALUES (1308, '超级管理员 登录了，登录IP为：::1', '::1', 1596418477, 1596418477);
INSERT INTO `gee_log` VALUES (1307, '超级管理员 登录了，登录IP为：::1', '::1', 1595908566, 1595908566);
INSERT INTO `gee_log` VALUES (1306, '超级管理员 登录了，登录IP为：::1', '::1', 1593313454, 1593313454);
INSERT INTO `gee_log` VALUES (1305, '超级管理员 登录了，登录IP为：::1', '::1', 1592804589, 1592804589);
INSERT INTO `gee_log` VALUES (1304, '超级管理员 登录了，登录IP为：::1', '::1', 1592458434, 1592458434);
INSERT INTO `gee_log` VALUES (1303, '超级管理员 登录了，登录IP为：::1', '::1', 1592388229, 1592388229);
INSERT INTO `gee_log` VALUES (1302, '超级管理员 登录了，登录IP为：::1', '::1', 1592278197, 1592278197);
INSERT INTO `gee_log` VALUES (1301, '超级管理员 登录了，登录IP为：::1', '::1', 1592270542, 1592270542);
INSERT INTO `gee_log` VALUES (1300, '超级管理员 登录了，登录IP为：::1', '::1', 1592209986, 1592209986);
INSERT INTO `gee_log` VALUES (1299, '超级管理员生成了 1 张代金券', '::1', 1592205010, 1592205010);
INSERT INTO `gee_log` VALUES (1298, '超级管理员 登录了，登录IP为：::1', '::1', 1592200870, 1592200870);
INSERT INTO `gee_log` VALUES (1297, '超级管理员 登录了，登录IP为：::1', '::1', 1592186347, 1592186347);
INSERT INTO `gee_log` VALUES (1296, '超级管理员 登录了，登录IP为：36.4.75.17', '36.4.75.17', 1591955300, 1591955300);
INSERT INTO `gee_log` VALUES (1295, '超级管理员 登录了，登录IP为：::1', '::1', 1591950414, 1591950414);
INSERT INTO `gee_log` VALUES (1294, '超级管理员 登录了，登录IP为：::1', '::1', 1591938903, 1591938903);
INSERT INTO `gee_log` VALUES (1293, '超级管理员 登录了，登录IP为：::1', '::1', 1591924969, 1591924969);
INSERT INTO `gee_log` VALUES (1292, '生成了 1 张代金券', '::1', 1591868355, 1591868355);
INSERT INTO `gee_log` VALUES (1291, '超级管理员生成了  张代金券', '::1', 1591855322, 1591855322);
INSERT INTO `gee_log` VALUES (1290, '超级管理员 登录了，登录IP为：::1', '::1', 1591855305, 1591855305);
INSERT INTO `gee_log` VALUES (1289, '超级管理员 登录了，登录IP为：::1', '::1', 1591838057, 1591838057);
INSERT INTO `gee_log` VALUES (1288, '超级管理员 登录了，登录IP为：::1', '::1', 1591838057, 1591838057);
INSERT INTO `gee_log` VALUES (1287, '超级管理员生成了  张代金券', '::1', 1591776911, 1591776911);
INSERT INTO `gee_log` VALUES (1286, '超级管理员 登录了，登录IP为：::1', '::1', 1591776906, 1591776906);
INSERT INTO `gee_log` VALUES (1285, '超级管理员生成了  张代金券', '::1', 1591767519, 1591767519);
INSERT INTO `gee_log` VALUES (1284, '超级管理员 登录了，登录IP为：::1', '::1', 1591767404, 1591767404);
INSERT INTO `gee_log` VALUES (1283, '超级管理员 登录了，登录IP为：::1', '::1', 1591756280, 1591756280);
INSERT INTO `gee_log` VALUES (1282, '超级管理员赋予了用户 ID:25 一张代金券 ID:8', '::1', 1591692806, 1591692806);
INSERT INTO `gee_log` VALUES (1281, '超级管理员赋予了用户 ID:26 一张代金券 ID:8', '::1', 1591692801, 1591692801);
INSERT INTO `gee_log` VALUES (1280, '超级管理员赋予了用户 ID:25 一张代金券 ID:8', '::1', 1591692792, 1591692792);
INSERT INTO `gee_log` VALUES (1279, '超级管理员删除了代金券 ID:7', '::1', 1591692689, 1591692689);
INSERT INTO `gee_log` VALUES (1278, '超级管理员生成了  张代金券', '::1', 1591690852, 1591690852);
INSERT INTO `gee_log` VALUES (1277, '超级管理员生成了  张代金券', '::1', 1591690845, 1591690845);
INSERT INTO `gee_log` VALUES (1276, '超级管理员生成了  张代金券', '::1', 1591690215, 1591690215);
INSERT INTO `gee_log` VALUES (1275, '超级管理员生成了  张代金券', '::1', 1591690144, 1591690144);
INSERT INTO `gee_log` VALUES (1274, '超级管理员生成了  张代金券', '::1', 1591690133, 1591690133);
INSERT INTO `gee_log` VALUES (1273, '超级管理员生成了  张代金券', '::1', 1591690095, 1591690095);
INSERT INTO `gee_log` VALUES (1272, '超级管理员生成了  张代金券', '::1', 1591689782, 1591689782);
INSERT INTO `gee_log` VALUES (1271, '超级管理员生成了  张代金券', '::1', 1591689744, 1591689744);
INSERT INTO `gee_log` VALUES (1270, '超级管理员生成了  张代金券', '::1', 1591689729, 1591689729);
INSERT INTO `gee_log` VALUES (1269, '超级管理员生成了  张代金券', '::1', 1591689570, 1591689570);
INSERT INTO `gee_log` VALUES (1268, '超级管理员生成了  张代金券', '::1', 1591689556, 1591689556);
INSERT INTO `gee_log` VALUES (1267, '超级管理员 登录了，登录IP为：::1', '::1', 1591689553, 1591689553);
INSERT INTO `gee_log` VALUES (1266, '超级管理员生成了  张代金券', '::1', 1591686489, 1591686489);
INSERT INTO `gee_log` VALUES (1265, '超级管理员生成了  张代金券', '::1', 1591686468, 1591686468);
INSERT INTO `gee_log` VALUES (1264, '超级管理员生成了  张代金券', '::1', 1591686431, 1591686431);
INSERT INTO `gee_log` VALUES (1263, '超级管理员生成了 1 张代金券', '::1', 1591686049, 1591686049);
INSERT INTO `gee_log` VALUES (1262, '超级管理员生成了  张代金券', '::1', 1591683861, 1591683861);
INSERT INTO `gee_log` VALUES (1261, '超级管理员生成了  张代金券', '::1', 1591683537, 1591683537);
INSERT INTO `gee_log` VALUES (1260, '超级管理员 登录了，登录IP为：::1', '::1', 1591680709, 1591680709);
INSERT INTO `gee_log` VALUES (1259, '超级管理员 登录了，登录IP为：::1', '::1', 1591673266, 1591673266);
INSERT INTO `gee_log` VALUES (1258, '超级管理员 登录了，登录IP为：::1', '::1', 1591665450, 1591665450);
INSERT INTO `gee_log` VALUES (1257, '超级管理员 登录了，登录IP为：::1', '::1', 1591604408, 1591604408);
INSERT INTO `gee_log` VALUES (1256, '超级管理员 登录了，登录IP为：::1', '::1', 1591587898, 1591587898);
INSERT INTO `gee_log` VALUES (1255, '超级管理员 登录了，登录IP为：::1', '::1', 1591579988, 1591579988);
INSERT INTO `gee_log` VALUES (1254, '超级管理员 登录了，登录IP为：::1', '::1', 1591339233, 1591339233);
INSERT INTO `gee_log` VALUES (1253, '超级管理员 登录了，登录IP为：::1', '::1', 1591320098, 1591320098);
INSERT INTO `gee_log` VALUES (1252, '超级管理员 登录了，登录IP为：::1', '::1', 1591234114, 1591234114);
INSERT INTO `gee_log` VALUES (1251, '超级管理员 登录了，登录IP为：::1', '::1', 1591147206, 1591147206);
INSERT INTO `gee_log` VALUES (1250, '超级管理员 登录了，登录IP为：::1', '::1', 1591088742, 1591088742);
INSERT INTO `gee_log` VALUES (1249, '超级管理员 登录了，登录IP为：::1', '::1', 1591078729, 1591078729);
INSERT INTO `gee_log` VALUES (1373, ' 应用了前台模板 dnspod', '172.25.0.1', 1598431823, 1598431823);
INSERT INTO `gee_log` VALUES (1374, ' 应用了前台模板 dnspod', '172.25.0.1', 1598431829, 1598431829);
INSERT INTO `gee_log` VALUES (1375, ' 添加了产品组 西部数据', '172.25.0.1', 1598436122, 1598436122);
INSERT INTO `gee_log` VALUES (1376, '超级管理员 登录了，登录IP为：172.25.0.1', '172.25.0.1', 1598493953, 1598493953);
INSERT INTO `gee_log` VALUES (1377, ' 添加了产品 西部数码域名', '172.25.0.1', 1598498876, 1598498876);
INSERT INTO `gee_log` VALUES (1378, '超级管理员 登录了，登录IP为：172.25.0.1', '172.25.0.1', 1598511390, 1598511390);
INSERT INTO `gee_log` VALUES (1379, ' 修改了产品 西部数码域名', '172.25.0.1', 1598518123, 1598518123);
INSERT INTO `gee_log` VALUES (1380, '超级管理员 登录了，登录IP为：172.25.0.1', '172.25.0.1', 1598520823, 1598520823);

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
-- Records of gee_msglog
-- ----------------------------
INSERT INTO `gee_msglog` VALUES (141, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器testqqq即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590373527, 1590373527);
INSERT INTO `gee_msglog` VALUES (140, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test001即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590373526, 1590373526);
INSERT INTO `gee_msglog` VALUES (139, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test001即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590373525, 1590373525);
INSERT INTO `gee_msglog` VALUES (138, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test001即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590373524, 1590373524);
INSERT INTO `gee_msglog` VALUES (137, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器testqqq即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590041448, 1590041448);
INSERT INTO `gee_msglog` VALUES (136, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test001即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590041447, 1590041447);
INSERT INTO `gee_msglog` VALUES (135, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test001即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590041446, 1590041446);
INSERT INTO `gee_msglog` VALUES (134, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test001即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590041445, 1590041445);
INSERT INTO `gee_msglog` VALUES (133, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590041444, 1590041444);
INSERT INTO `gee_msglog` VALUES (132, '1', '13789398868', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器q4bno83k已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', NULL, 1589954587, 1589954587);
INSERT INTO `gee_msglog` VALUES (131, '1', '13789398868', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器2rvdou5f已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', NULL, 1589881930, 1589881930);
INSERT INTO `gee_msglog` VALUES (130, '3', 'xiao.song@qiduo.net', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589876348, 1589876348);
INSERT INTO `gee_msglog` VALUES (129, '3', '975827527@qq.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589876347, 1589876347);
INSERT INTO `gee_msglog` VALUES (128, '3', '13789398868@163.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589876346, 1589876346);
INSERT INTO `gee_msglog` VALUES (127, '3', 'xiao.song@qiduo.net', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589875744, 1589875744);
INSERT INTO `gee_msglog` VALUES (126, '3', '975827527@qq.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589875743, 1589875743);
INSERT INTO `gee_msglog` VALUES (125, '3', '13789398868@163.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589875742, 1589875742);
INSERT INTO `gee_msglog` VALUES (124, '3', 'xiao.song@qiduo.net', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589875627, 1589875627);
INSERT INTO `gee_msglog` VALUES (123, '3', '975827527@qq.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589875626, 1589875626);
INSERT INTO `gee_msglog` VALUES (122, '3', '13789398868@163.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589875626, 1589875626);
INSERT INTO `gee_msglog` VALUES (121, '3', 'xiao.song@qiduo.net', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589874752, 1589874752);
INSERT INTO `gee_msglog` VALUES (120, '3', '975827527@qq.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589874752, 1589874752);
INSERT INTO `gee_msglog` VALUES (119, '3', '13789398868@163.com', '默认测试邮件', '这是一个默认邮件模板\n网站名称：|\n联系邮箱：|\n网站首页域名：|\nlogo图片路径：|\nICP备案：|\n网安备案：|\nIDC备案：|\nISP备案：|\n自定义变量：|\n邮件随机验证码：|\n短信随机验证码：', NULL, 1589874751, 1589874751);
INSERT INTO `gee_msglog` VALUES (142, '0', '13789398868', '云主机重置密码验证码', '尊敬的用户您好，您正在重置云主机实例的管理密码，验证码为，请勿告知他人。', NULL, 1590397334, 1590397334);
INSERT INTO `gee_msglog` VALUES (143, '0', '13789398868', '注册验证码模版', '您正在注册账号，验证码为，请勿将验证码告诉他人。', NULL, 1590398474, 1590398474);
INSERT INTO `gee_msglog` VALUES (144, '0', '13789398868', '注册验证码模版', '您正在注册账号，验证码为，请勿将验证码告诉他人。', NULL, 1590398488, 1590398488);
INSERT INTO `gee_msglog` VALUES (145, '0', '13789398868', '注册验证码模版', '您正在注册{basic_name},123456账号，验证码为，请勿将验证码告诉他人。', NULL, 1590399035, 1590399035);
INSERT INTO `gee_msglog` VALUES (146, '0', '13789398868', '注册验证码模版', '您正在注册[\"{basic_name}\",\"123456\"]账号，验证码为，请勿将验证码告诉他人。', NULL, 1590399082, 1590399082);
INSERT INTO `gee_msglog` VALUES (147, '0', '13789398868', '注册验证码模版', '您正在注册[\"{basic_name}\",\"123456\"]账号，验证码为，请勿将验证码告诉他人。', NULL, 1590399147, 1590399147);
INSERT INTO `gee_msglog` VALUES (148, '0', '13789398868', '注册验证码模版', '您正在注册{basic_name}账号，验证码为123456，请勿将验证码告诉他人。', NULL, 1590399177, 1590399177);
INSERT INTO `gee_msglog` VALUES (149, '0', '13789398868', '注册验证码模版', '您正在注册{basic_name}账号，验证码为123456，请勿将验证码告诉他人。', NULL, 1590399255, 1590399255);
INSERT INTO `gee_msglog` VALUES (150, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123456，请勿将验证码告诉他人。', NULL, 1590399272, 1590399272);
INSERT INTO `gee_msglog` VALUES (151, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123456，请勿将验证码告诉他人。', NULL, 1590399328, 1590399328);
INSERT INTO `gee_msglog` VALUES (152, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123456，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u7b7e\\u540d\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590401190764}\"', 1590399733, 1590399733);
INSERT INTO `gee_msglog` VALUES (153, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123456，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u7b7e\\u540d\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590401199097}\"', 1590401199, 1590401199);
INSERT INTO `gee_msglog` VALUES (154, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123456，请勿将验证码告诉他人。', NULL, 1590401207, 1590401207);
INSERT INTO `gee_msglog` VALUES (155, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123456，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u7b7e\\u540d\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590401291121}\"', 1590401299, 1590401299);
INSERT INTO `gee_msglog` VALUES (156, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器aqwCJZ48即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456602, 1590456602);
INSERT INTO `gee_msglog` VALUES (157, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器ciHORUX8即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456603, 1590456603);
INSERT INTO `gee_msglog` VALUES (158, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456604, 1590456604);
INSERT INTO `gee_msglog` VALUES (159, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456605, 1590456605);
INSERT INTO `gee_msglog` VALUES (160, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456606, 1590456606);
INSERT INTO `gee_msglog` VALUES (161, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456607, 1590456607);
INSERT INTO `gee_msglog` VALUES (162, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590456607, 1590456607);
INSERT INTO `gee_msglog` VALUES (163, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为165180，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u7b7e\\u540d\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590476518148}\"', 1590476517, 1590476517);
INSERT INTO `gee_msglog` VALUES (164, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为187638，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590476693871}\"', 1590476693, 1590476693);
INSERT INTO `gee_msglog` VALUES (165, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为561260，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200526150557\\\",\\\"msgId\\\":\\\"20052615055700202003000004386171\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1590476757395}\"', 1590476756, 1590476756);
INSERT INTO `gee_msglog` VALUES (166, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为995280，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u7b7e\\u540d\\u4e0e\\u7528\\u6237\\u4e0d\\u5339\\u914d\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590477894826}\"', 1590477894, 1590477894);
INSERT INTO `gee_msglog` VALUES (167, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为749103，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590477986467}\"', 1590477985, 1590477985);
INSERT INTO `gee_msglog` VALUES (168, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为805852，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478067838}\"', 1590478067, 1590478067);
INSERT INTO `gee_msglog` VALUES (169, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为864161，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478134752}\"', 1590478134, 1590478134);
INSERT INTO `gee_msglog` VALUES (170, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为510777，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478302328}\"', 1590478301, 1590478301);
INSERT INTO `gee_msglog` VALUES (171, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为289902，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478424852}\"', 1590478424, 1590478424);
INSERT INTO `gee_msglog` VALUES (172, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为780411，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478505346}\"', 1590478504, 1590478504);
INSERT INTO `gee_msglog` VALUES (173, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为747594，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478590691}\"', 1590478590, 1590478590);
INSERT INTO `gee_msglog` VALUES (174, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为654438，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478672689}\"', 1590478672, 1590478672);
INSERT INTO `gee_msglog` VALUES (175, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为592453，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478739424}\"', 1590478739, 1590478739);
INSERT INTO `gee_msglog` VALUES (176, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为286348，请勿将验证码告诉他人。', '\"{\\\"code\\\":500,\\\"message\\\":\\\"\\u672a\\u77e5\\u5f02\\u5e38\\uff0c\\u7a0d\\u540e\\u91cd\\u8bd5\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590478825802}\"', 1590478825, 1590478825);
INSERT INTO `gee_msglog` VALUES (177, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为866944，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200526154637\\\",\\\"msgId\\\":\\\"20052615463700202012000004444025\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1590479198358}\"', 1590479197, 1590479197);
INSERT INTO `gee_msglog` VALUES (178, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器aqwCJZ48即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543002, 1590543002);
INSERT INTO `gee_msglog` VALUES (179, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器ciHORUX8即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543003, 1590543003);
INSERT INTO `gee_msglog` VALUES (180, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543004, 1590543004);
INSERT INTO `gee_msglog` VALUES (181, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543005, 1590543005);
INSERT INTO `gee_msglog` VALUES (182, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543006, 1590543006);
INSERT INTO `gee_msglog` VALUES (183, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543007, 1590543007);
INSERT INTO `gee_msglog` VALUES (184, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590543008, 1590543008);
INSERT INTO `gee_msglog` VALUES (185, '0', '13789398868', '修改手机号', '您正在操作修改手机号操作，您的验证码为595525，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200527103109\\\",\\\"msgId\\\":\\\"20052710310900202002000000307177\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1590546669685}\"', 1590546670, 1590546670);
INSERT INTO `gee_msglog` VALUES (186, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为298219，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u6a21\\u677f\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590547751889}\"', 1590547753, 1590547753);
INSERT INTO `gee_msglog` VALUES (187, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为114248，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u6a21\\u677f\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590547832272}\"', 1590547833, 1590547833);
INSERT INTO `gee_msglog` VALUES (188, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为476582，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u6a21\\u677f\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590547881967}\"', 1590547883, 1590547883);
INSERT INTO `gee_msglog` VALUES (189, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为114886，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u6a21\\u677f\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590548012647}\"', 1590548014, 1590548014);
INSERT INTO `gee_msglog` VALUES (190, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为418959，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u6a21\\u677f\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590548094550}\"', 1590548096, 1590548096);
INSERT INTO `gee_msglog` VALUES (191, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为123728，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u6a21\\u677f\\u72b6\\u6001\\u672a\\u901a\\u8fc7\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1590548367873}\"', 1590548369, 1590548369);
INSERT INTO `gee_msglog` VALUES (192, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为302726，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200527110343\\\",\\\"msgId\\\":\\\"20052711034300202014000000361042\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1590548623152}\"', 1590548624, 1590548624);
INSERT INTO `gee_msglog` VALUES (193, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为267314，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200527110615\\\",\\\"msgId\\\":\\\"20052711061500202011000000366585\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1590548775356}\"', 1590548776, 1590548776);
INSERT INTO `gee_msglog` VALUES (194, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器ciHORUX8即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590629401, 1590629401);
INSERT INTO `gee_msglog` VALUES (195, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590629403, 1590629403);
INSERT INTO `gee_msglog` VALUES (196, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590629404, 1590629404);
INSERT INTO `gee_msglog` VALUES (197, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590629405, 1590629405);
INSERT INTO `gee_msglog` VALUES (198, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590629406, 1590629406);
INSERT INTO `gee_msglog` VALUES (199, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590629407, 1590629407);
INSERT INTO `gee_msglog` VALUES (200, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590715802, 1590715802);
INSERT INTO `gee_msglog` VALUES (201, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590715803, 1590715803);
INSERT INTO `gee_msglog` VALUES (202, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590715804, 1590715804);
INSERT INTO `gee_msglog` VALUES (203, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590715806, 1590715806);
INSERT INTO `gee_msglog` VALUES (204, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590715807, 1590715807);
INSERT INTO `gee_msglog` VALUES (205, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975001, 1590975001);
INSERT INTO `gee_msglog` VALUES (206, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975003, 1590975003);
INSERT INTO `gee_msglog` VALUES (207, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975004, 1590975004);
INSERT INTO `gee_msglog` VALUES (208, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975005, 1590975005);
INSERT INTO `gee_msglog` VALUES (209, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975006, 1590975006);
INSERT INTO `gee_msglog` VALUES (210, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975007, 1590975007);
INSERT INTO `gee_msglog` VALUES (211, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975008, 1590975008);
INSERT INTO `gee_msglog` VALUES (212, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1590975008, 1590975008);
INSERT INTO `gee_msglog` VALUES (213, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590975009, 1590975009);
INSERT INTO `gee_msglog` VALUES (214, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590975011, 1590975011);
INSERT INTO `gee_msglog` VALUES (215, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590975012, 1590975012);
INSERT INTO `gee_msglog` VALUES (216, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590975013, 1590975013);
INSERT INTO `gee_msglog` VALUES (217, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器qtk27ft2即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1590975014, 1590975014);
INSERT INTO `gee_msglog` VALUES (218, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061401, 1591061401);
INSERT INTO `gee_msglog` VALUES (219, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061402, 1591061402);
INSERT INTO `gee_msglog` VALUES (220, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061403, 1591061403);
INSERT INTO `gee_msglog` VALUES (221, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061404, 1591061404);
INSERT INTO `gee_msglog` VALUES (222, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061405, 1591061405);
INSERT INTO `gee_msglog` VALUES (223, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061406, 1591061406);
INSERT INTO `gee_msglog` VALUES (224, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061407, 1591061407);
INSERT INTO `gee_msglog` VALUES (225, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591061408, 1591061408);
INSERT INTO `gee_msglog` VALUES (226, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591061409, 1591061409);
INSERT INTO `gee_msglog` VALUES (227, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591061410, 1591061410);
INSERT INTO `gee_msglog` VALUES (228, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591061411, 1591061411);
INSERT INTO `gee_msglog` VALUES (229, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147801, 1591147801);
INSERT INTO `gee_msglog` VALUES (230, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147803, 1591147803);
INSERT INTO `gee_msglog` VALUES (231, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147804, 1591147804);
INSERT INTO `gee_msglog` VALUES (232, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147805, 1591147805);
INSERT INTO `gee_msglog` VALUES (233, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147806, 1591147806);
INSERT INTO `gee_msglog` VALUES (234, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147807, 1591147807);
INSERT INTO `gee_msglog` VALUES (235, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147808, 1591147808);
INSERT INTO `gee_msglog` VALUES (236, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591147809, 1591147809);
INSERT INTO `gee_msglog` VALUES (237, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591147809, 1591147809);
INSERT INTO `gee_msglog` VALUES (238, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器7ed1sy3u即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591147810, 1591147810);
INSERT INTO `gee_msglog` VALUES (239, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器66k7v9pb即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591147812, 1591147812);
INSERT INTO `gee_msglog` VALUES (240, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234202, 1591234202);
INSERT INTO `gee_msglog` VALUES (241, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234204, 1591234204);
INSERT INTO `gee_msglog` VALUES (242, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234205, 1591234205);
INSERT INTO `gee_msglog` VALUES (243, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234207, 1591234207);
INSERT INTO `gee_msglog` VALUES (244, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234208, 1591234208);
INSERT INTO `gee_msglog` VALUES (245, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234209, 1591234209);
INSERT INTO `gee_msglog` VALUES (246, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234209, 1591234209);
INSERT INTO `gee_msglog` VALUES (247, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234211, 1591234211);
INSERT INTO `gee_msglog` VALUES (248, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591234212, 1591234212);
INSERT INTO `gee_msglog` VALUES (249, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591234213, 1591234213);
INSERT INTO `gee_msglog` VALUES (250, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591234213, 1591234213);
INSERT INTO `gee_msglog` VALUES (251, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320601, 1591320601);
INSERT INTO `gee_msglog` VALUES (252, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320603, 1591320603);
INSERT INTO `gee_msglog` VALUES (253, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320604, 1591320604);
INSERT INTO `gee_msglog` VALUES (254, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320605, 1591320605);
INSERT INTO `gee_msglog` VALUES (255, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320606, 1591320606);
INSERT INTO `gee_msglog` VALUES (256, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320607, 1591320607);
INSERT INTO `gee_msglog` VALUES (257, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320608, 1591320608);
INSERT INTO `gee_msglog` VALUES (258, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320609, 1591320609);
INSERT INTO `gee_msglog` VALUES (259, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591320610, 1591320610);
INSERT INTO `gee_msglog` VALUES (260, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器26coxa6h即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591320611, 1591320611);
INSERT INTO `gee_msglog` VALUES (261, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591320612, 1591320612);
INSERT INTO `gee_msglog` VALUES (262, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579801, 1591579801);
INSERT INTO `gee_msglog` VALUES (263, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579803, 1591579803);
INSERT INTO `gee_msglog` VALUES (264, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579804, 1591579804);
INSERT INTO `gee_msglog` VALUES (265, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579805, 1591579805);
INSERT INTO `gee_msglog` VALUES (266, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579807, 1591579807);
INSERT INTO `gee_msglog` VALUES (267, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579808, 1591579808);
INSERT INTO `gee_msglog` VALUES (268, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579809, 1591579809);
INSERT INTO `gee_msglog` VALUES (269, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579810, 1591579810);
INSERT INTO `gee_msglog` VALUES (270, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591579811, 1591579811);
INSERT INTO `gee_msglog` VALUES (271, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591579812, 1591579812);
INSERT INTO `gee_msglog` VALUES (272, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591579813, 1591579813);
INSERT INTO `gee_msglog` VALUES (273, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为818445，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200608180546\\\",\\\"msgId\\\":\\\"20060818054600202013000009933938\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1591610746823}\"', 1591610771, 1591610771);
INSERT INTO `gee_msglog` VALUES (274, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666202, 1591666202);
INSERT INTO `gee_msglog` VALUES (275, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666203, 1591666203);
INSERT INTO `gee_msglog` VALUES (276, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666204, 1591666204);
INSERT INTO `gee_msglog` VALUES (277, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666205, 1591666205);
INSERT INTO `gee_msglog` VALUES (278, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666206, 1591666206);
INSERT INTO `gee_msglog` VALUES (279, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666207, 1591666207);
INSERT INTO `gee_msglog` VALUES (280, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666208, 1591666208);
INSERT INTO `gee_msglog` VALUES (281, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666209, 1591666209);
INSERT INTO `gee_msglog` VALUES (282, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591666210, 1591666210);
INSERT INTO `gee_msglog` VALUES (283, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591666211, 1591666211);
INSERT INTO `gee_msglog` VALUES (284, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591666212, 1591666212);
INSERT INTO `gee_msglog` VALUES (285, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752603, 1591752603);
INSERT INTO `gee_msglog` VALUES (286, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752605, 1591752605);
INSERT INTO `gee_msglog` VALUES (287, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752605, 1591752605);
INSERT INTO `gee_msglog` VALUES (288, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752606, 1591752606);
INSERT INTO `gee_msglog` VALUES (289, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752607, 1591752607);
INSERT INTO `gee_msglog` VALUES (290, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752608, 1591752608);
INSERT INTO `gee_msglog` VALUES (291, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752609, 1591752609);
INSERT INTO `gee_msglog` VALUES (292, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752610, 1591752610);
INSERT INTO `gee_msglog` VALUES (293, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591752611, 1591752611);
INSERT INTO `gee_msglog` VALUES (294, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591752612, 1591752612);
INSERT INTO `gee_msglog` VALUES (295, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591752613, 1591752613);
INSERT INTO `gee_msglog` VALUES (296, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839001, 1591839001);
INSERT INTO `gee_msglog` VALUES (297, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839003, 1591839003);
INSERT INTO `gee_msglog` VALUES (298, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839004, 1591839004);
INSERT INTO `gee_msglog` VALUES (299, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839005, 1591839005);
INSERT INTO `gee_msglog` VALUES (300, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839005, 1591839005);
INSERT INTO `gee_msglog` VALUES (301, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839006, 1591839006);
INSERT INTO `gee_msglog` VALUES (302, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839007, 1591839007);
INSERT INTO `gee_msglog` VALUES (303, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839008, 1591839008);
INSERT INTO `gee_msglog` VALUES (304, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591839009, 1591839009);
INSERT INTO `gee_msglog` VALUES (305, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591839010, 1591839010);
INSERT INTO `gee_msglog` VALUES (306, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591839011, 1591839011);
INSERT INTO `gee_msglog` VALUES (307, '1', '13789398868', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器test1111已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', 'false', 1591854997, 1591854997);
INSERT INTO `gee_msglog` VALUES (308, '1', '13789398868', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器99s3r4d0已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', 'false', 1591855776, 1591855776);
INSERT INTO `gee_msglog` VALUES (309, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925401, 1591925401);
INSERT INTO `gee_msglog` VALUES (310, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gvilstykujq_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925402, 1591925402);
INSERT INTO `gee_msglog` VALUES (311, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机gewahmawede_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925403, 1591925403);
INSERT INTO `gee_msglog` VALUES (312, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机asxfcdyxysy_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925404, 1591925404);
INSERT INTO `gee_msglog` VALUES (313, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机pgesxvfzseg_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925405, 1591925405);
INSERT INTO `gee_msglog` VALUES (314, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机bcvltilsypf_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925406, 1591925406);
INSERT INTO `gee_msglog` VALUES (315, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机xazwgwhmxgo_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925407, 1591925407);
INSERT INTO `gee_msglog` VALUES (316, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wbgrfwsikyr_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925408, 1591925408);
INSERT INTO `gee_msglog` VALUES (317, '3', '975827527@qq.com', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机wzzarsjixoe_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1591925409, 1591925409);
INSERT INTO `gee_msglog` VALUES (318, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591925410, 1591925410);
INSERT INTO `gee_msglog` VALUES (319, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591925411, 1591925411);
INSERT INTO `gee_msglog` VALUES (320, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器q4bno83k即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1591925412, 1591925412);
INSERT INTO `gee_msglog` VALUES (321, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1592271001, 1592271001);
INSERT INTO `gee_msglog` VALUES (322, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1592271003, 1592271003);
INSERT INTO `gee_msglog` VALUES (323, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1592271005, 1592271005);
INSERT INTO `gee_msglog` VALUES (324, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器q4bno83k即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1592271006, 1592271006);
INSERT INTO `gee_msglog` VALUES (325, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为340291，请勿将验证码告诉他人。', 'false', 1592273080, 1592273080);
INSERT INTO `gee_msglog` VALUES (326, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为892881，请勿将验证码告诉他人。', 'false', 1592273145, 1592273145);
INSERT INTO `gee_msglog` VALUES (327, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为873454，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592277054395}\"', 1592277056, 1592277056);
INSERT INTO `gee_msglog` VALUES (328, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为149752，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592277298603}\"', 1592277300, 1592277300);
INSERT INTO `gee_msglog` VALUES (329, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为321443，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592277413720}\"', 1592277415, 1592277415);
INSERT INTO `gee_msglog` VALUES (330, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为437567，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592277952711}\"', 1592277954, 1592277954);
INSERT INTO `gee_msglog` VALUES (331, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为597218，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592278180249}\"', 1592278181, 1592278181);
INSERT INTO `gee_msglog` VALUES (332, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为516637，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592278303365}\"', 1592278305, 1592278305);
INSERT INTO `gee_msglog` VALUES (333, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为927724，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592278555589}\"', 1592278556, 1592278556);
INSERT INTO `gee_msglog` VALUES (334, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为224365，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1592279105390}\"', 1592279106, 1592279106);
INSERT INTO `gee_msglog` VALUES (335, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为433301，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":{\\\"data\\\":{\\\"time\\\":\\\"20200616115739\\\",\\\"msgId\\\":\\\"20061611573900202001000021674885\\\",\\\"errorMsg\\\":\\\"\\\",\\\"code\\\":\\\"0\\\"}},\\\"success\\\":true,\\\"timestamp\\\":1592279859455}\"', 1592279861, 1592279861);
INSERT INTO `gee_msglog` VALUES (336, '3', '975827527@qq.com', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器sfpotezebif_25即将到期，请尽快续费以免服务过期造成不便影响。', NULL, 1592443802, 1592443802);
INSERT INTO `gee_msglog` VALUES (337, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器2rvdou5f即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1592443804, 1592443804);
INSERT INTO `gee_msglog` VALUES (338, '3', '156@qq.cc', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器cnr0bbos即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1592443805, 1592443805);
INSERT INTO `gee_msglog` VALUES (339, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器q4bno83k即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1592443806, 1592443806);
INSERT INTO `gee_msglog` VALUES (340, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test1111即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1593307802, 1593307802);
INSERT INTO `gee_msglog` VALUES (341, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器99s3r4d0即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1593307804, 1593307804);
INSERT INTO `gee_msglog` VALUES (342, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器test1111即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1593394209, 1593394209);
INSERT INTO `gee_msglog` VALUES (343, '3', '975827527@qq.com', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器99s3r4d0即将到期，请尽快续费以免服务器过期造成不便影响。', NULL, 1593394210, 1593394210);
INSERT INTO `gee_msglog` VALUES (344, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为366659，请勿将验证码告诉他人。', 'false', 1597137221, 1597137221);
INSERT INTO `gee_msglog` VALUES (345, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为714177，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1597137390779}\"', 1597137389, 1597137389);
INSERT INTO `gee_msglog` VALUES (346, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为849874，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1597137715388}\"', 1597137713, 1597137713);
INSERT INTO `gee_msglog` VALUES (347, '1', '13789398868', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器oe424ptd已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u5ba2\\u6237\\u7aefip\\u88ab\\u9650\\u5236\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1597305574015}\"', 1597305572, 1597305572);
INSERT INTO `gee_msglog` VALUES (348, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为995806，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":null,\\\"success\\\":true,\\\"timestamp\\\":1597646402358}\"', 1597646399, 1597646399);
INSERT INTO `gee_msglog` VALUES (349, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为588631，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u7b7e\\u540d\\u4e0e\\u7528\\u6237\\u4e0d\\u5339\\u914d\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1597649889775}\"', 1597649889, 1597649889);
INSERT INTO `gee_msglog` VALUES (350, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为549671，请勿将验证码告诉他人。', '\"{\\\"code\\\":10045,\\\"message\\\":\\\"\\u77ed\\u4fe1\\u5269\\u4f59\\u6761\\u6570\\u4e0d\\u8db3\\\",\\\"dataMap\\\":null,\\\"success\\\":false,\\\"timestamp\\\":1597650010286}\"', 1597650009, 1597650009);
INSERT INTO `gee_msglog` VALUES (351, '0', '13789398868', '注册验证码模版', '您正在注册GEECP账号，验证码为541723，请勿将验证码告诉他人。', '\"{\\\"code\\\":200,\\\"message\\\":\\\"Success\\\",\\\"dataMap\\\":null,\\\"success\\\":true,\\\"timestamp\\\":1597650150562}\"', 1597650149, 1597650149);

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
INSERT INTO `gee_msgmodel` VALUES (13, '3', 'serverOverdue', '租用托管服务器过期提醒', '尊敬的用户您好，您的物理服务器{name}即将到期，请尽快续费以免服务器过期造成不便影响。', '', NULL, '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (4, '0', 'registerCode', '注册验证码模版', '您正在注册{basic_name}账号，验证码为{sms_code}，请勿将验证码告诉他人。', '10002', NULL, '0', 1585553037, 1585553432);
INSERT INTO `gee_msgmodel` VALUES (5, '0', 'retrieveCode', '找回密码验证码模版', '您正在操作找回{basic_name}账号密码，您的验证码为{sms_code},请勿将验证码告诉他人。', '10003', NULL, '0', 1585553123, 1585553183);
INSERT INTO `gee_msgmodel` VALUES (6, '0', 'changeMobileCode', '修改手机号', '您正在操作修改手机号操作，您的验证码为{sms_code}，请勿将验证码告诉他人。', '10004', NULL, '0', 1585553168, 1585553168);
INSERT INTO `gee_msgmodel` VALUES (7, '1', 'domainRegister', '域名注册成功', '尊敬的用户您好，您的域名{S1}已经成功注册，请登陆控制台进行操作。感谢您对{basic_name}的支持。', '10005', NULL, '0', 1585553263, 1585553550);
INSERT INTO `gee_msgmodel` VALUES (8, '1', 'cloudserverRegister', '云主机开通短信', '尊敬的用户您好，您的云主机实例{s1}已经开通，有效期至{s3}。请您登陆控制台进行操作。', '10006', NULL, '0', 1585553309, 1585553536);
INSERT INTO `gee_msgmodel` VALUES (9, '0', 'cloudserverReseter', '云主机重置密码验证码', '尊敬的用户您好，您正在重置云主机实例{s1}的管理密码，验证码为{sms_code}，请勿告知他人。', '10007', NULL, '0', 1585553352, 1585553523);
INSERT INTO `gee_msgmodel` VALUES (10, '1', 'vhostRegister', '虚拟主机开通成功', '尊敬的用户您好，您的虚拟主机{s2}已经开通，请您登陆控制台进行操作。', '10008', NULL, '0', 1585553401, 1585553504);
INSERT INTO `gee_msgmodel` VALUES (11, '1', 'serverRegister', '物理服务器开通成功', '尊敬的用户您好，您的物理服务器{name}已经开通，稍后正式交付后会有短信再次提示，请您关注短信通知。', '10009', NULL, '0', 1585553463, 1585553467);
INSERT INTO `gee_msgmodel` VALUES (12, '1', 'serverDelivery', '物理服务器交付', '尊敬的用户您好，您的物理机实例{s2}已经成功交付，请您登陆控制台查看。', '10010', NULL, '0', 1585553495, 1585553495);
INSERT INTO `gee_msgmodel` VALUES (14, '3', 'cdnOverdue', '高防CDN服务器过期提醒', '尊敬的用户您好，您的高防CDN服务器{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', NULL, '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (15, '3', 'domainOverdue', '域名过期提醒', '尊敬的用户您好，您的域名{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', NULL, '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (16, '3', 'hostOverdue', '虚拟主机过期提醒', '尊敬的用户您好，您的虚拟主机{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', NULL, '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (17, '3', 'cloudserverOverdue', '云服务器过期提醒', '尊敬的用户您好，您的云服务器{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', NULL, '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (18, '3', 'vpsOverdue', '云主机VPS过期提醒', '尊敬的用户您好，您的云主机VPS{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', NULL, '0', 1590040961, 1590041289);
INSERT INTO `gee_msgmodel` VALUES (19, '3', 'smartOverdue', '智能建站过期提醒', '尊敬的用户您好，您的智能站点{name}即将到期，请尽快续费以免服务过期造成不便影响。', '', NULL, '0', 1590976629, 1590976629);

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
-- Records of gee_news
-- ----------------------------
INSERT INTO `gee_news` VALUES (2, 'TikTok欧洲首个数据中心将建在爱尔兰 投资5亿美元', '/uploads/20200806/5f2b97e1624b9.jpg', '【TechWeb】8月6日消息，据国外媒体报道，近一段时间备受关注的TikTok，仍在尽力扩展他们在欧洲的业务，他们将投资5亿美元，建设他们在欧洲的首个数据中心。', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">【TechWeb】8月6日消息，据国外媒体报道，近一段时间备受关注的TikTok，仍在尽力扩展他们在欧洲的业务，他们将投资5亿美元，建设他们在欧洲的首个数据中心。</span></p><p><img class=\"normal\" width=\"500px\" src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2669111660,771515950&fm=173&app=25&f=JPEG?w=500&h=300&s=BFC20DC8EBA0541F85037D7803005050\"/></p><p style=\"margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">从外媒的报道来看，TikTok已经宣布了建设他们欧洲首个数据中心的消息，将建在爱尔兰，投资4.2亿欧元，折合约5亿美元。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">TikTok方面表示，他们投资5亿美元在爱尔兰建设的这一数据中心，将提供上千个就业岗位，预计在2022年年初投入运营。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">在这一数据中心建成投入运营之后，TikTok欧洲用户的数据就将存放在这一数据中心，改善欧洲用户数据的安全和保护，并缩短欧洲用户的数据加载时间，改善用户体验。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">作为数据中心开发的一部分，TikTok还将继续壮大它么的数据保护和隐私团队。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">外媒在报道中表示，TikTok在爱尔兰建设他们在欧洲的首个数据中心，将扩大他们在欧洲的运营，是TikTok在全球范围努力证明他们是负责任的互联网公民和值得信赖的服务提供商的一部分。</span></p><p><br/></p>', 2, NULL, 0, 0, 1, 1587451467, 1596692468);

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
-- Records of gee_newsclass
-- ----------------------------
INSERT INTO `gee_newsclass` VALUES (2, '云平台', 1587440650, 1587441312);
INSERT INTO `gee_newsclass` VALUES (5, '其他', 1596692488, 1596692488);

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
-- Records of gee_operate_banner
-- ----------------------------
INSERT INTO `gee_operate_banner` VALUES (1, '/uploads/20200515/5ebe558ba013a.png', 1, '1', 1589532081, 1596693530);

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
-- Records of gee_order
-- ----------------------------
INSERT INTO `gee_order` VALUES (1, '2019110704485338033', 0, 25, '1', '账户充值 - 金额为:0.01', 0.01, 1513.02, NULL, NULL, '1', '0', 1573116533, 1573116533);
INSERT INTO `gee_order` VALUES (2, '2019110704530337933', 0, 25, '1', '账户充值 - 金额为:0.01', 0.01, 1513.02, NULL, NULL, '1', '0', 1573116783, 1573116783);
INSERT INTO `gee_order` VALUES (3, '2019110704551745151', 0, 25, '1', '账户充值 - 金额为:0.01', 0.01, 1513.02, NULL, NULL, '1', '2', 1573116917, 1573116917);
INSERT INTO `gee_order` VALUES (4, '2019110704561770657', 0, 25, '1', '账户充值 - 金额为:0.01', 0.01, 1513.02, NULL, NULL, '1', '0', 1573116977, 1573116977);

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
INSERT INTO `gee_ostype` VALUES (2, 'CentOs 7.2', 1, 0, '[{\"name\":\"nokvm\",\"id\":2}]', 1574661588, 1582098755);
INSERT INTO `gee_ostype` VALUES (3, 'Windows server 2016', 2, 0, '[{\"name\":\"nokvm\",\"id\":5}]', 1574663546, 1582098827);
INSERT INTO `gee_ostype` VALUES (4, 'Windows server 2012 R2', 2, 0, '[{\"name\":\"nokvm\",\"id\":4}]', 1574663555, 1582098806);
INSERT INTO `gee_ostype` VALUES (5, 'windows server 2008 R2', 2, 0, '[{\"name\":\"nokvm\",\"id\":1}]', 1574663561, 1587014533);
INSERT INTO `gee_ostype` VALUES (6, 'Ubuntu Server 18.04.1 LTS 64位', 3, 0, NULL, 1574672328, 1574672328);
INSERT INTO `gee_ostype` VALUES (7, 'Ubuntu16.04 amd64', 3, 0, '[{\"name\":\"nokvm\",\"id\":3}]', 1574672338, 1582098966);
INSERT INTO `gee_ostype` VALUES (8, 'Debian10.2', 4, 0, '[{\"name\":\"nokvm\",\"id\":8}]', 1582098925, 1582098925);
INSERT INTO `gee_ostype` VALUES (9, 'Debian9.9', 4, 0, '[{\"name\":\"nokvm\",\"id\":9}]', 1582098945, 1585027074);

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
) ENGINE = MyISAM AUTO_INCREMENT = 133 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_pro_config
-- ----------------------------
INSERT INTO `gee_pro_config` VALUES (3, '2019111202404112095', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573540841, 1573540841);
INSERT INTO `gee_pro_config` VALUES (4, '2019111202503867438', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"21\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":null,\"vpsname\":\"954fe1f3\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u9999\\u6e2f\\u670d\\u52a1\\u5668\\u6d4b\\u8bd5\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\",\"years\":\"1\",\"price\":\"11.00\"}]}', 1573541438, 1573541438);
INSERT INTO `gee_pro_config` VALUES (5, '2019111202525742199', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":null,\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573541577, 1573541577);
INSERT INTO `gee_pro_config` VALUES (6, '2019111202550816291', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":null,\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573541708, 1573541708);
INSERT INTO `gee_pro_config` VALUES (7, '2019111203040765644', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":null,\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573542247, 1573542247);
INSERT INTO `gee_pro_config` VALUES (8, '2019111203212232721', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":null,\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573543282, 1573543282);
INSERT INTO `gee_pro_config` VALUES (9, '2019111203352943480', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573544129, 1573544129);
INSERT INTO `gee_pro_config` VALUES (10, '2019111203363968332', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1573544199, 1573544199);
INSERT INTO `gee_pro_config` VALUES (11, '2019121803092057496', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"16\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"3\",\"idc\":\"\",\"productid\":\"808\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-32G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a32GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a200G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"36\",\"price\":\"41970.00\"}]}', 1576652960, 1576652960);
INSERT INTO `gee_pro_config` VALUES (12, '2020010301323424546', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"data\":[{\"userid\":\"23\",\"domainname\":\"1wq56f4q.xyz\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"23\",\"domainname\":\"1wq56f4q.net\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"domain\",\"config\":\"\\u57df\\u540d:1wq56f4q.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"},{\"class\":\"domain\",\"config\":\"\\u57df\\u540d:1wq56f4q.net\",\"num\":1,\"years\":12,\"price\":\"40.00\"}]}', 1578029554, 1578029554);
INSERT INTO `gee_pro_config` VALUES (13, '2020010301333242748', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"data\":[{\"userid\":\"23\",\"domainname\":\"1wq56f4q.xyz\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"23\",\"domainname\":\"1wq56f4q.net\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"domain\",\"config\":\"\\u57df\\u540d:1wq56f4q.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"},{\"class\":\"domain\",\"config\":\"\\u57df\\u540d:1wq56f4q.net\",\"num\":1,\"years\":12,\"price\":\"40.00\"}]}', 1578029612, 1578029612);
INSERT INTO `gee_pro_config` VALUES (14, '2020010301514411780', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1578030704, 1578030704);
INSERT INTO `gee_pro_config` VALUES (15, '2020010301524432646', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"data\":[{\"userid\":\"23\",\"domainname\":\"1wq56f4q.xyz\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"23\",\"domainname\":\"1wq56f4q.net\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:1wq56f4q.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:1wq56f4q.net\",\"num\":1,\"years\":12,\"price\":\"40.00\"}]}', 1578030764, 1578030764);
INSERT INTO `gee_pro_config` VALUES (16, '2020010302020523767', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"data\":[{\"userid\":\"23\",\"domainname\":\"1wq56f4q.xyz\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"23\",\"domainname\":\"1wq56f4q.net\",\"years\":1,\"domainpass\":\"1234567890\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:1wq56f4q.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:1wq56f4q.net\",\"num\":1,\"years\":12,\"price\":\"40.00\"}]}', 1578031325, 1578031325);
INSERT INTO `gee_pro_config` VALUES (17, '2020010711244651509', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"domainRenew\",\"data\":[{\"domainname\":\"wx118.top\",\"years\":\"3\",\"exptme\":null}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"num\":1,\"years\":36,\"price\":\"3.00\"}]}', 1578367486, 1578367486);
INSERT INTO `gee_pro_config` VALUES (18, '2020010702143923599', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"domainRenew\",\"data\":[{\"domainname\":\"wx118.top\",\"years\":\"10\",\"exptme\":null}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"num\":1,\"years\":120,\"price\":\"10.00\"}]}', 1578377679, 1578377679);
INSERT INTO `gee_pro_config` VALUES (19, '2020011002515538979', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1578639115, 1578639115);
INSERT INTO `gee_pro_config` VALUES (20, '2020012110344355800', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"32\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"80\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]}', 1579574083, 1579574083);
INSERT INTO `gee_pro_config` VALUES (21, '2020012111150124731', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"32\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"80\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]}', 1579576501, 1579576501);
INSERT INTO `gee_pro_config` VALUES (32, '2020021010101570311', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"way\":\"nokvm\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"13789398868\",\"name\":\"13789398868\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":5,\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1583849415,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1581343815, 1581343815);
INSERT INTO `gee_pro_config` VALUES (31, '2020021010005843540', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"13789398868\",\"name\":\"13789398868\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":5,\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1583848858,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1581343258, 1581343258);
INSERT INTO `gee_pro_config` VALUES (33, '2020021010115477680', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"13789398868\",\"name\":\"13789398868\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":5,\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1583849514,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1581343914, 1581343914);
INSERT INTO `gee_pro_config` VALUES (34, '2020021011132551317', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"13789398868\",\"name\":\"v77hgb\",\"title\":\"13789398868\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":5,\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1583853205,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1581347605, 1581347605);
INSERT INTO `gee_pro_config` VALUES (35, '2020022009022493900', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"name\":\"qrrqk6\",\"title\":\"instance-8xg7s431\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":7,\"os_id\":\"28\",\"os_versions_id\":\"1\",\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1584709344,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582203744, 1582203744);
INSERT INTO `gee_pro_config` VALUES (36, '2020022009060066455', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"ylsq\",\"name\":\"36s384\",\"title\":\"instance-b42tk5q6\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":7,\"os_id\":\"28\",\"os_versions_id\":\"1\",\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1584709560,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582203960, 1582203960);
INSERT INTO `gee_pro_config` VALUES (37, '2020022009092382344', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"ylsq\",\"name\":\"uroy04\",\"title\":\"instance-7g1pfhbk\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":7,\"os_id\":\"28\",\"os_versions_id\":\"1\",\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1584709763,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582204163, 1582204163);
INSERT INTO `gee_pro_config` VALUES (38, '2020022009153839438', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"ylsq\",\"name\":\"08gb7d\",\"title\":\"instance-56dsbb9x\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":7,\"os_id\":\"28\",\"os_versions_id\":\"1\",\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1584710138,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582204538, 1582204538);
INSERT INTO `gee_pro_config` VALUES (39, '2020022104395767234', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"ylsq\",\"name\":\"cbu5tb\",\"title\":\"instance-pebb6cvg\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":7,\"os_id\":\"28\",\"os_versions_id\":\"1\",\"sys_pwd\":\"q123123!\",\"vnc_pwd\":\"q123123!\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1584779997,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582274397, 1582274397);
INSERT INTO `gee_pro_config` VALUES (40, '2020022107170558500', '{\"_create_putData\":{\"pro_id\":\"28\",\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":\"28\",\"user_id\":25,\"action\":\"addvirtual\",\"data\":{\"users_id\":25,\"username\":\"ylsq\",\"name\":\"kfvurx\",\"title\":\"instance-ec0dfbax\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"snapshoot\":\"2\",\"backups\":\"2\",\"templates_id\":7,\"os_id\":\"28\",\"os_versions_id\":\"1\",\"sys_pwd\":\"qdca@123\",\"vnc_pwd\":\"qdca@123\",\"expire_time\":\"2999-06-30 23:59:59\",\"end_time\":1584789425,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582283825, 1582283825);
INSERT INTO `gee_pro_config` VALUES (41, '2020022407544630920', '{\"_create_putData\":{\"pro_id\":28,\"plug\":\"\\\\addons\\\\cloudserver\\\\cloudserver\",\"class\":\"cloudserver\",\"function\":\"control\",\"data\":{\"way\":\"nokvm\",\"plug_id\":28,\"user_id\":25,\"action\":\"renewvirtual\",\"data\":{\"users_id\":25,\"username\":\"ylsq\",\"virtual_id\":97,\"name\":\"2dsv77\",\"title\":\"instance-tursoepe\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_size\":\"50\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"net_out\":\"1\",\"net_in\":\"1\",\"end_time\":1585050886,\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}}},\"_pro_info\":[{\"group\":\"nokvm\\u6d4b\\u8bd5\\u7ec41\",\"class\":\"\\u4e91\\u4e3b\\u673a\",\"name\":\"nokvm\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":1,\"config\":\"tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-\",\"years\":\"1\",\"price\":\"0.52\"}]}', 1582545286, 1582545286);
INSERT INTO `gee_pro_config` VALUES (42, '2020040304431219422', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"24\",\"domainname\":\"ylsq2018.xyz\",\"years\":1,\"domainpass\":\"vakkbo7z\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:ylsq2018.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"}]}', 1585903392, 1585903392);
INSERT INTO `gee_pro_config` VALUES (43, '2020040711055328215', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1586228753, 1586228753);
INSERT INTO `gee_pro_config` VALUES (44, '2020040711142565759', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1586229265, 1586229265);
INSERT INTO `gee_pro_config` VALUES (45, '2020040701160165093', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1586236561, 1586236561);
INSERT INTO `gee_pro_config` VALUES (46, '2020040701295927484', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1586237399, 1586237399);
INSERT INTO `gee_pro_config` VALUES (47, '2020040701591393622', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"32\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"80\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]}', 1586239153, 1586239153);
INSERT INTO `gee_pro_config` VALUES (48, '2020041303191559166', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"33\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"2\",\"hostname\":\"knosabmzmql_25\",\"month\":\"24\",\"id\":\"32\"},\"host_type\":\"3\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":null,\"name\":\"easplane\\u6d4b\\u8bd5\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"easplane\\u6d4b\\u8bd5\\u865a\\u62df\\u4e3b\\u673a\",\"years\":\"24\",\"month\":\"24\",\"price\":\"22.00\"}]}', 1586762355, 1586762355);
INSERT INTO `gee_pro_config` VALUES (49, '2020041303402916335', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"33\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.7\",\"hostname\":\"knosabmzmql_25\",\"month\":\"7\",\"id\":\"32\"},\"host_type\":\"3\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":null,\"name\":\"easplane\\u6d4b\\u8bd5\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"easplane\\u6d4b\\u8bd5\\u865a\\u62df\\u4e3b\\u673a\",\"years\":\"7\",\"month\":\"7\",\"price\":\"24.00\"}]}', 1586763629, 1586763629);
INSERT INTO `gee_pro_config` VALUES (50, '2020041411175365565', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"update\",\"data\":{\"hostname\":\"knosabmzmql_25\"},\"host_type\":\"7\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"update\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"undefined\",\"month\":\"undefined\",\"price\":\"21.00\"}]}', 1586834273, 1586834273);
INSERT INTO `gee_pro_config` VALUES (51, '2020041411191316845', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"15\",\"user_id\":25,\"action\":\"update\",\"data\":{\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-16G\",\"type\":\"update\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a16GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a150G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"undefined\",\"price\":\"899.00\"}]}', 1586834353, 1586834353);
INSERT INTO `gee_pro_config` VALUES (52, '2020041411202394505', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"15\",\"user_id\":25,\"action\":\"update\",\"data\":{\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-16G\",\"type\":\"update\",\"num\":\"1\",\"config\":\"CPU\\uff1a8\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a16GB DDR4 ECC|\\u7cfb\\u7edf+\\u6570\\u636e\\u76d8\\uff1a150G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab8M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"undefined\",\"price\":\"899.00\"}]}', 1586834423, 1586834423);
INSERT INTO `gee_pro_config` VALUES (53, '2020041411231027524', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"update\",\"data\":{\"hostname\":\"knosabmzmql_25\"},\"host_type\":\"7\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"update\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"undefined\",\"month\":\"undefined\",\"price\":\"21.00\"}]}', 1586834590, 1586834590);
INSERT INTO `gee_pro_config` VALUES (54, '2020041411235439466', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"33\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.9\",\"hostname\":\"knosabmzmql_25\",\"month\":\"9\",\"id\":\"32\"},\"host_type\":\"3\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u6d4b\\u8bd51\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"easplane\\u6d4b\\u8bd5\\u865a\\u62df\\u4e3b\\u673a\",\"years\":\"9\",\"month\":\"9\",\"price\":\"44.00\"}]}', 1586834634, 1586834634);
INSERT INTO `gee_pro_config` VALUES (55, '2020041403095722847', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"34\",\"month\":\"12\"},\"host_type\":\"7\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"12\",\"month\":\"12\",\"price\":\"222.00\"}]}', 1586848197, 1586848197);
INSERT INTO `gee_pro_config` VALUES (56, '2020041404105731139', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"34\",\"month\":\"12\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"12\",\"month\":\"12\",\"price\":\"222.00\"}]}', 1586851857, 1586851857);
INSERT INTO `gee_pro_config` VALUES (57, '2020041404182973358', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"34\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"21.00\"}]}', 1586852309, 1586852309);
INSERT INTO `gee_pro_config` VALUES (58, '2020041404191467368', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"35\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"35\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u521d\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u521d\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"12.00\"}]}', 1586852354, 1586852354);
INSERT INTO `gee_pro_config` VALUES (59, '2020041404221398143', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"35\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.8\",\"productid\":\"35\",\"month\":\"8\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u521d\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u521d\\u7ea7\\u5957\\u9910\",\"years\":\"8\",\"month\":\"8\",\"price\":\"79.00\"}]}', 1586852533, 1586852533);
INSERT INTO `gee_pro_config` VALUES (60, '2020041404255990048', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"34\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"21.00\"}]}', 1586852759, 1586852759);
INSERT INTO `gee_pro_config` VALUES (61, '2020041404270752932', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"33\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.5\",\"productid\":\"33\",\"month\":\"5\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u6d4b\\u8bd51\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u6d4b\\u8bd5\\u865a\\u62df\\u4e3b\\u673a\",\"years\":\"5\",\"month\":\"5\",\"price\":\"26.00\"}]}', 1586852827, 1586852827);
INSERT INTO `gee_pro_config` VALUES (62, '2020041404410062090', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"36\",\"month\":\"12\"},\"host_type\":\"3\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"12\",\"month\":\"12\",\"price\":\"11.00\"}]}', 1586853660, 1586853660);
INSERT INTO `gee_pro_config` VALUES (63, '2020041404441443464', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"34\",\"month\":\"1\"},\"host_type\":\"1\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"21.00\"}]}', 1586853854, 1586853854);
INSERT INTO `gee_pro_config` VALUES (64, '2020041603180827055', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"34\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"34\",\"month\":\"1\"},\"host_type\":\"1\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u57fa\\u7840\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"21.00\"}]}', 1587021488, 1587021488);
INSERT INTO `gee_pro_config` VALUES (65, '2020041711042998287', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"24\",\"domainname\":\"fsdfs.com.com\",\"years\":1,\"domainpass\":\"vbbhkcdx\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.top\",\"years\":1,\"domainpass\":\"2r931ec6\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.cn\",\"years\":1,\"domainpass\":\"ebhtcqx3\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.xyz\",\"years\":1,\"domainpass\":\"zzvt63nb\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.net\",\"years\":1,\"domainpass\":\"x7gt2h2a\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.com.cn\",\"years\":1,\"domainpass\":\"hp9862kg\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.shop\",\"years\":1,\"domainpass\":\"6zyp36rp\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.vip\",\"years\":1,\"domainpass\":\"cepkdakq\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.com\",\"num\":1,\"years\":12,\"price\":\"0.01\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.top\",\"num\":1,\"years\":12,\"price\":\"0.01\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.cn\",\"num\":1,\"years\":12,\"price\":\"1.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.net\",\"num\":1,\"years\":12,\"price\":\"40.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.com.cn\",\"num\":1,\"years\":12,\"price\":\"30.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.shop\",\"num\":1,\"years\":12,\"price\":\"15.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.vip\",\"num\":1,\"years\":12,\"price\":\"48.00\"}]}', 1587092669, 1587092669);
INSERT INTO `gee_pro_config` VALUES (66, '2020041711054563357', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"24\",\"domainname\":\"fsdfs.com.com\",\"years\":1,\"domainpass\":\"spsb942e\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.top\",\"years\":1,\"domainpass\":\"4feob9rt\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.cn\",\"years\":1,\"domainpass\":\"qp8ex728\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.xyz\",\"years\":1,\"domainpass\":\"tf7sds4a\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.net\",\"years\":1,\"domainpass\":\"6bsspfr3\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.com.cn\",\"years\":1,\"domainpass\":\"8uovqb81\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.shop\",\"years\":1,\"domainpass\":\"q35yrt4n\",\"dns1\":\"\",\"dns2\":\"\"},{\"userid\":\"24\",\"domainname\":\"fsdfs.com.vip\",\"years\":1,\"domainpass\":\"ckyb00cv\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.com\",\"num\":1,\"years\":12,\"price\":\"0.01\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.top\",\"num\":1,\"years\":12,\"price\":\"0.01\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.cn\",\"num\":1,\"years\":12,\"price\":\"1.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.xyz\",\"num\":1,\"years\":12,\"price\":\"8.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.net\",\"num\":1,\"years\":12,\"price\":\"40.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.com.cn\",\"num\":1,\"years\":12,\"price\":\"30.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.shop\",\"num\":1,\"years\":12,\"price\":\"15.00\"},{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsdfs.com.vip\",\"num\":1,\"years\":12,\"price\":\"48.00\"}]}', 1587092745, 1587092745);
INSERT INTO `gee_pro_config` VALUES (67, '2020042003284469065', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"36\",\"month\":\"12\"},\"host_type\":\"3\",\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"12\",\"month\":\"12\",\"price\":\"11.00\"}]}', 1587367724, 1587367724);
INSERT INTO `gee_pro_config` VALUES (68, '2020042401355193074', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"3\",\"vpsname\":\"a10a026a\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"36\",\"price\":\"100.00\"}]}', 1587706551, 1587706551);
INSERT INTO `gee_pro_config` VALUES (69, '2020051405585039912', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"25\",\"domainname\":\"yukatoo.com\",\"years\":1,\"domainpass\":\"oor21atb\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:yukatoo.com\",\"num\":1,\"years\":12,\"price\":\"0.01\"}]}', 1589450330, 1589450330);
INSERT INTO `gee_pro_config` VALUES (70, '2020051502275049290', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524070, 1589524070);
INSERT INTO `gee_pro_config` VALUES (71, '2020051502275063391', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524070, 1589524070);
INSERT INTO `gee_pro_config` VALUES (72, '2020051502275314108', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524073, 1589524073);
INSERT INTO `gee_pro_config` VALUES (73, '2020051502354377686', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"pro_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524543, 1589524543);
INSERT INTO `gee_pro_config` VALUES (74, '2020051502385957514', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524739, 1589524739);
INSERT INTO `gee_pro_config` VALUES (75, '2020051502393411084', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524774, 1589524774);
INSERT INTO `gee_pro_config` VALUES (76, '2020051502400645720', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589524806, 1589524806);
INSERT INTO `gee_pro_config` VALUES (77, '2020051811115237251', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\cdn\\\\cdn\",\"class\":\"cdn\",\"function\":\"control\",\"data\":{\"plug_id\":\"38\",\"user_id\":26,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"38\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1589771512, 1589771512);
INSERT INTO `gee_pro_config` VALUES (78, '2020051811145049170', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\cdn\\\\cdn\",\"class\":\"cdn\",\"function\":\"control\",\"data\":{\"plug_id\":\"38\",\"user_id\":26,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"38\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1589771690, 1589771690);
INSERT INTO `gee_pro_config` VALUES (79, '2020051811212925659', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\cdn\\\\cdn\",\"class\":\"cdn\",\"function\":\"control\",\"data\":{\"plug_id\":\"38\",\"user_id\":26,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"38\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1589772089, 1589772089);
INSERT INTO `gee_pro_config` VALUES (80, '2020051801501771177', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\cdn\\\\cdn\",\"class\":\"cdn\",\"function\":\"control\",\"data\":{\"plug_id\":\"38\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"38\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"pro_type\":\"cdn\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1589781017, 1589781017);
INSERT INTO `gee_pro_config` VALUES (81, '2020051803500460798', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"wzzarsjixoe_25\",\"month\":\"1\",\"id\":\"40\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"pro_type\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1589788204, 1589788204);
INSERT INTO `gee_pro_config` VALUES (82, '2020052105271776294', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":39,\"action\":\"activate\",\"data\":{\"year\":\"0.2\",\"productid\":\"36\",\"month\":\"2\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"pro_type\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"2\",\"month\":\"2\",\"price\":\"44.00\"}]}', 1590053237, 1590053237);
INSERT INTO `gee_pro_config` VALUES (83, '2020052105294489116', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"36\",\"user_id\":39,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"36\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"esalpane\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"36\",\"pro_type\":\"host\",\"name\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"type\":\"create\",\"num\":\"1\",\"config\":\"easplane\\u9ad8\\u7ea7\\u5957\\u9910|\\neasplane\\u9ad8\\u7ea7\\u5957\\u9910\",\"years\":\"1\",\"month\":\"1\",\"price\":\"22.00\"}]}', 1590053384, 1590053384);
INSERT INTO `gee_pro_config` VALUES (84, '2020052510485934192', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"20\",\"pro_type\":\"vps\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1590374939, 1590374939);
INSERT INTO `gee_pro_config` VALUES (85, '2020052601125451622', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"32\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"80\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"32\",\"pro_type\":\"vps\",\"name\":\"\\u5f69\\u8679\\u6570\\u636e\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u5f69\\u8679\\u6570\\u636e\\u6d4b\\u8bd5\\u673a\",\"years\":\"1\",\"price\":\"1.00\"}]}', 1590469974, 1590469974);
INSERT INTO `gee_pro_config` VALUES (86, '2020052605145420654', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\cdn\\\\cdn\",\"class\":\"cdn\",\"function\":\"control\",\"data\":{\"plug_id\":\"38\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"38\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5CDN\",\"class\":\"\\u9ad8\\u9632CDN\",\"pro_id\":\"38\",\"pro_type\":\"cdn\",\"name\":\"\\u6d4b\\u8bd5CDN\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u8fd9\\u662f\\u4e00\\u4e2a\\u6d4b\\u8bd5cdn\\u4ea7\\u54c1\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1590484494, 1590484494);
INSERT INTO `gee_pro_config` VALUES (87, '2020052711383889085', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"8\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"38\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u97e9\\u56fd\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"8\",\"pro_type\":\"vps\",\"name\":\"\\u97e9\\u56fd\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u97e9\\u56fd\\u4e91\\u670d\\u52a1\\u5668-1G\",\"years\":\"1\",\"price\":\"50.00\"}]}', 1590550718, 1590550718);
INSERT INTO `gee_pro_config` VALUES (88, '2020052802153044868', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"40\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"40\",\"month\":\"12\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590646530, 1590646530);
INSERT INTO `gee_pro_config` VALUES (89, '2020052803074482402', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"2\",\"productid\":\"41\",\"month\":\"24\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"24\",\"month\":\"24\",\"price\":\"5.00\"}]}', 1590649664, 1590649664);
INSERT INTO `gee_pro_config` VALUES (90, '2020052803125846707', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"2\",\"productid\":\"41\",\"month\":\"24\",\"ftpserver\":\"www.geecp.com\",\"ftpuser\":\"root\",\"password\":\"123456\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"24\",\"month\":\"24\",\"price\":\"5.00\"}]}', 1590649978, 1590649978);
INSERT INTO `gee_pro_config` VALUES (91, '2020052804172961080', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"2\",\"productid\":\"41\",\"month\":\"24\",\"ftpserver\":\"123123.com\",\"ftpuser\":\"root1\",\"password\":\"123456\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"24\",\"month\":\"24\",\"price\":\"5.00\"}]}', 1590653849, 1590653849);
INSERT INTO `gee_pro_config` VALUES (92, '2020052804300264305', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"2\",\"productid\":\"41\",\"month\":\"24\",\"ftpserver\":\"test111\",\"ftpuser\":\"root\",\"password\":\"123456\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"24\",\"month\":\"24\",\"price\":\"5.00\"}]}', 1590654602, 1590654602);
INSERT INTO `gee_pro_config` VALUES (93, '2020052904154579621', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"1\",\"ftpserver\":\"undefined\",\"ftpuser\":\"root\",\"month\":\"12\",\"id\":\"43\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590740145, 1590740145);
INSERT INTO `gee_pro_config` VALUES (94, '2020052904181530776', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"1\",\"ftpserver\":\"undefined\",\"ftpuser\":\"root\",\"month\":\"12\",\"id\":\"43\",\"end_time\":\"2022-05-00\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590740295, 1590740295);
INSERT INTO `gee_pro_config` VALUES (95, '2020052904190354353', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"1\",\"ftpserver\":\"test111\",\"ftpuser\":\"root\",\"month\":\"12\",\"id\":\"43\",\"end_time\":\"2022-05-00\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590740343, 1590740343);
INSERT INTO `gee_pro_config` VALUES (96, '2020052904202534066', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"1\",\"ftpserver\":\"test111\",\"ftpuser\":\"root\",\"month\":\"12\",\"id\":\"43\",\"end_time\":\"2022-05-28\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590740425, 1590740425);
INSERT INTO `gee_pro_config` VALUES (97, '2020052904214192922', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"1\",\"ftpserver\":\"test111\",\"ftpuser\":\"root\",\"month\":\"12\",\"id\":\"43\",\"end_time\":\"2023-05-28\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590740501, 1590740501);
INSERT INTO `gee_pro_config` VALUES (98, '2020052905065612312', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"40\",\"user_id\":25,\"action\":\"uprenew\",\"data\":{\"ftpserver\":\"test111\",\"ftpuser\":\"root\",\"upgrade_productid\":\"nicebox_6_xcx_2\",\"booktype\":\"\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"update\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"undefined\",\"month\":\"undefined\",\"price\":\"4.00\"}]}', 1590743216, 1590743216);
INSERT INTO `gee_pro_config` VALUES (99, '2020052905123498729', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"40\",\"user_id\":25,\"action\":\"uprenew\",\"data\":{\"ftpserver\":\"test111\",\"ftpuser\":\"root\",\"upgrade_productid\":\"nicebox_2\",\"booktype\":\"\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"update\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"undefined\",\"month\":\"undefined\",\"price\":\"4.00\"}]}', 1590743554, 1590743554);
INSERT INTO `gee_pro_config` VALUES (100, '2020060109403045161', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"40\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"40\",\"month\":\"12\",\"ftpserver\":\"\",\"ftpuser\":\"\",\"password\":\"\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590975630, 1590975630);
INSERT INTO `gee_pro_config` VALUES (101, '2020060109405825756', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"41\",\"month\":\"12\",\"ftpserver\":\"test.com\",\"ftpuser\":\"root\",\"password\":\"123456789\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590975658, 1590975658);
INSERT INTO `gee_pro_config` VALUES (102, '2020060110270990778', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"40\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"40\",\"month\":\"12\",\"ftpserver\":\"test2.com\",\"ftpuser\":\"root\",\"password\":\"123456789\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590978429, 1590978429);
INSERT INTO `gee_pro_config` VALUES (103, '2020060110463067638', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"1\",\"ftpserver\":\"test.com\",\"ftpuser\":\"root\",\"month\":\"12\",\"id\":\"44\",\"end_time\":\"2021-06-01\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1590979590, 1590979590);
INSERT INTO `gee_pro_config` VALUES (104, '2020060104231738562', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"40\",\"user_id\":25,\"action\":\"uprenew\",\"data\":{\"ftpserver\":\"test.com\",\"ftpuser\":\"root\",\"upgrade_productid\":\"nicebox_2\",\"booktype\":\"\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"40\",\"pro_type\":\"smartsite\",\"name\":\"\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-1\",\"type\":\"update\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd51\",\"years\":\"undefined\",\"month\":\"undefined\",\"price\":\"4.00\"}]}', 1590999797, 1590999797);
INSERT INTO `gee_pro_config` VALUES (105, '2020061109362121514', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"3\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"803\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u90d1\\u5dde\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"3\",\"pro_type\":\"vps\",\"name\":\"\\u90d1\\u5dde\\u591a\\u7ebf\\u4e91\\u670d\\u52a1\\u5668-1G\",\"type\":\"create\",\"num\":\"1\",\"config\":\"CPU\\uff1a2\\u6838\\u5fc3|\\u5185\\u5b58\\uff1a1GB DDR4 ECC|\\u786c\\u76d8(\\u7cfb\\u7edf+\\u6570\\u636e)\\uff1a60G SSD|\\u5e26\\u5bbd\\uff1a\\u72ec\\u4eab2M|IP\\uff1a\\u72ec\\u7acb1\\u4e2a\",\"years\":\"1\",\"price\":\"49.00\"}]}', 1591839381, 1591839381);
INSERT INTO `gee_pro_config` VALUES (106, '2020061112323241261', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"20\",\"pro_type\":\"vps\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1591849952, 1591849952);
INSERT INTO `gee_pro_config` VALUES (107, '2020061103061944814', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\vps\\\\vps\",\"class\":\"vps\",\"function\":\"control\",\"data\":{\"plug_id\":\"20\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"idc\":\"\",\"productid\":\"973\"},\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u5e7f\\u5dde\\u6d4b\\u8bd5\",\"class\":\"VPS\\u4e3b\\u673a\",\"pro_id\":\"20\",\"pro_type\":\"vps\",\"name\":\"\\u5e7f\\u5dde\\u6302\\u673a\\u5b9dA\\u578b\\u670d\\u52a1\\u5668\",\"type\":\"create\",\"num\":\"1\",\"config\":\"Intel \\u81f3\\u5f3a2\\u6838CPU\\n1G DDR4 ECC\\n10G SSD\",\"years\":\"1\",\"price\":\"10.00\"}]}', 1591859179, 1591859179);
INSERT INTO `gee_pro_config` VALUES (108, '2020061504314667739', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\smartsite\\\\smartsite\",\"class\":\"smartsite\",\"function\":\"control\",\"data\":{\"plug_id\":\"41\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"1\",\"productid\":\"41\",\"month\":\"12\",\"ftpserver\":\"\",\"ftpuser\":\"\",\"password\":\"\"},\"smartsite_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u5206\\u7ec41\",\"class\":\"\\u667a\\u80fd\\u5efa\\u7ad9\",\"pro_id\":\"41\",\"pro_type\":\"smartsite\",\"name\":\"\\u6d4b\\u8bd5\\u667a\\u80fd\\u5efa\\u7ad9\\u6d4b\\u8bd51-1-2\",\"type\":\"create\",\"num\":\"1\",\"config\":\"1\",\"years\":\"12\",\"month\":\"12\",\"price\":\"4.00\"}]}', 1592209906, 1592209906);
INSERT INTO `gee_pro_config` VALUES (109, '2020081909223637364', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597800156, 1597800156);
INSERT INTO `gee_pro_config` VALUES (110, '2020081903132948574', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":null,\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597821209, 1597821209);
INSERT INTO `gee_pro_config` VALUES (111, '2020081903230660916', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test.com\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597821786, 1597821786);
INSERT INTO `gee_pro_config` VALUES (112, '2020082011582592510', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test2.com\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597895905, 1597895905);
INSERT INTO `gee_pro_config` VALUES (113, '2020082012004358385', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test3.com\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597896043, 1597896043);
INSERT INTO `gee_pro_config` VALUES (114, '2020082001090796133', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test.cn\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597900147, 1597900147);
INSERT INTO `gee_pro_config` VALUES (115, '2020082002283967867', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test.com\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597904919, 1597904919);
INSERT INTO `gee_pro_config` VALUES (116, '2020082002350982305', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test1.com\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597905309, 1597905309);
INSERT INTO `gee_pro_config` VALUES (117, '2020082005005428950', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"activate\",\"data\":{\"year\":\"0.1\",\"productid\":\"43\",\"domain\":\"test3.com\",\"month\":\"1\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"create\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597914054, 1597914054);
INSERT INTO `gee_pro_config` VALUES (118, '2020082109560399612', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"jlvhjgtx\",\"month\":\"1\",\"id\":\"44\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1597974963, 1597974963);
INSERT INTO `gee_pro_config` VALUES (119, '2020082105434917422', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"jlvhjgtx\",\"month\":\"1\",\"id\":\"44\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1598003029, 1598003029);
INSERT INTO `gee_pro_config` VALUES (120, '2020082106033581553', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"jlvhjgtx\",\"month\":\"1\",\"id\":\"44\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1598004215, 1598004215);
INSERT INTO `gee_pro_config` VALUES (121, '2020082201543239763', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"jlvhjgtx\",\"month\":\"1\",\"id\":\"44\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1598075672, 1598075672);
INSERT INTO `gee_pro_config` VALUES (122, '2020082202280525106', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"jlvhjgtx\",\"month\":\"1\",\"id\":\"44\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1598077685, 1598077685);
INSERT INTO `gee_pro_config` VALUES (123, '2020082203441995967', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\host\\\\host\",\"class\":\"host\",\"function\":\"control\",\"data\":{\"plug_id\":\"43\",\"user_id\":25,\"action\":\"renew\",\"data\":{\"year\":\"0.1\",\"hostname\":\"jlvhjgtx\",\"month\":\"1\",\"id\":\"44\"},\"host_type\":null,\"attach\":\"\",\"openX\":\"\"}},\"_pro_info\":[{\"group\":\"direct\\u6d4b\\u8bd5\\u4e3b\\u673a\\u5206\\u7ec4\",\"class\":\"\\u865a\\u62df\\u4e3b\\u673a\",\"pro_id\":\"43\",\"pro_type\":\"host\",\"name\":\"direct\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"type\":\"renew\",\"num\":\"1\",\"config\":\"\\u6d4b\\u8bd5\\u4ea7\\u54c11\",\"years\":\"1\",\"month\":\"1\",\"price\":\"0.01\"}]}', 1598082259, 1598082259);
INSERT INTO `gee_pro_config` VALUES (124, '2020082705173892666', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"26\",\"domainname\":\"kslei212.site\",\"years\":1,\"domainpass\":\"knvqdgnr\",\"dns1\":\"2.2.2.2\",\"dns2\":\"1.1.1.1\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:kslei212.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]}', 1598519858, 1598519858);
INSERT INTO `gee_pro_config` VALUES (125, '2020082705421229839', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"domainRenew\",\"data\":[{\"domainname\":\"wx118.top\",\"years\":1,\"exptme\":null}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"pro_type\":\"domain\",\"num\":1,\"years\":12,\"price\":\"1.00\"}]}', 1598521332, 1598521332);
INSERT INTO `gee_pro_config` VALUES (126, '2020082705433236642', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"domainRenew\",\"data\":[{\"domainname\":\"wx118.top\",\"years\":1,\"exptme\":null}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"pro_type\":\"domain\",\"num\":1,\"years\":12,\"price\":\"1.00\"}]}', 1598521412, 1598521412);
INSERT INTO `gee_pro_config` VALUES (127, '2020082705585492207', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"26\",\"domainname\":\"hdhdge2.site\",\"years\":1,\"domainpass\":\"tay4ppo4\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:hdhdge2.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]}', 1598522334, 1598522334);
INSERT INTO `gee_pro_config` VALUES (128, '2020082803015953596', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"domainRenew\",\"data\":[{\"domainname\":\"wx118.top\",\"years\":1,\"exptme\":null}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:wx118.top\",\"pro_type\":\"domain\",\"num\":1,\"years\":12,\"price\":\"1.00\"}]}', 1598598119, 1598598119);
INSERT INTO `gee_pro_config` VALUES (132, '2020082806092736676', '{\"_create_putData\":{\"plug\":\"\\\\addons\\\\domain\\\\domain\",\"class\":\"domain\",\"function\":\"control\",\"action\":\"createDom\",\"data\":[{\"userid\":\"26\",\"domainname\":\"fsfefsfsf.site\",\"years\":1,\"domainpass\":\"4p7r0v27\",\"dns1\":\"\",\"dns2\":\"\"}]},\"_pro_info\":[{\"class\":\"\\u57df\\u540d\\u670d\\u52a1\",\"config\":\"\\u57df\\u540d:fsfefsfsf.site\",\"num\":1,\"years\":12,\"price\":\"222.00\"}]}', 1598609367, 1598609367);

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
) ENGINE = MyISAM AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_product
-- ----------------------------
INSERT INTO `gee_product` VALUES (3, 2, '郑州多线云服务器-1G', 4, 'CPU：2核心|内存：1GB DDR4 ECC|硬盘(系统+数据)：60G SSD|带宽：独享2M|IP：独立1个', 1, '', '14,13,10,9', 49.00, 157.00, 294.00, 490.00, 980.00, 1470.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"803\",\"machine_room\":null}', NULL, 1559198591, 1559552780);
INSERT INTO `gee_product` VALUES (4, 2, '郑州多线云服务器-2G', 4, 'CPU：2核心|内存：2GB DDR4 ECC|硬盘(系统+数据)：80G SSD|带宽：独享3M|IP：独立1个', 1, '', NULL, 119.00, 357.00, 595.00, 1190.00, 2380.00, 3660.00, NULL, NULL, 2, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"804\",\"machine_room\":null}', NULL, 1559198719, 1559283783);
INSERT INTO `gee_product` VALUES (5, 2, '北京多线云服务器-1G', 5, '双核CPU，1GB DDR4 ECC内存，60G SSD ，独立IP，2M独享', 1, '', NULL, 49.00, 147.00, 245.00, 490.00, 980.00, 1560.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"1661\",\"machine_room\":\"\"}', NULL, 1559198939, 1559198939);
INSERT INTO `gee_product` VALUES (6, 2, '美国云服务器-1G', 6, '美国服务器1GB内存 双核处理器 60G SSD 独享5M带宽独立IP', 1, '', NULL, 50.00, 150.00, 300.00, 600.00, 1200.00, 1800.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"91\",\"machine_room\":\"\"}', NULL, 1559199296, 1559199296);
INSERT INTO `gee_product` VALUES (7, 2, '香港云服务器-1G', 7, '香港云服务器-1G', 1, '', NULL, 50.00, 150.00, 300.00, 600.00, 1200.00, 1800.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"118\",\"machine_room\":\"\"}', NULL, 1559199382, 1559199382);
INSERT INTO `gee_product` VALUES (8, 2, '韩国云服务器-1G', 8, '韩国云服务器-1G', 1, '', NULL, 50.00, 150.00, 300.00, 600.00, 1200.00, 1800.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"38\",\"machine_room\":\"\"}', NULL, 1559199435, 1559199435);
INSERT INTO `gee_product` VALUES (9, 2, '江西挂机宝A型服务器', 9, '江西挂机宝A型服务器', 1, '', NULL, 50.00, 150.00, 300.00, 600.00, 1200.00, 1800.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"973\",\"machine_room\":\"\"}', NULL, 1559199492, 1559199492);
INSERT INTO `gee_product` VALUES (10, 2, '厦门挂机宝A型服务器', 10, '厦门挂机宝A型服务器', 1, '', NULL, 50.00, 150.00, 300.00, 600.00, 1200.00, 1800.00, NULL, NULL, 1, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"1657\",\"machine_room\":\"\"}', NULL, 1559199531, 1559199531);
INSERT INTO `gee_product` VALUES (36, 10, 'easplane高级套餐', 19, 'easplane高级套餐|\neasplane高级套餐', 0, 'esa-p', '', 22.00, 111.00, 22.00, 11.00, 222.00, 3333.00, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 1, 52, '{\"serverip\":\"42.51.68.88\",\"prot\":\"3312\",\"skey\":\"U9KPQcwRPVrT8jJY\"}', NULL, 1586834523, 1589523448);
INSERT INTO `gee_product` VALUES (37, 11, 'dnspod', 20, 'dnspod', 0, 'dns', '', 22.00, 11.00, 33.00, 11.00, 22.00, 222.00, NULL, NULL, 1, 53, '{\"user\":\"2\",\"password\":\"65\",\"product_id\":\"22\",\"machine_room\":\"22\",\"type\":\"1\"}', NULL, 1586936748, 1586936907);
INSERT INTO `gee_product` VALUES (13, 2, '郑州多线云服务器-4G', 4, 'CPU：4核心|内存：4GB DDR4 ECC|系统+数据盘：110G SSD|带宽：独享5M|IP：独立1个', 1, '', NULL, 289.00, 867.00, 1734.00, 2890.00, 5780.00, 8670.00, NULL, NULL, 3, 46, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"805\",\"machine_room\":null}', NULL, 1559274871, 1559283795);
INSERT INTO `gee_product` VALUES (14, 2, '郑州多线云服务器-8G	', 4, 'CPU：4核心|内存：8GB DDR4 ECC|系统+数据盘：130G SSD|带宽：独享5M|IP：独立1个', 1, '', NULL, 499.00, 1497.00, 2994.00, 4990.00, 9980.00, 14970.00, NULL, NULL, 4, 46, '{\"user\":\"geestack\",\"password\":\"Qdca123\",\"product_id\":\"806\",\"machine_room\":null}', NULL, 1559275027, 1559275329);
INSERT INTO `gee_product` VALUES (15, 2, '郑州多线云服务器-16G', 4, 'CPU：8核心|内存：16GB DDR4 ECC|系统+数据盘：150G SSD|带宽：独享8M|IP：独立1个', 1, '', NULL, 899.00, 2697.00, 5394.00, 8990.00, 17980.00, 26970.00, NULL, NULL, 5, 46, '{\"user\":\"geestack\",\"password\":\"Qdca123\",\"product_id\":\"807\",\"machine_room\":null}', NULL, 1559275163, 1559549047);
INSERT INTO `gee_product` VALUES (16, 2, '郑州多线云服务器-32G', 4, 'CPU：8核心|内存：32GB DDR4 ECC|系统+数据盘：200G SSD|带宽：独享8M|IP：独立1个', 1, '', '13,10,9,7', 1399.00, 4197.00, 8394.00, 13990.00, 27980.00, 41970.00, NULL, NULL, 6, 46, '{\"user\":\"geestack\",\"password\":\"Qdca123\",\"product_id\":\"808\",\"machine_room\":null}', NULL, 1559275273, 1559549904);
INSERT INTO `gee_product` VALUES (34, 10, 'easplane基础套餐', 19, 'easplane基础套餐', 0, 'esa-p', '', 21.00, 32.00, 11.00, 222.00, 333.00, 888.00, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 1, 52, '{\"serverip\":\"42.51.68.88\",\"prot\":\"3312\",\"skey\":\"U9KPQcwRPVrT8jJY\"}', NULL, 1586833396, 1589523423);
INSERT INTO `gee_product` VALUES (35, 10, 'easplane初级套餐', 19, 'easplane初级套餐', 0, 'eas-p', '', 12.00, 13.00, 55.00, 66.00, 77.00, 88.00, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 2, 52, '{\"serverip\":\"42.51.68.88\",\"prot\":\"3312\",\"skey\":\"U9KPQcwRPVrT8jJY\"}', NULL, 1586833712, 1589523469);
INSERT INTO `gee_product` VALUES (20, 2, '广州挂机宝A型服务器', 12, 'Intel 至强2核CPU\n1G DDR4 ECC\n10G SSD', 1, '', '16,15,14,13,10', 10.00, 10.00, 101.00, 10.00, 10.00, 100.00, NULL, NULL, 11, 3, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"973\",\"machine_room\":null}', NULL, 1573198813, 1573200161);
INSERT INTO `gee_product` VALUES (21, 2, '香港服务器测试', 12, '', 1, 'hongkong', '20,16,15,14,13,10', 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, NULL, NULL, 1, 3, '{\"user\":\"geestack\",\"password\":\"Qqwa123\",\"product_id\":\"1778\",\"machine_room\":null}', NULL, 1573199128, 1573200172);
INSERT INTO `gee_product` VALUES (22, 8, 'Starter-E3-1230 V2', 13, 'E3-1230 V2 4核心8线程|\n16GB DDR3 ECC内存|\n1000G Enterprise HDD硬盘|\n/29，5个可用IP|\n100Mbps带宽 30M CN2回国|\n免费10GbpsDDOS防护\n', 0, '', '', 1.00, 3.00, 9.00, 18.00, 32.00, 64.00, '{\"month\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"60\",\"6\":\"50\"},\"quarter\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"60\",\"6\":\"50\"},\"semestrale\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"60\",\"6\":\"50\"},\"years\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"60\",\"6\":\"50\"},\"biennium\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"60\",\"6\":\"50\"},\"triennium\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"60\",\"6\":\"50\"}}', '{\"2\":\"1\",\"3\":\"3\",\"4\":\"5\",\"5\":\"7\",\"6\":\"9\"}', 1, 0, NULL, '10,11', 1573639926, 1588829536);
INSERT INTO `gee_product` VALUES (25, 8, 'TEST-E3-1230 V2', 15, '这是测试服务器', 0, '', '', 1.00, 3.00, 9.00, 18.00, 36.00, 62.00, '{\"month\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"55\",\"6\":\"35\"},\"quarter\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"55\",\"6\":\"35\"},\"semestrale\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"55\",\"6\":\"35\"},\"years\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"55\",\"6\":\"35\"},\"biennium\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"55\",\"6\":\"35\"},\"triennium\":{\"2\":\"95\",\"3\":\"85\",\"4\":\"75\",\"5\":\"55\",\"6\":\"35\"}}', '{\"2\":\"1\",\"3\":\"2\",\"4\":\"3\",\"5\":\"4\",\"6\":\"5\"}', 1, 0, NULL, '3,4,5,6,7,8,9,10,11,12', 1574908851, 1588820602);
INSERT INTO `gee_product` VALUES (23, 8, '宿迁快速机型II型', 14, 'kkkkkkkkkk', 0, '', '', 10.00, 22.00, 222.00, 2222.00, 2222.00, 2222.00, NULL, NULL, 2, 0, NULL, '3,4,5,12', 1573719113, 1573787523);
INSERT INTO `gee_product` VALUES (24, 8, '宿迁快速机型I型', 14, 'kkkk', 0, '', 'null', 1.00, 1.00, 1.00, 1.00, 1.00, 12.00, '{\"month\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"quarter\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"semestrale\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"years\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"biennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"triennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"}}', NULL, 3, 0, NULL, '3,4,5,6,7,8,9,10,11', 1573719143, 1590457467);
INSERT INTO `gee_product` VALUES (26, 5, 'cndns', 16, 'CNDNS域名服务', 0, 'Hot', '', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, 1, 47, '{\"username\":\"qdca@qiduo.net\",\"password\":\"qqwa@123\",\"email\":\"qdca@qiduo.net\"}', NULL, 1577094870, 1577169384);
INSERT INTO `gee_product` VALUES (29, 9, 'nokvm测试产品3', 18, 'tcs2.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-', 0, '', '', 0.01, 0.03, 0.06, 0.10, 0.20, 0.30, NULL, NULL, 1, 48, '{\"uri\":\"http:\\/\\/182.61.165.199\",\"token\":\"lcmQ3wiK03mdoBhK2rKwtVOA\",\"eipprice\":\"0.01\",\"cdsprice\":\"0.01\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"snapshoot\":\"2\",\"backups\":\"2\",\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}', NULL, 1579159146, 1582273994);
INSERT INTO `gee_product` VALUES (28, 9, 'nokvm测试产品1', 17, 'tcs1.g1.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-', 0, '', 'null', 0.01, 0.03, 0.06, 0.10, 0.20, 0.30, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 3, 48, '{\"uri\":\"http:\\/\\/182.61.165.199\",\"token\":\"lcmQ3wiK03mdoBhK2rKwtVOA\",\"eipprice\":\"0.01\",\"cdsprice\":\"0.01\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"snapshoot\":\"2\",\"backups\":\"2\",\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}', NULL, 1579082962, 1590459091);
INSERT INTO `gee_product` VALUES (30, 9, 'nokvm测试产品2', 17, 'tcs1.g2.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-', 0, '', '', 0.01, 0.03, 0.06, 0.10, 0.20, 0.30, NULL, NULL, 1, 48, '{\"uri\":\"http:\\/\\/182.61.165.199\",\"token\":\"lcmQ3wiK03mdoBhK2rKwtVOA\",\"eipprice\":\"0.02\",\"cdsprice\":\"0.02\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"snapshoot\":\"2\",\"backups\":\"2\",\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}', NULL, 1579159284, 1582273962);
INSERT INTO `gee_product` VALUES (31, 9, 'nokvm测试产品4', 18, 'tcs2.g2.c1.m4|1|4|Intel Xeon(Skylake) Gold 6148|2.4|1|-', 0, '', 'null', 0.01, 0.03, 0.06, 0.10, 0.20, 0.30, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 2, 48, '{\"uri\":\"http:\\/\\/182.61.165.199\",\"token\":\"lcmQ3wiK03mdoBhK2rKwtVOA\",\"eipprice\":\"0.04\",\"cdsprice\":\"0.04\",\"areas_id\":\"2\",\"nodes_id\":\"7\",\"core\":\"1\",\"cpu_mode\":\"0\",\"memory\":\"4096\",\"sys_disk_mode\":\"writeback\",\"sys_disk_iops\":\"2400\",\"sys_disk_read\":\"2400\",\"sys_disk_write\":\"2400\",\"data_disk_mode\":\"writeback\",\"data_disk_iops\":\"2400\",\"data_disk_read\":\"2400\",\"data_disk_write\":\"2400\",\"snapshoot\":\"2\",\"backups\":\"2\",\"ip_num\":\"1\",\"flow_limit\":null,\"nat_acl_limit\":null,\"nat_web_limit\":null}', NULL, 1579159358, 1590459122);
INSERT INTO `gee_product` VALUES (32, 2, '彩虹数据', 12, '彩虹数据测试机', 0, '1', NULL, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, NULL, NULL, 1, 49, '{\"user\":\"geecp\",\"password\":\"qqwa2211\",\"product_id\":\"80\",\"machine_room\":\"0\"}', NULL, 1579352814, 1579352814);
INSERT INTO `gee_product` VALUES (33, 10, 'easplane测试1', 19, 'easplane测试虚拟主机', 0, 'eas-host', '36,35,34', 2.00, 22.00, 22.00, 22.00, 22.00, 22.00, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 22, 52, '{\"serverip\":\"42.51.68.88\",\"prot\":\"3312\",\"skey\":\"U9KPQcwRPVrT8jJY\"}', NULL, 1582336744, 1589523497);
INSERT INTO `gee_product` VALUES (38, 12, '测试CDN产品1', 21, '这是一个测试cdn产品', 0, '', '', 0.01, 1.00, 3.00, 6.00, 9.00, 18.00, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 1, 54, '{\"serverip\":\"42.51.68.88\",\"prot\":\"3312\",\"skey\":\"U9KPQcwRPVrT8jJY\"}', NULL, 1589771182, 1589771182);
INSERT INTO `gee_product` VALUES (39, 8, '测试', 14, '测试', 0, '', 'null', 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, '{\"month\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"quarter\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"semestrale\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"years\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"biennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100},\"triennium\":{\"2\":100,\"3\":100,\"4\":100,\"5\":100,\"6\":100}}', NULL, 7, 0, NULL, NULL, 1590459754, 1590459754);
INSERT INTO `gee_product` VALUES (40, 13, '智能建站测试1-1-1', 22, '测试1', 0, '', '41', 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, '{\"month\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"quarter\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"semestrale\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"years\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"biennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"triennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"}}', NULL, 1, 55, '{\"uri\":\"http:\\/\\/apitest.nicenic.com\\/\",\"user\":\"testapi\",\"pass\":\"123456\",\"email\":\"test@nicenic.com\",\"category\":\"nicebox\",\"productid\":\"nicebox_2\",\"wwwroot\":\"www\",\"wxapp\":\"2\",\"bdapp\":\"1\"}', NULL, 1590487190, 1590978397);
INSERT INTO `gee_product` VALUES (41, 13, '测试智能建站测试1-1-2', 22, '1', 0, '', '40', 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, '{\"month\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"quarter\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"semestrale\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"years\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"biennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"triennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"}}', NULL, 2, 55, '{\"uri\":\"http:\\/\\/apitest.nicenic.com\\/\",\"user\":\"testapi\",\"pass\":\"123456\",\"email\":\"test@nicenic.com\",\"category\":\"nicebox\",\"productid\":\"nicebox_1\"}', NULL, 1590556706, 1590740796);
INSERT INTO `gee_product` VALUES (42, 13, '正式智能建站1-1-1', 23, '正式智能建站1-1-1', 0, '', 'null', 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, '{\"month\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"quarter\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"semestrale\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"years\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"biennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"triennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"}}', NULL, 1, 55, '{\"uri\":\"http:\\/\\/api.nicenic.com\\/\",\"user\":null,\"pass\":null,\"email\":null,\"category\":\"nicebox\"}', NULL, 1590556774, 1590567742);
INSERT INTO `gee_product` VALUES (43, 10, 'direct测试产品1', 24, '测试产品1', 0, '', 'null', 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, '{\"month\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"quarter\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"semestrale\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"years\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"biennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"triennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"}}', NULL, 1, 61, '{\"serverip\":\"106.12.37.210\",\"host\":\"106.12.37.210\",\"port\":\"2222\",\"username\":\"admin\",\"password\":\"db0ozv-0PpFK45\",\"product_id\":\"newpackage\"}', NULL, 1597739217, 1597895709);
INSERT INTO `gee_product` VALUES (44, 5, '西部数码域名', 25, '西部数码域名', 0, '域名', 'null', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '{\"month\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"quarter\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"semestrale\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"years\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"biennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"},\"triennium\":{\"2\":\"100\",\"3\":\"100\",\"4\":\"100\",\"5\":\"100\",\"6\":\"100\"}}', NULL, 1, 62, '{\"username\":\"imatao\",\"password\":\"zhiyun@123\",\"email\":\"123456@qq.com\"}', NULL, 1598498876, 1598518123);

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
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gee_product_group
-- ----------------------------
INSERT INTO `gee_product_group` VALUES (5, '北京', '北京多线BGP', 2, 2, 1559198797, 1559199184);
INSERT INTO `gee_product_group` VALUES (4, '郑州', '郑州多线BGP', 1, 2, 1559198458, 1559199190);
INSERT INTO `gee_product_group` VALUES (6, '美国', '美国云服务器', 3, 2, 1559198986, 1559198986);
INSERT INTO `gee_product_group` VALUES (7, '香港', '香港云服务器', 4, 2, 1559199034, 1559199034);
INSERT INTO `gee_product_group` VALUES (8, '韩国', '韩国云服务器', 5, 2, 1559199092, 1559199092);
INSERT INTO `gee_product_group` VALUES (9, '江西', '江西挂机宝', 6, 2, 1559199129, 1559199129);
INSERT INTO `gee_product_group` VALUES (10, '厦门', '厦门挂机宝', 7, 2, 1559199171, 1559199171);
INSERT INTO `gee_product_group` VALUES (20, 'DNS', 'DNS解析服务', 1, 11, 1586936699, 1586936699);
INSERT INTO `gee_product_group` VALUES (12, '广州测试', '广州挂机宝测试', 11, 2, 1573198702, 1573198702);
INSERT INTO `gee_product_group` VALUES (13, '物理服务器租用-香港', '香港测试', 1, 8, 1573636806, 1573715984);
INSERT INTO `gee_product_group` VALUES (14, '物理服务器-宿迁', 'kkk', 2, 8, 1573719061, 1573719061);
INSERT INTO `gee_product_group` VALUES (15, '测试服务器-宿迁', 'test', 1, 8, 1574908807, 1590457448);
INSERT INTO `gee_product_group` VALUES (16, 'CNDNS域名', 'CNDNS域名服务', 1, 5, 1577092450, 1577092450);
INSERT INTO `gee_product_group` VALUES (17, 'nokvm测试组1', '测试用', 1, 9, 1579080548, 1579080548);
INSERT INTO `gee_product_group` VALUES (18, 'nokvm测试组2', '测试', 2, 9, 1579159086, 1590459160);
INSERT INTO `gee_product_group` VALUES (19, 'esalpane', 'esalpane', 0, 10, 1582022385, 1586757989);
INSERT INTO `gee_product_group` VALUES (21, '测试CDN', '测试CDN组', 0, 12, 1589770104, 1589770104);
INSERT INTO `gee_product_group` VALUES (22, '测试智能建站分组1', '测试1', 3, 13, 1590486919, 1590645258);
INSERT INTO `gee_product_group` VALUES (23, '正式智能建站测试', '正式', 2, 13, 1590556733, 1590645266);
INSERT INTO `gee_product_group` VALUES (24, 'direct测试主机分组', '测试专用', 0, 10, 1597736060, 1597736060);
INSERT INTO `gee_product_group` VALUES (25, '西部数据', '西部数据', 0, 5, 1598436122, 1598436122);

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
-- Records of gee_rebates_log
-- ----------------------------
INSERT INTO `gee_rebates_log` VALUES (1, '2020050703464618984', 25, 'server', 0.50, 1588841618, 1588841618);
INSERT INTO `gee_rebates_log` VALUES (2, '2020050703464618984', 25, 'server', 0.50, 1588841651, 1588841651);
INSERT INTO `gee_rebates_log` VALUES (3, '2020050704372020308', 31, 'server', 9.00, 1588842133, 1588842133);
INSERT INTO `gee_rebates_log` VALUES (4, '2020050704392841243', 26, 'server', 9.00, 1588842186, 1588842186);
INSERT INTO `gee_rebates_log` VALUES (5, '2020050809243230156', 25, 'server', 0.50, 1588914950, 1588914950);
INSERT INTO `gee_rebates_log` VALUES (6, '2020050809243230156', 25, 'server', 0.50, 1588918650, 1588918650);
INSERT INTO `gee_rebates_log` VALUES (7, '2020050809253893813', 25, 'server', 56.50, 1588920033, 1588920033);
INSERT INTO `gee_rebates_log` VALUES (8, '2020050804443842373', 31, 'server', 0.50, 1588929378, 1588929378);
INSERT INTO `gee_rebates_log` VALUES (9, '2020050804443842373', 25, 'server', 0.50, 1588930549, 1588930549);
INSERT INTO `gee_rebates_log` VALUES (10, '2020050911514085029', 25, 'server', 0.50, 1588996311, 1588996311);
INSERT INTO `gee_rebates_log` VALUES (11, '2020051109290945969', 26, 'server', 32.00, 1589160557, 1589160557);
INSERT INTO `gee_rebates_log` VALUES (12, '2020051109322838952', 26, 'server', 32.00, 1589160754, 1589160754);
INSERT INTO `gee_rebates_log` VALUES (13, '2020051109500719412', 25, 'server', 32.00, 1589161920, 1589161920);
INSERT INTO `gee_rebates_log` VALUES (14, '2020051502385957514', 25, 'cdn', 0.01, 1589524747, 1589524747);
INSERT INTO `gee_rebates_log` VALUES (15, '2020051502393411084', 25, 'cdn', 0.01, 1589524781, 1589524781);
INSERT INTO `gee_rebates_log` VALUES (16, '2020051502400645720', 25, 'cdn', 0.01, 1589524812, 1589524812);
INSERT INTO `gee_rebates_log` VALUES (17, '2020051811115237251', 26, 'cdn', 0.01, 1589771543, 1589771543);
INSERT INTO `gee_rebates_log` VALUES (18, '2020051811145049170', 26, 'cdn', 0.01, 1589771696, 1589771696);
INSERT INTO `gee_rebates_log` VALUES (19, '2020051811425143919', 26, 'server', 0.50, 1589773376, 1589773376);
INSERT INTO `gee_rebates_log` VALUES (20, '2020051801501771177', 25, 'cdn', 0.00, 1589781101, 1589781101);
INSERT INTO `gee_rebates_log` VALUES (21, '2020051905513798194', 25, 'server', 0.50, 1589881930, 1589881930);
INSERT INTO `gee_rebates_log` VALUES (22, '2020052001181068092', 25, 'server', 0.50, 1589954587, 1589954587);
INSERT INTO `gee_rebates_log` VALUES (23, '2020052510485934192', 25, 'vps', 10.00, 1590374968, 1590374968);
INSERT INTO `gee_rebates_log` VALUES (24, '2020052601125451622', 25, 'vps', 1.00, 1590469983, 1590469983);
INSERT INTO `gee_rebates_log` VALUES (25, '2020052802153044868', 25, 'smartsite', 0.00, 1590646539, 1590646539);
INSERT INTO `gee_rebates_log` VALUES (26, '2020052802153044868', 25, 'smartsite', 0.00, 1590647894, 1590647894);
INSERT INTO `gee_rebates_log` VALUES (27, '2020060109405825756', 25, 'smartsite', 0.00, 1590975826, 1590975826);
INSERT INTO `gee_rebates_log` VALUES (28, '2020060110270990778', 25, 'smartsite', 0.00, 1590978436, 1590978436);
INSERT INTO `gee_rebates_log` VALUES (29, '2020060110463067638', 25, 'smartsite', 0.00, 1590979712, 1590979712);
INSERT INTO `gee_rebates_log` VALUES (30, '2020060104231738562', 25, 'smartsite', 0.00, 1591000062, 1591000062);
INSERT INTO `gee_rebates_log` VALUES (31, '2020061010474691106', 25, 'server', 0.00, 1591854984, 1591854984);
INSERT INTO `gee_rebates_log` VALUES (32, '2020061010474691106', 25, 'server', 0.00, 1591854998, 1591854998);
INSERT INTO `gee_rebates_log` VALUES (33, '2020061102035971395', 25, 'server', 0.00, 1591855776, 1591855776);
INSERT INTO `gee_rebates_log` VALUES (34, '2020081010463815871', 25, 'server', 0.00, 1597028063, 1597028063);
INSERT INTO `gee_rebates_log` VALUES (35, '2020081102114254950', 25, 'server', 0.00, 1597127665, 1597127665);
INSERT INTO `gee_rebates_log` VALUES (36, '2020081102114254950', 25, 'server', 0.00, 1597127671, 1597127671);
INSERT INTO `gee_rebates_log` VALUES (37, '2020081102344469110', 25, 'server', 0.00, 1597127695, 1597127695);
INSERT INTO `gee_rebates_log` VALUES (38, '2020081102344469110', 25, 'server', 0.00, 1597127712, 1597127712);
INSERT INTO `gee_rebates_log` VALUES (39, '2020081102344469110', 25, 'server', 0.00, 1597127758, 1597127758);
INSERT INTO `gee_rebates_log` VALUES (40, '2020081102344469110', 25, 'server', 0.00, 1597127765, 1597127765);
INSERT INTO `gee_rebates_log` VALUES (41, '2020081102344469110', 25, 'server', 0.00, 1597140476, 1597140476);
INSERT INTO `gee_rebates_log` VALUES (42, '2020081102344469110', 25, 'server', 0.00, 1597140507, 1597140507);
INSERT INTO `gee_rebates_log` VALUES (43, '2020081102344469110', 25, 'server', 0.00, 1597140563, 1597140563);
INSERT INTO `gee_rebates_log` VALUES (44, '2020081106133044686', 25, 'server', 0.00, 1597140819, 1597140819);
INSERT INTO `gee_rebates_log` VALUES (45, '2020081106133044686', 25, 'server', 0.00, 1597140845, 1597140845);
INSERT INTO `gee_rebates_log` VALUES (46, '2020081303592675142', 25, 'server', 0.00, 1597305575, 1597305575);
INSERT INTO `gee_rebates_log` VALUES (47, '2020081903230660916', 25, 'host', 0.00, 1597895841, 1597895841);
INSERT INTO `gee_rebates_log` VALUES (48, '2020082011582592510', 25, 'host', 0.00, 1597895916, 1597895916);
INSERT INTO `gee_rebates_log` VALUES (49, '2020082012004358385', 25, 'host', 0.00, 1597896053, 1597896053);
INSERT INTO `gee_rebates_log` VALUES (50, '2020082001090796133', 25, 'host', 0.00, 1597902249, 1597902249);
INSERT INTO `gee_rebates_log` VALUES (51, '2020081903132948574', 25, 'host', 0.00, 1597902407, 1597902407);
INSERT INTO `gee_rebates_log` VALUES (52, '2020082002283967867', 25, 'host', 0.00, 1597904931, 1597904931);
INSERT INTO `gee_rebates_log` VALUES (53, '2020082002350982305', 25, 'host', 0.00, 1597905318, 1597905318);
INSERT INTO `gee_rebates_log` VALUES (54, '2020082005005428950', 25, 'host', 0.00, 1597914069, 1597914069);
INSERT INTO `gee_rebates_log` VALUES (55, '2020082109560399612', 25, 'host', 0.00, 1597991618, 1597991618);
INSERT INTO `gee_rebates_log` VALUES (56, '2020082105434917422', 25, 'host', 0.00, 1598003038, 1598003038);
INSERT INTO `gee_rebates_log` VALUES (57, '2020082106033581553', 25, 'host', 0.00, 1598004239, 1598004239);
INSERT INTO `gee_rebates_log` VALUES (58, '2020082201543239763', 25, 'host', 0.00, 1598075682, 1598075682);

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
-- Records of gee_server
-- ----------------------------
INSERT INTO `gee_server` VALUES (52, 14, 39, '{}', 'oe424ptd', NULL, NULL, 'root', '', 1, 1, 25, '', 0, 1597305572, 1597305572, 1599983972);
INSERT INTO `gee_server` VALUES (50, 14, 39, '{}', 'test1111', NULL, NULL, 'root', '', 1, 1, 25, '123', 1, 1591854997, 1591854997, 1594446997);
INSERT INTO `gee_server` VALUES (51, 14, 39, '{}', '99s3r4d0', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1591855776, 1591855776, 1594447776);
INSERT INTO `gee_server` VALUES (12, 14, 23, '{\"CC\":18,\"ddosfree\":20,\"ddospro\":22,\"dk\":\"54,10\"}', 'aqwCJZ48', '192.168.1.151', '192.168.0.18', 'root', '123456', 1, 1, 25, '', 1, 1574836404, 1574836404, 1590561204);
INSERT INTO `gee_server` VALUES (17, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'dhoqIMS7', '64.54.166.24', '192.168.0.13', 'root', '123123', 1, 1, 25, '', 1, 1574923884, 1574925458, 1577515860);
INSERT INTO `gee_server` VALUES (11, 14, 23, '{\"CC\":18,\"ddosfree\":20,\"ddospro\":22,\"dk\":\"54,1\"}', 'klmIOPS3', '192.168.0.123', '192.168.0.19', 'root', '123123', 1, 1, 25, '', 1, 1574326534, 1574326534, 1576918534);
INSERT INTO `gee_server` VALUES (10, 14, 23, '{\"CC\":18,\"ddosfree\":19,\"ddospro\":21,\"dk\":\"54,1\"}', 'bdpqt479', '192.168.0.123', '192.168.0.20', 'root', '1234567', 1, 1, 30, '', 1, 1574321429, 1584928218, 1577808000);
INSERT INTO `gee_server` VALUES (7, 14, 23, '{\"CC\":18,\"ddosfree\":20,\"ddospro\":22,\"dk\":\"54,10\"}', '测试', '192.168.0.2', '192.168.0.21', 'root', '123456789', 1, 1, 25, '测试用', 1, 1574128273, 1574128273, 1587261073);
INSERT INTO `gee_server` VALUES (19, 13, 22, '{\"HDD2\":null,\"cn2\":null}', 'ciHORUX8', '64.51.177.26', '192.168.0.11', 'root', '123456', 1, 1, 25, '12321312321321321321', 1, 1574924926, 1574934835, 1590649680);
INSERT INTO `gee_server` VALUES (20, 13, 22, '{\"HDD2\":null,\"cn2\":null}', 'diluL149', '64.54.177.27', '192.168.0.33', 'root', '123456', 1, 1, 25, '', 3, 1574934732, 1574934732, 1600592725);
INSERT INTO `gee_server` VALUES (21, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'test', '1.1.1.1', '1.1.11.1', 'root', '123456', 1, 1, 25, '测试', 1, 1586312597, 1586312597, 1588904597);
INSERT INTO `gee_server` VALUES (22, 15, 25, '{\"CC\":18,\"ddosfree\":19,\"ddospro\":21,\"ip\":30,\"bandwidth\":36,\"memory\":38,\"HDD1\":44,\"HDD2\":46,\"cn2\":53,\"dk\":54}', 'test001', '1.1.1.1', '1.1.1.3', 'root', '123456', 4, 9, 25, '', 1, 1587024344, 1587024344, 1589616344);
INSERT INTO `gee_server` VALUES (23, 15, 25, '{\"CC\":18,\"ddosfree\":19,\"ddospro\":21,\"ip\":30,\"bandwidth\":36,\"memory\":38,\"HDD1\":44,\"HDD2\":46,\"cn2\":53,\"dk\":54}', 'test001', '1.1.1.1', '1.1.1.2', 'root', '123456', 4, 9, 25, '', 1, 1587024348, 1587024348, 1589616348);
INSERT INTO `gee_server` VALUES (24, 15, 25, '{\"CC\":18,\"ddosfree\":19,\"ddospro\":21,\"ip\":30,\"bandwidth\":36,\"memory\":38,\"HDD1\":44,\"HDD2\":46,\"cn2\":53,\"dk\":54}', 'test001', '1.1.1.1', '1.1.1.1', 'root', '123456', 1, 1, 25, '', 1, 1587024462, 1587024462, 1589616462);
INSERT INTO `gee_server` VALUES (25, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'testqqq', '1.1.1.1', '1.1.1.4', 'root', '123', 1, 1, 25, '', 1, 1587025133, 1587025133, 1589617133);
INSERT INTO `gee_server` VALUES (26, 13, 22, '{\"HDD2\":0,\"cn2\":0}', '26coxa6h', NULL, NULL, 'root', '', 1, 2, 25, '', 1, 1588834344, 1588834344, 1591512744);
INSERT INTO `gee_server` VALUES (48, 13, 22, '{\"HDD2\":0,\"cn2\":0}', '2rvdou5f', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1589881929, 1589881929, 1592560329);
INSERT INTO `gee_server` VALUES (47, 13, 22, '{\"HDD2\":null,\"cn2\":null}', 'cnr0bbos', NULL, NULL, 'root', '', 1, 1, 26, '', 1, 1589161915, 1589161915, 1592451776);
INSERT INTO `gee_server` VALUES (46, 13, 22, '{\"HDD2\":0,\"cn2\":0}', '0fkx9o47', NULL, NULL, 'root', '', 1, 1, 26, '', 0, 1589160753, 1589160753, 1683768753);
INSERT INTO `gee_server` VALUES (45, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'xcafuskx', NULL, NULL, 'root', '', 1, 1, 26, '', 0, 1589160556, 1589160556, 1683768556);
INSERT INTO `gee_server` VALUES (44, 13, 22, '{\"HDD2\":0,\"cn2\":0}', '7ed1sy3u', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1588996308, 1588996308, 1591674708);
INSERT INTO `gee_server` VALUES (43, 13, 22, '{\"HDD2\":null,\"cn2\":null}', '66k7v9pb', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1588920032, 1588920032, 1591608949);
INSERT INTO `gee_server` VALUES (42, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'qtk27ft2', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1588918649, 1588918649, 1591597049);
INSERT INTO `gee_server` VALUES (41, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'qtk27ft2', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1588914948, 1588914948, 1591593348);
INSERT INTO `gee_server` VALUES (40, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'n1orfkeg', NULL, NULL, 'root', '', 1, 1, 26, '', 0, 1588842185, 1588842185, 1620378185);
INSERT INTO `gee_server` VALUES (39, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'th10kh4b', NULL, NULL, 'root', '', 1, 1, 31, '', 0, 1588842132, 1588842132, 1620378132);
INSERT INTO `gee_server` VALUES (49, 13, 22, '{\"HDD2\":0,\"cn2\":0}', 'q4bno83k', NULL, NULL, 'root', '', 1, 1, 25, '', 1, 1589954586, 1589954586, 1592632986);

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
-- Records of gee_server_added
-- ----------------------------
INSERT INTO `gee_server_added` VALUES (3, 'CC', '免费CC防护服务', '', 1, NULL, 1573635011, 1573635011);
INSERT INTO `gee_server_added` VALUES (4, 'ddosfree', 'IP DDOS 防护服务（10G/共享）', '', 2, NULL, 1573635054, 1573635054);
INSERT INTO `gee_server_added` VALUES (5, 'ddospro', 'DDOS防护升级服务', '', 2, NULL, 1573635083, 1573635083);
INSERT INTO `gee_server_added` VALUES (6, 'ip', '增加IP地址数量', '', 2, NULL, 1573635130, 1573635130);
INSERT INTO `gee_server_added` VALUES (7, 'bandwidth', '网络带宽升级服务', '', 2, NULL, 1573635167, 1573635167);
INSERT INTO `gee_server_added` VALUES (8, 'memory', '内存升级服务', '', 2, NULL, 1573635191, 1573635191);
INSERT INTO `gee_server_added` VALUES (9, 'HDD1', '默认硬盘一', '', 2, NULL, 1573635214, 1573635214);
INSERT INTO `gee_server_added` VALUES (10, 'HDD2', '默认硬盘二', '', 1, 2, 1573635229, 1573723620);
INSERT INTO `gee_server_added` VALUES (11, 'cn2', '中国直连CN2线路优化服务', '', 1, 1, 1573635263, 1573723613);
INSERT INTO `gee_server_added` VALUES (12, 'dk', '带宽选择', '', 1, 4, 1573787507, 1587014466);

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
-- Records of gee_server_added_items
-- ----------------------------
INSERT INTO `gee_server_added_items` VALUES (17, '不开启', 3, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573635655, 1573635655);
INSERT INTO `gee_server_added_items` VALUES (18, '开启', 3, 2, 0.00, 0, 0, 0, NULL, NULL, '', 1573635676, 1573635676);
INSERT INTO `gee_server_added_items` VALUES (19, '默认 5 IP DDOS 防护', 4, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573635708, 1573635708);
INSERT INTO `gee_server_added_items` VALUES (20, '升级至 /29 防护服务', 4, 2, 175.00, 380, 1240, 2590, NULL, NULL, '', 1573635749, 1573635757);
INSERT INTO `gee_server_added_items` VALUES (21, '免费 10G DDOS 防护服务', 5, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573635789, 1573635789);
INSERT INTO `gee_server_added_items` VALUES (22, '升级至 20G DDOS 防护服务', 5, 2, 2233.00, 4466, 8822, 12580, NULL, NULL, '', 1573635825, 1573635825);
INSERT INTO `gee_server_added_items` VALUES (23, '升级至 40G DDOS 防护服务', 5, 3, 6573.00, 18750, 34850, 94880, NULL, NULL, '', 1573635865, 1573635865);
INSERT INTO `gee_server_added_items` VALUES (24, '升级至 60G DDOS 防护服务', 5, 4, 8680.00, 24870, 67810, 187650, NULL, NULL, '', 1573635890, 1573635890);
INSERT INTO `gee_server_added_items` VALUES (25, '升级至 90G DDOS 防护服务', 5, 5, 15197.00, 38540, 97580, 27850, NULL, NULL, '', 1573635918, 1573635918);
INSERT INTO `gee_server_added_items` VALUES (26, '升级至 150G DDOS 防护服务', 5, 6, 30387.00, 90975, 278940, 678970, NULL, NULL, '', 1573635946, 1573635946);
INSERT INTO `gee_server_added_items` VALUES (28, '升级至 200G DDOS 防护服务', 5, 7, 52097.00, 157800, 399999, 999999, NULL, NULL, '', 1573635992, 1573635992);
INSERT INTO `gee_server_added_items` VALUES (29, '升级至 500G DDOS 防护服务', 5, 8, 86821.00, 248760, 678540, 1875460, NULL, NULL, '', 1573636019, 1573636019);
INSERT INTO `gee_server_added_items` VALUES (30, '升级至 /29 5个可用IP ', 6, 1, 175.00, 345, 970, 2750, NULL, NULL, '', 1573636087, 1573636087);
INSERT INTO `gee_server_added_items` VALUES (31, '升级至 /28 13个可用IP', 6, 2, 280.00, 680, 1880, 3880, NULL, NULL, '', 1573636110, 1573636110);
INSERT INTO `gee_server_added_items` VALUES (32, '升级至 /27 29个可用IP', 6, 3, 483.00, 1280, 3680, 9280, NULL, NULL, '', 1573636137, 1573636137);
INSERT INTO `gee_server_added_items` VALUES (33, '升级至 /26 61个可用IP', 6, 4, 693.00, 1890, 3890, 9890, NULL, NULL, '', 1573636162, 1573636162);
INSERT INTO `gee_server_added_items` VALUES (34, '升级至 /25 125个可用IP', 6, 5, 833.00, 1633, 3833, 9833, NULL, NULL, '', 1573636192, 1573636192);
INSERT INTO `gee_server_added_items` VALUES (35, '升级至 /24 253个可用IP', 6, 6, 1323.00, 3323, 9323, 27333, NULL, NULL, '', 1573636233, 1573636233);
INSERT INTO `gee_server_added_items` VALUES (36, '免费100M（直连带宽）服务', 7, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573636263, 1573636263);
INSERT INTO `gee_server_added_items` VALUES (37, '升级至30M CN2 GIA 线路带宽', 7, 2, 140.00, 340, 940, 2740, NULL, NULL, '', 1573636294, 1573636294);
INSERT INTO `gee_server_added_items` VALUES (38, '默认 16GB 内存', 8, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573636333, 1573636333);
INSERT INTO `gee_server_added_items` VALUES (39, '升级至 256GB 内存', 8, 2, 9999.00, 27999, 67999, 187999, NULL, NULL, '', 1573636356, 1573636356);
INSERT INTO `gee_server_added_items` VALUES (40, '默认 1TB SATA HDD 硬盘', 9, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573636424, 1574317397);
INSERT INTO `gee_server_added_items` VALUES (41, '升级为 2TB SATA HDD 硬盘', 9, 2, 140.00, 248, 580, 1280, NULL, NULL, '', 1573636450, 1574317389);
INSERT INTO `gee_server_added_items` VALUES (42, '升级为 4TB SATA HDD 硬盘', 9, 3, 245.00, 480, 880, 1880, NULL, NULL, '', 1573636481, 1574317374);
INSERT INTO `gee_server_added_items` VALUES (43, '升级为 6TB SATA HDD 硬盘', 9, 4, 420.00, 880, 1880, 2880, NULL, NULL, '', 1573636501, 1574317351);
INSERT INTO `gee_server_added_items` VALUES (44, '升级为 480G SSD 硬盘', 9, 5, 280.00, 480, 880, 1880, NULL, NULL, '', 1573636527, 1574317338);
INSERT INTO `gee_server_added_items` VALUES (45, '无', 10, 1, 0.00, 0, 0, 0, NULL, NULL, '', 1573636558, 1574317323);
INSERT INTO `gee_server_added_items` VALUES (46, '增加 1TB SATA HDD 硬盘', 10, 2, 112.00, 332, 992, 2792, NULL, NULL, '', 1573636585, 1573636592);
INSERT INTO `gee_server_added_items` VALUES (47, '增加 2TB SATA HDD 硬盘', 10, 3, 140.00, 280, 458, 1400, NULL, NULL, '', 1573636608, 1574317315);
INSERT INTO `gee_server_added_items` VALUES (48, '增加 4TB SATA HDD 硬盘', 10, 4, 245.00, 540, 1240, 2450, NULL, NULL, '', 1573636628, 1574317292);
INSERT INTO `gee_server_added_items` VALUES (49, '增加 6TB SATA HDD 硬盘', 10, 5, 420.00, 840, 1500, 2460, NULL, NULL, '', 1573636653, 1574317267);
INSERT INTO `gee_server_added_items` VALUES (50, '增加 480G SSD 硬盘', 10, 6, 280.00, 480, 880, 1080, NULL, NULL, '', 1573636678, 1574317246);
INSERT INTO `gee_server_added_items` VALUES (51, '增加 2TB SSD 硬盘', 10, 7, 525.00, 1050, 2100, 4200, NULL, NULL, '', 1573636717, 1574317230);
INSERT INTO `gee_server_added_items` VALUES (52, '中国优质（CN2/CU/CM ）线路升级选项 35元/M', 11, 1, 700.00, 1400, 2800, 5600, NULL, NULL, '', 1573636828, 1574317195);
INSERT INTO `gee_server_added_items` VALUES (53, 'CN2/GIA 升级选项 42元/M', 11, 2, 840.00, 1200, 2400, 4200, NULL, NULL, '', 1573636866, 1585020866);
INSERT INTO `gee_server_added_items` VALUES (54, 'M带宽', 12, 1, 10.00, 20, 30, 40, NULL, NULL, '1', 1573787829, 1574307085);

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
-- Records of gee_smartsite
-- ----------------------------
INSERT INTO `gee_smartsite` VALUES (43, 25, 41, 'smartsite_nicenic', 'nicenic', NULL, 51, '1', 1590654609, 1596703785, 1779984000);
INSERT INTO `gee_smartsite` VALUES (44, 25, 41, 'smartsite_nicenic', 'nicenic', NULL, 52, '1', 1590975826, 1596703785, 1654012800);
INSERT INTO `gee_smartsite` VALUES (45, 25, 40, 'smartsite_nicenic', 'nicenic', NULL, 53, '1', 1590978436, 1596703785, 1654012800);

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
-- Records of gee_smartsite_nicenic
-- ----------------------------
INSERT INTO `gee_smartsite_nicenic` VALUES (51, 25, 41, 'test111', 'root', '123456111', NULL, 2721, 'nicebox_1', '1', 1590654609, 1596703785, 1779984000);
INSERT INTO `gee_smartsite_nicenic` VALUES (52, 25, 41, 'test.com', 'root', '123456789', NULL, 2722, 'nicebox_1', '1', 1590975826, 1596703785, 1654012800);
INSERT INTO `gee_smartsite_nicenic` VALUES (53, 25, 40, 'test2.com', 'root', '123456789', NULL, 2723, 'nicebox_2', '1', 1590978436, 1596703785, 1654012800);

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
INSERT INTO `gee_smsapi` VALUES (1, 'CoVbYd9CNdpjXs32YBHFnu6radgbIIGH', '10074', 1585551686, 1585551686);

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
-- Records of gee_ticket
-- ----------------------------
INSERT INTO `gee_ticket` VALUES (2, 25, 1, '2019110504380120856', 'test', '111<img src=\"https://ylsq.cdn.bcebos.com/1572943078292983.png\">', '', 1, '产品咨询', 1572943081, 1572943081);
INSERT INTO `gee_ticket` VALUES (3, 25, 1, '2019110505142016461', 'test3', 'test3', 'https://ylsq.cdn.bcebos.com/1572945257160972.png', 1, '产品咨询', 1572945260, 1572945260);
INSERT INTO `gee_ticket` VALUES (4, 25, 1, '2019110505312427634', '2312', 'codetc.com&amp;lt; http-equiv=\\&quot;refresh\\&quot; content=\\&quot;0;\\&quot;&amp;gt;', '', 1, '产品咨询', 1572946284, 1572946284);
INSERT INTO `gee_ticket` VALUES (5, 25, 1, '2019110505315370246', 'tesadasd', '213213213', 'https://ylsq.cdn.bcebos.com/157294631198743.png', 2, '产品咨询', 1572946313, 1572946313);

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
-- Records of gee_ticket_details
-- ----------------------------
INSERT INTO `gee_ticket_details` VALUES (1, 7, 'test', 'test', '', 25, NULL, 1573018640, 1573018640);
INSERT INTO `gee_ticket_details` VALUES (2, 7, 'test', 'test2', 'https://ylsq.cdn.bcebos.com/1573020883357834.png', 25, NULL, 1573020885, 1573020885);
INSERT INTO `gee_ticket_details` VALUES (7, 7, 'test', '123123', '', 1, 25, 1573027365, 1573027365);
INSERT INTO `gee_ticket_details` VALUES (8, 7, 'test', '123213', 'https://ylsq.cdn.bcebos.com/1573027378568645.png', 1, 25, 1573027380, 1573027380);
INSERT INTO `gee_ticket_details` VALUES (9, 5, 'tesadasd', '你可以看下这个', 'https://ylsq.cdn.bcebos.com/1584941779832032.jpeg', 1, 25, 1584941782, 1584941782);
INSERT INTO `gee_ticket_details` VALUES (10, 5, 'tesadasd', '我看了还是不行', 'https://ylsq.cdn.bcebos.com/1584942667218329.png', 25, 1, 1584942669, 1584942669);

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
-- Records of gee_user
-- ----------------------------
INSERT INTO `gee_user` VALUES (25, 'oE-Yc5yjxUc3R0xdqqPwa7GR6bnE', 'ylsq', '$2y$11$f2FkSxbGhtUdCp3/r.MhMu7FwZV6Iue1KZLlN5zqzOS45wyIbKYlq', '', '13789398868', '975827527@qq.com', '0', '13789398868', '0', '13789398868', '1', 8179.21, 2000.00, 500.00, 0.00, NULL, NULL, NULL, '::1', 6, 31, '6rv69txro7dyxg67832ch52eoncvofvqcp8cru6rs8771qhscsnyau8fbop06q9u', NULL, '1', '詹小松', '430405199707111011', 2, '0', 1598604814, 1558342369, 1598604814);
INSERT INTO `gee_user` VALUES (26, NULL, 'test', '$2y$11$sGDDlAy5w7osRpoFA.47.OdSnwZfin9X2dAXXRtFukEd/M3USrTJG', '', '测验用户', '156@qq.cc', '0', '13333333333', '0', '33333333333333333', '1', 52.98, 0.00, 0.00, NULL, 65.00, NULL, NULL, '::1', 1, 25, NULL, 'test11111', '0', '罗翠华', '431105198411240301', 2, '0', 1593315177, 1558513540, 1593315177);
INSERT INTO `gee_user` VALUES (29, NULL, 'mayaq', '$2y$11$H0CMBOnvRflhBcJm48YCsOVN/PSAps/I9pMFmvuebiVPAc2y0Vk2y', '', '13816141440', 'taofu@qiduo.net', '0', '13816141440', '0', '', '1', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '192.168.0.170', 1, NULL, NULL, NULL, '0', '', '', 0, '0', 1560218828, 1559206317, 1560218828);
INSERT INTO `gee_user` VALUES (30, NULL, 'litao', '$2y$11$oz41OjWjgHIrbW3HoCepAOXnqDPe72AwAS9UDkNdVjTAJjjudZ/Fq', '', '18055256057', 'istrange@qq.com', '0', '18055256057', '0', '18055256057', '1', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '127.0.0.1', 5, NULL, 'vxn6763vq9y03zp4dvaevqgabbug9k4h8pezhk0fo139anyhk5a7aa2fuc0b751a', NULL, '0', '', '', 0, '0', 1559641567, 1559526998, 1588832996);
INSERT INTO `gee_user` VALUES (31, NULL, 'qweqwe', '$2y$11$Q3QWjLW1K7rqWru69KvLo.8OggOQ4zeGozk.NJkqMveksQFypfN7q', '', '13788888888', '4564566@qq.cc', '0', '13788888888', '0', '13798888888888888888888888', '1', 13186.00, 0.00, 0.00, 56.00, NULL, NULL, NULL, '::1', 6, 25, 'vpc0z6u1fvxhdxty96oqschhv32q6qtoq07rxohvqqd77agag1tce0b2vrk4f4g8', NULL, '0', '詹孝松', '430405199012141245', 2, '0', 1588928617, 1576660940, 1588928617);
INSERT INTO `gee_user` VALUES (39, NULL, '13800138000', '$2y$11$l5jheTeQvQ9Nw2fv4dUEl.4kdF5RxmRZWh4xwA9Zskoaq8osQZc4K', NULL, 'demo', 'demo@demo.com', '0', '13800138000', '0', '0557-3311401', '0', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '36.4.73.15', 6, NULL, '9dqban3v4cud71za1e97p6xoosy6x8o1f7o47dn8eac3op0d11k952rhuzqng10q', NULL, '1', '张三', '342225199303265719', 2, '0', 1592282717, 1589771502, 1592282717);
INSERT INTO `gee_user` VALUES (40, NULL, 'test111', '$2y$11$YxDFdKbMvTzOBS5yuPnVtu11BwAwV/D2I.ARlFnxn0VwfMK/Lqqw2', NULL, '13789398861', '975827527@q123.com', '0', '13789398861', '0', NULL, '0', 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, '::1', 1, NULL, NULL, NULL, '0', NULL, NULL, NULL, '0', 1598233308, 1591611007, 1598233308);

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
-- Records of gee_user_enterprise
-- ----------------------------
INSERT INTO `gee_user_enterprise` VALUES (4, 0, '上海七朵测试信息技术有限公司', '21321321321321321', 'https://ylsq.cdn.bcebos.com/1575428074350282.jpeg', 0, 25, 1, 1575426038, 1575426038);
INSERT INTO `gee_user_enterprise` VALUES (5, 0, '宿州七朵测试信息技术有限公司', '321321321321324214', '/uploads/20200506/5eb266a50126e.jpg', 0, 31, 1, 1588749990, 1588749990);

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
-- Records of gee_user_realnames
-- ----------------------------
INSERT INTO `gee_user_realnames` VALUES (1, 25, '1', '1', 0, 0, 0);

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
-- Records of gee_vps
-- ----------------------------
INSERT INTO `gee_vps` VALUES (7, 25, 20, 'vps_zoneidc', 'zoneidc', 2, NULL, 1573540969, 1598602561, 0);

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
-- Records of gee_vps_chuangmeng
-- ----------------------------
INSERT INTO `gee_vps_chuangmeng` VALUES (2, 25, 20, 'a10a026a', NULL, '', NULL, NULL, 1573540969, 1598602561, 0);

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
-- Records of gee_vps_xingwai
-- ----------------------------
INSERT INTO `gee_vps_xingwai` VALUES (2, 25, 20, 'a10a026a', NULL, '', NULL, NULL, 1573540969, 1598602561, 0);

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
-- Records of gee_vps_zoneidc
-- ----------------------------
INSERT INTO `gee_vps_zoneidc` VALUES (2, 25, 20, 'a10a026a', '8a0746cb', '', '111.73.46.70:20111', '正常', 1573540969, 1587896461, 1589611317);

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
