/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : storage

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-03-26 18:04:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` varchar(30) DEFAULT NULL,
  `good_name` varchar(50) DEFAULT NULL,
  `good_type` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'D01', '防晒霜', '防晒系列', '0', '198', '', '已检验', '2016-05-22 16:48:34');
INSERT INTO `goods` VALUES ('2', 'D02', '晒后修护露', '防晒系列', '0', '135', '', '已检验', '2016-05-22 16:49:11');
INSERT INTO `goods` VALUES ('3', 'A01', '亮彩洗面霜', '护肤系列', '0', '218', '', '已检验', '2016-05-22 16:52:33');
INSERT INTO `goods` VALUES ('4', 'A02', '亮彩爽肤水', '护肤系列', '0', '218', '', '已检验', '2016-05-22 16:53:09');
INSERT INTO `goods` VALUES ('5', 'A03', '亮彩精华液', '护肤系列', '5', '680', '', '未检验', '2016-05-22 16:54:53');
INSERT INTO `goods` VALUES ('6', 'A04', '柔性洗面霜', '护肤系列', '8', '120', '', '未检验', '2016-05-22 16:56:56');
INSERT INTO `goods` VALUES ('7', 'B01', '唇彩', '彩妆系列', '10', '168', '', '未检验', '2016-05-22 16:58:04');
INSERT INTO `goods` VALUES ('9', 'B03', '眼影', '彩妆系列', '6', '68', '', '未检验', '2016-05-22 17:00:08');
INSERT INTO `goods` VALUES ('11', 'C01', '沐浴乳', '护体系列', '10', '168', '湿润爽肤', '未检验', '2016-05-22 17:02:34');
INSERT INTO `goods` VALUES ('12', 'C02', '润肤乳', '护体系列', '0', '168', '', '已检验', '2016-05-22 17:03:01');
INSERT INTO `goods` VALUES ('13', 'C03', '护手霜', '护体系列', '0', '35', '', '已检验', '2016-05-22 17:04:03');
INSERT INTO `goods` VALUES ('14', 'D012', '湿润霜', '护肤系列', '0', '132', '131', '已检验', '2016-05-23 23:09:31');

-- ----------------------------
-- Table structure for inter_goods
-- ----------------------------
DROP TABLE IF EXISTS `inter_goods`;
CREATE TABLE `inter_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` varchar(30) DEFAULT NULL,
  `good_name` varchar(50) DEFAULT NULL,
  `good_type` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `intime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inter_goods
-- ----------------------------
INSERT INTO `inter_goods` VALUES ('1', 'D01', '防晒霜', '防晒系列', '0', '198', '', '2016-05-22 17:08:37');
INSERT INTO `inter_goods` VALUES ('2', 'C02', '润肤乳', '护体系列', '0', '168', '', '2016-05-23 23:15:15');
INSERT INTO `inter_goods` VALUES ('3', 'C03', '护手霜', '护体系列', '3', '35', '', '2016-05-24 21:28:06');
INSERT INTO `inter_goods` VALUES ('4', 'D012', '湿润霜', '护肤系列', '0', '132', '131', '2016-05-24 21:31:43');
INSERT INTO `inter_goods` VALUES ('5', 'D02', '晒后修护露', '防晒系列', '11', '135', '', '2016-06-04 13:34:33');
INSERT INTO `inter_goods` VALUES ('6', 'A01', '亮彩洗面霜', '护肤系列', '4', '218', '', '2016-06-04 13:52:13');
INSERT INTO `inter_goods` VALUES ('7', 'A02', '亮彩爽肤水', '护肤系列', '4', '218', '', '2016-06-04 13:52:25');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '666666', '13666666323', 'admin@163.com', '2016-05-23 23:17:34');

-- ----------------------------
-- Table structure for outer_goods
-- ----------------------------
DROP TABLE IF EXISTS `outer_goods`;
CREATE TABLE `outer_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` varchar(30) DEFAULT NULL,
  `good_name` varchar(50) DEFAULT NULL,
  `good_type` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outer_goods
-- ----------------------------
INSERT INTO `outer_goods` VALUES ('1', 'C02', '润肤乳', '护体系列', '3', '168', '', '2016-05-23 23:15:24');
INSERT INTO `outer_goods` VALUES ('2', 'C03', '护手霜', '护体系列', '15', '35', '', '2016-05-24 21:29:57');
INSERT INTO `outer_goods` VALUES ('3', 'D012', '湿润霜', '护肤系列', '4', '132', '131', '2016-05-24 21:32:00');
INSERT INTO `outer_goods` VALUES ('4', 'C02', '润肤乳', '护体系列', '3', '168', '', '2016-06-04 13:34:53');
INSERT INTO `outer_goods` VALUES ('5', 'D01', '防晒霜', '防晒系列', '4', '198', '', '2016-06-04 13:35:06');
INSERT INTO `outer_goods` VALUES ('6', 'D01', '防晒霜', '防晒系列', '1', '198', '', '2016-06-04 13:35:11');
INSERT INTO `outer_goods` VALUES ('7', 'D012', '湿润霜', '护肤系列', '1', '132', '131', '2016-06-04 13:39:10');
INSERT INTO `outer_goods` VALUES ('8', 'C02', '润肤乳', '护体系列', '2', '168', '', '2016-06-04 13:52:33');

-- ----------------------------
-- Table structure for return_goods
-- ----------------------------
DROP TABLE IF EXISTS `return_goods`;
CREATE TABLE `return_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` varchar(30) DEFAULT NULL,
  `good_name` varchar(50) DEFAULT NULL,
  `good_type` varchar(50) DEFAULT NULL,
  `amout` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `checktime` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return_goods
-- ----------------------------
INSERT INTO `return_goods` VALUES ('6', 'C03', '护手霜', '护体系列', '2', '35', '', '2016-05-24 21:28:07', '未退货');
INSERT INTO `return_goods` VALUES ('7', 'D02', '晒后修护露', '防晒系列', '1', '135', '', '2016-06-04 13:34:33', '未退货');
INSERT INTO `return_goods` VALUES ('8', 'A01', '亮彩洗面霜', '护肤系列', '1', '218', '', '2016-06-04 13:52:13', '未退货');
INSERT INTO `return_goods` VALUES ('9', 'A02', '亮彩爽肤水', '护肤系列', '1', '218', '', '2016-06-04 13:52:26', '未退货');

-- ----------------------------
-- Table structure for type_manager
-- ----------------------------
DROP TABLE IF EXISTS `type_manager`;
CREATE TABLE `type_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_manager
-- ----------------------------
INSERT INTO `type_manager` VALUES ('1', '护肤系列', '2016-05-22 16:32:58');
INSERT INTO `type_manager` VALUES ('2', '彩妆系列', '2016-05-22 16:33:11');
INSERT INTO `type_manager` VALUES ('3', '护体系列', '2016-05-22 16:37:22');
INSERT INTO `type_manager` VALUES ('4', '防晒系列', '2016-05-22 16:37:38');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '王明', '666666', '13666666655', 'wangming@163.com', '2016-05-24 21:32:33');
