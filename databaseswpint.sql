CREATE DATABASE  IF NOT EXISTS `swp_inte1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swp_inte1`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: swp_inte
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `tb_shop_time_slot`
--

DROP TABLE IF EXISTS `tb_shop_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_shop_time_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shop_id` int DEFAULT NULL,
  `time_slot_id` int DEFAULT NULL,
  `description` tinytext,
  PRIMARY KEY (`id`),
  KEY `FK7hub2jmqjp5ed8162ulpw75n4` (`shop_id`),
  KEY `FK4ewb0dl6xiwk9dt5pkyrobmd7` (`time_slot_id`),
  CONSTRAINT `FK4ewb0dl6xiwk9dt5pkyrobmd7` FOREIGN KEY (`time_slot_id`) REFERENCES `tbl_time_slot` (`id`),
  CONSTRAINT `FK7hub2jmqjp5ed8162ulpw75n4` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop_time_slot`
--

LOCK TABLES `tb_shop_time_slot` WRITE;
/*!40000 ALTER TABLE `tb_shop_time_slot` DISABLE KEYS */;
INSERT INTO `tb_shop_time_slot` VALUES (1,NULL,NULL,'Shop time slot 1 description'),(2,NULL,NULL,'Shop time slot 2 description'),(3,1,1,'Available slot for booking.'),(4,2,2,'Open for appointment booking.'),(5,3,3,'Please book within this time slot.'),(6,4,4,'Bookings are open for this time period.'),(7,5,5,'Slot available for scheduling.'),(8,6,6,'You can book during this time.'),(9,7,7,'Appointment slots are open.'),(10,8,8,'Available time slot.'),(11,9,9,'Bookings are accepted within this time frame.'),(12,10,10,'You can schedule your appointment during this time.'),(13,11,11,'This time slot is available for booking.'),(14,12,12,'Bookings are open for this time period.'),(15,13,13,'You can schedule your appointment during this time.'),(16,14,14,'Available slot for booking.'),(17,15,15,'Please book within this time slot.'),(18,16,16,'Slot available for scheduling.'),(19,17,17,'You can book during this time.'),(20,18,18,'Appointment slots are open.'),(21,19,19,'Available time slot.'),(22,20,20,'Bookings are accepted within this time frame.');
/*!40000 ALTER TABLE `tb_shop_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_booking`
--

DROP TABLE IF EXISTS `tbl_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_canceled` bit(1) NOT NULL,
  `is_done` bit(1) NOT NULL,
  `service_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `booking_note` tinytext,
  PRIMARY KEY (`id`),
  KEY `FK8hwy0kovocbtlqvm63a0g8mk2` (`service_id`),
  KEY `FKpcf1qp7csho6buh14c8dsj7uw` (`shop_id`),
  KEY `FKjjbrcb587bsd7mcqiem0auigi` (`user_id`),
  CONSTRAINT `FK8hwy0kovocbtlqvm63a0g8mk2` FOREIGN KEY (`service_id`) REFERENCES `tbl_service` (`id`),
  CONSTRAINT `FKjjbrcb587bsd7mcqiem0auigi` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKpcf1qp7csho6buh14c8dsj7uw` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_booking`
--

LOCK TABLES `tbl_booking` WRITE;
/*!40000 ALTER TABLE `tbl_booking` DISABLE KEYS */;
INSERT INTO `tbl_booking` VALUES (1,_binary '\0',_binary '',NULL,NULL,NULL,'Booking note 1'),(2,_binary '',_binary '\0',NULL,NULL,NULL,'Booking note 2'),(60,_binary '\0',_binary '',1,1,1,'Booking completed without issues.'),(61,_binary '',_binary '\0',2,2,2,'Canceled due to user request.'),(62,_binary '\0',_binary '',3,3,3,'Service provided satisfactorily.'),(63,_binary '\0',_binary '',4,4,4,'No issues encountered during service.'),(64,_binary '',_binary '\0',5,5,5,'Canceled due to weather conditions.'),(65,_binary '\0',_binary '\0',26,6,6,'Upcoming booking next week.'),(66,_binary '\0',_binary '',27,1,7,'Completed successfully.'),(67,_binary '\0',_binary '\0',28,5,8,'Scheduled for next month.'),(68,_binary '',_binary '\0',29,6,9,'User canceled last minute.'),(69,_binary '\0',_binary '',31,7,10,'Service finished without any problems.'),(70,_binary '\0',_binary '',32,11,11,'Happy with the service provided.'),(71,_binary '',_binary '\0',32,2,11,'Canceled due to shop closure.'),(72,_binary '\0',_binary '\0',33,12,12,'Upcoming service booking.'),(73,_binary '\0',_binary '',34,14,13,'Service completed as expected.'),(74,_binary '',_binary '\0',35,16,14,'Booking canceled by user.'),(75,_binary '\0',_binary '',26,17,15,'No issues, service done.'),(76,_binary '\0',_binary '',27,18,17,'Service was satisfactory.'),(77,_binary '',_binary '\0',28,9,16,'Canceled by shop.'),(78,_binary '\0',_binary '\0',29,20,19,'Service scheduled next week.');
/*!40000 ALTER TABLE `tbl_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_booking_time`
--

DROP TABLE IF EXISTS `tbl_booking_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_booking_time` (
  `booking_id` int NOT NULL,
  `cache_shop_time_slot` int NOT NULL,
  KEY `FK362ps3u7mgpxhwghhpuo1j30r` (`cache_shop_time_slot`),
  KEY `FK78w4gndaqb3i3151l2rpecxvi` (`booking_id`),
  CONSTRAINT `FK362ps3u7mgpxhwghhpuo1j30r` FOREIGN KEY (`cache_shop_time_slot`) REFERENCES `tbl_cache_shop_time_slot` (`id`),
  CONSTRAINT `FK78w4gndaqb3i3151l2rpecxvi` FOREIGN KEY (`booking_id`) REFERENCES `tbl_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_booking_time`
--

LOCK TABLES `tbl_booking_time` WRITE;
/*!40000 ALTER TABLE `tbl_booking_time` DISABLE KEYS */;
INSERT INTO `tbl_booking_time` VALUES (60,1),(61,2),(62,3),(63,4),(64,5),(65,6),(66,7),(67,8),(68,9),(69,10),(70,11),(71,12),(72,13),(73,14),(74,15),(75,16),(76,17),(77,18),(78,19);
/*!40000 ALTER TABLE `tbl_booking_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cache_shop_time_slot`
--

DROP TABLE IF EXISTS `tbl_cache_shop_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cache_shop_time_slot` (
  `available_slots` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `shop_id` int DEFAULT NULL,
  `shop_time_slot_id` int DEFAULT NULL,
  `total_slots` int NOT NULL,
  `used_slots` int NOT NULL,
  `local_date_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp7ef1opboat4ltqa8v9wemsj1` (`shop_id`),
  KEY `FK36cv3d0mc4ohvjwkismh2qhiu` (`shop_time_slot_id`),
  CONSTRAINT `FK36cv3d0mc4ohvjwkismh2qhiu` FOREIGN KEY (`shop_time_slot_id`) REFERENCES `tb_shop_time_slot` (`id`),
  CONSTRAINT `FKp7ef1opboat4ltqa8v9wemsj1` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cache_shop_time_slot`
--

LOCK TABLES `tbl_cache_shop_time_slot` WRITE;
/*!40000 ALTER TABLE `tbl_cache_shop_time_slot` DISABLE KEYS */;
INSERT INTO `tbl_cache_shop_time_slot` VALUES (3,1,NULL,NULL,5,2,'2024-05-27 19:47:41.872712'),(73,2,NULL,NULL,3,2,'2024-05-27 19:47:41.872712'),(13,3,NULL,NULL,55,22,'2024-05-27 19:47:41.872712'),(5,4,1,1,10,5,'2024-05-27 09:00:00.000000'),(4,5,2,2,10,6,'2024-05-27 10:00:00.000000'),(6,6,3,3,12,6,'2024-05-27 11:00:00.000000'),(8,7,4,4,12,4,'2024-05-27 12:00:00.000000'),(7,8,5,5,15,8,'2024-05-27 13:00:00.000000'),(10,9,6,6,12,2,'2024-05-27 14:00:00.000000'),(9,10,7,7,10,1,'2024-05-27 15:00:00.000000'),(11,11,8,8,15,4,'2024-05-27 16:00:00.000000'),(10,12,9,9,12,2,'2024-05-27 17:00:00.000000'),(8,13,10,10,10,2,'2024-05-27 18:00:00.000000'),(6,14,11,11,8,2,'2024-05-27 19:00:00.000000'),(4,15,12,12,6,2,'2024-05-27 20:00:00.000000'),(3,16,13,13,5,2,'2024-05-27 21:00:00.000000'),(5,17,14,14,10,5,'2024-05-27 22:00:00.000000'),(7,18,15,15,12,5,'2024-05-27 23:00:00.000000'),(6,19,16,16,8,2,'2024-05-28 00:00:00.000000'),(9,20,17,17,12,3,'2024-05-28 01:00:00.000000'),(10,21,18,18,14,4,'2024-05-28 02:00:00.000000'),(11,22,19,19,12,1,'2024-05-28 03:00:00.000000'),(12,23,20,20,15,3,'2024-05-28 04:00:00.000000');
/*!40000 ALTER TABLE `tbl_cache_shop_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cache_shop_time_slot_booking`
--

DROP TABLE IF EXISTS `tbl_cache_shop_time_slot_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cache_shop_time_slot_booking` (
  `bookings_id` int NOT NULL,
  `cache_shop_time_slot_id` int NOT NULL,
  KEY `FKbbjmbnf7c45xfr4oqgv21xu0o` (`bookings_id`),
  KEY `FKl7craub4xkstr9vvmm8yt3vil` (`cache_shop_time_slot_id`),
  CONSTRAINT `FKbbjmbnf7c45xfr4oqgv21xu0o` FOREIGN KEY (`bookings_id`) REFERENCES `tbl_booking` (`id`),
  CONSTRAINT `FKl7craub4xkstr9vvmm8yt3vil` FOREIGN KEY (`cache_shop_time_slot_id`) REFERENCES `tbl_cache_shop_time_slot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cache_shop_time_slot_booking`
--

LOCK TABLES `tbl_cache_shop_time_slot_booking` WRITE;
/*!40000 ALTER TABLE `tbl_cache_shop_time_slot_booking` DISABLE KEYS */;
INSERT INTO `tbl_cache_shop_time_slot_booking` VALUES (60,1),(61,2),(62,3),(63,4),(64,5),(65,6),(66,7),(67,8),(68,9),(69,10),(70,11),(71,12),(72,13);
/*!40000 ALTER TABLE `tbl_cache_shop_time_slot_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_feedback`
--

DROP TABLE IF EXISTS `tbl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` tinytext,
  PRIMARY KEY (`id`),
  KEY `FKcp7ui9r50t9jtqu2j89mkhn16` (`service_id`),
  KEY `FKm2jqo0ymwtjndl7b0cxfvwjmc` (`shop_id`),
  KEY `FKlu1yip7pjxni2mmfx2qgfi07p` (`user_id`),
  CONSTRAINT `FKcp7ui9r50t9jtqu2j89mkhn16` FOREIGN KEY (`service_id`) REFERENCES `tbl_service` (`id`),
  CONSTRAINT `FKlu1yip7pjxni2mmfx2qgfi07p` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKm2jqo0ymwtjndl7b0cxfvwjmc` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_feedback`
--

LOCK TABLES `tbl_feedback` WRITE;
/*!40000 ALTER TABLE `tbl_feedback` DISABLE KEYS */;
INSERT INTO `tbl_feedback` VALUES (1,NULL,NULL,NULL,'Great service!'),(2,NULL,NULL,NULL,'Not satisfied with the service.'),(23,1,24,1,'Great grooming service for my dog.'),(24,2,25,2,'Excellent cat grooming!'),(25,3,26,3,'Top rated rabbit grooming.'),(26,24,25,4,'Best dog training in town.'),(27,25,23,5,'Bird training was very effective.'),(28,26,21,6,'My cat loved the dental cleaning service.'),(29,27,12,7,'Dog dental cleaning was thorough.'),(30,28,1,8,'Rabbit health check-up was very detailed.'),(31,29,2,9,'Bird health check-up was great.'),(32,30,3,10,'Cat sitting service was reliable.'),(33,31,6,11,'Dog sitting service was fantastic.'),(34,32,12,12,'Rabbit sitting service was wonderful.'),(35,33,5,13,'Cat transport service was smooth and safe.'),(36,34,12,14,'Dog transport service was efficient.'),(37,35,22,15,'Bird transport service was very good.'),(38,36,12,16,'Rabbit boarding service was excellent.'),(39,37,21,17,'Dog boarding service was the best.'),(40,38,23,18,'Cat boarding service was great.'),(41,39,21,19,'Pet grooming service was top notch.'),(42,40,30,20,'Overall excellent service for pets.');
/*!40000 ALTER TABLE `tbl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_feedback_reply`
--

DROP TABLE IF EXISTS `tbl_feedback_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_feedback_reply` (
  `feedback_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `content` tinytext,
  PRIMARY KEY (`id`),
  KEY `FKmd19xs9bys51fof3g2ga996qc` (`feedback_id`),
  KEY `FKkab2llbmnauo1mb1lxw0h1paw` (`user_id`),
  CONSTRAINT `FKkab2llbmnauo1mb1lxw0h1paw` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FKmd19xs9bys51fof3g2ga996qc` FOREIGN KEY (`feedback_id`) REFERENCES `tbl_feedback` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_feedback_reply`
--

LOCK TABLES `tbl_feedback_reply` WRITE;
/*!40000 ALTER TABLE `tbl_feedback_reply` DISABLE KEYS */;
INSERT INTO `tbl_feedback_reply` VALUES (NULL,1,NULL,'Thank you for your feedback!'),(NULL,2,NULL,'We are sorry to hear that.'),(1,3,1,'Thank you for your positive feedback! We are glad your dog enjoyed the grooming service.'),(2,4,2,'We appreciate your kind words! It was a pleasure grooming your cat.'),(23,5,3,'Thank you for choosing us for your rabbit grooming needs! We aim to provide top-rated service.'),(24,6,4,'We are thrilled to hear that you found our dog training to be the best in town! Thank you for your feedback.'),(25,7,5,'Thank you for letting us know! We strive to make our bird training effective and enjoyable.'),(26,8,6,'We are delighted to hear that your cat enjoyed the dental cleaning! Thank you for choosing us.'),(27,9,7,'Thank you for your feedback! We pride ourselves on thorough dog dental cleaning services.'),(28,10,8,'We are pleased to hear that you found our rabbit health check-up detailed. Thank you for your feedback.'),(29,11,9,'Thank you for your kind words! We aim to provide great bird health check-up services.'),(30,12,10,'We are glad you found our cat sitting service reliable! Thank you for choosing us.'),(31,13,11,'Thank you for your feedback! We are thrilled you found our dog sitting service fantastic.'),(32,14,12,'We are delighted you found our rabbit sitting service wonderful! Thank you for your kind words.'),(33,15,13,'We are glad to hear that the cat transport service went smoothly and safely. Thank you for your feedback.'),(34,16,14,'Thank you for letting us know! We aim to provide efficient dog transport services.'),(35,17,15,'We are pleased to hear that the bird transport service was very good! Thank you for your feedback.'),(36,18,16,'We are thrilled you found our rabbit boarding service excellent! Thank you for choosing us.'),(37,19,17,'Thank you for your kind words! We are delighted you found our dog boarding service the best.'),(38,20,18,'We are glad you found our cat boarding service great! Thank you for your feedback.'),(39,21,19,'Thank you for your positive feedback! We are thrilled you found our pet grooming service top-notch.'),(40,22,20,'We are pleased to hear that you had an excellent overall experience with our pet services. Thank you for your feedback.');
/*!40000 ALTER TABLE `tbl_feedback_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nomination`
--

DROP TABLE IF EXISTS `tbl_nomination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nomination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomination_type` tinyint DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ihi07x62cjun9y24bpf1g4wq` (`service_id`),
  KEY `FK26u2fajqq3432khw0jndefnr2` (`shop_id`),
  KEY `FK2nlumo6hh6adk0ebuhcxt8tav` (`user_id`),
  CONSTRAINT `FK26u2fajqq3432khw0jndefnr2` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `FK2nlumo6hh6adk0ebuhcxt8tav` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `FK7ihi07x62cjun9y24bpf1g4wq` FOREIGN KEY (`service_id`) REFERENCES `tbl_service` (`id`),
  CONSTRAINT `tbl_nomination_chk_1` CHECK ((`nomination_type` between 0 and 4))
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nomination`
--

LOCK TABLES `tbl_nomination` WRITE;
/*!40000 ALTER TABLE `tbl_nomination` DISABLE KEYS */;
INSERT INTO `tbl_nomination` VALUES (61,1,1,1,1),(158,1,2,2,2),(159,1,3,1,3),(160,1,24,3,4),(161,1,25,4,5),(162,1,26,5,7),(163,1,27,18,6),(164,1,28,19,8),(165,1,29,18,9),(166,1,30,11,10),(167,1,31,12,11),(168,1,32,13,12),(169,1,33,14,13),(170,1,34,15,14),(171,1,35,16,15),(172,1,36,17,16),(173,1,37,18,17),(174,1,38,19,18),(175,1,39,20,19);
/*!40000 ALTER TABLE `tbl_nomination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pet`
--

DROP TABLE IF EXISTS `tbl_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `pet_age` varchar(255) DEFAULT NULL,
  `pet_description` varchar(255) DEFAULT NULL,
  `pet_gender` varchar(255) DEFAULT NULL,
  `pet_name` varchar(255) DEFAULT NULL,
  `pet_note` varchar(255) DEFAULT NULL,
  `pet_photo` varchar(255) DEFAULT NULL,
  `pet_type` varchar(255) DEFAULT NULL,
  `pet_weight` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK45mompt0br9okobj5h0ewld8w` (`user_id`),
  CONSTRAINT `FK45mompt0br9okobj5h0ewld8w` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pet`
--

LOCK TABLES `tbl_pet` WRITE;
/*!40000 ALTER TABLE `tbl_pet` DISABLE KEYS */;
INSERT INTO `tbl_pet` VALUES (1,NULL,'2','Friendly dog','Male','Bobby','No special notes','bobby_photo.jpg','Dog','5kg'),(2,NULL,'3','Loves to climb','Female','Mittens','Needs special diet','mittens_photo.jpg','Cat','4kg'),(3,NULL,'1','Very active','Male','Nibbles','Loves carrots','nibbles_photo.jpg','Rabbit','1kg'),(4,1,'3','Golden Retriever, very friendly','Male','Buddy','Loves playing fetch','buddy.jpg','Dog','30.5'),(5,2,'2','Short-haired domestic cat','Female','Whiskers','Enjoys napping in the sun','whiskers.jpg','Cat','4.3'),(6,3,'1','Parakeet with green and yellow feathers','Male','Tweety','Sings in the morning','tweety.jpg','Bird','0.1'),(7,1,'4','Brown rabbit, very active','Female','Thumper','Loves carrots','thumper.jpg','Rabbit','2.5'),(8,4,'7','Older Labrador Retriever','Male','Max','Gentle and loves kids','max.jpg','Dog','35.0'),(9,2,'5','Grey tabby cat','Female','Luna','Curious and playful','luna.jpg','Cat','4.0'),(10,5,'3','Bearded Dragon','Male','Spike','Enjoys basking under the heat lamp','spike.jpg','Reptile','0.5'),(11,3,'1','Blue and gold Macaw','Female','Polly','Talkative and social','polly.jpg','Bird','1.0'),(12,1,'6','Golden Retriever, very playful','Male','Rocky','Loves the outdoors','rocky.jpg','Dog','32.0'),(13,2,'2','Sphynx cat, hairless','Female','Cleopatra','Affectionate and warm','cleo.jpg','Cat','3.5');
/*!40000 ALTER TABLE `tbl_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pet_booking`
--

DROP TABLE IF EXISTS `tbl_pet_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pet_booking` (
  `booking_id` int NOT NULL,
  `pet_id` int NOT NULL,
  KEY `FK9u2frslnab7v5gvchye65ap0n` (`booking_id`),
  KEY `FKhqcr7x9ettjfnsrex1omk9v8c` (`pet_id`),
  CONSTRAINT `FK9u2frslnab7v5gvchye65ap0n` FOREIGN KEY (`booking_id`) REFERENCES `tbl_booking` (`id`),
  CONSTRAINT `FKhqcr7x9ettjfnsrex1omk9v8c` FOREIGN KEY (`pet_id`) REFERENCES `tbl_pet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pet_booking`
--

LOCK TABLES `tbl_pet_booking` WRITE;
/*!40000 ALTER TABLE `tbl_pet_booking` DISABLE KEYS */;
INSERT INTO `tbl_pet_booking` VALUES (60,4),(61,5),(62,6),(63,7),(64,9),(65,11),(66,12),(67,13);
/*!40000 ALTER TABLE `tbl_pet_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_service`
--

DROP TABLE IF EXISTS `tbl_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `max_weight` double NOT NULL,
  `min_weight` double NOT NULL,
  `price` double NOT NULL,
  `service_category_id` int DEFAULT NULL,
  `shop_id` int DEFAULT NULL,
  `type_pet` tinyint DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqaajx1e2jxdhvd0pq9xb56utr` (`service_category_id`),
  KEY `FKpb8my32aa3tf89dygp5cwdrhd` (`shop_id`),
  CONSTRAINT `FKpb8my32aa3tf89dygp5cwdrhd` FOREIGN KEY (`shop_id`) REFERENCES `tbl_shop` (`id`),
  CONSTRAINT `FKqaajx1e2jxdhvd0pq9xb56utr` FOREIGN KEY (`service_category_id`) REFERENCES `tbl_service_category` (`id`),
  CONSTRAINT `tbl_service_chk_1` CHECK ((`type_pet` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_service`
--

LOCK TABLES `tbl_service` WRITE;
/*!40000 ALTER TABLE `tbl_service` DISABLE KEYS */;
INSERT INTO `tbl_service` VALUES (1,10,0,10,4,6,0,'Description for Service 1','Service 1','tag1 - tag2'),(2,15,0,15,4,6,1,'Description for Service 2','Service 2','tag3 - tag4'),(3,20,1,220,4,6,2,'Description for Service 33','Service 3','tag5 - tag6'),(4,2053,0,210,4,6,2,'Description for Service 33','Service 55','tag5 - tag6'),(5,2660,0,203,4,6,2,'Description for Service 323','Service 124','tag5 - tag6'),(24,50,5,29.99,1,1,1,'Grooming service for dogs of all breeds.','acs','zxc'),(25,20,1,19.99,1,2,1,'Basic grooming service for cats.','fff','asd'),(26,30,2,24.99,1,3,2,'Grooming service specifically for rabbits.','123','asds'),(27,40,5,34.99,2,4,1,'Advanced training course for dogs.','fasf','zxc'),(28,10,0.5,14.99,2,1,2,'Training service for various types of birds.','',''),(29,25,2,21.99,3,7,1,'Dental cleaning service for cats.','',''),(30,50,5,39.99,3,8,1,'Comprehensive dental cleaning for dogs.','asfasf','zxczc'),(31,30,2,27.99,4,9,2,'Health check-up for rabbits.','zxczc','zxczxc'),(32,15,0.5,18.99,4,10,2,'General health check-up for birds.','Bird Check-up','health,bird'),(33,20,1,22.99,5,11,1,'Pet sitting service for cats.','Cat Sitting','sitting,cat'),(34,50,5,29.99,5,2,1,'Pet sitting service for dogs.','Dog Sitting','sitting,dog'),(35,30,2,24.99,5,3,2,'Pet sitting service for rabbits.','Rabbit Sitting','sitting,rabbit'),(36,25,2,21.99,6,4,1,'Pet transportation service for cats.','Cat Transport','transport,cat'),(37,50,5,34.99,6,5,1,'Pet transportation service for dogs.','Dog Transport','transport,dog'),(38,20,1,19.99,6,6,2,'Pet transportation service for birds.','Bird Transport','transport,bird'),(39,30,2,24.99,7,7,2,'Boarding service for rabbits.','Rabbit Boarding','boarding,rabbit'),(40,50,5,39.99,7,18,1,'Boarding service for dogs.','Dog Boarding','boarding,dog'),(41,25,2,21.99,7,19,1,'Boarding service for cats.','Cat Boarding','boarding,cat');
/*!40000 ALTER TABLE `tbl_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_service_category`
--

DROP TABLE IF EXISTS `tbl_service_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_service_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_service_category`
--

LOCK TABLES `tbl_service_category` WRITE;
/*!40000 ALTER TABLE `tbl_service_category` DISABLE KEYS */;
INSERT INTO `tbl_service_category` VALUES (1,'Cate1','Description of cate 1'),(2,'Cate2','Description of cate 2'),(3,'Cate3','Description of cate 3'),(4,'Cate1','Description of cate 1'),(5,'Technology','All things related to technology.'),(6,'Science','Topics covering various scientific fields.'),(7,'Health','Health and wellness related information.'),(8,'Education','Educational resources and topics.'),(9,'Travel','Travel destinations and tips.'),(10,'Food','Recipes, cooking tips, and food culture.'),(11,'Sports','News and information about various sports.'),(12,'Finance','Financial advice and news.'),(13,'Entertainment','Movies, music, and entertainment news.'),(14,'Fashion','Fashion trends and clothing tips.'),(15,'Books','Book reviews and literary discussions.'),(16,'Art','Art galleries, exhibitions, and artist profiles.'),(17,'History','Historical events and figures.'),(18,'Nature','Information about wildlife and natural habitats.'),(19,'Politics','Political news and analysis.'),(20,'Business','Business trends and corporate news.'),(21,'Automotive','Car reviews and automotive industry news.'),(22,'Lifestyle','Tips and articles on lifestyle improvements.'),(23,'Parenting','Advice and stories for parents.'),(24,'DIY','Do-it-yourself projects and guides.');
/*!40000 ALTER TABLE `tbl_service_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shop`
--

DROP TABLE IF EXISTS `tbl_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_available` bit(1) NOT NULL,
  `total_services` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `close_time` datetime(6) DEFAULT NULL,
  `open_time` datetime(6) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `shop_address` varchar(255) DEFAULT NULL,
  `shop_email` varchar(255) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_phone` varchar(255) DEFAULT NULL,
  `shop_title` varchar(255) DEFAULT NULL,
  `shop_cover_image_url` tinytext,
  `shop_description` tinytext,
  `shop_profile_imange_url` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_olyxgwgdjanrgk2taokvldy9s` (`user_id`),
  CONSTRAINT `FKbacrtulngi7d4bsb1522bbxun` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shop`
--

LOCK TABLES `tbl_shop` WRITE;
/*!40000 ALTER TABLE `tbl_shop` DISABLE KEYS */;
INSERT INTO `tbl_shop` VALUES (1,_binary '',5,NULL,'2024-01-01 18:00:00.000000','2024-01-01 09:00:00.000000','Thu Duc City','123 Main St','shop1@example.com','Shop 1','1234567890','Shop 1 Title','coverImageUrl1','Description for Shop 1','profileImageUrl1'),(2,_binary '\0',8,NULL,'2024-01-01 19:00:00.000000','2024-01-01 10:00:00.000000','Sai Gon2','456 Elm St','shop2@example.com','Shop 2','0987654321','Shop 5 Title','coverImageUrl2','Description for Shop 2','profileImageUrl2'),(3,_binary '',8,NULL,'2024-01-01 19:00:00.000000','2024-01-01 10:00:00.000000','Sai Gon3','456 Elm St','shop2@example.com','Shop 3','0987654321','Shop 3 Title','123123','Description for Shop 3','profileImageUrl2'),(4,_binary '\0',8,NULL,'2024-01-01 19:00:00.000000','2024-01-01 10:00:00.000000','Sai Gon5','456 Elm St','shop2@example.com','Shop 4','0987654321','Shop 2 Title','123','Description for Shop 4','123123zxc'),(5,_binary '\0',8,NULL,'2024-01-01 19:00:00.000000','2024-01-01 10:00:00.000000','Sai Gon5','456 Elm St','shop2@example.com','Shop 5','0987654321','Shop 2 Title','123','Description for Shop 4','123123zxc'),(6,_binary '',5,NULL,'2024-01-01 18:00:00.000000','2024-01-01 09:00:00.000000','Thu Duc City','123 Main St','shop1@example.com','Shop 1','1234567890','Shop 1 Title','coverImageUrl1','Description for Shop 1','profileImageUrl1'),(7,_binary '',5,1,'2024-06-01 18:00:00.000000','2024-06-01 09:00:00.000000','Thu Duc City','123 Main St','shop1@example.com','Shop 1','1234567890','Shop 1 Title','coverImageUrl1','Description for Shop 1','profileImageUrl1'),(8,_binary '\0',8,2,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon2','456 Elm St','shop2@example.com','Shop 2','0987654321','Shop 2 Title','coverImageUrl2','Description for Shop 2','profileImageUrl2'),(9,_binary '',8,3,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon3','789 Oak St','shop3@example.com','Shop 3','0987654322','Shop 3 Title','coverImageUrl3','Description for Shop 3','profileImageUrl3'),(10,_binary '\0',8,4,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon4','101 Pine St','shop4@example.com','Shop 4','0987654323','Shop 4 Title','coverImageUrl4','Description for Shop 4','profileImageUrl4'),(11,_binary '\0',8,5,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon5','202 Birch St','shop5@example.com','Shop 5','0987654324','Shop 5 Title','coverImageUrl5','Description for Shop 5','profileImageUrl5'),(12,_binary '',5,6,'2024-06-01 18:00:00.000000','2024-06-01 09:00:00.000000','Thu Duc City','303 Cedar St','shop6@example.com','Shop 6','1234567891','Shop 6 Title','coverImageUrl6','Description for Shop 6','profileImageUrl6'),(13,_binary '',6,7,'2024-06-01 18:30:00.000000','2024-06-01 09:30:00.000000','Sai Gon6','404 Maple St','shop7@example.com','Shop 7','1234567892','Shop 7 Title','coverImageUrl7','Description for Shop 7','profileImageUrl7'),(14,_binary '\0',7,8,'2024-06-01 19:30:00.000000','2024-06-01 10:30:00.000000','Thu Duc City','505 Walnut St','shop8@example.com','Shop 8','1234567893','Shop 8 Title','coverImageUrl8','Description for Shop 8','profileImageUrl8'),(15,_binary '',4,9,'2024-06-01 17:00:00.000000','2024-06-01 08:00:00.000000','Sai Gon7','606 Willow St','shop9@example.com','Shop 9','1234567894','Shop 9 Title','coverImageUrl9','Description for Shop 9','profileImageUrl9'),(16,_binary '\0',3,10,'2024-06-01 16:00:00.000000','2024-06-01 07:00:00.000000','Sai Gon8','707 Poplar St','shop10@example.com','Shop 10','1234567895','Shop 10 Title','coverImageUrl10','Description for Shop 10','profileImageUrl10'),(17,_binary '',5,11,'2024-06-01 18:00:00.000000','2024-06-01 09:00:00.000000','Thu Duc City','808 Cherry St','shop11@example.com','Shop 11','1234567896','Shop 11 Title','coverImageUrl11','Description for Shop 11','profileImageUrl11'),(18,_binary '\0',8,12,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon9','909 Elm St','shop12@example.com','Shop 12','1234567897','Shop 12 Title','coverImageUrl12','Description for Shop 12','profileImageUrl12'),(19,_binary '',8,13,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon10','1010 Oak St','shop13@example.com','Shop 13','1234567898','Shop 13 Title','coverImageUrl13','Description for Shop 13','profileImageUrl13'),(20,_binary '\0',8,14,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon11','1111 Pine St','shop14@example.com','Shop 14','1234567899','Shop 14 Title','coverImageUrl14','Description for Shop 14','profileImageUrl14'),(21,_binary '\0',8,15,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon12','1212 Birch St','shop15@example.com','Shop 15','1234567900','Shop 15 Title','coverImageUrl15','Description for Shop 15','profileImageUrl15'),(22,_binary '',5,16,'2024-06-01 18:00:00.000000','2024-06-01 09:00:00.000000','Thu Duc City','1313 Cedar St','shop16@example.com','Shop 16','1234567901','Shop 16 Title','coverImageUrl16','Description for Shop 16','profileImageUrl16'),(23,_binary '',6,17,'2024-06-01 18:30:00.000000','2024-06-01 09:30:00.000000','Sai Gon13','1414 Maple St','shop17@example.com','Shop 17','1234567902','Shop 17 Title','coverImageUrl17','Description for Shop 17','profileImageUrl17'),(24,_binary '\0',7,18,'2024-06-01 19:30:00.000000','2024-06-01 10:30:00.000000','Thu Duc City','505 Walnut St','shop18@example.com','Shop 18','1234567903','Shop 18 Title','coverImageUrl18','Description for Shop 18','profileImageUrl18'),(25,_binary '',4,19,'2024-06-01 17:00:00.000000','2024-06-01 08:00:00.000000','Sai Gon14','606 Willow St','shop19@example.com','Shop 19','1234567904','Shop 19 Title','coverImageUrl19','Description for Shop 19','profileImageUrl19'),(26,_binary '\0',3,20,'2024-06-01 16:00:00.000000','2024-06-01 07:00:00.000000','Sai Gon15','707 Poplar St','shop20@example.com','Shop 20','1234567905','Shop 20 Title','coverImageUrl20','Description for Shop 20','profileImageUrl20'),(27,_binary '',5,21,'2024-06-01 18:00:00.000000','2024-06-01 09:00:00.000000','Thu Duc City','808 Cherry St','shop21@example.com','Shop 21','1234567906','Shop 21 Title','coverImageUrl21','Description for Shop 21','profileImageUrl21'),(28,_binary '\0',8,22,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon9','909 Elm St','shop22@example.com','Shop 22','1234567907','Shop 22 Title','coverImageUrl22','Description for Shop 22','profileImageUrl22'),(29,_binary '',8,23,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon10','1010 Oak St','shop23@example.com','Shop 23','1234567908','Shop 23 Title','coverImageUrl23','Description for Shop 23','profileImageUrl23'),(30,_binary '\0',8,24,'2024-06-01 19:00:00.000000','2024-06-01 10:00:00.000000','Sai Gon11','1111 Pine St','shop24@example.com','Shop 24','1234567909','Shop 24 Title','coverImageUrl24','Description for Shop 24','profileImageUrl24');
/*!40000 ALTER TABLE `tbl_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_time_slot`
--

DROP TABLE IF EXISTS `tbl_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_time_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `end_local_date_time` datetime(6) DEFAULT NULL,
  `start_local_date_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_time_slot`
--

LOCK TABLES `tbl_time_slot` WRITE;
/*!40000 ALTER TABLE `tbl_time_slot` DISABLE KEYS */;
INSERT INTO `tbl_time_slot` VALUES (1,'2024-05-27 10:00:00.000000','2024-05-27 09:00:00.000000'),(2,'2024-05-27 11:00:00.000000','2024-05-27 10:00:00.000000'),(3,'2024-05-27 12:00:00.000000','2024-05-27 11:00:00.000000'),(4,'2024-05-27 10:00:00.000000','2024-05-27 09:00:00.000000'),(5,'2024-05-27 11:00:00.000000','2024-05-27 10:00:00.000000'),(6,'2024-05-27 12:00:00.000000','2024-05-27 11:00:00.000000'),(7,'2024-05-27 13:00:00.000000','2024-05-27 12:00:00.000000'),(8,'2024-05-27 14:00:00.000000','2024-05-27 13:00:00.000000'),(9,'2024-05-27 15:00:00.000000','2024-05-27 14:00:00.000000'),(10,'2024-05-27 16:00:00.000000','2024-05-27 15:00:00.000000'),(11,'2024-05-27 17:00:00.000000','2024-05-27 16:00:00.000000'),(12,'2024-05-27 18:00:00.000000','2024-05-27 17:00:00.000000'),(13,'2024-05-27 19:00:00.000000','2024-05-27 18:00:00.000000'),(14,'2024-05-27 20:00:00.000000','2024-05-27 19:00:00.000000'),(15,'2024-05-27 21:00:00.000000','2024-05-27 20:00:00.000000'),(16,'2024-05-27 22:00:00.000000','2024-05-27 21:00:00.000000'),(17,'2024-05-27 23:00:00.000000','2024-05-27 22:00:00.000000'),(18,'2024-05-28 00:00:00.000000','2024-05-27 23:00:00.000000'),(19,'2024-05-28 01:00:00.000000','2024-05-28 00:00:00.000000'),(20,'2024-05-28 02:00:00.000000','2024-05-28 01:00:00.000000'),(21,'2024-05-28 03:00:00.000000','2024-05-28 02:00:00.000000'),(22,'2024-05-28 04:00:00.000000','2024-05-28 03:00:00.000000'),(23,'2024-05-28 05:00:00.000000','2024-05-28 04:00:00.000000');
/*!40000 ALTER TABLE `tbl_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `birthday` date DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `role` tinyint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cover_image_url` tinytext,
  `profile_image_url` tinytext,
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_user_chk_1` CHECK ((`role` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES ('2003-02-05',1,0,'admin@example.com','Admin','User','admin','012333333','admin',NULL,NULL),('2003-02-05',2,1,'customer@example.com','Customer','User','customer','012333333','customer',NULL,NULL),('2023-02-03',3,2,'owner@example.com','Shop','Owner','shop_owner','012333333','shop_owner',NULL,NULL),('2003-02-05',4,1,'1233@example.com','T','D','1233','012312333333','thoai',NULL,NULL),('1991-01-01',5,1,'user1@example.com','Alice','Smith','password1','0123456701','alice_smith','1231232',NULL),('1985-02-02',6,2,'user2@example.com','Bob','Johnson','password2','0123456702','bob_johnson',NULL,NULL),('1978-03-03',7,1,'user3@example.com','Charlie','Williams','password3','0123456703','charlie_williams',NULL,NULL),('1990-04-04',8,2,'user4@example.com','David','Brown','password4','0123456704','david_brown',NULL,NULL),('1982-05-05',9,1,'user5@example.com','Eva','Jones','password5','0123456705','eva_jones',NULL,NULL),('1987-06-06',10,0,'user6@example.com','Frank','Garcia','password6','0123456706','frank_garcia',NULL,NULL),('1975-07-07',11,1,'user7@example.com','Grace','Martinez','password7','0123456707','grace_martinez',NULL,NULL),('1993-08-08',12,0,'user8@example.com','Hank','Robinson','password8','0123456708','hank_robinson',NULL,NULL),('2039-09-09',13,1,'user9@example.com','Nay','Mana','password9','0123456709','123',NULL,NULL),('1989-09-09',14,1,'user9@example.com','Basy','Clark','password9','0123456709','zxczxc',NULL,NULL),('1989-09-09',15,2,'user9@example.com','Sory','tat','password9','0123456709','ffff',NULL,NULL),('1989-09-09',16,2,'user9@example.com','Nas','Cas','password9','0123456709','asd',NULL,NULL),('1989-09-09',17,2,'user9@example.com','oke','123','password9','0123456709','muadongcodon',NULL,NULL),('1989-09-09',18,2,'user9@example.com','Thoai','zxc','password9','0123456709','muadongcodon1',NULL,NULL),('1989-09-09',19,2,'user9@example.com','dasd','zxcb','password9','0123456709','muadongcodon2',NULL,NULL),('1989-09-09',20,2,'user9@example.com','Izxc','qtwt','password9','0123456709','muadongcodon3',NULL,NULL),('1989-09-09',21,1,'user9@example.com','asd','qwt','password9','0123456709','muadongcodon4',NULL,NULL),('1989-09-09',22,1,'user9@example.com','DD','qwt','password9','0123456709','muadongcodon5',NULL,NULL),('1989-09-09',23,1,'user9@example.com','ASD','Claqwtrk','password9','0123456709','muadongcodon6',NULL,NULL),('1983-10-10',24,1,'user10@example.com','Jack','Rodriguez','password10','0123456710','jack_rodriguez',NULL,NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27 20:29:03
