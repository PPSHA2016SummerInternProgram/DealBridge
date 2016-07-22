-- SQL schema for DealBridge

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


CREATE TABLE `search_history` (
  `search_history_id` int(10) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) CHARACTER SET latin1 NOT NULL,
  `search_time` datetime NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`search_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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


CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `gps_district` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `gender` int(1) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
