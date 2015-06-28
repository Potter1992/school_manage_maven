# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.25)
# Database: school_change
# Generation Time: 2015-06-25 10:53:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table academy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `academy`;

CREATE TABLE `academy` (
  `academy_id` int(11) NOT NULL AUTO_INCREMENT,
  `academy_name` varchar(50) NOT NULL,
  PRIMARY KEY (`academy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table apply_approve
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apply_approve`;

CREATE TABLE `apply_approve` (
  `aa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_no` varchar(20) NOT NULL DEFAULT '',
  `aa_time` varchar(100) NOT NULL DEFAULT '',
  `c_id` int(11) DEFAULT NULL,
  `aa_current_step` int(11) DEFAULT '2',
  `aa_steps` int(11) DEFAULT NULL,
  PRIMARY KEY (`aa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `apply_approve` WRITE;
/*!40000 ALTER TABLE `apply_approve` DISABLE KEYS */;

INSERT INTO `apply_approve` (`aa_id`, `s_no`, `aa_time`, `c_id`, `aa_current_step`, `aa_steps`)
VALUES
	(2,'201201001003','2015/06/25 11:46:04',1,2,7),
	(3,'201201001007','2015/06/22 11:43:57',1,2,6);

/*!40000 ALTER TABLE `apply_approve` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table approve_person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `approve_person`;

CREATE TABLE `approve_person` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_account` varchar(100) NOT NULL,
  `a_img` longtext,
  `a_name` varchar(20) DEFAULT NULL,
  `a_part` varchar(30) DEFAULT NULL,
  `a_type` varchar(20) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `a_password` varchar(100) NOT NULL,
  `a_academy` varchar(100) DEFAULT '无学院',
  PRIMARY KEY (`a_id`,`a_account`),
  UNIQUE KEY `a_account` (`a_account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `approve_person` WRITE;
/*!40000 ALTER TABLE `approve_person` DISABLE KEYS */;

INSERT INTO `approve_person` (`a_id`, `a_account`, `a_img`, `a_name`, `a_part`, `a_type`, `r_id`, `a_password`, `a_academy`)
VALUES
	(1,'123','/upload/image/approve/123.png','张老师','教务处','处级',4,'123','无学院'),
	(2,'1234','/upload/image/approve/1234.png','李管理','管理','管理员',14,'123','无学院'),
	(3,'12345','/upload/image/approve/12345.png','刘磊','公寓','校级',11,'123','信息管理学院'),
	(4,'1122','/upload/image/approve/1122.png','liu','收费科','校级',8,'123','无学院'),
	(5,'5555','/upload/image/approve/5555.png','信息管理','系办公室','院级',2,'123','信息管理学院'),
	(6,'112233','/upload/image/approve/112233.png','   刘磊磊','证件','校级',10,'123','无学院');

/*!40000 ALTER TABLE `approve_person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table change_apply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `change_apply`;

CREATE TABLE `change_apply` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(10) NOT NULL DEFAULT '',
  `c_number` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

LOCK TABLES `change_apply` WRITE;
/*!40000 ALTER TABLE `change_apply` DISABLE KEYS */;

INSERT INTO `change_apply` (`c_id`, `c_name`, `c_number`)
VALUES
	(1,'退学',7),
	(2,'休学',9),
	(3,'复学',7),
	(4,'转专业',7),
	(5,'保留学籍',0),
	(6,'恢复学籍',0),
	(7,'延长年限',0),
	(8,'转学（转入）',0),
	(9,'转学（转出）',0),
	(10,'取消学籍',0),
	(11,'保留入学资格',0),
	(12,'借读（出）',0),
	(13,'借读（入）',0),
	(14,'随读',0),
	(15,'开除学籍',0),
	(16,'退学试读',0),
	(17,'降级试读',0);

/*!40000 ALTER TABLE `change_apply` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) NOT NULL,
  `r_level` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`r_id`, `r_name`, `r_level`)
VALUES
	(1,'学生本人','学生'),
	(2,'学院经办人','院级'),
	(3,'学院负责人','院级'),
	(4,'教务处负责人','处级'),
	(5,'学校领导','校级'),
	(6,'学院教材负责人','校级'),
	(7,'教材供应站（综合楼1117）','校级'),
	(8,'收费科（综合楼0110）','校级'),
	(9,'校园卡中心','校级'),
	(10,'图书馆','校级'),
	(11,'公寓管理中心','校级'),
	(12,'核算科','校级'),
	(13,'教务处学籍科','校级'),
	(14,'管理员','管理员');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_change
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_change`;

CREATE TABLE `role_change` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `rc_sort` int(11) NOT NULL,
  PRIMARY KEY (`rc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `role_change` WRITE;
/*!40000 ALTER TABLE `role_change` DISABLE KEYS */;

INSERT INTO `role_change` (`rc_id`, `r_id`, `c_id`, `rc_sort`)
VALUES
	(1,1,1,1),
	(2,2,1,2),
	(3,3,1,3),
	(4,4,1,4),
	(5,5,1,5),
	(6,8,1,6),
	(7,7,1,7),
	(8,1,2,1),
	(9,2,2,2);

/*!40000 ALTER TABLE `role_change` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_apply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_apply`;

CREATE TABLE `student_apply` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_no` varchar(20) DEFAULT NULL,
  `s_name` varchar(30) DEFAULT NULL,
  `s_password` varchar(50) DEFAULT NULL,
  `s_sex` varchar(3) DEFAULT NULL,
  `s_img` longtext,
  `c_id` int(11) DEFAULT NULL,
  `s_before_academy` varchar(100) DEFAULT NULL,
  `s_after_academy` varchar(100) DEFAULT NULL,
  `s_before_subject` varchar(100) DEFAULT NULL,
  `s_after_subject` varchar(100) DEFAULT NULL,
  `s_before_class` varchar(50) DEFAULT NULL,
  `s_after_class` varchar(50) DEFAULT NULL,
  `s_before_grade` varchar(10) DEFAULT NULL,
  `s_after_grade` varchar(10) DEFAULT NULL,
  `s_year` varchar(20) DEFAULT NULL,
  `s_before_subject_no` varchar(20) DEFAULT NULL,
  `s_after_subject_no` varchar(20) DEFAULT NULL,
  `s_before_status` varchar(4) DEFAULT NULL,
  `s_after_status` varchar(4) DEFAULT NULL,
  `s_before_education` varchar(20) DEFAULT NULL,
  `s_after_education` varchar(20) DEFAULT '无',
  `s_manager_name` varchar(20) DEFAULT NULL,
  `s_manager_time` varchar(20) DEFAULT NULL,
  `s_before_regist` varchar(4) DEFAULT NULL,
  `s_after_regist` varchar(4) DEFAULT NULL,
  `s_before_school` varchar(10) DEFAULT NULL,
  `s_after_school` varchar(10) DEFAULT NULL,
  `s_changetime` varchar(50) DEFAULT NULL,
  `r_level` varchar(10) NOT NULL DEFAULT '学生',
  `s_after_area` varchar(100) DEFAULT '德州学院',
  `s_before_area` varchar(100) DEFAULT '德州学院',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `student_apply` WRITE;
/*!40000 ALTER TABLE `student_apply` DISABLE KEYS */;

INSERT INTO `student_apply` (`s_id`, `s_no`, `s_name`, `s_password`, `s_sex`, `s_img`, `c_id`, `s_before_academy`, `s_after_academy`, `s_before_subject`, `s_after_subject`, `s_before_class`, `s_after_class`, `s_before_grade`, `s_after_grade`, `s_year`, `s_before_subject_no`, `s_after_subject_no`, `s_before_status`, `s_after_status`, `s_before_education`, `s_after_education`, `s_manager_name`, `s_manager_time`, `s_before_regist`, `s_after_regist`, `s_before_school`, `s_after_school`, `s_changetime`, `r_level`, `s_after_area`, `s_before_area`)
VALUES
	(1,'201201001003','刘磊','123','男',NULL,1,'信息管理学院','无','计算机科学与技术','无','1','未分配','1','2011','4','10011','10011','有','有','有','本科',NULL,NULL,'是','有','是','有','2015/06/25 11:46:04','学生','德州学院','德州学院'),
	(2,'201201001007','苗爽','123','男',NULL,1,'信息管理学院','信息管理学院','计算机科学与技术','计算机科学与技术','2012','未分配','2012','2014','4','10011','10011','有','有','有','本科',NULL,NULL,'是','有','是','有','2015/06/22 11:43:56','学生','德州学院','德州学院');

/*!40000 ALTER TABLE `student_apply` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) NOT NULL,
  `academy_id` int(11) NOT NULL,
  `s_year` int(11) NOT NULL,
  `s_education` varchar(8) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table xsjbxxb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xsjbxxb`;

CREATE TABLE `xsjbxxb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xh` varchar(20) NOT NULL,
  `xb` varchar(4) DEFAULT NULL,
  `xm` varchar(10) DEFAULT NULL,
  `xy` varchar(30) DEFAULT NULL,
  `xsmm` varchar(50) NOT NULL,
  `sfzx` varchar(10) DEFAULT NULL,
  `sfzc` varchar(10) DEFAULT NULL,
  `cc` varchar(10) DEFAULT NULL,
  `zydm` varchar(10) DEFAULT NULL,
  `zymc` varchar(50) DEFAULT NULL,
  `zc` varchar(10) DEFAULT NULL,
  `zx` varchar(10) DEFAULT NULL,
  `xz` varchar(10) DEFAULT NULL,
  `dqszj` varchar(10) DEFAULT NULL,
  `xzb` varchar(100) DEFAULT NULL,
  `xjzt` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `xsjbxxb` WRITE;
/*!40000 ALTER TABLE `xsjbxxb` DISABLE KEYS */;

INSERT INTO `xsjbxxb` (`id`, `xh`, `xb`, `xm`, `xy`, `xsmm`, `sfzx`, `sfzc`, `cc`, `zydm`, `zymc`, `zc`, `zx`, `xz`, `dqszj`, `xzb`, `xjzt`)
VALUES
	(1,'201201001003','男','刘磊','信息管理学院','123','是','是','有','10011','计算机科学与技术','是','是','4','1','1','有'),
	(2,'201201001004','女','凯丽','经济管理学院','123','否','否','无','','','否','否','4','','','无'),
	(3,'201201001005','男','大头','信息管理学院','123','是','是','有','','','是','是','4','','','有'),
	(4,'201201001006','女','程鹏','经济管理学院','123','否','否','无','','','否','否','4','','','无'),
	(5,'201201001007','男','苗爽','信息管理学院','123','是','是','有','10011','计算机科学与技术','是','是','4','2012','2012','有'),
	(6,'201201001008','女','小玉','经济管理学院','123','否','否','无','','','否','否','4','','','无'),
	(7,'201201001009','男','小儿','信息管理学院','123','是','是','有','','','是','是','4','','','有'),
	(8,'201201001010','女','王霞','经济管理学院','123','否','否','无','','','否','否','4','','','无'),
	(9,'201201001011','男','哧哧','信息管理学院','123','是','是','有','','','是','是','4','','','有');

/*!40000 ALTER TABLE `xsjbxxb` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table xydmb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `xydmb`;

CREATE TABLE `xydmb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xydm` varchar(20) NOT NULL,
  `xymc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `xydmb` WRITE;
/*!40000 ALTER TABLE `xydmb` DISABLE KEYS */;

INSERT INTO `xydmb` (`id`, `xydm`, `xymc`)
VALUES
	(1,'1001','信息管理学院'),
	(2,'2001','经济管理学院');

/*!40000 ALTER TABLE `xydmb` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table zydmb
# ------------------------------------------------------------

DROP TABLE IF EXISTS `zydmb`;

CREATE TABLE `zydmb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zydm` varchar(10) NOT NULL,
  `zymc` varchar(100) NOT NULL,
  `ssxydm` varchar(10) NOT NULL,
  `cc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `zydmb` WRITE;
/*!40000 ALTER TABLE `zydmb` DISABLE KEYS */;

INSERT INTO `zydmb` (`id`, `zydm`, `zymc`, `ssxydm`, `cc`)
VALUES
	(1,'10011','计算机科学与技术','1001','本科'),
	(2,'20011','管理学','2001','专科');

/*!40000 ALTER TABLE `zydmb` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
