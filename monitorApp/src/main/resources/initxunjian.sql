/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.186_3306
Source Server Version : 50156
Source Host           : 192.168.1.186:3306
Source Database       : newxunjian

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2017-11-20 10:11:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('1', '默认区域', '2017-10-27 18:30:02', '1');
INSERT INTO `t_area` VALUES ('2', 'A', '2017-10-27 18:30:00', '1');
INSERT INTO `t_area` VALUES ('3', 'B', '2017-10-27 18:30:00', '1');
INSERT INTO `t_area` VALUES ('4', 'C', '2017-10-27 18:30:00', '1');
INSERT INTO `t_area` VALUES ('5', 'D', '2017-10-27 18:30:00', '1');
INSERT INTO `t_area` VALUES ('6', 'E', '2017-10-30 17:18:01', '1');
INSERT INTO `t_area` VALUES ('7', 'F', '2017-10-30 17:18:09', '1');
INSERT INTO `t_area` VALUES ('8', '信', '2017-10-30 17:18:21', '1');
INSERT INTO `t_area` VALUES ('9', '手', '2017-10-30 17:18:30', '1');
INSERT INTO `t_area` VALUES ('10', '南', '2017-10-30 18:29:13', '1');
INSERT INTO `t_area` VALUES ('11', '北', '2017-10-30 18:29:19', '1');

-- ----------------------------
-- Table structure for t_cgroup_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_cgroup_apply`;
CREATE TABLE `t_cgroup_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `startGid` bigint(20) DEFAULT NULL,
  `endGid` bigint(20) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cgroup_apply
-- ----------------------------

-- ----------------------------
-- Table structure for t_device_kind
-- ----------------------------
DROP TABLE IF EXISTS `t_device_kind`;
CREATE TABLE `t_device_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_device_kind
-- ----------------------------
INSERT INTO `t_device_kind` VALUES ('1', '生产设备', '0', '生产设备', '2017-10-27 18:28:31', '1');
INSERT INTO `t_device_kind` VALUES ('2', '机械设备', '0', '机械设备', '2017-10-27 18:28:37', '1');
INSERT INTO `t_device_kind` VALUES ('3', '办公设备', '0', '办公设备', '2017-10-27 18:28:47', '1');

-- ----------------------------
-- Table structure for t_equipdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_equipdetail`;
CREATE TABLE `t_equipdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `infoid` bigint(20) DEFAULT NULL,
  `isdel` int(10) DEFAULT NULL COMMENT '是否删除',
  `oneself` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `detailidentify` varchar(255) DEFAULT NULL,
  `dspecific` varchar(255) DEFAULT NULL,
  `dunit` varchar(255) DEFAULT NULL COMMENT '单位',
  `amount` int(10) DEFAULT NULL,
  `detailnote` text COMMENT '备注',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipdetail
-- ----------------------------
INSERT INTO `t_equipdetail` VALUES ('1', '3', '1', '1', 'A区机房', '', '', '', '1', null, null, '2017-10-30 16:26:34', '1');
INSERT INTO `t_equipdetail` VALUES ('2', '4', '1', '1', 'D区机房', 'FJ000178', '', '台', '1', null, null, '2017-10-30 16:28:12', '1');
INSERT INTO `t_equipdetail` VALUES ('3', '6', '0', '1', '电动叉车', 'FJ000170', '', '件', '1', null, null, '2017-10-30 16:30:22', '1');
INSERT INTO `t_equipdetail` VALUES ('4', '13', '1', '1', '手工线三节机', 'JD000123', '', '台', '1', null, null, '2017-10-30 16:33:49', '1');
INSERT INTO `t_equipdetail` VALUES ('5', '14', '1', '1', '三节机-南区', 'JD000118', '', '台', '1', null, null, '2017-10-30 16:34:31', '1');
INSERT INTO `t_equipdetail` VALUES ('6', '15', '1', '1', '三节机-北区', 'JD000117', '', '台', '1', null, null, '2017-10-30 16:35:10', '1');
INSERT INTO `t_equipdetail` VALUES ('7', '16', '1', '1', '卸货区三节机', 'JD000116', '', '台', '1', null, null, '2017-10-30 16:36:09', '1');
INSERT INTO `t_equipdetail` VALUES ('8', '17', '0', null, '双层机-南区', 'JD000120', '', '台', '1', null, null, '2017-10-30 16:37:33', '1');
INSERT INTO `t_equipdetail` VALUES ('9', '18', '0', null, '双层机-北区', 'JD000119', '', '台', '1', null, null, '2017-10-30 16:38:06', '1');
INSERT INTO `t_equipdetail` VALUES ('10', '19', '0', null, '直线机', 'JD000113', '', '台', '1', null, null, '2017-10-30 16:38:59', '1');
INSERT INTO `t_equipdetail` VALUES ('11', '20', '0', null, '爬坡机', 'JD000114', '', '台', '1', null, null, '2017-10-30 16:39:39', '1');
INSERT INTO `t_equipdetail` VALUES ('12', '21', '0', null, '斜带机', 'JD000115', '', '台', '1', null, null, '2017-10-30 16:40:22', '1');
INSERT INTO `t_equipdetail` VALUES ('13', '22', '0', '1', '胶带机F', 'JD000122', '', '件', '1', null, null, '2017-10-30 16:41:31', '1');
INSERT INTO `t_equipdetail` VALUES ('14', '23', '0', '1', '胶带机F', 'JD000121', '', '件', '1', null, null, '2017-10-30 16:41:59', '1');
INSERT INTO `t_equipdetail` VALUES ('15', '29', '0', '1', '地下配电室', 'FJ000127', '', '件', '1', null, null, '2017-10-30 16:43:56', '1');
INSERT INTO `t_equipdetail` VALUES ('16', '30', '0', '1', '滑升门', 'FJ000128', '', '件', '1', null, null, '2017-10-30 16:44:34', '1');
INSERT INTO `t_equipdetail` VALUES ('17', '31', '0', '1', '供包台F7', 'FJ000173', '', '件', '1', null, null, '2017-10-30 16:45:47', '1');
INSERT INTO `t_equipdetail` VALUES ('18', '31', '0', null, '光幕', 'F70001', '1', '件', '1', '', null, '2017-10-30 16:48:48', '1');
INSERT INTO `t_equipdetail` VALUES ('19', '31', '0', null, '变频器', 'F70002', '1', '件', '1', '', null, '2017-10-30 16:49:16', '1');
INSERT INTO `t_equipdetail` VALUES ('20', '31', '0', null, '动态电子秤', 'F70003', '1', '件', '1', '', null, '2017-10-30 16:49:39', '1');
INSERT INTO `t_equipdetail` VALUES ('21', '31', '0', null, '上件PLC控制系统', 'F70004', '1', '件', '1', '', null, '2017-10-30 16:50:28', '1');
INSERT INTO `t_equipdetail` VALUES ('22', '31', '0', null, '皮带', 'F70005', '1', '件', '1', '', null, '2017-10-30 16:50:48', '1');
INSERT INTO `t_equipdetail` VALUES ('23', '32', '0', '1', '供包台E14', 'FJ000172', '', '件', '1', null, null, '2017-10-30 16:51:31', '1');
INSERT INTO `t_equipdetail` VALUES ('24', '32', '0', null, '皮带', 'E140005', '1', '件', '1', '', null, '2017-10-30 16:52:04', '1');
INSERT INTO `t_equipdetail` VALUES ('25', '32', '0', null, '光幕', 'E140001', '1', '件', '1', '', null, '2017-10-30 16:52:33', '1');
INSERT INTO `t_equipdetail` VALUES ('26', '32', '0', null, '动态电子秤', 'E140002', '1', '件', '1', '', null, '2017-10-30 16:52:56', '1');
INSERT INTO `t_equipdetail` VALUES ('27', '32', '0', null, '变频器', 'E140003', '1', '件', '1', '', null, '2017-10-30 16:53:17', '1');
INSERT INTO `t_equipdetail` VALUES ('28', '32', '0', null, '上件PLC控制系统', 'E140004', '1', '1', '1', '', null, '2017-10-30 16:53:59', '1');
INSERT INTO `t_equipdetail` VALUES ('29', '33', '0', '1', '供包台D5-南', 'FJ000167', '', '件', '1', null, null, '2017-10-30 16:54:43', '1');
INSERT INTO `t_equipdetail` VALUES ('30', '33', '0', null, '光幕', 'D50001', '1', '件', '1', '', null, '2017-10-30 16:55:03', '1');
INSERT INTO `t_equipdetail` VALUES ('31', '33', '0', null, '变频器', 'D50002', '1', '件', '1', '', null, '2017-10-30 16:55:20', '1');
INSERT INTO `t_equipdetail` VALUES ('32', '33', '0', null, '动态电子秤', 'D50003', '1', '件', '1', '', null, '2017-10-30 16:55:56', '1');
INSERT INTO `t_equipdetail` VALUES ('33', '33', '0', null, '上件PLC控制系统', 'D50004', '1', '件', '1', '', null, '2017-10-30 16:56:21', '1');
INSERT INTO `t_equipdetail` VALUES ('34', '33', '0', null, '皮带', 'D50005', '1', '件', '1', '', null, '2017-10-30 16:56:39', '1');
INSERT INTO `t_equipdetail` VALUES ('35', '34', '0', '1', '供包台D4-南', 'FJ000166', '', '件', '1', null, null, '2017-10-30 16:57:12', '1');
INSERT INTO `t_equipdetail` VALUES ('36', '35', '0', '1', '供包台D3-南', 'FJ000165', '', '件', '1', null, null, '2017-10-30 16:57:33', '1');
INSERT INTO `t_equipdetail` VALUES ('37', '36', '0', '1', '供包台D2-南', 'FJ000164', '', '件', '1', null, null, '2017-10-30 16:57:54', '1');
INSERT INTO `t_equipdetail` VALUES ('38', '37', '0', '1', '供包台D1-南', 'FJ000163', '', '件', '1', null, null, '2017-10-30 16:58:15', '1');
INSERT INTO `t_equipdetail` VALUES ('39', '38', '0', '1', '供包台D3', 'FJ000162', '', '件', '1', null, null, '2017-10-30 16:58:36', '1');
INSERT INTO `t_equipdetail` VALUES ('40', '39', '0', '1', '供包台D2', 'FJ000161', '', '件', '1', null, null, '2017-10-30 16:58:54', '1');
INSERT INTO `t_equipdetail` VALUES ('41', '40', '0', '1', '供包台D1', 'FJ000160', '', '件', '1', null, null, '2017-10-30 16:59:16', '1');
INSERT INTO `t_equipdetail` VALUES ('42', '41', '0', '1', '供包台C5-北', 'FJ000159', '', '件', '1', null, null, '2017-10-30 16:59:36', '1');
INSERT INTO `t_equipdetail` VALUES ('43', '42', '0', '1', '供包台C4-北', 'FJ000158', '', '件', '1', null, null, '2017-10-30 16:59:54', '1');
INSERT INTO `t_equipdetail` VALUES ('44', '43', '0', '1', '供包台C3-北', 'FJ000157', '', '件', '1', null, null, '2017-10-30 17:04:05', '1');
INSERT INTO `t_equipdetail` VALUES ('45', '44', '0', '1', '供包台C2-北', 'FJ000156', '', '件', '1', null, null, '2017-10-30 17:04:28', '1');
INSERT INTO `t_equipdetail` VALUES ('46', '45', '0', '1', '供包台C1-北', 'FJ000155', '', '件', '1', null, null, '2017-10-30 17:04:53', '1');
INSERT INTO `t_equipdetail` VALUES ('47', '46', '0', '1', '供包台C6', 'FJ000154', '', '件', '1', null, null, '2017-10-30 17:05:16', '1');
INSERT INTO `t_equipdetail` VALUES ('48', '47', '0', '1', '供包台C5', 'FJ000153', '', '件', '1', null, null, '2017-10-30 17:05:38', '1');
INSERT INTO `t_equipdetail` VALUES ('49', '48', '0', '1', '供包台C4', 'FJ000152', '', '件', '1', null, null, '2017-10-30 17:05:58', '1');
INSERT INTO `t_equipdetail` VALUES ('50', '49', '0', '1', '供包台B10-北', 'FJ000151', '', '件', '1', null, null, '2017-10-30 17:06:15', '1');
INSERT INTO `t_equipdetail` VALUES ('51', '50', '0', '1', '供包台B9-北', 'FJ000150', '', '件', '1', null, null, '2017-10-30 17:06:32', '1');
INSERT INTO `t_equipdetail` VALUES ('52', '51', '0', '1', '供包台B8-北', 'FJ000149', '', '件', '1', null, null, '2017-10-30 17:06:50', '1');
INSERT INTO `t_equipdetail` VALUES ('53', '52', '0', '1', '供包台B7-北', 'FJ000148', '', '件', '1', null, null, '2017-10-30 17:07:09', '1');
INSERT INTO `t_equipdetail` VALUES ('54', '53', '0', '1', '供包台B6-北', 'FJ000147', '', '件', '1', null, null, '2017-10-30 17:07:27', '1');
INSERT INTO `t_equipdetail` VALUES ('55', '54', '0', '1', '供包台B10', 'FJ000146', '', '件', '1', null, null, '2017-10-30 17:07:49', '1');
INSERT INTO `t_equipdetail` VALUES ('56', '55', '0', '1', '供包台B9', 'FJ000145', '', '件', '1', null, null, '2017-10-30 17:08:11', '1');
INSERT INTO `t_equipdetail` VALUES ('57', '56', '0', '1', '供包台B8', 'FJ000144', '', '件', '1', null, null, '2017-10-30 17:08:32', '1');
INSERT INTO `t_equipdetail` VALUES ('58', '57', '0', '1', '供包台A10-南', 'FJ000143', '', '件', '1', null, null, '2017-10-30 17:08:54', '1');
INSERT INTO `t_equipdetail` VALUES ('59', '58', '0', '1', '供包台A9-南', 'FJ000142', '', '件', '1', null, null, '2017-10-30 17:09:12', '1');
INSERT INTO `t_equipdetail` VALUES ('60', '59', '0', '1', '供包台A8-南', 'FJ000141', '', '件', '1', null, null, '2017-10-30 17:09:31', '1');
INSERT INTO `t_equipdetail` VALUES ('61', '60', '0', '1', '供包台A7-南', 'FJ000140', '', '件', '1', null, null, '2017-10-30 17:09:56', '1');
INSERT INTO `t_equipdetail` VALUES ('62', '61', '0', '1', '供包台A6-南', 'FJ000139', '', '件', '1', null, null, '2017-10-30 17:10:14', '1');
INSERT INTO `t_equipdetail` VALUES ('63', '62', '0', '1', '供包台A13', 'FJ000138', '', '件', '1', null, null, '2017-10-30 17:10:32', '1');
INSERT INTO `t_equipdetail` VALUES ('64', '63', '0', '1', '供包台A12', 'FJ000137', '', '件', '1', null, null, '2017-10-30 17:10:50', '1');
INSERT INTO `t_equipdetail` VALUES ('65', '64', '0', '1', '供包台A11', 'FJ000136', '', '件', '1', null, null, '2017-10-30 17:11:08', '1');
INSERT INTO `t_equipdetail` VALUES ('66', '65', '0', '1', '直线机JA02', 'JA02', '', '件', '1', null, null, '2017-10-30 17:33:39', '1');
INSERT INTO `t_equipdetail` VALUES ('67', '66', '0', null, '直线机JA03', 'JA03', '', '件', '1', null, null, '2017-10-30 17:33:58', '1');
INSERT INTO `t_equipdetail` VALUES ('68', '67', '0', '1', '直线机JA04', 'JA04', '', '件', '1', null, null, '2017-10-30 17:34:23', '1');
INSERT INTO `t_equipdetail` VALUES ('69', '68', '0', '1', '直线机JA07', 'JA07', '', '件', '1', null, null, '2017-10-30 17:34:51', '1');
INSERT INTO `t_equipdetail` VALUES ('70', '69', '0', '1', '直线机JA08', 'JA08', '', '件', '1', null, null, '2017-10-30 17:35:11', '1');
INSERT INTO `t_equipdetail` VALUES ('71', '70', '0', '1', '直线机JA10', 'JA10', '', '件', '1', null, null, '2017-10-30 17:35:31', '1');
INSERT INTO `t_equipdetail` VALUES ('72', '71', '0', '1', '直线机JA13', 'JA13', '', '件', '1', null, null, '2017-10-30 17:35:49', '1');
INSERT INTO `t_equipdetail` VALUES ('73', '72', '0', '1', '直线机JA15', 'JA15', '', '件', '1', null, null, '2017-10-30 17:36:06', '1');
INSERT INTO `t_equipdetail` VALUES ('74', '73', '0', '1', '直线机JA50', 'JA50', '', '件', '1', null, null, '2017-10-30 17:36:25', '1');
INSERT INTO `t_equipdetail` VALUES ('75', '74', '0', '1', '直线机JA51', 'JA51', '', '件', '1', null, null, '2017-10-30 17:36:42', '1');
INSERT INTO `t_equipdetail` VALUES ('76', '75', '0', '1', '直线机JA52', 'JA52', '', '件', '1', null, null, '2017-10-30 17:37:00', '1');
INSERT INTO `t_equipdetail` VALUES ('77', '76', '0', '1', '爬坡机JA06', 'JA06', '', '台', '1', null, null, '2017-10-30 17:37:55', '1');
INSERT INTO `t_equipdetail` VALUES ('78', '77', '0', '1', '爬坡机JA09', 'JA09', '', '台', '1', null, null, '2017-10-30 17:38:13', '1');
INSERT INTO `t_equipdetail` VALUES ('79', '78', '0', '1', '爬坡机JA11', 'JA11', '', '台', '1', null, null, '2017-10-30 17:38:34', '1');
INSERT INTO `t_equipdetail` VALUES ('80', '79', '0', '1', '爬坡机JA12', 'JA12', '', '台', '1', null, null, '2017-10-30 17:38:55', '1');
INSERT INTO `t_equipdetail` VALUES ('81', '80', '0', null, 'JA14', 'JA14', '', '台', '1', null, null, '2017-10-30 17:39:13', '1');
INSERT INTO `t_equipdetail` VALUES ('82', '81', '0', '1', '斜带机JA70', 'JA70', '', '台', '1', null, null, '2017-10-30 17:40:01', '1');
INSERT INTO `t_equipdetail` VALUES ('83', '83', '0', '1', '卸货区三节机17-1', '17-1', '', '台', '1', null, null, '2017-10-30 17:42:16', '1');
INSERT INTO `t_equipdetail` VALUES ('84', '84', '0', '1', '卸货区三节机17-2', '17-2', '', '台', '1', null, null, '2017-10-30 17:42:33', '1');
INSERT INTO `t_equipdetail` VALUES ('85', '85', '0', '1', '卸货区三节机18', '18', '', '台', '1', null, null, '2017-10-30 17:42:49', '1');
INSERT INTO `t_equipdetail` VALUES ('86', '86', '0', '1', '直线机JB01', 'JB01', '', '台', '1', null, null, '2017-10-30 17:43:37', '1');
INSERT INTO `t_equipdetail` VALUES ('87', '87', '0', '1', '直线机JB02', 'JB02', '', '台', '1', null, null, '2017-10-30 17:48:12', '1');
INSERT INTO `t_equipdetail` VALUES ('88', '88', '0', '1', '直线机JB04', 'JB04', '', '台', '1', null, null, '2017-10-30 17:48:33', '1');
INSERT INTO `t_equipdetail` VALUES ('89', '89', '0', '1', '直线机JB05', 'JB05', '', '台', '1', null, null, '2017-10-30 17:48:53', '1');
INSERT INTO `t_equipdetail` VALUES ('90', '90', '0', '1', '直线机JB08', 'JB08', '', '台', '1', null, null, '2017-10-30 17:49:15', '1');
INSERT INTO `t_equipdetail` VALUES ('91', '91', '0', '1', '直线机JB09', 'JB09', '', '台', '1', null, null, '2017-10-30 17:49:34', '1');
INSERT INTO `t_equipdetail` VALUES ('92', '92', '0', '1', '直线机JB12', 'JB12', '', '台', '1', null, null, '2017-10-30 17:50:12', '1');
INSERT INTO `t_equipdetail` VALUES ('93', '93', '0', '1', '直线机JB14', 'JB12', '', '台', '1', null, null, '2017-10-30 17:50:32', '1');
INSERT INTO `t_equipdetail` VALUES ('94', '94', '0', '1', '直线机JB50', 'JB50', '', '台', '1', null, null, '2017-10-30 17:51:01', '1');
INSERT INTO `t_equipdetail` VALUES ('95', '95', '0', '1', '直线机JB51', 'JB51', '', '台', '1', null, null, '2017-10-30 17:51:26', '1');
INSERT INTO `t_equipdetail` VALUES ('96', '96', '0', '1', '直线机JB52', 'JB52', '', '台', '1', null, null, '2017-10-30 17:51:43', '1');
INSERT INTO `t_equipdetail` VALUES ('97', '97', '0', '1', '爬坡机JB03', 'JB03', '', '台', '1', null, null, '2017-10-30 17:52:31', '1');
INSERT INTO `t_equipdetail` VALUES ('98', '98', '0', '1', '爬坡机JB06', 'JB06', '', '台', '1', null, null, '2017-10-30 17:53:00', '1');
INSERT INTO `t_equipdetail` VALUES ('99', '99', '0', '1', '爬坡机JB07', 'JB07', '', '台', '1', null, null, '2017-10-30 17:53:18', '1');
INSERT INTO `t_equipdetail` VALUES ('100', '100', '0', '1', '爬坡机JB10', 'JB10', '', '台', '1', null, null, '2017-10-30 17:53:41', '1');
INSERT INTO `t_equipdetail` VALUES ('101', '101', '0', '1', '爬坡机JB11', 'JB11', '', '台', '1', null, null, '2017-10-30 17:54:09', '1');
INSERT INTO `t_equipdetail` VALUES ('102', '102', '0', '1', '爬坡机JB13', 'JB13', '', '台', '1', null, null, '2017-10-30 17:54:28', '1');
INSERT INTO `t_equipdetail` VALUES ('103', '103', '0', '1', '斜带机JB60', 'JB60', '', '台', '1', null, null, '2017-10-30 17:55:07', '1');
INSERT INTO `t_equipdetail` VALUES ('104', '104', '0', '1', '斜带机JA70', 'JB70', '', '台', '1', null, null, '2017-10-30 17:55:31', '1');
INSERT INTO `t_equipdetail` VALUES ('105', '105', '0', '1', '卸货区三节机51', '51', '', '台', '1', null, null, '2017-10-30 17:56:09', '1');
INSERT INTO `t_equipdetail` VALUES ('106', '106', '0', '1', '卸货区三节机52', '52', '', '台', '1', null, null, '2017-10-30 17:56:31', '1');
INSERT INTO `t_equipdetail` VALUES ('107', '107', '0', '1', '卸货区三节机53', '53', '', '台', '1', null, null, '2017-10-30 17:56:48', '1');
INSERT INTO `t_equipdetail` VALUES ('108', '108', '0', '1', '直线机JB15', 'JB15', '', '台', '1', null, null, '2017-10-30 17:57:47', '1');
INSERT INTO `t_equipdetail` VALUES ('109', '109', '0', '1', '直线机JC01', 'JC01', '', '台', '1', null, null, '2017-10-30 17:58:17', '1');
INSERT INTO `t_equipdetail` VALUES ('110', '110', '0', '1', '直线机JC02', 'JC02', '', '台', '1', null, null, '2017-10-30 17:58:41', '1');
INSERT INTO `t_equipdetail` VALUES ('111', '111', '0', '1', '直线机JC04', 'JC04', '', '台', '1', null, null, '2017-10-30 17:58:56', '1');
INSERT INTO `t_equipdetail` VALUES ('112', '112', '0', '1', '直线机JC05', 'JC05', '', '台', '1', null, null, '2017-10-30 17:59:23', '1');
INSERT INTO `t_equipdetail` VALUES ('113', '113', '0', '1', '直线机JC07', 'JC05', '', '台', '1', null, null, '2017-10-30 17:59:44', '1');
INSERT INTO `t_equipdetail` VALUES ('114', '114', '0', '1', '直线机JC08', 'JC08', '', '台', '1', null, null, '2017-10-30 18:00:08', '1');
INSERT INTO `t_equipdetail` VALUES ('115', '115', '0', '1', '直线机JC10', 'JC10', '', '台', '1', null, null, '2017-10-30 18:00:27', '1');
INSERT INTO `t_equipdetail` VALUES ('116', '116', '0', '1', '直线机JC13', 'JC13', '', '台', '1', null, null, '2017-10-30 18:00:47', '1');
INSERT INTO `t_equipdetail` VALUES ('117', '117', '0', '1', '直线机JC15', 'JC15', '', '台', '1', null, null, '2017-10-30 18:01:05', '1');
INSERT INTO `t_equipdetail` VALUES ('118', '118', '0', '1', '直线机JC50', 'JC50', '', '台', '1', null, null, '2017-10-30 18:01:30', '1');
INSERT INTO `t_equipdetail` VALUES ('119', '119', '0', '1', '直线机JC51', 'JC51', '', '台', '1', null, null, '2017-10-30 18:01:49', '1');
INSERT INTO `t_equipdetail` VALUES ('120', '120', '0', '1', '直线机JC52', 'JC52', '', '台', '1', null, null, '2017-10-30 18:02:08', '1');
INSERT INTO `t_equipdetail` VALUES ('121', '121', '0', '1', '爬坡机JC03', 'JC03', '', '台', '1', null, null, '2017-10-30 18:02:44', '1');
INSERT INTO `t_equipdetail` VALUES ('122', '122', '0', '1', '爬坡机JC06', 'JC06', '', '台', '1', null, null, '2017-10-30 18:03:18', '1');
INSERT INTO `t_equipdetail` VALUES ('123', '123', '0', '1', '爬坡机JC09', 'JC09', '', '台', '1', null, null, '2017-10-30 18:03:38', '1');
INSERT INTO `t_equipdetail` VALUES ('124', '124', '0', '1', '爬坡机JC11', 'JC11', '', '台', '1', null, null, '2017-10-30 18:03:54', '1');
INSERT INTO `t_equipdetail` VALUES ('125', '125', '0', '1', '爬坡机JC12', 'JC12', '', '台', '1', null, null, '2017-10-30 18:04:16', '1');
INSERT INTO `t_equipdetail` VALUES ('126', '126', '0', '1', '爬坡机JC14', 'JC14', '', '台', '1', null, null, '2017-10-30 18:04:34', '1');
INSERT INTO `t_equipdetail` VALUES ('127', '127', '0', '1', '斜带机JC60', 'JC60', '', '台', '1', null, null, '2017-10-30 18:05:20', '1');
INSERT INTO `t_equipdetail` VALUES ('128', '128', '0', '1', '斜带机JB70', 'JC70', '', '台', '1', null, null, '2017-10-30 18:05:39', '1');
INSERT INTO `t_equipdetail` VALUES ('129', '129', '0', '1', '卸货区三节机39', '39', '', '台', '1', null, null, '2017-10-30 18:06:11', '1');
INSERT INTO `t_equipdetail` VALUES ('130', '130', '0', '1', '卸货区三节机39-4', '39-4', '', '台', '1', null, null, '2017-10-30 18:06:34', '1');
INSERT INTO `t_equipdetail` VALUES ('131', '131', '0', '1', '卸货区三节机40', '40', '', '台', '1', null, null, '2017-10-30 18:06:58', '1');
INSERT INTO `t_equipdetail` VALUES ('132', '132', '0', '1', '卸货区三节机35', '35', '', '台', '1', null, null, '2017-10-30 18:07:25', '1');
INSERT INTO `t_equipdetail` VALUES ('133', '133', '0', '1', '卸货区三节机36', '36', '', '台', '1', null, null, '2017-10-30 18:07:46', '1');
INSERT INTO `t_equipdetail` VALUES ('134', '134', '0', '1', '卸货区三节机37', '37', '', '台', '1', null, null, '2017-10-30 18:08:09', '1');
INSERT INTO `t_equipdetail` VALUES ('135', '135', '0', '1', '斜带机JD60', 'JD60', '', '台', '1', null, null, '2017-10-30 18:08:59', '1');
INSERT INTO `t_equipdetail` VALUES ('136', '136', '0', '1', '斜带机JD70', 'JD70', '', '台', '1', null, null, '2017-10-30 18:09:14', '1');
INSERT INTO `t_equipdetail` VALUES ('137', '137', '0', '1', '爬坡机JD03', 'JD03', '', '台', '1', null, null, '2017-10-30 18:09:52', '1');
INSERT INTO `t_equipdetail` VALUES ('138', '138', '0', '1', '爬坡机JD06', 'JD05', '', '台', '1', null, null, '2017-10-30 18:10:13', '1');
INSERT INTO `t_equipdetail` VALUES ('139', '139', '0', '1', '爬坡机JD07', 'JD07', '', '台', '1', null, null, '2017-10-30 18:10:39', '1');
INSERT INTO `t_equipdetail` VALUES ('140', '140', '0', '1', '爬坡机JD10', 'JD10', '', '台', '1', null, null, '2017-10-30 18:11:02', '1');
INSERT INTO `t_equipdetail` VALUES ('141', '141', '0', '1', '爬坡机JD11', 'JD11', '', '台', '1', null, null, '2017-10-30 18:11:21', '1');
INSERT INTO `t_equipdetail` VALUES ('142', '142', '0', '1', '爬坡机JD13', 'JD13', '', '台', '1', null, null, '2017-10-30 18:11:37', '1');
INSERT INTO `t_equipdetail` VALUES ('143', '143', '0', '1', '直线机JD01', 'JD01', '', '台', '1', null, null, '2017-10-30 18:12:09', '1');
INSERT INTO `t_equipdetail` VALUES ('144', '144', '0', '1', '直线机JD02', 'JD02', '', '台', '1', null, null, '2017-10-30 18:12:34', '1');
INSERT INTO `t_equipdetail` VALUES ('145', '145', '0', '1', '直线机JD04', 'JD04', '', '台', '1', null, null, '2017-10-30 18:12:50', '1');
INSERT INTO `t_equipdetail` VALUES ('146', '146', '0', '1', '直线机JD05', 'JD05', '', '台', '1', null, null, '2017-10-30 18:13:08', '1');
INSERT INTO `t_equipdetail` VALUES ('147', '147', '0', '1', '直线机JD08', 'JD08', '', '台', '1', null, null, '2017-10-30 18:13:25', '1');
INSERT INTO `t_equipdetail` VALUES ('148', '148', '0', '1', '直线机JD09', 'JD09', '', '台', '1', null, null, '2017-10-30 18:13:45', '1');
INSERT INTO `t_equipdetail` VALUES ('149', '149', '0', '1', '直线机JD12', 'JD12', '', '台', '1', null, null, '2017-10-30 18:14:01', '1');
INSERT INTO `t_equipdetail` VALUES ('150', '150', '0', '1', '直线机JD14', 'JD14', '', '台', '1', null, null, '2017-10-30 18:14:18', '1');
INSERT INTO `t_equipdetail` VALUES ('151', '151', '0', '1', '直线机JD50', 'JD50', '', '台', '1', null, null, '2017-10-30 18:14:37', '1');
INSERT INTO `t_equipdetail` VALUES ('152', '152', '0', '1', '直线机JD51', 'JD51', '', '台', '1', null, null, '2017-10-30 18:14:56', '1');
INSERT INTO `t_equipdetail` VALUES ('153', '153', '0', '1', '直线机JD52', 'JD52', '', '台', '1', null, null, '2017-10-30 18:15:15', '1');
INSERT INTO `t_equipdetail` VALUES ('154', '155', '0', '1', '胶带传输机JE01', 'JE01', '', '台', '1', null, null, '2017-10-30 18:19:01', '1');
INSERT INTO `t_equipdetail` VALUES ('155', '156', '0', '1', '胶带传输机JE02', 'JE02', '', '台', '1', null, null, '2017-10-30 18:19:31', '1');
INSERT INTO `t_equipdetail` VALUES ('156', '157', '0', '1', '胶带传输机JE03', 'JE03', '', '台', '1', null, null, '2017-10-30 18:19:48', '1');
INSERT INTO `t_equipdetail` VALUES ('157', '158', '0', null, 'JE04', 'JE04', '', '台', '1', null, null, '2017-10-30 18:20:06', '1');
INSERT INTO `t_equipdetail` VALUES ('158', '159', '0', '1', '胶带传输机JE05', 'JE05', '', '台', '1', null, null, '2017-10-30 18:20:36', '1');
INSERT INTO `t_equipdetail` VALUES ('159', '160', '0', '1', '胶带传输机JE06', 'JE06', '', '台', '1', null, null, '2017-10-30 18:20:52', '1');
INSERT INTO `t_equipdetail` VALUES ('160', '161', '0', '1', '胶带传输机JE07', 'JE07', '', '台', '1', null, null, '2017-10-30 18:21:09', '1');
INSERT INTO `t_equipdetail` VALUES ('161', '162', '0', '1', '胶带传输机JE08', 'JE08', '', '台', '1', null, null, '2017-10-30 18:21:26', '1');
INSERT INTO `t_equipdetail` VALUES ('162', '163', '0', '1', '胶带传输机JE09', 'JE09', '', '台', '1', null, null, '2017-10-30 18:21:42', '1');
INSERT INTO `t_equipdetail` VALUES ('163', '164', '0', '1', '胶带传输机JE10', 'JE10', '', '台', '1', null, null, '2017-10-30 18:22:01', '1');
INSERT INTO `t_equipdetail` VALUES ('164', '165', '0', '1', '胶带传输机JE11', 'JE11', '', '台', '1', null, null, '2017-10-30 18:22:20', '1');
INSERT INTO `t_equipdetail` VALUES ('165', '166', '0', '1', '胶带传输机JE12', 'JE12', '', '台', '1', null, null, '2017-10-30 18:22:39', '1');
INSERT INTO `t_equipdetail` VALUES ('166', '167', '0', '1', '胶带传输机JE13', 'JE13', '', '台', '1', null, null, '2017-10-30 18:23:00', '1');
INSERT INTO `t_equipdetail` VALUES ('167', '168', '0', '1', '胶带传输机JF13', 'JF13', '', '台', '1', null, null, '2017-10-30 18:23:39', '1');
INSERT INTO `t_equipdetail` VALUES ('168', '169', '0', '1', '胶带传输机JF12', 'JF12', '', '台', '1', null, null, '2017-10-30 18:24:00', '1');
INSERT INTO `t_equipdetail` VALUES ('169', '170', '0', '1', '胶带传输机JF11', 'JF11', '', '台', '1', null, null, '2017-10-30 18:24:18', '1');
INSERT INTO `t_equipdetail` VALUES ('170', '171', '0', '1', '胶带传输机JF10', 'JF10', '', '台', '1', null, null, '2017-10-30 18:24:36', '1');
INSERT INTO `t_equipdetail` VALUES ('171', '172', '0', '1', '胶带传输机JF09', 'JF09', '', '台', '1', null, null, '2017-10-30 18:24:56', '1');
INSERT INTO `t_equipdetail` VALUES ('172', '173', '0', '1', '胶带传输机JF08', 'JF08', '', '台', '1', null, null, '2017-10-30 18:25:13', '1');
INSERT INTO `t_equipdetail` VALUES ('173', '174', '0', '1', '胶带传输机JF07', 'JF07', '', '台', '1', null, null, '2017-10-30 18:25:29', '1');
INSERT INTO `t_equipdetail` VALUES ('174', '175', '0', '1', '胶带传输机JF06', 'JF06', '', '台', '1', null, null, '2017-10-30 18:25:46', '1');
INSERT INTO `t_equipdetail` VALUES ('175', '176', '0', '1', '胶带传输机JF05', 'JF05', '', '台', '1', null, null, '2017-10-30 18:26:03', '1');
INSERT INTO `t_equipdetail` VALUES ('176', '177', '0', '1', '胶带传输机JF04', 'JF04', '', '台', '1', null, null, '2017-10-30 18:26:21', '1');
INSERT INTO `t_equipdetail` VALUES ('177', '178', '0', '1', '胶带传输机JF03', 'JF03', '', '台', '1', null, null, '2017-10-30 18:26:38', '1');
INSERT INTO `t_equipdetail` VALUES ('178', '179', '0', '1', '胶带传输机JF02', 'JF02', '', '台', '1', null, null, '2017-10-30 18:26:54', '1');
INSERT INTO `t_equipdetail` VALUES ('179', '180', '0', '1', '胶带传输机JF01', 'JF01', '', '台', '1', null, null, '2017-10-30 18:27:11', '1');
INSERT INTO `t_equipdetail` VALUES ('180', '181', '0', '1', '三节机-北区S41', 'S41', '', '台', '1', null, null, '2017-10-30 18:30:05', '1');
INSERT INTO `t_equipdetail` VALUES ('181', '182', '0', '1', '三节机-北区S41-1', 'S41-1', '', '台', '1', null, null, '2017-10-30 18:30:51', '1');
INSERT INTO `t_equipdetail` VALUES ('182', '183', '0', '1', '三节机-北区S41-2', 'S41-2', '', '台', '1', null, null, '2017-10-30 18:31:09', '1');
INSERT INTO `t_equipdetail` VALUES ('183', '184', '0', '1', '三节机-北区S41-3', 'S41-3', '', '台', '1', null, null, '2017-10-30 18:31:29', '1');
INSERT INTO `t_equipdetail` VALUES ('184', '185', '0', '1', '三节机-北区S41-4', 'S41-4', '', '台', '1', null, null, '2017-10-30 18:31:50', '1');
INSERT INTO `t_equipdetail` VALUES ('185', '186', '0', '1', '三节机-北区S41-5', 'S41-5', '', '台', '1', null, null, '2017-10-30 18:32:08', '1');
INSERT INTO `t_equipdetail` VALUES ('186', '187', '0', '1', '三节机-北区S41-6', 'S41-6', '', '台', '1', null, null, '2017-10-30 18:32:28', '1');
INSERT INTO `t_equipdetail` VALUES ('187', '188', '0', '1', '三节机-北区S41-7', 'S41-7', '', '台', '1', null, null, '2017-10-30 18:32:47', '1');
INSERT INTO `t_equipdetail` VALUES ('188', '189', '0', '1', '三节机-北区S41-8', 'S41-8', '', '台', '1', null, null, '2017-10-30 18:33:05', '1');
INSERT INTO `t_equipdetail` VALUES ('189', '190', '0', '1', '三节机-北区S41-9', 'S41-9', '', '台', '1', null, null, '2017-10-30 18:33:25', '1');
INSERT INTO `t_equipdetail` VALUES ('190', '191', '0', '1', '三节机-北区S42', 'S42', '', '台', '1', null, null, '2017-10-30 18:33:55', '1');
INSERT INTO `t_equipdetail` VALUES ('191', '192', '0', '1', '三节机-北区S43', 'S43', '', '台', '1', null, null, '2017-10-30 18:34:15', '1');
INSERT INTO `t_equipdetail` VALUES ('192', '193', '0', '1', '三节机-北区S44', 'S44', '', '台', '1', null, null, '2017-10-30 18:34:39', '1');
INSERT INTO `t_equipdetail` VALUES ('193', '194', '0', '1', '三节机-北区S45', 'S45', '', '台', '1', null, null, '2017-10-30 18:35:01', '1');
INSERT INTO `t_equipdetail` VALUES ('194', '195', '0', '1', '三节机-北区S46', 'S46', '', '台', '1', null, null, '2017-10-30 18:35:17', '1');
INSERT INTO `t_equipdetail` VALUES ('195', '196', '0', '1', '三节机-北区S47', 'S47', '', '台', '1', null, null, '2017-10-30 18:35:32', '1');
INSERT INTO `t_equipdetail` VALUES ('196', '197', '0', '1', '三节机-北区S48', 'S48', '', '台', '1', null, null, '2017-10-30 18:35:49', '1');
INSERT INTO `t_equipdetail` VALUES ('197', '198', '0', '1', '三节机-北区S49', 'S49', '', '台', '1', null, null, '2017-10-30 18:36:06', '1');
INSERT INTO `t_equipdetail` VALUES ('198', '199', '0', '1', '三节机-南区S19', 'S19', '', '', '1', null, null, '2017-10-30 18:37:26', '1');
INSERT INTO `t_equipdetail` VALUES ('199', '200', '0', '1', '三节机-南区S20', 'S20', '', '', '1', null, null, '2017-10-30 18:38:02', '1');
INSERT INTO `t_equipdetail` VALUES ('200', '201', '0', '1', '三节机-南区S21', 'S', '', '', '1', null, null, '2017-10-30 18:38:19', '1');
INSERT INTO `t_equipdetail` VALUES ('201', '202', '0', '1', '三节机-南区S22', 'S22', '', '', '1', null, null, '2017-10-30 18:38:47', '1');
INSERT INTO `t_equipdetail` VALUES ('202', '203', '0', '1', '三节机-南区S23', 'S23', '', '', '1', null, null, '2017-10-30 18:39:02', '1');
INSERT INTO `t_equipdetail` VALUES ('203', '204', '0', '1', '三节机-南区S24', 'S24', '', '', '1', null, null, '2017-10-30 18:39:14', '1');
INSERT INTO `t_equipdetail` VALUES ('204', '205', '0', '1', '三节机-南区S25', 'S25', '', '', '1', null, null, '2017-10-30 18:39:27', '1');
INSERT INTO `t_equipdetail` VALUES ('205', '206', '0', '1', '三节机-南区S26', 'S26', '', '', '1', null, null, '2017-10-30 18:39:42', '1');
INSERT INTO `t_equipdetail` VALUES ('206', '207', '0', '1', '三节机-南区S27', 'S27', '', '', '1', null, null, '2017-10-30 18:39:59', '1');
INSERT INTO `t_equipdetail` VALUES ('207', '208', '0', '1', '三节机-南区S27-1', 'S27-1', '', '', '1', null, null, '2017-10-30 18:40:20', '1');
INSERT INTO `t_equipdetail` VALUES ('208', '209', '0', '1', '三节机-南区S27-2', 'S27-2', '', '', '1', null, null, '2017-10-30 18:40:39', '1');
INSERT INTO `t_equipdetail` VALUES ('209', '210', '0', '1', '三节机-南区S27-3', '27-3', '', '', '1', null, null, '2017-10-30 18:40:50', '1');
INSERT INTO `t_equipdetail` VALUES ('210', '211', '0', '1', '三节机-南区S28', 'S28', '', '', '1', null, null, '2017-10-30 18:41:13', '1');
INSERT INTO `t_equipdetail` VALUES ('211', '212', '0', '1', '三节机-南区S29', 'S28', '', '', '1', null, null, '2017-10-30 18:41:28', '1');
INSERT INTO `t_equipdetail` VALUES ('212', '213', '0', '1', '三节机-南区S29', 'S29', '', '', '1', null, null, '2017-10-30 18:41:54', '1');
INSERT INTO `t_equipdetail` VALUES ('213', '214', '0', '1', '三节机-南区S31', 'S31', '', '', '1', null, null, '2017-10-30 18:42:39', '1');
INSERT INTO `t_equipdetail` VALUES ('214', '215', '0', '1', '三节机-南区S32', 'S32', '', '', '1', null, null, '2017-10-30 18:42:54', '1');
INSERT INTO `t_equipdetail` VALUES ('215', '216', '0', '1', '三节机-南区S33', 'S33', '', '', '1', null, null, '2017-10-30 18:43:09', '1');
INSERT INTO `t_equipdetail` VALUES ('216', '217', '0', '1', '双层机-南区SC21', 'SC21', '', '', '1', null, null, '2017-10-30 18:45:48', '1');
INSERT INTO `t_equipdetail` VALUES ('217', '218', '0', '1', '双层机-南区SC22', 'SC22', '', '', '1', null, null, '2017-10-30 18:46:03', '1');
INSERT INTO `t_equipdetail` VALUES ('218', '219', '0', '1', '双层机-南区SC23', 'SC23', '', '', '1', null, null, '2017-10-30 18:46:18', '1');
INSERT INTO `t_equipdetail` VALUES ('219', '220', '0', '1', '双层机-南区SC24', 'SC24', '', '', '1', null, null, '2017-10-30 18:46:31', '1');
INSERT INTO `t_equipdetail` VALUES ('220', '221', '0', '1', '双层机-南区SC25', 'SC25', '', '', '1', null, null, '2017-10-30 18:46:45', '1');
INSERT INTO `t_equipdetail` VALUES ('221', '222', '0', '1', '双层机-南区SC26', 'SC26', '', '', '1', null, null, '2017-10-30 18:47:02', '1');
INSERT INTO `t_equipdetail` VALUES ('222', '223', '0', '1', '双层机-南区SC27', 'SC27', '', '', '1', null, null, '2017-10-30 18:47:17', '1');
INSERT INTO `t_equipdetail` VALUES ('223', '224', '0', '1', '双层机-南区SC27-1', 'SC27-1', '', '', '1', null, null, '2017-10-30 18:47:36', '1');
INSERT INTO `t_equipdetail` VALUES ('224', '225', '0', '1', '双层机-南区SC27-2', 'SC27-2', '', '', '1', null, null, '2017-10-30 18:47:57', '1');
INSERT INTO `t_equipdetail` VALUES ('225', '226', '0', '1', '双层机-南区SC27-3', 'SC27-3', '', '', '1', null, null, '2017-10-30 18:48:10', '1');
INSERT INTO `t_equipdetail` VALUES ('226', '227', '0', '1', '双层机-南区SC28', 'SC28', '', '', '1', null, null, '2017-10-30 18:48:30', '1');
INSERT INTO `t_equipdetail` VALUES ('227', '228', '0', '1', '双层机-南区SC29', 'SC29', '', '', '1', null, null, '2017-10-30 18:48:46', '1');
INSERT INTO `t_equipdetail` VALUES ('228', '229', '0', '1', '双层机-南区SC30', 'SC30', '', '', '1', null, null, '2017-10-30 18:49:00', '1');
INSERT INTO `t_equipdetail` VALUES ('229', '230', '0', '1', '双层机-南区SC31', 'SC31', '', '', '1', null, null, '2017-10-30 18:49:14', '1');
INSERT INTO `t_equipdetail` VALUES ('230', '231', '0', '1', '双层机-南区SC32', 'SC32', '', '', '1', null, null, '2017-10-30 18:49:31', '1');
INSERT INTO `t_equipdetail` VALUES ('231', '232', '0', '1', '双层机-南区SC33', 'SC33', '', '', '1', null, null, '2017-10-30 18:49:46', '1');
INSERT INTO `t_equipdetail` VALUES ('232', '233', '0', '1', '双层机-北区SC41', 'SC41', '', '', '1', null, null, '2017-10-30 18:50:30', '1');
INSERT INTO `t_equipdetail` VALUES ('233', '234', '0', '1', '双层机-北区SC41-1', 'SC41-1', '', '', '1', null, null, '2017-10-30 18:50:48', '1');
INSERT INTO `t_equipdetail` VALUES ('234', '235', '0', '1', '双层机-北区SC41-2', 'SC41-2', '', '', '1', null, null, '2017-10-30 18:51:02', '1');
INSERT INTO `t_equipdetail` VALUES ('235', '236', '0', '1', '双层机-北区SC41-3', 'SC41-3', '', '', '1', null, null, '2017-10-30 18:51:24', '1');
INSERT INTO `t_equipdetail` VALUES ('236', '237', '0', '1', '双层机-北区SC41-4', 'SC41-4', '', '', '1', null, null, '2017-10-30 18:51:37', '1');
INSERT INTO `t_equipdetail` VALUES ('237', '238', '0', '1', '双层机-北区SC41-5', 'SC41-5', '', '', '1', null, null, '2017-10-30 18:51:53', '1');
INSERT INTO `t_equipdetail` VALUES ('238', '239', '0', '1', '双层机-北区SC41-6', 'SC41-6', '', '', '1', null, null, '2017-10-30 18:52:06', '1');
INSERT INTO `t_equipdetail` VALUES ('239', '240', '0', '1', '双层机-北区SC41-7', 'SC41-7', '', '', '1', null, null, '2017-10-30 18:52:20', '1');
INSERT INTO `t_equipdetail` VALUES ('240', '241', '0', '1', '双层机-北区SC41-8', 'SC41-8', '', '', '1', null, null, '2017-10-30 18:52:36', '1');
INSERT INTO `t_equipdetail` VALUES ('241', '242', '0', '1', '双层机-北区SC41-9', 'SC41-9', '', '', '1', null, null, '2017-10-30 18:52:51', '1');
INSERT INTO `t_equipdetail` VALUES ('242', '243', '0', '1', '双层机-北区SC42', 'SC42', '', '', '1', null, null, '2017-10-30 18:53:06', '1');
INSERT INTO `t_equipdetail` VALUES ('243', '244', '0', '1', '双层机-北区SC43', 'SC43', '', '', '1', null, null, '2017-10-30 18:53:19', '1');
INSERT INTO `t_equipdetail` VALUES ('244', '245', '0', '1', '双层机-北区SC44', 'SC44', '', '', '1', null, null, '2017-10-30 18:53:35', '1');
INSERT INTO `t_equipdetail` VALUES ('245', '246', '0', '1', '双层机-北区SC45', 'SC45', '', '', '1', null, null, '2017-10-30 18:53:49', '1');
INSERT INTO `t_equipdetail` VALUES ('246', '247', '0', '1', '双层机-北区SC46', 'SC46', '', '', '1', null, null, '2017-10-30 18:54:02', '1');
INSERT INTO `t_equipdetail` VALUES ('247', '248', '0', '1', '双层机-北区SC47', 'SC47', '', '', '1', null, null, '2017-10-30 18:54:18', '1');
INSERT INTO `t_equipdetail` VALUES ('248', '249', '0', '1', '双层机-北区SC48', 'SC48', '', '', '1', null, null, '2017-10-30 18:54:31', '1');
INSERT INTO `t_equipdetail` VALUES ('249', '250', '0', '1', '双层机-北区SC49', 'SC49', '', '', '1', null, null, '2017-10-30 18:54:47', '1');
INSERT INTO `t_equipdetail` VALUES ('250', '251', '1', '1', '燃气锅炉房', 'FJ000129', '', '件', '1', null, null, '2017-10-31 09:22:47', '1');
INSERT INTO `t_equipdetail` VALUES ('251', '252', '1', '1', '小环形圈北', 'FJ000169', '', '件', '1', null, null, '2017-10-31 09:23:24', '1');
INSERT INTO `t_equipdetail` VALUES ('252', '253', '0', '1', '小环形圈北', 'FJ000169', '', '件', '1', null, null, '2017-10-31 09:23:56', '1');
INSERT INTO `t_equipdetail` VALUES ('253', '254', '0', '1', '小环形圈南', 'FJ000168', '', '件', '1', null, null, '2017-10-31 09:24:18', '1');
INSERT INTO `t_equipdetail` VALUES ('254', '255', '0', '1', '大环形圈', 'FJ000132', '', '件', '1', null, null, '2017-10-31 09:24:41', '1');
INSERT INTO `t_equipdetail` VALUES ('255', '256', '0', null, '手工三节机', 'JD000123', '', '台', '1', null, null, '2017-10-31 10:17:18', '1');
INSERT INTO `t_equipdetail` VALUES ('256', '34', '0', null, '光幕', 'D40001', '1', '件', '1', '', null, '2017-10-31 11:23:54', '1');
INSERT INTO `t_equipdetail` VALUES ('257', '34', '1', null, '光幕', 'D40001', '1', '件', '1', '', null, '2017-10-31 11:23:56', '1');
INSERT INTO `t_equipdetail` VALUES ('258', '34', '0', null, '变频器', 'D40002', '1', '件', '1', '', null, '2017-10-31 11:24:24', '1');
INSERT INTO `t_equipdetail` VALUES ('259', '34', '0', null, '动态电子秤', 'D40003', '1', '件', '1', '', null, '2017-10-31 11:24:45', '1');
INSERT INTO `t_equipdetail` VALUES ('260', '34', '0', null, '上件PLC控制系统', 'D40004', '1', '件', '1', '', null, '2017-10-31 11:25:05', '1');
INSERT INTO `t_equipdetail` VALUES ('261', '34', '0', null, '皮带', 'D40005', '1', '件', '1', '', null, '2017-10-31 11:25:28', '1');
INSERT INTO `t_equipdetail` VALUES ('262', '35', '0', null, '光幕', 'D30001', '1', '件', '1', '', null, '2017-10-31 11:26:28', '1');
INSERT INTO `t_equipdetail` VALUES ('263', '35', '0', null, '变频器', 'D30002', '1', '件', '1', '', null, '2017-10-31 11:26:50', '1');
INSERT INTO `t_equipdetail` VALUES ('264', '35', '0', null, '动态电子秤', 'D30003', '1', '件', '1', '', null, '2017-10-31 11:27:12', '1');
INSERT INTO `t_equipdetail` VALUES ('265', '35', '0', null, '上件PLC控制系统', 'D30004', '1', '件', '1', '', null, '2017-10-31 11:27:31', '1');
INSERT INTO `t_equipdetail` VALUES ('266', '35', '0', null, '皮带', 'D30005', '1', '件', '1', '', null, '2017-10-31 11:27:50', '1');
INSERT INTO `t_equipdetail` VALUES ('267', '36', '0', null, '光幕', 'D20001', '1', '件', '1', '', null, '2017-10-31 11:28:23', '1');
INSERT INTO `t_equipdetail` VALUES ('268', '36', '0', null, '变频器', 'D20002', '1', '件', '1', '', null, '2017-10-31 11:28:46', '1');
INSERT INTO `t_equipdetail` VALUES ('269', '36', '0', null, '动态电子秤', 'D20003', '1', '件', '1', '', null, '2017-10-31 11:29:12', '1');
INSERT INTO `t_equipdetail` VALUES ('270', '36', '0', null, '上件PLC控制系统', 'D20004', '1', '件', '1', '', null, '2017-10-31 11:29:33', '1');
INSERT INTO `t_equipdetail` VALUES ('271', '36', '0', null, '皮带', 'D20005', '1', '件', '1', '', null, '2017-10-31 11:29:51', '1');
INSERT INTO `t_equipdetail` VALUES ('272', '37', '0', null, '光幕', 'D10001', '1', '件', '1', '', null, '2017-10-31 11:39:15', '1');
INSERT INTO `t_equipdetail` VALUES ('273', '37', '0', null, '变频器', 'D10002', '1', '件', '1', '', null, '2017-10-31 11:39:36', '1');
INSERT INTO `t_equipdetail` VALUES ('274', '37', '0', null, '动态电子秤', 'D10003', '1', '件', '1', '', null, '2017-10-31 11:39:57', '1');
INSERT INTO `t_equipdetail` VALUES ('275', '37', '0', null, '上件PLC控制系统', 'D10004', '1', '件', '1', '', null, '2017-10-31 11:40:15', '1');
INSERT INTO `t_equipdetail` VALUES ('276', '37', '0', null, '皮带', 'D10005', '1', '件', '1', '', null, '2017-10-31 11:40:35', '1');
INSERT INTO `t_equipdetail` VALUES ('277', '38', '0', null, '光幕', 'D30011', '1', '件', '1', '', null, '2017-10-31 11:41:30', '1');
INSERT INTO `t_equipdetail` VALUES ('278', '38', '0', null, '变频器', 'D30012', '1', '件', '1', '', null, '2017-10-31 11:41:49', '1');
INSERT INTO `t_equipdetail` VALUES ('279', '38', '0', null, '动态电子秤', 'D30013', '1', '件', '1', '', null, '2017-10-31 11:42:13', '1');
INSERT INTO `t_equipdetail` VALUES ('280', '38', '0', null, '上件PLC控制系统', 'D30014', '1', '件', '1', '', null, '2017-10-31 11:42:31', '1');
INSERT INTO `t_equipdetail` VALUES ('281', '38', '0', null, '皮带', 'D30015', '1', '件', '1', '', null, '2017-10-31 11:42:57', '1');
INSERT INTO `t_equipdetail` VALUES ('282', '39', '0', null, '光幕', 'D20011', '1', '件', '1', '', null, '2017-10-31 11:45:31', '1');
INSERT INTO `t_equipdetail` VALUES ('283', '39', '0', null, '变频器', 'D20012', '1', '件', '1', '', null, '2017-10-31 11:45:49', '1');
INSERT INTO `t_equipdetail` VALUES ('284', '39', '0', null, '动态电子秤', 'D20013', '1', '件', '1', '', null, '2017-10-31 11:46:10', '1');
INSERT INTO `t_equipdetail` VALUES ('285', '39', '0', null, '上件PLC控制系统', 'D20013', '1', '件', '1', '', null, '2017-10-31 11:46:33', '1');
INSERT INTO `t_equipdetail` VALUES ('286', '39', '0', null, '皮带', 'D20015', '1', '件', '1', '', null, '2017-10-31 11:47:03', '1');
INSERT INTO `t_equipdetail` VALUES ('287', '40', '0', null, '光幕', 'D10011', '1', '件', '1', '', null, '2017-10-31 11:47:40', '1');
INSERT INTO `t_equipdetail` VALUES ('288', '40', '0', null, '变频器', 'D10012', '1', '件', '1', '', null, '2017-10-31 11:48:00', '1');
INSERT INTO `t_equipdetail` VALUES ('289', '40', '0', null, '动态电子秤', 'D10013', '1', '件', '1', '', null, '2017-10-31 11:48:25', '1');
INSERT INTO `t_equipdetail` VALUES ('290', '40', '0', null, '上件PLC控制系统', 'D10014', '1', '件', '1', '', null, '2017-10-31 11:48:40', '1');
INSERT INTO `t_equipdetail` VALUES ('291', '40', '0', null, '皮带', 'D10015', '1', '件', '1', '', null, '2017-10-31 11:48:55', '1');
INSERT INTO `t_equipdetail` VALUES ('292', '41', '0', null, '光幕', 'C50001', '1', '件', '1', '', null, '2017-10-31 11:49:22', '1');
INSERT INTO `t_equipdetail` VALUES ('293', '41', '0', null, '变频器', 'C50002', '1', '件', '1', '', null, '2017-10-31 11:49:48', '1');
INSERT INTO `t_equipdetail` VALUES ('294', '41', '0', null, '动态电子秤', 'C50003', '1', '件', '1', '', null, '2017-10-31 11:50:09', '1');
INSERT INTO `t_equipdetail` VALUES ('295', '41', '0', null, '上件PLC控制系统', 'C50004', '1', '件', '1', '', null, '2017-10-31 11:50:29', '1');
INSERT INTO `t_equipdetail` VALUES ('296', '41', '0', null, '皮带', 'C50005', '1', '件', '1', '', null, '2017-10-31 11:50:46', '1');
INSERT INTO `t_equipdetail` VALUES ('297', '42', '0', null, '光幕', 'C40001', '1', '件', '1', '', null, '2017-10-31 11:51:11', '1');
INSERT INTO `t_equipdetail` VALUES ('298', '42', '0', null, '变频器', 'C40002', '1', '件', '1', '', null, '2017-10-31 11:51:47', '1');
INSERT INTO `t_equipdetail` VALUES ('299', '42', '0', null, '动态电子秤', 'C40003', '1', '件', '1', '', null, '2017-10-31 11:52:13', '1');
INSERT INTO `t_equipdetail` VALUES ('300', '42', '0', null, '上件PLC控制系统', 'C40004', '1', '件', '1', '', null, '2017-10-31 11:52:32', '1');
INSERT INTO `t_equipdetail` VALUES ('301', '42', '0', null, '皮带', 'C40005', '1', '件', '1', '', null, '2017-10-31 11:52:47', '1');
INSERT INTO `t_equipdetail` VALUES ('302', '43', '0', null, '光幕', 'C30001', '1', '件', '1', '', null, '2017-10-31 11:55:39', '1');
INSERT INTO `t_equipdetail` VALUES ('303', '43', '0', null, '变频器', 'C30002', '1', '件', '1', '', null, '2017-10-31 11:56:02', '1');
INSERT INTO `t_equipdetail` VALUES ('304', '43', '0', null, '动态电子秤', 'C30003', '1', '件', '1', '', null, '2017-10-31 11:56:22', '1');
INSERT INTO `t_equipdetail` VALUES ('305', '43', '0', null, '上件PLC控制系统', 'C30004', '1', '件', '1', '', null, '2017-10-31 11:56:42', '1');
INSERT INTO `t_equipdetail` VALUES ('306', '43', '0', null, '皮带', 'C30005', '1', '件', '1', '', null, '2017-10-31 11:57:02', '1');
INSERT INTO `t_equipdetail` VALUES ('307', '44', '0', null, '光幕', 'C20001', '1', '件', '1', '', null, '2017-10-31 11:57:37', '1');
INSERT INTO `t_equipdetail` VALUES ('308', '44', '1', null, '光幕', 'C20001', '1', '件', '1', '', null, '2017-10-31 11:57:38', '1');
INSERT INTO `t_equipdetail` VALUES ('309', '44', '0', null, '变频器', 'C20002', '1', '件', '1', '', null, '2017-10-31 11:58:56', '1');
INSERT INTO `t_equipdetail` VALUES ('310', '44', '0', null, '动态电子秤', 'C20003', '1', '件', '1', '', null, '2017-10-31 11:59:15', '1');
INSERT INTO `t_equipdetail` VALUES ('311', '44', '0', null, '上件PLC控制系统', 'C20004', '1', '件', '1', '', null, '2017-10-31 11:59:36', '1');
INSERT INTO `t_equipdetail` VALUES ('312', '44', '0', null, '皮带', 'C20005', '1', '1', '1', '', null, '2017-10-31 11:59:55', '1');
INSERT INTO `t_equipdetail` VALUES ('313', '45', '0', null, '光幕', 'C10001', '1', '件', '1', '', null, '2017-10-31 12:00:27', '1');
INSERT INTO `t_equipdetail` VALUES ('314', '45', '0', null, '变频器', 'C10002', '1', '件', '1', '', null, '2017-10-31 12:00:53', '1');
INSERT INTO `t_equipdetail` VALUES ('315', '45', '0', null, '动态电子秤', 'C10003', '1', '件', '1', '', null, '2017-10-31 12:01:20', '1');
INSERT INTO `t_equipdetail` VALUES ('316', '45', '0', null, '上件PLC控制系统', 'C10004', '1', '件', '1', '', null, '2017-10-31 12:01:40', '1');
INSERT INTO `t_equipdetail` VALUES ('317', '45', '0', null, '皮带', 'C10005', '1', '件', '1', '', null, '2017-10-31 12:01:56', '1');
INSERT INTO `t_equipdetail` VALUES ('318', '46', '0', null, '光幕', 'C60011', '1', '件', '1', '', null, '2017-10-31 13:33:52', '1');
INSERT INTO `t_equipdetail` VALUES ('319', '46', '0', null, '变频器', 'C60012', '1', '件', '1', '', null, '2017-10-31 13:34:16', '1');
INSERT INTO `t_equipdetail` VALUES ('320', '46', '0', null, '动态电子秤', 'C60013', '1', '件', '1', '', null, '2017-10-31 13:34:38', '1');
INSERT INTO `t_equipdetail` VALUES ('321', '46', '0', null, '上件PLC控制系统', 'C60014', '1', '件', '1', '', null, '2017-10-31 13:35:00', '1');
INSERT INTO `t_equipdetail` VALUES ('322', '46', '0', null, '皮带', 'C60015', '1', '件', '1', '', null, '2017-10-31 13:35:26', '1');
INSERT INTO `t_equipdetail` VALUES ('323', '47', '0', null, '光幕', 'C50011', '1', '件', '1', '', null, '2017-10-31 13:36:58', '1');
INSERT INTO `t_equipdetail` VALUES ('324', '47', '0', null, '变频器', 'C50012', '1', '件', '1', '', null, '2017-10-31 13:37:22', '1');
INSERT INTO `t_equipdetail` VALUES ('325', '47', '0', null, '动态电子秤', 'C50013', '1', '件', '1', '', null, '2017-10-31 13:37:43', '1');
INSERT INTO `t_equipdetail` VALUES ('326', '47', '0', null, '上件PLC控制系统', 'C50014', '1', '件', '1', '', null, '2017-10-31 13:38:03', '1');
INSERT INTO `t_equipdetail` VALUES ('327', '47', '0', null, '皮带', 'C50015', '1', '件', '1', '', null, '2017-10-31 13:38:24', '1');
INSERT INTO `t_equipdetail` VALUES ('328', '48', '0', null, '光幕', 'C40011', '1', '件', '1', '', null, '2017-10-31 13:38:54', '1');
INSERT INTO `t_equipdetail` VALUES ('329', '48', '0', null, '变频器', 'C40012', '1', '件', '1', '', null, '2017-10-31 13:39:18', '1');
INSERT INTO `t_equipdetail` VALUES ('330', '48', '0', null, '动态电子秤', 'C40013', '1', '件', '1', '', null, '2017-10-31 13:39:52', '1');
INSERT INTO `t_equipdetail` VALUES ('331', '48', '0', null, '上件PLC控制系统', 'C40014', '1', '件', '1', '', null, '2017-10-31 13:40:14', '1');
INSERT INTO `t_equipdetail` VALUES ('332', '48', '0', null, '皮带', 'C40015', '1', '件', '1', '', null, '2017-10-31 13:40:32', '1');
INSERT INTO `t_equipdetail` VALUES ('333', '49', '0', null, '光幕', 'B100001', '1', '件', '1', '', null, '2017-10-31 13:41:01', '1');
INSERT INTO `t_equipdetail` VALUES ('334', '49', '0', null, '变频器', 'B100002', '1', '件', '1', '', null, '2017-10-31 13:41:25', '1');
INSERT INTO `t_equipdetail` VALUES ('335', '49', '0', null, '动态电子秤', 'B100003', '1', '件', '1', '', null, '2017-10-31 13:41:46', '1');
INSERT INTO `t_equipdetail` VALUES ('336', '49', '0', null, '上件PLC控制系统', 'B100004', '1', '件', '1', '', null, '2017-10-31 13:42:08', '1');
INSERT INTO `t_equipdetail` VALUES ('337', '49', '0', null, '皮带', 'B100005', '1', '件', '1', '', null, '2017-10-31 13:42:28', '1');
INSERT INTO `t_equipdetail` VALUES ('338', '50', '0', null, '光幕', 'B90001', '1', '件', '1', '', null, '2017-10-31 13:43:02', '1');
INSERT INTO `t_equipdetail` VALUES ('339', '50', '0', null, '变频器', 'B90002', '1', '件', '1', '', null, '2017-10-31 13:43:27', '1');
INSERT INTO `t_equipdetail` VALUES ('340', '50', '0', null, '动态电子秤', 'B90003', '1', '件', '1', '', null, '2017-10-31 13:43:51', '1');
INSERT INTO `t_equipdetail` VALUES ('341', '50', '0', null, '上件PLC控制系统', 'B90004', '1', '件', '1', '', null, '2017-10-31 13:44:17', '1');
INSERT INTO `t_equipdetail` VALUES ('342', '50', '0', null, '皮带', 'B90005', '1', '件', '1', '', null, '2017-10-31 13:44:39', '1');
INSERT INTO `t_equipdetail` VALUES ('343', '51', '0', null, '光幕', 'B80001', '1', '件', '1', '', null, '2017-10-31 13:46:24', '1');
INSERT INTO `t_equipdetail` VALUES ('344', '51', '0', null, '变频器', 'B80002', '1', '件', '1', '', null, '2017-10-31 13:46:47', '1');
INSERT INTO `t_equipdetail` VALUES ('345', '51', '0', null, '动态电子秤', 'B80003', '1', '件', '1', '', null, '2017-10-31 13:47:15', '1');
INSERT INTO `t_equipdetail` VALUES ('346', '51', '0', null, '上件PLC控制系统', 'B80004', '1', '件', '1', '', null, '2017-10-31 13:47:36', '1');
INSERT INTO `t_equipdetail` VALUES ('347', '51', '0', null, '皮带', 'B80005', '1', '件', '1', '', null, '2017-10-31 13:47:56', '1');
INSERT INTO `t_equipdetail` VALUES ('348', '52', '0', null, '光幕', 'B70001', '1', '件', '1', '', null, '2017-10-31 13:48:30', '1');
INSERT INTO `t_equipdetail` VALUES ('349', '52', '0', null, '变频器', 'B70002', '1', '件', '1', '', null, '2017-10-31 13:48:49', '1');
INSERT INTO `t_equipdetail` VALUES ('350', '52', '0', null, '动态电子秤', 'B70003', '1', '件', '1', '', null, '2017-10-31 13:49:09', '1');
INSERT INTO `t_equipdetail` VALUES ('351', '52', '0', null, '上件PLC控制系统', 'B70003', '1', '件', '1', '', null, '2017-10-31 13:49:29', '1');
INSERT INTO `t_equipdetail` VALUES ('352', '52', '0', null, '皮带', 'B70005', '1', '件', '1', '', null, '2017-10-31 13:49:47', '1');
INSERT INTO `t_equipdetail` VALUES ('353', '53', '0', null, '光幕', 'B60001', '1', '件', '1', '', null, '2017-10-31 13:50:24', '1');
INSERT INTO `t_equipdetail` VALUES ('354', '53', '0', null, '变频器', 'B60002', '1', '件', '1', '', null, '2017-10-31 13:50:47', '1');
INSERT INTO `t_equipdetail` VALUES ('355', '53', '0', null, '动态电子秤', 'B60003', '1', '件', '1', '', null, '2017-10-31 13:51:08', '1');
INSERT INTO `t_equipdetail` VALUES ('356', '53', '0', null, '上件PLC控制系统', 'B60004', '1', '件', '1', '', null, '2017-10-31 13:51:28', '1');
INSERT INTO `t_equipdetail` VALUES ('357', '53', '0', null, '皮带', 'B60005', '1', '件', '1', '', null, '2017-10-31 13:51:47', '1');
INSERT INTO `t_equipdetail` VALUES ('358', '54', '0', null, '光幕', 'B100011', '1', '件', '1', '', null, '2017-10-31 13:52:17', '1');
INSERT INTO `t_equipdetail` VALUES ('359', '54', '0', null, '变频器', 'B100012', '1', '件', '1', '', null, '2017-10-31 13:52:39', '1');
INSERT INTO `t_equipdetail` VALUES ('360', '54', '0', null, '动态电子秤', 'B100013', '1', '件', '1', '', null, '2017-10-31 13:52:59', '1');
INSERT INTO `t_equipdetail` VALUES ('361', '54', '0', null, '上件PLC控制系统', 'B100014', '1', '件', '1', '', null, '2017-10-31 13:53:24', '1');
INSERT INTO `t_equipdetail` VALUES ('362', '54', '0', null, '皮带', 'B100015', '1', '件', '1', '', null, '2017-10-31 13:53:43', '1');
INSERT INTO `t_equipdetail` VALUES ('363', '55', '0', null, '光幕', 'B90001', '1', '件', '1', '', null, '2017-10-31 13:54:21', '1');
INSERT INTO `t_equipdetail` VALUES ('364', '55', '0', null, '变频器', 'B90002', '1', '件', '1', '', null, '2017-10-31 13:54:42', '1');
INSERT INTO `t_equipdetail` VALUES ('365', '55', '0', null, '动态电子秤', 'B90003', '1', '件', '1', '', null, '2017-10-31 13:55:02', '1');
INSERT INTO `t_equipdetail` VALUES ('366', '55', '0', null, '上件PLC控制系统', 'B90004', '1', '件', '1', '', null, '2017-10-31 13:55:22', '1');
INSERT INTO `t_equipdetail` VALUES ('367', '55', '0', null, '皮带', 'B90005', '1', '件', '1', '', null, '2017-10-31 13:55:44', '1');
INSERT INTO `t_equipdetail` VALUES ('368', '56', '0', null, '光幕', 'B80001', '1', '件', '1', '', null, '2017-10-31 13:56:09', '1');
INSERT INTO `t_equipdetail` VALUES ('369', '56', '0', null, '变频器', 'B80002', '1', '件', '1', '', null, '2017-10-31 13:56:30', '1');
INSERT INTO `t_equipdetail` VALUES ('370', '56', '0', null, '动态电子秤', 'B80003', '1', '件', '1', '', null, '2017-10-31 13:56:52', '1');
INSERT INTO `t_equipdetail` VALUES ('371', '56', '0', null, '上件PLC控制系统', 'B80004', '1', '件', '1', '', null, '2017-10-31 13:57:13', '1');
INSERT INTO `t_equipdetail` VALUES ('372', '56', '0', null, '皮带', 'B80005', '1', '件', '1', '', null, '2017-10-31 13:57:36', '1');
INSERT INTO `t_equipdetail` VALUES ('373', '57', '0', null, '光幕', 'A100001', '1', '件', '1', '', null, '2017-10-31 13:58:32', '1');
INSERT INTO `t_equipdetail` VALUES ('374', '57', '0', null, '变频器', 'A100002', '1', '件', '1', '', null, '2017-10-31 13:58:57', '1');
INSERT INTO `t_equipdetail` VALUES ('375', '57', '0', null, '动态电子秤', 'A100003', '1', '件', '1', '', null, '2017-10-31 13:59:34', '1');
INSERT INTO `t_equipdetail` VALUES ('376', '57', '0', null, '上件PLC控制系统', 'A100004', '1', '件', '1', '', null, '2017-10-31 14:01:18', '1');
INSERT INTO `t_equipdetail` VALUES ('377', '57', '0', null, '皮带', 'A100005', '1', '件', '1', '', null, '2017-10-31 14:01:39', '1');
INSERT INTO `t_equipdetail` VALUES ('378', '58', '0', null, '光幕', 'A90001', '1', '件', '1', '', null, '2017-10-31 14:02:17', '1');
INSERT INTO `t_equipdetail` VALUES ('379', '58', '0', null, '变频器', 'A90002', '1', '件', '1', '', null, '2017-10-31 14:02:38', '1');
INSERT INTO `t_equipdetail` VALUES ('380', '58', '0', null, '动态电子秤', 'A90003', '1', '件', '1', '', null, '2017-10-31 14:03:08', '1');
INSERT INTO `t_equipdetail` VALUES ('381', '58', '0', null, '上件PLC控制系统', 'A90004', '1', '件', '1', '', null, '2017-10-31 14:03:29', '1');
INSERT INTO `t_equipdetail` VALUES ('382', '58', '0', null, '皮带', 'A90005', '1', '件', '1', '', null, '2017-10-31 14:03:49', '1');
INSERT INTO `t_equipdetail` VALUES ('383', '59', '0', null, '光幕', 'A80001', '1', '件', '1', '', null, '2017-10-31 14:04:40', '1');
INSERT INTO `t_equipdetail` VALUES ('384', '59', '0', null, '变频器', 'A80002', '1', '件', '1', '', null, '2017-10-31 14:05:00', '1');
INSERT INTO `t_equipdetail` VALUES ('385', '59', '0', null, '动态电子秤', 'A80003', '1', '件', '1', '', null, '2017-10-31 14:05:24', '1');
INSERT INTO `t_equipdetail` VALUES ('386', '59', '0', null, '上件PLC控制系统', 'A80004', '1', '件', '1', '', null, '2017-10-31 14:05:43', '1');
INSERT INTO `t_equipdetail` VALUES ('387', '59', '0', null, '皮带', 'A80005', '1', '件', '1', '', null, '2017-10-31 14:06:01', '1');
INSERT INTO `t_equipdetail` VALUES ('388', '60', '0', null, '光幕', 'A70001', '1', '件', '1', '', null, '2017-10-31 14:06:29', '1');
INSERT INTO `t_equipdetail` VALUES ('389', '60', '0', null, '变频器', 'A70002', '1', '件', '1', '', null, '2017-10-31 14:06:47', '1');
INSERT INTO `t_equipdetail` VALUES ('390', '60', '0', null, '动态电子秤', 'A70003', '1', '件', '1', '', null, '2017-10-31 14:07:05', '1');
INSERT INTO `t_equipdetail` VALUES ('391', '60', '0', null, '上件PLC控制系统', 'A70004', '1', '件', '1', '', null, '2017-10-31 14:07:23', '1');
INSERT INTO `t_equipdetail` VALUES ('392', '60', '0', null, '皮带', 'A70005', '1', '件', '1', '', null, '2017-10-31 14:07:38', '1');
INSERT INTO `t_equipdetail` VALUES ('393', '61', '0', null, '光幕', 'A60001', '1', '件', '1', '', null, '2017-10-31 14:08:29', '1');
INSERT INTO `t_equipdetail` VALUES ('394', '61', '0', null, '变频器', 'A60002', '1', '件', '1', '', null, '2017-10-31 14:08:47', '1');
INSERT INTO `t_equipdetail` VALUES ('395', '61', '0', null, '动态电子秤', 'A60003', '1', '件', '1', '', null, '2017-10-31 14:09:06', '1');
INSERT INTO `t_equipdetail` VALUES ('396', '61', '0', null, '上件PLC控制系统', 'A60004', '1', '件', '1', '', null, '2017-10-31 14:09:27', '1');
INSERT INTO `t_equipdetail` VALUES ('397', '61', '0', null, '皮带', 'A60005', '1', '件', '1', '', null, '2017-10-31 14:09:46', '1');
INSERT INTO `t_equipdetail` VALUES ('398', '62', '0', null, '光幕', 'A130011', '1', '件', '1', '', null, '2017-10-31 14:10:13', '1');
INSERT INTO `t_equipdetail` VALUES ('399', '62', '0', null, '变频器', 'A130012', '1', '件', '1', '', null, '2017-10-31 14:10:32', '1');
INSERT INTO `t_equipdetail` VALUES ('400', '62', '0', null, '动态电子秤', 'A130013', '1', '件', '1', '', null, '2017-10-31 14:10:58', '1');
INSERT INTO `t_equipdetail` VALUES ('401', '62', '0', null, '上件PLC控制系统', 'A130014', '1', '件', '1', '', null, '2017-10-31 14:11:18', '1');
INSERT INTO `t_equipdetail` VALUES ('402', '62', '0', null, '皮带', 'A130015', '1', '件', '1', '', null, '2017-10-31 14:11:37', '1');
INSERT INTO `t_equipdetail` VALUES ('403', '63', '0', null, '光幕', 'A120011', '1', '件', '1', '', null, '2017-10-31 14:12:00', '1');
INSERT INTO `t_equipdetail` VALUES ('404', '63', '0', null, '变频器', 'A120012', '1', '件', '1', '', null, '2017-10-31 14:12:19', '1');
INSERT INTO `t_equipdetail` VALUES ('405', '63', '0', null, '动态电子秤', 'A120013', '1', '件', '1', '', null, '2017-10-31 14:12:40', '1');
INSERT INTO `t_equipdetail` VALUES ('406', '63', '0', null, '上件PLC控制系统', 'A120014', '1', '件', '1', '', null, '2017-10-31 14:12:58', '1');
INSERT INTO `t_equipdetail` VALUES ('407', '63', '0', null, '皮带', 'A120015', '1', '件', '1', '', null, '2017-10-31 14:13:19', '1');
INSERT INTO `t_equipdetail` VALUES ('408', '64', '0', null, '光幕', 'A110011', '1', '件', '1', '', null, '2017-10-31 14:14:04', '1');
INSERT INTO `t_equipdetail` VALUES ('409', '64', '0', null, '变频器', 'A110012', '1', '件', '1', '', null, '2017-10-31 14:14:22', '1');
INSERT INTO `t_equipdetail` VALUES ('410', '64', '0', null, '动态电子秤', 'A110013', '1', '件', '1', '', null, '2017-10-31 14:14:43', '1');
INSERT INTO `t_equipdetail` VALUES ('411', '64', '0', null, '上件PLC控制系统', 'A110014', '1', '件', '1', '', null, '2017-10-31 14:15:04', '1');
INSERT INTO `t_equipdetail` VALUES ('412', '262', '1', null, '信息设备', '1', '1', '1', '1', '', null, '2017-10-31 21:10:07', '1');
INSERT INTO `t_equipdetail` VALUES ('413', '271', '1', '1', '789', '7', '2', '5', '1', null, null, '2017-11-01 15:05:03', '1');
INSERT INTO `t_equipdetail` VALUES ('414', '315', '1', '1', null, 'QQ', 'qqqqq', 'qqqq', '1', null, null, '2017-11-01 15:29:16', '1');
INSERT INTO `t_equipdetail` VALUES ('415', '316', '0', '1', null, '', '', '', '1', null, null, '2017-11-06 09:49:40', '1');
INSERT INTO `t_equipdetail` VALUES ('416', '317', '0', '1', null, '', '', '', '1', null, null, '2017-11-06 09:49:54', '1');
INSERT INTO `t_equipdetail` VALUES ('417', '318', '0', '1', '测试设备', 'C0001', '台', '台', '1', null, null, '2017-11-09 17:06:54', '1');
INSERT INTO `t_equipdetail` VALUES ('418', '318', '0', '2', '其他配件', null, null, '台', '1', null, null, '2017-11-09 17:06:54', '1');
INSERT INTO `t_equipdetail` VALUES ('419', '319', '0', '1', '可可设备', 'Koooo1', '无', '无', '1', null, null, '2017-11-14 11:00:20', '1');
INSERT INTO `t_equipdetail` VALUES ('420', '319', '0', '2', '其他配件', null, null, '无', '1', null, null, '2017-11-14 11:00:20', '1');
INSERT INTO `t_equipdetail` VALUES ('421', '320', '0', '1', '213', '1231', '213', '213', '1', null, null, '2017-11-14 17:48:20', '1');
INSERT INTO `t_equipdetail` VALUES ('422', '320', '0', '2', '其他配件', null, null, '213', '1', null, null, '2017-11-14 17:48:20', '1');

-- ----------------------------
-- Table structure for t_equipinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_equipinfo`;
CREATE TABLE `t_equipinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `rootid` bigint(20) DEFAULT NULL,
  `istreeleaf` int(10) DEFAULT NULL COMMENT '是否是设备类的最终节点\r\n0：不是类的最终节点\r\n1：属于类的最终节点',
  `istableleaf` int(10) DEFAULT NULL COMMENT '是否是详情\r\n0；不是详情\r\n1：是详情',
  `isdel` int(10) DEFAULT NULL COMMENT '是否删除',
  `area_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dkindid` bigint(20) DEFAULT NULL COMMENT '设备类型id',
  `identify` varchar(255) DEFAULT NULL,
  `ifirm` varchar(255) DEFAULT NULL COMMENT '厂商',
  `ibrand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `unit` varchar(255) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `infonote` text COMMENT '备注',
  `infourl` varchar(255) DEFAULT NULL,
  `ispecific` varchar(255) DEFAULT NULL COMMENT '规格型号',
  `length` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `speed` varchar(255) DEFAULT NULL COMMENT '线速度',
  `power` varchar(255) DEFAULT NULL COMMENT '功率',
  `elebrand` varchar(255) DEFAULT NULL COMMENT '减速电机品牌',
  `inverter` varchar(10) DEFAULT NULL COMMENT '是否变频',
  `invbrand` varchar(255) DEFAULT NULL COMMENT '变频器品牌',
  `beltmate` varchar(255) DEFAULT NULL COMMENT '皮带材质',
  `istatus` int(10) DEFAULT NULL COMMENT '状态',
  `onlinedate` datetime DEFAULT NULL COMMENT '上线时间',
  `baddate` datetime DEFAULT NULL COMMENT '过期时间',
  `guarantee` int(10) DEFAULT NULL COMMENT '质保期 天',
  `repairdate` datetime DEFAULT NULL COMMENT '维修时间',
  `replacedate` datetime DEFAULT NULL,
  `spotlocate` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipinfo
-- ----------------------------
INSERT INTO `t_equipinfo` VALUES ('1', '0', '1', '0', '0', '0', null, '胶带机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_equipinfo` VALUES ('2', '0', '2', '1', '0', '0', null, '信息技术', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:25:55', '1');
INSERT INTO `t_equipinfo` VALUES ('3', '257', '2', '0', '1', '1', '2', 'A区机房', '3', 'FJ000179', '', '', '台', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:26:34', '1');
INSERT INTO `t_equipinfo` VALUES ('4', '257', '2', '0', '1', '1', '2', 'D区机房', '3', 'FJ000178', '', '', '台', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:28:12', '1');
INSERT INTO `t_equipinfo` VALUES ('5', '0', '5', '1', '0', '0', null, '其他设备', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:29:41', '1');
INSERT INTO `t_equipinfo` VALUES ('6', '5', '5', '0', '1', '0', '2', '电动叉车', '2', 'FJ000170', '', '', '件', '7', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:30:22', '1');
INSERT INTO `t_equipinfo` VALUES ('7', '1', '1', '1', '0', '0', null, '三级伸缩胶带机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:31:39', '1');
INSERT INTO `t_equipinfo` VALUES ('8', '1', '1', '1', '0', '0', null, '双层机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:31:58', '1');
INSERT INTO `t_equipinfo` VALUES ('9', '1', '1', '1', '0', '0', null, '直线胶带机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:32:06', '1');
INSERT INTO `t_equipinfo` VALUES ('10', '1', '1', '1', '0', '0', null, '爬坡胶带机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:32:16', '1');
INSERT INTO `t_equipinfo` VALUES ('11', '1', '1', '1', '0', '0', null, '斜带胶带机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:32:35', '1');
INSERT INTO `t_equipinfo` VALUES ('12', '1', '1', '1', '0', '0', null, '总包线胶带机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:32:52', '1');
INSERT INTO `t_equipinfo` VALUES ('13', '7', '1', '0', '1', '1', '2', '手工线三节机', '1', 'JD000123', '', '', '台', '13', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:33:49', '1');
INSERT INTO `t_equipinfo` VALUES ('14', '7', '1', '0', '1', '1', '2', '三节机-南区', '1', 'JD000118', '', '', '台', '18', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:34:30', '1');
INSERT INTO `t_equipinfo` VALUES ('15', '7', '1', '0', '1', '1', '2', '三节机-北区', '1', 'JD000117', '', '', '台', '18', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:35:10', '1');
INSERT INTO `t_equipinfo` VALUES ('16', '7', '1', '0', '1', '1', '2', '卸货区三节机', '1', 'JD000116', '', '', '台', '12', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:36:09', '1');
INSERT INTO `t_equipinfo` VALUES ('17', '8', '1', '0', '1', '0', '10', '双层机-南区SC19', '1', 'SC19', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:37:33', '1');
INSERT INTO `t_equipinfo` VALUES ('18', '8', '1', '0', '1', '0', '10', '双层机-南区SC20', '1', 'SC20', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:38:06', '1');
INSERT INTO `t_equipinfo` VALUES ('19', '9', '1', '0', '1', '0', '2', '直线机JA01', '1', 'JA01', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:38:59', '1');
INSERT INTO `t_equipinfo` VALUES ('20', '10', '1', '0', '1', '0', '2', '爬坡机JA03', '1', 'JA03', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:39:38', '1');
INSERT INTO `t_equipinfo` VALUES ('21', '11', '1', '0', '1', '0', '2', '斜带机JA60', '1', 'JA60', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:40:21', '1');
INSERT INTO `t_equipinfo` VALUES ('22', '12', '1', '0', '1', '0', '2', '胶带机F', '1', 'JD000122', '', '', '件', '13', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:41:31', '1');
INSERT INTO `t_equipinfo` VALUES ('23', '12', '1', '0', '1', '0', '2', '胶带机F', '1', 'JD000121', '', '', '件', '13', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 16:41:59', '1');
INSERT INTO `t_equipinfo` VALUES ('24', '0', '24', '1', '0', '0', null, '地下配电室', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:42:33', '1');
INSERT INTO `t_equipinfo` VALUES ('25', '0', '25', '1', '0', '0', null, '滑升门', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:42:48', '1');
INSERT INTO `t_equipinfo` VALUES ('26', '0', '26', '1', '0', '0', null, '供包台', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:42:55', '1');
INSERT INTO `t_equipinfo` VALUES ('27', '0', '27', '1', '0', '0', null, '燃气锅炉房', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:43:05', '1');
INSERT INTO `t_equipinfo` VALUES ('28', '0', '28', '1', '0', '0', null, '环形圈', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 16:43:12', '1');
INSERT INTO `t_equipinfo` VALUES ('29', '24', '24', '0', '1', '0', '2', '地下配电室', '1', 'FJ000127', '', '', '件', '6', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:43:56', '1');
INSERT INTO `t_equipinfo` VALUES ('30', '25', '25', '0', '1', '0', '2', '滑升门', '1', 'FJ000128', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:44:34', '1');
INSERT INTO `t_equipinfo` VALUES ('31', '26', '26', '0', '1', '0', '7', '供包台F7', '1', 'FJ000173', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, '278.5,380', '2017-10-30 16:45:47', '1');
INSERT INTO `t_equipinfo` VALUES ('32', '26', '26', '0', '1', '0', '6', '供包台E14', '1', 'FJ000172', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, '324,294.5', '2017-10-30 16:51:31', '1');
INSERT INTO `t_equipinfo` VALUES ('33', '26', '26', '0', '1', '0', '5', '供包台D5-南', '1', 'FJ000167', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:54:43', '1');
INSERT INTO `t_equipinfo` VALUES ('34', '26', '26', '0', '1', '0', '5', '供包台D4-南', '1', 'FJ000166', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:57:12', '1');
INSERT INTO `t_equipinfo` VALUES ('35', '26', '26', '0', '1', '0', '5', '供包台D3-南', '1', 'FJ000165', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:57:33', '1');
INSERT INTO `t_equipinfo` VALUES ('36', '26', '26', '0', '1', '0', '5', '供包台D2-南', '1', 'FJ000164', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:57:53', '1');
INSERT INTO `t_equipinfo` VALUES ('37', '26', '26', '0', '1', '0', '5', '供包台D1-南', '1', 'FJ000163', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:58:15', '1');
INSERT INTO `t_equipinfo` VALUES ('38', '26', '26', '0', '1', '0', '5', '供包台D3', '1', 'FJ000162', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, '67.5,136', '2017-10-30 16:58:35', '1');
INSERT INTO `t_equipinfo` VALUES ('39', '26', '26', '0', '1', '0', '5', '供包台D2', '1', 'FJ000161', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, '484,246.5', '2017-10-30 16:58:54', '1');
INSERT INTO `t_equipinfo` VALUES ('40', '26', '26', '0', '1', '0', '5', '供包台D1', '1', 'FJ000160', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, '96.5,685', '2017-10-30 16:59:15', '1');
INSERT INTO `t_equipinfo` VALUES ('41', '26', '26', '0', '1', '0', '4', '供包台C5-北', '1', 'FJ000159', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:59:35', '1');
INSERT INTO `t_equipinfo` VALUES ('42', '26', '26', '0', '1', '0', '4', '供包台C4-北', '1', 'FJ000158', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 16:59:54', '1');
INSERT INTO `t_equipinfo` VALUES ('43', '26', '26', '0', '1', '0', '4', '供包台C3-北', '1', 'FJ000157', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:04:04', '1');
INSERT INTO `t_equipinfo` VALUES ('44', '26', '26', '0', '1', '0', '4', '供包台C2-北', '1', 'FJ000156', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:04:28', '1');
INSERT INTO `t_equipinfo` VALUES ('45', '26', '26', '0', '1', '0', '4', '供包台C1-北', '1', 'FJ000155', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:04:53', '1');
INSERT INTO `t_equipinfo` VALUES ('46', '26', '26', '0', '1', '0', '4', '供包台C6', '1', 'FJ000154', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:05:16', '1');
INSERT INTO `t_equipinfo` VALUES ('47', '26', '26', '0', '1', '0', '4', '供包台C5', '1', 'FJ000153', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:05:38', '1');
INSERT INTO `t_equipinfo` VALUES ('48', '26', '26', '0', '1', '0', '4', '供包台C4', '1', 'FJ000152', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:05:58', '1');
INSERT INTO `t_equipinfo` VALUES ('49', '26', '26', '0', '1', '0', '3', '供包台B10-北', '1', 'FJ000151', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:06:15', '1');
INSERT INTO `t_equipinfo` VALUES ('50', '26', '26', '0', '1', '0', '3', '供包台B9-北', '1', 'FJ000150', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:06:32', '1');
INSERT INTO `t_equipinfo` VALUES ('51', '26', '26', '0', '1', '0', '3', '供包台B8-北', '1', 'FJ000149', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:06:50', '1');
INSERT INTO `t_equipinfo` VALUES ('52', '26', '26', '0', '1', '0', '3', '供包台B7-北', '1', 'FJ000148', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:07:09', '1');
INSERT INTO `t_equipinfo` VALUES ('53', '26', '26', '0', '1', '0', '3', '供包台B6-北', '1', 'FJ000147', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:07:27', '1');
INSERT INTO `t_equipinfo` VALUES ('54', '26', '26', '0', '1', '0', '3', '供包台B10', '1', 'FJ000146', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:07:49', '1');
INSERT INTO `t_equipinfo` VALUES ('55', '26', '26', '0', '1', '0', '3', '供包台B9', '1', 'FJ000145', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:08:11', '1');
INSERT INTO `t_equipinfo` VALUES ('56', '26', '26', '0', '1', '0', '3', '供包台B8', '1', 'FJ000144', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:08:32', '1');
INSERT INTO `t_equipinfo` VALUES ('57', '26', '26', '0', '1', '0', '2', '供包台A10-南', '1', 'FJ000143', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:08:54', '1');
INSERT INTO `t_equipinfo` VALUES ('58', '26', '26', '0', '1', '0', '2', '供包台A9-南', '1', 'FJ000142', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:09:12', '1');
INSERT INTO `t_equipinfo` VALUES ('59', '26', '26', '0', '1', '0', '2', '供包台A8-南', '1', 'FJ000141', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:09:31', '1');
INSERT INTO `t_equipinfo` VALUES ('60', '26', '26', '0', '1', '0', '2', '供包台A7-南', '1', 'FJ000140', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:09:56', '1');
INSERT INTO `t_equipinfo` VALUES ('61', '26', '26', '0', '1', '0', '2', '供包台A6-南', '1', 'FJ000139', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:10:14', '1');
INSERT INTO `t_equipinfo` VALUES ('62', '26', '26', '0', '1', '0', '2', '供包台A13', '1', 'FJ000138', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:10:32', '1');
INSERT INTO `t_equipinfo` VALUES ('63', '26', '26', '0', '1', '0', '2', '供包台A12', '1', 'FJ000137', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:10:50', '1');
INSERT INTO `t_equipinfo` VALUES ('64', '26', '26', '0', '1', '0', '2', '供包台A11', '1', 'FJ000136', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-30 17:11:08', '1');
INSERT INTO `t_equipinfo` VALUES ('65', '9', '1', '0', '1', '0', '2', '直线机JA02', '1', 'JA02', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:33:39', '1');
INSERT INTO `t_equipinfo` VALUES ('66', '9', '1', '0', '1', '0', '2', '直线机JA05', '1', 'JA05', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:33:58', '1');
INSERT INTO `t_equipinfo` VALUES ('67', '9', '1', '0', '1', '0', '2', '直线机JA04', '1', 'JA04', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:34:23', '1');
INSERT INTO `t_equipinfo` VALUES ('68', '9', '1', '0', '1', '0', '2', '直线机JA07', '1', 'JA07', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:34:51', '1');
INSERT INTO `t_equipinfo` VALUES ('69', '9', '1', '0', '1', '0', '2', '直线机JA08', '1', 'JA08', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:35:11', '1');
INSERT INTO `t_equipinfo` VALUES ('70', '9', '1', '0', '1', '0', '2', '直线机JA10', '1', 'JA10', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:35:31', '1');
INSERT INTO `t_equipinfo` VALUES ('71', '9', '1', '0', '1', '0', '2', '直线机JA13', '1', 'JA13', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:35:49', '1');
INSERT INTO `t_equipinfo` VALUES ('72', '9', '1', '0', '1', '0', '2', '直线机JA15', '1', 'JA15', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:36:06', '1');
INSERT INTO `t_equipinfo` VALUES ('73', '9', '1', '0', '1', '0', '2', '直线机JA50', '1', 'JA50', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:36:25', '1');
INSERT INTO `t_equipinfo` VALUES ('74', '9', '1', '0', '1', '0', '2', '直线机JA51', '1', 'JA51', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:36:42', '1');
INSERT INTO `t_equipinfo` VALUES ('75', '9', '1', '0', '1', '0', '2', '直线机JA52', '1', 'JA52', '', '', '件', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:37:00', '1');
INSERT INTO `t_equipinfo` VALUES ('76', '10', '1', '0', '1', '0', '2', '爬坡机JA06', '1', 'JA06', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:37:55', '1');
INSERT INTO `t_equipinfo` VALUES ('77', '10', '1', '0', '1', '0', '2', '爬坡机JA09', '1', 'JA09', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:38:13', '1');
INSERT INTO `t_equipinfo` VALUES ('78', '10', '1', '0', '1', '0', '2', '爬坡机JA11', '1', 'JA11', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:38:34', '1');
INSERT INTO `t_equipinfo` VALUES ('79', '10', '1', '0', '1', '0', '2', '爬坡机JA12', '1', 'JA12', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:38:55', '1');
INSERT INTO `t_equipinfo` VALUES ('80', '10', '1', '0', '1', '0', '2', '爬坡机JA14', '1', 'JA14', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:39:13', '1');
INSERT INTO `t_equipinfo` VALUES ('81', '11', '1', '0', '1', '0', '2', '斜带机JA70', '1', 'JA70', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:40:01', '1');
INSERT INTO `t_equipinfo` VALUES ('82', '1', '1', '1', '0', '0', null, '卸货区三节机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 17:41:23', '1');
INSERT INTO `t_equipinfo` VALUES ('83', '82', '1', '0', '1', '0', '2', '卸货区三节机17-1', '1', '17-1', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:42:16', '1');
INSERT INTO `t_equipinfo` VALUES ('84', '82', '1', '0', '1', '0', '2', '卸货区三节机17-2', '1', '17-2', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:42:33', '1');
INSERT INTO `t_equipinfo` VALUES ('85', '82', '1', '0', '1', '0', '2', '卸货区三节机18', '1', '18', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:42:49', '1');
INSERT INTO `t_equipinfo` VALUES ('86', '9', '1', '0', '1', '0', '3', '直线机JB01', '1', 'JB01', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:43:37', '1');
INSERT INTO `t_equipinfo` VALUES ('87', '9', '1', '0', '1', '0', '3', '直线机JB02', '1', 'JB02', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:48:12', '1');
INSERT INTO `t_equipinfo` VALUES ('88', '9', '1', '0', '1', '0', '3', '直线机JB04', '1', 'JB04', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:48:33', '1');
INSERT INTO `t_equipinfo` VALUES ('89', '9', '1', '0', '1', '0', '3', '直线机JB05', '1', 'JB05', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:48:53', '1');
INSERT INTO `t_equipinfo` VALUES ('90', '9', '1', '0', '1', '0', '3', '直线机JB08', '1', 'JB08', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:49:15', '1');
INSERT INTO `t_equipinfo` VALUES ('91', '9', '1', '0', '1', '0', '3', '直线机JB09', '1', 'JB09', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:49:34', '1');
INSERT INTO `t_equipinfo` VALUES ('92', '9', '1', '0', '1', '0', '3', '直线机JB12', '1', 'JB12', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:50:12', '1');
INSERT INTO `t_equipinfo` VALUES ('93', '9', '1', '0', '1', '0', '3', '直线机JB14', '1', 'JB14', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:50:32', '1');
INSERT INTO `t_equipinfo` VALUES ('94', '9', '1', '0', '1', '0', '3', '直线机JB50', '1', 'JB50', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:51:01', '1');
INSERT INTO `t_equipinfo` VALUES ('95', '9', '1', '0', '1', '0', '3', '直线机JB51', '1', 'JB51', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:51:26', '1');
INSERT INTO `t_equipinfo` VALUES ('96', '9', '1', '0', '1', '0', '3', '直线机JB52', '1', 'JB52', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:51:43', '1');
INSERT INTO `t_equipinfo` VALUES ('97', '10', '1', '0', '1', '0', '3', '爬坡机JB03', '1', 'JB03', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:52:31', '1');
INSERT INTO `t_equipinfo` VALUES ('98', '10', '1', '0', '1', '0', '3', '爬坡机JB06', '1', 'JB06', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:53:00', '1');
INSERT INTO `t_equipinfo` VALUES ('99', '10', '1', '0', '1', '0', '3', '爬坡机JB07', '1', 'JB07', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:53:18', '1');
INSERT INTO `t_equipinfo` VALUES ('100', '10', '1', '0', '1', '0', '3', '爬坡机JB10', '1', 'JB10', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:53:41', '1');
INSERT INTO `t_equipinfo` VALUES ('101', '10', '1', '0', '1', '0', '3', '爬坡机JB11', '1', 'JB11', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:54:09', '1');
INSERT INTO `t_equipinfo` VALUES ('102', '10', '1', '0', '1', '0', '3', '爬坡机JB13', '1', 'JB13', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:54:28', '1');
INSERT INTO `t_equipinfo` VALUES ('103', '11', '1', '0', '1', '0', '3', '斜带机JB60', '1', 'JB60', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:55:07', '1');
INSERT INTO `t_equipinfo` VALUES ('104', '11', '1', '0', '1', '0', '3', '斜带机JB70', '1', 'JB70', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:55:31', '1');
INSERT INTO `t_equipinfo` VALUES ('105', '82', '1', '0', '1', '0', '3', '卸货区三节机51', '1', '51', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:56:09', '1');
INSERT INTO `t_equipinfo` VALUES ('106', '82', '1', '0', '1', '0', '3', '卸货区三节机52', '1', '52', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:56:31', '1');
INSERT INTO `t_equipinfo` VALUES ('107', '82', '1', '0', '1', '0', '3', '卸货区三节机53', '1', '53', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:56:48', '1');
INSERT INTO `t_equipinfo` VALUES ('108', '9', '1', '0', '1', '0', '3', '直线机JB15', '1', 'JB15', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:57:47', '1');
INSERT INTO `t_equipinfo` VALUES ('109', '9', '1', '0', '1', '0', '4', '直线机JC01', '1', 'JC01', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:58:17', '1');
INSERT INTO `t_equipinfo` VALUES ('110', '9', '1', '0', '1', '0', '4', '直线机JC02', '1', 'JC02', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:58:41', '1');
INSERT INTO `t_equipinfo` VALUES ('111', '9', '1', '0', '1', '0', '4', '直线机JC04', '1', 'JC04', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:58:56', '1');
INSERT INTO `t_equipinfo` VALUES ('112', '9', '1', '0', '1', '0', '4', '直线机JC05', '1', 'JC05', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:59:23', '1');
INSERT INTO `t_equipinfo` VALUES ('113', '9', '1', '0', '1', '0', '4', '直线机JC07', '1', 'JC07', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 17:59:44', '1');
INSERT INTO `t_equipinfo` VALUES ('114', '9', '1', '0', '1', '0', '4', '直线机JC08', '1', 'JC08', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:00:08', '1');
INSERT INTO `t_equipinfo` VALUES ('115', '9', '1', '0', '1', '0', '4', '直线机JC10', '1', 'JC10', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:00:27', '1');
INSERT INTO `t_equipinfo` VALUES ('116', '9', '1', '0', '1', '0', '4', '直线机JC13', '1', 'JC13', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:00:47', '1');
INSERT INTO `t_equipinfo` VALUES ('117', '9', '1', '0', '1', '0', '4', '直线机JC15', '1', 'JC15', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:01:05', '1');
INSERT INTO `t_equipinfo` VALUES ('118', '9', '1', '0', '1', '0', '4', '直线机JC50', '1', 'JC50', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:01:30', '1');
INSERT INTO `t_equipinfo` VALUES ('119', '9', '1', '0', '1', '0', '4', '直线机JC51', '1', 'JC51', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:01:49', '1');
INSERT INTO `t_equipinfo` VALUES ('120', '9', '1', '0', '1', '0', '4', '直线机JC52', '1', 'JC52', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:02:08', '1');
INSERT INTO `t_equipinfo` VALUES ('121', '10', '1', '0', '1', '0', '4', '爬坡机JC03', '1', 'JC03', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:02:44', '1');
INSERT INTO `t_equipinfo` VALUES ('122', '10', '1', '0', '1', '0', '4', '爬坡机JC06', '1', 'JC06', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:03:18', '1');
INSERT INTO `t_equipinfo` VALUES ('123', '10', '1', '0', '1', '0', '4', '爬坡机JC09', '1', 'JC09', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:03:38', '1');
INSERT INTO `t_equipinfo` VALUES ('124', '10', '1', '0', '1', '0', '4', '爬坡机JC11', '1', 'JC11', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:03:54', '1');
INSERT INTO `t_equipinfo` VALUES ('125', '10', '1', '0', '1', '0', '4', '爬坡机JC12', '1', 'JC12', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:04:16', '1');
INSERT INTO `t_equipinfo` VALUES ('126', '10', '1', '0', '1', '0', '4', '爬坡机JC14', '1', 'JC14', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:04:34', '1');
INSERT INTO `t_equipinfo` VALUES ('127', '11', '1', '0', '1', '0', '4', '斜带机JC60', '1', 'JC60', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:05:20', '1');
INSERT INTO `t_equipinfo` VALUES ('128', '11', '1', '0', '1', '0', '4', '斜带机JC70', '1', 'JC70', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:05:39', '1');
INSERT INTO `t_equipinfo` VALUES ('129', '82', '1', '0', '1', '0', '4', '卸货区三节机39', '1', '39', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:06:11', '1');
INSERT INTO `t_equipinfo` VALUES ('130', '82', '1', '0', '1', '0', '4', '卸货区三节机39-4', '1', '39-4', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, '106.5,775', '2017-10-30 18:06:34', '1');
INSERT INTO `t_equipinfo` VALUES ('131', '82', '1', '0', '1', '0', '4', '卸货区三节机40', '1', '40', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:06:58', '1');
INSERT INTO `t_equipinfo` VALUES ('132', '82', '1', '0', '1', '0', '5', '卸货区三节机35', '1', '35', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:07:25', '1');
INSERT INTO `t_equipinfo` VALUES ('133', '82', '1', '0', '1', '0', '5', '卸货区三节机36', '1', '36', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:07:46', '1');
INSERT INTO `t_equipinfo` VALUES ('134', '82', '1', '0', '1', '0', '5', '卸货区三节机37', '1', '37', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:08:09', '1');
INSERT INTO `t_equipinfo` VALUES ('135', '11', '1', '0', '1', '0', '5', '斜带机JD60', '1', 'JD60', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:08:59', '1');
INSERT INTO `t_equipinfo` VALUES ('136', '11', '1', '0', '1', '0', '5', '斜带机JD70', '1', 'JD70', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:09:14', '1');
INSERT INTO `t_equipinfo` VALUES ('137', '10', '1', '0', '1', '0', '5', '爬坡机JD03', '1', 'JD03', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:09:52', '1');
INSERT INTO `t_equipinfo` VALUES ('138', '10', '1', '0', '1', '0', '5', '爬坡机JD06', '1', 'JD06', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:10:13', '1');
INSERT INTO `t_equipinfo` VALUES ('139', '10', '1', '0', '1', '0', '5', '爬坡机JD07', '1', 'JD07', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:10:39', '1');
INSERT INTO `t_equipinfo` VALUES ('140', '10', '1', '0', '1', '0', '5', '爬坡机JD10', '1', 'JD10', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:11:02', '1');
INSERT INTO `t_equipinfo` VALUES ('141', '10', '1', '0', '1', '0', '5', '爬坡机JD11', '1', 'JD11', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:11:21', '1');
INSERT INTO `t_equipinfo` VALUES ('142', '10', '1', '0', '1', '0', '5', '爬坡机JD13', '1', 'JD13', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:11:37', '1');
INSERT INTO `t_equipinfo` VALUES ('143', '9', '1', '0', '1', '0', '5', '直线机JD01', '1', 'JD01', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:12:09', '1');
INSERT INTO `t_equipinfo` VALUES ('144', '9', '1', '0', '1', '0', '5', '直线机JD02', '1', 'JD02', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:12:34', '1');
INSERT INTO `t_equipinfo` VALUES ('145', '9', '1', '0', '1', '0', '5', '直线机JD04', '1', 'JD04', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:12:49', '1');
INSERT INTO `t_equipinfo` VALUES ('146', '9', '1', '0', '1', '0', '5', '直线机JD05', '1', 'JD05', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:13:08', '1');
INSERT INTO `t_equipinfo` VALUES ('147', '9', '1', '0', '1', '0', '5', '直线机JD08', '1', 'JD08', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:13:25', '1');
INSERT INTO `t_equipinfo` VALUES ('148', '9', '1', '0', '1', '0', '5', '直线机JD09', '1', 'JD09', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:13:45', '1');
INSERT INTO `t_equipinfo` VALUES ('149', '9', '1', '0', '1', '0', '5', '直线机JD12', '1', 'JD12', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:14:01', '1');
INSERT INTO `t_equipinfo` VALUES ('150', '9', '1', '0', '1', '0', '5', '直线机JD14', '1', 'JD14', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:14:18', '1');
INSERT INTO `t_equipinfo` VALUES ('151', '9', '1', '0', '1', '0', '5', '直线机JD50', '1', 'JD50', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:14:37', '1');
INSERT INTO `t_equipinfo` VALUES ('152', '9', '1', '0', '1', '0', '5', '直线机JD51', '1', 'JD51', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:14:56', '1');
INSERT INTO `t_equipinfo` VALUES ('153', '9', '1', '0', '1', '0', '5', '直线机JD52', '1', 'JD52', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:15:15', '1');
INSERT INTO `t_equipinfo` VALUES ('154', '1', '1', '1', '0', '0', null, '胶带传输机', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-30 18:18:24', '1');
INSERT INTO `t_equipinfo` VALUES ('155', '154', '1', '0', '1', '0', '6', '胶带传输机JE01', '1', 'JE01', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:19:01', '1');
INSERT INTO `t_equipinfo` VALUES ('156', '154', '1', '0', '1', '0', '6', '胶带传输机JE02', '1', 'JE02', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:19:31', '1');
INSERT INTO `t_equipinfo` VALUES ('157', '154', '1', '0', '1', '0', '6', '胶带传输机JE03', '1', 'JE03', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:19:48', '1');
INSERT INTO `t_equipinfo` VALUES ('158', '154', '1', '0', '1', '0', '6', '胶带传输机JE04', '1', 'JE04', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:20:06', '1');
INSERT INTO `t_equipinfo` VALUES ('159', '154', '1', '0', '1', '0', '6', '胶带传输机JE05', '1', 'JE05', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:20:36', '1');
INSERT INTO `t_equipinfo` VALUES ('160', '154', '1', '0', '1', '0', '6', '胶带传输机JE06', '1', 'JE06', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:20:52', '1');
INSERT INTO `t_equipinfo` VALUES ('161', '154', '1', '0', '1', '0', '6', '胶带传输机JE07', '1', 'JE07', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:21:09', '1');
INSERT INTO `t_equipinfo` VALUES ('162', '154', '1', '0', '1', '0', '6', '胶带传输机JE08', '1', 'JE08', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:21:26', '1');
INSERT INTO `t_equipinfo` VALUES ('163', '154', '1', '0', '1', '0', '6', '胶带传输机JE09', '1', 'JE09', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:21:42', '1');
INSERT INTO `t_equipinfo` VALUES ('164', '154', '1', '0', '1', '0', '6', '胶带传输机JE10', '1', 'JE10', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:22:01', '1');
INSERT INTO `t_equipinfo` VALUES ('165', '154', '1', '0', '1', '0', '6', '胶带传输机JE11', '1', 'JE11', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:22:20', '1');
INSERT INTO `t_equipinfo` VALUES ('166', '154', '1', '0', '1', '0', '6', '胶带传输机JE12', '1', 'JE12', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:22:39', '1');
INSERT INTO `t_equipinfo` VALUES ('167', '154', '1', '0', '1', '0', '6', '胶带传输机JE13', '1', 'JE13', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:23:00', '1');
INSERT INTO `t_equipinfo` VALUES ('168', '154', '1', '0', '1', '0', '7', '胶带传输机JF13', '1', 'JF13', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:23:39', '1');
INSERT INTO `t_equipinfo` VALUES ('169', '154', '1', '0', '1', '0', '7', '胶带传输机JF12', '1', 'JF12', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:24:00', '1');
INSERT INTO `t_equipinfo` VALUES ('170', '154', '1', '0', '1', '0', '7', '胶带传输机JF11', '1', 'JF11', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:24:18', '1');
INSERT INTO `t_equipinfo` VALUES ('171', '154', '1', '0', '1', '0', '7', '胶带传输机JF10', '1', 'JF10', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:24:36', '1');
INSERT INTO `t_equipinfo` VALUES ('172', '154', '1', '0', '1', '0', '7', '胶带传输机JF09', '1', 'JF09', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:24:56', '1');
INSERT INTO `t_equipinfo` VALUES ('173', '154', '1', '0', '1', '0', '7', '胶带传输机JF08', '1', 'JF08', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:25:13', '1');
INSERT INTO `t_equipinfo` VALUES ('174', '154', '1', '0', '1', '0', '7', '胶带传输机JF07', '1', 'JF07', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:25:29', '1');
INSERT INTO `t_equipinfo` VALUES ('175', '154', '1', '0', '1', '0', '7', '胶带传输机JF06', '1', 'JF06', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:25:46', '1');
INSERT INTO `t_equipinfo` VALUES ('176', '154', '1', '0', '1', '0', '7', '胶带传输机JF05', '1', 'JF05', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:26:03', '1');
INSERT INTO `t_equipinfo` VALUES ('177', '154', '1', '0', '1', '0', '7', '胶带传输机JF04', '1', 'JF04', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:26:21', '1');
INSERT INTO `t_equipinfo` VALUES ('178', '154', '1', '0', '1', '0', '7', '胶带传输机JF03', '1', 'JF03', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:26:38', '1');
INSERT INTO `t_equipinfo` VALUES ('179', '154', '1', '0', '1', '0', '7', '胶带传输机JF02', '1', 'JF02', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:26:54', '1');
INSERT INTO `t_equipinfo` VALUES ('180', '154', '1', '0', '1', '0', '7', '胶带传输机JF01', '1', 'JF01', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:27:10', '1');
INSERT INTO `t_equipinfo` VALUES ('181', '7', '1', '0', '1', '0', '11', '三节机-北区S41', '1', 'S40', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, '850,533.5', '2017-10-30 18:30:05', '1');
INSERT INTO `t_equipinfo` VALUES ('182', '7', '1', '0', '1', '0', '11', '三节机-北区S41-1', '1', 'S41-1', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:30:51', '1');
INSERT INTO `t_equipinfo` VALUES ('183', '7', '1', '0', '1', '0', '11', '三节机-北区S41-2', '1', 'S41-2', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, '381,173', '2017-10-30 18:31:09', '1');
INSERT INTO `t_equipinfo` VALUES ('184', '7', '1', '0', '1', '0', '11', '三节机-北区S41-3', '1', 'S41-3', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:31:29', '1');
INSERT INTO `t_equipinfo` VALUES ('185', '7', '1', '0', '1', '0', '11', '三节机-北区S41-4', '1', 'S41-4', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:31:50', '1');
INSERT INTO `t_equipinfo` VALUES ('186', '7', '1', '0', '1', '0', '11', '三节机-北区S41-5', '1', 'S41-5', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:32:08', '1');
INSERT INTO `t_equipinfo` VALUES ('187', '7', '1', '0', '1', '0', '11', '三节机-北区S41-6', '1', 'S41-6', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:32:28', '1');
INSERT INTO `t_equipinfo` VALUES ('188', '7', '1', '0', '1', '0', '11', '三节机-北区S41-7', '1', 'S41-7', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:32:47', '1');
INSERT INTO `t_equipinfo` VALUES ('189', '7', '1', '0', '1', '0', '11', '三节机-北区S41-8', '1', 'S41-8', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:33:05', '1');
INSERT INTO `t_equipinfo` VALUES ('190', '7', '1', '0', '1', '0', '11', '三节机-北区S41-9', '1', 'S41-9', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:33:25', '1');
INSERT INTO `t_equipinfo` VALUES ('191', '7', '1', '0', '1', '0', '11', '三节机-北区S42', '1', 'S42', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:33:55', '1');
INSERT INTO `t_equipinfo` VALUES ('192', '7', '1', '0', '1', '0', '11', '三节机-北区S43', '1', 'S43', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:34:15', '1');
INSERT INTO `t_equipinfo` VALUES ('193', '7', '1', '0', '1', '0', '11', '三节机-北区S44', '1', 'S44', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:34:39', '1');
INSERT INTO `t_equipinfo` VALUES ('194', '7', '1', '0', '1', '0', '11', '三节机-北区S45', '1', 'S45', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:35:01', '1');
INSERT INTO `t_equipinfo` VALUES ('195', '7', '1', '0', '1', '0', '11', '三节机-北区S46', '1', 'S46', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:35:17', '1');
INSERT INTO `t_equipinfo` VALUES ('196', '7', '1', '0', '1', '0', '11', '三节机-北区S47', '1', 'S47', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:35:32', '1');
INSERT INTO `t_equipinfo` VALUES ('197', '7', '1', '0', '1', '0', '11', '三节机-北区S48', '1', 'S48', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:35:49', '1');
INSERT INTO `t_equipinfo` VALUES ('198', '7', '1', '0', '1', '0', '11', '三节机-北区S49', '1', 'S49', '', '', '台', '1', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:36:06', '1');
INSERT INTO `t_equipinfo` VALUES ('199', '7', '1', '0', '1', '0', '10', '三节机-南区S19', '1', 'S19', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:37:26', '1');
INSERT INTO `t_equipinfo` VALUES ('200', '7', '1', '0', '1', '0', '10', '三节机-南区S20', '1', 'S20', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:38:02', '1');
INSERT INTO `t_equipinfo` VALUES ('201', '7', '1', '0', '1', '0', '10', '三节机-南区S21', '1', 'S21', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:38:19', '1');
INSERT INTO `t_equipinfo` VALUES ('202', '7', '1', '0', '1', '0', '10', '三节机-南区S22', '1', 'S22', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:38:47', '1');
INSERT INTO `t_equipinfo` VALUES ('203', '7', '1', '0', '1', '0', '10', '三节机-南区S23', '1', 'S23', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:39:02', '1');
INSERT INTO `t_equipinfo` VALUES ('204', '7', '1', '0', '1', '0', '10', '三节机-南区S24', '1', 'S24', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:39:14', '1');
INSERT INTO `t_equipinfo` VALUES ('205', '7', '1', '0', '1', '0', '10', '三节机-南区S25', '1', 'S25', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:39:27', '1');
INSERT INTO `t_equipinfo` VALUES ('206', '7', '1', '0', '1', '0', '10', '三节机-南区S26', '1', 'S26', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:39:42', '1');
INSERT INTO `t_equipinfo` VALUES ('207', '7', '1', '0', '1', '0', '10', '三节机-南区S27', '1', 'S27', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:39:59', '1');
INSERT INTO `t_equipinfo` VALUES ('208', '7', '1', '0', '1', '0', '10', '三节机-南区S27-1', '1', 'S27-1', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:40:20', '1');
INSERT INTO `t_equipinfo` VALUES ('209', '7', '1', '0', '1', '0', '10', '三节机-南区S27-2', '1', 'S27-2', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:40:39', '1');
INSERT INTO `t_equipinfo` VALUES ('210', '7', '1', '0', '1', '0', '10', '三节机-南区S27-3', '1', '27-3', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:40:50', '1');
INSERT INTO `t_equipinfo` VALUES ('211', '7', '1', '0', '1', '0', '10', '三节机-南区S28', '1', 'S28', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:41:13', '1');
INSERT INTO `t_equipinfo` VALUES ('212', '7', '1', '0', '1', '0', '10', '三节机-南区S29', '1', 'S29', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:41:28', '1');
INSERT INTO `t_equipinfo` VALUES ('213', '7', '1', '0', '1', '0', '10', '三节机-南区S30', '1', 'S30', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:41:54', '1');
INSERT INTO `t_equipinfo` VALUES ('214', '7', '1', '0', '1', '0', '10', '三节机-南区S31', '1', 'S31', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:42:39', '1');
INSERT INTO `t_equipinfo` VALUES ('215', '7', '1', '0', '1', '0', '10', '三节机-南区S32', '1', 'S32', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:42:54', '1');
INSERT INTO `t_equipinfo` VALUES ('216', '7', '1', '0', '1', '0', '10', '三节机-南区S33', '1', 'S33', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:43:09', '1');
INSERT INTO `t_equipinfo` VALUES ('217', '8', '1', '0', '1', '0', '10', '双层机-南区SC21', '1', 'SC21', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:45:48', '1');
INSERT INTO `t_equipinfo` VALUES ('218', '8', '1', '0', '1', '0', '10', '双层机-南区SC22', '1', 'SC22', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:46:03', '1');
INSERT INTO `t_equipinfo` VALUES ('219', '8', '1', '0', '1', '0', '10', '双层机-南区SC23', '1', 'SC23', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:46:18', '1');
INSERT INTO `t_equipinfo` VALUES ('220', '8', '1', '0', '1', '0', '10', '双层机-南区SC24', '1', 'SC24', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:46:31', '1');
INSERT INTO `t_equipinfo` VALUES ('221', '8', '1', '0', '1', '0', '10', '双层机-南区SC25', '1', 'SC25', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:46:45', '1');
INSERT INTO `t_equipinfo` VALUES ('222', '8', '1', '0', '1', '0', '10', '双层机-南区SC26', '1', 'SC26', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:47:01', '1');
INSERT INTO `t_equipinfo` VALUES ('223', '8', '1', '0', '1', '0', '10', '双层机-南区SC27', '1', 'SC27', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:47:17', '1');
INSERT INTO `t_equipinfo` VALUES ('224', '8', '1', '0', '1', '0', '10', '双层机-南区SC27-1', '1', 'SC27-1', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:47:36', '1');
INSERT INTO `t_equipinfo` VALUES ('225', '8', '1', '0', '1', '0', '10', '双层机-南区SC27-2', '1', 'SC27-2', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:47:57', '1');
INSERT INTO `t_equipinfo` VALUES ('226', '8', '1', '0', '1', '0', '10', '双层机-南区SC27-3', '1', 'SC27-3', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:48:10', '1');
INSERT INTO `t_equipinfo` VALUES ('227', '8', '1', '0', '1', '0', '10', '双层机-南区SC28', '1', 'SC28', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:48:30', '1');
INSERT INTO `t_equipinfo` VALUES ('228', '8', '1', '0', '1', '0', '10', '双层机-南区SC29', '1', 'SC29', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:48:46', '1');
INSERT INTO `t_equipinfo` VALUES ('229', '8', '1', '0', '1', '0', '10', '双层机-南区SC30', '1', 'SC30', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:49:00', '1');
INSERT INTO `t_equipinfo` VALUES ('230', '8', '1', '0', '1', '0', '10', '双层机-南区SC31', '1', 'SC31', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:49:14', '1');
INSERT INTO `t_equipinfo` VALUES ('231', '8', '1', '0', '1', '0', '10', '双层机-南区SC32', '1', 'SC32', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:49:31', '1');
INSERT INTO `t_equipinfo` VALUES ('232', '8', '1', '0', '1', '0', '10', '双层机-南区SC33', '1', 'SC33', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:49:46', '1');
INSERT INTO `t_equipinfo` VALUES ('233', '8', '1', '0', '1', '0', '11', '双层机-北区SC41', '1', 'SC41', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:50:30', '1');
INSERT INTO `t_equipinfo` VALUES ('234', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-1', '1', 'SC41-1', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:50:48', '1');
INSERT INTO `t_equipinfo` VALUES ('235', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-2', '1', 'SC41-2', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:51:02', '1');
INSERT INTO `t_equipinfo` VALUES ('236', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-3', '1', 'SC41-3', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:51:24', '1');
INSERT INTO `t_equipinfo` VALUES ('237', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-4', '1', 'SC41-4', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:51:37', '1');
INSERT INTO `t_equipinfo` VALUES ('238', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-5', '1', 'SC41-5', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:51:53', '1');
INSERT INTO `t_equipinfo` VALUES ('239', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-6', '1', 'SC41-6', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:52:06', '1');
INSERT INTO `t_equipinfo` VALUES ('240', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-7', '1', 'SC41-7', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:52:20', '1');
INSERT INTO `t_equipinfo` VALUES ('241', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-8', '1', 'SC41-8', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:52:36', '1');
INSERT INTO `t_equipinfo` VALUES ('242', '8', '1', '0', '1', '0', '11', '双层机-北区SC41-9', '1', 'SC41-9', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:52:51', '1');
INSERT INTO `t_equipinfo` VALUES ('243', '8', '1', '0', '1', '0', '11', '双层机-北区SC42', '1', 'SC42', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:53:06', '1');
INSERT INTO `t_equipinfo` VALUES ('244', '8', '1', '0', '1', '0', '11', '双层机-北区SC43', '1', 'SC43', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:53:19', '1');
INSERT INTO `t_equipinfo` VALUES ('245', '8', '1', '0', '1', '0', '11', '双层机-北区SC44', '1', 'SC44', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:53:35', '1');
INSERT INTO `t_equipinfo` VALUES ('246', '8', '1', '0', '1', '0', '11', '双层机-北区SC45', '1', 'SC45', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:53:49', '1');
INSERT INTO `t_equipinfo` VALUES ('247', '8', '1', '0', '1', '0', '11', '双层机-北区SC46', '1', 'SC46', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:54:02', '1');
INSERT INTO `t_equipinfo` VALUES ('248', '8', '1', '0', '1', '0', '11', '双层机-北区SC47', '1', 'SC47', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:54:18', '1');
INSERT INTO `t_equipinfo` VALUES ('249', '8', '1', '0', '1', '0', '11', '双层机-北区SC48', '1', 'SC48', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:54:31', '1');
INSERT INTO `t_equipinfo` VALUES ('250', '8', '1', '0', '1', '0', '11', '双层机-北区SC49', '1', 'SC49', '', '', '', null, '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-30 18:54:47', '1');
INSERT INTO `t_equipinfo` VALUES ('251', '259', '27', '0', '1', '1', '2', '燃气锅炉房', '1', 'FJ000129', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 09:22:47', '1');
INSERT INTO `t_equipinfo` VALUES ('252', '259', '27', '0', '1', '1', '2', '小环形圈北', '1', 'FJ000169', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 09:23:24', '1');
INSERT INTO `t_equipinfo` VALUES ('253', '28', '28', '0', '1', '0', '2', '小环形圈北', '1', 'FJ000169', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 09:23:56', '1');
INSERT INTO `t_equipinfo` VALUES ('254', '28', '28', '0', '1', '0', '2', '小环形圈南', '1', 'FJ000168', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 09:24:18', '1');
INSERT INTO `t_equipinfo` VALUES ('255', '28', '28', '0', '1', '0', '2', '大环形圈', '1', 'FJ000132', '', '', '件', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 09:24:41', '1');
INSERT INTO `t_equipinfo` VALUES ('256', '7', '1', '0', '1', '0', '9', '手工线三节机', '1', 'JD000123', '', '', '台', '13', '', null, '', null, null, null, '', null, '', '', '', '', '10', null, null, null, null, null, null, '2017-10-31 10:17:18', '1');
INSERT INTO `t_equipinfo` VALUES ('257', '2', '2', '1', '0', '1', null, '及', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-31 15:31:35', '1');
INSERT INTO `t_equipinfo` VALUES ('258', '2', '2', '0', '0', '1', null, '办公电脑', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-31 15:33:52', '1');
INSERT INTO `t_equipinfo` VALUES ('259', '27', '27', '1', '0', '1', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-31 16:09:13', '1');
INSERT INTO `t_equipinfo` VALUES ('260', '261', '27', '0', '1', '1', '2', '燃气', '1', '', '', '', '', null, '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 16:09:58', '1');
INSERT INTO `t_equipinfo` VALUES ('261', '27', '27', '1', '0', '1', null, '232', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-10-31 16:15:11', '1');
INSERT INTO `t_equipinfo` VALUES ('262', '263', '2', '0', '1', '1', '2', '信息设备', '3', '', '', '', '', null, '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-10-31 16:44:05', '1');
INSERT INTO `t_equipinfo` VALUES ('263', '258', '2', '1', '0', '1', null, '233', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-01 15:01:30', '1');
INSERT INTO `t_equipinfo` VALUES ('264', '258', '2', '1', '0', '1', null, '23', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-01 15:01:52', '1');
INSERT INTO `t_equipinfo` VALUES ('270', '1', '1', '1', '0', '1', null, '啊', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-01 15:03:38', '1');
INSERT INTO `t_equipinfo` VALUES ('271', '270', '1', '0', '1', '1', '2', '789', '1', '7', '5', 'g', '5', '5', '54', '/equipImg/equipTable271.jpg', '2', null, null, null, '852', null, '12', '12', 'sd', '人', '10', '2017-11-09 00:00:00', null, '41', '2017-11-30 00:00:00', '2017-11-23 00:00:00', null, '2017-11-01 15:05:03', '1');
INSERT INTO `t_equipinfo` VALUES ('314', '2', '2', '1', '0', '1', null, 'QQQ', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-01 15:26:29', '1');
INSERT INTO `t_equipinfo` VALUES ('315', '314', '2', '0', '1', '1', '3', 'qq', '3', 'QQ', 'qqq', 'QQQ', 'qqqq', '3', 'QQQQQ', '/equipImg/equipTable315.PNG', 'qqqqq', null, null, null, null, null, null, null, null, null, '10', '2017-11-01 00:00:00', null, '2', '2017-11-30 00:00:00', '2017-10-30 00:00:00', null, '2017-11-01 15:29:16', '1');
INSERT INTO `t_equipinfo` VALUES ('316', '2', '2', '0', '1', '0', '2', 'A区机房', '3', '', '', '', '', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-11-06 09:49:40', '1');
INSERT INTO `t_equipinfo` VALUES ('317', '2', '2', '0', '1', '0', '2', 'D区机房', '3', '', '', '', '', '1', '', null, '', null, null, null, null, null, null, null, null, null, '10', null, null, null, null, null, null, '2017-11-06 09:49:54', '1');
INSERT INTO `t_equipinfo` VALUES ('318', '2', '2', '0', '1', '0', '2', '测试设备', '3', 'C0001', '测试', '测试', '台', '1', '', null, '台', null, null, null, null, null, null, null, null, null, '10', '2017-11-09 00:00:00', null, null, '2017-11-09 00:00:00', null, '276.5,379', '2017-11-09 17:06:54', '1');
INSERT INTO `t_equipinfo` VALUES ('319', '2', '2', '0', '1', '0', '2', '可可设备', '3', 'Koooo1', '可可有限公司', '无', '无', '1', '', '/equipImg/equipTable319.png', '无', null, null, null, null, null, null, null, null, null, '10', '2017-11-15 00:00:00', null, '3', '2017-11-14 00:00:00', null, null, '2017-11-14 11:00:20', '1');
INSERT INTO `t_equipinfo` VALUES ('320', '7', '1', '0', '1', '0', '2', '213', '1', '1231', '213', '12312', '213', '21312', '', null, '213', null, null, null, '', null, '', '', '', '', '10', '2017-10-31 00:00:00', null, null, '2017-11-29 00:00:00', null, '692,145', '2017-11-14 17:48:20', '1');

-- ----------------------------
-- Table structure for t_equipinfo_warn
-- ----------------------------
DROP TABLE IF EXISTS `t_equipinfo_warn`;
CREATE TABLE `t_equipinfo_warn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `infoid` bigint(20) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `rate` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipinfo_warn
-- ----------------------------

-- ----------------------------
-- Table structure for t_extratask
-- ----------------------------
DROP TABLE IF EXISTS `t_extratask`;
CREATE TABLE `t_extratask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `expense` decimal(30,2) DEFAULT '0.00' COMMENT '费用',
  `idea` varchar(255) DEFAULT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `submit_id` bigint(20) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `pc` bigint(20) DEFAULT NULL,
  `isxj` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `handle_method` int(2) DEFAULT NULL COMMENT '处理方法',
  `handle_manner` int(2) DEFAULT NULL COMMENT '处理方式',
  `is_resolved` bit(1) DEFAULT NULL COMMENT '是否解决',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_extratask
-- ----------------------------

-- ----------------------------
-- Table structure for t_frequency
-- ----------------------------
DROP TABLE IF EXISTS `t_frequency`;
CREATE TABLE `t_frequency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identify` varchar(255) DEFAULT NULL COMMENT '保养频率唯一标识',
  `explains` varchar(255) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL COMMENT '形式：\r\n1：巡检\r\n2：维护',
  `isdel` int(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_frequency
-- ----------------------------
INSERT INTO `t_frequency` VALUES ('1', null, '巡检任务', '0', '0', null, null);
INSERT INTO `t_frequency` VALUES ('2', null, '维保任务', '0', '0', null, null);
INSERT INTO `t_frequency` VALUES ('4', 'day', '日', '1', '0', '2017-10-31 09:36:38', '1');
INSERT INTO `t_frequency` VALUES ('6', 'month', '月', '2', '0', '2017-10-31 09:36:49', '1');
INSERT INTO `t_frequency` VALUES ('7', 'quarter', '季度', '2', '0', '2017-10-31 09:36:56', '1');
INSERT INTO `t_frequency` VALUES ('8', 'week', '周', '1', '1', '2017-11-01 15:08:14', '1');

-- ----------------------------
-- Table structure for t_leave_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_leave_apply`;
CREATE TABLE `t_leave_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave_apply
-- ----------------------------
INSERT INTO `t_leave_apply` VALUES ('1', '2017-11-08 13:34:43', '2017-11-09 13:34:53', '1', '1', '30', '2017-11-08 13:35:05', '2');
INSERT INTO `t_leave_apply` VALUES ('2', '2017-11-08 13:34:43', '2017-11-09 13:34:53', '1', '1', '30', '2017-11-08 13:35:05', '3');

-- ----------------------------
-- Table structure for t_maintain
-- ----------------------------
DROP TABLE IF EXISTS `t_maintain`;
CREATE TABLE `t_maintain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isdel` int(11) NOT NULL DEFAULT '0',
  `equipid` bigint(20) DEFAULT NULL,
  `onewarn` int(11) DEFAULT '0',
  `twowarn` int(11) DEFAULT '0',
  `threewarn` int(11) DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `grade` int(11) DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `schemeid` bigint(20) DEFAULT NULL,
  `handledatestamp` bigint(20) DEFAULT NULL,
  `handledate` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_maintain
-- ----------------------------
INSERT INTO `t_maintain` VALUES ('1', '1', '181', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('2', '1', '182', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('3', '1', '183', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('4', '1', '184', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('5', '1', '185', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('6', '1', '186', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('7', '1', '187', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('8', '1', '188', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('9', '1', '189', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('10', '1', '190', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('11', '1', '191', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('12', '1', '192', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('13', '1', '193', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('14', '1', '194', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('15', '1', '195', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('16', '1', '196', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('17', '1', '197', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('18', '1', '198', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('19', '1', '199', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('20', '1', '200', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('21', '1', '201', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('22', '1', '202', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('23', '1', '203', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('24', '1', '204', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('25', '1', '205', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('26', '1', '206', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('27', '1', '207', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('28', '1', '208', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('29', '1', '209', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('30', '1', '210', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('31', '1', '211', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('32', '1', '212', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('33', '1', '213', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('34', '1', '214', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('35', '1', '215', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('36', '1', '216', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('37', '1', '256', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('38', '1', '83', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('39', '1', '84', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('40', '1', '85', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('41', '1', '105', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('42', '1', '106', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('43', '1', '107', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('44', '1', '129', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('45', '1', '130', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('46', '1', '131', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('47', '1', '132', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('48', '1', '133', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('49', '1', '134', '1', '2', '3', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('50', '0', '181', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('51', '0', '182', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('52', '0', '183', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('53', '0', '184', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('54', '0', '185', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('55', '0', '186', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('56', '0', '187', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('57', '0', '188', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('58', '0', '189', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('59', '0', '190', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('60', '0', '191', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('61', '0', '192', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('62', '0', '193', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('63', '0', '194', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('64', '0', '195', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('65', '0', '196', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('66', '0', '197', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('67', '0', '198', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('68', '0', '199', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('69', '0', '200', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('70', '0', '201', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('71', '0', '202', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('72', '0', '203', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('73', '0', '204', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('74', '0', '205', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('75', '0', '206', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('76', '0', '207', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('77', '0', '208', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('78', '0', '209', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('79', '0', '210', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('80', '0', '211', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('81', '0', '212', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('82', '0', '213', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('83', '0', '214', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('84', '0', '215', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('85', '0', '216', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('86', '0', '256', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('87', '0', '83', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('88', '0', '84', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('89', '0', '85', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('90', '0', '105', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('91', '0', '106', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('92', '0', '107', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('93', '0', '129', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('94', '0', '130', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('95', '0', '131', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('96', '0', '132', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('97', '0', '133', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('98', '0', '134', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('99', '0', '181', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('100', '0', '182', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('101', '0', '183', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('102', '0', '184', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('103', '0', '185', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('104', '0', '186', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('105', '0', '187', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('106', '0', '188', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('107', '0', '189', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('108', '0', '190', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('109', '0', '191', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('110', '0', '192', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('111', '0', '193', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('112', '0', '194', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('113', '0', '195', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('114', '0', '196', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('115', '0', '197', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('116', '0', '198', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('117', '0', '199', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('118', '0', '200', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('119', '0', '201', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('120', '0', '202', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('121', '0', '203', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('122', '0', '204', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('123', '0', '205', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('124', '0', '206', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('125', '0', '207', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('126', '0', '208', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('127', '0', '209', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('128', '0', '210', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('129', '0', '211', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('130', '0', '212', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('131', '0', '213', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('132', '0', '214', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('133', '0', '215', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('134', '0', '216', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('135', '0', '256', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('136', '0', '83', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('137', '0', '84', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('138', '0', '85', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('139', '0', '105', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('140', '0', '106', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('141', '0', '107', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('142', '0', '129', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('143', '0', '130', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('144', '0', '131', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('145', '0', '132', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('146', '0', '133', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('147', '0', '134', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('148', '0', '31', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('149', '0', '32', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('150', '0', '33', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('151', '0', '34', '0', '0', '0', '0', '0', '20', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('152', '0', '35', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('153', '0', '36', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('154', '0', '37', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('155', '0', '38', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('156', '0', '39', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('157', '0', '40', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('158', '0', '41', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('159', '0', '42', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('160', '0', '43', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('161', '0', '44', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('162', '0', '45', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('163', '0', '46', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('164', '0', '47', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('165', '0', '48', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('166', '0', '49', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('167', '0', '50', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('168', '0', '51', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('169', '0', '52', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('170', '0', '53', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('171', '0', '54', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('172', '0', '55', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('173', '0', '56', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('174', '0', '57', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('175', '0', '58', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('176', '0', '59', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('177', '0', '60', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('178', '0', '61', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('179', '0', '62', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('180', '0', '63', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('181', '0', '64', '0', '0', '0', '0', '0', '10', '8', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('182', '0', '31', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('183', '0', '32', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('184', '0', '33', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('185', '0', '34', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('186', '0', '35', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('187', '0', '36', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('188', '0', '37', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('189', '0', '38', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('190', '0', '39', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('191', '0', '40', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('192', '0', '41', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('193', '0', '42', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('194', '0', '43', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('195', '0', '44', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('196', '0', '45', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('197', '0', '46', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('198', '0', '47', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('199', '0', '48', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('200', '0', '49', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('201', '0', '50', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('202', '0', '51', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('203', '0', '52', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('204', '0', '53', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('205', '0', '54', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('206', '0', '55', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('207', '0', '56', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('208', '0', '57', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('209', '0', '58', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('210', '0', '59', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('211', '0', '60', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('212', '0', '61', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('213', '0', '62', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('214', '0', '63', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('215', '0', '64', '1', '2', '3', '0', '0', '10', '2', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('216', '0', '253', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('217', '0', '254', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('218', '0', '255', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('219', '0', '253', '1', '2', '3', '0', '0', '10', '3', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('220', '0', '254', '1', '2', '3', '0', '0', '10', '3', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('221', '0', '255', '1', '2', '3', '0', '0', '10', '3', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('222', '0', '20', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('223', '0', '76', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('224', '0', '77', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('225', '0', '78', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('226', '0', '79', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('227', '0', '80', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('228', '0', '97', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('229', '0', '98', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('230', '0', '99', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('231', '0', '100', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('232', '0', '101', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('233', '0', '102', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('234', '0', '121', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('235', '0', '122', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('236', '0', '123', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('237', '0', '124', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('238', '0', '125', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('239', '0', '126', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('240', '0', '137', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('241', '0', '138', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('242', '0', '139', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('243', '0', '140', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('244', '0', '141', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('245', '0', '142', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('246', '0', '20', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('247', '0', '76', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('248', '0', '77', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('249', '0', '78', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('250', '0', '79', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('251', '0', '80', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('252', '0', '97', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('253', '0', '98', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('254', '0', '99', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('255', '0', '100', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('256', '0', '101', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('257', '0', '102', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('258', '0', '121', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('259', '0', '122', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('260', '0', '123', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('261', '0', '124', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('262', '0', '125', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('263', '0', '126', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('264', '0', '137', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('265', '0', '138', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('266', '0', '139', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('267', '0', '140', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('268', '0', '141', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('269', '0', '142', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('270', '0', '21', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('271', '0', '81', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('272', '0', '103', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('273', '0', '104', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('274', '0', '127', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('275', '0', '128', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('276', '0', '135', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('277', '0', '136', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('278', '0', '21', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('279', '0', '81', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('280', '0', '103', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('281', '0', '104', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('282', '0', '127', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('283', '0', '128', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('284', '0', '135', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('285', '0', '136', '1', '2', '3', '0', '0', '10', '5', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('286', '0', '29', '0', '0', '0', '0', '0', '10', '9', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('287', '0', '6', '1', '2', '3', '0', '0', '10', '6', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('288', '0', '30', '0', '0', '0', '0', '0', '10', '7', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('289', '1', '251', '1', '2', '3', '0', '0', '10', '10', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('290', '1', '3', '1', '2', '3', '0', '0', '10', '11', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('291', '1', '4', '1', '2', '3', '0', '0', '10', '11', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('292', '1', '262', '1', '2', '3', '0', '0', '10', '12', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('293', '1', '271', '1', '2', '3', '0', '0', '10', '13', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('294', '1', '315', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('295', '0', '17', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('296', '0', '18', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('297', '0', '217', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('298', '0', '218', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('299', '0', '219', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('300', '0', '220', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('301', '0', '221', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('302', '0', '222', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('303', '0', '223', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('304', '0', '224', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('305', '0', '225', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('306', '0', '226', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('307', '0', '227', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('308', '0', '228', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('309', '0', '229', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('310', '0', '230', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('311', '0', '231', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('312', '0', '232', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('313', '0', '233', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('314', '0', '234', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('315', '0', '235', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('316', '0', '236', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('317', '0', '237', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('318', '0', '238', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('319', '0', '239', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('320', '0', '240', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('321', '0', '241', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('322', '0', '242', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('323', '0', '243', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('324', '0', '244', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('325', '0', '245', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('326', '0', '246', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('327', '0', '247', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('328', '0', '248', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('329', '0', '249', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('330', '0', '250', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('331', '0', '316', '0', '0', '0', '0', '0', '10', '11', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('332', '0', '317', '0', '0', '0', '0', '0', '10', '11', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('333', '0', '6', '1', '2', '3', '0', '0', '10', '3', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('334', '0', '6', '1', '2', '3', '0', '0', '10', '12', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('335', '0', '6', '1', '2', '3', '0', '0', '10', '1', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('336', '0', '6', '1', '2', '3', '0', '0', '10', '4', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('337', '0', '316', '0', '0', '0', '0', '0', '10', '4', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('338', '0', '317', '0', '0', '0', '0', '0', '10', '4', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('345', '1', '318', '1', '2', '3', '0', '0', '10', '4', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('346', '1', '318', '1', '2', '3', '0', '0', '10', '4', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');
INSERT INTO `t_maintain` VALUES ('347', '0', '318', '0', '0', '0', '0', '0', '10', '4', '1510704000000', '2017-11-15 08:00:00', '1', '2017-11-15 08:00:00');

-- ----------------------------
-- Table structure for t_maintain_reject
-- ----------------------------
DROP TABLE IF EXISTS `t_maintain_reject`;
CREATE TABLE `t_maintain_reject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mainid` bigint(20) DEFAULT NULL,
  `isdel` int(11) DEFAULT '0',
  `equipid` bigint(20) DEFAULT NULL,
  `schemeid` bigint(20) DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `check_timestamp` bigint(20) DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_maintain_reject
-- ----------------------------

-- ----------------------------
-- Table structure for t_maintain_unallot
-- ----------------------------
DROP TABLE IF EXISTS `t_maintain_unallot`;
CREATE TABLE `t_maintain_unallot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maintainid` bigint(20) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `startdatestamp` bigint(20) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `enddatestamp` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_maintain_unallot
-- ----------------------------

-- ----------------------------
-- Table structure for t_randomcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_randomcheck`;
CREATE TABLE `t_randomcheck` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passrate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_randomcheck
-- ----------------------------
INSERT INTO `t_randomcheck` VALUES ('1', '80');

-- ----------------------------
-- Table structure for t_rank_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_rank_apply`;
CREATE TABLE `t_rank_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `changeStime` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `changeEtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rank_apply
-- ----------------------------
INSERT INTO `t_rank_apply` VALUES ('1', '10', '2017-11-08 11:17:47', '1', '1', '30', '2017-11-08 11:17:55', '9', '2017-11-06 11:24:51');
INSERT INTO `t_rank_apply` VALUES ('2', '10', '2017-11-08 11:17:47', '1', '1', '30', '2017-11-08 11:17:55', '11', '2017-11-09 11:24:51');

-- ----------------------------
-- Table structure for t_repertory
-- ----------------------------
DROP TABLE IF EXISTS `t_repertory`;
CREATE TABLE `t_repertory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `part_id` bigint(20) DEFAULT NULL,
  `specifications` varchar(255) DEFAULT NULL,
  `unit` varchar(11) DEFAULT NULL,
  `count` int(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `isdel` int(11) DEFAULT '0',
  `warn_count` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repertory
-- ----------------------------
INSERT INTO `t_repertory` VALUES ('1', '65', 'AT10X', '台', '88', '四川康润科技有限公司', '10', '0', '10', '2017-11-09 13:20:26', '1', '2017-11-09 13:20:41', '1');

-- ----------------------------
-- Table structure for t_repertory_come
-- ----------------------------
DROP TABLE IF EXISTS `t_repertory_come`;
CREATE TABLE `t_repertory_come` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repertory_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repertory_come
-- ----------------------------

-- ----------------------------
-- Table structure for t_repertory_out
-- ----------------------------
DROP TABLE IF EXISTS `t_repertory_out`;
CREATE TABLE `t_repertory_out` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repertory_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ifuse` int(11) DEFAULT NULL,
  `abnormal_id` bigint(20) DEFAULT NULL,
  `allocat_id` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repertory_out
-- ----------------------------
INSERT INTO `t_repertory_out` VALUES ('1', '1', '10', '30', '10', '134', '2', '2017-11-09 13:21:17', '9');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `isdel` int(11) DEFAULT NULL,
  `polling` int(11) DEFAULT NULL,
  `rolename` varchar(60) NOT NULL COMMENT '角色名称',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '0', null, '管理人员', null, null);
INSERT INTO `t_role` VALUES ('2', '0', null, '巡检人员', null, null);

-- ----------------------------
-- Table structure for t_scheme
-- ----------------------------
DROP TABLE IF EXISTS `t_scheme`;
CREATE TABLE `t_scheme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fre_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dkindid` bigint(20) DEFAULT NULL COMMENT '设备种类id',
  `isdel` int(11) DEFAULT NULL,
  `content` text,
  `suggestions` text,
  `remark` text,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scheme
-- ----------------------------
INSERT INTO `t_scheme` VALUES ('1', '7', '三节机保养', null, '0', '链条上油、配电箱除尘、轴承上油', '', '', '2017-10-31 10:01:11', '1');
INSERT INTO `t_scheme` VALUES ('2', '7', '供包台保养', null, '0', '皮带除尘、内部除尘、线路检查', '', '', '2017-10-31 10:04:21', '1');
INSERT INTO `t_scheme` VALUES ('3', '7', '环形线保养', null, '0', '皮带除尘、内部除尘、线路检查', '', '', '2017-10-31 10:04:53', '1');
INSERT INTO `t_scheme` VALUES ('4', '7', '默认方案', null, '0', '链条上油、配电箱除尘、轴承上油、螺丝紧固', '', '', '2017-10-31 10:05:31', '1');
INSERT INTO `t_scheme` VALUES ('5', '7', '胶带机保养', null, '0', '链条上油、配电箱除尘、轴承上油、螺丝紧固', '', '', '2017-10-31 10:06:02', '1');
INSERT INTO `t_scheme` VALUES ('6', '6', '电动叉车保养', null, '0', '皮带除尘、内部除尘、线路检查、电动叉车除尘，加蒸馏水', '', '', '2017-10-31 10:09:39', '1');
INSERT INTO `t_scheme` VALUES ('7', '4', '日巡检任务', null, '0', '外观、使用功能查看', '', '', '2017-10-31 10:11:49', '1');
INSERT INTO `t_scheme` VALUES ('8', '4', '供包台巡检', null, '0', '皮带除尘、内部除尘、线路检查', '皮带除尘、内部除尘、线路检查', '皮带除尘、内部除尘、线路检查', '2017-10-31 10:12:20', '1');
INSERT INTO `t_scheme` VALUES ('9', '4', '填表记录', null, '0', '地下配电室巡查，每日6次制表', '', '', '2017-10-31 10:13:44', '1');
INSERT INTO `t_scheme` VALUES ('10', '4', '燃气锅炉房巡检', null, '0', '燃气锅炉房起停，检查，水气用量填表', '', '', '2017-10-31 10:14:27', '1');
INSERT INTO `t_scheme` VALUES ('11', '4', '机房巡检', null, '0', '1.检查机房温、湿度；2.检查机房UPS运行情况；3.检查机房设备运行情况；4.检查机房空调运行情况', '', '', '2017-10-31 10:15:13', '1');
INSERT INTO `t_scheme` VALUES ('12', '7', '测试', null, '0', '二天', '天天', '', '2017-10-31 16:37:14', '1');
INSERT INTO `t_scheme` VALUES ('13', '8', '检查', null, '1', '123', '789', '水电费更换', '2017-11-01 15:08:35', '1');

-- ----------------------------
-- Table structure for t_spotcheck
-- ----------------------------
DROP TABLE IF EXISTS `t_spotcheck`;
CREATE TABLE `t_spotcheck` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) DEFAULT NULL COMMENT '任务名称：\r\n',
  `uid` bigint(20) DEFAULT NULL,
  `checkstatus` int(255) DEFAULT NULL COMMENT '抽查状态：\r\n0：未考核\r\n1：通过\r\n2：不通过',
  `notes` varchar(255) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_spotcheck
-- ----------------------------

-- ----------------------------
-- Table structure for t_taskwork
-- ----------------------------
DROP TABLE IF EXISTS `t_taskwork`;
CREATE TABLE `t_taskwork` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identify` varchar(255) DEFAULT NULL,
  `main_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `allot_id` bigint(20) DEFAULT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  `check_stime` datetime DEFAULT NULL,
  `check_stimestamp` bigint(20) DEFAULT NULL,
  `check_etime` datetime DEFAULT NULL,
  `check_etimestamp` bigint(20) DEFAULT NULL,
  `submit_id` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `hmode` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_taskwork
-- ----------------------------

-- ----------------------------
-- Table structure for t_taskwork_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `t_taskwork_abnormal`;
CREATE TABLE `t_taskwork_abnormal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` bigint(20) DEFAULT NULL,
  `dea_id` bigint(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `h_method` int(11) DEFAULT NULL,
  `h_mode` int(11) DEFAULT NULL,
  `money` double DEFAULT NULL,
  `identify` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `submit_id` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `iswarn` int(11) DEFAULT '0',
  `is_polling` int(11) DEFAULT NULL,
  `describe` text,
  `submit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_taskwork_abnormal
-- ----------------------------

-- ----------------------------
-- Table structure for t_taskwork_normal
-- ----------------------------
DROP TABLE IF EXISTS `t_taskwork_normal`;
CREATE TABLE `t_taskwork_normal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` bigint(20) DEFAULT NULL,
  `dea_id` bigint(20) DEFAULT NULL,
  `submit_id` bigint(20) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_taskwork_normal
-- ----------------------------

-- ----------------------------
-- Table structure for t_taskwork_track
-- ----------------------------
DROP TABLE IF EXISTS `t_taskwork_track`;
CREATE TABLE `t_taskwork_track` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '1分配任务 2转任务 3提交额外任务 4提交任务工单巡检结果 5提交异常工单巡检结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_taskwork_track
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_user_apply`;
CREATE TABLE `t_user_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cgroup_apply_id` bigint(20) DEFAULT NULL COMMENT '换组申请id',
  `leave_apply_id` bigint(20) DEFAULT NULL COMMENT '请假申请id',
  `rank_apply_id` bigint(20) DEFAULT NULL COMMENT '调班申请id',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1换组申请,2请假申请，3调班申请',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_apply
-- ----------------------------

-- ----------------------------
-- Table structure for t_userduty
-- ----------------------------
DROP TABLE IF EXISTS `t_userduty`;
CREATE TABLE `t_userduty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `dayweek` int(11) DEFAULT NULL,
  `frequency` varchar(255) DEFAULT NULL COMMENT '保养频率',
  `olduserid` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `areaids` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `isleave` int(10) DEFAULT NULL COMMENT '是否请假\r\n0：否\r\n1:是',
  `leavetype` varchar(255) DEFAULT NULL COMMENT '请假类型，明文\r\n事假\r\n病假',
  `changeduty` int(10) DEFAULT NULL COMMENT '是否换班\r\n0：没有\r\n1：换班',
  `changeday` datetime DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  `thanDay` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `year` (`year`) USING BTREE,
  KEY `month` (`month`) USING BTREE,
  KEY `daymonth` (`day`) USING BTREE,
  KEY `dayweek` (`dayweek`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userduty
-- ----------------------------
INSERT INTO `t_userduty` VALUES ('1', '2017', '10', '31', '2', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-10-31 08:00:00', '0', null, '0', null, '2017-10-31 11:16:40', '1', '0');
INSERT INTO `t_userduty` VALUES ('2', '2017', '10', '31', '2', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-10-31 08:00:00', '0', null, '0', null, '2017-10-31 11:16:40', '1', '0');
INSERT INTO `t_userduty` VALUES ('3', '2017', '10', '31', '2', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-10-31 08:00:00', '0', null, '0', null, '2017-10-31 11:16:40', '1', '0');
INSERT INTO `t_userduty` VALUES ('4', '2017', '10', '31', '2', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-10-31 08:00:00', '0', null, '0', null, '2017-10-31 11:16:40', '1', '0');
INSERT INTO `t_userduty` VALUES ('9', '2017', '11', '2', '4', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-02 08:00:00', '0', null, '0', null, '2017-10-31 11:18:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('10', '2017', '11', '2', '4', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-02 08:00:00', '0', null, '0', null, '2017-10-31 11:18:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('11', '2017', '11', '2', '4', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-02 08:00:00', '0', null, '0', null, '2017-10-31 11:18:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('12', '2017', '11', '2', '4', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-02 08:00:00', '0', null, '0', null, '2017-10-31 11:18:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('13', '2017', '11', '3', '5', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-03 08:00:00', '0', null, '0', null, '2017-10-31 11:18:36', '1', '0');
INSERT INTO `t_userduty` VALUES ('14', '2017', '11', '3', '5', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-03 08:00:00', '0', null, '0', null, '2017-10-31 11:18:36', '1', '0');
INSERT INTO `t_userduty` VALUES ('15', '2017', '11', '3', '5', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-03 08:00:00', '0', null, '0', null, '2017-10-31 11:18:36', '1', '0');
INSERT INTO `t_userduty` VALUES ('16', '2017', '11', '3', '5', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-03 08:00:00', '0', null, '0', null, '2017-10-31 11:18:36', '1', '0');
INSERT INTO `t_userduty` VALUES ('17', '2017', '11', '4', '6', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-04 08:00:00', '0', null, '0', null, '2017-10-31 11:18:59', '1', '0');
INSERT INTO `t_userduty` VALUES ('18', '2017', '11', '4', '6', 'day,week,month,quarter,halfyear,year,', '6', '6', '2,3,4,5,6,7,8,9,10,11,', '2017-11-04 08:00:00', '0', null, '0', null, '2017-10-31 11:18:59', '1', '0');
INSERT INTO `t_userduty` VALUES ('19', '2017', '11', '4', '6', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-04 08:00:00', '0', null, '0', null, '2017-10-31 11:18:59', '1', '0');
INSERT INTO `t_userduty` VALUES ('20', '2017', '11', '4', '6', 'day,week,month,quarter,halfyear,year,', '8', '8', '2,3,4,5,6,7,8,9,10,11,', '2017-11-04 08:00:00', '0', null, '0', null, '2017-10-31 11:18:59', '1', '0');
INSERT INTO `t_userduty` VALUES ('21', '2017', '11', '5', '0', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-05 08:00:00', '0', null, '0', null, '2017-10-31 11:19:16', '1', '0');
INSERT INTO `t_userduty` VALUES ('22', '2017', '11', '5', '0', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-05 08:00:00', '0', null, '0', null, '2017-10-31 11:19:16', '1', '0');
INSERT INTO `t_userduty` VALUES ('23', '2017', '11', '5', '0', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-05 08:00:00', '0', null, '0', null, '2017-10-31 11:19:16', '1', '0');
INSERT INTO `t_userduty` VALUES ('24', '2017', '11', '5', '0', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-05 08:00:00', '0', null, '0', null, '2017-10-31 11:19:16', '1', '0');
INSERT INTO `t_userduty` VALUES ('29', '2017', '11', '7', '2', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-07 08:00:00', '0', null, '0', null, '2017-10-31 11:19:52', '1', '0');
INSERT INTO `t_userduty` VALUES ('30', '2017', '11', '7', '2', 'day,week,month,quarter,halfyear,year,', '6', '6', '2,3,4,5,6,7,8,9,10,11,', '2017-11-07 08:00:00', '0', null, '0', null, '2017-10-31 11:19:52', '1', '0');
INSERT INTO `t_userduty` VALUES ('31', '2017', '11', '7', '2', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-07 08:00:00', '0', null, '0', null, '2017-10-31 11:19:52', '1', '0');
INSERT INTO `t_userduty` VALUES ('32', '2017', '11', '7', '2', 'day,week,month,quarter,halfyear,year,', '8', '8', '2,3,4,5,6,7,8,9,10,11,', '2017-11-07 08:00:00', '0', null, '0', null, '2017-10-31 11:19:52', '1', '0');
INSERT INTO `t_userduty` VALUES ('33', '2017', '11', '8', '3', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-08 08:00:00', '1', '1', '0', null, '2017-10-31 11:20:07', '1', '0');
INSERT INTO `t_userduty` VALUES ('34', '2017', '11', '8', '3', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-08 08:00:00', '0', null, '0', null, '2017-10-31 11:20:08', '1', '0');
INSERT INTO `t_userduty` VALUES ('35', '2017', '11', '8', '3', 'day,week,month,quarter,halfyear,year,', '9', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-08 08:00:00', '0', null, '1', '2017-11-06 11:24:51', '2017-10-31 11:20:08', '1', '0');
INSERT INTO `t_userduty` VALUES ('36', '2017', '11', '8', '3', 'day,week,month,quarter,halfyear,year,', '11', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-08 08:00:00', '0', null, '1', '2017-11-09 11:24:51', '2017-10-31 11:20:08', '1', '0');
INSERT INTO `t_userduty` VALUES ('41', '2017', '11', '10', '5', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-10 08:00:00', '0', null, '0', null, '2017-10-31 11:20:45', '1', '0');
INSERT INTO `t_userduty` VALUES ('42', '2017', '11', '10', '5', 'day,week,month,quarter,halfyear,year,', '6', '6', '2,3,4,5,6,7,8,9,10,11,', '2017-11-10 08:00:00', '0', null, '0', null, '2017-10-31 11:20:45', '1', '0');
INSERT INTO `t_userduty` VALUES ('43', '2017', '11', '10', '5', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-10 08:00:00', '0', null, '0', null, '2017-10-31 11:20:45', '1', '0');
INSERT INTO `t_userduty` VALUES ('44', '2017', '11', '10', '5', 'day,week,month,quarter,halfyear,year,', '8', '8', '2,3,4,5,6,7,8,9,10,11,', '2017-11-10 08:00:00', '0', null, '0', null, '2017-10-31 11:20:45', '1', '0');
INSERT INTO `t_userduty` VALUES ('54', '2017', '11', '1', '3', 'day,week,month,quarter,halfyear,year,', '14', '14', '2,3,4,5,6,7,8,9,10,11,', '2017-11-01 08:00:00', '0', null, '0', null, '2017-11-01 15:42:50', '1', '0');
INSERT INTO `t_userduty` VALUES ('55', '2017', '11', '1', '3', 'day,week,month,quarter,halfyear,year,', '15', '15', '2,3,4,5,6,7,8,9,10,11,', '2017-11-01 08:00:00', '0', null, '0', null, '2017-11-01 15:42:50', '1', '0');
INSERT INTO `t_userduty` VALUES ('56', '2017', '11', '6', '1', 'day,week,month,quarter,halfyear,year,', '10', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-06 08:00:00', '0', null, '1', '2017-11-08 11:17:47', '2017-11-06 12:01:07', '1', '0');
INSERT INTO `t_userduty` VALUES ('99', '2017', '11', '11', '6', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-11 08:00:00', '0', null, '0', null, '2017-11-09 09:37:35', '1', '0');
INSERT INTO `t_userduty` VALUES ('100', '2017', '11', '11', '6', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-11 08:00:00', '1', '事假', '0', null, '2017-11-09 09:37:35', '1', '0');
INSERT INTO `t_userduty` VALUES ('101', '2017', '11', '11', '6', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-11 08:00:00', '1', '病假', '0', null, '2017-11-09 09:37:35', '1', '0');
INSERT INTO `t_userduty` VALUES ('111', '2017', '11', '9', '4', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-09 08:00:00', '1', '1', '0', null, '2017-11-09 10:16:37', '1', '0');
INSERT INTO `t_userduty` VALUES ('112', '2017', '11', '9', '4', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-09 08:00:00', '1', '1', '0', null, '2017-11-09 10:16:37', '1', '0');
INSERT INTO `t_userduty` VALUES ('113', '2017', '11', '9', '4', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-09 08:00:00', '0', null, '0', null, '2017-11-09 10:16:38', '1', '0');
INSERT INTO `t_userduty` VALUES ('120', '2017', '11', '20', '1', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-20 08:00:00', '0', null, '0', null, '2017-11-19 11:29:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('121', '2017', '11', '20', '1', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,9,10,11,', '2017-11-20 08:00:00', '0', null, '0', null, '2017-11-19 11:29:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('122', '2017', '11', '20', '1', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-20 08:00:00', '0', null, '0', null, '2017-11-19 11:29:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('123', '2017', '11', '20', '1', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,9,10,11,', '2017-11-20 08:00:00', '0', null, '0', null, '2017-11-19 11:29:14', '1', '0');
INSERT INTO `t_userduty` VALUES ('124', '2017', '11', '21', '2', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,9,10,11,', '2017-11-21 08:00:00', '0', null, '0', null, '2017-11-19 11:31:15', '1', '0');
INSERT INTO `t_userduty` VALUES ('125', '2017', '11', '21', '2', 'day,week,month,quarter,halfyear,year,', '6', '6', '2,3,4,5,6,7,9,10,11,', '2017-11-21 08:00:00', '0', null, '0', null, '2017-11-19 11:31:15', '1', '0');
INSERT INTO `t_userduty` VALUES ('126', '2017', '11', '21', '2', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-21 08:00:00', '0', null, '0', null, '2017-11-19 11:31:15', '1', '0');
INSERT INTO `t_userduty` VALUES ('127', '2017', '11', '21', '2', 'day,week,month,quarter,halfyear,year,', '8', '8', '2,3,4,5,6,7,9,10,11,', '2017-11-21 08:00:00', '0', null, '0', null, '2017-11-19 11:31:15', '1', '0');
INSERT INTO `t_userduty` VALUES ('128', '2017', '11', '22', '3', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,9,10,11,', '2017-11-22 08:00:00', '0', null, '0', null, '2017-11-19 11:33:09', '1', '0');
INSERT INTO `t_userduty` VALUES ('129', '2017', '11', '22', '3', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,9,10,11,', '2017-11-22 08:00:00', '0', null, '0', null, '2017-11-19 11:33:09', '1', '0');
INSERT INTO `t_userduty` VALUES ('130', '2017', '11', '22', '3', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,9,10,11,', '2017-11-22 08:00:00', '0', null, '0', null, '2017-11-19 11:33:09', '1', '0');
INSERT INTO `t_userduty` VALUES ('131', '2017', '11', '22', '3', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-22 08:00:00', '0', null, '0', null, '2017-11-19 11:33:09', '1', '0');
INSERT INTO `t_userduty` VALUES ('132', '2017', '11', '23', '4', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-23 08:00:00', '0', null, '0', null, '2017-11-19 11:34:00', '1', '0');
INSERT INTO `t_userduty` VALUES ('133', '2017', '11', '23', '4', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-23 08:00:00', '0', null, '0', null, '2017-11-19 11:34:00', '1', '0');
INSERT INTO `t_userduty` VALUES ('134', '2017', '11', '23', '4', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-23 08:00:00', '0', null, '0', null, '2017-11-19 11:34:00', '1', '0');
INSERT INTO `t_userduty` VALUES ('135', '2017', '11', '23', '4', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-23 08:00:00', '0', null, '0', null, '2017-11-19 11:34:00', '1', '0');
INSERT INTO `t_userduty` VALUES ('136', '2017', '11', '24', '5', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-24 08:00:00', '0', null, '0', null, '2017-11-19 11:34:31', '1', '0');
INSERT INTO `t_userduty` VALUES ('137', '2017', '11', '24', '5', 'day,week,month,quarter,halfyear,year,', '6', '6', '2,3,4,5,6,7,8,9,10,11,', '2017-11-24 08:00:00', '0', null, '0', null, '2017-11-19 11:34:31', '1', '0');
INSERT INTO `t_userduty` VALUES ('138', '2017', '11', '24', '5', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-24 08:00:00', '0', null, '0', null, '2017-11-19 11:34:31', '1', '0');
INSERT INTO `t_userduty` VALUES ('139', '2017', '11', '24', '5', 'day,week,month,quarter,halfyear,year,', '8', '8', '2,3,4,5,6,7,8,9,10,11,', '2017-11-24 08:00:00', '0', null, '0', null, '2017-11-19 11:34:31', '1', '0');
INSERT INTO `t_userduty` VALUES ('140', '2017', '11', '25', '6', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-25 08:00:00', '0', null, '0', null, '2017-11-19 11:34:44', '1', '0');
INSERT INTO `t_userduty` VALUES ('141', '2017', '11', '25', '6', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-25 08:00:00', '0', null, '0', null, '2017-11-19 11:34:44', '1', '0');
INSERT INTO `t_userduty` VALUES ('142', '2017', '11', '25', '6', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-25 08:00:00', '0', null, '0', null, '2017-11-19 11:34:44', '1', '0');
INSERT INTO `t_userduty` VALUES ('143', '2017', '11', '25', '6', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-25 08:00:00', '0', null, '0', null, '2017-11-19 11:34:44', '1', '0');
INSERT INTO `t_userduty` VALUES ('144', '2017', '11', '26', '0', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-26 08:00:00', '0', null, '0', null, '2017-11-19 11:35:01', '1', '0');
INSERT INTO `t_userduty` VALUES ('145', '2017', '11', '26', '0', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-26 08:00:00', '0', null, '0', null, '2017-11-19 11:35:01', '1', '0');
INSERT INTO `t_userduty` VALUES ('146', '2017', '11', '26', '0', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-26 08:00:00', '0', null, '0', null, '2017-11-19 11:35:01', '1', '0');
INSERT INTO `t_userduty` VALUES ('147', '2017', '11', '26', '0', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-26 08:00:00', '0', null, '0', null, '2017-11-19 11:35:01', '1', '0');
INSERT INTO `t_userduty` VALUES ('154', '2017', '11', '12', '0', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-12 08:00:00', '0', null, '0', null, '2017-11-19 15:07:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('155', '2017', '11', '12', '0', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-12 08:00:00', '0', null, '0', null, '2017-11-19 15:07:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('156', '2017', '11', '12', '0', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-12 08:00:00', '0', null, '0', null, '2017-11-19 15:07:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('157', '2017', '11', '12', '0', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-12 08:00:00', '0', null, '0', null, '2017-11-19 15:07:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('158', '2017', '11', '13', '1', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-13 08:00:00', '0', null, '0', null, '2017-11-19 15:07:53', '1', '0');
INSERT INTO `t_userduty` VALUES ('159', '2017', '11', '13', '1', 'day,week,month,quarter,halfyear,year,', '6', '6', '2,3,4,5,6,7,8,9,10,11,', '2017-11-13 08:00:00', '0', null, '0', null, '2017-11-19 15:07:53', '1', '0');
INSERT INTO `t_userduty` VALUES ('160', '2017', '11', '13', '1', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-13 08:00:00', '0', null, '0', null, '2017-11-19 15:07:53', '1', '0');
INSERT INTO `t_userduty` VALUES ('161', '2017', '11', '13', '1', 'day,week,month,quarter,halfyear,year,', '8', '8', '2,3,4,5,6,7,8,9,10,11,', '2017-11-13 08:00:00', '0', null, '0', null, '2017-11-19 15:07:53', '1', '0');
INSERT INTO `t_userduty` VALUES ('162', '2017', '11', '14', '2', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-14 08:00:00', '0', null, '0', null, '2017-11-19 15:08:05', '1', '0');
INSERT INTO `t_userduty` VALUES ('163', '2017', '11', '14', '2', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-14 08:00:00', '0', null, '0', null, '2017-11-19 15:08:05', '1', '0');
INSERT INTO `t_userduty` VALUES ('164', '2017', '11', '14', '2', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-14 08:00:00', '0', null, '0', null, '2017-11-19 15:08:05', '1', '0');
INSERT INTO `t_userduty` VALUES ('165', '2017', '11', '14', '2', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-14 08:00:00', '0', null, '0', null, '2017-11-19 15:08:05', '1', '0');
INSERT INTO `t_userduty` VALUES ('166', '2017', '11', '15', '3', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-15 08:00:00', '0', null, '0', null, '2017-11-19 15:08:18', '1', '0');
INSERT INTO `t_userduty` VALUES ('167', '2017', '11', '15', '3', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-15 08:00:00', '0', null, '0', null, '2017-11-19 15:08:18', '1', '0');
INSERT INTO `t_userduty` VALUES ('168', '2017', '11', '15', '3', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-15 08:00:00', '0', null, '0', null, '2017-11-19 15:08:18', '1', '0');
INSERT INTO `t_userduty` VALUES ('169', '2017', '11', '15', '3', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-15 08:00:00', '0', null, '0', null, '2017-11-19 15:08:18', '1', '0');
INSERT INTO `t_userduty` VALUES ('170', '2017', '11', '16', '4', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-16 08:00:00', '0', null, '0', null, '2017-11-19 15:08:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('171', '2017', '11', '16', '4', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-16 08:00:00', '0', null, '0', null, '2017-11-19 15:08:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('172', '2017', '11', '16', '4', 'day,week,month,quarter,halfyear,year,', '4', '4', '2,3,4,5,6,7,8,9,10,11,', '2017-11-16 08:00:00', '0', null, '0', null, '2017-11-19 15:08:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('173', '2017', '11', '16', '4', 'day,week,month,quarter,halfyear,year,', '7', '7', '2,3,4,5,6,7,8,9,10,11,', '2017-11-16 08:00:00', '0', null, '0', null, '2017-11-19 15:08:27', '1', '0');
INSERT INTO `t_userduty` VALUES ('174', '2017', '11', '17', '5', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-17 08:00:00', '0', null, '0', null, '2017-11-19 15:08:58', '1', '0');
INSERT INTO `t_userduty` VALUES ('175', '2017', '11', '17', '5', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-17 08:00:00', '0', null, '0', null, '2017-11-19 15:08:58', '1', '0');
INSERT INTO `t_userduty` VALUES ('176', '2017', '11', '17', '5', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-17 08:00:00', '0', null, '0', null, '2017-11-19 15:08:58', '1', '0');
INSERT INTO `t_userduty` VALUES ('177', '2017', '11', '17', '5', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-17 08:00:00', '0', null, '0', null, '2017-11-19 15:08:58', '1', '0');
INSERT INTO `t_userduty` VALUES ('178', '2017', '11', '18', '6', 'day,week,month,quarter,halfyear,year,', '2', '2', '2,3,4,5,6,7,8,9,10,11,', '2017-11-18 08:00:00', '0', null, '0', null, '2017-11-19 15:09:12', '1', '0');
INSERT INTO `t_userduty` VALUES ('179', '2017', '11', '18', '6', 'day,week,month,quarter,halfyear,year,', '10', '10', '2,3,4,5,6,7,8,9,10,11,', '2017-11-18 08:00:00', '0', null, '0', null, '2017-11-19 15:09:12', '1', '0');
INSERT INTO `t_userduty` VALUES ('180', '2017', '11', '18', '6', 'day,week,month,quarter,halfyear,year,', '12', '12', '2,3,4,5,6,7,8,9,10,11,', '2017-11-18 08:00:00', '0', null, '0', null, '2017-11-19 15:09:12', '1', '0');
INSERT INTO `t_userduty` VALUES ('181', '2017', '11', '18', '6', 'day,week,month,quarter,halfyear,year,', '13', '13', '2,3,4,5,6,7,8,9,10,11,', '2017-11-18 08:00:00', '0', null, '0', null, '2017-11-19 15:09:12', '1', '0');
INSERT INTO `t_userduty` VALUES ('182', '2017', '11', '19', '0', 'day,week,month,quarter,halfyear,year,', '3', '3', '2,3,4,5,6,7,8,9,10,11,', '2017-11-19 08:00:00', '0', null, '0', null, '2017-11-19 15:09:43', '1', '0');
INSERT INTO `t_userduty` VALUES ('183', '2017', '11', '19', '0', 'day,week,month,quarter,halfyear,year,', '5', '5', '2,3,4,5,6,7,8,9,10,11,', '2017-11-19 08:00:00', '0', null, '0', null, '2017-11-19 15:09:43', '1', '0');
INSERT INTO `t_userduty` VALUES ('184', '2017', '11', '19', '0', 'day,week,month,quarter,halfyear,year,', '9', '9', '2,3,4,5,6,7,8,9,10,11,', '2017-11-19 08:00:00', '0', null, '0', null, '2017-11-19 15:09:43', '1', '0');
INSERT INTO `t_userduty` VALUES ('185', '2017', '11', '19', '0', 'day,week,month,quarter,halfyear,year,', '11', '11', '2,3,4,5,6,7,8,9,10,11,', '2017-11-19 08:00:00', '0', null, '0', null, '2017-11-19 15:09:43', '1', '0');

-- ----------------------------
-- Table structure for t_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `t_usergroup`;
CREATE TABLE `t_usergroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(60) DEFAULT NULL COMMENT '组名称',
  `ismana` int(10) DEFAULT NULL,
  `isdel` int(10) DEFAULT NULL COMMENT '角色id',
  `description` text COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_usergroup
-- ----------------------------
INSERT INTO `t_usergroup` VALUES ('1', '黄治成组', '0', '0', '负责当日值班巡查工作，集散中心所有设备\r\n\r\n（分拣机、胶带机、网络设备、水电设备等）的维修保养工作', '2017-10-27 18:24:38', '1');
INSERT INTO `t_usergroup` VALUES ('2', '管理组', '1', '0', '负责管理所有巡检任务', '2017-10-27 18:24:47', '1');
INSERT INTO `t_usergroup` VALUES ('3', '叶果组', '0', '0', '负责当日值班巡查工作，集散中心所有设备（\r\n\r\n分拣机、胶带机、网络设备、水电设备等）的维修保养工作', '2017-10-31 11:07:33', '1');
INSERT INTO `t_usergroup` VALUES ('4', '邓海军组', '0', '0', '负责当日值班巡查工作，集散中心所有设备\r\n\r\n（分拣机、胶带机、网络设备、水电设备等）的维修保养工作', '2017-10-31 11:07:47', '1');

-- ----------------------------
-- Table structure for t_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` bigint(20) NOT NULL,
  `roleid` bigint(20) DEFAULT NULL,
  `loginaccount` varchar(255) NOT NULL,
  `loginpasswd` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `phoneauth` bit(1) DEFAULT b'0' COMMENT '是否允许手机登陆',
  `webauth` bit(1) DEFAULT b'0' COMMENT '是否允许web登录',
  `email` varchar(255) DEFAULT NULL,
  `urlImage` varchar(255) DEFAULT NULL,
  `fixtype` varchar(255) DEFAULT NULL,
  `isdel` int(10) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATOR_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('1', '2', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', null, null, '', '', null, '/userImg/user_1.jpg', null, '0', null, null);
INSERT INTO `t_userinfo` VALUES ('2', '1', '2', '15390411123', '2c5f32cc85984af711fb2d22a3e84eab', '薛腾', '15390411123', '男', '', '\0', '', null, '3', '0', '2017-10-31 10:55:30', '1');
INSERT INTO `t_userinfo` VALUES ('3', '3', '2', '15928667383', '832b3bac7b442ef2e16b9756505d021a', '彭德应', '15928667383', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 10:56:42', '1');
INSERT INTO `t_userinfo` VALUES ('4', '4', '2', '18381089108', 'fe0ee83e971958b48d8224f9916d937c', '兰宇', '18381089108', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 10:57:15', '1');
INSERT INTO `t_userinfo` VALUES ('5', '3', '2', '13890283214', '60b32d73061939ebda8ad8db32fdf152', '钟跃', '13890283214', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 10:57:56', '1');
INSERT INTO `t_userinfo` VALUES ('6', '4', '2', '13540799610', 'cd00f718e88302bfd653b8f2ef70acba', '夏乡', '13540799610', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 11:00:19', '1');
INSERT INTO `t_userinfo` VALUES ('7', '4', '2', '18030511012', 'ce8666b802b93b585580729f72ef0bba', '曾啸涛', '18030511012', '男', '', '\0', '', null, '3', '0', '2017-10-31 11:01:22', '1');
INSERT INTO `t_userinfo` VALUES ('8', '4', '2', '18982002278', 'fd891e8b9cb1d8149139c35285cae506', '邓海军', '18982002278', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 11:01:50', '1');
INSERT INTO `t_userinfo` VALUES ('9', '3', '2', '18190702985', '427ce292cafcc76680b51021b827bbbb', '叶果', '18190702985', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 11:02:15', '1');
INSERT INTO `t_userinfo` VALUES ('10', '1', '2', '15198196459', 'c9fc926e21feb96f46e5fe5196e5e146', '黄治成', '15198196459', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 11:02:47', '1');
INSERT INTO `t_userinfo` VALUES ('11', '3', '2', '18980603203', '31c55a95b2b8de9a410ce0ac01c5acdf', '何涛', '18980603203', '男', '', '\0', '', '/userImg/user_11.png', '3', '0', '2017-10-31 11:03:14', '1');
INSERT INTO `t_userinfo` VALUES ('12', '1', '2', '13708024134', 'd694a4d4e351f98707ee6422a76a23cf', '任言凯', '13708024134', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 11:03:39', '1');
INSERT INTO `t_userinfo` VALUES ('13', '1', '2', '18030866551', '550d00f347ae154a03d32b51e486b82a', '胡涛', '18030866551', '男', '', '\0', '', null, '2,1', '0', '2017-10-31 11:04:04', '1');
INSERT INTO `t_userinfo` VALUES ('14', '1', '1', '18048530508', '202cb962ac59075b964b07152d234b70', '志超', '18048530508', '男', '', '', '', null, '2,1', '1', '2017-11-01 15:12:40', '1');
INSERT INTO `t_userinfo` VALUES ('15', '1', '1', '18200414145', '1aa6157fa8f1e33660e98884fecf279', '罗从劲', '18200414145', '男', '', '', '410454553@qq.com', null, '2,1', '1', '2017-11-01 15:35:41', '1');

-- ----------------------------
-- Table structure for t_warning
-- ----------------------------
DROP TABLE IF EXISTS `t_warning`;
CREATE TABLE `t_warning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate` varchar(255) DEFAULT NULL,
  `onewarn` int(11) DEFAULT NULL,
  `twowarn` int(11) DEFAULT NULL,
  `threewarn` int(11) DEFAULT NULL,
  `frequency_identify` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rate` (`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_warning
-- ----------------------------
INSERT INTO `t_warning` VALUES ('1', '日', '1', '2', '3', 'day');
INSERT INTO `t_warning` VALUES ('2', '周', '4', '5', '6', 'week');
INSERT INTO `t_warning` VALUES ('3', '月', '0', '5', '0', 'month');
INSERT INTO `t_warning` VALUES ('4', '季度', '1', '2', '3', 'quarter');
INSERT INTO `t_warning` VALUES ('5', '半年', '0', '0', '0', 'halfyear');
INSERT INTO `t_warning` VALUES ('6', '年', '0', '0', '0', 'year');
