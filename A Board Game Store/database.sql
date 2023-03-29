-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for osx10.17 (arm64)
--
-- Host: localhost    Database: Final Exam
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board_game`
--

DROP TABLE IF EXISTS `board_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_game` (
  `board_game_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_game_name` varchar(100) NOT NULL,
  `publication_date` date NOT NULL,
  `UPC` varchar(64) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity_in_stock` int(10) unsigned NOT NULL,
  `designer_first_name` varchar(100) NOT NULL,
  `designer_last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`board_game_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_game`
--

LOCK TABLES `board_game` WRITE;
/*!40000 ALTER TABLE `board_game` DISABLE KEYS */;
INSERT INTO `board_game` VALUES
(1,'seven wonders','2017-05-04','0 36000 29135 2',58.00,2,'Idalia','Herleva'),
(2,'monopoly','2014-09-12','0 24465 34522 2',25.00,5,'Radhika','Radomir'),
(3,'conquer','2017-03-15','0 12453 23453 2',32.00,1,'Adi','Babette');
/*!40000 ALTER TABLE `board_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_game_publisher`
--

DROP TABLE IF EXISTS `board_game_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_game_publisher` (
  `board_game_publisher_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_game_ID` int(10) unsigned NOT NULL,
  `publisher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`board_game_publisher_ID`),
  KEY `board_game_publisher_FK` (`board_game_ID`),
  CONSTRAINT `board_game_publisher_FK` FOREIGN KEY (`board_game_ID`) REFERENCES `board_game` (`board_game_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_game_publisher`
--

LOCK TABLES `board_game_publisher` WRITE;
/*!40000 ALTER TABLE `board_game_publisher` DISABLE KEYS */;
INSERT INTO `board_game_publisher` VALUES
(1,1,'Fantasy Flight Games'),
(2,2,'Rio Grande Games'),
(3,2,'Z-Man Games'),
(4,3,'Stonemaier Games'),
(5,3,'Man O\' Kent Games'),
(6,3,'Days of Wonder');
/*!40000 ALTER TABLE `board_game_publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!50001 DROP VIEW IF EXISTS `bonus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `bonus` (
  `total number of sales in the past year` tinyint NOT NULL,
  `total amount of sales in the past year` tinyint NOT NULL,
  `by non-members and menbers` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `games with fewer than 3 copies in stock`
--

DROP TABLE IF EXISTS `games with fewer than 3 copies in stock`;
/*!50001 DROP VIEW IF EXISTS `games with fewer than 3 copies in stock`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `games with fewer than 3 copies in stock` (
  `board_game_ID` tinyint NOT NULL,
  `board_game_name` tinyint NOT NULL,
  `quantity_in_stock` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `membership_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `quantity_purchased` int(10) unsigned NOT NULL,
  `membership_number` varchar(64) NOT NULL,
  PRIMARY KEY (`membership_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES
(1,'Dipaka','Zubaida','dipakazubaida@gmail.com',23,'2255784'),
(2,'Nikephoros','Gaizka','nikephorosgaizka@gmail.com',27,'4724235'),
(3,'Nooa','Wilfred','nooawilfred@hotmail.com',0,'5236464');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `membership_ID` int(10) unsigned DEFAULT NULL,
  `time_of_transaction` datetime NOT NULL,
  PRIMARY KEY (`order_ID`),
  KEY `order_FK` (`membership_ID`),
  CONSTRAINT `order_FK` FOREIGN KEY (`membership_ID`) REFERENCES `membership` (`membership_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES
(1,1,'2022-09-15 17:22:40'),
(2,NULL,'2022-09-04 16:22:10'),
(3,2,'2021-11-24 15:23:45'),
(4,1,'2021-10-18 19:14:55'),
(5,NULL,'2021-09-24 13:11:35'),
(6,NULL,'2021-08-08 12:22:53');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_game`
--

DROP TABLE IF EXISTS `related_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_game` (
  `related_game_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `board_game_ID` int(10) unsigned NOT NULL,
  `related_game_name` varchar(100) NOT NULL,
  `publication_date` date NOT NULL,
  `UPC` varchar(64) NOT NULL,
  `related_reason` varchar(100) NOT NULL,
  PRIMARY KEY (`related_game_ID`),
  KEY `related_game_FK` (`board_game_ID`),
  CONSTRAINT `related_game_FK` FOREIGN KEY (`board_game_ID`) REFERENCES `board_game` (`board_game_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_game`
--

LOCK TABLES `related_game` WRITE;
/*!40000 ALTER TABLE `related_game` DISABLE KEYS */;
INSERT INTO `related_game` VALUES
(1,1,'eight wonders','2020-02-03','0 24122 12455 2','expansion'),
(2,1,'seven wonders 2','2018-12-14','0 43532 13512 3','sequel'),
(3,2,'cash flow','2016-09-22','0 24234 12341 4','recommendation'),
(4,3,'conquer 2','2018-08-17','1 23433 32354 2','sequel'),
(5,3,'conquer 3','2019-06-27','1 34235 46474 2','sequel');
/*!40000 ALTER TABLE `related_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `sale_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_ID` int(10) unsigned NOT NULL,
  `board_game_ID` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sale_ID`),
  KEY `sale_FK` (`order_ID`),
  KEY `sale_FK_1` (`board_game_ID`),
  CONSTRAINT `sale_FK` FOREIGN KEY (`order_ID`) REFERENCES `order` (`order_ID`),
  CONSTRAINT `sale_FK_1` FOREIGN KEY (`board_game_ID`) REFERENCES `board_game` (`board_game_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES
(1,1,1,2),
(2,1,2,3),
(3,2,1,1),
(4,2,3,3),
(5,3,2,2),
(6,4,3,2),
(7,4,1,1),
(8,5,2,1),
(9,5,3,2),
(10,6,1,3);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `total number and amount of sales in the past month`
--

DROP TABLE IF EXISTS `total number and amount of sales in the past month`;
/*!50001 DROP VIEW IF EXISTS `total number and amount of sales in the past month`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `total number and amount of sales in the past month` (
  `total number of sales in the past month` tinyint NOT NULL,
  `total amount of sales in the past month` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `total number and amount of sales in the past year to members`
--

DROP TABLE IF EXISTS `total number and amount of sales in the past year to members`;
/*!50001 DROP VIEW IF EXISTS `total number and amount of sales in the past year to members`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `total number and amount of sales in the past year to members` (
  `total number of sales in the past year for members` tinyint NOT NULL,
  `total amount of sales in the past year for members` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `total number and amount of sales in the past year to non-members`
--

DROP TABLE IF EXISTS `total number and amount of sales in the past year to non-members`;
/*!50001 DROP VIEW IF EXISTS `total number and amount of sales in the past year to non-members`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `total number and amount of sales in the past year to non-members` (
  `total number of sales in the past year for non-members` tinyint NOT NULL,
  `total amount of sales in the past year for non-members` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Final Exam'
--

--
-- Final view structure for view `bonus`
--

/*!50001 DROP TABLE IF EXISTS `bonus`*/;
/*!50001 DROP VIEW IF EXISTS `bonus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final exam`.`bonus` AS select sum(`final exam`.`sale`.`quantity`) AS `total number of sales in the past year`,sum(`final exam`.`board_game`.`price` * `final exam`.`sale`.`quantity`) AS `total amount of sales in the past year`,`final exam`.`order`.`membership_ID` AS `by non-members and menbers` from ((`final exam`.`sale` join `final exam`.`order` on(`final exam`.`sale`.`order_ID` = `final exam`.`order`.`order_ID`)) join `final exam`.`board_game` on(`final exam`.`sale`.`board_game_ID` = `final exam`.`board_game`.`board_game_ID`)) where `final exam`.`order`.`time_of_transaction` between '2021-01-01' and '2021-12-31' group by `final exam`.`order`.`membership_ID` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `games with fewer than 3 copies in stock`
--

/*!50001 DROP TABLE IF EXISTS `games with fewer than 3 copies in stock`*/;
/*!50001 DROP VIEW IF EXISTS `games with fewer than 3 copies in stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final exam`.`games with fewer than 3 copies in stock` AS select `final exam`.`board_game`.`board_game_ID` AS `board_game_ID`,`final exam`.`board_game`.`board_game_name` AS `board_game_name`,`final exam`.`board_game`.`quantity_in_stock` AS `quantity_in_stock` from `final exam`.`board_game` where `final exam`.`board_game`.`quantity_in_stock` < 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total number and amount of sales in the past month`
--

/*!50001 DROP TABLE IF EXISTS `total number and amount of sales in the past month`*/;
/*!50001 DROP VIEW IF EXISTS `total number and amount of sales in the past month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final exam`.`total number and amount of sales in the past month` AS select sum(`final exam`.`sale`.`quantity`) AS `total number of sales in the past month`,sum(`final exam`.`board_game`.`price` * `final exam`.`sale`.`quantity`) AS `total amount of sales in the past month` from ((`final exam`.`sale` join `final exam`.`order` on(`final exam`.`sale`.`order_ID` = `final exam`.`order`.`order_ID`)) join `final exam`.`board_game` on(`final exam`.`sale`.`board_game_ID` = `final exam`.`board_game`.`board_game_ID`)) where `final exam`.`order`.`time_of_transaction` between '2022-09-01' and '2022-09-30' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total number and amount of sales in the past year to members`
--

/*!50001 DROP TABLE IF EXISTS `total number and amount of sales in the past year to members`*/;
/*!50001 DROP VIEW IF EXISTS `total number and amount of sales in the past year to members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final exam`.`total number and amount of sales in the past year to members` AS select sum(`final exam`.`sale`.`quantity`) AS `total number of sales in the past year for members`,sum(`final exam`.`board_game`.`price` * `final exam`.`sale`.`quantity`) AS `total amount of sales in the past year for members` from ((`final exam`.`sale` join `final exam`.`order` on(`final exam`.`sale`.`order_ID` = `final exam`.`order`.`order_ID`)) join `final exam`.`board_game` on(`final exam`.`sale`.`board_game_ID` = `final exam`.`board_game`.`board_game_ID`)) where `final exam`.`order`.`time_of_transaction` between '2021-01-01' and '2021-12-31' and `final exam`.`order`.`membership_ID` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total number and amount of sales in the past year to non-members`
--

/*!50001 DROP TABLE IF EXISTS `total number and amount of sales in the past year to non-members`*/;
/*!50001 DROP VIEW IF EXISTS `total number and amount of sales in the past year to non-members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final exam`.`total number and amount of sales in the past year to non-members` AS select sum(`final exam`.`sale`.`quantity`) AS `total number of sales in the past year for non-members`,sum(`final exam`.`board_game`.`price` * `final exam`.`sale`.`quantity`) AS `total amount of sales in the past year for non-members` from ((`final exam`.`sale` join `final exam`.`order` on(`final exam`.`sale`.`order_ID` = `final exam`.`order`.`order_ID`)) join `final exam`.`board_game` on(`final exam`.`sale`.`board_game_ID` = `final exam`.`board_game`.`board_game_ID`)) where `final exam`.`order`.`time_of_transaction` between '2021-01-01' and '2021-12-31' and `final exam`.`order`.`membership_ID` is null */;
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

-- Dump completed on 2022-10-14 19:30:29
