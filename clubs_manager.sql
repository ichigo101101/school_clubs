/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : clubs_manager

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 05/09/2024 18:22:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宣传图片',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动标题',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '活动内容',
  `department_id` int(10) NULL DEFAULT NULL COMMENT '社团ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社团活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, 'http://localhost:9090/files/1724913155546-英语社.jpg', '英语角', '2024-08-29', '<p>定期组织英语角活动，给社员提供一个轻松的环境来练习英语口语，可以讨论时事、文化、电影等话题。</p>', 6);
INSERT INTO `activity` VALUES (3, 'http://localhost:9090/files/1724914499442-街舞社.jpg', '舞蹈课程与培训', '2024-08-29', '<p>基础课程：定期组织基础舞蹈课程，教授不同风格的街舞，如Breaking（霹雳舞）、Popping（弹跳舞）、Locking（锁舞）等。<br/></p><p><br/></p><p>进阶课程：为有一定基础的成员提供更高阶的舞蹈技巧培训，帮助他们提升水平。<br/></p>', 3);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1697438073596-avatar.png', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '学生ID',
  `department_id` int(10) NULL DEFAULT NULL COMMENT '社团ID',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请说明',
  `process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '当前进度',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '申请审批表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (1, 7, 6, '11', '审核完成', '审核通过', '222');
INSERT INTO `apply` VALUES (2, 7, 5, '555', '审核完成', '审核通过', '');
INSERT INTO `apply` VALUES (3, 7, 3, '5243254', '审核完成', '审核通过', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '学生ID',
  `department_id` int(10) NULL DEFAULT NULL COMMENT '社团ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论时间',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论内容',
  `parent_id` int(10) NULL DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 7, 3, '2024-09-03 17:45:24', '123546546', 0);
INSERT INTO `comment` VALUES (2, 7, 3, '2024-09-03 17:47:02', '23123543', 0);
INSERT INTO `comment` VALUES (3, 7, 6, '2024-09-04 16:59:22', '1', 0);
INSERT INTO `comment` VALUES (4, 7, 5, '2024-09-04 16:59:31', '2', 0);
INSERT INTO `comment` VALUES (5, 7, 5, '2024-09-04 17:00:49', '3', 0);
INSERT INTO `comment` VALUES (6, 7, 6, '2024-09-04 17:01:48', '6666', 0);
INSERT INTO `comment` VALUES (7, 7, 6, '2024-09-04 17:02:42', '888', 0);
INSERT INTO `comment` VALUES (8, 7, 6, '2024-09-04 17:52:58', '8587', 0);
INSERT INTO `comment` VALUES (9, 7, 3, '2024-09-05 18:05:13', '5435', 0);
INSERT INTO `comment` VALUES (10, 7, 3, '2024-09-05 18:12:17', '2543543', 0);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '社团logo',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '社团名称',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '社团介绍',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '社长ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社团信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'http://localhost:9090/files/1724057459719-2021-9-28_14-27-38.png', '姓氏社', '<p>111212</p>', 6, '2024-08-22');
INSERT INTO `department` VALUES (3, 'http://localhost:9090/files/1724306450597-街舞社.jpg', '街舞社', '<h4>社团宗旨</h4><p>热舞先锋街舞社致力于推广街舞文化，提升社员的舞蹈技巧，培养团队合作精神，并为舞蹈爱好者提供一个展示和发展的平台。我们相信，街舞不仅是一种舞蹈形式，更是一种表达自我、释放热情的生活方式。</p><h4>社团目标</h4><ul><li><strong>技能提升</strong>：提供系统的街舞培训课程，帮助成员提高舞蹈技巧和表现能力。</li><li><strong>文化推广</strong>：普及街舞文化，增加对街舞历史和发展的了解。</li><li><strong>团队合作</strong>：通过集体排练和活动，增强社团成员之间的协作和友谊。</li><li><strong>社区参与</strong>：积极参与校园及社区的文化活动，展示街舞魅力。</li></ul><h4>主要活动</h4><ol><li><strong>定期课程</strong>：组织基础及进阶街舞课程，涵盖各种风格，如Breaking、Popping、Locking等。</li><li><strong>集体排练</strong>：安排定期的团队排练，为即将到来的演出和比赛做准备。</li><li><strong>街舞比赛</strong>：参加校内外街舞比赛，提高社团和成员的知名度。</li><li><strong>工作坊和讲座</strong>：邀请专业舞者和街舞专家举办工作坊和讲座，分享经验和技巧。</li><li><strong>社区演出</strong>：在校园或社区举行街舞表演，展示社团风采。</li><li><strong>创意挑战</strong>：定期举办舞蹈创编挑战，鼓励成员展示创意和个人风格。</li></ol><h4>加入方式</h4><p>欢迎所有对街舞有兴趣的同学加入我们的社团。不论你是初学者还是有一定基础的舞者，只要你对街舞充满热情，愿意学习和分享，都可以成为我们的一员。加入方式如下：</p><ul><li><strong>报名时间</strong>：每学期初开放报名</li><li><strong>报名方式</strong>：通过社团官方网站或在校园内指定地点填写申请表</li></ul><h4>联系我们</h4><p>如果你对街舞社感兴趣，或有任何问题，请随时联系我们。我们期待与你一起舞动青春，开启街舞之旅！</p>', 8, '2024-08-22');
INSERT INTO `department` VALUES (4, 'http://localhost:9090/files/1724306467250-篮球社.jpg', '篮球社', '', 9, '2024-08-22');
INSERT INTO `department` VALUES (5, 'http://localhost:9090/files/1724306517491-乒乓球社.jpg', '乒乓球社', '<p><strong>愿景与使命</strong><br/>乒乓球社致力于推广乒乓球运动，让每一位成员都能在球场上展现自我，提高技术水平，增强团队合作精神。我们通过各种活动和比赛，为大家提供了一个积极向上的交流平台。</p><p><strong>活动安排</strong><br/>我们定期举办训练课程、内部比赛以及校际比赛，邀请专业教练进行讲座。无论你是初学者还是高手，我们都会为你提供相应的训练和比赛机会。</p><p><br/></p><p><br/>欢迎所有对乒乓球感兴趣的朋友加入我们！</p><p>让我们一起挥拍迎接每一个挑战，共同享受乒乓球带来的乐趣！</p>', 10, '2024-08-22');
INSERT INTO `department` VALUES (6, 'http://localhost:9090/files/1724308726519-英语社.jpg', '英语社', '<p><strong>愿景与使命</strong><br/>英语社致力于提高英语水平，为每一位成员提供一个积极的语言学习环境。我们通过丰富多彩的活动，帮助大家在听说读写方面取得进步，增强实际应用能力，培养全球视野。</p><p><strong>活动安排</strong><br/>我们定期组织英语角、语言交流活动、演讲与辩论赛、电影赏析和读书会等，提供多种机会提升英语能力。社团还提供考试辅导，帮助成员备考托福、雅思等英语考试。</p><p><br/></p><p><br/>欢迎所有对英语学习感兴趣的朋友加入我们！</p><p>让我们一起用英语交流、学习、成长，共同探索语言的魅力！</p>', 11, '2024-08-22');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '资讯标题',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '资讯内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布时间',
  `department_id` int(10) NULL DEFAULT NULL COMMENT '社团ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '社团资讯表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (1, '街舞表演大赛', '<p>日期：2024年9月15日<br/>地点：校园大礼堂<br/>描述：这是我们年度最盛大的活动，汇聚了来自全校的街舞团队，展现了街舞的多样性和创新性。<br/></p>', '2024-09-01', 3);
INSERT INTO `information` VALUES (2, '街舞技能培训班', '<p>日期：2024年10月10日 - 2024年10月20日<br/>地点：社团活动中心<br/>描述：为提高社团成员的舞蹈技巧，我们邀请了专业的舞蹈教练进行为期十天的培训。<br/></p>', '2024-09-04', 3);
INSERT INTO `information` VALUES (3, '下学期街舞营', '<p>日期：2024年10月21日 - 2024年1月5日<br/>地点：校外活动基地<br/>描述：夏季街舞营是一次集训机会，除了舞蹈课程，还有团队建设和户外活动。<br/></p>', '2024-09-04', 3);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (2, '所有功能都已完成，可以正常使用', '所有功能都已完成，可以正常使用', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (3, '今天天气很不错，可以出去一起玩了', '今天天气很不错，可以出去一起玩了', '2023-09-05', 'admin');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (5, 'ichigo', '1', '111', 'http://localhost:9090/files/1723972333244-logo1.png', 'USER', '111', '111', '学生');
INSERT INTO `user` VALUES (6, 'zhangsan', '123', '张三', NULL, 'USER', '142650', '1521', '社长');
INSERT INTO `user` VALUES (7, '1', '123', '1', NULL, 'USER', '1', '1', '学生');
INSERT INTO `user` VALUES (8, '2', '123', '2', NULL, 'USER', '2', '2', '社长');
INSERT INTO `user` VALUES (9, '3', '123', '3', NULL, 'USER', '3', '3', '社长');
INSERT INTO `user` VALUES (10, '4', '123', '4', NULL, 'USER', '4', '4', '社长');
INSERT INTO `user` VALUES (11, '5', '123', '5', NULL, 'USER', '5', '5', '社长');
INSERT INTO `user` VALUES (12, '8', '123', '8', NULL, 'USER', NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, '9', '123', '9', NULL, 'USER', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
