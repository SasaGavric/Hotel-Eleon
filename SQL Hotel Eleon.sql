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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `billNumber` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) NOT NULL,
  `orderDate` date NOT NULL,
  `supplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`billNumber`),
  KEY `supplierId` (`supplierId`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bookingID` int(11) NOT NULL AUTO_INCREMENT,
  `bookingDate` date NOT NULL,
  `checkInDate` date NOT NULL,
  `checkOutDate` date NOT NULL,
  `customerId` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `customer_idx` (`customerId`),
  KEY `roomId_idx` (`roomId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roomId` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `citzenShip` varchar(35) DEFAULT NULL,
  `city` varchar(35) DEFAULT NULL,
  `adress` varchar(75) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `bankAccNumber` varchar(25) NOT NULL,
  `adress` varchar(75) NOT NULL,
  `city` varchar(30) NOT NULL,
  `citzenShip` varchar(30) NOT NULL,
  `numOfVacationDays` int(11) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`employeeId`),
  KEY `departmentId` (`departmentId`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `hoteldepartment` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hoteldepartment`
--

DROP TABLE IF EXISTS `hoteldepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoteldepartment` (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(25) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordereditem`
--

DROP TABLE IF EXISTS `ordereditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordereditem` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `iName` varchar(30) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `billId` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `billId` (`billId`),
  CONSTRAINT `ordereditem_ibfk_1` FOREIGN KEY (`billId`) REFERENCES `bill` (`billNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `cardNumber` varchar(16) NOT NULL,
  `expireDate` int(2) NOT NULL,
  `bookingId` int(11) NOT NULL,
  PRIMARY KEY (`paymentId`),
  UNIQUE KEY `bookingId` (`bookingId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`bookingID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `roomId` int(11) NOT NULL AUTO_INCREMENT,
  `isBooked` tinyint(1) NOT NULL DEFAULT '0',
  `typeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`roomId`),
  KEY `typeId_idx` (`typeId`),
  CONSTRAINT `type` FOREIGN KEY (`typeId`) REFERENCES `roomtype` (`roomTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roomimages`
--

DROP TABLE IF EXISTS `roomimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomimages` (
  `imageId` int(11) NOT NULL AUTO_INCREMENT,
  `imageLink` varchar(100) NOT NULL,
  `roomType` int(11) NOT NULL,
  PRIMARY KEY (`imageId`),
  KEY `roomType_idx` (`roomType`),
  CONSTRAINT `roomType` FOREIGN KEY (`roomType`) REFERENCES `roomtype` (`roomTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomtype` (
  `roomTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `roomTypeName` varchar(45) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`roomTypeId`),
  UNIQUE KEY `roomTypeName_UNIQUE` (`roomTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicedby`
--

DROP TABLE IF EXISTS `servicedby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicedby` (
  `roomId` int(11) NOT NULL,
  `departmentId` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`roomId`,`departmentId`),
  KEY `departmentId` (`departmentId`),
  CONSTRAINT `servicedby_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`),
  CONSTRAINT `servicedby_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `hoteldepartment` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(25) NOT NULL,
  `adress` varchar(75) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `bankAccNumber` varchar(25) NOT NULL,
  `departmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`supplierId`),
  KEY `departmentId` (`departmentId`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `hoteldepartment` (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-04 21:58:36
