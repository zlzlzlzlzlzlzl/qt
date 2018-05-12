/*
 Navicat Premium Data Transfer

 Source Server         : 11
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : seafood

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 12/05/2018 19:12:13
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
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_admin
-- ----------------------------
INSERT INTO `sea_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '大哥a ');
INSERT INTO `sea_admin` VALUES (3, 'qq1231', 'e10adc3949ba59abbe56e057f20f883e', 1, '1231');

-- ----------------------------
-- Table structure for sea_bank
-- ----------------------------
DROP TABLE IF EXISTS `sea_bank`;
CREATE TABLE `sea_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bankName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bankLogo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numOrImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isDelete` tinyint(4) NOT NULL DEFAULT 1,
  `type` tinyint(3) NOT NULL COMMENT '1 银行卡  2 二维码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '持卡人姓名(二维码可不填)',
  `conuName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开户行',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_bank
-- ----------------------------
INSERT INTO `sea_bank` VALUES (2, '微信', '/static/images/bank/bank-wx.jpg', '/static/er/wx.jpg', 1, 2, NULL, NULL);
INSERT INTO `sea_bank` VALUES (3, '建设银行', '/static/images/bank/bank-3.jpg', '4356154868495846511', 1, 1, '王建国', NULL);
INSERT INTO `sea_bank` VALUES (6, '微信', '/static/images/bank/bank-wx.jpg', '/static/er/20180512\\b2597c73ef5c61be9a546e72f23d6592.png', 1, 2, NULL, NULL);
INSERT INTO `sea_bank` VALUES (7, '中国银行', '/static/images/bank/bank-7.jpg', '123546354354313', 1, 1, '张磊', '石家庄体育大街');

-- ----------------------------
-- Table structure for sea_bets
-- ----------------------------
DROP TABLE IF EXISTS `sea_bets`;
CREATE TABLE `sea_bets`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `playedId` tinyint(4) NOT NULL COMMENT '玩法ID',
  `actionNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '期号',
  `actionData` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下注内容',
  `kjData` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '开奖号',
  `actionTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '下注时间',
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `boss` int(11) NOT NULL DEFAULT 0 COMMENT '本期庄家',
  `state` tinyint(10) NOT NULL COMMENT '订单状态 0未开奖 1中奖 2未中奖',
  `amount` decimal(10, 2) NOT NULL COMMENT '下注总金额',
  `zjamount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
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
) ENGINE = InnoDB AUTO_INCREMENT = 4205 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_data
-- ----------------------------
INSERT INTO `sea_data` VALUES (4065, '1525746272', '20180508009', '2,3,5');
INSERT INTO `sea_data` VALUES (4066, '1525746871', '20180508010', '2,4,5');
INSERT INTO `sea_data` VALUES (4067, '1525747470', '20180508011', '1,2,6');
INSERT INTO `sea_data` VALUES (4068, '1525748069', '20180508012', '1,2,4');
INSERT INTO `sea_data` VALUES (4069, '1525748668', '20180508013', '1,5,6');
INSERT INTO `sea_data` VALUES (4070, '1525749267', '20180508014', '3,5,5');
INSERT INTO `sea_data` VALUES (4071, '1525749866', '20180508015', '1,3,4');
INSERT INTO `sea_data` VALUES (4072, '1525750465', '20180508016', '2,2,5');
INSERT INTO `sea_data` VALUES (4073, '1525751064', '20180508017', '1,2,2');
INSERT INTO `sea_data` VALUES (4074, '1525751663', '20180508018', '3,4,4');
INSERT INTO `sea_data` VALUES (4075, '1525752262', '20180508019', '1,1,2');
INSERT INTO `sea_data` VALUES (4076, '1525752861', '20180508020', '5,5,6');
INSERT INTO `sea_data` VALUES (4077, '1525753460', '20180508021', '2,3,6');
INSERT INTO `sea_data` VALUES (4078, '1525754059', '20180508022', '3,5,6');
INSERT INTO `sea_data` VALUES (4079, '1525754658', '20180508023', '2,6,6');
INSERT INTO `sea_data` VALUES (4080, '1525755257', '20180508024', '1,1,2');
INSERT INTO `sea_data` VALUES (4081, '1525755856', '20180508025', '3,3,3');
INSERT INTO `sea_data` VALUES (4082, '1525756455', '20180508026', '1,3,5');
INSERT INTO `sea_data` VALUES (4083, '1525757054', '20180508027', '3,6,6');
INSERT INTO `sea_data` VALUES (4084, '1525757653', '20180508028', '1,3,3');
INSERT INTO `sea_data` VALUES (4085, '1525758252', '20180508029', '3,4,6');
INSERT INTO `sea_data` VALUES (4086, '1525758252', '20180508029', '3,4,6');
INSERT INTO `sea_data` VALUES (4087, '1525758252', '20180508029', '3,4,6');
INSERT INTO `sea_data` VALUES (4088, '1525758851', '20180508030', '3,5,6');
INSERT INTO `sea_data` VALUES (4089, '1525759450', '20180508031', '1,1,1');
INSERT INTO `sea_data` VALUES (4090, '1525760049', '20180508032', '1,2,6');
INSERT INTO `sea_data` VALUES (4091, '1525767237', '20180508044', '1,1,2');
INSERT INTO `sea_data` VALUES (4092, '1525767836', '20180508045', '2,3,3');
INSERT INTO `sea_data` VALUES (4093, '1525768435', '20180508046', '1,1,6');
INSERT INTO `sea_data` VALUES (4094, '1525769034', '20180508047', '3,3,5');
INSERT INTO `sea_data` VALUES (4095, '1525769633', '20180508048', '1,4,5');
INSERT INTO `sea_data` VALUES (4096, '1525770232', '20180508049', '4,5,6');
INSERT INTO `sea_data` VALUES (4097, '1525770831', '20180508050', '4,5,6');
INSERT INTO `sea_data` VALUES (4098, '1525831474', '20180509007', '1,2,6');
INSERT INTO `sea_data` VALUES (4099, '1525832073', '20180509008', '2,6,6');
INSERT INTO `sea_data` VALUES (4100, '1525832672', '20180509009', '2,2,5');
INSERT INTO `sea_data` VALUES (4101, '1525833271', '20180509010', '2,5,5');
INSERT INTO `sea_data` VALUES (4102, '1525833870', '20180509011', '3,4,5');
INSERT INTO `sea_data` VALUES (4103, '1525834469', '20180509012', '2,4,6');
INSERT INTO `sea_data` VALUES (4104, '1525835068', '20180509013', '1,3,4');
INSERT INTO `sea_data` VALUES (4105, '1525835667', '20180509014', '1,2,2');
INSERT INTO `sea_data` VALUES (4106, '1525836266', '20180509015', '1,3,6');
INSERT INTO `sea_data` VALUES (4107, '1525836865', '20180509016', '2,2,5');
INSERT INTO `sea_data` VALUES (4108, '1525837464', '20180509017', '3,3,4');
INSERT INTO `sea_data` VALUES (4109, '1525838063', '20180509018', '3,3,6');
INSERT INTO `sea_data` VALUES (4110, '1525838662', '20180509019', '3,3,5');
INSERT INTO `sea_data` VALUES (4111, '1525839261', '20180509020', '2,3,6');
INSERT INTO `sea_data` VALUES (4112, '1525839860', '20180509021', '1,3,5');
INSERT INTO `sea_data` VALUES (4113, '1525840459', '20180509022', '1,1,4');
INSERT INTO `sea_data` VALUES (4114, '1525841058', '20180509023', '1,3,5');
INSERT INTO `sea_data` VALUES (4115, '1525841657', '20180509024', '3,3,6');
INSERT INTO `sea_data` VALUES (4116, '1525842256', '20180509025', '3,3,3');
INSERT INTO `sea_data` VALUES (4117, '1525842855', '20180509026', '1,3,4');
INSERT INTO `sea_data` VALUES (4118, '1525843454', '20180509027', '3,3,3');
INSERT INTO `sea_data` VALUES (4119, '1525844053', '20180509028', '2,4,5');
INSERT INTO `sea_data` VALUES (4120, '1525844652', '20180509029', '2,3,5');
INSERT INTO `sea_data` VALUES (4121, '1525845251', '20180509030', '1,2,5');
INSERT INTO `sea_data` VALUES (4122, '1525845850', '20180509031', '3,4,4');
INSERT INTO `sea_data` VALUES (4123, '1525846449', '20180509032', '2,3,5');
INSERT INTO `sea_data` VALUES (4124, '1525847048', '20180509033', '1,4,6');
INSERT INTO `sea_data` VALUES (4125, '1525847647', '20180509034', '2,3,3');
INSERT INTO `sea_data` VALUES (4126, '1525848246', '20180509035', '1,2,5');
INSERT INTO `sea_data` VALUES (4127, '1525848845', '20180509036', '2,2,6');
INSERT INTO `sea_data` VALUES (4128, '1525849444', '20180509037', '1,1,3');
INSERT INTO `sea_data` VALUES (4129, '1525850043', '20180509038', '1,3,5');
INSERT INTO `sea_data` VALUES (4130, '1525850642', '20180509039', '1,2,5');
INSERT INTO `sea_data` VALUES (4131, '1525851241', '20180509040', '1,4,5');
INSERT INTO `sea_data` VALUES (4132, '1525851840', '20180509041', '3,5,6');
INSERT INTO `sea_data` VALUES (4133, '1525852439', '20180509042', '2,2,2');
INSERT INTO `sea_data` VALUES (4134, '1525853038', '20180509043', '1,5,5');
INSERT INTO `sea_data` VALUES (4135, '1525853637', '20180509044', '1,2,4');
INSERT INTO `sea_data` VALUES (4136, '1525854236', '20180509045', '3,4,5');
INSERT INTO `sea_data` VALUES (4137, '1525854835', '20180509046', '4,5,6');
INSERT INTO `sea_data` VALUES (4138, '1525855434', '20180509047', '3,3,4');
INSERT INTO `sea_data` VALUES (4139, '1525856033', '20180509048', '3,4,6');
INSERT INTO `sea_data` VALUES (4140, '1525856632', '20180509049', '4,4,4');
INSERT INTO `sea_data` VALUES (4141, '1525857231', '20180509050', '2,3,5');
INSERT INTO `sea_data` VALUES (4142, '1525857830', '20180509051', '1,5,5');
INSERT INTO `sea_data` VALUES (4143, '1525858429', '20180509052', '2,3,4');
INSERT INTO `sea_data` VALUES (4144, '1525859028', '20180509053', '4,4,6');
INSERT INTO `sea_data` VALUES (4145, '1525859627', '20180509054', '3,4,5');
INSERT INTO `sea_data` VALUES (4146, '1525860226', '20180509055', '4,5,6');
INSERT INTO `sea_data` VALUES (4147, '1525860825', '20180509056', '2,4,5');
INSERT INTO `sea_data` VALUES (4148, '1525861424', '20180509057', '1,4,6');
INSERT INTO `sea_data` VALUES (4149, '1525862023', '20180509058', '1,5,5');
INSERT INTO `sea_data` VALUES (4150, '1525862622', '20180509059', '1,5,6');
INSERT INTO `sea_data` VALUES (4151, '1525863221', '20180509060', '1,5,6');
INSERT INTO `sea_data` VALUES (4152, '1525863820', '20180509061', '1,3,6');
INSERT INTO `sea_data` VALUES (4153, '1525924463', '20180510018', '4,5,5');
INSERT INTO `sea_data` VALUES (4154, '1525925062', '20180510019', '1,2,2');
INSERT INTO `sea_data` VALUES (4155, '1525925661', '20180510020', '3,4,6');
INSERT INTO `sea_data` VALUES (4156, '1525926260', '20180510021', '1,1,3');
INSERT INTO `sea_data` VALUES (4157, '1525926859', '20180510022', '5,5,6');
INSERT INTO `sea_data` VALUES (4158, '1525927458', '20180510023', '4,6,6');
INSERT INTO `sea_data` VALUES (4159, '1525928057', '20180510024', '1,1,3');
INSERT INTO `sea_data` VALUES (4160, '1525928656', '20180510025', '2,3,4');
INSERT INTO `sea_data` VALUES (4161, '1525929255', '20180510026', '1,3,6');
INSERT INTO `sea_data` VALUES (4162, '1525929854', '20180510027', '1,6,6');
INSERT INTO `sea_data` VALUES (4163, '1525930453', '20180510028', '3,4,5');
INSERT INTO `sea_data` VALUES (4164, '1525931052', '20180510029', '5,5,6');
INSERT INTO `sea_data` VALUES (4165, '1525931651', '20180510030', '1,1,5');
INSERT INTO `sea_data` VALUES (4166, '1525932250', '20180510031', '2,3,6');
INSERT INTO `sea_data` VALUES (4167, '1525932849', '20180510032', '1,4,5');
INSERT INTO `sea_data` VALUES (4168, '1525933448', '20180510033', '2,5,6');
INSERT INTO `sea_data` VALUES (4169, '1525934047', '20180510034', '3,3,5');
INSERT INTO `sea_data` VALUES (4170, '1525934646', '20180510035', '1,1,2');
INSERT INTO `sea_data` VALUES (4171, '1525935245', '20180510036', '2,3,3');
INSERT INTO `sea_data` VALUES (4172, '1525935844', '20180510037', '1,3,3');
INSERT INTO `sea_data` VALUES (4173, '1525936443', '20180510038', '1,4,6');
INSERT INTO `sea_data` VALUES (4174, '1525937042', '20180510039', '3,4,6');
INSERT INTO `sea_data` VALUES (4175, '1525937641', '20180510040', '2,3,4');
INSERT INTO `sea_data` VALUES (4176, '1525938240', '20180510041', '5,6,6');
INSERT INTO `sea_data` VALUES (4177, '1525938839', '20180510042', '1,1,3');
INSERT INTO `sea_data` VALUES (4178, '1525939438', '20180510043', '1,4,4');
INSERT INTO `sea_data` VALUES (4179, '1525940037', '20180510044', '1,6,6');
INSERT INTO `sea_data` VALUES (4180, '1525940636', '20180510045', '3,4,5');
INSERT INTO `sea_data` VALUES (4181, '1525941235', '20180510046', '2,5,5');
INSERT INTO `sea_data` VALUES (4182, '1525941834', '20180510047', '2,3,5');
INSERT INTO `sea_data` VALUES (4183, '1525942433', '20180510048', '3,4,6');
INSERT INTO `sea_data` VALUES (4184, '1525943032', '20180510049', '1,1,4');
INSERT INTO `sea_data` VALUES (4185, '1525943631', '20180510050', '2,5,6');
INSERT INTO `sea_data` VALUES (4186, '1525944230', '20180510051', '1,1,5');
INSERT INTO `sea_data` VALUES (4187, '1525944829', '20180510052', '2,6,6');
INSERT INTO `sea_data` VALUES (4188, '1525945428', '20180510053', '2,3,5');
INSERT INTO `sea_data` VALUES (4189, '1525946027', '20180510054', '4,5,6');
INSERT INTO `sea_data` VALUES (4190, '1525946626', '20180510055', '3,3,6');
INSERT INTO `sea_data` VALUES (4191, '1525947225', '20180510056', '3,6,6');
INSERT INTO `sea_data` VALUES (4192, '1525947824', '20180510057', '2,4,5');
INSERT INTO `sea_data` VALUES (4193, '1525948423', '20180510058', '1,1,4');
INSERT INTO `sea_data` VALUES (4194, '1525949022', '20180510059', '2,3,5');
INSERT INTO `sea_data` VALUES (4195, '1525949621', '20180510060', '2,4,5');
INSERT INTO `sea_data` VALUES (4196, '1525950220', '20180510061', '3,4,5');
INSERT INTO `sea_data` VALUES (4197, '1525950819', '20180510062', '2,3,5');
INSERT INTO `sea_data` VALUES (4198, '1525951418', '20180510063', '1,1,2');
INSERT INTO `sea_data` VALUES (4199, '1525952017', '20180510064', '1,3,6');
INSERT INTO `sea_data` VALUES (4200, '1525952616', '20180510065', '4,5,6');
INSERT INTO `sea_data` VALUES (4201, '1525953215', '20180510066', '1,4,5');
INSERT INTO `sea_data` VALUES (4202, '1525953814', '20180510067', '1,2,3');
INSERT INTO `sea_data` VALUES (4203, '1526001878', '20180511003', '1,3,4');
INSERT INTO `sea_data` VALUES (4204, '1526030630', '20180511051', '2,5,6');

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
INSERT INTO `sea_played` VALUES (1, '二骰单压', 2, 'Single', 10000, 1);
INSERT INTO `sea_played` VALUES (2, '二骰二中二', 2, 'doubleCoent', 10000, 1);
INSERT INTO `sea_played` VALUES (3, '二骰对子', 1, 'twain', 10000, 1);
INSERT INTO `sea_played` VALUES (4, '三骰单压', 1, 'Singles', 10000, 2);
INSERT INTO `sea_played` VALUES (5, '三骰二中二', 1, 'doubleCoents', 10000, 2);
INSERT INTO `sea_played` VALUES (6, '三骰豹子', 1, 'triplicate', 10000, 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_system
-- ----------------------------
INSERT INTO `sea_system` VALUES (1, 'webName', '鱼虾蟹', '网站名称');
INSERT INTO `sea_system` VALUES (2, 'webState', '1', '网站开关');
INSERT INTO `sea_system` VALUES (3, 'daili', '1', '抢庄开关');
INSERT INTO `sea_system` VALUES (4, 'boss', '1', '最大下注');
INSERT INTO `sea_system` VALUES (5, 'maxamount', '10000', '最小下注');
INSERT INTO `sea_system` VALUES (6, 'minamount', '10', '最大充值');
INSERT INTO `sea_system` VALUES (7, 'maxrecharge', '50000', '最小充值');
INSERT INTO `sea_system` VALUES (8, 'minrecharge', '10', '最大提现金额');
INSERT INTO `sea_system` VALUES (9, 'maxdeposit', '50000', '最小提现金额');
INSERT INTO `sea_system` VALUES (10, 'mindeposit', '10', '客服地址');
INSERT INTO `sea_system` VALUES (11, 'kefu', '#', '代理投注开关');
INSERT INTO `sea_system` VALUES (12, 'fengdan', '90', '封单时间');

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
  `coin` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '余额',
  `fcoin` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '冻结余额',
  `online` tinyint(4) NOT NULL DEFAULT 0 COMMENT '在线状态',
  `loginTime` int(11) NOT NULL DEFAULT 0 COMMENT '最近一次登录时间',
  `parentId` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID 没有为0',
  `agency` tinyint(4) NOT NULL COMMENT '是否是代理',
  `registerTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册时间',
  `isDelete` tinyint(255) NOT NULL DEFAULT 0,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_user
-- ----------------------------
INSERT INTO `sea_user` VALUES (2, 'qq123', 'e10adc3949ba59abbe56e057f20f883e', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '', '1354354', 0.00, 0.00, 1, 1526121118, 0, 0, '1526121088', 0, '香港');

-- ----------------------------
-- Table structure for sea_user_log
-- ----------------------------
DROP TABLE IF EXISTS `sea_user_log`;
CREATE TABLE `sea_user_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `coin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流动资金',
  `userCoin` float(10, 2) NOT NULL COMMENT '用户余额',
  `actionTime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  `Type` tinyint(4) NOT NULL COMMENT '1 充值 2 提现 3 投注盈利 4投注亏损 5和',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_userbank
-- ----------------------------
DROP TABLE IF EXISTS `sea_userbank`;
CREATE TABLE `sea_userbank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'yonghu ID \r\n',
  `bankName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行名称',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持卡人姓名\r\n',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡号',
  `counName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户行',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sea_userbank
-- ----------------------------
INSERT INTO `sea_userbank` VALUES (7, 1, '中国银行', '张三', '123213', '石家庄');

-- ----------------------------
-- Table structure for sea_userrecharge
-- ----------------------------
DROP TABLE IF EXISTS `sea_userrecharge`;
CREATE TABLE `sea_userrecharge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `orderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '充值金额',
  `bankId` tinyint(50) NOT NULL COMMENT '银行ID\r\n',
  `state` tinyint(10) NOT NULL DEFAULT 1 COMMENT '状态 1 未处理 2已到帐',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '充值备注',
  `time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sea_withdrawmoney
-- ----------------------------
DROP TABLE IF EXISTS `sea_withdrawmoney`;
CREATE TABLE `sea_withdrawmoney`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请时间',
  `uid` int(11) NOT NULL,
  `amount` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' ',
  `userBank` int(11) NOT NULL COMMENT '对应UserBank',
  `state` tinyint(5) NOT NULL DEFAULT 0 COMMENT '0 未处理 1已到帐 2拒绝提现',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
