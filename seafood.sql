/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : seafood

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 02/05/2018 15:39:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sea_admin
-- ----------------------------
DROP TABLE IF EXISTS `sea_admin`;
CREATE TABLE `sea_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start` tinyint(4) NOT NULL DEFAULT 1,
  `level` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_bank
-- ----------------------------
DROP TABLE IF EXISTS `sea_bank`;
CREATE TABLE `sea_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bankName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bankLogo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `home` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isDelete` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_bets
-- ----------------------------
DROP TABLE IF EXISTS `sea_bets`;
CREATE TABLE `sea_bets`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `playedId` tinyint(4) NOT NULL,
  `actionNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `actionData` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kjData` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ',
  `kjTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ',
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `boss` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_boss
-- ----------------------------
DROP TABLE IF EXISTS `sea_boss`;
CREATE TABLE `sea_boss`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `actionNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_data
-- ----------------------------
DROP TABLE IF EXISTS `sea_data`;
CREATE TABLE `sea_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_data
-- ----------------------------
INSERT INTO `sea_data` VALUES (149, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (150, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (151, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (152, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (153, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (154, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (155, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (156, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (157, '1524881727', '20180428008', '*,2,6');
INSERT INTO `sea_data` VALUES (158, '1524882338', '20180428009', '*,4,6');
INSERT INTO `sea_data` VALUES (159, '1524882338', '20180428009', '*,4,6');

-- ----------------------------
-- Table structure for sea_datatime
-- ----------------------------
DROP TABLE IF EXISTS `sea_datatime`;
CREATE TABLE `sea_datatime`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `actionNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `actionTime` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_datatime
-- ----------------------------
INSERT INTO `sea_datatime` VALUES (1, '1', '09:10:00');
INSERT INTO `sea_datatime` VALUES (2, '2', '09:20:00');
INSERT INTO `sea_datatime` VALUES (3, '3', '09:30:00');
INSERT INTO `sea_datatime` VALUES (4, '4', '09:40:00');
INSERT INTO `sea_datatime` VALUES (5, '5', '09:50:00');
INSERT INTO `sea_datatime` VALUES (6, '6', '10:00:00');
INSERT INTO `sea_datatime` VALUES (7, '7', '10:10:00');
INSERT INTO `sea_datatime` VALUES (8, '8', '10:20:00');
INSERT INTO `sea_datatime` VALUES (9, '9', '10:30:00');
INSERT INTO `sea_datatime` VALUES (10, '10', '10:40:00');
INSERT INTO `sea_datatime` VALUES (11, '11', '10:50:00');
INSERT INTO `sea_datatime` VALUES (12, '12', '11:00:00');
INSERT INTO `sea_datatime` VALUES (13, '13', '11:10:00');
INSERT INTO `sea_datatime` VALUES (14, '14', '11:20:00');
INSERT INTO `sea_datatime` VALUES (15, '15', '11:30:00');
INSERT INTO `sea_datatime` VALUES (16, '16', '11:40:00');
INSERT INTO `sea_datatime` VALUES (17, '17', '11:50:00');
INSERT INTO `sea_datatime` VALUES (18, '18', '12:00:00');
INSERT INTO `sea_datatime` VALUES (19, '19', '12:10:00');
INSERT INTO `sea_datatime` VALUES (20, '20', '12:20:00');
INSERT INTO `sea_datatime` VALUES (21, '21', '12:30:00');
INSERT INTO `sea_datatime` VALUES (22, '22', '12:40:00');
INSERT INTO `sea_datatime` VALUES (23, '23', '12:50:00');
INSERT INTO `sea_datatime` VALUES (24, '24', '13:00:00');
INSERT INTO `sea_datatime` VALUES (25, '25', '13:10:00');
INSERT INTO `sea_datatime` VALUES (26, '26', '13:20:00');
INSERT INTO `sea_datatime` VALUES (27, '27', '13:30:00');
INSERT INTO `sea_datatime` VALUES (28, '28', '13:40:00');
INSERT INTO `sea_datatime` VALUES (29, '29', '13:50:00');
INSERT INTO `sea_datatime` VALUES (30, '30', '14:00:00');
INSERT INTO `sea_datatime` VALUES (31, '31', '14:10:00');
INSERT INTO `sea_datatime` VALUES (32, '32', '14:20:00');
INSERT INTO `sea_datatime` VALUES (33, '33', '14:30:00');
INSERT INTO `sea_datatime` VALUES (34, '34', '14:40:00');
INSERT INTO `sea_datatime` VALUES (35, '35', '14:50:00');
INSERT INTO `sea_datatime` VALUES (36, '36', '15:00:00');
INSERT INTO `sea_datatime` VALUES (37, '37', '15:10:00');
INSERT INTO `sea_datatime` VALUES (38, '38', '15:20:00');
INSERT INTO `sea_datatime` VALUES (39, '39', '15:30:00');
INSERT INTO `sea_datatime` VALUES (40, '40', '15:40:00');
INSERT INTO `sea_datatime` VALUES (41, '41', '15:50:00');
INSERT INTO `sea_datatime` VALUES (42, '42', '16:00:00');
INSERT INTO `sea_datatime` VALUES (43, '43', '16:10:00');
INSERT INTO `sea_datatime` VALUES (44, '44', '16:20:00');
INSERT INTO `sea_datatime` VALUES (45, '45', '16:30:00');
INSERT INTO `sea_datatime` VALUES (46, '46', '16:40:00');
INSERT INTO `sea_datatime` VALUES (47, '47', '16:50:00');
INSERT INTO `sea_datatime` VALUES (48, '48', '17:00:00');
INSERT INTO `sea_datatime` VALUES (49, '49', '17:10:00');
INSERT INTO `sea_datatime` VALUES (50, '50', '17:20:00');
INSERT INTO `sea_datatime` VALUES (51, '51', '17:30:00');
INSERT INTO `sea_datatime` VALUES (52, '52', '17:40:00');
INSERT INTO `sea_datatime` VALUES (53, '53', '17:50:00');
INSERT INTO `sea_datatime` VALUES (54, '54', '18:00:00');
INSERT INTO `sea_datatime` VALUES (55, '55', '18:10:00');
INSERT INTO `sea_datatime` VALUES (56, '56', '18:20:00');
INSERT INTO `sea_datatime` VALUES (57, '57', '18:30:00');
INSERT INTO `sea_datatime` VALUES (58, '58', '18:40:00');
INSERT INTO `sea_datatime` VALUES (59, '59', '18:50:00');
INSERT INTO `sea_datatime` VALUES (60, '60', '19:00:00');
INSERT INTO `sea_datatime` VALUES (61, '61', '19:10:00');
INSERT INTO `sea_datatime` VALUES (62, '62', '19:20:00');
INSERT INTO `sea_datatime` VALUES (63, '63', '19:30:00');
INSERT INTO `sea_datatime` VALUES (64, '64', '19:40:00');
INSERT INTO `sea_datatime` VALUES (65, '65', '19:50:00');
INSERT INTO `sea_datatime` VALUES (66, '66', '20:00:00');
INSERT INTO `sea_datatime` VALUES (67, '67', '20:10:00');
INSERT INTO `sea_datatime` VALUES (68, '68', '20:20:00');
INSERT INTO `sea_datatime` VALUES (69, '69', '20:30:00');
INSERT INTO `sea_datatime` VALUES (70, '70', '20:40:00');
INSERT INTO `sea_datatime` VALUES (71, '71', '20:50:00');
INSERT INTO `sea_datatime` VALUES (72, '72', '21:00:00');
INSERT INTO `sea_datatime` VALUES (73, '73', '21:10:00');
INSERT INTO `sea_datatime` VALUES (74, '74', '21:20:00');
INSERT INTO `sea_datatime` VALUES (75, '75', '21:30:00');
INSERT INTO `sea_datatime` VALUES (76, '76', '21:40:00');
INSERT INTO `sea_datatime` VALUES (77, '77', '21:50:00');
INSERT INTO `sea_datatime` VALUES (78, '78', '22:00:00');

-- ----------------------------
-- Table structure for sea_played
-- ----------------------------
DROP TABLE IF EXISTS `sea_played`;
CREATE TABLE `sea_played`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '玩法名称',
  `odds` int(11) NOT NULL COMMENT '单注倍数',
  `ruleFun` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结算方法',
  `maxBonus` int(255) NOT NULL COMMENT '最大奖金\r\n',
  `type` tinyint(255) NOT NULL COMMENT '类型\r\n\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_played
-- ----------------------------
INSERT INTO `sea_played` VALUES (1, '单压', 1, 'oneCoent', 10000, 1);
INSERT INTO `sea_played` VALUES (2, '二中二', 1, 'doubleCoent', 10000, 1);
INSERT INTO `sea_played` VALUES (3, '对子', 1, 'towCoent', 10000, 1);
INSERT INTO `sea_played` VALUES (4, '单压', 1, 'oneCoent', 10000, 2);
INSERT INTO `sea_played` VALUES (5, '二中二', 1, 'oneCoent', 10000, 2);
INSERT INTO `sea_played` VALUES (6, '豹子', 1, 'oneCoent', 10000, 2);

-- ----------------------------
-- Table structure for sea_system
-- ----------------------------
DROP TABLE IF EXISTS `sea_system`;
CREATE TABLE `sea_system`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_system
-- ----------------------------
INSERT INTO `sea_system` VALUES (1, 'webName', '鱼虾蟹', '网站名称');
INSERT INTO `sea_system` VALUES (2, 'webState', '1', '代理投注开关');
INSERT INTO `sea_system` VALUES (3, 'daili', '1', '抢庄开关');
INSERT INTO `sea_system` VALUES (4, 'boss', '1', '最大下注');
INSERT INTO `sea_system` VALUES (5, 'maxamount', '1000', '最小下注');
INSERT INTO `sea_system` VALUES (6, 'minamount', '10', '最大充值');
INSERT INTO `sea_system` VALUES (7, 'maxrecharge', '50000', '最小充值');
INSERT INTO `sea_system` VALUES (8, 'minrecharge', '10', '最大提现金额');
INSERT INTO `sea_system` VALUES (9, 'maxdeposit', '50000', '最小提现金额');
INSERT INTO `sea_system` VALUES (10, 'mindeposit', '10', '客服地址');
INSERT INTO `sea_system` VALUES (11, 'kefu', '*', '网站开关');

-- ----------------------------
-- Table structure for sea_type
-- ----------------------------
DROP TABLE IF EXISTS `sea_type`;
CREATE TABLE `sea_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `onGetNode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_ftime` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_user
-- ----------------------------
DROP TABLE IF EXISTS `sea_user`;
CREATE TABLE `sea_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `coinPassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提款密码',
  `nickName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `headLogo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `qq` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'QQ',
  `coin` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `fcoin` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结余额',
  `online` tinyint(4) NOT NULL DEFAULT 0 COMMENT '在线状态',
  `loginTime` int(11) NOT NULL DEFAULT 0 COMMENT '最近一次登录时间',
  `parentId` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID 没有为0',
  `agency` tinyint(4) NOT NULL COMMENT '是否是代理',
  `registerTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `isDelete` tinyint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_user
-- ----------------------------
INSERT INTO `sea_user` VALUES (1, 'qq123', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', NULL, '', '123132131', 0.00, 0.00, 1, 1525232236, 0, 1, '', 0);
INSERT INTO `sea_user` VALUES (3, 'qqweqwe', '7b1893569d6799c55b8688eddf59eef4', '1690afcdda6619b8965f489c221e663b', NULL, '', '135131', 0.00, 0.00, 0, 0, 0, 0, '', 0);
INSERT INTO `sea_user` VALUES (4, 'qweqwe', 'ee4896cdd5f2a83d1d5acee164b59d75', 'e5f0f7ed6640e9464ecc5fe05aede25c', NULL, '', '516343', 0.00, 0.00, 1, 0, 0, 0, '', 0);
INSERT INTO `sea_user` VALUES (5, 'qqqqq', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', NULL, '', '12313213213', 0.00, 0.00, 0, 0, 0, 0, '', 0);
INSERT INTO `sea_user` VALUES (6, 'qqq123123', 'e10adc3949ba59abbe56e057f20f883e', 'e2fc8e5b4434e89e0dd67c9e33d6e867', NULL, '', '12313213', 0.00, 0.00, 0, 0, 0, 0, '', 0);
INSERT INTO `sea_user` VALUES (7, 'qqqq123', 'e10adc3949ba59abbe56e057f20f883e', '7c9c0b787d24816fe630fc8619564306', NULL, '', '121212', 0.00, 0.00, 1, 0, 0, 1, '', 0);
INSERT INTO `sea_user` VALUES (10, '14212', 'da304092a745b868949b8176db335e45', 'e53a0a2978c28872a4505bdb51db06dc', NULL, '', '123132', 0.00, 0.00, 0, 0, 0, 0, '', 0);
INSERT INTO `sea_user` VALUES (11, 'username', '08657d44bc5228f516b161a9a1d56912', '8f02f841d24fcd74c228b3551c45d9c7', NULL, '', '3132132132', 0.00, 0.00, 1, 0, 0, 0, '', 0);
INSERT INTO `sea_user` VALUES (13, 'asd48', '4297f44b13955235245b2497399d7a93', 'a5a897b6594ec62202430dbe34617743', NULL, '', '15315343', 0.00, 0.00, 0, 0, 0, 0, '1524644960', 0);

-- ----------------------------
-- Table structure for sea_user_log
-- ----------------------------
DROP TABLE IF EXISTS `sea_user_log`;
CREATE TABLE `sea_user_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `coin` float(10, 2) NOT NULL COMMENT '流动资金',
  `userCoin` float(10, 2) NOT NULL COMMENT '用户余额',
  `actionTime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `Tyep` tinyint(4) NOT NULL COMMENT '1 充值 2 提现 3 投注',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_userbank
-- ----------------------------
DROP TABLE IF EXISTS `sea_userbank`;
CREATE TABLE `sea_userbank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `bankId` int(11) NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `counName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
