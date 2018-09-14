-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 62.80.166.79    Database: dbdiploma
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `customuser`
--

DROP TABLE IF EXISTS `customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currencyCode` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customuser`
--

LOCK TABLES `customuser` WRITE;
/*!40000 ALTER TABLE `customuser` DISABLE KEYS */;
INSERT INTO `customuser` VALUES (1,'USD','admin@i.ua','admin','fcb709c1d957fe00a5bf6a6e82b86ebf3eed693c','+38 (093) 353 28 16','ADMIN'),
(2,'UAH','user@i.ua','user','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8','+38 (039) 535 82 61','USER');
/*!40000 ALTER TABLE `customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventsheduler`
--

DROP TABLE IF EXISTS `eventsheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventsheduler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `event` varchar(255) NOT NULL,
  `idOfIncomeOrExpense` bigint(20) DEFAULT NULL,
  `time` time NOT NULL,
  `customUser_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5f80ijytnck04ls6uip32igwi` (`customUser_id`),
  CONSTRAINT `FK_5f80ijytnck04ls6uip32igwi` FOREIGN KEY (`customUser_id`) REFERENCES `customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventsheduler`
--

LOCK TABLES `eventsheduler` WRITE;
/*!40000 ALTER TABLE `eventsheduler` DISABLE KEYS */;
INSERT INTO `eventsheduler` VALUES (1,300,'Income',ADDDATE(CURDATE(),-23),'Additional work!',6,'19:00:00',2),
(2,NULL,'Nothing',ADDDATE(CURDATE(),-36),'Meeting with girlfriend!',NULL,'16:00:00',2),
(3,200,'Expense',ADDDATE(CURDATE(),-39),'Go to the cinema...',6,'20:00:00',2),
(4,2500,'Income',ADDDATE(CURDATE(),-31),'My salary!',7,'13:30:00',2),
(5,1000,'Expense',ADDDATE(CURDATE(),-31),'Credit!',7,'17:00:00',2),
(6,500,'Expense',ADDDATE(CURDATE(),-33),'Friend Birthday!',8,'18:00:00',2),
(8,NULL,'Nothing',ADDDATE(CURDATE(),-35),' Sent email for my BOSS..',NULL,'12:00:00',2),
(9,NULL,'Nothing',ADDDATE(CURDATE(),-33),'Write month report=(',NULL,'16:48:00',2),
(10,NULL,'Expense',ADDDATE(CURDATE(),-31),'Buy some products...',NULL,'14:00:00',2),
(11,1500,'Income',ADDDATE(CURDATE(),10),'My salary!',8,'11:21:00',2),
(12,2500,'Income',ADDDATE(CURDATE(),16),'My salary!',9,'11:22:00',2),
(13,500,'Expense',CURDATE(),'Rent',9,'11:22:00',2),
(14,1000,'Expense',ADDDATE(CURDATE(),16),'Credit',10,'11:23:00',2),
(15,NULL,'Nothing',CURDATE(),'Meeting with friends',NULL,'16:00:00',2),
(16,NULL,'Nothing',ADDDATE(CURDATE(),1),'Meeting with MOM!',NULL,'11:24:00',2),
(17,500,'Expense',ADDDATE(CURDATE(),5),'Bought new things!',11,'10:22:00',2),
(18,NULL,'Nothing',ADDDATE(CURDATE(),10),'Business meeting!',NULL,'16:00:00',2),
(19,NULL,'Expense',ADDDATE(CURDATE(),11),'Lunch with a friend!',NULL,'16:00:00',2),
(20,NULL,'Expense',ADDDATE(CURDATE(),11),'Hike to the supermarket',NULL,'19:00:00',2),
(21,500,'Income',ADDDATE(CURDATE(),15),'Additional income!',10,'13:00:00',2),
(22,NULL,'Nothing',ADDDATE(CURDATE(),31),'555',NULL,'14:07:00',2),
(23,NULL,'Nothing',ADDDATE(CURDATE(),31),'4511515',NULL,'14:08:00',2);
/*!40000 ALTER TABLE `eventsheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchangerate`
--

DROP TABLE IF EXISTS `exchangerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchangerate` (
  `codeCurrency` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`codeCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchangerate`
--

LOCK TABLES `exchangerate` WRITE;
/*!40000 ALTER TABLE `exchangerate` DISABLE KEYS */;
INSERT INTO `exchangerate` VALUES ('AUD',CURDATE(),'Australian Dollar',20.6171),
('BGN',CURDATE(),'Bulgarian Lion',15.9473),
('BYR',CURDATE(),'Belarusian Rubles',0.0013),
('CAD',CURDATE(),'Canadian Dollar',20.955),
('CHF',CURDATE(),'Swiss Frank',26.903),
('CNY',CURDATE(),'Chinese Yuan',4.0686),
('CZK',CURDATE(),'Czech Crowns',1.2224),
('EUR',CURDATE(),'Euro',31.3708),
('GBP',CURDATE(),'Pound Sterling of the United Kingdom',35.7611),
('JPY',CURDATE(),'Japanese Yen',0.2361),
('PLN',CURDATE(),'Polish Zloty',7.3805),
('RUB',CURDATE(),'Russian Ruble',0.4606),
('SEK',CURDATE(),'Swedish Kronor',3.2018),
('UAH',CURDATE(),'Ukrainian Hryvnia',1),
('USD',CURDATE(),'U.S. Dollar',26.86);
/*!40000 ALTER TABLE `exchangerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) NOT NULL,
  `category` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `currencyCode` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `customUser_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rxy5ociexxfm6dinrdhk0f2ei` (`customUser_id`),
  CONSTRAINT `FK_rxy5ociexxfm6dinrdhk0f2ei` FOREIGN KEY (`customUser_id`) REFERENCES `customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,500,'Rent','','UAH',ADDDATE(CURDATE(),-8),2),
(2,1000,'Credit','','UAH',ADDDATE(CURDATE(),-13),2),
(3,500,'Rent','','UAH',ADDDATE(CURDATE(),-10),2),
(4,300,'Food','For my Birthday!','UAH',ADDDATE(CURDATE(),-35),2),
(5,100,'Beverage','For my Birthday!','UAH',ADDDATE(CURDATE(),-31),2),
(6,200,'Sheduler','Go to the cinema...','UAH',ADDDATE(CURDATE(),-25),2),
(7,1000,'Sheduler','Credit!','UAH',ADDDATE(CURDATE(),-15),2),
(8,500,'Sheduler','Friend Birthday!','UAH',ADDDATE(CURDATE(),-10),2),
(9,500,'Sheduler','Rent','UAH',CURDATE(),2),
(10,1000,'Sheduler','Credit','UAH',ADDDATE(CURDATE(),20),2),
(11,500,'Sheduler','Bought new things!','UAH',ADDDATE(CURDATE(),5),2);
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) NOT NULL,
  `category` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `currencyCode` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `customUser_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3l60d89w4varbs7rdecvyiyb` (`customUser_id`),
  CONSTRAINT `FK_3l60d89w4varbs7rdecvyiyb` FOREIGN KEY (`customUser_id`) REFERENCES `customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,2500,'Salary','','UAH',ADDDATE(CURDATE(),-31),2),
(2,1500,'Salary','','UAH',ADDDATE(CURDATE(),-30),2),
(3,1000,'Gifts','My birthday!','UAH',ADDDATE(CURDATE(),-25),2),
(4,1500,'Salary','','UAH',ADDDATE(CURDATE(),-15),2),
(5,500,'Selling things','Sold my old phone...','UAH',CURDATE(),2),
(6,300,'Sheduler','Additional work!','UAH',CURDATE(),2),
(7,2500,'Sheduler','My salary!','UAH',ADDDATE(CURDATE(),30),2),
(8,1500,'Sheduler','My salary!','UAH',ADDDATE(CURDATE(),30),2),
(9,2500,'Sheduler','My salary!','UAH',ADDDATE(CURDATE(),40),2),
(10,500,'Sheduler','Additional income!','UAH',ADDDATE(CURDATE(),10),2);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-11 12:50:01
