/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - caiwuguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`caiwuguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `caiwuguanli`;

/*Table structure for table `baoxiao` */

DROP TABLE IF EXISTS `baoxiao`;

CREATE TABLE `baoxiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '申请人',
  `baoxiao_name` varchar(200) DEFAULT NULL COMMENT '报销名目 Search111 ',
  `baoxiao_types` int(11) DEFAULT NULL COMMENT '报销类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `baoxiao_money` decimal(10,4) DEFAULT NULL COMMENT '报销金额',
  `baoxiao_content` text COMMENT '提交备注',
  `baoxiao_shangjiao_types` int(11) DEFAULT NULL COMMENT '是否上交',
  `baoxiao_yesno_types` int(11) DEFAULT NULL COMMENT '是否批准',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='报销信息';

/*Data for the table `baoxiao` */

insert  into `baoxiao`(`id`,`yonghu_id`,`baoxiao_name`,`baoxiao_types`,`insert_time`,`baoxiao_money`,`baoxiao_content`,`baoxiao_shangjiao_types`,`baoxiao_yesno_types`,`create_time`) values (5,25,'报销1',1,'2021-05-08 13:20:12','800.0000','无\r\n',2,2,'2021-05-08 13:20:12'),(6,25,'报销2',2,'2021-05-08 13:20:32','900.0000','公交报销2\r\n',2,2,'2021-05-08 13:20:32'),(7,26,'张2的出差报销',1,'2021-05-08 13:45:33','300.0000','无\r\n',2,1,'2021-05-08 13:45:33');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别类型名称',1,'男',NULL,'2021-05-08 09:52:08'),(2,'sex_types','性别类型名称',2,'女',NULL,'2021-05-08 09:52:08'),(3,'role_types','权限',1,'普通员工',NULL,'2021-05-08 09:52:08'),(4,'role_types','权限',2,'财务经理',NULL,'2021-05-08 09:52:08'),(5,'shoufeixinxi_types','收费类型名称',1,'收费类型1',NULL,'2021-05-08 09:52:08'),(6,'shoufeixinxi_types','收费类型名称',2,'收费类型2',NULL,'2021-05-08 09:52:08'),(7,'shoufeixinxi_types','收费类型名称',3,'收费类型3',NULL,'2021-05-08 09:52:08'),(8,'shoufeixinxi_types','收费类型名称',4,'收费类型4',NULL,'2021-05-08 09:52:08'),(9,'zhichuxinxi_types','支出类型名称',1,'工资',NULL,'2021-05-08 09:52:08'),(10,'zhichuxinxi_types','支出类型名称',2,'日常损耗',NULL,'2021-05-08 09:52:08'),(11,'zhichuxinxi_types','支出类型名称',3,'报销',NULL,'2021-05-08 09:52:08'),(12,'baoxiao_types','报销类型名称',1,'出差报销',NULL,'2021-05-08 09:52:08'),(13,'baoxiao_types','报销类型名称',2,'公交报销',NULL,'2021-05-08 09:52:08'),(14,'baoxiao_shangjiao_types','是否上交',1,'待审批',NULL,'2021-05-08 09:52:08'),(15,'baoxiao_shangjiao_types','是否上交',2,'上交',NULL,'2021-05-08 09:52:08'),(16,'baoxiao_shangjiao_types','是否上交',3,'不上交',NULL,'2021-05-08 09:52:08'),(17,'baoxiao_yesno_types','是否批准',1,'待审批',NULL,'2021-05-08 09:52:08'),(18,'baoxiao_yesno_types','是否批准',2,'批准',NULL,'2021-05-08 09:52:08'),(19,'baoxiao_yesno_types','是否批准',3,'不批准',NULL,'2021-05-08 09:52:08'),(20,'liuyan_types','留言类型名称',1,'留言类型1',NULL,'2021-05-08 09:52:08'),(21,'liuyan_types','留言类型名称',2,'留言类型2',NULL,'2021-05-08 09:52:08'),(22,'gonggao_types','公告类型名称',1,'日常公告',NULL,'2021-05-08 09:52:08'),(23,'gonggao_types','公告类型名称',2,'紧急公告',NULL,'2021-05-08 09:52:08'),(24,'zhichuxinxi_types','支出类型名称',4,'物品采购',NULL,'2021-05-08 13:44:50');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111 ',
  `gonggao_types` int(11) DEFAULT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `gonggao_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (3,'公告1',1,'2021-05-08 11:55:35','公告1的详情\r\n','2021-05-08 11:55:35'),(4,'公告3',1,'2021-05-08 13:44:11','公告3的详情\r\n','2021-05-08 13:44:11');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `liuyan_name` varchar(200) DEFAULT NULL COMMENT '留言名称 Search111 ',
  `liuyan_types` int(11) DEFAULT NULL COMMENT '留言类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `liuyan_content` text COMMENT '留言详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='留言';

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`yonghu_id`,`liuyan_name`,`liuyan_types`,`insert_time`,`liuyan_content`,`create_time`) values (3,25,'留言1',1,'2021-05-08 13:21:09','留言内容1\r\n','2021-05-08 13:21:09'),(4,26,'留言2',1,'2021-05-08 13:45:48','留言2的详情\r\n','2021-05-08 13:45:48');

/*Table structure for table `shoufeixinxi` */

DROP TABLE IF EXISTS `shoufeixinxi`;

CREATE TABLE `shoufeixinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mingmu_name` varchar(200) DEFAULT NULL COMMENT '收费名目 Search111 ',
  `shoufeixinxi_types` int(11) DEFAULT NULL COMMENT '收费类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收费时间',
  `shoufeixinxi_yushou_money` decimal(10,4) DEFAULT NULL COMMENT '预售金额',
  `shoufeixinxi_shishou_money` decimal(10,4) DEFAULT NULL COMMENT '实收金额',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='收费信息';

/*Data for the table `shoufeixinxi` */

insert  into `shoufeixinxi`(`id`,`mingmu_name`,`shoufeixinxi_types`,`insert_time`,`shoufeixinxi_yushou_money`,`shoufeixinxi_shishou_money`,`create_time`) values (5,'名目1',4,'2021-05-08 11:24:26','100.0000','100.0000','2021-05-08 11:24:26'),(6,'名目2',3,'2021-05-08 11:24:44','1010.0000','1000.0000','2021-05-08 11:24:44'),(7,'名目3',4,'2021-05-08 11:26:36','500.0000','500.0000','2021-05-08 11:26:36'),(8,'名目4',4,'2021-05-08 11:26:48','90.0000',NULL,'2021-05-08 11:26:48'),(9,'名目4',3,'2021-05-08 13:35:37','1500.0000','1500.0000','2021-05-08 13:35:37'),(10,'名目5',2,'2021-05-08 13:41:38','100.0000','99.0000','2021-05-08 13:41:38'),(11,'名目9',1,'2021-05-08 13:47:32','900.0000','700.0000','2021-05-08 13:47:32');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','nl5vk30fxog9ch61f2dst4q1o40r9mf9','2021-05-08 10:28:41','2021-05-08 14:52:08'),(2,25,'a1','yonghu','普通员工','t12kwj35nfyyuynuemh7qdirutpzx6jf','2021-05-08 11:58:06','2021-05-08 14:19:27'),(3,27,'a11','yonghu','财务经理','g0orxopxqmzb1f71ail7aro27l3o7pgw','2021-05-08 13:21:17','2021-05-08 14:45:58'),(4,26,'a2','yonghu','普通员工','olb22ydzauwzmg4jomwcwhg1gpeo2g03','2021-05-08 13:44:59','2021-05-08 14:45:00'),(5,31,'a9','yonghu','普通员工','bvdk2q36xjpcf2k05ddah4kmqzbztsv3','2021-05-08 13:48:58','2021-05-08 14:48:58');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','123456','管理员','2021-04-27 14:51:13');

/*Table structure for table `xinzi` */

DROP TABLE IF EXISTS `xinzi`;

CREATE TABLE `xinzi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `month` varchar(200) DEFAULT NULL COMMENT '月份  Search111',
  `money` decimal(10,4) DEFAULT NULL COMMENT '薪资',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='薪资';

/*Data for the table `xinzi` */

insert  into `xinzi`(`id`,`yonghu_id`,`month`,`money`,`create_time`) values (5,25,'2021-08','10000.0000','2021-05-08 11:54:21'),(6,26,'2021-03','1000.0000','2021-05-08 13:43:36');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '手机号 Search111 ',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '身份证号 Search111 ',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '照片',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `role_types` int(11) DEFAULT NULL COMMENT '权限类型',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`role_types`,`create_time`) values (25,'a1','123456','张1','17703786901','410224199610232001','http://localhost:8080/caiwuguanli/file/download?fileName=1620443003700.jpg',1,1,'2021-05-08 11:03:28'),(26,'a2','123456','张2','17703786902','410224199610232002','http://localhost:8080/caiwuguanli/file/download?fileName=1620443023084.jpg',1,1,'2021-05-08 11:03:47'),(27,'a11','123456','张11','17703786911','410224199610232011','http://localhost:8080/caiwuguanli/file/download?fileName=1620443045881.jpg',2,2,'2021-05-08 11:04:08'),(28,'a3','123456','张3','17703786903','410224199610232003','http://localhost:8080/caiwuguanli/file/download?fileName=1620452097463.jpg',1,1,'2021-05-08 13:35:07'),(29,'a4','123456','张4','17703786904','410224199610232004','http://localhost:8080/caiwuguanli/file/download?fileName=1620452468590.jpg',2,1,'2021-05-08 13:41:16'),(30,'a5','123456','张5','17703786905','410224199610232005','http://localhost:8080/caiwuguanli/file/download?fileName=1620452832529.jpg',1,1,'2021-05-08 13:47:14'),(31,'a9','123456','张9','17703786909','410224199610232009','http://localhost:8080/caiwuguanli/file/download?fileName=1620452918874.jpg',2,1,'2021-05-08 13:48:53');

/*Table structure for table `zhichuxinxi` */

DROP TABLE IF EXISTS `zhichuxinxi`;

CREATE TABLE `zhichuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zhichuxinxi_mingmu_name` varchar(200) DEFAULT NULL COMMENT '支出名目 Search111 ',
  `zhichuxinxi_types` int(11) DEFAULT NULL COMMENT '支出类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '支出时间',
  `zhichuxinxi_money` decimal(10,4) DEFAULT NULL COMMENT '支出金额',
  `zhichu_content` text COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='支出信息';

/*Data for the table `zhichuxinxi` */

insert  into `zhichuxinxi`(`id`,`zhichuxinxi_mingmu_name`,`zhichuxinxi_types`,`insert_time`,`zhichuxinxi_money`,`zhichu_content`,`create_time`) values (5,'名目1',2,'2021-05-08 11:52:59','800.0000','无\r\n','2021-05-08 11:52:59'),(6,'张1的2021-08的工资10000.0元',1,'2021-05-08 11:54:21','10000.0000','张1的2021-08的工资10000.0元','2021-05-08 11:54:21'),(7,'张1的报销',3,'2021-05-08 13:31:47','900.0000','张1的报销,报销金额是900.0','2021-05-08 13:31:47'),(8,'名目4',2,'2021-05-08 13:42:20','800.0000','无\r\n','2021-05-08 13:42:20'),(9,'张1的报销',3,'2021-05-08 13:43:12','800.0000','张1的报销,报销金额是800.0','2021-05-08 13:43:12'),(10,'张2的2021-03的工资1000.0元',1,'2021-05-08 13:43:36','1000.0000','张2的2021-03的工资1000.0元','2021-05-08 13:43:36');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
