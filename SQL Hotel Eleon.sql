-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hoteleleon
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
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hoteldepartment`
--

LOCK TABLES `hoteldepartment` WRITE;
/*!40000 ALTER TABLE `hoteldepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoteldepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordereditem`
--

LOCK TABLES `ordereditem` WRITE;
/*!40000 ALTER TABLE `ordereditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordereditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,0,1),(2,0,1),(3,0,1),(4,0,2),(5,0,2),(6,0,2),(7,0,3),(8,0,3),(9,0,3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roomimages`
--

LOCK TABLES `roomimages` WRITE;
/*!40000 ALTER TABLE `roomimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `roomimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Classic',70.00),(2,'Silver',150.00),(3,'Gold',350.00);
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicedby`
--

LOCK TABLES `servicedby` WRITE;
/*!40000 ALTER TABLE `servicedby` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicedby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-22  1:26:41
