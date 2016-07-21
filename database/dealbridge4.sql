-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 10.22.96.25    Database: deal_bridge
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `user_id_fk2_idx` (`user_id`),
  KEY `bank_name_fk2` (`bank_name`),
  CONSTRAINT `bank_name_fk2` FOREIGN KEY (`bank_name`) REFERENCES `bank` (`bank_name`),
  CONSTRAINT `user_id_fk2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `bank_name` varchar(20) NOT NULL,
  PRIMARY KEY (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discount` (
  `discount_id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(20) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `begin_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `discount_usage` text,
  `discount_detail` text,
  `type` varchar(30) DEFAULT NULL,
  `characteristic` varchar(30) DEFAULT NULL,
  `img` varchar(80) DEFAULT NULL,
  `merchant_description` varchar(255) DEFAULT NULL,
  `merchant_location` varchar(50) DEFAULT NULL,
  `merchant_tel` varchar(20) DEFAULT NULL,
  `end_of_url` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `end_of_url_UNIQUE` (`end_of_url`),
  KEY `bank_name_fk7_idx` (`bank_name`),
  CONSTRAINT `bank_name_fk7` FOREIGN KEY (`bank_name`) REFERENCES `bank` (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `favorite_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `discount_id` int(10) NOT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `user_id_fk5_idx` (`user_id`),
  KEY `discount_id_fk5_idx` (`discount_id`),
  CONSTRAINT `discount_id_fk5` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`),
  CONSTRAINT `user_id_fk5` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend` (
  `recommend_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `discount_id` int(10) NOT NULL,
  PRIMARY KEY (`recommend_id`),
  KEY `user_id_fk4_idx` (`user_id`),
  KEY `discount_id_fk6_idx` (`discount_id`),
  CONSTRAINT `discount_id_fk6` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`),
  CONSTRAINT `user_id_fk6` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_history` (
  `search_history_id` int(10) NOT NULL,
  `keyword` varchar(20) CHARACTER SET latin1 NOT NULL,
  `search_time` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`search_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share` (
  `share_id` int(10) NOT NULL AUTO_INCREMENT,
  `share_time` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `discount_id` int(10) NOT NULL,
  PRIMARY KEY (`share_id`),
  KEY `user_id_fk4_idx` (`user_id`),
  KEY `discount_id_fk4_idx` (`discount_id`),
  CONSTRAINT `discount_id_fk4` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`),
  CONSTRAINT `user_id_fk4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  `amount` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `bank_name_fk3` (`bank_name`),
  KEY `user_id_fk3` (`user_id`),
  CONSTRAINT `bank_name_fk3` FOREIGN KEY (`bank_name`) REFERENCES `bank` (`bank_name`),
  CONSTRAINT `user_id_fk3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `gps_district` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `gender` int(1) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 10:32:58
