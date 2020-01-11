CREATE DATABASE  IF NOT EXISTS `cr06_laszlo_sandor` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cr06_laszlo_sandor`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cr06_laszlo_sandor
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `nameClass` varchar(45) DEFAULT NULL,
  `idClass` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idClass`),
  UNIQUE KEY `idClass_UNIQUE` (`idClass`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('1a',1),('1b',2),('1c',3),('2a',4);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `nameStudent` varchar(45) DEFAULT NULL,
  `surnameStudent` varchar(45) DEFAULT NULL,
  `emailStudent` varchar(45) DEFAULT NULL,
  `idStudent` int(11) NOT NULL AUTO_INCREMENT,
  `idClass` int(11) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE KEY `idStudent_UNIQUE` (`idStudent`),
  KEY `fk_Students_Classes_idx` (`idClass`),
  CONSTRAINT `fk_Students_Classes` FOREIGN KEY (`idClass`) REFERENCES `classes` (`idClass`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('Vinzenz','Gries','vg@gmail.com',1,1),('Laszlo','Sandro','ls@gmail.com',2,1),('Tamas','Pisky','tp@gmail.com',3,1),('Theo','Meo','tm@gmail.com',4,2),('Simon','Blay','sb@gmail.com',5,2),('Max','Dex','md@gmail.com',6,2),('Mario','Maria','mm@gmail.com',7,3),('Laura','Enio','le@gmail.com',8,3),('Dori','Mori','dm@gmail.com',9,4),('Erio','Mare','em@gmail.com',10,4);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `nameTeacher` varchar(45) DEFAULT NULL,
  `surnameTeacher` varchar(45) DEFAULT NULL,
  `emailTeacher` varchar(45) DEFAULT NULL,
  `idTeacher` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTeacher`),
  UNIQUE KEY `idTeacher_UNIQUE` (`idTeacher`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('Helios','Men','hmm@gmail.com',1),('Ella','Rio','ell@gmail.com',2),('Monica','Erei','moni@gmail.com',3),('Zet','Xoi','zex@gmail.com',4);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_has_classes`
--

DROP TABLE IF EXISTS `teachers_has_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers_has_classes` (
  `Teachers_idTeacher` int(11) NOT NULL,
  `Classes_idClass` int(11) NOT NULL,
  PRIMARY KEY (`Teachers_idTeacher`,`Classes_idClass`),
  KEY `fk_Teachers_has_Classes_Classes1_idx` (`Classes_idClass`),
  KEY `fk_Teachers_has_Classes_Teachers1_idx` (`Teachers_idTeacher`),
  CONSTRAINT `fk_Teachers_has_Classes_Classes1` FOREIGN KEY (`Classes_idClass`) REFERENCES `classes` (`idClass`),
  CONSTRAINT `fk_Teachers_has_Classes_Teachers1` FOREIGN KEY (`Teachers_idTeacher`) REFERENCES `teachers` (`idTeacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_has_classes`
--

LOCK TABLES `teachers_has_classes` WRITE;
/*!40000 ALTER TABLE `teachers_has_classes` DISABLE KEYS */;
INSERT INTO `teachers_has_classes` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `teachers_has_classes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-10 10:37:14
