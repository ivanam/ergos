-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ergos
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-05-24 20:06:29','2018-05-24 20:06:29');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga_diaria`
--

DROP TABLE IF EXISTS `carga_diaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carga_diaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `tipo_objetivo_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_diaria`
--

LOCK TABLES `carga_diaria` WRITE;
/*!40000 ALTER TABLE `carga_diaria` DISABLE KEYS */;
INSERT INTO `carga_diaria` VALUES (1,'2018-05-28',8,4,2,'2018-05-31 16:44:25','2018-05-31 16:44:25'),(2,'2018-05-28',5,5,2,'2018-05-31 16:44:25','2018-05-31 16:44:25'),(3,'2018-05-28',6,7,2,'2018-05-31 16:44:25','2018-05-31 16:44:25'),(4,'2018-05-01',5,4,2,'2018-05-31 16:45:27','2018-05-31 16:45:27'),(5,'2018-05-01',5,5,2,'2018-05-31 16:45:27','2018-05-31 16:45:27'),(6,'2018-05-01',6,7,2,'2018-05-31 16:45:27','2018-05-31 16:45:27'),(7,'2018-04-02',5,4,2,'2018-05-31 16:45:52','2018-05-31 16:45:52'),(8,'2018-04-02',4,5,2,'2018-05-31 16:45:52','2018-05-31 16:45:52'),(9,'2018-04-02',5,7,2,'2018-05-31 16:45:52','2018-05-31 16:45:52'),(10,'2018-06-07',7,4,2,'2018-05-31 16:46:12','2018-05-31 16:46:12'),(11,'2018-05-31',5,4,2,'2018-05-31 17:55:01','2018-05-31 17:55:01'),(12,'2018-05-31',6,5,2,'2018-05-31 17:55:01','2018-05-31 17:55:01'),(13,'2018-05-31',5,7,2,'2018-05-31 17:55:01','2018-05-31 17:55:01'),(14,'2018-05-31',2,4,1,'2018-05-31 18:00:45','2018-05-31 22:40:54'),(15,'2018-05-31',1,5,1,'2018-05-31 18:00:45','2018-05-31 22:40:54'),(16,'2018-05-31',4,7,1,'2018-05-31 18:00:45','2018-05-31 22:40:54'),(17,'2018-05-30',1,4,1,'2018-05-31 18:01:02','2018-05-31 18:01:02'),(18,'2018-05-30',3,7,1,'2018-05-31 18:01:02','2018-05-31 18:01:02'),(19,'2018-05-29',1,4,1,'2018-05-31 18:01:16','2018-05-31 18:01:16'),(20,'2018-05-29',1,5,1,'2018-05-31 18:01:16','2018-05-31 18:01:16'),(21,'2018-05-29',3,7,1,'2018-05-31 18:01:16','2018-05-31 18:01:16'),(22,'2018-06-01',3,4,3,'2018-06-01 16:53:11','2018-06-01 16:53:11'),(23,'2018-06-01',5,5,3,'2018-06-01 16:53:11','2018-06-01 16:53:11'),(24,'2018-06-01',4,7,3,'2018-06-01 16:53:11','2018-06-01 16:53:11'),(25,'2018-06-01',4,8,3,'2018-06-01 16:53:11','2018-06-01 16:53:11'),(26,'2018-06-02',1,4,3,'2018-06-01 16:54:16','2018-06-01 16:54:16'),(27,'2018-06-02',1,5,3,'2018-06-01 16:54:16','2018-06-01 16:54:16'),(28,'2018-06-02',1,7,3,'2018-06-01 16:54:16','2018-06-01 16:54:16'),(29,'2018-06-02',1,8,3,'2018-06-01 16:54:16','2018-06-01 16:54:16'),(30,'2018-06-04',3,4,3,'2018-06-05 03:03:16','2018-06-05 03:03:16'),(31,'2018-06-04',2,5,3,'2018-06-05 03:03:16','2018-06-05 03:03:16'),(32,'2018-06-06',10,5,3,'2018-06-06 17:39:29','2018-06-06 17:39:29'),(33,'2018-06-06',50,7,3,'2018-06-06 17:39:54','2018-06-06 17:39:54'),(34,'2018-06-11',5,4,1,'2018-06-11 18:35:51','2018-06-11 18:35:51'),(35,'2018-06-11',3,5,1,'2018-06-11 18:35:51','2018-06-11 18:35:51'),(36,'2018-06-11',6,7,1,'2018-06-11 18:35:51','2018-06-11 18:35:51'),(37,'2018-06-11',4,8,1,'2018-06-11 18:35:51','2018-06-11 18:35:51'),(38,'2018-06-12',3,4,4,'2018-06-12 11:31:39','2018-06-12 11:31:39'),(39,'2018-06-12',4,4,9,'2018-06-13 16:22:14','2018-06-13 16:22:14'),(40,'2018-06-12',2,5,9,'2018-06-13 16:22:14','2018-06-13 16:22:14'),(41,'2018-06-12',8,7,9,'2018-06-13 16:22:14','2018-06-13 16:22:14'),(42,'2018-06-12',1,8,9,'2018-06-13 16:22:14','2018-06-13 16:22:14'),(43,'2018-06-13',3,5,9,'2018-06-13 16:25:50','2018-06-13 16:57:48'),(44,'2018-06-13',1,8,9,'2018-06-13 16:25:50','2018-06-13 16:25:50'),(45,'2018-06-13',4,4,9,'2018-06-13 16:26:32','2018-06-13 16:26:32'),(46,'2018-06-13',8,7,9,'2018-06-13 16:26:32','2018-06-13 16:26:32'),(47,'2018-06-12',2,4,8,'2018-06-13 16:28:34','2018-06-13 16:29:56'),(48,'2018-06-12',4,7,8,'2018-06-13 16:28:34','2018-06-13 16:29:56'),(49,'2018-06-13',2,4,8,'2018-06-13 16:29:26','2018-06-13 16:29:26'),(50,'2018-06-13',4,7,8,'2018-06-13 16:29:26','2018-06-13 16:29:26'),(51,'2018-06-13',1,5,8,'2018-06-13 16:30:24','2018-06-13 16:30:24'),(52,'2018-06-13',1,8,8,'2018-06-13 16:30:24','2018-06-13 16:30:24'),(53,'2018-06-13',1,4,7,'2018-06-13 16:48:56','2018-06-13 16:48:56'),(54,'2018-06-13',1,5,7,'2018-06-13 16:48:56','2018-06-13 16:48:56'),(55,'2018-06-13',1,7,7,'2018-06-13 16:48:56','2018-06-13 16:48:56'),(56,'2018-06-13',1,8,7,'2018-06-13 16:48:56','2018-06-13 16:48:56'),(57,'2018-06-12',2,4,7,'2018-06-13 16:49:47','2018-06-13 16:49:47'),(58,'2018-06-12',2,5,7,'2018-06-13 16:49:47','2018-06-13 16:49:47'),(59,'2018-06-12',2,7,7,'2018-06-13 16:49:47','2018-06-13 16:49:47'),(60,'2018-06-12',2,8,7,'2018-06-13 16:49:47','2018-06-13 16:49:47'),(61,'2018-06-14',5,4,9,'2018-06-14 10:24:40','2018-06-14 10:24:40'),(62,'2018-06-14',10,5,9,'2018-06-14 10:24:40','2018-06-14 10:24:40'),(63,'2018-06-14',20,7,9,'2018-06-14 10:24:40','2018-06-14 10:24:40'),(64,'2018-06-14',10,8,9,'2018-06-14 10:24:40','2018-06-14 10:24:40'),(65,'2018-06-25',2,4,4,'2018-06-25 10:16:18','2018-06-25 10:16:18'),(66,'2018-06-25',3,5,4,'2018-06-25 10:16:18','2018-06-25 10:16:18'),(67,'2018-06-25',4,7,4,'2018-06-25 10:16:18','2018-06-25 10:16:18'),(68,'2018-06-25',3,8,4,'2018-06-25 10:16:18','2018-06-25 10:16:18'),(69,'2018-06-26',1,4,12,'2018-06-27 15:42:02','2018-06-27 15:42:02'),(70,'2018-06-26',1,5,12,'2018-06-27 15:42:02','2018-06-27 15:42:02'),(71,'2018-06-26',1,7,12,'2018-06-27 15:42:02','2018-06-27 15:42:02'),(72,'2018-06-26',1,8,12,'2018-06-27 15:42:02','2018-06-27 15:42:02'),(73,'2018-06-29',2,4,6,'2018-06-29 13:02:05','2018-06-29 13:02:05'),(74,'2018-06-29',3,5,6,'2018-06-29 13:02:05','2018-06-29 13:02:05'),(75,'2018-06-29',4,7,6,'2018-06-29 13:02:05','2018-06-29 13:02:05'),(76,'2018-06-29',5,8,6,'2018-06-29 13:02:05','2018-06-29 13:02:05'),(77,'2018-06-29',3,4,12,'2018-06-29 13:04:41','2018-06-29 13:04:41'),(78,'2018-06-29',2,5,12,'2018-06-29 13:04:41','2018-06-29 13:04:41'),(79,'2018-06-29',1,7,12,'2018-06-29 13:04:41','2018-06-29 13:04:41');
/*!40000 ALTER TABLE `carga_diaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concesionaria`
--

DROP TABLE IF EXISTS `concesionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concesionaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icono` blob,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cantPv` int(11) DEFAULT NULL,
  `cantVend` int(11) DEFAULT NULL,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `baja` tinyint(1) DEFAULT '0',
  `fin_jornada` int(11) DEFAULT NULL,
  `inicio_jornada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concesionaria`
--

LOCK TABLES `concesionaria` WRITE;
/*!40000 ALTER TABLE `concesionaria` DISABLE KEYS */;
INSERT INTO `concesionaria` VALUES (3,NULL,'Bremen BMW','2018-05-29',NULL,1,NULL,NULL,'2018-05-29 14:12:07','2018-06-14 09:41:55',5,30,'logobmw.jpeg','image/jpeg',6939,'2018-05-29 15:01:47',0,NULL,NULL),(4,NULL,'Mercedes Benz','2018-06-08',NULL,1,NULL,NULL,'2018-06-08 15:06:15','2018-06-08 15:06:15',2,20,'mb.jpg','image/jpeg',4110,'2018-06-08 15:06:15',0,NULL,NULL),(6,NULL,'Bugatti','2018-06-18',NULL,1,NULL,NULL,'2018-06-18 13:01:18','2018-06-18 15:24:59',5,20,'bugatti.png','image/png',7842,'2018-06-18 13:01:18',0,NULL,NULL),(7,NULL,'Rolls Royce','2018-06-22',NULL,1,NULL,NULL,'2018-06-22 12:58:44','2018-06-22 12:58:44',5,20,'RR.jpg','image/jpeg',6667,'2018-06-22 12:58:44',0,NULL,NULL);
/*!40000 ALTER TABLE `concesionaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_personas`
--

DROP TABLE IF EXISTS `estado_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estado_personas_on_persona_id` (`persona_id`),
  CONSTRAINT `fk_rails_303356a74b` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_personas`
--

LOCK TABLES `estado_personas` WRITE;
/*!40000 ALTER TABLE `estado_personas` DISABLE KEYS */;
INSERT INTO `estado_personas` VALUES (1,NULL,'2018-06-01 00:00:00',NULL,'2018-05-31 17:47:36','2018-05-31 17:47:36',NULL,1);
/*!40000 ALTER TABLE `estado_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'L','Libre-Franco','2018-05-24 20:07:11','2018-05-24 20:07:11'),(2,'V','Vacaciones','2018-05-24 20:07:11','2018-05-24 20:07:11'),(3,'A','Ausente','2018-05-24 20:07:11','2018-05-24 20:07:11');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `notifiable_id` int(11) DEFAULT NULL,
  `notifiable_type` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,5,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-02',20),(2,4,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-02',20),(3,5,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-02',22),(4,4,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-02',22),(5,5,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-03',20),(6,4,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-03',20),(7,5,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-03',22),(8,4,5,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',37,'CargaDiarium','2018-07-03',22),(9,7,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-02',20),(10,4,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-02',20),(11,7,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-02',22),(12,4,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-02',22),(13,7,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-03',20),(14,4,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-03',20),(15,7,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-03',22),(16,4,7,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',33,'CargaDiarium','2018-07-03',22),(17,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-02',20),(18,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-02',20),(19,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-02',22),(20,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-02',22),(21,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-03',20),(22,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-03',20),(23,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-03',22),(24,4,4,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',68,'CargaDiarium','2018-07-03',22),(25,10,10,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',76,'CargaDiarium','2018-07-02',20),(26,4,10,NULL,'no_cargo','2018-07-04 10:00:47','2018-07-04 10:00:47',76,'CargaDiarium','2018-07-02',20),(27,10,10,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',76,'CargaDiarium','2018-07-02',22),(28,4,10,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',76,'CargaDiarium','2018-07-02',22),(29,10,10,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',76,'CargaDiarium','2018-07-03',20),(30,4,10,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',76,'CargaDiarium','2018-07-03',20),(31,10,10,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',76,'CargaDiarium','2018-07-03',22),(32,4,10,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',76,'CargaDiarium','2018-07-03',22),(33,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-02',NULL),(34,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-02',NULL),(35,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-02',NULL),(36,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-02',NULL),(37,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-03',NULL),(38,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-03',NULL),(39,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-03',NULL),(40,12,12,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',60,'CargaDiarium','2018-07-03',NULL),(41,13,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-02',NULL),(42,12,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-02',NULL),(43,13,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-02',NULL),(44,12,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-02',NULL),(45,13,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-03',NULL),(46,12,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-03',NULL),(47,13,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-03',NULL),(48,12,13,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',52,'CargaDiarium','2018-07-03',NULL),(49,14,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-02',NULL),(50,12,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-02',NULL),(51,14,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-02',NULL),(52,12,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-02',NULL),(53,14,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-03',NULL),(54,12,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-03',NULL),(55,14,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-03',NULL),(56,12,14,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',64,'CargaDiarium','2018-07-03',NULL),(57,21,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-02',20),(58,4,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-02',20),(59,21,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-02',22),(60,4,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-02',22),(61,21,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-03',20),(62,4,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-03',20),(63,21,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-03',22),(64,4,21,NULL,'no_cargo','2018-07-04 10:00:48','2018-07-04 10:00:48',79,'CargaDiarium','2018-07-03',22);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivo_mensuals`
--

DROP TABLE IF EXISTS `objetivo_mensuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetivo_mensuals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `tipo_objetivo_id` int(11) DEFAULT NULL,
  `cantidad_propuesta` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `punto_venta_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `csi_real` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivo_mensuals`
--

LOCK TABLES `objetivo_mensuals` WRITE;
/*!40000 ALTER TABLE `objetivo_mensuals` DISABLE KEYS */;
INSERT INTO `objetivo_mensuals` VALUES (1,'Ventas',NULL,5,51,5,2018,4,NULL,1,'2018-05-29 15:47:32','2018-05-31 19:40:30',NULL),(2,'CSI',NULL,3,85,5,2018,4,NULL,1,'2018-05-29 15:50:04','2018-05-29 15:50:04',NULL),(3,'CSI',NULL,3,75,5,2018,4,1,1,'2018-05-29 15:50:04','2018-07-04 10:16:13',90),(4,'',NULL,7,200,5,2018,4,NULL,1,'2018-05-29 15:51:13','2018-05-29 15:51:13',NULL),(5,'',NULL,4,100,5,2018,4,NULL,1,'2018-05-29 15:52:18','2018-05-29 15:52:18',NULL),(6,'Ventas',NULL,5,25,5,2018,4,1,1,'2018-06-08 14:58:25','2018-06-08 15:01:35',NULL),(7,'Ventas',NULL,5,50,6,2018,3,NULL,2,'2018-06-11 15:09:06','2018-06-11 15:09:06',NULL),(8,'Ventas',NULL,5,51,7,2018,3,NULL,2,'2018-06-11 15:09:24','2018-06-11 15:09:24',NULL),(9,'Ventas',NULL,5,50,6,2018,12,NULL,6,'2018-06-13 15:42:13','2018-06-13 15:42:13',NULL),(14,'PM',NULL,4,100,6,2018,12,NULL,6,'2018-06-13 15:43:33','2018-06-13 15:43:33',NULL),(15,'Oppty',NULL,7,200,6,2018,12,NULL,6,'2018-06-13 15:44:08','2018-06-13 15:44:08',NULL),(16,'Financ',NULL,8,15,6,2018,12,NULL,6,'2018-06-13 15:44:39','2018-06-13 15:44:39',NULL),(17,NULL,NULL,7,60,6,2018,12,7,6,'2018-06-13 15:51:25','2018-06-13 15:51:25',NULL),(18,NULL,NULL,4,30,6,2018,12,7,6,'2018-06-13 15:51:25','2018-06-13 15:51:25',NULL),(19,NULL,NULL,5,15,6,2018,12,7,6,'2018-06-13 15:51:25','2018-06-13 15:51:25',NULL),(20,NULL,NULL,8,5,6,2018,12,7,6,'2018-06-13 15:51:25','2018-06-13 15:51:25',NULL),(21,NULL,NULL,7,70,6,2018,12,8,6,'2018-06-13 15:52:56','2018-06-13 15:52:56',NULL),(22,NULL,NULL,4,40,6,2018,12,8,6,'2018-06-13 15:52:56','2018-06-13 15:52:56',NULL),(23,NULL,NULL,5,20,6,2018,12,8,6,'2018-06-13 15:52:56','2018-06-13 15:52:56',NULL),(24,NULL,NULL,8,6,6,2018,12,8,6,'2018-06-13 15:52:56','2018-06-13 15:52:56',NULL),(25,NULL,NULL,7,70,6,2018,12,9,6,'2018-06-13 15:54:43','2018-06-13 15:54:43',NULL),(26,NULL,NULL,4,30,6,2018,12,9,6,'2018-06-13 15:54:43','2018-06-13 15:54:43',NULL),(27,NULL,NULL,5,15,6,2018,12,9,6,'2018-06-13 15:54:43','2018-06-13 15:54:43',NULL),(28,NULL,NULL,8,4,6,2018,12,9,6,'2018-06-13 15:54:43','2018-06-13 15:54:43',NULL),(29,'CSI',NULL,3,85,6,2018,12,NULL,6,'2018-06-13 16:10:35','2018-06-13 16:10:35',NULL),(30,'CSI',NULL,3,85,6,2018,12,7,6,'2018-06-13 16:10:35','2018-06-14 16:26:25',74),(31,'CSI',NULL,3,85,6,2018,12,8,6,'2018-06-13 16:10:35','2018-06-14 16:27:15',75),(32,'CSI',NULL,3,85,6,2018,12,9,6,'2018-06-13 16:10:35','2018-06-14 16:27:25',76),(33,'',NULL,5,50,6,2018,17,NULL,9,'2018-06-22 13:47:31','2018-06-22 13:47:31',NULL),(34,'Ventas',NULL,5,60,7,2018,23,NULL,11,'2018-07-02 10:27:15','2018-07-02 10:30:27',NULL),(37,'Opttys',NULL,7,240,7,2018,23,NULL,11,'2018-07-02 10:31:12','2018-07-02 10:31:12',NULL),(38,'PM',NULL,4,120,7,2018,23,NULL,11,'2018-07-02 12:12:54','2018-07-02 12:12:54',NULL),(39,'Financiaciones',NULL,8,30,7,2018,23,NULL,11,'2018-07-02 12:13:28','2018-07-02 12:13:46',NULL),(40,'CSI',NULL,3,85,7,2018,23,NULL,11,'2018-07-02 12:15:37','2018-07-02 12:15:37',NULL),(41,'CSI',NULL,3,85,7,2018,23,13,11,'2018-07-02 12:15:37','2018-07-02 12:15:37',NULL),(42,'CSI',NULL,3,85,7,2018,23,15,11,'2018-07-02 12:15:37','2018-07-02 12:15:37',NULL),(43,'CSI',NULL,3,85,7,2018,23,16,11,'2018-07-02 12:15:37','2018-07-02 12:15:37',NULL),(44,'Ventas Vendedor 1',NULL,5,15,7,2018,23,13,11,'2018-07-02 12:17:00','2018-07-02 12:50:21',NULL),(46,'Ventas Vendedor 2',NULL,5,25,7,2018,23,15,11,'2018-07-02 12:18:51','2018-07-02 12:53:25',NULL),(48,NULL,NULL,7,60,7,2018,23,13,11,'2018-07-02 12:35:23','2018-07-02 12:35:23',NULL),(49,NULL,NULL,4,30,7,2018,23,13,11,'2018-07-02 12:36:13','2018-07-02 12:36:13',NULL),(50,'Financiaciones Vendedor 1',NULL,8,6,7,2018,23,13,11,'2018-07-02 12:50:59','2018-07-02 12:50:59',NULL),(51,NULL,NULL,4,50,7,2018,23,15,11,'2018-07-02 12:52:41','2018-07-02 12:52:41',NULL),(52,NULL,NULL,7,100,7,2018,23,15,11,'2018-07-02 12:53:25','2018-07-02 12:53:25',NULL),(53,'Financiaciones Vendedor 2',NULL,8,14,7,2018,23,15,11,'2018-07-02 12:54:24','2018-07-02 12:54:24',NULL),(54,NULL,NULL,7,80,7,2018,23,16,11,'2018-07-02 13:54:27','2018-07-02 13:58:25',NULL),(55,NULL,NULL,4,40,7,2018,23,16,11,'2018-07-02 13:54:27','2018-07-02 13:54:27',NULL),(56,'Creditos Vendedor 3',NULL,8,10,7,2018,23,16,11,'2018-07-02 14:02:40','2018-07-02 14:02:40',NULL),(57,NULL,NULL,5,9,7,2018,23,16,11,'2018-07-02 14:50:43','2018-07-04 09:29:04',NULL);
/*!40000 ALTER TABLE `objetivo_mensuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivo_semanals`
--

DROP TABLE IF EXISTS `objetivo_semanals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetivo_semanals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objetivo_mensual_id` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `cantidad_propuesta` int(11) DEFAULT NULL,
  `numero_semana` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  `punto_venta_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tipo_objetivo_id` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivo_semanals`
--

LOCK TABLES `objetivo_semanals` WRITE;
/*!40000 ALTER TABLE `objetivo_semanals` DISABLE KEYS */;
INSERT INTO `objetivo_semanals` VALUES (2,NULL,'2018-06-13',10,1,NULL,NULL,6,'2018-06-13 15:46:38','2018-06-13 15:46:38',5,6,2018),(3,NULL,'2018-06-13',11,2,NULL,NULL,6,'2018-06-13 15:47:21','2018-06-13 15:47:21',5,6,2018),(4,NULL,'2018-06-13',12,3,NULL,NULL,6,'2018-06-13 15:47:43','2018-06-13 15:47:43',5,6,2018),(5,NULL,'2018-06-13',13,4,NULL,NULL,6,'2018-06-13 15:48:13','2018-06-13 15:48:13',5,6,2018),(6,NULL,'2018-06-13',4,5,NULL,NULL,6,'2018-06-13 15:48:44','2018-06-13 15:49:37',5,6,2018),(7,NULL,'2018-06-13',3,3,NULL,7,6,'2018-06-13 15:56:55','2018-06-13 15:56:55',6,6,2018),(8,NULL,'2018-06-13',4,3,NULL,9,6,'2018-06-13 15:57:35','2018-06-13 15:57:35',6,6,2018),(9,NULL,'2018-06-13',5,3,NULL,8,6,'2018-06-13 15:58:16','2018-06-13 15:58:16',6,6,2018),(10,NULL,'2018-06-14',4,2,NULL,7,6,'2018-06-14 10:00:01','2018-06-14 10:00:01',6,6,2018),(11,NULL,'2018-07-02',4,1,NULL,NULL,11,'2018-07-02 14:29:55','2018-07-02 14:30:21',5,7,2018),(12,NULL,'2018-07-02',14,2,NULL,NULL,11,'2018-07-02 14:30:45','2018-07-02 14:30:45',5,7,2018),(14,NULL,'2018-07-02',15,4,NULL,NULL,11,'2018-07-02 14:31:36','2018-07-02 14:31:36',5,7,2018),(15,NULL,'2018-07-02',13,3,NULL,NULL,11,'2018-07-02 14:32:12','2018-07-02 14:32:12',5,7,2018),(17,NULL,'2018-07-02',14,5,NULL,NULL,11,'2018-07-02 14:36:19','2018-07-02 14:36:19',5,7,2018),(18,NULL,'2018-07-02',10,1,NULL,NULL,11,'2018-07-02 14:42:09','2018-07-02 14:42:09',4,7,2018),(19,NULL,'2018-07-02',20,2,NULL,NULL,11,'2018-07-02 14:42:28','2018-07-02 14:42:28',4,7,2018),(20,NULL,'2018-07-02',20,3,NULL,NULL,11,'2018-07-02 14:42:42','2018-07-02 14:42:42',4,7,2018),(21,NULL,'2018-07-02',30,4,NULL,NULL,11,'2018-07-02 14:42:58','2018-07-02 14:42:58',4,7,2018),(22,NULL,'2018-07-02',40,5,NULL,NULL,11,'2018-07-02 14:43:37','2018-07-02 14:43:37',4,7,2018),(23,NULL,'2018-07-02',20,1,NULL,NULL,11,'2018-07-02 14:45:52','2018-07-02 14:45:52',7,7,2018),(24,NULL,'2018-07-02',40,2,NULL,NULL,11,'2018-07-02 14:46:10','2018-07-02 14:46:10',7,7,2018),(25,NULL,'2018-07-02',40,3,NULL,NULL,11,'2018-07-02 14:46:26','2018-07-02 14:46:26',7,7,2018),(26,NULL,'2018-07-02',60,4,NULL,NULL,11,'2018-07-02 14:46:43','2018-07-02 14:46:43',7,7,2018),(27,NULL,'2018-07-02',80,5,NULL,NULL,11,'2018-07-02 14:47:19','2018-07-02 14:47:19',7,7,2018),(28,NULL,'2018-07-02',2,1,NULL,NULL,11,'2018-07-02 14:48:47','2018-07-02 14:48:47',8,7,2018),(29,NULL,'2018-07-02',7,2,NULL,NULL,11,'2018-07-02 14:49:07','2018-07-02 14:49:07',8,7,2018),(30,NULL,'2018-07-02',6,3,NULL,NULL,11,'2018-07-02 14:49:27','2018-07-02 14:49:27',8,7,2018),(31,NULL,'2018-07-02',8,4,NULL,NULL,11,'2018-07-02 14:49:53','2018-07-02 14:49:53',8,7,2018),(32,NULL,'2018-07-02',8,5,NULL,NULL,11,'2018-07-02 14:50:11','2018-07-02 14:50:11',8,7,2018);
/*!40000 ALTER TABLE `objetivo_semanals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_concesionaria`
--

DROP TABLE IF EXISTS `persona_concesionaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_concesionaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) DEFAULT NULL,
  `concesionaria_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_persona_concesionaria_on_persona_id` (`persona_id`),
  KEY `index_persona_concesionaria_on_concesionaria_id` (`concesionaria_id`),
  CONSTRAINT `fk_rails_a98370fbbe` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `fk_rails_7fae8e3afb` FOREIGN KEY (`concesionaria_id`) REFERENCES `concesionaria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_concesionaria`
--

LOCK TABLES `persona_concesionaria` WRITE;
/*!40000 ALTER TABLE `persona_concesionaria` DISABLE KEYS */;
INSERT INTO `persona_concesionaria` VALUES (1,3,3,'2018-05-29 14:22:34','2018-05-29 14:22:34'),(2,2,4,'2018-06-08 15:06:46','2018-06-08 15:06:46'),(3,17,6,'2018-06-18 14:53:25','2018-06-18 14:53:25'),(4,24,7,'2018-06-29 15:08:17','2018-06-29 15:08:17');
/*!40000 ALTER TABLE `persona_concesionaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_punto_venta`
--

DROP TABLE IF EXISTS `persona_punto_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_punto_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) DEFAULT NULL,
  `punto_venta_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_persona_punto_venta_on_persona_id` (`persona_id`),
  KEY `index_persona_punto_venta_on_punto_venta_id` (`punto_venta_id`),
  CONSTRAINT `fk_rails_8b91c2fa73` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `fk_rails_3291372105` FOREIGN KEY (`punto_venta_id`) REFERENCES `punto_venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_punto_venta`
--

LOCK TABLES `persona_punto_venta` WRITE;
/*!40000 ALTER TABLE `persona_punto_venta` DISABLE KEYS */;
INSERT INTO `persona_punto_venta` VALUES (1,4,1,'2018-05-29 14:56:34','2018-05-29 14:56:34'),(3,8,3,'2018-06-09 14:53:07','2018-06-09 14:53:07'),(5,10,2,'2018-06-12 12:06:00','2018-06-12 12:06:00'),(6,11,6,'2018-06-13 15:21:08','2018-06-13 15:21:08'),(7,14,8,'2018-06-16 12:48:36','2018-06-16 12:48:36'),(8,18,10,'2018-06-18 15:37:30','2018-06-18 15:37:30'),(10,17,9,'2018-06-22 13:19:02','2018-06-22 13:19:02'),(11,25,11,'2018-06-29 15:21:08','2018-06-29 15:21:08');
/*!40000 ALTER TABLE `persona_punto_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento_id` int(11) DEFAULT NULL,
  `numero_documento` int(11) DEFAULT NULL,
  `cuit` bigint(20) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,3,31343209,NULL,'Cerrutti','German',NULL,'0280154336704','gcerrutti@gmail.com','1979-07-10','2018-05-24 20:07:10','2018-05-24 20:07:10'),(2,3,20202020,27,'Parada','Victoria','Viamonte','550','vparada@oneinfoconsulting.com','1970-07-11','2018-05-29 13:44:37','2018-05-29 13:44:37'),(3,3,106914889,20106914897,'Juan','Perez','Viamonte 550 1A','52381225','cherman1981@hotmail.com','1953-01-10','2018-05-29 14:22:13','2018-05-29 14:22:13'),(4,3,22222222,22222222222,'Turing','Alan','Bletchley Park','45565656','alanturing@gmail.com','1912-06-23','2018-05-29 14:55:52','2018-05-29 14:55:52'),(5,3,33333333,33333333333,'Nicola','Tesla','Gorriti 1236','23659887','nikolatesla@gmail.com','1856-07-10','2018-05-29 15:04:12','2018-05-29 15:04:12'),(6,3,44444444,44444444444,'Einstein','Albert','Gurruchaga 653','78787878','alberteinstein@gmail.com','1879-03-14','2018-05-29 15:06:42','2018-05-29 15:06:42'),(7,3,99999999,999999999,'Bohr','Niels','Copenague 785','77778989','nb@gmail.com','1885-10-07','2018-05-31 19:33:57','2018-05-31 19:33:57'),(8,3,77777777,77777777777,'Vendedor','ZarateA','Dom 123','44445555','v1z@gmail.com','1982-10-11','2018-06-09 14:52:01','2018-06-09 14:52:01'),(9,4,33345245,27333452451,'Messi','Leonel','Mitre 123','0280154382214','iva.moyano@gmail.com','1986-06-01','2018-06-11 16:38:43','2018-06-11 16:38:43'),(10,3,66666666,66666666666,'Descartes','René','Estocolmo 4569','66664444','rd@gmail.com','1596-03-31','2018-06-12 12:05:38','2018-06-12 12:05:38'),(11,3,29111111,20291111116,'Pascal','Blaise','Gelly 3378','54653221','bp@bmwbrc.com','1623-06-19','2018-06-13 15:20:49','2018-06-13 15:20:49'),(12,3,29111112,20291111126,'Erico','Arsenio','Pavon 2444','12234556','ae@bmwbrc.com','1915-03-30','2018-06-13 15:33:57','2018-06-13 15:33:57'),(13,3,29111113,20291111136,'Hesse','Hermann','Balcarce 480','78896554','hh@bmwbrc.com','1877-07-02','2018-06-13 15:40:12','2018-06-13 15:40:12'),(14,4,29111114,20291111146,'AdmClienteMB','Juan','Dupuy 987','44445555','js@mbrecoleta.com','1973-01-20','2018-06-16 12:44:49','2018-06-16 12:44:49'),(15,3,29111115,20291111156,'Serrizuela','Jose','Dupuy 987','44445555','js@mbrecoleta.com','1973-06-12','2018-06-16 12:49:42','2018-06-16 12:49:42'),(16,3,29111116,20291111166,'Alcanfor','Amilcar','Segurola S/N','4545-8989','aa@ergos.com','2020-12-31','2018-06-18 10:47:48','2018-06-18 10:47:48'),(17,4,29111117,20291111176,'Oliveira','Horacio','César Diaz 2345','78878989','ho@gmail.com','1963-12-12','2018-06-18 14:53:21','2018-06-18 14:53:21'),(18,3,29111118,20291111186,'de Cliente','Administrador','Magariños Cervantes 3456 1°C','45567889','adc@bugatti.com','2000-04-12','2018-06-18 15:37:24','2018-06-18 15:37:24'),(19,3,32323232,32323232323,'Vend','Juan','Dupuy 987','45567889','vendedor@bmwbrc.com','1979-12-12','2018-06-22 10:21:27','2018-06-22 10:21:27'),(20,3,78894556,89785456122,'Usuriaga','Albeiro','Bogota','2595','au@bugatti.com','1978-01-10','2018-06-22 12:53:30','2018-06-22 12:53:30'),(21,3,56892323,564556451,'Mondragon','Farid','Balcarce 480','45788956','fm@bugatti.com','1977-12-12','2018-06-22 13:40:16','2018-06-22 13:40:16'),(22,3,4551445,45564556456,'Leibniz','Gottfried','Arregui 4578','89784556','gl@bmwpalermo.com','1646-06-01','2018-06-27 14:21:25','2018-06-27 14:21:25'),(23,2,1234567,9865322111,'Prueba','Prueba','Dupuy 1234','45457878','pp@rr.com','1981-12-12','2018-06-29 14:59:32','2018-06-29 14:59:32'),(24,4,27899456,85274196374,'Hamilton','Margaret','Lisboa 7889','98651223','mh@rr.com','1936-08-17','2018-06-29 15:08:11','2018-06-29 15:08:11'),(25,1,36987456,12369874512,'Minsky','Marvin','La Pampa 7889','78894456','mm@rr.com','1927-08-09','2018-06-29 15:21:03','2018-06-29 15:21:03'),(26,3,22222222,222222222,'pruebaGOnza','GOnzaPrueba','sdsd','12121313133','pruebaGonza@gmail.com','2018-06-29','2018-06-29 16:45:57','2018-06-29 16:45:57'),(27,4,85296374,85296374152,'Sadosky','Manuel','Clementina 4556','1212','ms@rr.com','1914-04-13','2018-06-30 09:45:10','2018-06-30 09:45:10'),(28,4,87655432,98876554321,'Babbage','Charles','Gallardo 4554','45986532','cb@rr.com','1791-12-26','2018-06-30 09:55:09','2018-06-30 09:55:09');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto_venta`
--

DROP TABLE IF EXISTS `punto_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punto_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `concesionaria_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `baja` tinyint(1) DEFAULT '0',
  `fecha_baja` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_venta`
--

LOCK TABLES `punto_venta` WRITE;
/*!40000 ALTER TABLE `punto_venta` DISABLE KEYS */;
INSERT INTO `punto_venta` VALUES (1,'BMW Palermo','Thames 1557',3,NULL,'2018-05-29 14:33:59','2018-05-29 14:33:59',0,NULL),(2,'BMW Zona Norte','Libertador 1001',3,NULL,'2018-05-29 14:35:03','2018-05-29 14:35:03',0,NULL),(3,'BMW Zarate','San Martin 505',3,NULL,'2018-05-29 14:35:20','2018-05-29 14:35:20',0,NULL),(6,'BMW Bariloche','Bustillo Km 8',3,NULL,'2018-06-13 15:16:55','2018-06-13 15:16:55',0,NULL),(7,'BMW Ushuaia','San Martin 1000',3,NULL,'2018-06-14 09:42:34','2018-06-14 09:42:34',0,NULL),(8,'MB Recoleta','Alvear 1501',4,NULL,'2018-06-16 12:36:20','2018-06-16 12:36:20',0,NULL),(9,'Bugatti Olivos','Libertador 1234',6,NULL,'2018-06-18 15:26:05','2018-06-18 15:26:35',0,NULL),(10,'Bugatti Barrio Norte','Cordoba 2359',6,NULL,'2018-06-18 15:27:16','2018-06-18 15:27:16',0,NULL),(11,'RR Olivos','Maipu 5234',7,NULL,'2018-06-29 15:10:40','2018-06-29 15:10:40',0,NULL);
/*!40000 ALTER TABLE `punto_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reunion_participantes`
--

DROP TABLE IF EXISTS `reunion_participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reunion_participantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reunion_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reunion_participantes`
--

LOCK TABLES `reunion_participantes` WRITE;
/*!40000 ALTER TABLE `reunion_participantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reunion_participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reunions`
--

DROP TABLE IF EXISTS `reunions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reunions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `semana` int(11) DEFAULT NULL,
  `lugar_fisico` varchar(255) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `plan_accion` varchar(255) DEFAULT NULL,
  `accion` varchar(255) DEFAULT NULL,
  `adjunto` blob,
  `adjunto_file_name` varchar(255) DEFAULT NULL,
  `adjunto_content_type` varchar(255) DEFAULT NULL,
  `adjunto_file_size` int(11) DEFAULT NULL,
  `adjunto_updated_at` datetime DEFAULT NULL,
  `mes` varchar(255) DEFAULT NULL,
  `mensual` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reunions`
--

LOCK TABLES `reunions` WRITE;
/*!40000 ALTER TABLE `reunions` DISABLE KEYS */;
INSERT INTO `reunions` VALUES (9,'2018-06-29',5,'Oficina',4,'2018-06-29 12:45:42','2018-06-29 12:45:42',NULL,NULL,NULL,'template_pdf(2).pdf','application/pdf',10938,'2018-06-29 12:45:42','Junio',0),(10,'2018-06-29',NULL,'Oficina',4,'2018-06-29 12:46:50','2018-06-29 12:46:50',NULL,NULL,NULL,'template_pdf(3).pdf','application/pdf',15644,'2018-06-29 12:46:50','Junio',1),(11,'2018-06-29',5,'Prueba',4,'2018-06-29 14:49:18','2018-06-29 14:49:18',NULL,NULL,NULL,'template_pdf(2).pdf','application/pdf',10938,'2018-06-29 14:49:18','Junio',0);
/*!40000 ALTER TABLE `reunions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_resource_type_and_resource_id` (`resource_type`,`resource_id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'vendedor',NULL,NULL,'2018-05-24 20:07:11','2018-05-24 20:07:11'),(2,'punto_venta',NULL,NULL,'2018-05-24 20:07:11','2018-05-24 20:07:11'),(3,'concesionaria',NULL,NULL,'2018-05-24 20:07:11','2018-05-24 20:07:11'),(4,'admin',NULL,NULL,'2018-05-24 20:07:11','2018-05-24 20:07:11'),(5,'dashboard',NULL,NULL,'2018-06-13 10:35:53','2018-06-13 10:35:53');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180417173702'),('20180417173739'),('20180420131118'),('20180420131227'),('20180420131429'),('20180420131606'),('20180420131839'),('20180420131952'),('20180420132141'),('20180420132510'),('20180420132839'),('20180420132941'),('20180420133045'),('20180420222728'),('20180422214907'),('20180425221514'),('20180429163629'),('20180502211045'),('20180503114729'),('20180506141316'),('20180507001106'),('20180507001451'),('20180508003631'),('20180508115858'),('20180510141651'),('20180511195929'),('20180518112413'),('20180521140656'),('20180521154256'),('20180521154645'),('20180521155524'),('20180522143536'),('20180522152245'),('20180530114055'),('20180531154341'),('20180603213819'),('20180603231302'),('20180605004829'),('20180605173139'),('20180623195241'),('20180626145112'),('20180627151241'),('20180627211143'),('20180627231812'),('20180628134003'),('20180628222004'),('20180628232544'),('20180630194101'),('20180702232654'),('20180703192814'),('20180703204435');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documentos`
--

DROP TABLE IF EXISTS `tipo_documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documentos`
--

LOCK TABLES `tipo_documentos` WRITE;
/*!40000 ALTER TABLE `tipo_documentos` DISABLE KEYS */;
INSERT INTO `tipo_documentos` VALUES (1,'LE','2018-05-24 20:07:10','2018-05-24 20:07:10'),(2,'LC','2018-05-24 20:07:10','2018-05-24 20:07:10'),(3,'DNI','2018-05-24 20:07:10','2018-05-24 20:07:10'),(4,'CI','2018-05-24 20:07:10','2018-05-24 20:07:10');
/*!40000 ALTER TABLE `tipo_documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_objetivos`
--

DROP TABLE IF EXISTS `tipo_objetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_objetivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_objetivos`
--

LOCK TABLES `tipo_objetivos` WRITE;
/*!40000 ALTER TABLE `tipo_objetivos` DISABLE KEYS */;
INSERT INTO `tipo_objetivos` VALUES (3,'CSI','2018-07-02 08:55:33','2018-07-02 08:55:33',NULL,'M'),(4,'PRUEBA DE MANEJO','2018-07-02 08:55:33','2018-07-02 08:55:33','KPI','SM'),(5,'VENTAS','2018-07-02 08:55:33','2018-07-02 08:55:33','KPI','SM'),(6,'COMPROMISO DE VENTAS SEMANAL','2018-07-02 08:55:33','2018-07-02 08:55:33',NULL,'S'),(7,'OPORTUNIDADES','2018-07-02 08:55:33','2018-07-02 08:55:33','KPI','SM'),(8,'FINANCIACIONES','2018-07-02 08:55:33','2018-07-02 08:55:33','KPI','SM');
/*!40000 ALTER TABLE `tipo_objetivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `concesionaria_id` int(11) DEFAULT NULL,
  `punto_venta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gcerrutti@gmail.com','$2a$11$MO9fg4yvUi5KvFs.FBHnTOBUPE5gznlnzCnCjAtwjKP/H0xDrQch2',NULL,NULL,NULL,101,'2018-07-04 10:15:13','2018-07-04 10:05:31','201.251.66.27','200.59.105.138','2018-05-24 20:07:11','2018-07-04 10:45:23',1,7,11),(2,'vparada@oneinfoconsulting.com','$2a$11$OpmJR73Pm4l2m1nU1w20Nu.a9O8j9BtKQwj5VtcnN7Af2RF5B9hg.',NULL,NULL,NULL,1,'2018-05-29 13:45:09','2018-05-29 13:45:09','190.210.223.10','190.210.223.10','2018-05-29 13:44:37','2018-06-08 15:06:46',2,4,NULL),(3,'cherman1981@hotmail.com','$2a$11$Dl4gl6ithotJ2nCUOZjsxuFRgx7V7o0RiSSkwEUAS9Wl7x1FVvRoW',NULL,NULL,NULL,36,'2018-07-02 15:59:53','2018-06-22 10:19:38','45.236.101.87','179.36.107.42','2018-05-29 14:22:34','2018-07-02 15:59:53',3,3,6),(4,'alanturing@gmail.com','$2a$11$ySEaq/AUxrw7lX.eyP3CJ.rqJqbBbE2Sa4TZg4K3PIfImiQEO7vL.',NULL,NULL,NULL,91,'2018-07-01 20:21:29','2018-06-29 12:44:32','201.251.66.27','179.36.91.172','2018-05-29 14:56:34','2018-07-01 20:21:29',4,3,1),(5,'nikolatesla@gmail.com','$2a$11$DW3djTngN9sxYsmHFa1VxeA68db/8Iwq7By5webBnTcHNTm0QIw8S',NULL,NULL,NULL,23,'2018-06-26 13:22:52','2018-06-26 13:21:09','45.236.101.87','45.236.101.87','2018-05-29 15:04:12','2018-06-26 13:22:52',5,3,1),(6,'alberteinstein@hotmail.com','$2a$11$0I9Yglp7P79e3v2MwwxqRuOHYS/UhlXn3cSHiUCPFTA/ytpXLBWFi',NULL,NULL,NULL,7,'2018-06-13 15:07:05','2018-06-11 14:35:59','201.179.221.49','179.36.80.66','2018-05-29 15:07:14','2018-06-13 15:07:05',6,3,2),(7,'nb@gmail.com','$2a$11$rnStsMzcYRsLqBvgIULoye/Tn1R8wrfp7ZxO/ovSyj6jdOf7EIR3O',NULL,NULL,NULL,21,'2018-06-25 10:20:23','2018-06-13 15:10:49','186.19.72.18','201.179.221.49','2018-05-31 19:33:57','2018-06-25 10:20:23',7,3,1),(8,'v1z@gmail.com','$2a$11$J09N/ciQocLscBsBw7ICi.gzrbjf6aZGFdR0Mnikfa8mn/I9Sa4Yi',NULL,NULL,NULL,1,'2018-06-09 15:06:30','2018-06-09 15:06:30','201.179.233.99','201.179.233.99','2018-06-09 14:53:07','2018-06-09 15:06:30',8,3,3),(9,'iva.moyano@gmail.com','$2a$11$anwZz6W92PPyrXiArRYq8edJ3URGrI6o7pJ8nFVy4LbB/alg0CpOW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-11 16:38:44','2018-06-11 16:38:44',9,3,1),(10,'rd@gmail.com','$2a$11$qau3OxW8hqZxHYoOFg3wY.SnLjy9ueKaIPnOjFOoa/apXMlFg0J6u',NULL,NULL,NULL,1,'2018-06-29 13:01:54','2018-06-29 13:01:54','179.36.91.172','179.36.91.172','2018-06-12 12:06:00','2018-06-29 13:01:54',10,3,1),(11,'prueba@dash.com','$2a$11$eTOKocqiL2R50/cLBVwSDO2Zzp9EuET70kgM6qcaYQeuyQaBiki/6',NULL,NULL,NULL,6,'2018-06-14 10:28:49','2018-06-13 11:51:44','190.210.223.10','201.179.221.49','2018-06-13 10:35:25','2018-06-14 10:28:49',1,1,1),(12,'bp@bmwbrc.com','$2a$11$Qaov4/0eROVzG893d6/gPOe7Aj7TrMN4KZpq.vky3vZQj.nB0xWma',NULL,NULL,NULL,10,'2018-06-15 15:32:02','2018-06-15 13:55:05','179.36.114.154','179.36.114.154','2018-06-13 15:21:08','2018-06-15 15:32:02',11,3,6),(13,'ae@bmwbrc.com','$2a$11$smo6G/vue/CJezm5sHv3HOp4PrC5hF2yg4tob8oQtoLXC2fLYrfSS',NULL,NULL,NULL,1,'2018-06-13 16:27:35','2018-06-13 16:27:35','201.179.221.49','201.179.221.49','2018-06-13 15:33:57','2018-06-13 16:27:35',12,3,6),(14,'hh@bmwbrc.com','$2a$11$S6OwrmG0GLUFYafwoFTNoelwGUqamvldy1gQMEzBgM42sQ.Cgk.Qq',NULL,NULL,NULL,5,'2018-06-14 16:28:21','2018-06-14 10:20:48','190.210.223.10','190.210.223.10','2018-06-13 15:40:13','2018-06-14 16:28:21',13,3,6),(15,'js@mbrecoleta.com','$2a$11$tZZNPRnUiRXMsWu1icqABurA6Gk4UerleztySmg1H2NYJqq20nDkW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-16 12:48:36','2018-06-16 12:48:36',14,4,8),(16,'aa@ergos.com','$2a$11$BL9AgEK.WUXXwKd.ZMp1rOEhDzFrkX9I0EzB.LpTMxQj/sICgWMZW',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-18 10:47:49','2018-06-18 10:47:49',16,NULL,NULL),(17,'ho@gmail.com','$2a$11$bBjiUC5srsLxQaQUcLRefeC8nYI5i5fWrgKccHyPe2rgDfTy8sVQW',NULL,NULL,NULL,6,'2018-06-25 09:45:27','2018-06-23 16:01:57','186.19.72.18','186.19.72.18','2018-06-18 14:53:25','2018-06-25 09:45:27',17,6,10),(18,'adc@bugatti.com','$2a$11$y4zMInqo3Dom39/KmM0Tf.NFmfqYiZn7u0VIwjhZH91R/Yn5MCriC',NULL,NULL,NULL,9,'2018-06-25 09:44:43','2018-06-25 08:53:08','186.19.72.18','186.19.72.18','2018-06-18 15:37:30','2018-06-25 09:44:43',18,3,10),(19,'au@bugatti.com','$2a$11$353SYDmcoz/JPA1KhYx3fuFxgCf9v16E5mEun2xdHQs5HTZjlYJ66',NULL,NULL,NULL,3,'2018-06-22 13:19:23','2018-06-22 13:07:27','179.36.107.42','179.36.107.42','2018-06-22 13:04:59','2018-06-22 13:19:23',20,6,9),(20,'fm@bugatti.com','$2a$11$QalZDo5tLmn2WGOHG6nk5eI8D/FHrZayBwsrKBi7j8bDMaTS4mhHS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-22 13:40:16','2018-06-22 13:40:16',21,6,9),(21,'gl@bmwpalermo.com','$2a$11$udfrseL2g.539oeJazqLUOP1memBN4mna2UJVYcnX9zkw26VpRRzu',NULL,NULL,NULL,4,'2018-06-29 13:04:27','2018-06-29 12:55:33','179.36.91.172','179.36.91.172','2018-06-27 14:21:25','2018-06-29 13:04:27',22,3,1),(22,'mh@rr.com','$2a$11$mwLY/dBqkH8wAYny43eI1OBLRDMRQCCqtDb8dXv0Td/Sk3N7uxvFW',NULL,NULL,NULL,6,'2018-07-02 15:59:35','2018-06-30 09:41:00','179.36.91.172','179.36.91.172','2018-06-29 15:08:18','2018-07-02 15:59:35',24,7,11),(23,'mm@rr.com','$2a$11$W.zImf07YKDYK6TWFxRCUOGbhyYeeKnaDnkILX2/FPUh/gyVNjPGS',NULL,NULL,NULL,9,'2018-07-04 09:18:18','2018-07-02 16:08:49','179.36.74.181','179.36.91.172','2018-06-29 15:21:08','2018-07-04 09:18:18',25,7,11),(24,'pruebagonza@gmail.com','$2a$11$2yefaj8AjWo/.bGW.2xw9.HeCSmaEvTBoKfoBCDV3Ewt7BNVht4AG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-29 16:45:57','2018-06-29 16:45:57',26,7,11),(25,'ms@rr.com','$2a$11$mJJeS1.idSFa4nGki/0aneoEIZ1M0qeW3osgq1eb8MVC4BuZ4KX1S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-30 09:45:10','2018-06-30 09:45:10',27,7,11),(26,'cb@rr.com','$2a$11$m6DHYbvohIN8XBspdf9c0.OFKdcbQjlk3klcR1Oy50GzrU6SIkxt.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2018-06-30 09:55:09','2018-06-30 09:55:09',28,7,11);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `index_users_roles_on_user_id` (`user_id`),
  KEY `index_users_roles_on_role_id` (`role_id`),
  KEY `index_users_roles_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,4),(2,3),(2,4),(3,3),(4,1),(4,2),(5,1),(6,1),(7,1),(8,2),(9,1),(10,1),(10,2),(11,5),(12,1),(12,2),(13,1),(14,1),(15,2),(16,4),(17,2),(17,3),(18,1),(18,2),(20,1),(21,1),(22,3),(23,1),(23,2),(25,1),(26,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedors`
--

DROP TABLE IF EXISTS `vendedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` blob,
  `numero` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `punto_venta_id` int(11) DEFAULT NULL,
  `foto_file_name` varchar(255) DEFAULT NULL,
  `foto_content_type` varchar(255) DEFAULT NULL,
  `foto_file_size` int(11) DEFAULT NULL,
  `foto_updated_at` datetime DEFAULT NULL,
  `avance` int(11) DEFAULT NULL,
  `baja` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedors`
--

LOCK TABLES `vendedors` WRITE;
/*!40000 ALTER TABLE `vendedors` DISABLE KEYS */;
INSERT INTO `vendedors` VALUES (1,NULL,'NT','2018-05-29',NULL,5,'2018-05-29 15:04:12','2018-07-01 20:20:46',1,NULL,NULL,NULL,NULL,5,NULL),(2,NULL,'13','1879-03-14',NULL,6,'2018-05-29 15:07:14','2018-06-07 16:20:36',2,NULL,NULL,NULL,NULL,1,NULL),(3,NULL,'BN','2018-05-31',NULL,7,'2018-05-31 19:33:57','2018-07-01 20:20:46',1,'descarga.jpg','image/jpeg',3159,'2018-05-31 19:33:57',1,NULL),(4,NULL,'AT','2018-06-11',NULL,4,'2018-06-11 13:48:25','2018-07-01 20:20:46',1,'avatar.jpg','image/jpeg',5089,'2018-06-11 13:48:25',4,NULL),(5,NULL,'LM','2018-06-02',NULL,9,'2018-06-11 16:38:44','2018-07-01 20:20:46',1,'perfil.png','image/png',14531,'2018-06-11 16:39:41',6,NULL),(6,NULL,'RD','2018-06-12',NULL,10,'2018-06-12 12:06:31','2018-07-01 20:20:46',1,'descartes.jpg','image/jpeg',8982,'2018-06-12 12:06:31',3,NULL),(7,NULL,'BP1','2018-06-13',NULL,11,'2018-06-13 15:23:11','2018-06-14 10:18:18',6,'bp.jpg','image/jpeg',7047,'2018-06-13 15:38:10',3,NULL),(8,NULL,'AE','2018-06-13',NULL,12,'2018-06-13 15:33:57','2018-06-13 15:33:57',6,'arsenio_erico.jpg','image/jpeg',3595,'2018-06-13 15:33:57',2,NULL),(9,NULL,'HH','2018-06-13',NULL,13,'2018-06-13 15:40:12','2018-06-14 10:18:18',6,'hh.jpg','image/jpeg',7335,'2018-06-13 15:40:42',1,NULL),(10,NULL,'AdC','2018-06-18',NULL,18,'2018-06-18 15:39:03','2018-06-23 17:37:18',10,'lordbyron.jpg','image/jpeg',5204,'2018-06-18 15:39:03',1,NULL),(11,NULL,'FM','2018-06-22',NULL,21,'2018-06-22 13:40:16','2018-06-22 13:40:16',9,'avatar2.jpg','image/jpeg',5786,'2018-06-22 13:40:16',1,NULL),(12,NULL,'GL','2018-06-27',NULL,22,'2018-06-27 14:21:25','2018-07-01 20:20:46',1,'220px-Blaise_Pascal_Versailles.JPG','image/jpeg',9591,'2018-06-27 14:23:57',2,NULL),(13,NULL,'MM','2018-06-29',NULL,25,'2018-06-29 15:30:29','2018-07-02 15:59:48',11,'200px-Marvin_Minsky.jpg','image/jpeg',20522,'2018-06-29 15:30:29',3,NULL),(14,NULL,'Gp','2018-06-29','2018-06-30',26,'2018-06-29 16:45:57','2018-06-30 09:49:55',11,NULL,NULL,NULL,NULL,2,1),(15,NULL,'MS','2018-06-30',NULL,27,'2018-06-30 09:45:10','2018-07-02 15:59:48',11,'Manuel_Sadosky_y_Clementina.jpg','image/jpeg',12054,'2018-06-30 09:45:10',2,NULL),(16,NULL,'CB','2018-06-30',NULL,28,'2018-06-30 09:55:09','2018-07-02 15:59:48',11,'220px-CharlesBabbage.jpg','image/jpeg',19247,'2018-06-30 09:55:08',1,NULL);
/*!40000 ALTER TABLE `vendedors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-04 11:29:33
