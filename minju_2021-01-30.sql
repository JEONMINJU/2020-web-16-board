# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.23)
# Database: minju
# Generation Time: 2021-01-30 03:48:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth`;

CREATE TABLE `auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `grade` tinyint(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `content` text,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `orifile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `savefile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `readnum` int(10) unsigned zerofill DEFAULT NULL,
  `uid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;

INSERT INTO `board` (`id`, `title`, `content`, `writer`, `created`, `orifile`, `savefile`, `readnum`, `uid`)
VALUES
	(2,'홍길동','d','ddd','2021-01-28 00:00:00','','',NULL,NULL),
	(3,'콩쥐팥쥐전','<p>d</p>','혼나는 콘쥐',NULL,'','',NULL,NULL),
	(4,'제목없음','<p>www</p>','와ㅏㅏㅏ',NULL,'','',NULL,NULL),
	(5,'제목','<p>되나</p>','작성자',NULL,'','',NULL,NULL),
	(6,'ㅇㅇ','<p>ㅎㅎ</p>','deep',NULL,'13.jpg','210128_20-fdd861a1-a4c2-49a7-9e41-6066231c21a8.jpg',NULL,NULL),
	(7,'salam bombay','','혼나는 콘쥐',NULL,'jmju.JPG','210129_15-6f78a937-008f-4e59-b17f-4afaaad0068b.JPG',NULL,NULL),
	(8,'오늘의 할일','<p>복습복습</p>','전민주',NULL,'3472393764080311340_20190118143429882.JPG','210129_18-f2ff3e09-e7d5-4566-88b9-620e9abeefab.JPG',NULL,NULL),
	(9,'JMJ','<p>두 사람이 마주보며 손을 잡은 모습을 추상적인 형태로 나타내었으며,</p>\r\n<p>hand in hand 라는 \'손에 손 잡고\' 의 의미를 가지고 있습니다.&nbsp;</p>','jeonminju',NULL,'jmju.JPG','210130_01-bfc6d314-8cde-4047-b18e-d2fe6cd13c0b.JPG',NULL,NULL);

/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '책제목',
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '저자',
  `wdate` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `books` (`id`, `name`, `writer`, `wdate`)
VALUES
	(1,'마음챙김','샤우나 샤피로','2021-01-01 00:00:00'),
	(2,'미국주식으로 은퇴하기','최철','2020-12-12 00:00:00'),
	(3,'새로운 미래가 온다','다니엘 핑크','2021-04-09 00:00:00'),
	(4,'트렌드코리아 2021','김난도','2021-01-23 00:00:00'),
	(8,'공정하다는 착각','마이클 샌델',NULL),
	(9,'주린이가 가장 알고 싶은 최다질문 TOP 77 ','염승환',NULL),
	(11,'아몬드','손원평',NULL),
	(13,'ㄹㄹ','','2021-01-26 02:23:23'),
	(14,'마음챙김','샤우나 샤피로','2021-01-26 02:26:49');

/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '순번',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '도시명',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '국가명',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '도시설명',
  `lat` float DEFAULT NULL COMMENT '위도',
  `lon` float DEFAULT NULL COMMENT '경도',
  `population` int DEFAULT NULL COMMENT '인구수',
  `sdate` datetime DEFAULT NULL COMMENT '도시설립일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `name`, `country`, `summary`, `lat`, `lon`, `population`, `sdate`)
VALUES
	(1,'Seoul','Korea','안녕하세요.',38.5,127.5,40000000,'1000-01-01 00:00:00'),
	(2,'Seoul','Korea','한국의 제3의 도시-수도권에 위치하고 있다.',38.5,127.5,40000000,'1000-01-01 00:00:00'),
	(9,'Incheon','Korea','하늘 도시입니다.',37.8,128.9,111111300,'2222-04-09 00:00:00'),
	(11,'Incheon','Korea','도시입니다..',37.8,121.9,50000000,'2222-04-09 00:00:00'),
	(13,'서울!!!!!','','설명입니다.',0.02,0.02,4000000,NULL);

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
