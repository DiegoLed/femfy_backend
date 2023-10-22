CREATE DATABASE  IF NOT EXISTS `femfy_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `femfy_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: femfy_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `calendar_event`
--

DROP TABLE IF EXISTS `calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_event` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hour_alert` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9l1dwq2g3oibf8s7dnhakuyox` (`user_id`),
  CONSTRAINT `FK9l1dwq2g3oibf8s7dnhakuyox` FOREIGN KEY (`user_id`) REFERENCES `data_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cycle`
--

DROP TABLE IF EXISTS `cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_beging` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `days_of_bleeding` int DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_user`
--

DROP TABLE IF EXISTS `data_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `mail_address` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_suscriptor` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `type_user_id` bigint DEFAULT NULL,
  `emotion` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_42112b4g2r7mu4l0yjbn48f77` (`mail_address`),
  KEY `FK7s0t2p3ydd99bn652gm3pm43x` (`type_user_id`),
  CONSTRAINT `FK7s0t2p3ydd99bn652gm3pm43x` FOREIGN KEY (`type_user_id`) REFERENCES `type_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fileuser`
--

DROP TABLE IF EXISTS `fileuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fileuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `study_date` date DEFAULT NULL,
  `tipo_estudios_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd62qx67v4phc9k36b32ofs7fj` (`tipo_estudios_id`),
  CONSTRAINT `FKd62qx67v4phc9k36b32ofs7fj` FOREIGN KEY (`tipo_estudios_id`) REFERENCES `type_study` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions_user_family_history`
--

DROP TABLE IF EXISTS `questions_user_family_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_user_family_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `breast_cancer` bit(1) NOT NULL,
  `early_menopause` bit(1) NOT NULL,
  `endometriosis` bit(1) NOT NULL,
  `ovarian_cancer` bit(1) NOT NULL,
  `sop` bit(1) NOT NULL,
  `uterine_fibroids` bit(1) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfyok0ie2fvark8hhmhbe6iqru` (`user_id`),
  CONSTRAINT `FKfyok0ie2fvark8hhmhbe6iqru` FOREIGN KEY (`user_id`) REFERENCES `data_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions_user_menopause`
--

DROP TABLE IF EXISTS `questions_user_menopause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_user_menopause` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `weight_gain` bit(1) DEFAULT NULL,
  `changes_in_libido` bit(1) DEFAULT NULL,
  `changes_in_menstrual_cycle` bit(1) DEFAULT NULL,
  `changes_in_skin_and_hair` bit(1) DEFAULT NULL,
  `loss_of_bone_density` bit(1) DEFAULT NULL,
  `mood_changes` bit(1) DEFAULT NULL,
  `sleeping_difficulties` bit(1) DEFAULT NULL,
  `suffocation` bit(1) DEFAULT NULL,
  `vaginal_dryness` bit(1) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK22l4f0rrx5kidswtl7vxqsmf2` (`user_id`),
  CONSTRAINT `FK22l4f0rrx5kidswtl7vxqsmf2` FOREIGN KEY (`user_id`) REFERENCES `data_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions_user_menstruation`
--

DROP TABLE IF EXISTS `questions_user_menstruation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions_user_menstruation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bleeding_duration` int DEFAULT NULL,
  `last_cycle_duration` int DEFAULT NULL,
  `last_time` date DEFAULT NULL,
  `regular` bit(1) DEFAULT NULL,
  `regular_cycle_duration` int DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ix4up40ngehmy12majbbhtq5` (`user_id`),
  CONSTRAINT `FK4ix4up40ngehmy12majbbhtq5` FOREIGN KEY (`user_id`) REFERENCES `data_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_study`
--

DROP TABLE IF EXISTS `type_study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_study` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_user`
--

DROP TABLE IF EXISTS `type_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `age` int DEFAULT NULL,
  `mail_address` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cw136w82vjjt62ctv6sp91e8j` (`mail_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-21 23:32:09
