CREATE DATABASE  IF NOT EXISTS `ebook-web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ebook-web`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ebook-web
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `book_dtls`
--

DROP TABLE IF EXISTS `book_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_dtls` (
  `bookId` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_dtls`
--

LOCK TABLES `book_dtls` WRITE;
/*!40000 ALTER TABLE `book_dtls` DISABLE KEYS */;
INSERT INTO `book_dtls` VALUES (1,'hhh ','kkkk ',4,'New','Active','th.jpg','admin'),(2,'Linux','Author linux',100,'New','Active','th (1).jpg','admin'),(3,'Linux','Author linux',4.02,'New','Inactive','th (2).jpg','admin'),(4,'xxxx','kkkk',4.02,'Old','Active','th (3).jpg','admin'),(5,'hhh2','Author linux',4,'Old','Active','th (4).jpg','admin'),(6,'hhh1','Author',4,'New','Active','th (4).jpg','admin'),(7,'Ssc Constable Gd 2','kkkk',4.02,'Old','Active','th (5).jpg','19130075@st.hcmuaf.edu.vn'),(8,'Ssc Constable Gd 3','Rakesh Tiwary 3',345,'New','Active','cute.jpg','admin'),(9,'Ssc Constable Gd 2','Author linux',4.02,'New','Active','sachsuckhoe.jpg','admin'),(16,'COMBO TO THE Dawn + SHORT LAMPS','SHORT LAMPS',345,'Literature','Active','cat-2.png','admin'),(17,'Firefly Forest','Forest',12,'Foreign language books','Active','cat-1.png','admin'),(20,'SUPERMARKET CASE','CASE',43,'Life skills book','Active','banner-2.png','admin'),(21,'STORY OF MY VILLAGE','VILLAGE',87,'Book of art - architecture','Active','banner-1.png','admin'),(22,'NGUYEN THU PHOTOS','PHOTOS',43,'Medicine & sport books','Active','banner-3.png','admin'),(24,'SUPERMARKET CASE','CASE',23,'Life skills book','Active','cat-1.png','admin'),(26,'Ssc Constable Gf','Author linux',43,'Old','Active','about-img.jpg','daudiep2003@gmail.com'),(28,'Ssc Constable Gd 2','Author linux',4.02,'Foreign language books','Active','cat-2.png','admin'),(29,'Ssc Constable Gd 2','kkkk',4.02,'Foreign language books','Active','cat-3.png','admin'),(30,'hhh2','CASE',4.02,'Foreign language books','Active','cat-4.png','admin'),(31,'xxxx','Author linux',43,'Foreign language books','Active','cat-5.png','admin');
/*!40000 ALTER TABLE `book_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_order`
--

DROP TABLE IF EXISTS `book_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_order`
--

LOCK TABLES `book_order` WRITE;
/*!40000 ALTER TABLE `book_order` DISABLE KEYS */;
INSERT INTO `book_order` VALUES (25,'A2693VFsBA','daudiep200755555555','daudiep2003@gmail.com','Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09, Mihail Landmark, Mihail City, Mihail State, Mihail Pin Code','122345555555555',690,'COD'),(26,'Nxrp9bjBXY','daudiep200755555555','daudiep2003@gmail.com','Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09, Mihail 2, Mihail 2, Mihail 2, Mihail 2','122345555555555',545,'COD');
/*!40000 ALTER TABLE `book_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (52,1,19,'hhh ','th.jpg','kkkk ',2,4,8),(53,2,19,'Linux','th (1).jpg','Author linux',2,100,200),(54,17,19,'Firefly Forest','cat-1.png','Forest',3,12,36);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentproduct`
--

DROP TABLE IF EXISTS `commentproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentproduct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentproduct`
--

LOCK TABLES `commentproduct` WRITE;
/*!40000 ALTER TABLE `commentproduct` DISABLE KEYS */;
INSERT INTO `commentproduct` VALUES (1,4,15,'daudiep2003','daudiep@gmail.com','2023-03-16 08:51:27','uuuuuuuu'),(2,4,19,'daudiep200755555555','daudiep2003@gmail.com','2023-03-16 08:52:00','rrrrrrrrrr'),(3,4,19,'daudiep200755555555','daudiep2003@gmail.com','2023-03-20 23:08:48','hhh');
/*!40000 ALTER TABLE `commentproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `idContact` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idContact`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Dau Hoa','19130075@st.hcmuaf.edu.vn',4,'Content','Good, attractive content, eye-catching, unique interface, vivid realistic images'),(2,'daudiep2003','daudiep2003@gmail.com',1223465768,'Content','Good, attractive content, eye-catching, unique interface, vivid realistic images'),(3,'daudiep2003','daudiep2003@gmail.com',1223465768,'Content','Content\r\nGood, attractive content, eye-catching, unique interface, vivid realistic images');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite`
--

LOCK TABLES `favourite` WRITE;
/*!40000 ALTER TABLE `favourite` DISABLE KEYS */;
INSERT INTO `favourite` VALUES (3,19,6,'hhh1','Author',4,'New','Active','th (4).jpg'),(4,16,5,'hhh2','Author linux',4,'Old','Active','th (4).jpg'),(6,16,1,'hhh ','kkkk ',4,'New','Active','th.jpg');
/*!40000 ALTER TABLE `favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (3,'A2693VFsBA',48,16,19,'COMBO TO THE Dawn + SHORT LAMPS','cat-2.png','SHORT LAMPS',2,345,690),(4,'Nxrp9bjBXY',49,2,19,'Linux','th (1).jpg','Author linux',2,100,200),(5,'Nxrp9bjBXY',50,8,19,'Ssc Constable Gd 3','cute.jpg','Rakesh Tiwary 3',1,345,345);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `landmark` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (15,'daudiep2003','daudiep@gmail.com','12345','$2a$05$aCXnviY0eHO0PT/Ff4jpZeoHkmq269gRaqJI84MQiyi85WIo1JtbC','Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09','Mihail ','Mihail ','Mihail ','Mihail '),(16,'ThanhNhi','19130075@st.hcmuaf.edu.vn','1233435346456','$2a$05$yXUbNN9NoDi/PSZQrQ9eleQGwddhAWygOO48nHPdeWOCU9.ZAmt7O','Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09','Mihail ','Mihail ','Mihail ','Mihail '),(19,'daudiep200755555555','daudiep2003@gmail.com','122345555555555','$2a$05$DRn4VPW7cLf5hDiJvSD17OIweK3DBscbfQm7l43UEGPHYUR8I914.','Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09','Mihail ','Mihail ','Mihail ','Mihail '),(20,NULL,NULL,NULL,NULL,'Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09','Mihail ','Mihail ','Mihail ','Mihail ');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ebook-web'
--

--
-- Dumping routines for database 'ebook-web'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06 16:53:38
