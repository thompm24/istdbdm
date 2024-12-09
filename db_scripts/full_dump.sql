-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: langu
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `langu`
--

/*!40000 DROP DATABASE IF EXISTS `langu`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `langu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `langu`;

--
-- Table structure for table `adj`
--

DROP TABLE IF EXISTS `adj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adj` (
  `adj_id` int NOT NULL AUTO_INCREMENT,
  `adj_en` varchar(100) NOT NULL,
  `bags` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`adj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adj`
--

LOCK TABLES `adj` WRITE;
/*!40000 ALTER TABLE `adj` DISABLE KEYS */;
INSERT INTO `adj` VALUES (1,'happy',0),(2,'mean',0),(3,'big',1),(4,'magnificent',0),(5,'reasonable',0),(6,'tiring',0);
/*!40000 ALTER TABLE `adj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adj_agr`
--

DROP TABLE IF EXISTS `adj_agr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adj_agr` (
  `adj_id` int NOT NULL,
  `gender` char(1) NOT NULL,
  `plural` tinyint(1) NOT NULL,
  `adj_fr` varchar(100) NOT NULL,
  PRIMARY KEY (`adj_id`,`gender`,`plural`),
  CONSTRAINT `adj_agr_ibfk_1` FOREIGN KEY (`adj_id`) REFERENCES `adj` (`adj_id`),
  CONSTRAINT `adj_agr_chk_1` CHECK ((`gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adj_agr`
--

LOCK TABLES `adj_agr` WRITE;
/*!40000 ALTER TABLE `adj_agr` DISABLE KEYS */;
INSERT INTO `adj_agr` VALUES (1,'F',0,'heureuse'),(1,'F',1,'heureuses'),(1,'M',0,'heureux'),(1,'M',1,'heureux'),(2,'F',0,'méchante'),(2,'F',1,'méchantes'),(2,'M',0,'méchant'),(2,'M',1,'méchants'),(3,'F',0,'grande'),(3,'F',1,'grandes'),(3,'M',0,'grand'),(3,'M',1,'grands'),(4,'F',0,'magnifique'),(4,'F',1,'magnifiques'),(4,'M',0,'magnifique'),(4,'M',1,'magnifiques'),(5,'F',0,'raisonnable'),(5,'F',1,'raisonnables'),(5,'M',0,'raisonnable'),(5,'M',1,'raisonnables'),(6,'F',0,'fatigante'),(6,'F',1,'fatigantes'),(6,'M',0,'fatigant'),(6,'M',1,'fatigants');
/*!40000 ALTER TABLE `adj_agr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adv`
--

DROP TABLE IF EXISTS `adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adv` (
  `adv_id` int NOT NULL AUTO_INCREMENT,
  `adv_fr` varchar(100) NOT NULL,
  `adv_en` varchar(100) NOT NULL,
  `type` enum('manner','time','place','degree','frequency','negation') NOT NULL,
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adv`
--

LOCK TABLES `adv` WRITE;
/*!40000 ALTER TABLE `adv` DISABLE KEYS */;
INSERT INTO `adv` VALUES (1,'doucement','slowly','manner'),(4,'souvent','often','frequency'),(5,'jamais','never','negation'),(6,'alors','then','time'),(7,'longtemps','for a long time','time'),(9,'d\'abord','at first','time'),(10,'next','ensuite','time'),(11,'toujours','always','frequency'),(12,'bien','well','degree'),(13,'gravement','seriously','manner'),(14,'gentiment','kindly','manner'),(15,'timidement','timidly','manner'),(16,'soigneusement','carefully','manner'),(17,'majestueuesement','majestically','manner'),(18,'lentement','slowly','manner'),(19,'attentivement','attentively','manner'),(20,'fermement','firmly','manner'),(21,'naïvement','naively','manner');
/*!40000 ALTER TABLE `adv` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add conj',7,'add_conj'),(26,'Can change conj',7,'change_conj'),(27,'Can delete conj',7,'delete_conj'),(28,'Can view conj',7,'view_conj'),(29,'Can add subj',8,'add_subj'),(30,'Can change subj',8,'change_subj'),(31,'Can delete subj',8,'delete_subj'),(32,'Can view subj',8,'view_subj'),(33,'Can add tense',9,'add_tense'),(34,'Can change tense',9,'change_tense'),(35,'Can delete tense',9,'delete_tense'),(36,'Can view tense',9,'view_tense'),(37,'Can add verb',10,'add_verb'),(38,'Can change verb',10,'change_verb'),(39,'Can delete verb',10,'delete_verb'),(40,'Can view verb',10,'view_verb');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
-- Table structure for table `conj`
--

DROP TABLE IF EXISTS `conj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conj` (
  `verb_id` int NOT NULL,
  `subj_id` int NOT NULL,
  `tense_id` int NOT NULL,
  `eng_conj` varchar(100) NOT NULL,
  `fr_conj` varchar(100) NOT NULL,
  PRIMARY KEY (`verb_id`,`subj_id`,`tense_id`),
  KEY `subj_id` (`subj_id`),
  KEY `tense_id` (`tense_id`),
  CONSTRAINT `conj_ibfk_1` FOREIGN KEY (`verb_id`) REFERENCES `verb` (`verb_id`),
  CONSTRAINT `conj_ibfk_2` FOREIGN KEY (`subj_id`) REFERENCES `subj` (`subj_id`),
  CONSTRAINT `conj_ibfk_3` FOREIGN KEY (`tense_id`) REFERENCES `tense` (`tense_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conj`
--

LOCK TABLES `conj` WRITE;
/*!40000 ALTER TABLE `conj` DISABLE KEYS */;
INSERT INTO `conj` VALUES (1,1,1,'have','ai'),(1,1,2,'have had','ai eu'),(1,1,3,'had','avais'),(1,1,4,'am going to have','vais avoir'),(1,1,5,'will have','aurai'),(1,1,6,'would have','aurais'),(1,2,1,'have','as'),(1,2,2,'have had','as eu'),(1,2,3,'had','avais'),(1,2,4,'are going to have','vas avoir'),(1,2,5,'will have','auras'),(1,2,6,'would have','aurais'),(1,3,1,'has','a'),(1,3,2,'has had','a eu'),(1,3,3,'had','avait'),(1,3,4,'is going to have','va avoir'),(1,3,5,'will have','aura'),(1,3,6,'would have','aurait'),(1,4,1,'has','a'),(1,4,2,'has had','a eu'),(1,4,3,'had','avait'),(1,4,4,'is going to have','va avoir'),(1,4,5,'will have','aura'),(1,4,6,'would have','aurait'),(1,5,1,'have','avons'),(1,5,2,'have had','avons eu'),(1,5,3,'had','avions'),(1,5,4,'are going to have','allons avoir'),(1,5,5,'will have','aurons'),(1,5,6,'would have','aurions'),(1,6,1,'have','avez'),(1,6,2,'have had','avez eu'),(1,6,3,'had','aviez'),(1,6,4,'are going to have','allez avoir'),(1,6,5,'will have','aurez'),(1,6,6,'would have','auriez'),(1,7,1,'have','ont'),(1,7,2,'have had','ont eu'),(1,7,3,'had','avaient'),(1,7,4,'are going to have','vont avoir'),(1,7,5,'will have','auront'),(1,7,6,'would have','auraient'),(1,8,1,'have','ont'),(1,8,2,'have had','ont eu'),(1,8,3,'had','avaient'),(1,8,4,'are going to have','vont avoir'),(1,8,5,'will have','auront'),(1,8,6,'would have','auraient'),(2,1,1,'am','suis'),(2,1,2,'have been','ai été'),(2,1,3,'was','étais'),(2,1,4,'am going to be','vais être'),(2,1,5,'will be','serai'),(2,1,6,'would be','serais'),(2,2,1,'are','es'),(2,2,2,'have been','as été'),(2,2,3,'were','étais'),(2,2,4,'are going to be','vas être'),(2,2,5,'will be','seras'),(2,2,6,'would be','serais'),(2,3,1,'is','est'),(2,3,2,'has been','a été'),(2,3,3,'was','était'),(2,3,4,'is going to be','va être'),(2,3,5,'will be','sera'),(2,3,6,'would be','serait'),(2,4,1,'is','est'),(2,4,2,'has been','a été'),(2,4,3,'was','était'),(2,4,4,'is going to be','va être'),(2,4,5,'will be','sera'),(2,4,6,'would be','serait'),(2,5,1,'are','sommes'),(2,5,2,'have been','avons été'),(2,5,3,'were','étions'),(2,5,4,'are going to be','allons être'),(2,5,5,'will be','serons'),(2,5,6,'would be','serions'),(2,6,1,'are','êtes'),(2,6,2,'have been','avez été'),(2,6,3,'were','étiez'),(2,6,4,'are going to be','allez être'),(2,6,5,'will be','serez'),(2,6,6,'would be','seriez'),(2,7,1,'are','sont'),(2,7,2,'have been','ont été'),(2,7,3,'were','étaient'),(2,7,4,'are going to be','vont être'),(2,7,5,'will be','seront'),(2,7,6,'would be','seraient'),(2,8,1,'are','sont'),(2,8,2,'have been','ont été'),(2,8,3,'were','étaient'),(2,8,4,'are going to be','vont être'),(2,8,5,'will be','seront'),(2,8,6,'would be','seraient'),(3,1,1,'go','vais'),(3,1,2,'have gone','suis allé'),(3,1,3,'went','allais'),(3,1,4,'am going to go','vais aller'),(3,1,5,'will go','irai'),(3,1,6,'would go','irais'),(3,2,1,'go','vas'),(3,2,2,'have gone','es allé'),(3,2,3,'went','allais'),(3,2,4,'are going to go','vas aller'),(3,2,5,'will go','iras'),(3,2,6,'would go','irais'),(3,3,1,'goes','va'),(3,3,2,'has gone','est allé'),(3,3,3,'went','allait'),(3,3,4,'is going to go','va aller'),(3,3,5,'will go','ira'),(3,3,6,'would go','irait'),(3,4,1,'goes','va'),(3,4,2,'has gone','est allé'),(3,4,3,'went','allait'),(3,4,4,'is going to go','va aller'),(3,4,5,'will go','ira'),(3,4,6,'would go','irait'),(3,5,1,'go','allons'),(3,5,2,'have gone','sommes allé'),(3,5,3,'went','allions'),(3,5,4,'are going to go','allons aller'),(3,5,5,'will go','irons'),(3,5,6,'would go','irions'),(3,6,1,'go','allez'),(3,6,2,'have gone','êtes allé'),(3,6,3,'went','alliez'),(3,6,4,'are going to go','allez aller'),(3,6,5,'will go','irez'),(3,6,6,'would go','iriez'),(3,7,1,'go','vont'),(3,7,2,'have gone','sont allé'),(3,7,3,'went','allaient'),(3,7,4,'are going to go','vont aller'),(3,7,5,'will go','iront'),(3,7,6,'would go','iraient'),(3,8,1,'go','vont'),(3,8,2,'have gone','sont allé'),(3,8,3,'went','allaient'),(3,8,4,'are goin  to go','vont aller'),(3,8,5,'will go','iront'),(3,8,6,'would go','iraient'),(4,1,1,'speak','parle'),(4,1,2,'have spoken','ai parlé'),(4,1,3,'spoke','parlais'),(4,1,4,'am going to speak','vais parler'),(4,1,5,'will speak','parlerai'),(4,1,6,'would speak','parlerais'),(4,2,1,'speak','parles'),(4,2,2,'have spoken','as parlé'),(4,2,3,'spoke','parlais'),(4,2,4,'are going to speak','vas parler'),(4,2,5,'will speak','parleras'),(4,2,6,'would speak','parlerais'),(4,3,1,'speaks','parle'),(4,3,2,'has spoken','a parlé'),(4,3,3,'spoke','parlais'),(4,3,4,'is going to speak','va parler'),(4,3,5,'will speak','parlera'),(4,3,6,'would speak','parlerait'),(4,4,1,'speaks','parle'),(4,4,2,'has spoken','a parlé'),(4,4,3,'spoke','parlait'),(4,4,4,'is going to speak','va parler'),(4,4,5,'will speak','parlera'),(4,4,6,'would speak','parlerait'),(4,5,1,'speak','perlons'),(4,5,2,'have spoken','avons parlé'),(4,5,3,'spoke','parlait'),(4,5,4,'are going to speak','allons parler'),(4,5,5,'will speak','parlerens'),(4,5,6,'would speak','parlerions'),(4,6,1,'speak','parlez'),(4,6,2,'have spoken','avez parlé'),(4,6,3,'spoke','parlions'),(4,6,4,'are going to speak','allez parler'),(4,6,5,'will speak','parlerez'),(4,6,6,'would speak','parleriez'),(4,7,1,'speak','parlent'),(4,7,2,'have spoken','ont parlé'),(4,7,3,'spoke','parliez'),(4,7,4,'are going to speak','vont parler'),(4,7,5,'will speak','parleront'),(4,7,6,'would speak','parleraient'),(4,8,1,'speak','parlent'),(4,8,2,'have spoken','ont parlé'),(4,8,3,'spoke','parlaient'),(4,8,4,'are going to speak','vont parler'),(4,8,5,'will speak','parleront'),(4,8,6,'would speak','parleraient'),(5,1,1,'draw','dessine'),(5,1,2,'have drawn','ai dessiné'),(5,1,3,'drew','dessinais'),(5,1,4,'am going to draw','vais dessiner'),(5,1,5,'will draw','dessinerai'),(5,1,6,'would draw','dessinerais'),(5,2,1,'draw','dessines'),(5,2,2,'have drawn','as dessiné'),(5,2,3,'drew','dessinais'),(5,2,4,'are going to draw','vas dessiner'),(5,2,5,'will draw','dessineras'),(5,2,6,'would draw','dessinerais'),(5,3,1,'draws','dessine'),(5,3,2,'has drawn','a dessiné'),(5,3,3,'drew','dessinait'),(5,3,4,'is going to draw','va dessiner'),(5,3,5,'will draw','dessinera'),(5,3,6,'would draw','dessinerait'),(5,4,1,'draws','dessine'),(5,4,2,'has drawn','a dessiné'),(5,4,3,'drew','dessinait'),(5,4,4,'is going to draw','va dessiner'),(5,4,5,'will draw','dessinera'),(5,4,6,'would draw','dessinerait'),(5,5,1,'draw','dessinons'),(5,5,2,'have drawn','avons dessiné'),(5,5,3,'drew','dessinions'),(5,5,4,'are going to draw','allons dessiner'),(5,5,5,'will draw','dessinerons'),(5,5,6,'would draw','dessinerions'),(5,6,1,'draw','dessinez'),(5,6,2,'have drawn','avez dessiné'),(5,6,3,'drew','dessiniez'),(5,6,4,'are going to draw','allez dessiner'),(5,6,5,'will draw','dessinerez'),(5,6,6,'would draw','dessineriez'),(5,7,1,'draw','dessinent'),(5,7,2,'have drawn','ont dessiné'),(5,7,3,'drew','dessinaient'),(5,7,4,'are going to draw','vont dessiner'),(5,7,5,'will draw','dessineront'),(5,7,6,'would draw','dessineraient'),(5,8,1,'draw','dessinent'),(5,8,2,'have drawn','ont dessiné'),(5,8,3,'drew','dessinaient'),(5,8,4,'are going to draw','vont dessiner'),(5,8,5,'will draw','dessineront'),(5,8,6,'would draw','dessineraient'),(6,1,1,'move','bouge'),(6,1,2,'have moved','ai bougé'),(6,1,3,'moved','bougais'),(6,1,4,'am going to move','vais bouger'),(6,1,5,'will move','bougerai'),(6,1,6,'would move','bougerais'),(6,2,1,'move','bouges'),(6,2,2,'have moved','as bougé'),(6,2,3,'moved','bougais'),(6,2,4,'are going to move','vas bouger'),(6,2,5,'will move','bougeras'),(6,2,6,'would move','bougerais'),(6,3,1,'moves','bouge'),(6,3,2,'has moved','a bougé'),(6,3,3,'moved','bougait'),(6,3,4,'is going to move','va bouger'),(6,3,5,'will move','bougera'),(6,3,6,'would move','bougerait'),(6,4,1,'moves','bouge'),(6,4,2,'has moved','a bougé'),(6,4,3,'moved','bougait'),(6,4,4,'is going to move','va bouger'),(6,4,5,'will move','bougera'),(6,4,6,'would move','bougerait'),(6,5,1,'move','bougons'),(6,5,2,'have moved','avons bougé'),(6,5,3,'moved','bougions'),(6,5,4,'are going to move','allons bouger'),(6,5,5,'will move','bougerons'),(6,5,6,'would move','bougerions'),(6,6,1,'move','bougez'),(6,6,2,'have moved','avez bougé'),(6,6,3,'moved','bougiez'),(6,6,4,'are going to move','allez bouger'),(6,6,5,'will move','bougerez'),(6,6,6,'would move','bougeriez'),(6,7,1,'move','bougent'),(6,7,2,'have moved','ont bougé'),(6,7,3,'moved','bougaient'),(6,7,4,'are going to move','vont bouger'),(6,7,5,'will move','bougeront'),(6,7,6,'would move','bougeraient'),(6,8,1,'move','bougent'),(6,8,2,'have moved','ont bougé'),(6,8,3,'moved','bougaient'),(6,8,4,'are going to move','vont bouger'),(6,8,5,'will move','bougeront'),(6,8,6,'would move','bougeraient'),(8,1,1,'smile','souris'),(8,1,2,'have smiled','ai souri'),(8,1,3,'smiled','souriais'),(8,1,4,'am going to smile','vais sourire'),(8,1,5,'will smile','sourirai'),(8,1,6,'would smile','sourirais'),(8,2,1,'smile','souris'),(8,2,2,'have smiled','as souri'),(8,2,3,'smiled','souriais'),(8,2,4,'are going to smile','vas sourire'),(8,2,5,'will smile','souriras'),(8,2,6,'would smile','sourirais'),(8,3,1,'smiles','sourit'),(8,3,2,'has smiled','a souri'),(8,3,3,'smiled','souriait'),(8,3,4,'is going to smile','va sourire'),(8,3,5,'will smile','sourira'),(8,3,6,'would smile','sourirait'),(8,4,1,'smiles','sourit'),(8,4,2,'has smiled','a souri'),(8,4,3,'smiled','souriait'),(8,4,4,'is going to smile','va sourire'),(8,4,5,'will smile','sourira'),(8,4,6,'would smile','sourirait'),(8,5,1,'smile','sourions'),(8,5,2,'have smiled','avons souri'),(8,5,3,'smileds','souriions'),(8,5,4,'are going to smile','allons sourire'),(8,5,5,'will smile','souririons'),(8,5,6,'would smile','souririons'),(8,6,1,'smile','souriez'),(8,6,2,'have smiled','avez souri'),(8,6,3,'smiled','souriiez'),(8,6,4,'are going to smile','allez sourire'),(8,6,5,'will smile','sourirz'),(8,6,6,'would smile','souririez'),(8,7,1,'smile','sourient'),(8,7,2,'have smiled','ont souri'),(8,7,3,'smiled','souriaient'),(8,7,4,'are going to smile','vont sourire'),(8,7,5,'will smile','souriront'),(8,7,6,'would smile','souririez'),(8,8,1,'smile','sourient'),(8,8,2,'have smiled','ont souri'),(8,8,3,'smiled','souriaient'),(8,8,4,'are going to smile','vont sourire'),(8,8,5,'will smile','souriront'),(8,8,6,'would smile','souriraient'),(9,1,1,'watch','regarde'),(9,1,2,'have watched','ai regardé'),(9,1,3,'watched','regardais'),(9,1,4,'am going to watch','vais regarder'),(9,1,5,'will watch','regarderai'),(9,1,6,'would watch','regarderais'),(9,2,1,'watch','regardes'),(9,2,2,'have watched','as regardé'),(9,2,3,'watched','regardais'),(9,2,4,'are going to watch','vas regarder'),(9,2,5,'will watch','regarderas'),(9,2,6,'would watch','regarderais'),(9,3,1,'watches','regarde'),(9,3,2,'has watched','a regardé'),(9,3,3,'watched','regardait'),(9,3,4,'is going to watch','va regarder'),(9,3,5,'will watch','regardera'),(9,3,6,'would watch','regarderait'),(9,4,1,'watches','regarde'),(9,4,2,'has watched','a regardé'),(9,4,3,'watched','regardait'),(9,4,4,'is going to watch','va regareder'),(9,4,5,'will watch','regardera'),(9,4,6,'would watch','regarderait'),(9,5,1,'wath','regardon'),(9,5,2,'have watched','avons regardé'),(9,5,3,'watched','regardions'),(9,5,4,'are going to watch','allons regarder'),(9,5,5,'will watch','regarderons'),(9,5,6,'would watch','regarderions'),(9,6,1,'watch','regardez'),(9,6,2,'have watched','avez regardé'),(9,6,3,'watched','regardiez'),(9,6,4,'are going to watch','allez regarder'),(9,6,5,'will watch','regarderez'),(9,6,6,'would watch','regardiez'),(9,7,1,'watch','regardent'),(9,7,2,'have watched','ont regardé'),(9,7,3,'watched','regardaient'),(9,7,4,'are going to watch','vont regarder'),(9,7,5,'will watch','regarderont'),(9,7,6,'would watch','regarderaient'),(9,8,1,'watch','regardent'),(9,8,2,'have watched','ont regardé'),(9,8,3,'watched','regardaient'),(9,8,4,'are going to watch','vont regarder'),(9,8,5,'will watch','regarderont'),(9,8,6,'would watch','regarderaient'),(10,1,1,'want','veux'),(10,1,2,'have wanted','ai voulu'),(10,1,3,'wanted','voulais'),(10,1,4,'am going to want','vais vouloir'),(10,1,5,'will want','voudrai'),(10,1,6,'would want','voudrais'),(10,2,1,'want','veux'),(10,2,2,'have wanted','as voulu'),(10,2,3,'wanted','voulais'),(10,2,4,'are going to want','vas vouloir'),(10,2,5,'will want','voudras'),(10,2,6,'would want','voudrais'),(10,3,1,'wants','veut'),(10,3,2,'has wanted','a voulu'),(10,3,3,'wanted','voulait'),(10,3,4,'is going to want','va vouloir'),(10,3,5,'will want','voudra'),(10,3,6,'would want','voudrait'),(10,4,1,'wants','veut'),(10,4,2,'has wanted','a voulu'),(10,4,3,'wanted','voulait'),(10,4,4,'is going to want','va vouloir'),(10,4,5,'will want','voudra'),(10,4,6,'would want','voudrait'),(10,5,1,'want','voulons'),(10,5,2,'have wanted','avons voulu'),(10,5,3,'wanted','voulions'),(10,5,4,'are going to want','allons vouloir'),(10,5,5,'will want','voudrons'),(10,5,6,'would want','voudrions'),(10,6,1,'want','voulez'),(10,6,2,'have wanted','avez voulu'),(10,6,3,'wanted','vouliez'),(10,6,4,'are going to want','allez vouloir'),(10,6,5,'will want','voudrez'),(10,6,6,'would want','voudriez'),(10,7,1,'want','veulent'),(10,7,2,'have wanted','ont voulu'),(10,7,3,'wanted','voulaient'),(10,7,4,'are going to want','vont vouloir'),(10,7,5,'will want','voudront'),(10,7,6,'would want','voudraient'),(10,8,1,'want','veulent'),(10,8,2,'have wanted','ont voulu'),(10,8,3,'wanted','voulaient'),(10,8,4,'are going to want','vont vouloir'),(10,8,5,'will want','voudront'),(10,8,6,'would want','voudraient');
/*!40000 ALTER TABLE `conj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_agr`
--

DROP TABLE IF EXISTS `det_agr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `det_agr` (
  `det_id` int NOT NULL,
  `gender` char(1) NOT NULL,
  `plural` tinyint(1) NOT NULL,
  `det_fr` varchar(50) NOT NULL,
  PRIMARY KEY (`det_id`,`gender`,`plural`),
  CONSTRAINT `det_agr_ibfk_1` FOREIGN KEY (`det_id`) REFERENCES `determinant` (`det_id`),
  CONSTRAINT `det_agr_chk_1` CHECK ((`gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_agr`
--

LOCK TABLES `det_agr` WRITE;
/*!40000 ALTER TABLE `det_agr` DISABLE KEYS */;
INSERT INTO `det_agr` VALUES (1,'F',0,'cette'),(1,'M',0,'ce'),(2,'F',0,'ma'),(2,'F',1,'mes'),(2,'M',0,'mon'),(2,'M',1,'mes'),(3,'F',0,'ta'),(3,'F',1,'tes'),(3,'M',0,'ton'),(3,'M',1,'tes'),(4,'F',0,'votre'),(4,'F',1,'vos'),(4,'M',0,'votre'),(4,'M',1,'vos'),(5,'F',0,'notre'),(5,'F',1,'nos'),(5,'M',0,'notre'),(5,'M',1,'nos'),(6,'F',0,'la'),(6,'F',1,'les'),(6,'M',0,'le'),(6,'M',1,'les'),(7,'F',0,'une'),(7,'M',0,'un'),(8,'F',1,'des'),(8,'M',1,'des'),(9,'F',0,'sa'),(9,'F',1,'ses'),(9,'M',0,'son'),(9,'M',1,'ses'),(10,'F',0,'sa'),(10,'F',1,'ses'),(10,'M',0,'son'),(10,'M',1,'ses'),(14,'F',1,'ces'),(14,'M',1,'ces');
/*!40000 ALTER TABLE `det_agr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `determinant`
--

DROP TABLE IF EXISTS `determinant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `determinant` (
  `det_id` int NOT NULL AUTO_INCREMENT,
  `det_en` varchar(50) NOT NULL,
  PRIMARY KEY (`det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `determinant`
--

LOCK TABLES `determinant` WRITE;
/*!40000 ALTER TABLE `determinant` DISABLE KEYS */;
INSERT INTO `determinant` VALUES (1,'this'),(2,'my'),(3,'your(informal)'),(4,'your(formal)'),(5,'our'),(6,'the'),(7,'a'),(8,'some'),(9,'his'),(10,'her'),(11,'some(uncountable)'),(12,'which'),(14,'these');
/*!40000 ALTER TABLE `determinant` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','conj'),(8,'app','subj'),(9,'app','tense'),(10,'app','verb'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-01 09:44:50.260126'),(2,'auth','0001_initial','2024-12-01 09:44:51.677770'),(3,'admin','0001_initial','2024-12-01 09:44:51.995443'),(4,'admin','0002_logentry_remove_auto_add','2024-12-01 09:44:52.018146'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-01 09:44:52.032183'),(6,'app','0001_initial','2024-12-01 09:44:52.043835'),(7,'contenttypes','0002_remove_content_type_name','2024-12-01 09:44:52.230792'),(8,'auth','0002_alter_permission_name_max_length','2024-12-01 09:44:52.364219'),(9,'auth','0003_alter_user_email_max_length','2024-12-01 09:44:52.412644'),(10,'auth','0004_alter_user_username_opts','2024-12-01 09:44:52.431228'),(11,'auth','0005_alter_user_last_login_null','2024-12-01 09:44:52.540591'),(12,'auth','0006_require_contenttypes_0002','2024-12-01 09:44:52.547361'),(13,'auth','0007_alter_validators_add_error_messages','2024-12-01 09:44:52.562576'),(14,'auth','0008_alter_user_username_max_length','2024-12-01 09:44:52.699457'),(15,'auth','0009_alter_user_last_name_max_length','2024-12-01 09:44:52.836498'),(16,'auth','0010_alter_group_name_max_length','2024-12-01 09:44:52.875700'),(17,'auth','0011_update_proxy_permissions','2024-12-01 09:44:52.894536'),(18,'auth','0012_alter_user_first_name_max_length','2024-12-01 09:44:53.029261'),(19,'sessions','0001_initial','2024-12-01 09:44:53.112502');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noun`
--

DROP TABLE IF EXISTS `noun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noun` (
  `noun_id` int NOT NULL AUTO_INCREMENT,
  `noun_fr` varchar(100) NOT NULL,
  `noun_english` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  `plural` tinyint(1) NOT NULL,
  `is_countable` tinyint(1) NOT NULL DEFAULT '0',
  `is_animate` tinyint(1) NOT NULL DEFAULT '0',
  `can_be_agent` tinyint(1) NOT NULL DEFAULT '0',
  `can_be_patient` tinyint(1) NOT NULL DEFAULT '0',
  `is_location` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`noun_id`),
  CONSTRAINT `noun_chk_1` CHECK ((`gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noun`
--

LOCK TABLES `noun` WRITE;
/*!40000 ALTER TABLE `noun` DISABLE KEYS */;
INSERT INTO `noun` VALUES (1,'mouton','sheep','M',0,1,1,1,1,0),(2,'éléphant','elephant','M',0,1,1,1,1,0),(3,'éléphants','elephants','M',1,1,1,1,1,0),(4,'serpent boa','boa constrictor','M',0,1,1,1,1,0),(5,'forêt vierge','rainforest','F',0,1,0,0,0,1),(6,'forêt','forest','F',0,1,0,0,0,1),(7,'forêts','forests','F',1,1,0,0,0,1),(8,'fauve','wild animal','M',0,1,1,1,1,0),(9,'fauves','wild animals','M',1,1,1,1,1,0),(10,'copie','copy','F',0,1,0,0,1,0),(11,'copies','copies','F',1,1,0,0,1,0),(12,'proie','prey','F',0,1,1,0,1,0),(13,'mois','month','M',0,1,0,0,0,0),(14,'mois','months','M',1,1,0,0,0,0),(15,'aventure','adventure','F',0,1,0,0,0,0),(16,'aventures','adventures','F',1,1,0,0,0,0),(17,'jungle','jungle','F',0,1,0,0,0,1),(18,'jungles','jungles','F',1,1,0,0,0,1),(19,'crayon','pencil','M',0,1,0,0,1,0),(20,'crayons','pencils','M',1,1,0,0,1,0),(21,'tour','turn','M',0,1,0,0,0,0),(22,'dessin','drawing','M',0,1,0,0,1,0),(23,'dessins','drawings','M',1,1,0,0,1,0),(24,'chef-d\'œvre','masterpiece','M',0,1,0,0,1,0),(25,'chef-d\'œvres','masterpieces','M',1,1,0,0,1,0),(27,'personne','person','F',0,1,1,1,1,0),(28,'personnes','people','F',1,1,1,1,1,0),(29,'jour','day','M',0,1,0,0,0,0),(30,'désert','desert','M',0,1,0,0,0,1),(31,'déserts','deserts','M',0,1,0,0,0,1),(32,'cheveux','hair','M',1,0,0,0,0,0),(33,'fleur','flower','F',0,1,0,0,0,0),(34,'fleurs','flowers','F',1,1,0,0,0,0),(35,'ciel','sky','M',0,0,0,0,0,0),(36,'corps','body','M',0,0,0,0,0,0),(37,'étoile','star','F',0,1,0,0,0,0),(38,'étoiles','stars','F',0,1,0,0,0,0),(39,'peine','penalty','F',0,1,0,0,0,0),(40,'peines','penalties','F',1,1,0,0,0,0),(41,'arbre','tree','M',0,1,0,0,0,0),(42,'cadeau','gift','M',1,1,0,0,1,0),(43,'cadeaus','gifts','M',1,1,0,0,1,0),(44,'arbres','trees','M',1,1,0,0,1,0),(45,'travail','work','M',0,0,0,0,0,0),(46,'yeux','eyes','M',1,1,0,0,0,0);
/*!40000 ALTER TABLE `noun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subj`
--

DROP TABLE IF EXISTS `subj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subj` (
  `subj_id` int NOT NULL AUTO_INCREMENT,
  `eng_subj` varchar(50) NOT NULL,
  `fr_subj` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `plurality` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`subj_id`),
  CONSTRAINT `subj_chk_1` CHECK ((`gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subj`
--

LOCK TABLES `subj` WRITE;
/*!40000 ALTER TABLE `subj` DISABLE KEYS */;
INSERT INTO `subj` VALUES (1,'I','je','M',0),(2,'you(sing.)','tu','M',0),(3,'he','il','M',0),(4,'she','elle','F',0),(5,'we','nous','M',1),(6,'you(plur.)','vous','M',1),(7,'they (masculine)','ils','M',1),(8,'they (feminine)','elles','F',1);
/*!40000 ALTER TABLE `subj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tense`
--

DROP TABLE IF EXISTS `tense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tense` (
  `tense_id` int NOT NULL AUTO_INCREMENT,
  `tense_name` varchar(100) NOT NULL,
  PRIMARY KEY (`tense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tense`
--

LOCK TABLES `tense` WRITE;
/*!40000 ALTER TABLE `tense` DISABLE KEYS */;
INSERT INTO `tense` VALUES (1,'present'),(2,'passé composé'),(3,'imparfait'),(4,'futur proche'),(5,'futur simple'),(6,'conditionnel');
/*!40000 ALTER TABLE `tense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verb`
--

DROP TABLE IF EXISTS `verb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verb` (
  `verb_id` int NOT NULL AUTO_INCREMENT,
  `eng_inf` varchar(100) NOT NULL,
  `fr_inf` varchar(100) NOT NULL,
  `group` tinyint NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`verb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verb`
--

LOCK TABLES `verb` WRITE;
/*!40000 ALTER TABLE `verb` DISABLE KEYS */;
INSERT INTO `verb` VALUES (1,'to have','avoir',3,'transitive'),(2,'to be','être',3,'state'),(3,'to go','aller',3,'intransitive'),(4,'to speak','parler',1,'intransitive'),(5,'to draw','dessiner',1,'transitive'),(6,'to move','bouger',1,'transitive'),(8,'to smile','sourire',3,'intransitive'),(9,'to watch','regarder',1,'transitive'),(10,'to want','vouloir',3,'modal');
/*!40000 ALTER TABLE `verb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-07 21:30:04
-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int unsigned NOT NULL DEFAULT '0',
  `max_updates` int unsigned NOT NULL DEFAULT '0',
  `max_connections` int unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT 'caching_sha2_password',
  `authentication_string` text COLLATE utf8mb3_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_role_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Password_reuse_history` smallint unsigned DEFAULT NULL,
  `Password_reuse_time` smallint unsigned DEFAULT NULL,
  `Password_require_current` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `User_attributes` json DEFAULT NULL,
  PRIMARY KEY (`Host`,`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--
-- WHERE:  user='mark'

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
CREATE USER 'mark'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON langu.* TO 'mark'@'localhost';
FLUSH PRIVILEGES;

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-07 21:30:23
-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db` (
  `Host` char(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`,`Db`),
  KEY `User` (`User`)
) /*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--
-- WHERE:  user='mark'

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('localhost','langu','mark','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','language_learning','mark','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-07 21:30:43
