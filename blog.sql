/*
Navicat MySQL Data Transfer

Source Server         : local_mysql8
Source Server Version : 80020
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2025-06-06 10:40:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214016003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('-692027391', '王大锤', '123456', 'jk4@qq.com', '恩施学院', '110');
INSERT INTO `author` VALUES ('-398344190', '王大锤', '123456', 'jk4@qq.com', '恩施学院', '110');
INSERT INTO `author` VALUES ('-373247999', '王大锤', '666666', 'jk4@qq.com', '恩施学院', '110');
INSERT INTO `author` VALUES ('1', 'james', '666666', '631597728@qq.com', '深圳', null);
INSERT INTO `author` VALUES ('2', 'Allen', '123456', '316261985@qq.com', '武汉', '18872206762');
INSERT INTO `author` VALUES ('5', '计科2班', '999999', 'jk2@qq.com', '湖北恩施学院', '123456');
INSERT INTO `author` VALUES ('6', '计科3班帅小伙', '666666', 'jk3@qq.com', '湖北恩施学院', '123456789');
INSERT INTO `author` VALUES ('7', 'jk333', '666666', 'jk3@qq.com', '湖北恩施学院', '18877745895');
INSERT INTO `author` VALUES ('8', 'jk3班', '123456', 'jk3@qq.com', '湖北恩施', '18878856852');
INSERT INTO `author` VALUES ('9', 'jk2班', '123456', 'jk2@qq.com', '湖北恩施', '13598887455');
INSERT INTO `author` VALUES ('10', '王大锤', '666666', 'jk2@qq.com', '湖北恩施', '13598887455');
INSERT INTO `author` VALUES ('11', '小锤锤', '666666', 'jk222@qq.com', '湖北恩施', '18878856852');
INSERT INTO `author` VALUES ('214016002', '王大锤', 'aaaaaa', 'jk4@qq.com', '湖北恩施', '110');

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_author_id` (`author_id`),
  CONSTRAINT `fk_blog_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('2', '今天是中元节', '生活', '<p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\">给逝去亲人，给点钱用一下！送温暖~</span><br/></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 0, 0);\"><img src=\"/Ueditor/upload/image/20220812/1660269992893004251.jpg\" title=\"1660269992893004251.jpg\" alt=\"dy1.jpg\"/></span></p>', '2022-08-12 10:06:43', '1');
INSERT INTO `blog` VALUES ('3', 'java134班', '学习test', '<p><span style=\"color: rgb(255, 0, 0);\">啊手动阀手动阀</span></p><p><span style=\"color: rgb(255, 0, 0);\"><img src=\"/puchuangCMS/upload/image/20220812/1660276955223020340.jpg\" title=\"1660276955223020340.jpg\" alt=\"程序猿.jpg\"/></span></p>', '2022-08-12 12:02:40', '2');
INSERT INTO `blog` VALUES ('4', '框架学习', '学习test', '把框架学好，可以作互联网项目开发', '2022-08-12 12:05:20', '2');
INSERT INTO `blog` VALUES ('5', '前端富文本技术', '学习', '<blockquote><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p><span style=\"color: rgb(255, 0, 0);\">啊是公司规划风格化的风格和的风格和豆豆</span></p><p><span style=\"color: rgb(255, 0, 0);\"></span></p></li></ol><p></p><p><span style=\"color: rgb(255, 0, 0);\"><img src=\"/puchuangCMS/upload/image/20220812/1660277320534078760.jpg\" title=\"1660277320534078760.jpg\" alt=\"程序猿.jpg\"/></span></p></blockquote>', '2022-08-12 12:08:44', '2');
INSERT INTO `blog` VALUES ('7', '少玩游戏，多学技术，多敲代码', '学习', '目前已经进入框架阶段的学习，要加油！', '2022-08-31 03:36:43', '1');
INSERT INTO `blog` VALUES ('9', '公务员考试', '工作', '来恩施学院参加公务员考试，竞争好激烈啊', '2025-03-17 02:00:45', '5');
INSERT INTO `blog` VALUES ('10', '3.15打假', '生活', '蜜雪冰城卖隔夜柠檬水，最不能吃的外面是黄焖鸡米饭', '2025-03-17 03:48:52', '6');
INSERT INTO `blog` VALUES ('11', '少吃外卖', '生活', '315报出很多黑幕，外卖的东西不太干净', '2025-03-17 03:48:52', '1');
INSERT INTO `blog` VALUES ('12', '公务员轻松吗？', '工作', '公务员的工资不高，但是有国家养，旱涝保收！', null, null);

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  `blog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_blog_id` (`blog_id`),
  CONSTRAINT `fk_com_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '中国的鬼节', '2022-09-08 08:58:55', '2');
INSERT INTO `comment` VALUES ('2', '要给故人烧点钱', '2022-09-21 08:59:40', '2');
INSERT INTO `comment` VALUES ('3', '只有两个月的学习时间了，要好好珍惜', '2022-09-07 09:00:11', '3');

-- ----------------------------
-- Table structure for `functions`
-- ----------------------------
DROP TABLE IF EXISTS `functions`;
CREATE TABLE `functions` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `function_name` varchar(12) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `fk_function_privilege` (`p_id`),
  CONSTRAINT `fk_function_privilege` FOREIGN KEY (`p_id`) REFERENCES `privilege` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of functions
-- ----------------------------
INSERT INTO `functions` VALUES ('1', '5', '角色管理', '');
INSERT INTO `functions` VALUES ('2', '5', '用户管理', '');
INSERT INTO `functions` VALUES ('3', '5', '权限管理', '<iframe width=\'100%\' height=\'100%\' frameborder=\'0\' src=\'http://localhost:8080/getAllUser\' style=\'width:100%;height:100%;margin:0px 0px;\'></iframe>');

-- ----------------------------
-- Table structure for `measuring_service_type`
-- ----------------------------
DROP TABLE IF EXISTS `measuring_service_type`;
CREATE TABLE `measuring_service_type` (
  `serviceTypeId` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `serviceName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '测量服务类型名称',
  PRIMARY KEY (`serviceTypeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='测量服务类型';

-- ----------------------------
-- Records of measuring_service_type
-- ----------------------------
INSERT INTO `measuring_service_type` VALUES ('1', '产品开发');
INSERT INTO `measuring_service_type` VALUES ('2', '数值模拟 (FEA/CFD) 服务');
INSERT INTO `measuring_service_type` VALUES ('3', '高级曲面');
INSERT INTO `measuring_service_type` VALUES ('4', '逆向工程');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int NOT NULL AUTO_INCREMENT COMMENT '主键、自增列',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言人姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言人联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言人邮箱',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '留言内容',
  `userId` int DEFAULT NULL COMMENT '外键，关联user用户表userId列',
  PRIMARY KEY (`messageId`) USING BTREE,
  KEY `pk_message_user` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='留言信息';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '赵先生', '13923453456', '2873647@qq.com', '冲击加速度传感器的应用范围是什么？', null);
INSERT INTO `message` VALUES ('2', '李大哥', '13928277654', 'aau@qq.com', '请问这啊请问那', null);
INSERT INTO `message` VALUES ('5', '李三三', '13163319510', '631193880@qq.com', '火箭发射咖啡馆决胜巅峰广告设计数据库', null);
INSERT INTO `message` VALUES ('10', '大健康', '1316331', 'aaaaa', '换个环境好几个', null);
INSERT INTO `message` VALUES ('11', '就安静', '13828822828', 'jsj@qq.com', 'jdsfhjdshfjsdhfjsfhkdfhskfhf', null);

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` int NOT NULL AUTO_INCREMENT COMMENT '主键、自增列',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '新闻标题',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片路径',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '新闻内容',
  `type` int DEFAULT NULL COMMENT '新闻类型，0表示公司新闻/1表示行业新闻',
  `newsDate` date DEFAULT NULL COMMENT '新闻创建日期',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`newsId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '传感器在食品包装机械应用的重要作用', null, '   <p>\r\n                &nbsp;&nbsp;&nbsp;&nbsp;随着食品安全问题日益突出，我国对食品安全越来越重视，于是对食品检测技术提出了精细化要求。过去我国食品机械制造厂忽略了对食品检测技术的应用，而与整机性能提高相比，食品检测技术将有更大的发展空间。传感技术在食品检测技术中发挥着重要作用，包括采集食品温度、位置等。\r\n<br />\r\n				&nbsp;&nbsp;&nbsp;&nbsp;据了解，当前集成电路检测器已经在国外食品加工厂中大范围应用，这种技术可检测出食品的变质时间。食品保质检测配置主要由扫描仪与传感器组成，检测人员只要将扫描仪对准食品发射出无线电波讯号，就会让食品产生振动，并形成乐谱波，传送至传感器。\r\n<br />\r\n				&nbsp;&nbsp;&nbsp;&nbsp;通过比对标准数据库的参数，即可短时间内检测到食品变质的日期，且检测结果十分准确。食品包装机械中的检测技术已经不再局限于在生产线上的应用，随着食品检测在我国的重要性逐步提高，检测技术应用领域将进一步扩大。', '0', '2013-10-16', 'admin', '普创网');
INSERT INTO `news` VALUES ('2', '普创科技与加拿大蓝腕公司达成战略合作', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('3', '2014 DEWESoft汽车测试技术交流会', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('4', '传感器在食品包装机械应用的重要作用', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('5', '我司为某机械研究院进行功率输出轴扭矩实际测试与验证实验', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('6', '手持式三维激光扫描仪培训', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('7', '我司为某高校实施水下爆破瞬态压力测试', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('8', '物联网助力仪器仪表产业', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('9', '第六届武汉地区船舶与海洋工程研究生学术论坛', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('10', '2013 DEWESoft汽车测试技术交流会', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('11', '上海通用汽车新厂落户武汉 年产值超2000亿元', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('12', '中国直升机设计研究所项目', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('13', '普创科技自主开发的LAN总线数据采集系统', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('14', '普创科技与加拿大蓝腕公司达成战略合作', null, null, '0', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('15', '2014 DEWESoft汽车测试技术交流会', null, null, '1', '2013-08-20', 'admin', '普创网');
INSERT INTO `news` VALUES ('16', '传感器在食品包装机械应用的重要作用', null, null, '1', '2013-08-20', 'admin', '普创网');

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `privilege_id` int NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(20) NOT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '系统管理');
INSERT INTO `privilege` VALUES ('2', '商品管理');
INSERT INTO `privilege` VALUES ('3', '销售管理');
INSERT INTO `privilege` VALUES ('4', '商家管理');
INSERT INTO `privilege` VALUES ('5', '统计分析');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT COMMENT '主键、自增列',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品名称',
  `propParam` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品参数',
  `skillParam` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '技术参数',
  `mountingPosition` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '安装位置',
  `proImage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品图片',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片路径',
  `proTypeId` int DEFAULT NULL COMMENT '外键，关联product_type产品类型表proTypeId列',
  PRIMARY KEY (`productId`) USING BTREE,
  KEY `pk_product_product_type` (`proTypeId`) USING BTREE,
  CONSTRAINT `pk_product_product_type` FOREIGN KEY (`proTypeId`) REFERENCES `product_type` (`proTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'HZ-VT一体振动变送器', 'HZ-VT一体振动变送器将振动速度传感器、精密测量电路集成在一起,实现了传统的“传感器十变送器”模式的振动测量系统的功能,实现了经济型高精度振动测量系统,该变送器可直接连接DCS、PLC或其它系统,是风机、水泵等工厂设备振动测量的理想选择。', '3. 灵 敏 度：20mv/mm/s±5%、30mv/mm/s±5%、50mv/mm/s±5%\r\n2. 频率响应：5 ～ 500 Hz\r\n3. 自振频率：10Hz\r\n4. 测量范围：1、0～10mm/s、0～20mm/s、0～50mm/s', '垂直或者水平安装于被测振动点上，变送器底部用M10螺钉固定。', null, 'pro1.jpg', null);
INSERT INTO `product` VALUES ('2', 'HZ-VT一体振动变送器', 'HZ-VT一体振动变送器将振动速度传感器、精密测量电路集成在一起,实现了传统的“传感器十变送器”模式的振动测量系统的功能,实现了经济型高精度振动测量系统,该变送器可直接连接DCS、PLC或其它系统,是风机、水泵等工厂设备振动测量的理想选择。', '4. 测量范围：1、0～10mm/s、0～20mm/s、0～50mm/s', '垂直或者水平安装于被测振动点上，变送器底部用M10螺钉固定。', null, 'pro2.jpg', null);
INSERT INTO `product` VALUES ('3', 'HZ-VT一体振动变送器', 'HZ-VT一体振动变送器将振动速度传感器、精密测量电路集成在一起,实现了传统的“传感器十变送器”模式的振动测量系统的功能,实现了经济型高精度振动测量系统,该变送器可直接连接DCS、PLC或其它系统,是风机、水泵等工厂设备振动测量的理想选择', '4. 测量范围：1、0～10mm/s、0～20mm/s、0～50mm/s', '垂直或者水平安装于被测振动点上，变送器底部用M10螺钉固定。', null, 'pro3.jpg', null);
INSERT INTO `product` VALUES ('4', 'HZ-VT一体振动变送', '测量的理想选择。', '4. 测量范围：1、0～10mm/s、0～20mm/s、0～50mm', '垂直或者水平安装于被测振动点上，变送器底部用M10螺钉固定', null, 'pro4.jpg', null);
INSERT INTO `product` VALUES ('5', 'HZ-VT一体振动变送器', 'HZ-VT一体振动变送器将振动速度传感器、精密测量电路集成在一起,实现了传统的“传感器十变送器”模式的振动测量系统的功能,实现了经济型高精度振动测量系统,该变送器可直接连接DCS、PLC或其它系统,是风机、水泵等工厂设备振动测量的理想选择。', '4. 测量范围：1、0～10mm/s、0～20mm/s、0～50mm/s', '垂直或者水平安装于被测振动点上，变送器底部用M10螺钉固定。', null, 'pro1.jpg', null);
INSERT INTO `product` VALUES ('6', 'HZ-VT一体振动变送', 'HZ-VT一体振动变送器将振动速度传感器、精密测量电路集成在一起,实现了传统的“传感器十变送器”模式的振动测量系统的功能,实现了经济型高精度振动测量系统,该变送器可直接连接DCS、PLC或其它系统,是风机、水泵等工厂设备振动测量的理想选择', '4. 测量范围：1、0～10mm/s、0～20mm/s、0～50mm/s', '垂直或者水平安装于被测振动点上，变送器底部用M10螺钉固定。', null, 'pro2.jpg', null);

-- ----------------------------
-- Table structure for `product_development`
-- ----------------------------
DROP TABLE IF EXISTS `product_development`;
CREATE TABLE `product_development` (
  `measuringId` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `proName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品名称',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品详细资料',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品图片路径',
  `serviceTypeId` int DEFAULT NULL COMMENT '外键，关联measuring_service_type测量服务类型表的serviceTypeId列',
  PRIMARY KEY (`measuringId`) USING BTREE,
  KEY `s` (`serviceTypeId`) USING BTREE,
  CONSTRAINT `s` FOREIGN KEY (`serviceTypeId`) REFERENCES `measuring_service_type` (`serviceTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='测量服务';

-- ----------------------------
-- Records of product_development
-- ----------------------------
INSERT INTO `product_development` VALUES ('1', '3D 工程服务', 'Creaform 向世界各地日益增多的客户群提供专业工程服务。 我们的团队由经验丰富的工程师和技术人员组成，在有效性和专业性领域声誉良好...', '/PuChuang/Images/subImg_01.jpg', '1');
INSERT INTO `product_development` VALUES ('2', '3D 工程服务', 'Creaform 向世界各地日益增多的客户群提供专业工程服务。 我们的团队由经验丰富的工程师和技术人员组成，在有效性和专业性领域声誉良好...', '/PuChuang/Images/subImg_02.jpg', '1');
INSERT INTO `product_development` VALUES ('3', '3D 工程服务', 'Creaform 向世界各地日益增多的客户群提供专业工程服务。 我们的团队由经验丰富的工程师和技术人员组成，在有效性和专业性领域声誉良好...', '/PuChuang/Images/subImg_03.jpg', '1');
INSERT INTO `product_development` VALUES ('4', '3D 工程服务', 'Creaform 向世界各地日益增多的客户群提供专业工程服务。 我们的团队由经验丰富的工程师和技术人员组成，在有效性和专业性领域声誉良好...', '/PuChuang/Images/subImg_04.jpg', '1');
INSERT INTO `product_development` VALUES ('5', '3D 工程服务', 'Creaform 向世界各地日益增多的客户群提供专业工程服务。 我们的团队由经验丰富的工程师和技术人员组成，在有效性和专业性领域声誉良好...', '/PuChuang/Images/subImg_05.jpg', '1');
INSERT INTO `product_development` VALUES ('6', '3D 工程服务', 'Creaform 向世界各地日益增多的客户群提供专业工程服务。 我们的团队由经验丰富的工程师和技术人员组成，在有效性和专业性领域声誉良好...', '/PuChuang/Images/subImg_06.jpg', '1');

-- ----------------------------
-- Table structure for `product_type`
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `proTypeId` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品类型名称',
  PRIMARY KEY (`proTypeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品类型';

-- ----------------------------
-- Records of product_type
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `role_description` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系統管理員', '管理整個系統');
INSERT INTO `role` VALUES ('2', '新闻管理员', '管理网站所有新闻');
INSERT INTO `role` VALUES ('3', '产品管理员', '管理平台上所有产品');

-- ----------------------------
-- Table structure for `role_pri`
-- ----------------------------
DROP TABLE IF EXISTS `role_pri`;
CREATE TABLE `role_pri` (
  `role_id` int NOT NULL,
  `privilege_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`),
  KEY `fk_pri` (`privilege_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `fk_pri` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_pri
-- ----------------------------
INSERT INTO `role_pri` VALUES ('1', '1');
INSERT INTO `role_pri` VALUES ('1', '2');
INSERT INTO `role_pri` VALUES ('2', '2');
INSERT INTO `role_pri` VALUES ('1', '3');
INSERT INTO `role_pri` VALUES ('1', '4');
INSERT INTO `role_pri` VALUES ('3', '4');

-- ----------------------------
-- Table structure for `solution`
-- ----------------------------
DROP TABLE IF EXISTS `solution`;
CREATE TABLE `solution` (
  `solutionId` int NOT NULL AUTO_INCREMENT COMMENT '主键、自增列',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产品名称',
  `merit` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品优点',
  `trait` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品特点',
  `Scenario` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '产品应用场景',
  `soluTypeId` int DEFAULT NULL COMMENT '外键，关联solution_type解决方案类型表的soluTypeId列',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`solutionId`) USING BTREE,
  KEY `pk_solution_solution_type` (`soluTypeId`) USING BTREE,
  CONSTRAINT `pk_solution_solution_type` FOREIGN KEY (`soluTypeId`) REFERENCES `solution_type` (`soluTypeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='解决方案';

-- ----------------------------
-- Records of solution
-- ----------------------------

-- ----------------------------
-- Table structure for `solution_type`
-- ----------------------------
DROP TABLE IF EXISTS `solution_type`;
CREATE TABLE `solution_type` (
  `soluTypeId` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '解决方案类型名称',
  PRIMARY KEY (`soluTypeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='解决方案类型';

-- ----------------------------
-- Records of solution_type
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_pwd` varchar(20) NOT NULL,
  `login_name` varchar(10) NOT NULL,
  `role_id` int NOT NULL,
  `picture` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'img1.jpg',
  PRIMARY KEY (`user_id`),
  KEY `fk_user_role` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '老周', '666666', 'james', '1', 'img1.jpg');
