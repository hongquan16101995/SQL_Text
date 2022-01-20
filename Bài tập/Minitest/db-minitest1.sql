-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: minitest
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
-- Table structure for table `diemdulich`
--

DROP TABLE IF EXISTS `diemdulich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diemdulich` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tendiemden` varchar(50) NOT NULL,
  `mota` longtext,
  `giatrungbinh` double DEFAULT NULL,
  `thanhpho_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thanhpho_id` (`thanhpho_id`),
  CONSTRAINT `diemdulich_ibfk_1` FOREIGN KEY (`thanhpho_id`) REFERENCES `thanhpho` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diemdulich`
--

LOCK TABLES `diemdulich` WRITE;
/*!40000 ALTER TABLE `diemdulich` DISABLE KEYS */;
INSERT INTO `diemdulich` VALUES (1,'Nha Trang',NULL,50000,1),(2,'Sapa',NULL,30000,2),(3,'Ba Vì',NULL,20000,3),(4,'Hội An',NULL,40000,4),(5,'Tràng An',NULL,20000,5),(6,'Bái Đính',NULL,22222,5);
/*!40000 ALTER TABLE `diemdulich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `khachhang_id` int(11) NOT NULL,
  `trangthai` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tour_id` (`tour_id`),
  KEY `khachhang_id` (`khachhang_id`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`khachhang_id`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,1,1,'Đang đi'),(2,1,2,'Đang đi'),(3,2,3,'Đang đi'),(4,3,4,'Đã xong'),(5,4,1,'Đang đi'),(6,3,3,'Đã xong'),(7,5,6,'Đang đi'),(8,8,7,'Chuẩn bị'),(9,9,2,'Chuẩn bị'),(10,6,2,'Đang đi');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `socancuoc` varchar(20) NOT NULL,
  `namsinh` year(4) NOT NULL,
  `thanhpho_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thanhpho_id` (`thanhpho_id`),
  CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`thanhpho_id`) REFERENCES `thanhpho` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'Toàn','123456789',1999,1),(2,'Hoàng','123452789',1995,2),(3,'Tuấn','123456289',1996,3),(4,'Tùng','123486789',1994,4),(6,'Mạnh','132456789',1999,1),(7,'Huy','129456789',1997,2);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaitour`
--

DROP TABLE IF EXISTS `loaitour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaitour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maloai` varchar(20) NOT NULL,
  `tenloai` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaitour`
--

LOCK TABLES `loaitour` WRITE;
/*!40000 ALTER TABLE `loaitour` DISABLE KEYS */;
INSERT INTO `loaitour` VALUES (1,'loai1','binhthuong'),(2,'loai2','vip');
/*!40000 ALTER TABLE `loaitour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `test_max`
--

DROP TABLE IF EXISTS `test_max`;
/*!50001 DROP VIEW IF EXISTS `test_max`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `test_max` AS SELECT 
 1 AS `khachhang_id`,
 1 AS `tongso`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `thanhpho`
--

DROP TABLE IF EXISTS `thanhpho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanhpho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenthanhpho` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhpho`
--

LOCK TABLES `thanhpho` WRITE;
/*!40000 ALTER TABLE `thanhpho` DISABLE KEYS */;
INSERT INTO `thanhpho` VALUES (1,'Khánh Hòa'),(2,'Lào Cai'),(3,'Hà Nội'),(4,'Đà Nẵng'),(5,'Ninh Bình');
/*!40000 ALTER TABLE `thanhpho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matour` varchar(20) NOT NULL,
  `loaitour_id` int(11) NOT NULL,
  `giadiemden` double NOT NULL,
  `ngaybatdau` date NOT NULL,
  `ngayketthuc` date NOT NULL,
  `diemdulich_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loaitour_id` (`loaitour_id`),
  KEY `tour_ibfk_2_idx` (`diemdulich_id`),
  CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`loaitour_id`) REFERENCES `loaitour` (`id`),
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`diemdulich_id`) REFERENCES `diemdulich` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'T01',1,100000,'2020-03-01','2020-03-15',1),(2,'T02',1,110000,'2020-03-03','2020-03-15',2),(3,'T03',1,200000,'2020-03-28','2020-04-15',3),(4,'T04',2,250000,'2020-04-01','2020-04-15',4),(5,'T05',2,300000,'2020-04-01','2020-04-15',5),(6,'T06',1,350000,'2020-04-28','2020-05-14',1),(7,'T07',2,500000,'2020-02-25','2020-04-01',2),(8,'T08',2,2000000,'2020-02-01','2020-03-01',3),(9,'T09',2,50000000,'2020-06-01','2020-06-05',4),(10,'T10',2,50000000,'2020-08-01','2020-08-05',5);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `test_max`
--

/*!50001 DROP VIEW IF EXISTS `test_max`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test_max` AS select `hoadon`.`khachhang_id` AS `khachhang_id`,count(`hoadon`.`khachhang_id`) AS `tongso` from `hoadon` group by `hoadon`.`khachhang_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-20 16:30:57
