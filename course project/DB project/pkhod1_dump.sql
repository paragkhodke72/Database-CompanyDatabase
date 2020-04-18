CREATE DATABASE  IF NOT EXISTS `pkhod1_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `pkhod1_project`;
-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: pkhod1_project
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'parag','main street','06123','DC'),(2,'kanchan','100 times square st','06665','NYC'),(3,'ajinkya','boston-pt -st','06432','MA'),(4,'rugved','riverside road','06060','LA'),(5,'nitin','175 forest road ','06460','CT'),(6,'abhya','175 forest road','06460','CT'),(7,'saurabh','riverside road','06060','LA'),(8,'rahul','100 times square st','06665','NYC'),(9,'priyanka','main street','06123','DC'),(10,'vraj','riverside road','06060','LA'),(11,'payal','100 times square st','06665','NYC'),(12,'nana','150 main street','06389','Florida');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `item_type` varchar(45) DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `f_idx` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (0,'pen','writing','10'),(111,'pencils','writing','11'),(222,'markers','writing','13'),(333,'copy_papers','paper','12'),(444,'pads','paper','15'),(555,'envelopes','paper','6'),(666,'labels','basic','17'),(777,'staplers','basic','19'),(888,'paper_clips','basic','11'),(999,'rubber_bands','basic','17'),(1000,'suiccors','basic','19');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderline` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `a_idx` (`item_id`),
  CONSTRAINT `a` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `b` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
INSERT INTO `orderline` VALUES (11,0,'101'),(11,444,'44'),(11,555,'33'),(22,0,'99'),(33,0,'200'),(33,555,'25'),(33,666,'27'),(44,333,'45'),(44,555,'28'),(44,666,'18'),(55,777,'23'),(55,888,'32'),(66,222,'100'),(66,777,'22'),(66,888,'12'),(77,111,'12'),(77,222,'44'),(77,444,'3'),(77,999,'22'),(77,1000,'3'),(88,333,'5'),(99,333,'45'),(100,0,'120'),(100,555,'345'),(100,666,'55'),(100,1000,'678'),(1011,0,'111'),(1011,555,'90'),(1011,666,'900'),(1011,1000,'500'),(1012,333,'45');
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `s_idx` (`customer_id`),
  CONSTRAINT `s` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (11,'12-may 2017',1),(22,'23 march-2019',2),(33,'11-feb-2019',3),(44,'31 dec-2018',4),(55,'10-jun-2010',5),(66,'1- jan-2017',6),(77,'11 -aug-2019',7),(88,'30-jun-2016',8),(99,'19-sept-2015',9),(100,'19-sept-2014',10),(1011,'1-feb-2014',11),(1012,'3-july-2018',12);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-28 22:11:50
