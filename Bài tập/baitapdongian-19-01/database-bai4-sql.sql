-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: baitap4
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
-- Table structure for table `chitietdathang`
--

DROP TABLE IF EXISTS `chitietdathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietdathang` (
  `sohoadon` int(11) NOT NULL,
  `mahang` int(11) NOT NULL,
  `giaban` double NOT NULL,
  `soluong` int(11) NOT NULL,
  `mucgiamgia` double DEFAULT NULL,
  PRIMARY KEY (`sohoadon`,`mahang`),
  KEY `mahang` (`mahang`),
  CONSTRAINT `chitietdathang_ibfk_1` FOREIGN KEY (`sohoadon`) REFERENCES `dondathang` (`sohoadon`),
  CONSTRAINT `chitietdathang_ibfk_2` FOREIGN KEY (`mahang`) REFERENCES `mathang` (`mahang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdathang`
--

LOCK TABLES `chitietdathang` WRITE;
/*!40000 ALTER TABLE `chitietdathang` DISABLE KEYS */;
INSERT INTO `chitietdathang` VALUES (1,1,10000000,2,NULL),(1,3,2002566,3,20),(2,2,2000000,10,NULL),(3,1,200000,11,NULL),(3,3,3000003,5,NULL);
/*!40000 ALTER TABLE `chitietdathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dondathang` (
  `sohoadon` int(11) NOT NULL AUTO_INCREMENT,
  `ngaydathang` date NOT NULL,
  `ngaygiaohang` date NOT NULL,
  `ngaychuyenhang` date NOT NULL,
  `noigiaohang` varchar(50) NOT NULL,
  `makhachhang` int(11) NOT NULL,
  `manhanvien` int(11) NOT NULL,
  PRIMARY KEY (`sohoadon`),
  KEY `makhachhang` (`makhachhang`),
  KEY `manhanvien` (`manhanvien`),
  CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`),
  CONSTRAINT `dondathang_ibfk_2` FOREIGN KEY (`manhanvien`) REFERENCES `nhanvien` (`manhanvien`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dondathang`
--

LOCK TABLES `dondathang` WRITE;
/*!40000 ALTER TABLE `dondathang` DISABLE KEYS */;
INSERT INTO `dondathang` VALUES (1,'2022-01-18','2022-01-25','2022-01-23','BN',1,2),(2,'2022-01-18','2022-01-25','2022-01-23','DN',2,1),(3,'2022-02-11','2022-02-18','2022-02-19','HB',1,1);
/*!40000 ALTER TABLE `dondathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `makhachhang` int(11) NOT NULL AUTO_INCREMENT,
  `tencongty` varchar(50) NOT NULL,
  `tengiaodich` varchar(50) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `dienthoai` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`makhachhang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'CG','gd1','HN','0256985689','1256985687','cg@gmail.com'),(2,'CMC','gd1','HN','0256985567','1254585687','cmc@gmail.com');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaihang`
--

DROP TABLE IF EXISTS `loaihang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaihang` (
  `maloaihang` int(11) NOT NULL AUTO_INCREMENT,
  `tenloaihang` varchar(50) NOT NULL,
  PRIMARY KEY (`maloaihang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaihang`
--

LOCK TABLES `loaihang` WRITE;
/*!40000 ALTER TABLE `loaihang` DISABLE KEYS */;
INSERT INTO `loaihang` VALUES (1,'laptop'),(2,'tablet'),(3,'smartphone');
/*!40000 ALTER TABLE `loaihang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathang`
--

DROP TABLE IF EXISTS `mathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathang` (
  `mahang` int(11) NOT NULL AUTO_INCREMENT,
  `tenhang` varchar(50) NOT NULL,
  `soluong` int(11) NOT NULL,
  `donvitinh` varchar(20) NOT NULL,
  `giahang` double NOT NULL,
  `macongty` int(11) NOT NULL,
  `maloaihang` int(11) NOT NULL,
  PRIMARY KEY (`mahang`),
  KEY `macongty` (`macongty`),
  KEY `maloaihang` (`maloaihang`),
  CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`macongty`) REFERENCES `nhacungcap` (`macongty`),
  CONSTRAINT `mathang_ibfk_2` FOREIGN KEY (`maloaihang`) REFERENCES `loaihang` (`maloaihang`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathang`
--

LOCK TABLES `mathang` WRITE;
/*!40000 ALTER TABLE `mathang` DISABLE KEYS */;
INSERT INTO `mathang` VALUES (1,'Iphone',20,'chiếc',200000,1,3),(2,'Galaxy',30,'chiếc',100000,2,3),(3,'Xaomi',15,'chiếc',50000,1,2),(4,'Oppo',26,'chiếc',20000,1,1);
/*!40000 ALTER TABLE `mathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhacungcap`
--

DROP TABLE IF EXISTS `nhacungcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhacungcap` (
  `macongty` int(11) NOT NULL AUTO_INCREMENT,
  `tencongty` varchar(50) NOT NULL,
  `tengiaodich` varchar(50) NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `dienthoai` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`macongty`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhacungcap`
--

LOCK TABLES `nhacungcap` WRITE;
/*!40000 ALTER TABLE `nhacungcap` DISABLE KEYS */;
INSERT INTO `nhacungcap` VALUES (1,'Vin','gd10','HCM','0256998558','125369528','vin@gmail.com'),(2,'RK','gd11','HN','0256498558','125343528','rk@gmail.com');
/*!40000 ALTER TABLE `nhacungcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `manhanvien` int(11) NOT NULL AUTO_INCREMENT,
  `tennhanvien` varchar(50) NOT NULL,
  `ngaysinh` date NOT NULL,
  `ngaybatdaulamviec` date NOT NULL,
  `diachi` varchar(50) NOT NULL,
  `dienthoai` varchar(50) NOT NULL,
  `luongcoban` double NOT NULL,
  `phucap` double NOT NULL,
  PRIMARY KEY (`manhanvien`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Huấn','1996-11-11','2022-01-01','HN','0256968589',15000,1500),(2,'Tùng','1999-12-12','2022-01-02','HB','0255468589',20000,2000);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `test`
--

DROP TABLE IF EXISTS `test`;
/*!50001 DROP VIEW IF EXISTS `test`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `test` AS SELECT 
 1 AS `manhanvien`,
 1 AS `tongsoluong`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `test2`
--

DROP TABLE IF EXISTS `test2`;
/*!50001 DROP VIEW IF EXISTS `test2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `test2` AS SELECT 
 1 AS `mahang`,
 1 AS `tenhang`,
 1 AS `ngaydathang`,
 1 AS `soluong`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `test`
--

/*!50001 DROP VIEW IF EXISTS `test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test` AS select `nhanvien`.`manhanvien` AS `manhanvien`,sum(`chitietdathang`.`soluong`) AS `tongsoluong` from ((`nhanvien` join `dondathang` on((`dondathang`.`manhanvien` = `nhanvien`.`manhanvien`))) join `chitietdathang` on((`dondathang`.`sohoadon` = `chitietdathang`.`sohoadon`))) group by `nhanvien`.`manhanvien` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `test2`
--

/*!50001 DROP VIEW IF EXISTS `test2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `test2` AS select `mathang`.`mahang` AS `mahang`,`mathang`.`tenhang` AS `tenhang`,`dondathang`.`ngaydathang` AS `ngaydathang`,`chitietdathang`.`soluong` AS `soluong` from ((`mathang` join `chitietdathang` on((`chitietdathang`.`mahang` = `mathang`.`mahang`))) join `dondathang` on((`dondathang`.`sohoadon` = `chitietdathang`.`sohoadon`))) */;
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

-- Dump completed on 2022-01-19 16:29:12
