/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : test_egg

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 28/10/2020 17:11:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `ext` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件扩展名',
  `md` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件MD5',
  `file_id` int NOT NULL DEFAULT 0 COMMENT '父级id',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `size` int NOT NULL DEFAULT 0 COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文件url',
  `isdir` int NOT NULL DEFAULT 0 COMMENT '是否为文件夹',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, 'img', '', '', 0, 1, 0, '', 1, '2020-10-24 15:22:29', '2020-10-24 15:22:31');
INSERT INTO `file` VALUES (2, 'document', '', '', 0, 1, 0, '', 1, '2020-10-24 15:22:58', '2020-10-24 15:23:02');
INSERT INTO `file` VALUES (3, 'markdown', '', '', 2, 1, 0, '', 1, '2020-10-24 15:23:21', '2020-10-24 15:23:24');
INSERT INTO `file` VALUES (4, '1.png', 'image/png', 'img/c10dtax56680000.png', 1, 1, 32, 'http://yuxis.oss-cn-beijing.aliyuncs.com/img/c10dtax56680000.png', 0, '2020-10-24 15:24:46', '2020-10-24 15:24:46');
INSERT INTO `file` VALUES (6, 'video.mp4', 'video/mp4', 'document/6f504rh95so0000.mp4', 2, 1, 907, 'http://yuxis.oss-cn-beijing.aliyuncs.com/document/6f504rh95so0000.mp4', 0, '2020-10-24 15:38:45', '2020-10-24 15:38:45');
INSERT INTO `file` VALUES (7, '视频', '', '', 0, 1, 0, '', 1, '2020-10-24 16:50:56', '2020-10-24 16:50:56');
INSERT INTO `file` VALUES (8, 'video.mp4', 'video/mp4', '视频/esw80wmkrts0000.mp4', 7, 1, 907, 'http://yuxis.oss-cn-beijing.aliyuncs.com/%E8%A7%86%E9%A2%91/esw80wmkrts0000.mp4', 0, '2020-10-24 16:55:43', '2020-10-24 16:55:43');
INSERT INTO `file` VALUES (19, '1111.png', 'image/png', 'img/crv7scta4w00000.png', 1, 1, 481, 'http://yuxis.oss-cn-beijing.aliyuncs.com/img/crv7scta4w00000.png', 0, '2020-10-24 19:01:06', '2020-10-24 19:01:06');
INSERT INTO `file` VALUES (20, '1111.png', 'image/png', 'img/6ywwwqrlhwo000.png', 1, 1, 481, 'http://yuxis.oss-cn-beijing.aliyuncs.com/img/6ywwwqrlhwo000.png', 0, '2020-10-24 19:01:07', '2020-10-24 19:01:07');
INSERT INTO `file` VALUES (21, '11.png', 'image/png', 'img/bvgyu4doejk0000.png', 1, 1, 32, 'http://yuxis.oss-cn-beijing.aliyuncs.com/img/bvgyu4doejk0000.png', 0, '2020-10-24 19:02:30', '2020-10-24 19:02:30');
INSERT INTO `file` VALUES (33, '分享', '', '', 0, 2, 0, '', 1, '2020-10-24 20:35:30', '2020-10-24 20:35:30');
INSERT INTO `file` VALUES (34, '11.png', 'image/png', 'img/bvgyu4doejk0000.png', 33, 2, 32, 'http://yuxis.oss-cn-beijing.aliyuncs.com/img/bvgyu4doejk0000.png', 0, '2020-10-24 20:36:03', '2020-10-24 20:36:03');
INSERT INTO `file` VALUES (35, '1111.png', 'image/png', '[object SequelizeInstance:file]2zex1t3jyxe0000.png', 1, 1, 481, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D2zex1t3jyxe0000.png', 0, '2020-10-25 19:42:06', '2020-10-25 19:42:06');
INSERT INTO `file` VALUES (36, 'video.mp4', 'video/mp4', '[object SequelizeInstance:file]bqi2qittips0000.mp4', 2, 1, 907, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dbqi2qittips0000.mp4', 0, '2020-10-25 19:44:57', '2020-10-25 19:44:57');
INSERT INTO `file` VALUES (37, 'video.mp4', 'video/mp4', 'ez0902c6f5c0000.mp4', 0, 1, 907, 'https://yuxis.oss-cn-beijing.aliyuncs.com/ez0902c6f5c0000.mp4', 0, '2020-10-25 20:03:10', '2020-10-25 20:03:10');
INSERT INTO `file` VALUES (39, '11.png', 'image/png', 'cy81gp3jatk0000.png', 0, 1, 32, 'https://yuxis.oss-cn-beijing.aliyuncs.com/cy81gp3jatk0000.png', 0, '2020-10-25 20:06:49', '2020-10-27 15:40:44');
INSERT INTO `file` VALUES (40, '2.png', 'image/png', '48x4d30x0zm0000.png', 0, 1, 4, 'https://yuxis.oss-cn-beijing.aliyuncs.com/48x4d30x0zm0000.png', 0, '2020-10-25 20:06:55', '2020-10-25 20:06:55');
INSERT INTO `file` VALUES (43, '1603188838-IMG_0008.PNG', 'image/png', '[object SequelizeInstance:file]fixwg7hgk8g0000.PNG', 1, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dfixwg7hgk8g0000.PNG', 0, '2020-10-26 16:05:37', '2020-10-26 16:05:37');
INSERT INTO `file` VALUES (44, '1603283646-IMG_0009.PNG', 'image/png', '[object SequelizeInstance:file]ee4zx5ve6pc0000.PNG', 1, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dee4zx5ve6pc0000.PNG', 0, '2020-10-26 16:05:37', '2020-10-26 16:05:37');
INSERT INTO `file` VALUES (45, '1603360500-IMG_0012.PNG', 'image/png', 'ao541is0i4c000.PNG', 0, 1, 62, 'https://yuxis.oss-cn-beijing.aliyuncs.com/ao541is0i4c000.PNG', 0, '2020-10-26 16:38:32', '2020-10-26 16:38:32');
INSERT INTO `file` VALUES (46, '1603360527-IMG_0013.PNG', 'image/png', '1pknav5xrkao000.PNG', 0, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/1pknav5xrkao000.PNG', 0, '2020-10-26 16:38:33', '2020-10-26 16:38:33');
INSERT INTO `file` VALUES (48, '1603360527-IMG_0013.PNG', 'image/png', 'cbbx96m37tk0000.PNG', 0, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/cbbx96m37tk0000.PNG', 0, '2020-10-26 16:40:03', '2020-10-26 16:40:03');
INSERT INTO `file` VALUES (51, '1603283646-IMG_0009.PNG', 'image/png', 'g3omsmz6r880000.PNG', 0, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/g3omsmz6r880000.PNG', 0, '2020-10-26 16:40:19', '2020-10-26 16:40:19');
INSERT INTO `file` VALUES (52, '1603360500-IMG_0012.PNG', 'image/png', 'atryvpuej2g0000.PNG', 0, 1, 62, 'https://yuxis.oss-cn-beijing.aliyuncs.com/atryvpuej2g0000.PNG', 0, '2020-10-26 16:40:44', '2020-10-26 16:40:44');
INSERT INTO `file` VALUES (53, '1603360555-IMG_0014.PNG', 'image/png', '6t4vi57d7jw0000.PNG', 0, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/6t4vi57d7jw0000.PNG', 0, '2020-10-26 16:40:57', '2020-10-26 16:40:57');
INSERT INTO `file` VALUES (54, '1603188838-IMG_0008.PNG', 'image/png', 'fuxahbctsko0000.PNG', 0, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/fuxahbctsko0000.PNG', 0, '2020-10-26 16:41:13', '2020-10-26 16:41:13');
INSERT INTO `file` VALUES (55, '1603360527-IMG_0013.PNG', 'image/png', '[object SequelizeInstance:file]fnmmr6tr3mo0000.PNG', 1, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dfnmmr6tr3mo0000.PNG', 0, '2020-10-26 16:41:18', '2020-10-26 16:41:18');
INSERT INTO `file` VALUES (56, '1603360500-IMG_0012.PNG', 'image/png', '[object SequelizeInstance:file]djzuo6pvxnk0000.PNG', 1, 1, 62, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Ddjzuo6pvxnk0000.PNG', 0, '2020-10-26 16:41:24', '2020-10-26 16:41:24');
INSERT INTO `file` VALUES (57, '1603360555-IMG_0014.PNG', 'image/png', '[object SequelizeInstance:file]7h2hr51z6a80000.PNG', 1, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D7h2hr51z6a80000.PNG', 0, '2020-10-26 16:41:28', '2020-10-26 16:41:28');
INSERT INTO `file` VALUES (58, '1603361610-IMG_0018.PNG', 'image/png', '[object SequelizeInstance:file]5xjaogxd4hs0000.PNG', 1, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D5xjaogxd4hs0000.PNG', 0, '2020-10-26 16:41:33', '2020-10-26 16:41:33');
INSERT INTO `file` VALUES (59, '1603283646-IMG_0009.PNG', 'image/png', '[object SequelizeInstance:file]24kuan7cnx6o00.PNG', 1, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D24kuan7cnx6o00.PNG', 0, '2020-10-26 16:41:34', '2020-10-26 16:41:34');
INSERT INTO `file` VALUES (60, '1603188838-IMG_0008.PNG', 'image/png', '[object SequelizeInstance:file]bgfn0w0v2xk0000.PNG', 1, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dbgfn0w0v2xk0000.PNG', 0, '2020-10-26 16:41:36', '2020-10-26 16:41:36');
INSERT INTO `file` VALUES (61, '1603361631-IMG_0019.PNG', 'image/png', '[object SequelizeInstance:file]flg1hl7wg8o0000.PNG', 1, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dflg1hl7wg8o0000.PNG', 0, '2020-10-26 16:41:39', '2020-10-26 16:41:39');
INSERT INTO `file` VALUES (62, '1603360562-IMG_0015.PNG', 'image/png', '[object SequelizeInstance:file]5efsa97kk8o0000.PNG', 1, 1, 177, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D5efsa97kk8o0000.PNG', 0, '2020-10-26 16:41:43', '2020-10-26 16:41:43');
INSERT INTO `file` VALUES (63, '1603361728-IMG_0020.PNG', 'image/png', '[object SequelizeInstance:file]22sptjo3w8ps000.PNG', 1, 1, 184, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D22sptjo3w8ps000.PNG', 0, '2020-10-26 16:42:20', '2020-10-26 16:42:20');
INSERT INTO `file` VALUES (64, '1603361728-IMG_0020.PNG', 'image/png', '[object SequelizeInstance:file]4c66efddbvg0000.PNG', 1, 1, 184, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D4c66efddbvg0000.PNG', 0, '2020-10-26 16:42:35', '2020-10-26 16:42:35');
INSERT INTO `file` VALUES (65, '1603188838-IMG_0008.PNG', 'image/png', 'gg0bnxx5vyg000.PNG', 0, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/gg0bnxx5vyg000.PNG', 0, '2020-10-26 16:43:33', '2020-10-26 16:43:33');
INSERT INTO `file` VALUES (66, '1603360500-IMG_0012.PNG', 'image/png', '[object SequelizeInstance:file]8jmc9nvna840000.PNG', 2, 1, 62, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D8jmc9nvna840000.PNG', 0, '2020-10-26 16:44:14', '2020-10-26 16:44:14');
INSERT INTO `file` VALUES (67, '1603360555-IMG_0014.PNG', 'image/png', '[object SequelizeInstance:file]a372i0z0n0o0000.PNG', 2, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Da372i0z0n0o0000.PNG', 0, '2020-10-26 16:44:20', '2020-10-26 16:44:20');
INSERT INTO `file` VALUES (68, '1603360527-IMG_0013.PNG', 'image/png', '[object SequelizeInstance:file]dvano4x3m9k0000.PNG', 2, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Ddvano4x3m9k0000.PNG', 0, '2020-10-26 16:44:28', '2020-10-26 16:44:28');
INSERT INTO `file` VALUES (69, '1603360562-IMG_0015.PNG', 'image/png', '[object SequelizeInstance:file]c5e2mddwgts0000.PNG', 2, 1, 177, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dc5e2mddwgts0000.PNG', 0, '2020-10-26 16:44:38', '2020-10-26 16:44:38');
INSERT INTO `file` VALUES (70, '1603283646-IMG_0009.PNG', 'image/png', '2gifi81r6mxw00.PNG', 0, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/2gifi81r6mxw00.PNG', 0, '2020-10-26 16:44:39', '2020-10-26 16:44:39');
INSERT INTO `file` VALUES (71, '1603361631-IMG_0019.PNG', 'image/png', '[object SequelizeInstance:file]5yhh2062q580000.PNG', 2, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D5yhh2062q580000.PNG', 0, '2020-10-26 16:44:48', '2020-10-26 16:44:48');
INSERT INTO `file` VALUES (72, '1603188838-IMG_0008.PNG', 'image/png', '[object SequelizeInstance:file]7gfwevcwwhw000.PNG', 2, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D7gfwevcwwhw000.PNG', 0, '2020-10-26 16:44:51', '2020-10-26 16:44:51');
INSERT INTO `file` VALUES (73, '1603283646-IMG_0009.PNG', 'image/png', '[object SequelizeInstance:file]a2gr637mzg40000.PNG', 2, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Da2gr637mzg40000.PNG', 0, '2020-10-26 16:45:09', '2020-10-26 16:45:09');
INSERT INTO `file` VALUES (74, '1603361610-IMG_0018.PNG', 'image/png', '[object SequelizeInstance:file]2hjc1ng7aow0000.PNG', 2, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D2hjc1ng7aow0000.PNG', 0, '2020-10-26 16:45:12', '2020-10-26 16:45:12');
INSERT INTO `file` VALUES (75, '1603361728-IMG_0020.PNG', 'image/png', '[object SequelizeInstance:file]4shevbzglns0000.PNG', 2, 1, 184, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D4shevbzglns0000.PNG', 0, '2020-10-26 16:45:23', '2020-10-26 16:45:23');
INSERT INTO `file` VALUES (76, '1603361728-IMG_0020.PNG', 'image/png', '[object SequelizeInstance:file]ebl9rfjuo1s0000.PNG', 2, 1, 184, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Debl9rfjuo1s0000.PNG', 0, '2020-10-26 16:45:54', '2020-10-26 16:45:54');
INSERT INTO `file` VALUES (77, '1603361728-IMG_0020.PNG', 'image/png', '[object SequelizeInstance:file]dil7orgfsog0000.PNG', 1, 1, 184, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Ddil7orgfsog0000.PNG', 0, '2020-10-26 16:45:58', '2020-10-26 16:45:58');
INSERT INTO `file` VALUES (78, '1603361610-IMG_0018.PNG', 'image/png', '[object SequelizeInstance:file]5tg8mandho40000.PNG', 2, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D5tg8mandho40000.PNG', 0, '2020-10-26 16:45:59', '2020-10-26 16:45:59');
INSERT INTO `file` VALUES (79, '1603283646-IMG_0009.PNG', 'image/png', 'g0jz6bzsryo0000.PNG', 0, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/g0jz6bzsryo0000.PNG', 0, '2020-10-26 16:47:08', '2020-10-26 16:47:08');
INSERT INTO `file` VALUES (81, '1603360500-IMG_0012.PNG', 'image/png', '95ad0eiu8q80000.PNG', 0, 1, 62, 'https://yuxis.oss-cn-beijing.aliyuncs.com/95ad0eiu8q80000.PNG', 0, '2020-10-26 16:47:13', '2020-10-26 16:47:13');
INSERT INTO `file` VALUES (83, '1603360527-IMG_0013.PNG', 'image/png', 'bxm7j8lveq80000.PNG', 0, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/bxm7j8lveq80000.PNG', 0, '2020-10-26 16:47:14', '2020-10-26 16:47:14');
INSERT INTO `file` VALUES (84, '1603360555-IMG_0014.PNG', 'image/png', '1b90qslqi7cw000.PNG', 0, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/1b90qslqi7cw000.PNG', 0, '2020-10-26 16:47:17', '2020-10-26 16:47:17');
INSERT INTO `file` VALUES (86, '1603360562-IMG_0015.PNG', 'image/png', 'duq18vmpayg0000.PNG', 0, 1, 177, 'https://yuxis.oss-cn-beijing.aliyuncs.com/duq18vmpayg0000.PNG', 0, '2020-10-26 16:47:24', '2020-10-26 16:47:24');
INSERT INTO `file` VALUES (87, '1603188838-IMG_0008.PNG', 'image/png', '9k9pwt7efos0000.PNG', 0, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/9k9pwt7efos0000.PNG', 0, '2020-10-26 16:47:31', '2020-10-26 16:47:31');
INSERT INTO `file` VALUES (88, '1603188838-IMG_0008.PNG', 'image/png', '5r1ysch0lrk0000.PNG', 0, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/5r1ysch0lrk0000.PNG', 0, '2020-10-26 16:57:16', '2020-10-26 16:57:16');
INSERT INTO `file` VALUES (89, '1603283646-IMG_0009.PNG', 'image/png', '6npf1vbr1pc0000.PNG', 0, 1, 93, 'https://yuxis.oss-cn-beijing.aliyuncs.com/6npf1vbr1pc0000.PNG', 0, '2020-10-26 19:37:13', '2020-10-26 19:37:13');
INSERT INTO `file` VALUES (90, '1603188838-IMG_0008.PNG', 'image/png', '3b6y1aateju0000.PNG', 0, 1, 238, 'https://yuxis.oss-cn-beijing.aliyuncs.com/3b6y1aateju0000.PNG', 0, '2020-10-26 19:37:14', '2020-10-26 19:37:14');
INSERT INTO `file` VALUES (92, '1603360562-IMG_0015.PNG', 'image/png', 'ff8awlj9qb40000.PNG', 0, 1, 177, 'https://yuxis.oss-cn-beijing.aliyuncs.com/ff8awlj9qb40000.PNG', 0, '2020-10-26 19:54:25', '2020-10-26 19:54:25');
INSERT INTO `file` VALUES (93, '1603360500-IMG_0012.PNG', 'image/png', '7hhav9uojao0000.PNG', 0, 1, 62, 'https://yuxis.oss-cn-beijing.aliyuncs.com/7hhav9uojao0000.PNG', 0, '2020-10-26 19:57:33', '2020-10-26 19:57:33');
INSERT INTO `file` VALUES (94, '1603360527-IMG_0013.PNG', 'image/png', '6ldk5uxb8s80000.PNG', 0, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/6ldk5uxb8s80000.PNG', 0, '2020-10-26 19:57:33', '2020-10-26 19:57:33');
INSERT INTO `file` VALUES (96, '1603360562-IMG_0015.PNG', 'image/png', 'agfl5naitc4000.PNG', 0, 1, 177, 'https://yuxis.oss-cn-beijing.aliyuncs.com/agfl5naitc4000.PNG', 0, '2020-10-26 19:59:49', '2020-10-26 19:59:49');
INSERT INTO `file` VALUES (97, 'su', '', '', 0, 1, 0, '', 1, '2020-10-26 20:16:33', '2020-10-26 20:16:33');
INSERT INTO `file` VALUES (98, '1603360555-IMG_0014.PNG', 'image/png', '[object SequelizeInstance:file]5sjlewtdyfk0000.PNG', 97, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D5sjlewtdyfk0000.PNG', 0, '2020-10-26 20:19:47', '2020-10-26 20:19:47');
INSERT INTO `file` VALUES (99, '1603361610-IMG_0018.PNG', 'image/png', '[object SequelizeInstance:file]d2a312s5l400000.PNG', 97, 1, 78, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dd2a312s5l400000.PNG', 0, '2020-10-26 20:19:53', '2020-10-26 20:19:53');
INSERT INTO `file` VALUES (100, '1603360562-IMG_0015.PNG', 'image/png', '[object SequelizeInstance:file]c131mwocz140000.PNG', 97, 1, 177, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5Dc131mwocz140000.PNG', 0, '2020-10-26 20:19:54', '2020-10-26 20:19:54');
INSERT INTO `file` VALUES (101, '1603361631-IMG_0019.PNG', 'image/png', '[object SequelizeInstance:file]8bw3o31y1vg0000.PNG', 97, 1, 84, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D8bw3o31y1vg0000.PNG', 0, '2020-10-26 20:19:55', '2020-10-26 20:19:55');
INSERT INTO `file` VALUES (102, '2.png', 'image/png', '48x4d30x0zm0000.png', 0, 2, 4, 'https://yuxis.oss-cn-beijing.aliyuncs.com/48x4d30x0zm0000.png', 0, '2020-10-26 22:12:52', '2020-10-26 22:12:52');
INSERT INTO `file` VALUES (103, 'video.mp4', 'video/mp4', 'ez0902c6f5c0000.mp4', 0, 2, 907, 'https://yuxis.oss-cn-beijing.aliyuncs.com/ez0902c6f5c0000.mp4', 0, '2020-10-26 22:14:04', '2020-10-26 22:14:04');
INSERT INTO `file` VALUES (104, '1603361728-IMG_0020.PNG', 'image/png', '53j92vfckyw0000.PNG', 0, 2, 184, 'https://yuxis.oss-cn-beijing.aliyuncs.com/53j92vfckyw0000.PNG', 0, '2020-10-27 08:39:15', '2020-10-27 08:39:15');
INSERT INTO `file` VALUES (108, '2.png', 'image/png', '48x4d30x0zm0000.png', 0, 2, 4, 'https://yuxis.oss-cn-beijing.aliyuncs.com/48x4d30x0zm0000.png', 0, '2020-10-27 15:30:52', '2020-10-27 15:30:52');
INSERT INTO `file` VALUES (113, '11.png', 'image/png', 'cy81gp3jatk0000.png', 0, 2, 32, 'https://yuxis.oss-cn-beijing.aliyuncs.com/cy81gp3jatk0000.png', 0, '2020-10-27 15:41:08', '2020-10-27 15:41:08');
INSERT INTO `file` VALUES (115, '视频', '', '', 0, 7, 0, '', 1, '2020-10-27 16:06:50', '2020-10-27 16:06:50');
INSERT INTO `file` VALUES (116, 'Screenshot_20201027_155128_io.dcloud.HBuilder.jpg', 'image/jpeg', '98tenzd54is0000.jpg', 0, 1, 172, 'https://yuxis.oss-cn-beijing.aliyuncs.com/98tenzd54is0000.jpg', 0, '2020-10-27 16:09:21', '2020-10-27 16:09:21');
INSERT INTO `file` VALUES (118, '图片', '', '', 0, 7, 0, '', 1, '2020-10-27 16:16:14', '2020-10-27 16:16:14');
INSERT INTO `file` VALUES (119, '文件', '', '', 0, 7, 0, '', 1, '2020-10-27 16:16:23', '2020-10-27 16:16:23');
INSERT INTO `file` VALUES (120, 'pdf', '', '', 119, 7, 0, '', 1, '2020-10-27 16:16:40', '2020-10-27 16:16:40');
INSERT INTO `file` VALUES (121, 'Screenshot_20201027_155159_io.dcloud.HBuilder.jpg', 'image/jpeg', 'bcu52hd1zvc0000.jpg', 0, 1, 192, 'https://yuxis.oss-cn-beijing.aliyuncs.com/bcu52hd1zvc0000.jpg', 0, '2020-10-27 16:17:10', '2020-10-27 16:17:10');
INSERT INTO `file` VALUES (123, '1603786797544.mp4', 'video/mp4', '[object SequelizeInstance:file]2onl1ouk1xq0000.mp4', 115, 7, 1179, 'https://yuxis.oss-cn-beijing.aliyuncs.com/%5Bobject%20SequelizeInstance%3Afile%5D2onl1ouk1xq0000.mp4', 0, '2020-10-27 16:23:05', '2020-10-27 16:23:05');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20201022054418-user.js');
INSERT INTO `sequelizemeta` VALUES ('20201024070503-file.js');
INSERT INTO `sequelizemeta` VALUES ('20201024110543-share.js');

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sharedurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '分享链接',
  `file_id` int NOT NULL DEFAULT 0 COMMENT '文件id',
  `iscancel` int NOT NULL DEFAULT 0 COMMENT '是否取消分享',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `file_id`(`file_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `share_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `share_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES (1, 'h70uy8mbks00000000', 21, 0, 1, '2020-10-24 19:55:16', '2020-10-24 19:55:16');
INSERT INTO `share` VALUES (2, '341b4zqhjus0000000', 20, 0, 1, '2020-10-24 20:02:45', '2020-10-24 20:02:45');
INSERT INTO `share` VALUES (3, 'rpqcmlsw80w0000000', 40, 0, 1, '2020-10-26 21:31:50', '2020-10-26 21:31:50');
INSERT INTO `share` VALUES (4, 'auz61yrincw0000000', 37, 0, 1, '2020-10-26 21:32:19', '2020-10-26 21:32:19');
INSERT INTO `share` VALUES (5, 'a1920i2kpk00000000', 40, 0, 1, '2020-10-26 22:10:09', '2020-10-26 22:10:09');
INSERT INTO `share` VALUES (6, 'wghwmx725hs000000', 40, 0, 1, '2020-10-26 22:11:03', '2020-10-26 22:11:03');
INSERT INTO `share` VALUES (7, 'aag5m9ehhm80000000', 40, 0, 1, '2020-10-26 22:12:18', '2020-10-26 22:12:18');
INSERT INTO `share` VALUES (8, 'czyr7ll6pqw000000', 37, 0, 1, '2020-10-26 22:13:45', '2020-10-26 22:13:45');
INSERT INTO `share` VALUES (12, 'c94zo52dw800000000', 40, 0, 1, '2020-10-27 15:30:31', '2020-10-27 15:30:31');
INSERT INTO `share` VALUES (13, 'yb7wf74lif40000000', 39, 0, 1, '2020-10-27 15:40:50', '2020-10-27 15:40:50');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '手机',
  `sex` enum('男','女','保密') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '个性签名',
  `total_size` int NULL DEFAULT 0 COMMENT '网盘总大小，单位:kb',
  `used_size` int NULL DEFAULT 0 COMMENT '网盘已使用大小，单位:kb',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'su', 'su', '', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '男', '', 10485760, 364, '2020-10-22 14:41:29', '2020-10-27 16:17:11');
INSERT INTO `user` VALUES (2, 'y', 'y', '', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '男', '', 10485760, 1163, '2020-10-23 15:51:25', '2020-10-27 15:41:08');
INSERT INTO `user` VALUES (3, '8kdddnk', '', '', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '男', '', 10485760, 0, '2020-10-23 16:22:09', '2020-10-23 16:22:09');
INSERT INTO `user` VALUES (4, 'dccdnk', '', '', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '男', '', 10485760, 0, '2020-10-23 16:39:07', '2020-10-23 16:39:07');
INSERT INTO `user` VALUES (5, 'sususs', '', '', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '男', '', 10485760, 0, '2020-10-25 17:26:44', '2020-10-25 17:26:44');
INSERT INTO `user` VALUES (6, 'syxsyx', '', '', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '男', '', 10485760, 0, '2020-10-25 17:35:48', '2020-10-25 17:35:48');
INSERT INTO `user` VALUES (7, 'wangx', '', '', 'a320480f534776bddb5cdb54b1e93d210a3c7d199e80a23c1b2178497b184c76', '', '', '男', '', 10485760, 0, '2020-10-27 15:09:14', '2020-10-27 16:23:30');

SET FOREIGN_KEY_CHECKS = 1;
