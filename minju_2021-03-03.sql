# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.23)
# Database: minju
# Generation Time: 2021-03-03 09:35:20 +0000
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
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `userpw` varchar(255) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `grade` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `content` text,
  `writer` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `orifile` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `savefile` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `readnum` int unsigned DEFAULT '0',
  `uid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `auth` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table board_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `board_ip`;

CREATE TABLE `board_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  CONSTRAINT `board_ip_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `board` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(255) CHARACTER SET utf8mb4  NOT NULL DEFAULT '' COMMENT '책제목',
  `writer` varchar(255) CHARACTER SET utf8mb4  DEFAULT '' COMMENT '저자',
  `wdate` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '순번',
  `name` varchar(255) CHARACTER SET utf8mb4  NOT NULL DEFAULT '' COMMENT '도시명',
  `country` varchar(255) CHARACTER SET utf8mb4  DEFAULT '' COMMENT '국가명',
  `summary` text CHARACTER SET utf8mb4  COMMENT '도시설명',
  `lat` float DEFAULT NULL COMMENT '위도',
  `lon` float DEFAULT NULL COMMENT '경도',
  `population` int DEFAULT NULL COMMENT '인구수',
  `sdate` datetime DEFAULT NULL COMMENT '도시설립일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table gallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gallery`;

CREATE TABLE `gallery` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `content` text,
  `writer` varchar(255) CHARACTER SET utf8mb4  DEFAULT '',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `readnum` int unsigned NOT NULL DEFAULT '0',
  `uid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `auth` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table gallery_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gallery_file`;

CREATE TABLE `gallery_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orifile` varchar(255) NOT NULL,
  `savefile` varchar(255) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fid` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`),
  CONSTRAINT `gallery_file_ibfk_1` FOREIGN KEY (`fid`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table gallery_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gallery_ip`;

CREATE TABLE `gallery_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8mb4  NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  CONSTRAINT `gallery_ip_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `gallery` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
