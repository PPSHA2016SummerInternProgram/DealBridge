-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 10.22.96.25    Database: deal_bridge
-- ------------------------------------------------------
-- Server version	5.6.30-0ubuntu0.14.04.1



CREATE TABLE `account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



CREATE TABLE `bank` (
  `bank_name` varchar(20) NOT NULL,
  PRIMARY KEY (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `classify` varchar(30) DEFAULT NULL,
  `characteristic` varchar(30) DEFAULT NULL,
  `img` varchar(80) DEFAULT NULL,
  `merchant_description` varchar(255) DEFAULT NULL,
  `merchant_location` varchar(50) DEFAULT NULL,
  `merchant_tel` varchar(20) DEFAULT NULL,
  `end_of_url` varchar(40) DEFAULT NULL,
  `clickrate` int(10) DEFAULT NULL,
  PRIMARY KEY (`discount_id`),
  UNIQUE KEY `end_of_url_UNIQUE` (`end_of_url`)
) ENGINE=InnoDB AUTO_INCREMENT=16266 DEFAULT CHARSET=utf8;



CREATE TABLE `favorite` (
  `favorite_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `discount_id` int(10) NOT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


CREATE TABLE `recommend` (
  `recommend_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `discount_id` int(10) NOT NULL,
  PRIMARY KEY (`recommend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;



CREATE TABLE `search_history` (
  `search_history_id` int(10) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) NOT NULL,
  `search_time` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`search_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `share` (
  `share_id` int(10) NOT NULL AUTO_INCREMENT,
  `share_time` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  `discount_id` int(10) NOT NULL,
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `transaction` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  `amount` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `transaction_time` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `gps_district` varchar(45) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- Dump completed on 2016-07-25 13:59:53
