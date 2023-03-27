-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for osx10.17 (arm64)
--
-- Host: localhost    Database: Final Project
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
-- Table structure for table `amenity`
--

DROP TABLE IF EXISTS `amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenity` (
  `amenity_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(100) NOT NULL,
  PRIMARY KEY (`amenity_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES
(1,'washer/dryer'),
(2,'TV'),
(3,'kitchen '),
(4,'Wi-Fi'),
(5,'pool'),
(6,'parking'),
(7,'workout facility');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_ID_guest` int(10) unsigned NOT NULL,
  `property_ID` int(10) unsigned NOT NULL,
  `arrival date` date NOT NULL,
  `departure date` date NOT NULL,
  `request_status` varchar(100) DEFAULT NULL,
  `date_booked` date DEFAULT NULL,
  `payment status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`booking_ID`),
  KEY `booking_FK` (`user_ID_guest`),
  KEY `booking_FK_1` (`property_ID`),
  CONSTRAINT `booking_FK` FOREIGN KEY (`user_ID_guest`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `booking_FK_1` FOREIGN KEY (`property_ID`) REFERENCES `property` (`property_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES
(3,6,2,'2022-11-02','2022-11-30','confirmed','2022-09-20','payed'),
(4,7,3,'2022-11-15','2022-12-15','confirmed','2022-10-03','payed');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_centre`
--

DROP TABLE IF EXISTS `message_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_centre` (
  `message_centre_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_ID` int(10) unsigned NOT NULL,
  `to_user_ID` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`message_centre_ID`),
  KEY `message_centre_FK` (`from_user_ID`),
  KEY `message_centre_FK_1` (`to_user_ID`),
  CONSTRAINT `message_centre_FK` FOREIGN KEY (`from_user_ID`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `message_centre_FK_1` FOREIGN KEY (`to_user_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_centre`
--

LOCK TABLES `message_centre` WRITE;
/*!40000 ALTER TABLE `message_centre` DISABLE KEYS */;
INSERT INTO `message_centre` VALUES
(1,6,2,'Hi there, is this still available?','2022-09-17 19:12:43'),
(2,2,6,'Yes, for how many people? ','2022-09-17 19:20:10'),
(3,6,2,'just for me and my kid','2022-09-17 19:22:45'),
(4,2,6,'Good, you just need to clean it up a little bit before you leave, thanks.','2022-09-17 19:27:46'),
(5,6,2,'Hi, I just booked today and finished the payment, thanks.','2022-09-20 10:24:42'),
(6,7,3,'Hi there, for the parking, is there a space in front of the house?','2022-10-01 20:11:20'),
(7,3,7,'Yes, and you can use the pool anytime you want.','2022-10-01 20:15:57'),
(8,7,3,'Thank you, I\'ll think about it, and book when I\'m ready.','2022-10-01 20:20:04'),
(9,7,3,'Hi there, so I just booked and payed through the website, thanks.','2022-10-03 09:10:46'),
(10,3,7,'Alright, enjoy your stay. :)','2022-10-03 10:10:38');
/*!40000 ALTER TABLE `message_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `property_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_name` varchar(100) NOT NULL,
  `description` varchar(128) NOT NULL,
  `address` varchar(100) NOT NULL,
  `number_of_rooms` int(10) unsigned NOT NULL,
  PRIMARY KEY (`property_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES
(1,'a cozy apartment','a cozy place for a couple','3753 Feathers Hooves Drive, New York, NY, USA',2),
(2,'a nice condo','a nice place with an amazing city view','3997 Douglas Dairy Road, Johnson City, VA, USA',3),
(3,'a big house','a great place for a family','179 collegiate Street, Vancouver, BC, CA',5);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_amenity`
--

DROP TABLE IF EXISTS `property_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_amenity` (
  `property_amenity_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_ID` int(10) unsigned NOT NULL,
  `amenity_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`property_amenity_ID`),
  KEY `property_amenity_FK` (`property_ID`),
  KEY `property_amenity_FK_1` (`amenity_ID`),
  CONSTRAINT `property_amenity_FK` FOREIGN KEY (`property_ID`) REFERENCES `property` (`property_ID`),
  CONSTRAINT `property_amenity_FK_1` FOREIGN KEY (`amenity_ID`) REFERENCES `amenity` (`amenity_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_amenity`
--

LOCK TABLES `property_amenity` WRITE;
/*!40000 ALTER TABLE `property_amenity` DISABLE KEYS */;
INSERT INTO `property_amenity` VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,7),
(6,2,1),
(7,2,2),
(8,2,3),
(9,2,4),
(10,2,6),
(11,2,7),
(12,3,1),
(13,3,2),
(14,3,3),
(15,3,4),
(16,3,5),
(17,3,6);
/*!40000 ALTER TABLE `property_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `property_owner`
--

DROP TABLE IF EXISTS `property_owner`;
/*!50001 DROP VIEW IF EXISTS `property_owner`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `property_owner` (
  `user_ID` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `property_name` tinyint NOT NULL,
  `property_address` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `property_photo`
--

DROP TABLE IF EXISTS `property_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_photo` (
  `property_photo_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_ID` int(10) unsigned NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`property_photo_ID`),
  KEY `photo_FK` (`property_ID`),
  CONSTRAINT `photo_FK` FOREIGN KEY (`property_ID`) REFERENCES `property` (`property_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_photo`
--

LOCK TABLES `property_photo` WRITE;
/*!40000 ALTER TABLE `property_photo` DISABLE KEYS */;
INSERT INTO `property_photo` VALUES
(1,1,'living room','scene1.jpg'),
(2,1,'bedrooms','scene2.jpg'),
(3,1,'inside look from the main door','scene3.jpg'),
(4,2,'city view from the window','scene4.jpg'),
(5,2,'inside look from the living room','scene5.jpg'),
(6,2,'kitchen','scene6.jpg'),
(7,3,'pool','scene7.jpg'),
(8,3,'inside of the house','scene8.jpg'),
(9,3,'front of the house','scene9.jpg'),
(10,3,'bedrooms','scene10.jpg');
/*!40000 ALTER TABLE `property_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `property_with_number_of_amenities`
--

DROP TABLE IF EXISTS `property_with_number_of_amenities`;
/*!50001 DROP VIEW IF EXISTS `property_with_number_of_amenities`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `property_with_number_of_amenities` (
  `property_ID` tinyint NOT NULL,
  `property_name` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `number_of_rooms` tinyint NOT NULL,
  `number_of_amenities` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rating_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_guest` int(10) unsigned NOT NULL,
  `to_user_owner` int(10) unsigned NOT NULL,
  `guest_to_owner(out_of_5)` float NOT NULL,
  `to_property` int(10) unsigned NOT NULL,
  `guest_to_property(out_of_5)` float NOT NULL,
  `from_user_owner` int(10) unsigned NOT NULL,
  `to_user_guest` int(10) unsigned NOT NULL,
  `owner_to_guest(out_of_5)` float NOT NULL,
  PRIMARY KEY (`rating_ID`),
  KEY `rating_FK` (`from_user_guest`),
  KEY `rating_FK_1` (`to_user_owner`),
  KEY `rating_FK_2` (`to_property`),
  KEY `rating_FK_3` (`from_user_owner`),
  KEY `rating_FK_4` (`to_user_guest`),
  CONSTRAINT `rating_FK` FOREIGN KEY (`from_user_guest`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `rating_FK_1` FOREIGN KEY (`to_user_owner`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `rating_FK_2` FOREIGN KEY (`to_property`) REFERENCES `property` (`property_ID`),
  CONSTRAINT `rating_FK_3` FOREIGN KEY (`from_user_owner`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `rating_FK_4` FOREIGN KEY (`to_user_guest`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES
(1,4,1,5,1,5,1,4,4),
(2,5,2,5,2,4,2,5,5);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent` (
  `rent_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_ID` int(10) unsigned NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `by_user` int(10) unsigned DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`rent_ID`),
  KEY `rent_FK` (`by_user`),
  CONSTRAINT `rent_FK` FOREIGN KEY (`by_user`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES
(1,1,'2021-04-01','2021-04-30','booked',4,4400.00),
(2,2,'2021-05-15','2021-05-31','booked',5,1100.00),
(3,2,'2022-11-01','2022-11-30','booked',6,1900.00),
(4,3,'2022-11-15','2022-12-15','booked',7,2700.00),
(5,1,'2023-02-01','2023-02-28','available',NULL,4100.00);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `mailing_address` varchar(100) NOT NULL,
  `date_joined` date NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'sancho','nico@gmail.com','156 Barfield Lane, Indianapolis, IN, USA','2020-05-09','2022-09-08 10:21:19'),
(2,'owen','mira@hotmail.com','1538 August Lane, Shreveport, LA, USA','2020-01-04','2022-10-01 11:24:21'),
(3,'mara','stanislas@naver.com','2325 Jadewood Drive, Chicago, LI, USA','2020-03-03','2022-09-01 21:29:30'),
(4,'abdul','bipin@gmail.com','2052 Cedarstone Drive, Archbold, OH, USA','2020-02-01','2022-10-10 09:21:47'),
(5,'pisti','lara@hotmail.com','3648 Brooke Street, Houston, TX, USA','2020-04-02','2022-08-22 23:11:34'),
(6,'adaeze','jessamine@naver.com','2409 Stone Lane, Philadelphia, PA, USA','2020-02-18','2022-10-11 13:42:20'),
(7,'gabriela','dragomir@gmail.com','4265 Garrett Street, Grand Rapids, MI, USA','2020-03-26','2022-09-29 20:12:44');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_property` (
  `user_property_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int(10) unsigned NOT NULL,
  `property_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_property_ID`),
  KEY `user_property_FK` (`user_ID`),
  KEY `user_property_FK_1` (`property_ID`),
  CONSTRAINT `user_property_FK` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `user_property_FK_1` FOREIGN KEY (`property_ID`) REFERENCES `property` (`property_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
INSERT INTO `user_property` VALUES
(1,1,1),
(2,2,2),
(3,3,3);
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user_with_booking`
--

DROP TABLE IF EXISTS `user_with_booking`;
/*!50001 DROP VIEW IF EXISTS `user_with_booking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user_with_booking` (
  `booking_ID` tinyint NOT NULL,
  `user_ID` tinyint NOT NULL,
  `user_name` tinyint NOT NULL,
  `booked_property` tinyint NOT NULL,
  `property_address` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'Final Project'
--

--
-- Final view structure for view `property_owner`
--

/*!50001 DROP TABLE IF EXISTS `property_owner`*/;
/*!50001 DROP VIEW IF EXISTS `property_owner`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final project`.`property_owner` AS select `final project`.`user`.`user_ID` AS `user_ID`,`final project`.`user`.`user_name` AS `user_name`,`final project`.`property`.`property_name` AS `property_name`,`final project`.`property`.`address` AS `property_address` from ((`final project`.`user` join `final project`.`user_property` on(`final project`.`user`.`user_ID` = `final project`.`user_property`.`user_ID`)) join `final project`.`property` on(`final project`.`user_property`.`property_ID` = `final project`.`property`.`property_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `property_with_number_of_amenities`
--

/*!50001 DROP TABLE IF EXISTS `property_with_number_of_amenities`*/;
/*!50001 DROP VIEW IF EXISTS `property_with_number_of_amenities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final project`.`property_with_number_of_amenities` AS select `final project`.`property`.`property_ID` AS `property_ID`,`final project`.`property`.`property_name` AS `property_name`,`final project`.`property`.`address` AS `address`,`final project`.`property`.`number_of_rooms` AS `number_of_rooms`,count(`final project`.`property_amenity`.`amenity_ID`) AS `number_of_amenities` from (`final project`.`property` join `final project`.`property_amenity` on(`final project`.`property`.`property_ID` = `final project`.`property_amenity`.`property_ID`)) group by `final project`.`property`.`property_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_with_booking`
--

/*!50001 DROP TABLE IF EXISTS `user_with_booking`*/;
/*!50001 DROP VIEW IF EXISTS `user_with_booking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `final project`.`user_with_booking` AS select `final project`.`booking`.`booking_ID` AS `booking_ID`,`final project`.`user`.`user_ID` AS `user_ID`,`final project`.`user`.`user_name` AS `user_name`,`final project`.`property`.`property_name` AS `booked_property`,`final project`.`property`.`address` AS `property_address` from ((`final project`.`booking` join `final project`.`user` on(`final project`.`booking`.`user_ID_guest` = `final project`.`user`.`user_ID`)) join `final project`.`property` on(`final project`.`booking`.`property_ID` = `final project`.`property`.`property_ID`)) */;
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

-- Dump completed on 2022-10-13 14:56:05
