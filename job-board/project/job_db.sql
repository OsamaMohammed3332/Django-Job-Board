-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: job_db
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `accounts_city`
--

DROP TABLE IF EXISTS `accounts_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_city`
--

LOCK TABLES `accounts_city` WRITE;
/*!40000 ALTER TABLE `accounts_city` DISABLE KEYS */;
INSERT INTO `accounts_city` VALUES (1,'Bani Suef');
/*!40000 ALTER TABLE `accounts_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_profile_city_id_267b3d7f_fk_accounts_city_id` (`city_id`),
  CONSTRAINT `accounts_profile_city_id_267b3d7f_fk_accounts_city_id` FOREIGN KEY (`city_id`) REFERENCES `accounts_city` (`id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'','',NULL,2),(2,'','',NULL,3),(3,'+201129862300','profile/186496849_2908390839418378_1994429616001981062_n_ROsFlXl.jpg',1,1);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add j ob',7,'add_job'),(26,'Can change j ob',7,'change_job'),(27,'Can delete j ob',7,'delete_job'),(28,'Can view j ob',7,'view_job'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add apply_job',9,'add_apply_job'),(34,'Can change apply_job',9,'change_apply_job'),(35,'Can delete apply_job',9,'delete_apply_job'),(36,'Can view apply_job',9,'view_apply_job'),(37,'Can add city',10,'add_city'),(38,'Can change city',10,'change_city'),(39,'Can delete city',10,'delete_city'),(40,'Can view city',10,'view_city'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile'),(45,'Can add info',12,'add_info'),(46,'Can change info',12,'change_info'),(47,'Can delete info',12,'delete_info'),(48,'Can view info',12,'view_info'),(49,'Can add Token',13,'add_token'),(50,'Can change Token',13,'change_token'),(51,'Can delete Token',13,'delete_token'),(52,'Can view Token',13,'view_token'),(53,'Can add token',14,'add_tokenproxy'),(54,'Can change token',14,'change_tokenproxy'),(55,'Can delete token',14,'delete_tokenproxy'),(56,'Can view token',14,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$tb2uvGVnb7Sy2KJKkcJVgK$ks8WKpa7hURnAcS/5YWyeNh+xSLsWA3kN3q1m4MiPm0=','2021-11-17 14:53:47.488105',1,'osama','os','','osamamhmed2223@gmail.com',1,1,'2021-09-08 11:59:41.000000'),(2,'pbkdf2_sha256$260000$hNh6JkUGKCchJQuN5UjYXP$cUHmWdqNM6RPFN8iJ6GNWzTmPtTORy33iqEw7qVAFus=',NULL,0,'osama11565','','','',0,1,'2021-09-20 12:27:04.018373'),(3,'pbkdf2_sha256$260000$liqbRilBu4AylRYH7juxik$VyZN4QkOW7BCz7eRT833h9+SL5I3S2tRoe+pf+4CteI=','2021-09-20 13:13:55.710849',0,'ahmed','','','ahmed1232@gmail.com',0,1,'2021-09-20 13:13:55.092392');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('27dde469667c46da68b26db99ac4e93c64579f99','2021-11-04 12:09:48.717006',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `place` varchar(50) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'Egypt-Bani Suef','+201129862300','osamamhmed2223@gmail.com');
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-08 12:49:44.846014','1','Category object (1)',1,'[{\"added\": {}}]',8,1),(2,'2021-09-08 14:25:23.506037','1','developer',1,'[{\"added\": {}}]',7,1),(3,'2021-09-08 15:19:23.839982','1','developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(4,'2021-09-09 12:16:10.575093','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(5,'2021-09-09 12:16:43.260712','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(6,'2021-09-09 12:17:53.790129','2','django developer',1,'[{\"added\": {}}]',7,1),(7,'2021-09-09 12:18:21.786897','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',7,1),(8,'2021-09-09 13:13:02.121823','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',7,1),(9,'2021-09-09 13:13:13.903735','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Salary\"]}}]',7,1),(10,'2021-09-09 15:23:49.772139','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(11,'2021-09-09 15:23:55.802292','1','Web developer',2,'[]',7,1),(12,'2021-09-09 15:24:02.597037','2','Django developer',2,'[]',7,1),(13,'2021-09-12 11:32:27.041268','1','osama',3,'',9,1),(14,'2021-09-12 11:34:36.369560','2','osama',3,'',9,1),(15,'2021-09-20 12:27:04.381878','2','osama11565',1,'[{\"added\": {}}]',4,1),(16,'2021-09-20 14:25:51.236049','3','osama',1,'[{\"added\": {}}]',11,1),(17,'2021-09-22 14:41:39.702931','1','City object (1)',1,'[{\"added\": {}}]',10,1),(18,'2021-10-10 11:18:24.373228','4','python',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(19,'2021-10-10 11:20:17.397422','3','FLask developer',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(20,'2021-10-10 11:20:26.076253','2','Django developer',2,'[]',7,1),(21,'2021-10-10 11:20:41.279334','1','Web developer',2,'[]',7,1),(22,'2021-10-10 11:22:22.030526','2','Mobile develpment',1,'[{\"added\": {}}]',8,1),(23,'2021-10-10 11:22:42.359486','2','Mobile Develpment',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(24,'2021-10-10 11:22:58.592466','2','Mobile Development',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(25,'2021-10-10 11:24:42.081022','5','Flutter',1,'[{\"added\": {}}]',7,1),(26,'2021-10-10 15:27:40.068345','1','osamamhmed3332@gmail.com',1,'[{\"added\": {}}]',12,1),(27,'2021-10-11 13:55:45.366459','1','osamamhmed2223@gmail.com',2,'[{\"changed\": {\"fields\": [\"Email\"]}}]',12,1),(28,'2021-10-14 10:58:20.928656','1','Web developer',2,'[]',7,1),(29,'2021-10-14 10:58:55.906163','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(30,'2021-10-14 10:59:36.386993','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(31,'2021-10-14 11:02:50.046882','1','Web developer',2,'[]',7,1),(32,'2021-10-14 11:16:57.750397','4','python',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(33,'2021-10-14 11:17:02.850532','3','FLask developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(34,'2021-10-14 11:17:08.050785','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(35,'2021-10-14 11:17:15.129751','2','Django developer',2,'[]',7,1),(36,'2021-10-14 11:17:19.809036','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(37,'2021-10-14 11:17:24.263074','5','Flutter',2,'[]',7,1),(38,'2021-10-14 11:17:33.059982','3','FLask developer',2,'[]',7,1),(39,'2021-10-14 11:17:36.690421','2','Django developer',2,'[]',7,1),(40,'2021-10-14 11:17:40.030323','1','Web developer',2,'[]',7,1),(41,'2021-10-14 11:20:13.762726','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(42,'2021-10-14 11:20:22.553323','2','Django developer',2,'[]',7,1),(43,'2021-10-14 11:26:53.526036','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(44,'2021-10-14 11:30:38.609222','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(45,'2021-10-14 11:30:53.804883','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(46,'2021-10-14 11:30:57.700663','2','Django developer',2,'[]',7,1),(47,'2021-10-14 11:31:00.588560','1','Web developer',2,'[]',7,1),(48,'2021-10-14 11:31:14.878526','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(49,'2021-10-14 11:31:19.507830','1','Web developer',2,'[]',7,1),(50,'2021-10-14 11:41:46.944020','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(51,'2021-10-14 11:42:04.279872','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(52,'2021-10-14 11:51:30.195138','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(53,'2021-10-14 11:51:46.267227','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(54,'2021-10-14 11:53:22.530522','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(55,'2021-10-14 11:53:34.205291','3','FLask developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(56,'2021-10-14 12:03:17.895270','6','django',1,'[{\"added\": {}}]',7,1),(57,'2021-10-14 12:03:48.592582','6','django',3,'',7,1),(58,'2021-10-14 12:56:13.040975','3','rdujhdrf',1,'[{\"added\": {}}]',8,1),(59,'2021-10-14 12:56:22.200198','4','dxjhmkdjmk',1,'[{\"added\": {}}]',8,1),(60,'2021-10-14 12:56:33.599599','4','dxjhmkdjmk',3,'',8,1),(61,'2021-10-14 12:56:33.608206','3','rdujhdrf',3,'',8,1),(62,'2021-10-14 13:45:49.324900','3','osama',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',11,1),(63,'2021-10-14 13:46:48.444952','3','osama',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',11,1),(64,'2021-10-14 13:47:42.926208','5','Flutter',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(65,'2021-10-14 13:48:06.376578','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(66,'2021-10-14 13:50:05.172580','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(67,'2021-10-14 13:50:14.801315','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(68,'2021-10-14 13:50:23.662846','1','Web developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(69,'2021-10-14 13:51:00.667607','3','FLask developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(70,'2021-10-14 13:51:13.505121','3','FLask developer',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(71,'2021-10-14 13:51:21.026338','4','python',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',7,1),(72,'2021-10-14 13:54:09.354843','2','Django developer',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(73,'2021-10-14 13:54:14.836832','1','Web developer',2,'[]',7,1),(74,'2021-10-24 14:10:02.918641','7','Yes',3,'',7,1),(75,'2021-10-24 14:17:09.582658','10','Testdjdj',3,'',7,1),(76,'2021-10-24 14:17:09.663609','9','Testdjdj',3,'',7,1),(77,'2021-10-24 14:17:09.672602','8','Testdjdj',3,'',7,1),(78,'2021-10-24 14:18:15.285867','11','Testdjdj',3,'',7,1),(79,'2021-10-24 14:20:22.520688','12','Test',3,'',7,1),(80,'2021-11-01 18:14:15.412685','3','dfxnjdxcng',3,'',9,1),(81,'2021-11-01 18:35:15.748230','4','agraswegr',3,'',9,1),(82,'2021-11-02 14:39:18.390434','4','osamamhmed3332@gmail.com',3,'',12,1),(83,'2021-11-02 14:39:18.405422','3','osamamhmed3332@gmail.com',3,'',12,1),(84,'2021-11-02 14:39:18.417416','2','osamamhmed3332@gmail.com',3,'',12,1),(85,'2021-11-03 12:52:23.696612','4','Test',3,'',11,1),(86,'2021-11-03 12:52:48.089820','4','Test',3,'',4,1),(87,'2021-11-03 14:02:06.352172','5','osamatestuser',3,'',4,1),(88,'2021-11-04 12:12:34.012238','6','Test',3,'',4,1),(89,'2021-11-10 19:58:40.343075','7','osama_test',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(90,'2021-11-10 20:24:42.281721','7','osama_test',3,'',4,1),(91,'2021-11-11 19:16:17.631001','1','osama',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(92,'2021-11-20 14:36:27.488695','18','djnnddj',3,'',7,1),(93,'2021-11-20 14:36:27.510412','17','djnnddj',3,'',7,1),(94,'2021-11-20 14:36:27.517070','16','djnnddj',3,'',7,1),(95,'2021-11-20 14:36:27.525076','13','Test',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'accounts','city'),(11,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'authtoken','token'),(14,'authtoken','tokenproxy'),(12,'contact','info'),(5,'contenttypes','contenttype'),(9,'job','apply_job'),(8,'job','category'),(7,'job','job'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-08 11:58:28.323380'),(2,'auth','0001_initial','2021-09-08 11:58:29.916798'),(3,'admin','0001_initial','2021-09-08 11:58:30.545057'),(4,'admin','0002_logentry_remove_auto_add','2021-09-08 11:58:30.577445'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-08 11:58:30.625445'),(6,'contenttypes','0002_remove_content_type_name','2021-09-08 11:58:30.986260'),(7,'auth','0002_alter_permission_name_max_length','2021-09-08 11:58:31.320448'),(8,'auth','0003_alter_user_email_max_length','2021-09-08 11:58:31.407291'),(9,'auth','0004_alter_user_username_opts','2021-09-08 11:58:31.431287'),(10,'auth','0005_alter_user_last_login_null','2021-09-08 11:58:31.600391'),(11,'auth','0006_require_contenttypes_0002','2021-09-08 11:58:31.619420'),(12,'auth','0007_alter_validators_add_error_messages','2021-09-08 11:58:31.643417'),(13,'auth','0008_alter_user_username_max_length','2021-09-08 11:58:31.796845'),(14,'auth','0009_alter_user_last_name_max_length','2021-09-08 11:58:32.012483'),(15,'auth','0010_alter_group_name_max_length','2021-09-08 11:58:32.234576'),(16,'auth','0011_update_proxy_permissions','2021-09-08 11:58:32.295522'),(17,'auth','0012_alter_user_first_name_max_length','2021-09-08 11:58:32.550965'),(18,'sessions','0001_initial','2021-09-08 11:58:32.689228'),(19,'job','0001_initial','2021-09-08 12:38:07.896324'),(20,'job','0002_category','2021-09-08 12:47:44.484865'),(21,'job','0003_job_category','2021-09-08 12:48:44.979812'),(22,'job','0004_job_photo','2021-09-08 15:15:21.219105'),(23,'job','0005_alter_job_photo','2021-09-08 15:18:57.780613'),(24,'job','0006_job_slug','2021-09-09 15:17:40.035934'),(25,'job','0007_apply_job','2021-09-09 15:59:01.868927'),(26,'job','0008_alter_apply_job_website','2021-09-12 11:00:38.323056'),(27,'job','0009_alter_apply_job_website','2021-09-12 11:08:59.919369'),(28,'job','0010_alter_apply_job_website','2021-09-12 11:26:33.874523'),(29,'job','0011_job_owner','2021-09-14 15:11:18.823081'),(30,'accounts','0001_initial','2021-09-20 12:20:54.607301'),(31,'accounts','0002_alter_profile_phone_number','2021-09-20 14:23:53.809121'),(32,'contact','0001_initial','2021-10-10 15:23:11.853961'),(33,'job','0012_alter_job_owner','2021-10-14 12:01:27.000946'),(34,'job','0013_alter_job_owner','2021-10-14 12:02:20.110920'),(35,'job','0014_auto_20211101_2017','2021-11-01 18:17:21.079251'),(36,'authtoken','0001_initial','2021-11-04 11:43:40.072030'),(37,'authtoken','0002_auto_20160226_1747','2021-11-04 11:43:40.176385'),(38,'authtoken','0003_tokenproxy','2021-11-04 11:43:40.184407');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1h804g5ni76g8i72y0rpbr7wr0fpun2x','.eJxVjEsOwiAUAO_C2hCgfF267xkI7z2QqqFJaVfGuxuSLnQ7M5k3i-nYazx63uJC7Moku_wySPjMbQh6pHZfOa5t3xbgI-Gn7XxeKb9uZ_s3qKnXsU0TKAdkMXghoCAJ7ZxXTmYPRgQ7BUQlSwZSNiitCxgwqNBKoITEPl_iXzhV:1mT4WP:2S0v7hrSH48JwJOOr62QqdgQS2_C_N-YvQgwQS2vLNE','2021-10-06 15:50:57.708571'),('o61hv3s127zqqdl4olf9mr56ow1dx74x','.eJxVjEsOwiAUAO_C2hCgfF267xkI7z2QqqFJaVfGuxuSLnQ7M5k3i-nYazx63uJC7Moku_wySPjMbQh6pHZfOa5t3xbgI-Gn7XxeKb9uZ_s3qKnXsU0TKAdkMXghoCAJ7ZxXTmYPRgQ7BUQlSwZSNiitCxgwqNBKoITEPl_iXzhV:1mZvxs:wSbDaiDg1OictTBcn5pARn9nEiVeNMy6e-OxEXvUaas','2021-10-25 14:07:40.441164');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_apply_job`
--

DROP TABLE IF EXISTS `job_apply_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_apply_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL,
  `website` varchar(200) NOT NULL,
  `cv` varchar(100) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `job_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_apply_job_job_id_60600514_fk_job_job_id` (`job_id`),
  KEY `job_apply_job_user_id_6325b314_fk_auth_user_id` (`user_id`),
  CONSTRAINT `job_apply_job_job_id_60600514_fk_job_job_id` FOREIGN KEY (`job_id`) REFERENCES `job_job` (`id`),
  CONSTRAINT `job_apply_job_user_id_6325b314_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_apply_job`
--

LOCK TABLES `job_apply_job` WRITE;
/*!40000 ALTER TABLE `job_apply_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_apply_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category`
--

LOCK TABLES `job_category` WRITE;
/*!40000 ALTER TABLE `job_category` DISABLE KEYS */;
INSERT INTO `job_category` VALUES (1,'Web Development'),(2,'Mobile Development');
/*!40000 ALTER TABLE `job_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_job`
--

DROP TABLE IF EXISTS `job_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `job_type` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `published_at` datetime(6) NOT NULL,
  `vacancy` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `experience` int DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_job_category_id_555b6898_fk_job_category_id` (`category_id`),
  KEY `job_job_slug_1de62f0e` (`slug`),
  KEY `job_job_owner_id_d5c16855_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `job_job_category_id_555b6898_fk_job_category_id` FOREIGN KEY (`category_id`) REFERENCES `job_category` (`id`),
  CONSTRAINT `job_job_owner_id_d5c16855_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_job`
--

LOCK TABLES `job_job` WRITE;
/*!40000 ALTER TABLE `job_job` DISABLE KEYS */;
INSERT INTO `job_job` VALUES (1,'Web developer','Full Time','know any framework ..','2021-10-14 13:54:14.834835',1,10,1,1,'photo/1_oAbM3ph.png','web-developer',1),(2,'Django developer','Part Time','know django framework and the basics of the front end','2021-10-14 13:54:09.352845',4,20,1,1,'photo/2_T8PvcNL.png','django-developer',1),(3,'FLask developer','Full Time','Flask developer beginner','2021-10-14 13:51:13.500123',1,20,1,1,'photo/3_36C2tsy.jpg','flask-developer',1),(4,'python','Full Time','python mid-level','2021-10-14 13:51:21.020342',1,20,1,1,'photo/4.jpg','python',1),(5,'Flutter','Part Time','Beginner or above in flutter','2021-10-14 13:47:42.919212',4,50,1,2,'photo/5.png','flutter',1);
/*!40000 ALTER TABLE `job_job` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 13:56:19
