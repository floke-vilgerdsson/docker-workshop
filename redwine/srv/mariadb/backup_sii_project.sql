-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bitnami_redmine
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2022-11-29 17:34:57.929764','2022-11-29 17:34:57.929764');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT 0,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `digest` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  KEY `index_attachments_on_disk_filename` (`disk_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `base_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT 0,
  `tls` tinyint(1) NOT NULL DEFAULT 0,
  `filter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  `verify_peer` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topics_count` int(11) NOT NULL DEFAULT 0,
  `messages_count` int(11) NOT NULL DEFAULT 0,
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  KEY `index_changesets_issues_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_enumerations`
--

DROP TABLE IF EXISTS `custom_field_enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_enumerations`
--

LOCK TABLES `custom_field_enumerations` WRITE;
/*!40000 ALTER TABLE `custom_field_enumerations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regexp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_for_all` tinyint(1) NOT NULL DEFAULT 0,
  `is_filter` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT 0,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editable` tinyint(1) DEFAULT 1,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `multiple` tinyint(1) DEFAULT 0,
  `format_store` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `tracker_id` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT 0,
  `custom_field_id` int(11) NOT NULL DEFAULT 0,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES (1,1,'antoniom291b@gmail.com',1,1,'2022-11-29 17:34:43','2022-11-29 17:34:43'),(2,9,'algaro@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(3,10,'carmarsan2311@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(4,11,'baachouchc@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(5,12,'crsitianrodri@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(6,13,'romeroh.fausto@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(7,14,'juanhica@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(8,15,'lidiacrupe@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(9,16,'pceballos09@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(10,17,'sihamabdelli1998@gmail.com',1,1,'2024-12-11 15:01:27','2024-12-11 15:01:27'),(11,18,'yotalvaroz@live.com',1,1,'2024-12-11 15:01:28','2024-12-11 15:01:28'),(12,19,'carmen@us.es',1,1,'2024-12-11 20:26:17','2024-12-11 20:26:17');
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Baja',1,0,'IssuePriority',1,NULL,NULL,'lowest'),(2,'Normal',2,1,'IssuePriority',1,NULL,NULL,'default'),(3,'Alta',3,0,'IssuePriority',1,NULL,NULL,'high4'),(4,'Urgente',4,0,'IssuePriority',1,NULL,NULL,'high3'),(5,'Inmediata',5,0,'IssuePriority',1,NULL,NULL,'high2'),(6,'Documentación de usuario',1,0,'DocumentCategory',1,NULL,NULL,NULL),(7,'Documentación técnica',2,0,'DocumentCategory',1,NULL,NULL,NULL),(8,'Diseño',1,0,'TimeEntryActivity',1,NULL,NULL,NULL),(9,'Desarrollo',2,0,'TimeEntryActivity',1,NULL,NULL,NULL),(10,'VIP',6,0,'IssuePriority',1,NULL,NULL,'highest');
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_import_items_on_import_id_and_unique_id` (`import_id`,`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
INSERT INTO `import_items` VALUES (1,1,1,9,NULL,NULL),(2,1,2,10,NULL,NULL),(3,1,3,11,NULL,NULL),(4,1,4,12,NULL,NULL),(5,1,5,13,NULL,NULL),(6,1,6,14,NULL,NULL),(7,1,7,15,NULL,NULL),(8,1,8,16,NULL,NULL),(9,1,9,17,NULL,NULL),(10,1,10,NULL,'Correo electrónico ya está en uso\nIdentificador ya está en uso',NULL),(11,1,11,18,NULL,NULL);
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_items` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
INSERT INTO `imports` VALUES (1,'UserImport',1,'04befae35b75d64fe15eb5f9d6dce39c','---\nseparator: \";\"\nwrapper: \"\\\"\"\nencoding: ISO-8859-15\ndate_format: \"%Y-%m-%d\"\nnotifications: \'0\'\nmapping: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  login: \'0\'\n  firstname: \'1\'\n  lastname: \'2\'\n  mail: \'3\'\n  language: \'\'\n  admin: \'4\'\n  auth_source: \'\'\n  password: \'\'\n  must_change_passwd: \'\'\n  status: \'5\'\n',11,1,'2024-12-11 15:01:21','2024-12-11 15:01:28');
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'Nueva',0,1,NULL),(2,'En curso',0,2,NULL),(3,'Resuelta',0,3,NULL),(4,'Comentarios',0,4,NULL),(5,'Cerrada',1,5,NULL),(6,'Rechazada',1,6,NULL),(7,'A la espera de recursos',0,7,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT 0,
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `closed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  KEY `index_issues_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,2,1,'1. Recolección requerimientos funcionales y no funcionales	','Análisis de viabilidad del proyecto, su objetivo es analizar si nuestra compañía debe embarcarse en dicho proyecto. Se extraen los requisitos del producto de software. El contenido de comunicación en esta etapa es muy intenso ya que el objetivo es eliminar la ambigüedad en la medida de lo posible.\r\n\r\nEl análisis de viabilidad debe incluir al menos las siguientes actividades:\r\n\r\n* Creación del registro de seguimiento en la herramienta de gestión de la empresa.\r\n* Análisis previo del alcance del proyecto.\r\n* Análisis de los riesgos de ejecución del proyecto.\r\n* Análisis de viabilidad de acuerdo a plazos, coste y calidad','2022-04-15',NULL,1,NULL,2,NULL,1,4,'2022-11-29 16:40:44','2022-11-29 16:43:54','2022-01-01',26,NULL,NULL,1,1,8,0,NULL),(2,2,1,'1.1 Identificación y Visión general del Proyecto','Puesta en marcha y ejecución de las acciones previstas en la planificación. Son el conjunto de tareas y actividades que suponen la realización propiamente dicha del proyecto, cuando se deben gestionar los recursos en la forma y el tiempo adecuados, con una orientación a la consecución de los objetivos establecidos.',NULL,NULL,1,NULL,2,NULL,1,1,'2022-11-29 16:41:33','2022-11-29 16:44:38','2022-01-01',30,NULL,1,1,2,3,0,NULL),(3,2,1,'1.2 Motivación del Proyecto	','Tratar de explicar por qué se quiere realizar el proyecto, hacen lo que hacen y cómo podemos ayudar a mejorar su viabilidad.\r\n','2022-02-28',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:42:36','2022-11-29 16:42:36','2022-01-21',20,NULL,1,1,4,5,0,NULL),(4,2,1,'1.3 Objetivo y Alcance del Proyecto	','Por medio de la definición de indicadores de desempeño (KPIs) que sean relevantes para el proyecto, como:\r\n# El volumen de negocios,\r\n# La tasa de satisfacción del cliente,\r\n# El presupuesto consumido,\r\n# La tasa de utilización de recursos,\r\n# Las tareas planificadas vs. las tareas completadas.','2022-04-15',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:43:54','2022-11-29 16:43:54','2022-02-21',30,NULL,1,1,6,7,0,NULL),(5,2,1,'2. Diseño de la Plataforma	','Planificación detallada del trabajo a realizar, su objetivo de esta fase es definir con el máximo detalle posible las tareas a realizar y los recursos necesarios para llevar a buen término el proyecto. Un error de cálculo en esta fase puede ser muy dañino para la empresa. Determinar cómo funcionará de forma general sin entrar en detalles incorporando consideraciones de la implementación tecnológica, como el hardware, la red, etc.\r\nLas actividades clave en esta etapa son:\r\n* Análisis del alcance del proyecto.\r\n* Realización de estimaciones de esfuerzo, costes y recursos.\r\n* Definición del plan de proyecto.\r\n* Negociación del contrato.','2022-06-30',NULL,1,NULL,2,NULL,1,3,'2022-11-29 16:46:04','2022-11-29 16:47:59','2022-03-23',30,NULL,NULL,5,1,6,0,NULL),(6,3,1,'2.1 Establecimiento de las Estructuras de datos','La eficiencia en los sistemas de información está basada en la velocidad de procesamiento, la confiabilidad, la seguridad y el aprovechamiento de los recursos. La disposición de los datos y el manejo adecuado del espacio de memoria es necesaria para el mejoramiento en los procesos de información, por lo que es muy importante diseñar y utilizar estructuras de datos. A través de estas se representan y abstraen situaciones reales de la vida, usándolas como herramientas para la evaluación de soluciones optimas','2022-04-29',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:47:16','2022-11-29 16:47:16','2022-03-23',40,NULL,5,5,2,3,0,NULL),(7,2,1,'2.2. Interfaz Gráfica y algoritmos','','2022-06-30',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:47:59','2022-11-29 16:47:59','2022-03-31',20,NULL,5,5,4,5,0,NULL),(8,2,1,'3. Desarrollo e Implementación del código	','Ejecución del proyecto, se traduce el diseño a código, etapa compleja que se sustentan sobre las etapas anteriores se tengan que realizarse en esta. También se realizan Pruebas para comprobar que el software responda/realice correctamente las tareas indicadas en la especificación.\r\nLas actividades principales de esta etapa son:\r\n- Establecimiento del entorno de trabajo.\r\n- Asignación de las tareas planificadas a los recursos disponibles.\r\n- Ejecución de las tareas planificadas\r\n\r\nEsta etapa, junto a la de planificación detallada, es una de las más importantes para el éxito del proyecto.\r\nEn esta fase se realizan esencialmente 4 tipo de actividades:\r\nSeguimiento de tareas e hitos planificados.\r\nGestión de entregables (incluido control de la calidad).\r\nGestión de incidencias.\r\nGeneración de informes de seguimiento.','2022-09-30',NULL,1,NULL,2,NULL,1,4,'2022-11-29 16:50:23','2022-11-29 16:53:09','2022-05-01',16,NULL,NULL,8,1,8,0,NULL),(9,2,1,'3.1 Creación de seudocódigos	','','2022-06-16',NULL,1,NULL,2,NULL,1,2,'2022-11-29 16:51:12','2022-11-29 16:51:32','2022-05-01',20,NULL,8,8,2,3,0,NULL),(10,2,1,'3.2 Fase de Codificación','','2022-07-28',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:52:42','2022-11-29 16:52:42','2022-05-20',20,NULL,8,8,4,5,0,NULL),(11,2,1,'3.3 Creación de Diagramas de Flujo de Datos','','2022-09-30',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:53:09','2022-11-29 16:53:09','2022-06-15',10,NULL,8,8,6,7,0,NULL),(12,2,1,'4. Realización de Pruebas	','','2022-11-03',NULL,1,NULL,2,NULL,1,4,'2022-11-29 16:55:51','2022-11-29 16:59:10','2022-07-14',16,NULL,NULL,12,1,8,0,NULL),(13,2,1,'4.2 Evaluación Interna','','2022-10-28',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:56:46','2022-11-29 16:56:46','2022-08-26',10,NULL,12,12,2,3,0,NULL),(14,2,1,'4.3 Evaluación con el consumidor','','2022-11-03',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:57:21','2022-11-29 16:57:21','2022-10-12',20,NULL,12,12,4,5,0,NULL),(15,2,1,'4.1 Evaluación de Módulos','','2022-09-23',NULL,1,NULL,2,NULL,1,0,'2022-11-29 16:59:10','2022-11-29 16:59:10','2022-07-14',20,NULL,12,12,6,7,0,NULL),(16,2,1,'5. Puesta en Funcionamiento','Para verificar que están todos los requisitos resueltos antes de dar por cerrado el proyecto.\r\nDocumentación manual de usuario, y posiblemente un manual técnico con el propósito de mantenimiento futuro y ampliaciones al sistema. Mantenimiento correctivo para resolver errores y un mantenimiento evolutivo para mejorar la funcionalidades y/o dar respuesta a nuevos requisitos.\r\nLas tareas clásicas a realizar dentro de esta fase son:\r\n- Cierre formal del proyecto por parte de todos los actores involucrados en el proyecto (stakeholders).\r\n- Realización del backup del proyecto.','2022-11-30',NULL,1,NULL,2,NULL,1,1,'2022-11-29 16:59:58','2022-11-29 16:59:58','2022-10-20',0,NULL,NULL,16,1,2,0,NULL),(17,2,1,'6. Formación y Soporte a los Usuarios','','2022-12-08',NULL,1,NULL,2,NULL,1,1,'2022-11-29 17:00:26','2022-11-29 17:00:26','2022-11-17',0,NULL,NULL,17,1,2,0,NULL),(18,2,1,'7. Mantenimiento y Mejora continua	','','2022-12-31',NULL,1,NULL,2,NULL,1,1,'2022-11-29 17:00:46','2022-11-29 17:00:46','2022-11-29',0,NULL,NULL,18,1,2,0,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT 0,
  `property` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `old_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'attr','child_id',NULL,'2'),(2,2,'attr','child_id',NULL,'3'),(3,3,'attr','child_id',NULL,'4'),(4,4,'attr','child_id',NULL,'6'),(5,5,'attr','child_id',NULL,'7'),(6,6,'attr','parent_id',NULL,'8'),(7,7,'attr','child_id',NULL,'9'),(8,8,'attr','child_id',NULL,'10'),(9,9,'attr','child_id',NULL,'11'),(10,10,'attr','child_id',NULL,'13'),(11,11,'attr','child_id',NULL,'14'),(12,12,'attr','child_id',NULL,'15');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT 0,
  `journalized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `notes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,1,'Issue',1,'','2022-11-29 17:41:33',0),(2,1,'Issue',1,'','2022-11-29 17:42:36',0),(3,1,'Issue',1,'','2022-11-29 17:43:54',0),(4,5,'Issue',1,'','2022-11-29 17:47:16',0),(5,5,'Issue',1,'','2022-11-29 17:47:59',0),(6,9,'Issue',1,'','2022-11-29 17:51:32',0),(7,8,'Issue',1,'','2022-11-29 17:51:32',0),(8,8,'Issue',1,'','2022-11-29 17:52:42',0),(9,8,'Issue',1,'','2022-11-29 17:53:09',0),(10,12,'Issue',1,'','2022-11-29 17:56:46',0),(11,12,'Issue',1,'','2022-11-29 17:57:21',0),(12,12,'Issue',1,'','2022-11-29 17:59:10',0);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`),
  KEY `index_member_roles_on_inherited_from` (`inherited_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT 0,
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT 0,
  `sticky` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,1,'Sobre Propiedad intelectual','','\r\nCualquier producto o subproducto derivado del mismo no podrá ser utilizado para otros fines fuera del ámbito que le corresponda, sin el permiso expreso por escrito de la Administración.\r\n\r\nAsimismo, todos los entregables que deban facilitarse a los Departamentos y Organismos Autónomos del Gobierno Vasco (salvo las ofertas previas) únicamente deberán llevar como logotipo o señas de identidad el escudo del Gobierno Vasco o logotipos aceptados por el propio Departamento y Organismo Autónomo.\r\n\r\nEl Contratista se verá también obligado a guardar las normas vigentes sobre, Copyright, propiedad intelectual y documentación clasificada o de difusión restringida que, por necesidades del contrato, se vea obligado a manejar.',1,'2022-11-29 17:07:40',0),(2,1,'Acceso y protección de datos','','\r\nA estos efectos, deberán establecerse las máximas cautelas en el acceso a los datos.\r\nCualquier infracción en este sentido será calificada como grave y será causa de resolución del contrato, sin perjuicio de las responsabilidades penales, o de otro tipo, en que se puedan incurrir.\r\n\r\nEl adjudicatario quedará obligado al cumplimiento de lo dispuesto en la Ley orgánica 15/1999 de 13 de diciembre, sobre protección de datos de carácter personal y especialmente en lo indicado en su artículo número 12, que a continuación se transcribe:\r\n*“Artículo 12.- Acceso a los datos por cuenta de terceros.*\r\n\r\n1.- (…)\r\n\r\n2.- La realización de tratamientos por cuenta de terceros deberá estar regulada en un contrato que deberá constar por escrito o en alguna otra forma que permita acreditar su celebración y contenido, estableciéndose expresamente que el encargado del tratamiento únicamente tratará los datos conforme a las instrucciones del responsable del tratamiento, que no los aplicará o utilizará con fin distinto al que figure en dicho contrato, ni los comunicará, ni siquiera para su conservación, a otras personas.\r\n\r\nEn el contrato se estipularán, asimismo, las medidas de seguridad a que se refiere el Artículo 9 de esta Ley que el encargado del tratamiento está obligado a implementar.\r\n\r\n3.- Una vez cumplida la prestación contractual, los datos de carácter personal deberán ser destruido o devueltos al responsable del tratamiento, al igual que cualquier otro soporte o documentos en que conste algún dato de carácter personal objeto del\r\ntratamiento.\r\n\r\n4.- En el caso de que el encargado del tratamiento destine los datos a otra finalidad, los comunique o los utilice incumpliendo las estipulaciones del contrato, será considerado también responsable del tratamiento, respondiendo de las infracciones en que se hubiera incurrido personalmente.”\r\n\r\nA tal fin, y conforme el Real Decreto 994/1999, de 11 de junio, por el que se aprueba el Reglamento de medidas de seguridad de los ficheros automatizados que contengan datos de carácter personal, el oferente incluirá en su oferta Memoria Descriptiva de las medidas de seguridad que adoptarán para asegurar la disponibilidad, confidencialidad e integridad de los datos manejados y de la documentación facilitada.\r\n	 \r\n',1,'2022-11-29 17:11:36',0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assoc_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_url` blob DEFAULT NULL,
  `secret` blob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT 0,
  `default_version_id` int(11) DEFAULT NULL,
  `default_assigned_to_id` int(11) DEFAULT NULL,
  `default_issue_query_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'PROYECTO: 00_Contratación de una Oficina Técnica de Gestión de Software','El objeto de este proeycto es la organización de las fases y necesidades para la adquisición de una plataforma expediente es la contratación de los servicios de asistencia técnica y consultoría para poner en marcha y ejecutar las tareas relativas a una Oficina Técnica de Gestión de Software, siendo su principal objetivo el de apoyar en sus labores al Área de Desarrollo de la DTIT del Departamento de Interior del Gobierno Andaluz.','',1,NULL,'2022-11-29 16:36:56','2022-11-29 16:36:56','proyecto-00_contratacion-de-una-oficina-tecnica-de-gestion-de-software',1,1,2,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT 0,
  `tracker_id` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `column_names` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_criteria` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,NULL,'Peticiones que me están asignadas','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nassigned_to_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - priority\n  - desc\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(2,NULL,'Peticiones registradas por mí','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nauthor_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(3,NULL,'Peticiones actualizadas','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nupdated_by:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(4,NULL,'Peticiones monitorizadas','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nwatcher_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(5,NULL,'Mis proyectos','---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - mine\n',0,NULL,NULL,NULL,'ProjectQuery',2,NULL),(6,NULL,'Mis marcadores','---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - bookmarks\n',0,NULL,NULL,NULL,'ProjectQuery',2,NULL),(7,NULL,'Tiempo dedicado','---\nspent_on:\n  :operator: \"*\"\n  :values:\n  - \'\'\nuser_id:\n  :operator: \"=\"\n  :values:\n  - me\n',0,NULL,'---\n- - spent_on\n  - desc\n',NULL,'TimeEntryQuery',2,'---\n:totalable_names:\n- :hours\n');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT 1,
  `builtin` int(11) NOT NULL DEFAULT 0,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issues_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT 1,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',0,1,1,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(2,'Anonymous',0,1,2,'---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(3,'Jefe de proyecto',1,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :mention_users\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_news\n- :manage_news\n- :comment_news\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_gantt\n','all','all','all',1,NULL),(4,'Desarrollador',2,1,0,'---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n','default','all','all',1,NULL),(5,'Informador',3,1,0,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(6,'Analista de Software	',4,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(7,'Arquitecto de Software',5,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(8,'Programador',6,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(9,'Testeador',7,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(10,'Quality Assureance(QA)',8,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n'),(11,'Experto Externo',9,1,0,'---\n- :save_queries\n- :view_messages\n- :add_messages\n- :view_calendar\n- :view_documents\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :view_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :view_time_entries\n- :view_wiki_pages\n- :view_wiki_edits\n','default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'1\'\n  edit_issues: \'1\'\n  add_issue_notes: \'1\'\n  delete_issues: \'1\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_managed_roles`
--

DROP TABLE IF EXISTS `roles_managed_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_managed_roles` (
  `role_id` int(11) NOT NULL,
  `managed_role_id` int(11) NOT NULL,
  UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_managed_roles`
--

LOCK TABLES `roles_managed_roles` WRITE;
/*!40000 ALTER TABLE `roles_managed_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_managed_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('20140903143914'),('20140920094058'),('20141029181752'),('20141029181824'),('20141109112308'),('20141122124142'),('20150113194759'),('20150113211532'),('20150113213922'),('20150113213955'),('20150208105930'),('20150510083747'),('20150525103953'),('20150526183158'),('20150528084820'),('20150528092912'),('20150528093249'),('20150725112753'),('20150730122707'),('20150730122735'),('20150921204850'),('20150921210243'),('20151020182334'),('20151020182731'),('20151021184614'),('20151021185456'),('20151021190616'),('20151024082034'),('20151025072118'),('20151031095005'),('20160404080304'),('20160416072926'),('20160529063352'),('20161001122012'),('20161002133421'),('20161010081301'),('20161010081528'),('20161010081600'),('20161126094932'),('20161220091118'),('20170207050700'),('20170302015225'),('20170309214320'),('20170320051650'),('20170418090031'),('20170419144536'),('20170723112801'),('20180501132547'),('20180913072918'),('20180923082945'),('20180923091603'),('20190315094151'),('20190315102101'),('20190510070108'),('20190620135549'),('20200826153401'),('20200826153402'),('20210704125704'),('20210705111300'),('20210728131544'),('20210801145548'),('20210801211024'),('20211213122100'),('20211213122101'),('20211213122102'),('20220224194639'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'default_projects_tracker_ids','---\n- \'1\'\n- \'2\'\n- \'3\'\n','2022-11-29 16:35:07');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `action` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,1,'session','bc824789b19b1992bfcfa4d33c26c4fc2d0bedc6','2022-11-29 17:36:08','2022-11-29 17:57:00'),(2,1,'feeds','e892523b10bef43e663de460d0279356b7d4d1ef','2022-11-29 17:36:08','2022-11-29 16:36:08'),(3,1,'session','c2b7591cb650a556552fb4cd60ed3905304bf94b','2024-12-11 14:59:41','2024-12-11 14:01:47'),(4,1,'session','f03fb2ac2fa23729c194f90c66a8bc36597174a5','2024-12-11 20:23:45','2024-12-11 19:26:17'),(5,1,'session','a5b4c069c99f765d569ae642a96720138095d570','2024-12-11 20:27:45','2024-12-11 19:30:54'),(6,19,'session','001096501b65bb47f1856f8dde0c598e1207c704','2024-12-11 20:27:49','2024-12-11 19:30:33'),(7,19,'feeds','ef65626fa028a218fbc1885c86d41aa8a3ddf116','2024-12-11 20:27:49','2024-12-11 19:27:49'),(8,10,'session','ee2165c53328c9f504b787a565797be5bb59b3d4','2024-12-11 20:29:11','2024-12-11 19:29:11'),(9,10,'feeds','eaa9e9b16f92713872d6d226cd87d9e3889cce9a','2024-12-11 20:29:11','2024-12-11 19:29:11'),(10,15,'session','6c1c910b720f8d2b2b820139b803968ec688f386','2024-12-11 20:29:46','2024-12-11 19:29:46'),(11,15,'feeds','a0eea0c71304e2b1bace1a7375d36dae7772292a','2024-12-11 20:29:47','2024-12-11 19:29:47'),(12,11,'session','1145b92a9a5b9968fe2f1e1cfb5f34cc82ceab99','2024-12-11 20:30:29','2024-12-11 19:31:34'),(13,11,'feeds','3f484f9a2a0354c710604b5a395086baa2bc0493','2024-12-11 20:30:29','2024-12-11 19:30:29'),(14,9,'session','6c9fb730be66cf086efaf952b567d1f8c89fed5d','2024-12-11 20:30:50','2024-12-11 19:31:53'),(15,9,'feeds','ab2a5db7ff5349303716594297a7cd9cb8a8f9da','2024-12-11 20:31:04','2024-12-11 19:31:04'),(16,12,'session','b7ee079753a559ad560da536c235f13df1800504','2024-12-11 20:31:23','2024-12-11 19:31:23'),(17,12,'feeds','e3b225418d0c5703d5914833d89445caf05b452b','2024-12-11 20:31:23','2024-12-11 19:31:23'),(18,16,'session','723447e8723cf55c3604c062eda75326d4fe92a3','2024-12-11 20:31:32','2024-12-11 19:31:32'),(19,16,'feeds','d8d7c77659fd635eec3cdc974ed36f74c1ded7cb','2024-12-11 20:31:32','2024-12-11 19:31:32');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT 1,
  `fields_bits` int(11) DEFAULT 0,
  `default_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Errores',NULL,1,0,0,1),(2,'Tareas',NULL,2,1,0,1),(3,'Soporte',NULL,3,0,0,1),(4,'Desarrollo','',4,1,0,1),(5,'Analisis','',5,1,0,1);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `others` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_mail` tinyint(1) DEFAULT 1,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'1\'\n:gantt_zoom: 1\n:gantt_months: 12\n',1,''),(2,19,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'1\'\n',1,''),(3,16,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:recently_used_project_ids: \'1\'\n',1,''),(4,10,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:recently_used_project_ids: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',1,''),(5,15,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n',1,''),(6,11,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:recently_used_project_ids: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',1,''),(7,9,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:gantt_zoom: 2\n:gantt_months: 6\n:recently_used_project_ids: \'1\'\n',1,''),(8,13,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',1,''),(9,12,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:recently_used_project_ids: \'1\'\n:gantt_zoom: 2\n:gantt_months: 6\n',1,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_notification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT 0,
  `passwd_changed_on` datetime DEFAULT NULL,
  `twofa_scheme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_last_used_at` int(11) DEFAULT NULL,
  `twofa_required` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'toni','ef4e6c7c9c4828f64628ee818403568c37ac30c4','Antonio Martin','Admin',1,1,'2024-12-11 20:27:45','es',NULL,'2022-11-29 16:33:40','2022-11-29 16:33:40','User','all','0509ef5d6b27347010bff2013f08f145',0,NULL,NULL,NULL,NULL,0),(2,'','','','Anonymous users',0,1,NULL,'',NULL,'2022-11-29 16:34:42','2022-11-29 16:34:42','GroupAnonymous','',NULL,0,NULL,NULL,NULL,NULL,0),(3,'','','','Non member users',0,1,NULL,'',NULL,'2022-11-29 16:34:42','2022-11-29 16:34:42','GroupNonMember','',NULL,0,NULL,NULL,NULL,NULL,0),(4,'','','','Anonymous',0,0,NULL,'',NULL,'2022-11-29 16:35:08','2022-11-29 16:35:08','AnonymousUser','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(5,'','','','Sucursal Asia',0,1,NULL,'',NULL,'2022-11-29 17:46:50','2022-11-29 17:46:50','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(6,'','','','Sucursal America',0,1,NULL,'',NULL,'2022-11-29 17:47:07','2022-11-29 17:47:07','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(7,'','','','Sucursal Europa',0,1,NULL,'',NULL,'2022-11-29 17:47:18','2022-11-29 17:47:18','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(8,'','','','Sucursal Africa',0,1,NULL,'',NULL,'2022-11-29 17:50:10','2022-11-29 17:50:10','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(9,'alvaro','7d7a80210a0edd894909b2d13caff8461dd02693','garcia rodriguez','toni',0,1,'2024-12-11 20:30:50','es',NULL,'2024-12-11 14:01:27','2024-12-11 19:30:48','User','only_my_events','e2ee78d7348c4254b8accb0af29feec7',0,'2024-12-11 20:30:48',NULL,NULL,NULL,0),(10,'carlos','f215877136fe2f94f617448d7e3f02eb01e08afa','CARLOS','MARTIN SANCHEZ',0,1,'2024-12-11 20:29:11','es',NULL,'2024-12-11 14:01:27','2024-12-11 19:29:10','User','only_my_events','0b8f902bf661ed3ab3c0656ce918fd79',0,'2024-12-11 20:29:10',NULL,NULL,NULL,0),(11,'chaimae','4ef64889d789bc4a200bbf227d013bce4f6007a5','CHAIMAE','BAACHOUCH',0,1,'2024-12-11 20:30:29','es',NULL,'2024-12-11 14:01:27','2024-12-11 19:30:23','User','only_my_events','8f7a8b0be8af2829b6b788f8dee4bbc2',0,'2024-12-11 20:30:23',NULL,NULL,NULL,0),(12,'cristian','e14cfb765e74d68350eee7f9661d2d220bd57cd3','CRISTIAN MIGUEL ','RODRIGUEZ MUYULEMA',0,1,'2024-12-11 20:31:23','es',NULL,'2024-12-11 14:01:27','2024-12-11 19:31:20','User','only_my_events','b837edc41683a2a21ce891887b28a602',0,'2024-12-11 20:31:20',NULL,NULL,NULL,0),(13,'FAUSTO','','FAUSTO RODRIGO ','ROMERO HERNANDEZ',0,1,NULL,'es',NULL,'2024-12-11 14:01:27','2024-12-11 14:01:27','User','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(14,'JUAN','','JUAN','HIDALGO CABRERA',0,1,NULL,'es',NULL,'2024-12-11 14:01:27','2024-12-11 14:01:27','User','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(15,'lidia','d0150fcf079d8db9d782c46b21665c55967273c4','LIDIA','CRUZ PEREZ',0,1,'2024-12-11 20:29:46','es',NULL,'2024-12-11 14:01:27','2024-12-11 19:29:38','User','only_my_events','571129b31c41f448f5031a43ca15cd25',0,'2024-12-11 20:29:38',NULL,NULL,NULL,0),(16,'paula','1816d3c321918aa26d41d0beae80f421a28ffbdb',' PAULA ANDREA ','CEBALLOS MEJIA',0,1,'2024-12-11 20:31:32','es',NULL,'2024-12-11 14:01:27','2024-12-11 19:28:38','User','only_my_events','c4fa19054f161bfc52f7f71535ed955f',0,'2024-12-11 20:28:38',NULL,NULL,NULL,0),(17,'SIHAM','','SIHAM','ABDELLI',0,1,NULL,'es',NULL,'2024-12-11 14:01:27','2024-12-11 14:01:27','User','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(18,'YURI','','YURI ALEJANDRA','OTALVARO ZULETA',0,1,NULL,'es',NULL,'2024-12-11 14:01:28','2024-12-11 14:01:28','User','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(19,'Lizeth','19cb1b67928a56cc47d076ffd71badccb7228cfd','Lizeth','Gutierrez',0,1,'2024-12-11 20:27:49','es',NULL,'2024-12-11 19:26:17','2024-12-11 19:26:17','User','only_my_events','6f8f6bc95d8908e5995327d01e5716f4',0,'2024-12-11 20:26:17',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `sharing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
INSERT INTO `watchers` VALUES (1,'Issue',1,1),(2,'Issue',5,1),(3,'Issue',9,1),(4,'Issue',8,1),(5,'Issue',12,1),(6,'News',1,1),(7,'News',2,1);
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob DEFAULT NULL,
  `compression` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
INSERT INTO `wiki_content_versions` VALUES (1,1,1,1,'h1. Wiki\r\n \r\nh1. *1. INTRODUCCIÓN*\r\nEl objeto de este proyecto es la contratación de los servicios de asistencia técnica y consultoría para poner en marcha y ejecutar las tareas relativas a una Oficina Técnica de Gestión de Software, siendo su principal objetivo el de apoyar en sus labores al Área de Desarrollo de nuestra institución.\r\n\r\nh1. *2. OBJETO DEL PROYECTO*\r\nLa misión consistirá en el apoyo continuo para la consecución de los siguientes objetivos:\r\n\r\n* • Apoyar de forma continua en el cambio a nivel tecnológico, de proceso y cultural originado por el Plan de Proyectos a lo largo de su ejecución.\r\n* • Garantizar la correcta integración de los proyectos del plan, así como con el resto de iniciativas establecidas, usando cualquier marco de referencia o buena práctica propias o del mercado.\r\n* • Asegurar el éxito de la iniciativa a través de una coordinación, seguimiento y adaptación constante del Plan de Proyectos de Gestión de Software a las necesidades y requisitos cambiantes, mediante la identificación y definición de los proyectos del plan y su lanzamiento para su realización por parte de terceros prestando soporte durante su ejecución.\r\n* • Analizar y validar los productos generados por los proyectos del plan, a fin de verificar que cubren las necesidades que la calidad de los mismos es adecuada y se integran correctamente en la organización, asegurando unos resultados homogéneos entre los diferentes proveedores que participen en el mismo.\r\n\r\nh1. *3. ALCANCE DEL PROYECTO*\r\nEl alcance del servicio contempla los siguientes aspectos básicos en forma de líneas de trabajo, que serán llevadas a cabo proporcionando soporte al Área de Desarrollo del DIGV durante la prestación de sus servicios:\r\n\r\n* • Definición del Plan de Proyectos: Colaborará con el Área de Desarrollo para diseñar el Plan de Proyectos de Gestión de Software y adaptarlo de forma continua durante su ejecución en función de las necesidades, prioridades, recursos disponibles y capacidades de la institución.\r\n* El plan considerará proyectos que serán ejecutados por terceros, y cuya identificación y definición será llevada a cabo.\r\n* • Supervisión del Plan de Proyectos: seguimiento continúo de la evolución y cumplimiento de los objetivos del Plan de Proyectos. La Gestión de los proyectos del plan será realizada por el Área de Desarrollo, con el fin de asegurar que estos se ejecutan en los plazos previstos y los resultados proporcionados cubren las necesidades. Deberá revisar la calidad de los resultados proporcionados por los distintos proveedores, para garantizar que los entregables de los proyectos son homogéneos entre sí y asegurar la integración dentro y con el resto de proyectos del plan.\r\n* • Gestión del Cambio : la iniciativa establecerá cambios a nivel tecnológico, de actividad, culturales y organizativos que deberán ser gestionados para reducir la resistencia tanto de clientes como de personal interno, con el objetivo de evitar que la renovación e implantación de nuevo software impacte, durante su puesta en producción, en la calidad de los servicios proporcionados por la DTIT. La OTGS asesorará en la “gestión del cambio”, definiendo y apoyando al Área de Desarrollo en todos los aspectos necesarios para asegurar el éxito del Plan de Proyectos, incluidos el liderazgo, la formación, la comunicación y el feedback y el seguimiento.\r\n* • Soporte continuado: el Plan de Proyectos requieren un soporte y asesoramiento continúo, identificando mejoras en los mismos, colaborando con el responsable de cada proyecto e integrándolos con nuevos recursos y proyectos. Asimismo analizará y validará los productos generados (aplicaciones, etc.), a fin de verificar que cubren las necesidades, que la calidad es adecuada y se integran correctamente en la organización\r\n\r\nh1. 6.1. Organización del proyecto\r\nh2. \r\n6.1.1 Organización del equipo de trabajo\r\nLa US designará un responsable de interlocución, que será el encargado de asegurar la realización de todas las actividades de la oficina en tiempo y plazo adecuados.\r\n\r\nPor parte de la US, participarán en los trabajos de la empresa adjudicataria todas aquellas personas que considere necesarias, en base a participaciones fijas o temporales, según proceda y considere conveniente.\r\n\r\nAsí mismo y para garantizar la correcta comunicación con el adjudicatario se requiere que el equipo de trabajo propuesto por el adjudicatario cumpla al menos con los siguientes requerimientos:\r\n\r\n* • Al menos dos de los miembros deberán contar al menos con la certificación de Teletramitación Analista y Geremua Analistas. También deberán contar con amplia experiencia en proyectos J2EE para las administraciones públicas.\r\n* • Deberán formar parte una serie de consultores externos con diferentes perfiles, con una dedicación total y exclusiva al proyecto durante la duración del mismo.\r\n* • Se distinguirá la figura de Jefe de Proyecto, con conocimientos en proyectos similares, capacidad de gestionar equipos y de interlocución.\r\n* • El Jefe de Proyecto se responsabilizará de gestionar el servicio en su conjunto a lo largo de todo su ciclo de vida, coordinar y gestionar los recursos, riesgos, coordinación y seguimiento del mismo. Además, el Jefe de Proyecto será el encargado de coordinar el día a día y tener la visión completa del proyecto, pudiendo delegar estas funciones en un responsable o coordinador que le mantenga informado de la evolución del proyecto, identificación de posibles riesgos y necesidades de recursos.\r\n\r\nh2. 6.2. Metodología\r\nLos trabajos objeto del presente contrato se realizarán siguiendo la metodología MSDI oficial y su documentación correspondiente.\r\nNo obstante, las propuestas deberán incluir una explicación de la metodología que propone el proveedor para el desarrollo de proyectos de forma global.\r\n\r\nA través del establecimiento y aplicación de estas metodologías, el proveedor deberá garantizar:\r\n\r\n* • Consecución de los objetivos marcados en sus sucesivas fases.\r\n* • Consecución de los objetivos marcados para cada proyecto una vez finalizado.\r\n* • Cumplimiento de plazos por parte de los proveedores que llevan a cabo los proyectos del plan según su planificación inicial o la última versión aceptada.\r\n* • Control del alcance de los proyectos del plan en caso de que sea necesario establecer modificaciones al mismo debido a un cambio de prioridades de la DTIT o la propia evolución del proyecto.\r\n* • Cumplimiento de niveles de calidad y adecuación a las necesidades de productos, recursos y documentos generados durante el desarrollo de los proyectos y como resultado de la finalización de los mismos.\r\n\r\nh2. 6.3. Seguimiento\r\nDurante la prestación de sus servicios, la OTGS deberá realizar un seguimiento constante con el comité de dirección de la DTIT y con el Área de Desarrollo del DIGV de forma periódica para informar del estado general del servicio, riesgos generales y toma de decisiones que requieran de la participación de niveles directivos.\r\n\r\nPara el control de los trabajos se utilizará el siguiente sistema:\r\n\r\n* • La empresa deberá nombrar un Director del proyecto que será el responsable de los trabajos en todos sus aspectos. Esta persona será la encargada de convocar las reuniones de seguimiento y cuantas reuniones estime oportuno para el correcto desarrollo de los trabajos.\r\n* • La empresa deberá nombrar un Responsable técnico de los trabajos que será el encargado de realizar las tareas técnicas y de coordinar los recursos humanos de la OTGS. Esta persona será la encargada de convocar las reuniones técnicas necesarias para la correcta definición del sistema\r\n* • La DTIT nombrará un Responsable para los aspectos organizativos, funcionales y técnicos. Esta persona actuará como interlocutor con la empresa contratada, y deberá acudir a cuantas reuniones de seguimiento se propongan. Asimismo se encargará de realizar cuantos controles considere oportunos para garantizar la calidad del servicio y dar el Vº Bº a los trabajos\r\n* • La DTIT se encargarán de dotar a la empresa de todos los recursos técnicos que se requieran en el desarrollo del servicio.\r\nh2. \r\n6.4. Entregables asociados\r\nComo parte del proyecto a realizar, la OTGS deberá realizar numerosos documentos que permitirán seguir de forma continuada la evolución del Plan de Proyectos y lanzar las distintas iniciativas que lo constituyen.\r\nComo parte de la ejecución del proyecto, el proveedor deberá realizar al menos los siguientes entregables:\r\n\r\n* • Documentos de seguimiento: en los que se recogerán de forma precisa el estado del Plan de Proyectos en general y de cada proyecto en particular, así como riesgos, retrasos y cualquier otro aspecto que sea relevante o haya implantado el desarrollo de la iniciativa.\r\n* • Definición de los requisitos, objetivos y alcance de los proyectos: la OTGS será la encargada de identificar y definir los proyectos del plan durante su evolución para el lanzamiento de los mismos.\r\n* • Plan de comunicación y plan de formación: como parte de la línea de gestión del cambio se requiere que el proveedor cuente con un plan de comunicación y un plan de formación, integrados con los planes propios de la DTIT y alineado con los de los distintos proyectos del plan. A través de estos documentos se articularán las acciones de formación y comunicación del personal de la DTIT durante el plan.\r\n* • Acciones de comunicación y formación: documentos y recursos realizados por la OTGS para la realización de tareas de comunicación y formación asociadas a los proyectos o al plan en general y dedicadas a la reducción de la resistencia al cambio y mejora del conocimiento del personal de la DTIT.\r\n*  \r\n','','','2022-11-29 18:34:56',1),(2,1,1,1,'h1. Wiki\r\n \r\nh1. *1. INTRODUCCIÓN*\r\n\r\nEl objeto de este proyecto es la contratación de los servicios de asistencia técnica y consultoría para poner en marcha y ejecutar las tareas relativas a una Oficina Técnica de Gestión de Software, siendo su principal objetivo el de apoyar en sus labores al Área de Desarrollo de nuestra institución.\r\n\r\nh1. *2. OBJETO DEL PROYECTO*\r\nLa misión consistirá en el apoyo continuo para la consecución de los siguientes objetivos:\r\n\r\n* Apoyar de forma continua en el cambio a nivel tecnológico, de proceso y cultural originado por el Plan de Proyectos a lo largo de su ejecución.\r\n* Garantizar la correcta integración de los proyectos del plan, así como con el resto de iniciativas establecidas, usando cualquier marco de referencia o buena práctica propias o del mercado.\r\n* Asegurar el éxito de la iniciativa a través de una coordinación, seguimiento y adaptación constante del Plan de Proyectos de Gestión de Software a las necesidades y requisitos cambiantes, mediante la identificación y definición de los proyectos del plan y su lanzamiento para su realización por parte de terceros prestando soporte durante su ejecución.\r\n* Analizar y validar los productos generados por los proyectos del plan, a fin de verificar que cubren las necesidades que la calidad de los mismos es adecuada y se integran correctamente en la organización, asegurando unos resultados homogéneos entre los diferentes proveedores que participen en el mismo.\r\n\r\nh1. *3. ALCANCE DEL PROYECTO*\r\nEl alcance del servicio contempla los siguientes aspectos básicos en forma de líneas de trabajo, que serán llevadas a cabo proporcionando soporte al Área de Desarrollo del DIGV durante la prestación de sus servicios:\r\n\r\n* • Definición del Plan de Proyectos: Colaborará con el Área de Desarrollo para diseñar el Plan de Proyectos de Gestión de Software y adaptarlo de forma continua durante su ejecución en función de las necesidades, prioridades, recursos disponibles y capacidades de la institución.\r\n* El plan considerará proyectos que serán ejecutados por terceros, y cuya identificación y definición será llevada a cabo.\r\n* • Supervisión del Plan de Proyectos: seguimiento continúo de la evolución y cumplimiento de los objetivos del Plan de Proyectos. La Gestión de los proyectos del plan será realizada por el Área de Desarrollo, con el fin de asegurar que estos se ejecutan en los plazos previstos y los resultados proporcionados cubren las necesidades. Deberá revisar la calidad de los resultados proporcionados por los distintos proveedores, para garantizar que los entregables de los proyectos son homogéneos entre sí y asegurar la integración dentro y con el resto de proyectos del plan.\r\n* • Gestión del Cambio : la iniciativa establecerá cambios a nivel tecnológico, de actividad, culturales y organizativos que deberán ser gestionados para reducir la resistencia tanto de clientes como de personal interno, con el objetivo de evitar que la renovación e implantación de nuevo software impacte, durante su puesta en producción, en la calidad de los servicios proporcionados por la DTIT. La OTGS asesorará en la “gestión del cambio”, definiendo y apoyando al Área de Desarrollo en todos los aspectos necesarios para asegurar el éxito del Plan de Proyectos, incluidos el liderazgo, la formación, la comunicación y el feedback y el seguimiento.\r\n* • Soporte continuado: el Plan de Proyectos requieren un soporte y asesoramiento continúo, identificando mejoras en los mismos, colaborando con el responsable de cada proyecto e integrándolos con nuevos recursos y proyectos. Asimismo analizará y validará los productos generados (aplicaciones, etc.), a fin de verificar que cubren las necesidades, que la calidad es adecuada y se integran correctamente en la organización\r\n\r\nh1. 6.1. Organización del proyecto\r\nh2. \r\n6.1.1 Organización del equipo de trabajo\r\nLa US designará un responsable de interlocución, que será el encargado de asegurar la realización de todas las actividades de la oficina en tiempo y plazo adecuados.\r\n\r\nPor parte de la US, participarán en los trabajos de la empresa adjudicataria todas aquellas personas que considere necesarias, en base a participaciones fijas o temporales, según proceda y considere conveniente.\r\n\r\nAsí mismo y para garantizar la correcta comunicación con el adjudicatario se requiere que el equipo de trabajo propuesto por el adjudicatario cumpla al menos con los siguientes requerimientos:\r\n\r\n* • Al menos dos de los miembros deberán contar al menos con la certificación de Teletramitación Analista y Geremua Analistas. También deberán contar con amplia experiencia en proyectos J2EE para las administraciones públicas.\r\n* • Deberán formar parte una serie de consultores externos con diferentes perfiles, con una dedicación total y exclusiva al proyecto durante la duración del mismo.\r\n* • Se distinguirá la figura de Jefe de Proyecto, con conocimientos en proyectos similares, capacidad de gestionar equipos y de interlocución.\r\n* • El Jefe de Proyecto se responsabilizará de gestionar el servicio en su conjunto a lo largo de todo su ciclo de vida, coordinar y gestionar los recursos, riesgos, coordinación y seguimiento del mismo. Además, el Jefe de Proyecto será el encargado de coordinar el día a día y tener la visión completa del proyecto, pudiendo delegar estas funciones en un responsable o coordinador que le mantenga informado de la evolución del proyecto, identificación de posibles riesgos y necesidades de recursos.\r\n\r\nh2. 6.2. Metodología\r\nLos trabajos objeto del presente contrato se realizarán siguiendo la metodología MSDI oficial y su documentación correspondiente.\r\nNo obstante, las propuestas deberán incluir una explicación de la metodología que propone el proveedor para el desarrollo de proyectos de forma global.\r\n\r\nA través del establecimiento y aplicación de estas metodologías, el proveedor deberá garantizar:\r\n\r\n* • Consecución de los objetivos marcados en sus sucesivas fases.\r\n* • Consecución de los objetivos marcados para cada proyecto una vez finalizado.\r\n* • Cumplimiento de plazos por parte de los proveedores que llevan a cabo los proyectos del plan según su planificación inicial o la última versión aceptada.\r\n* • Control del alcance de los proyectos del plan en caso de que sea necesario establecer modificaciones al mismo debido a un cambio de prioridades de la DTIT o la propia evolución del proyecto.\r\n* • Cumplimiento de niveles de calidad y adecuación a las necesidades de productos, recursos y documentos generados durante el desarrollo de los proyectos y como resultado de la finalización de los mismos.\r\n\r\nh2. 6.3. Seguimiento\r\nDurante la prestación de sus servicios, la OTGS deberá realizar un seguimiento constante con el comité de dirección de la DTIT y con el Área de Desarrollo del DIGV de forma periódica para informar del estado general del servicio, riesgos generales y toma de decisiones que requieran de la participación de niveles directivos.\r\n\r\nPara el control de los trabajos se utilizará el siguiente sistema:\r\n\r\n* • La empresa deberá nombrar un Director del proyecto que será el responsable de los trabajos en todos sus aspectos. Esta persona será la encargada de convocar las reuniones de seguimiento y cuantas reuniones estime oportuno para el correcto desarrollo de los trabajos.\r\n* • La empresa deberá nombrar un Responsable técnico de los trabajos que será el encargado de realizar las tareas técnicas y de coordinar los recursos humanos de la OTGS. Esta persona será la encargada de convocar las reuniones técnicas necesarias para la correcta definición del sistema\r\n* • La DTIT nombrará un Responsable para los aspectos organizativos, funcionales y técnicos. Esta persona actuará como interlocutor con la empresa contratada, y deberá acudir a cuantas reuniones de seguimiento se propongan. Asimismo se encargará de realizar cuantos controles considere oportunos para garantizar la calidad del servicio y dar el Vº Bº a los trabajos\r\n* • La DTIT se encargarán de dotar a la empresa de todos los recursos técnicos que se requieran en el desarrollo del servicio.\r\nh2. \r\n6.4. Entregables asociados\r\nComo parte del proyecto a realizar, la OTGS deberá realizar numerosos documentos que permitirán seguir de forma continuada la evolución del Plan de Proyectos y lanzar las distintas iniciativas que lo constituyen.\r\nComo parte de la ejecución del proyecto, el proveedor deberá realizar al menos los siguientes entregables:\r\n\r\n* • Documentos de seguimiento: en los que se recogerán de forma precisa el estado del Plan de Proyectos en general y de cada proyecto en particular, así como riesgos, retrasos y cualquier otro aspecto que sea relevante o haya implantado el desarrollo de la iniciativa.\r\n* • Definición de los requisitos, objetivos y alcance de los proyectos: la OTGS será la encargada de identificar y definir los proyectos del plan durante su evolución para el lanzamiento de los mismos.\r\n* • Plan de comunicación y plan de formación: como parte de la línea de gestión del cambio se requiere que el proveedor cuente con un plan de comunicación y un plan de formación, integrados con los planes propios de la DTIT y alineado con los de los distintos proyectos del plan. A través de estos documentos se articularán las acciones de formación y comunicación del personal de la DTIT durante el plan.\r\n* • Acciones de comunicación y formación: documentos y recursos realizados por la OTGS para la realización de tareas de comunicación y formación asociadas a los proyectos o al plan en general y dedicadas a la reducción de la resistencia al cambio y mejora del conocimiento del personal de la DTIT.\r\n*  \r\n','','','2022-11-29 18:35:34',2),(3,1,1,1,'h1. Wiki\r\n \r\nh1. *1. INTRODUCCIÓN*\r\n\r\nEl objeto de este proyecto es la contratación de los servicios de asistencia técnica y consultoría para poner en marcha y ejecutar las tareas relativas a una Oficina Técnica de Gestión de Software, siendo su principal objetivo el de apoyar en sus labores al Área de Desarrollo de nuestra institución.\r\n\r\nh1. *2. OBJETO DEL PROYECTO*\r\nLa misión consistirá en el apoyo continuo para la consecución de los siguientes objetivos:\r\n\r\n* Apoyar de forma continua en el cambio a nivel tecnológico, de proceso y cultural originado por el Plan de Proyectos a lo largo de su ejecución.\r\n* Garantizar la correcta integración de los proyectos del plan, así como con el resto de iniciativas establecidas, usando cualquier marco de referencia o buena práctica propias o del mercado.\r\n* Asegurar el éxito de la iniciativa a través de una coordinación, seguimiento y adaptación constante del Plan de Proyectos de Gestión de Software a las necesidades y requisitos cambiantes, mediante la identificación y definición de los proyectos del plan y su lanzamiento para su realización por parte de terceros prestando soporte durante su ejecución.\r\n* Analizar y validar los productos generados por los proyectos del plan, a fin de verificar que cubren las necesidades que la calidad de los mismos es adecuada y se integran correctamente en la organización, asegurando unos resultados homogéneos entre los diferentes proveedores que participen en el mismo.\r\n\r\nh1. *3. ALCANCE DEL PROYECTO*\r\n\r\nEl alcance del servicio contempla los siguientes aspectos básicos en forma de líneas de trabajo, que serán llevadas a cabo proporcionando soporte al Área de Desarrollo del DIGV durante la prestación de sus servicios:\r\n\r\n* Definición del Plan de Proyectos: Colaborará con el Área de Desarrollo para diseñar el Plan de Proyectos de Gestión de Software y adaptarlo de forma continua durante su ejecución en función de las necesidades, prioridades, recursos disponibles y capacidades de la institución.\r\n* El plan considerará proyectos que serán ejecutados por terceros, y cuya identificación y definición será llevada a cabo.\r\n* Supervisión del Plan de Proyectos: seguimiento continúo de la evolución y cumplimiento de los objetivos del Plan de Proyectos. La Gestión de los proyectos del plan será realizada por el Área de Desarrollo, con el fin de asegurar que estos se ejecutan en los plazos previstos y los resultados proporcionados cubren las necesidades. Deberá revisar la calidad de los resultados proporcionados por los distintos proveedores, para garantizar que los entregables de los proyectos son homogéneos entre sí y asegurar la integración dentro y con el resto de proyectos del plan.\r\n* Gestión del Cambio : la iniciativa establecerá cambios a nivel tecnológico, de actividad, culturales y organizativos que deberán ser gestionados para reducir la resistencia tanto de clientes como de personal interno, con el objetivo de evitar que la renovación e implantación de nuevo software impacte, durante su puesta en producción, en la calidad de los servicios proporcionados por la DTIT. La OTGS asesorará en la “gestión del cambio”, definiendo y apoyando al Área de Desarrollo en todos los aspectos necesarios para asegurar el éxito del Plan de Proyectos, incluidos el liderazgo, la formación, la comunicación y el feedback y el seguimiento.\r\n* Soporte continuado: el Plan de Proyectos requieren un soporte y asesoramiento continúo, identificando mejoras en los mismos, colaborando con el responsable de cada proyecto e integrándolos con nuevos recursos y proyectos. Asimismo analizará y validará los productos generados (aplicaciones, etc.), a fin de verificar que cubren las necesidades, que la calidad es adecuada y se integran correctamente en la organización\r\n\r\nh1. 6.1. Organización del proyecto\r\n\r\nh2. \r\n6.1.1 Organización del equipo de trabajo\r\n\r\nLa US designará un responsable de interlocución, que será el encargado de asegurar la realización de todas las actividades de la oficina en tiempo y plazo adecuados.\r\n\r\nPor parte de la US, participarán en los trabajos de la empresa adjudicataria todas aquellas personas que considere necesarias, en base a participaciones fijas o temporales, según proceda y considere conveniente.\r\n\r\nAsí mismo y para garantizar la correcta comunicación con el adjudicatario se requiere que el equipo de trabajo propuesto por el adjudicatario cumpla al menos con los siguientes requerimientos:\r\n\r\n* Al menos dos de los miembros deberán contar al menos con la certificación de Teletramitación Analista y Geremua Analistas. También deberán contar con amplia experiencia en proyectos J2EE para las administraciones públicas.\r\n* Deberán formar parte una serie de consultores externos con diferentes perfiles, con una dedicación total y exclusiva al proyecto durante la duración del mismo.\r\n* Se distinguirá la figura de Jefe de Proyecto, con conocimientos en proyectos similares, capacidad de gestionar equipos y de interlocución.\r\n* El Jefe de Proyecto se responsabilizará de gestionar el servicio en su conjunto a lo largo de todo su ciclo de vida, coordinar y gestionar los recursos, riesgos, coordinación y seguimiento del mismo. Además, el Jefe de Proyecto será el encargado de coordinar el día a día y tener la visión completa del proyecto, pudiendo delegar estas funciones en un responsable o coordinador que le mantenga informado de la evolución del proyecto, identificación de posibles riesgos y necesidades de recursos.\r\n\r\nh2. 6.2. Metodología\r\n\r\nLos trabajos objeto del presente contrato se realizarán siguiendo la metodología MSDI oficial y su documentación correspondiente.\r\nNo obstante, las propuestas deberán incluir una explicación de la metodología que propone el proveedor para el desarrollo de proyectos de forma global.\r\n\r\nA través del establecimiento y aplicación de estas metodologías, el proveedor deberá garantizar:\r\n\r\n* Consecución de los objetivos marcados en sus sucesivas fases.\r\n* Consecución de los objetivos marcados para cada proyecto una vez finalizado.\r\n* Cumplimiento de plazos por parte de los proveedores que llevan a cabo los proyectos del plan según su planificación inicial o la última versión aceptada.\r\n* Control del alcance de los proyectos del plan en caso de que sea necesario establecer modificaciones al mismo debido a un cambio de prioridades de la DTIT o la propia evolución del proyecto.\r\n* Cumplimiento de niveles de calidad y adecuación a las necesidades de productos, recursos y documentos generados durante el desarrollo de los proyectos y como resultado de la finalización de los mismos.\r\n\r\nh2. 6.3. Seguimiento\r\n\r\nDurante la prestación de sus servicios, la OTGS deberá realizar un seguimiento constante con el comité de dirección de la DTIT y con el Área de Desarrollo del DIGV de forma periódica para informar del estado general del servicio, riesgos generales y toma de decisiones que requieran de la participación de niveles directivos.\r\n\r\nPara el control de los trabajos se utilizará el siguiente sistema:\r\n\r\n* La empresa deberá nombrar un Director del proyecto que será el responsable de los trabajos en todos sus aspectos. Esta persona será la encargada de convocar las reuniones de seguimiento y cuantas reuniones estime oportuno para el correcto desarrollo de los trabajos.\r\n* La empresa deberá nombrar un Responsable técnico de los trabajos que será el encargado de realizar las tareas técnicas y de coordinar los recursos humanos de la OTGS. Esta persona será la encargada de convocar las reuniones técnicas necesarias para la correcta definición del sistema\r\n* La DTIT nombrará un Responsable para los aspectos organizativos, funcionales y técnicos. Esta persona actuará como interlocutor con la empresa contratada, y deberá acudir a cuantas reuniones de seguimiento se propongan. Asimismo se encargará de realizar cuantos controles considere oportunos para garantizar la calidad del servicio y dar el Vº Bº a los trabajos\r\n* La DTIT se encargarán de dotar a la empresa de todos los recursos técnicos que se requieran en el desarrollo del servicio.\r\nh2. \r\n6.4. Entregables asociados\r\n\r\nComo parte del proyecto a realizar, la OTGS deberá realizar numerosos documentos que permitirán seguir de forma continuada la evolución del Plan de Proyectos y lanzar las distintas iniciativas que lo constituyen.\r\nComo parte de la ejecución del proyecto, el proveedor deberá realizar al menos los siguientes entregables:\r\n\r\n* Documentos de seguimiento: en los que se recogerán de forma precisa el estado del Plan de Proyectos en general y de cada proyecto en particular, así como riesgos, retrasos y cualquier otro aspecto que sea relevante o haya implantado el desarrollo de la iniciativa.\r\n* Definición de los requisitos, objetivos y alcance de los proyectos: la OTGS será la encargada de identificar y definir los proyectos del plan durante su evolución para el lanzamiento de los mismos.\r\n* Plan de comunicación y plan de formación: como parte de la línea de gestión del cambio se requiere que el proveedor cuente con un plan de comunicación y un plan de formación, integrados con los planes propios de la DTIT y alineado con los de los distintos proyectos del plan. A través de estos documentos se articularán las acciones de formación y comunicación del personal de la DTIT durante el plan.\r\n* Acciones de comunicación y formación: documentos y recursos realizados por la OTGS para la realización de tareas de comunicación y formación asociadas a los proyectos o al plan en general y dedicadas a la reducción de la resistencia al cambio y mejora del conocimiento del personal de la DTIT.\r\n','','','2022-11-29 18:37:14',3);
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
INSERT INTO `wiki_contents` VALUES (1,1,1,'h1. Wiki\r\n \r\nh1. *1. INTRODUCCIÓN*\r\n\r\nEl objeto de este proyecto es la contratación de los servicios de asistencia técnica y consultoría para poner en marcha y ejecutar las tareas relativas a una Oficina Técnica de Gestión de Software, siendo su principal objetivo el de apoyar en sus labores al Área de Desarrollo de nuestra institución.\r\n\r\nh1. *2. OBJETO DEL PROYECTO*\r\nLa misión consistirá en el apoyo continuo para la consecución de los siguientes objetivos:\r\n\r\n* Apoyar de forma continua en el cambio a nivel tecnológico, de proceso y cultural originado por el Plan de Proyectos a lo largo de su ejecución.\r\n* Garantizar la correcta integración de los proyectos del plan, así como con el resto de iniciativas establecidas, usando cualquier marco de referencia o buena práctica propias o del mercado.\r\n* Asegurar el éxito de la iniciativa a través de una coordinación, seguimiento y adaptación constante del Plan de Proyectos de Gestión de Software a las necesidades y requisitos cambiantes, mediante la identificación y definición de los proyectos del plan y su lanzamiento para su realización por parte de terceros prestando soporte durante su ejecución.\r\n* Analizar y validar los productos generados por los proyectos del plan, a fin de verificar que cubren las necesidades que la calidad de los mismos es adecuada y se integran correctamente en la organización, asegurando unos resultados homogéneos entre los diferentes proveedores que participen en el mismo.\r\n\r\nh1. *3. ALCANCE DEL PROYECTO*\r\n\r\nEl alcance del servicio contempla los siguientes aspectos básicos en forma de líneas de trabajo, que serán llevadas a cabo proporcionando soporte al Área de Desarrollo del DIGV durante la prestación de sus servicios:\r\n\r\n* Definición del Plan de Proyectos: Colaborará con el Área de Desarrollo para diseñar el Plan de Proyectos de Gestión de Software y adaptarlo de forma continua durante su ejecución en función de las necesidades, prioridades, recursos disponibles y capacidades de la institución.\r\n* El plan considerará proyectos que serán ejecutados por terceros, y cuya identificación y definición será llevada a cabo.\r\n* Supervisión del Plan de Proyectos: seguimiento continúo de la evolución y cumplimiento de los objetivos del Plan de Proyectos. La Gestión de los proyectos del plan será realizada por el Área de Desarrollo, con el fin de asegurar que estos se ejecutan en los plazos previstos y los resultados proporcionados cubren las necesidades. Deberá revisar la calidad de los resultados proporcionados por los distintos proveedores, para garantizar que los entregables de los proyectos son homogéneos entre sí y asegurar la integración dentro y con el resto de proyectos del plan.\r\n* Gestión del Cambio : la iniciativa establecerá cambios a nivel tecnológico, de actividad, culturales y organizativos que deberán ser gestionados para reducir la resistencia tanto de clientes como de personal interno, con el objetivo de evitar que la renovación e implantación de nuevo software impacte, durante su puesta en producción, en la calidad de los servicios proporcionados por la DTIT. La OTGS asesorará en la “gestión del cambio”, definiendo y apoyando al Área de Desarrollo en todos los aspectos necesarios para asegurar el éxito del Plan de Proyectos, incluidos el liderazgo, la formación, la comunicación y el feedback y el seguimiento.\r\n* Soporte continuado: el Plan de Proyectos requieren un soporte y asesoramiento continúo, identificando mejoras en los mismos, colaborando con el responsable de cada proyecto e integrándolos con nuevos recursos y proyectos. Asimismo analizará y validará los productos generados (aplicaciones, etc.), a fin de verificar que cubren las necesidades, que la calidad es adecuada y se integran correctamente en la organización\r\n\r\nh1. 6.1. Organización del proyecto\r\n\r\nh2. \r\n6.1.1 Organización del equipo de trabajo\r\n\r\nLa US designará un responsable de interlocución, que será el encargado de asegurar la realización de todas las actividades de la oficina en tiempo y plazo adecuados.\r\n\r\nPor parte de la US, participarán en los trabajos de la empresa adjudicataria todas aquellas personas que considere necesarias, en base a participaciones fijas o temporales, según proceda y considere conveniente.\r\n\r\nAsí mismo y para garantizar la correcta comunicación con el adjudicatario se requiere que el equipo de trabajo propuesto por el adjudicatario cumpla al menos con los siguientes requerimientos:\r\n\r\n* Al menos dos de los miembros deberán contar al menos con la certificación de Teletramitación Analista y Geremua Analistas. También deberán contar con amplia experiencia en proyectos J2EE para las administraciones públicas.\r\n* Deberán formar parte una serie de consultores externos con diferentes perfiles, con una dedicación total y exclusiva al proyecto durante la duración del mismo.\r\n* Se distinguirá la figura de Jefe de Proyecto, con conocimientos en proyectos similares, capacidad de gestionar equipos y de interlocución.\r\n* El Jefe de Proyecto se responsabilizará de gestionar el servicio en su conjunto a lo largo de todo su ciclo de vida, coordinar y gestionar los recursos, riesgos, coordinación y seguimiento del mismo. Además, el Jefe de Proyecto será el encargado de coordinar el día a día y tener la visión completa del proyecto, pudiendo delegar estas funciones en un responsable o coordinador que le mantenga informado de la evolución del proyecto, identificación de posibles riesgos y necesidades de recursos.\r\n\r\nh2. 6.2. Metodología\r\n\r\nLos trabajos objeto del presente contrato se realizarán siguiendo la metodología MSDI oficial y su documentación correspondiente.\r\nNo obstante, las propuestas deberán incluir una explicación de la metodología que propone el proveedor para el desarrollo de proyectos de forma global.\r\n\r\nA través del establecimiento y aplicación de estas metodologías, el proveedor deberá garantizar:\r\n\r\n* Consecución de los objetivos marcados en sus sucesivas fases.\r\n* Consecución de los objetivos marcados para cada proyecto una vez finalizado.\r\n* Cumplimiento de plazos por parte de los proveedores que llevan a cabo los proyectos del plan según su planificación inicial o la última versión aceptada.\r\n* Control del alcance de los proyectos del plan en caso de que sea necesario establecer modificaciones al mismo debido a un cambio de prioridades de la DTIT o la propia evolución del proyecto.\r\n* Cumplimiento de niveles de calidad y adecuación a las necesidades de productos, recursos y documentos generados durante el desarrollo de los proyectos y como resultado de la finalización de los mismos.\r\n\r\nh2. 6.3. Seguimiento\r\n\r\nDurante la prestación de sus servicios, la OTGS deberá realizar un seguimiento constante con el comité de dirección de la DTIT y con el Área de Desarrollo del DIGV de forma periódica para informar del estado general del servicio, riesgos generales y toma de decisiones que requieran de la participación de niveles directivos.\r\n\r\nPara el control de los trabajos se utilizará el siguiente sistema:\r\n\r\n* La empresa deberá nombrar un Director del proyecto que será el responsable de los trabajos en todos sus aspectos. Esta persona será la encargada de convocar las reuniones de seguimiento y cuantas reuniones estime oportuno para el correcto desarrollo de los trabajos.\r\n* La empresa deberá nombrar un Responsable técnico de los trabajos que será el encargado de realizar las tareas técnicas y de coordinar los recursos humanos de la OTGS. Esta persona será la encargada de convocar las reuniones técnicas necesarias para la correcta definición del sistema\r\n* La DTIT nombrará un Responsable para los aspectos organizativos, funcionales y técnicos. Esta persona actuará como interlocutor con la empresa contratada, y deberá acudir a cuantas reuniones de seguimiento se propongan. Asimismo se encargará de realizar cuantos controles considere oportunos para garantizar la calidad del servicio y dar el Vº Bº a los trabajos\r\n* La DTIT se encargarán de dotar a la empresa de todos los recursos técnicos que se requieran en el desarrollo del servicio.\r\nh2. \r\n6.4. Entregables asociados\r\n\r\nComo parte del proyecto a realizar, la OTGS deberá realizar numerosos documentos que permitirán seguir de forma continuada la evolución del Plan de Proyectos y lanzar las distintas iniciativas que lo constituyen.\r\nComo parte de la ejecución del proyecto, el proveedor deberá realizar al menos los siguientes entregables:\r\n\r\n* Documentos de seguimiento: en los que se recogerán de forma precisa el estado del Plan de Proyectos en general y de cada proyecto en particular, así como riesgos, retrasos y cualquier otro aspecto que sea relevante o haya implantado el desarrollo de la iniciativa.\r\n* Definición de los requisitos, objetivos y alcance de los proyectos: la OTGS será la encargada de identificar y definir los proyectos del plan durante su evolución para el lanzamiento de los mismos.\r\n* Plan de comunicación y plan de formación: como parte de la línea de gestión del cambio se requiere que el proveedor cuente con un plan de comunicación y un plan de formación, integrados con los planes propios de la DTIT y alineado con los de los distintos proyectos del plan. A través de estos documentos se articularán las acciones de formación y comunicación del personal de la DTIT durante el plan.\r\n* Acciones de comunicación y formación: documentos y recursos realizados por la OTGS para la realización de tareas de comunicación y formación asociadas a los proyectos o al plan en general y dedicadas a la reducción de la resistencia al cambio y mejora del conocimiento del personal de la DTIT.\r\n','','2022-11-29 18:37:14',3);
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
INSERT INTO `wiki_pages` VALUES (1,1,'Wiki','2022-11-29 18:34:56',0,NULL);
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT 0,
  `old_status_id` int(11) NOT NULL DEFAULT 0,
  `new_status_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `assignee` tinyint(1) NOT NULL DEFAULT 0,
  `author` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`),
  KEY `index_workflows_on_tracker_id` (`tracker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(2,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(3,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(4,1,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(5,1,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(6,1,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(7,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(8,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(9,1,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(10,1,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(11,1,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(12,1,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(13,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(14,1,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(15,1,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(16,1,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(17,1,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(18,1,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(19,1,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(20,1,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(21,1,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(22,1,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(23,1,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(24,1,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(25,1,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(26,1,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(27,1,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(28,1,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(29,1,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(30,1,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(31,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(32,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(33,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(34,2,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(35,2,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(36,2,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(38,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(39,2,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(40,2,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(41,2,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(42,2,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(43,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(44,2,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(45,2,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(46,2,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(47,2,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(48,2,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(49,2,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(50,2,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(51,2,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(52,2,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(53,2,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(54,2,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(55,2,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(56,2,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(57,2,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(58,2,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(59,2,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(60,2,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(61,3,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(62,3,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(63,3,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(64,3,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(65,3,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(66,3,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(67,3,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(68,3,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(69,3,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(70,3,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(71,3,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(72,3,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(73,3,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(74,3,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(75,3,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(76,3,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(77,3,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(78,3,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(79,3,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(80,3,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(81,3,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(82,3,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(83,3,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(84,3,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(85,3,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(86,3,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(87,3,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(88,3,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(89,3,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(90,3,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(94,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(97,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(100,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(103,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(107,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(110,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(113,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(116,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(120,3,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(123,3,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(126,3,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(129,3,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(130,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(131,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(132,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(133,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(135,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(136,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(137,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(138,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(140,3,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(141,3,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(142,3,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(143,3,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 20:32:24
