-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: diana-moldabergenova
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `category`) VALUES (1,'HDD'),(2,'Monitors'),(3,'Motherboards'),(4,'DDR');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counteragents`
--

DROP TABLE IF EXISTS `counteragents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counteragents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `counteragent` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counteragents`
--

LOCK TABLES `counteragents` WRITE;
/*!40000 ALTER TABLE `counteragents` DISABLE KEYS */;
INSERT INTO `counteragents` (`id`, `counteragent`) VALUES (1,'people-1'),(2,'people-2');
/*!40000 ALTER TABLE `counteragents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` varchar(45) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `product`, `category_id`) VALUES (1,'S1 HDD 1T, 7200 rpm',1),(2,'S2 HDD 500Gb, 7200 rpm',1),(3,'Monitor B19',2),(4,'Monitor B22',2),(5,'DDR3 SST 2Gb',4),(6,'DDR3 SST 4Gb',4),(7,'MB-1',3),(8,'MB-2',3),(9,'MB-3',3),(10,'S5 HDD 500Gb, 7200rpm',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_balance`
--

DROP TABLE IF EXISTS `stock_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `from_stock` int DEFAULT NULL,
  `to_stock` int DEFAULT NULL,
  `from_counteragent` int DEFAULT NULL,
  `to_counteragent` int DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `from_stock` (`from_stock`),
  KEY `to_stock` (`to_stock`),
  KEY `from_counteragent` (`from_counteragent`),
  KEY `to_counteragent` (`to_counteragent`),
  CONSTRAINT `stock_balance_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `stock_balance_ibfk_2` FOREIGN KEY (`from_stock`) REFERENCES `stores` (`id`),
  CONSTRAINT `stock_balance_ibfk_3` FOREIGN KEY (`to_stock`) REFERENCES `stores` (`id`),
  CONSTRAINT `stock_balance_ibfk_4` FOREIGN KEY (`from_counteragent`) REFERENCES `counteragents` (`id`),
  CONSTRAINT `stock_balance_ibfk_5` FOREIGN KEY (`to_counteragent`) REFERENCES `counteragents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_balance`
--

LOCK TABLES `stock_balance` WRITE;
/*!40000 ALTER TABLE `stock_balance` DISABLE KEYS */;
INSERT INTO `stock_balance` (`id`, `product_id`, `from_stock`, `to_stock`, `from_counteragent`, `to_counteragent`, `quantity`, `date`) VALUES (1,1,1,2,NULL,NULL,4,'2015-07-25'),(2,3,NULL,1,NULL,2,5,'2016-02-06'),(3,2,2,NULL,1,NULL,2,'2016-09-14'),(4,4,2,1,NULL,NULL,10,'2016-11-10'),(5,5,1,NULL,1,NULL,1,'2017-01-11'),(6,6,2,1,NULL,NULL,5,'2015-07-25'),(7,7,NULL,2,NULL,1,6,'2015-07-25'),(8,8,2,NULL,1,NULL,9,'2016-07-06'),(9,9,1,NULL,2,NULL,3,'2017-03-05'),(10,10,2,1,NULL,NULL,7,'2016-07-18');
/*!40000 ALTER TABLE `stock_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` (`id`, `store`) VALUES (1,'store-1'),(2,'store-2');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-26 14:17:39
