# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.1.44)
# Database: edelstall
# Generation Time: 2011-11-11 02:29:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sym_authors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_authors`;

CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','developer') NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_area` varchar(255) DEFAULT NULL,
  `auth_token_active` enum('yes','no') NOT NULL DEFAULT 'no',
  `language` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`)
VALUES
	(1,'admin','7e523a069053bd727bf980a2eaef2913c8692c1e','Admin','Admin','noreply@churchdeploy.com','2011-11-10 18:21:12','developer','yes',NULL,'no',NULL);

/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_cache`;

CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries`;

CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;

INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`)
VALUES
	(7,1,1,'2011-11-02 04:17:55','2011-11-02 11:17:55'),
	(8,1,1,'2011-11-10 15:02:07','2011-11-10 23:02:07'),
	(49,2,1,'2011-11-10 18:07:35','2011-11-11 02:07:35');

/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_11
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_11`;

CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_11` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_11` DISABLE KEYS */;

INSERT INTO `sym_entries_data_11` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(10,7,'male','Male'),
	(12,8,'male','Male');

/*!40000 ALTER TABLE `sym_entries_data_11` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_12`;

CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_12` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_12` DISABLE KEYS */;

INSERT INTO `sym_entries_data_12` (`id`, `entry_id`, `start`, `end`)
VALUES
	(5,7,'1982-02-10 21:02:17','1982-02-10 21:02:17'),
	(6,8,'2011-11-10 23:12:42','2011-11-10 23:12:42');

/*!40000 ALTER TABLE `sym_entries_data_12` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_13
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_13`;

CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_13` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_13` DISABLE KEYS */;

INSERT INTO `sym_entries_data_13` (`id`, `entry_id`, `relation_id`)
VALUES
	(48,49,8);

/*!40000 ALTER TABLE `sym_entries_data_13` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_14
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_14`;

CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-de` varchar(255) DEFAULT NULL,
  `value-de` text,
  `word_count-de` int(11) unsigned DEFAULT NULL,
  `value_format-de` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_14` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_14` DISABLE KEYS */;

INSERT INTO `sym_entries_data_14` (`id`, `entry_id`, `handle`, `value`, `handle-de`, `value-de`, `word_count-de`, `value_format-de`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(37,49,'sante','Sante','sante','Sante',1,'Sante',NULL,NULL,0,NULL);

/*!40000 ALTER TABLE `sym_entries_data_14` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_16
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_16`;

CREATE TABLE `sym_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(50) DEFAULT NULL,
  `meta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_16` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_16` DISABLE KEYS */;

INSERT INTO `sym_entries_data_16` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`)
VALUES
	(50,49,'/uploads/projects/screen-shot-2011-11-10-at-4.00-4ebc8367c06f6.png',1300242,'image/png','a:3:{s:8:\"creation\";s:25:\"2011-11-11T02:07:35+00:00\";s:5:\"width\";i:1301;s:6:\"height\";i:1151;}');

/*!40000 ALTER TABLE `sym_entries_data_16` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_17
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_17`;

CREATE TABLE `sym_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-de` varchar(255) DEFAULT NULL,
  `value-de` text,
  `word_count-de` int(11) unsigned DEFAULT NULL,
  `value_format-de` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_17` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_17` DISABLE KEYS */;

INSERT INTO `sym_entries_data_17` (`id`, `entry_id`, `handle`, `value`, `handle-de`, `value-de`, `word_count-de`, `value_format-de`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(37,49,NULL,'New website for the **Sante** product line.',NULL,'New website for the **Sante** product line.',7,'<p>New website for the <strong>Sante</strong> product line.</p>\n',NULL,NULL,0,'\n');

/*!40000 ALTER TABLE `sym_entries_data_17` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_2`;

CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;

INSERT INTO `sym_entries_data_2` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(10,7,'john','John'),
	(12,8,'kirk','Kirk');

/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_22
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_22`;

CREATE TABLE `sym_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` text,
  `handle-de` varchar(255) DEFAULT NULL,
  `value-de` text,
  `word_count-de` int(11) unsigned DEFAULT NULL,
  `value_format-de` text,
  `handle-en` varchar(255) DEFAULT NULL,
  `value-en` text,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `value_format-en` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_entries_data_22` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_22` DISABLE KEYS */;

INSERT INTO `sym_entries_data_22` (`id`, `entry_id`, `handle`, `value`, `handle-de`, `value-de`, `word_count-de`, `value_format-de`, `handle-en`, `value-en`, `word_count-en`, `value_format-en`)
VALUES
	(24,49,'http-santede','http://sante.de','http-santede','http://sante.de',1,'http://sante.de',NULL,NULL,0,NULL);

/*!40000 ALTER TABLE `sym_entries_data_22` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_4`;

CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_entries_data_4` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_4` DISABLE KEYS */;

INSERT INTO `sym_entries_data_4` (`id`, `entry_id`, `handle`, `value`)
VALUES
	(10,7,'doe','Doe'),
	(12,8,'strobeck','Strobeck');

/*!40000 ALTER TABLE `sym_entries_data_4` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_5`;

CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;

INSERT INTO `sym_entries_data_5` (`id`, `entry_id`, `value`)
VALUES
	(10,7,'john_doe@edelstall.de'),
	(12,8,'kirk@strobeck.com');

/*!40000 ALTER TABLE `sym_entries_data_5` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_6`;

CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recovery-code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL,
  `reset` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recovery-code` (`recovery-code`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_6` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_6` DISABLE KEYS */;

INSERT INTO `sym_entries_data_6` (`id`, `entry_id`, `password`, `recovery-code`, `length`, `strength`, `reset`, `expires`)
VALUES
	(10,7,'2c950d774d28d9f1e7a3f156309d43b88978cd4b',NULL,9,'strong','no',NULL),
	(12,8,'b5bde009c7ef85f05fa1a3ffc1fa43a545ac3c62',NULL,11,'good','no',NULL);

/*!40000 ALTER TABLE `sym_entries_data_6` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_7`;

CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_7` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_7` DISABLE KEYS */;

INSERT INTO `sym_entries_data_7` (`id`, `entry_id`, `activated`, `timestamp`, `code`)
VALUES
	(2,7,'yes','2011-11-10 21:02:17',NULL),
	(3,8,'yes','2011-11-10 23:12:42',NULL);

/*!40000 ALTER TABLE `sym_entries_data_7` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_entries_data_9
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_entries_data_9`;

CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_entries_data_9` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_9` DISABLE KEYS */;

INSERT INTO `sym_entries_data_9` (`id`, `entry_id`, `role_id`)
VALUES
	(10,7,1),
	(12,8,1);

/*!40000 ALTER TABLE `sym_entries_data_9` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions`;

CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`)
VALUES
	(1,'xssfilter','enabled','1.1'),
	(2,'debugdevkit','enabled','1.2.1'),
	(3,'export_ensemble','enabled','1.16'),
	(4,'selectbox_link_field','enabled','1.21'),
	(5,'jit_image_manipulation','enabled','1.13'),
	(6,'maintenance_mode','enabled','1.5'),
	(7,'profiledevkit','enabled','1.0.4'),
	(8,'markdown','enabled','1.13'),
	(9,'members','enabled','1.1.1'),
	(10,'datetime','enabled','2.1.1'),
	(11,'multilingual_field','enabled','1.4.1'),
	(12,'uniqueuploadfield','enabled','1.4.2'),
	(13,'uniqueinputfield','enabled','1.3'),
	(14,'html5_doctype','enabled','1.2.4'),
	(15,'image_index_preview','enabled','1.2.1'),
	(16,'jquery_date_picker','enabled','1.3'),
	(17,'language_redirect','enabled','1.0.3'),
	(18,'massuploadutility','enabled','0.9.8'),
	(19,'order_entries','enabled','1.9.7'),
	(20,'root_page_params','enabled','1.2'),
	(21,'subsectionmanager','enabled','1.3'),
	(22,'tweak_ui','enabled','0.1.2');

/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_extensions_delegates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_extensions_delegates`;

CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `delegate` varchar(100) NOT NULL,
  `callback` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`)
VALUES
	(47,1,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),
	(46,1,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),
	(48,2,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(50,3,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(56,5,'/system/preferences/','Save','__SavePreferences'),
	(65,6,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),
	(63,6,'/backend/','AppendPageAlert','__appendAlert'),
	(64,6,'/blueprints/pages/','AppendPageContent','__appendType'),
	(61,6,'/system/preferences/','Save','__SavePreferences'),
	(62,6,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),
	(82,7,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),
	(45,1,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),
	(49,2,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(55,5,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(60,6,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(78,9,'/system/preferences/','Save','savePreferences'),
	(77,9,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(76,9,'/backend/','AdminPagePreGenerate','appendAssets'),
	(75,9,'/frontend/','EventPostSaveFilter','processPostSaveFilter'),
	(74,9,'/frontend/','EventPreSaveFilter','checkEventPermissions'),
	(73,9,'/frontend/','FrontendProcessEvents','appendLoginStatusToEventXML'),
	(72,9,'/frontend/','FrontendParamsResolve','addMemberDetailsToPageParams'),
	(71,9,'/frontend/','FrontendPageResolved','checkFrontendPagePermissions'),
	(83,7,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),
	(51,11,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(52,11,'/system/preferences/','Save','__SavePreferences'),
	(53,14,'/frontend/','FrontendOutputPostGenerate','parse_html'),
	(54,15,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(57,16,'/backend/','InitaliseAdminPageHead','initializeAdmin'),
	(58,17,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(59,17,'/system/preferences/','Save','__SavePreferences'),
	(66,6,'/frontend/','FrontendParamsResolve','__addParam'),
	(67,18,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),
	(68,18,'/system/preferences/','CustomActions','savePreferences'),
	(69,18,'/backend/','AdminPagePreGenerate','initaliseAdminPageHead'),
	(70,18,'/publish/new/','EntryPostCreate','returnJSON'),
	(79,9,'/blueprints/events/new/','AppendEventFilter','appendFilter'),
	(80,9,'/blueprints/events/edit/','AppendEventFilter','appendFilter'),
	(81,19,'/backend/','InitaliseAdminPageHead','appendScriptToHead'),
	(84,20,'/frontend/','FrontendPrePageResolve','addPage'),
	(85,20,'/system/preferences/','AddCustomPreferenceFieldsets','append_preferences'),
	(86,20,'/system/preferences/','Save','save_settings'),
	(87,21,'/backend/','AdminPagePreGenerate','__appendAssets'),
	(88,21,'/publish/new/','EntryPostNew','__saveSortOrder'),
	(89,21,'/publish/edit/','EntryPostEdit','__saveSortOrder'),
	(90,21,'/backend/','AppendPageAlert','__upgradeMediathek'),
	(91,22,'/backend/','InitaliseAdminPageHead','addScriptToHead');

/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields`;

CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `element_name` varchar(50) NOT NULL,
  `type` varchar(32) NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`)
VALUES
	(12,'Birthday','birthday','datetime',1,'yes',3,'sidebar','yes'),
	(2,'First name','first-name','input',1,'yes',0,'main','yes'),
	(4,'Last name','last-name','input',1,'yes',1,'main','yes'),
	(5,'Email','email','memberemail',1,'yes',2,'main','yes'),
	(6,'Password','password','memberpassword',1,'yes',5,'sidebar','no'),
	(7,'Activation','activation','memberactivation',1,'no',6,'sidebar','yes'),
	(11,'Gender','gender','select',1,'yes',4,'sidebar','yes'),
	(9,'Role','role','memberrole',1,'yes',7,'sidebar','yes'),
	(13,'Member','member','selectbox_link',2,'yes',4,'main','yes'),
	(14,'Name','name','multilingual',2,'no',0,'main','yes'),
	(22,'URL','url','multilingual',2,'no',2,'main','yes'),
	(16,'Cover','cover','uniqueupload',2,'no',1,'sidebar','yes'),
	(17,'Description','description','multilingual',2,'no',3,'main','yes');

/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_author`;

CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_checkbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_checkbox`;

CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') NOT NULL DEFAULT 'on',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_date
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_date`;

CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_datetime
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_datetime`;

CREATE TABLE `sym_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_datetime` WRITE;
/*!40000 ALTER TABLE `sym_fields_datetime` DISABLE KEYS */;

INSERT INTO `sym_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `range`)
VALUES
	(9,12,1,0,0);

/*!40000 ALTER TABLE `sym_fields_datetime` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_input
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_input`;

CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`)
VALUES
	(43,2,NULL),
	(44,4,NULL);

/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberactivation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberactivation`;

CREATE TABLE `sym_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `deny_login` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberactivation` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberactivation` DISABLE KEYS */;

INSERT INTO `sym_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `deny_login`)
VALUES
	(14,7,'3 hours',1,'no');

/*!40000 ALTER TABLE `sym_fields_memberactivation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberemail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberemail`;

CREATE TABLE `sym_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberemail` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberemail` DISABLE KEYS */;

INSERT INTO `sym_fields_memberemail` (`id`, `field_id`)
VALUES
	(14,5);

/*!40000 ALTER TABLE `sym_fields_memberemail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberpassword
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberpassword`;

CREATE TABLE `sym_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_expiry` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberpassword` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberpassword` DISABLE KEYS */;

INSERT INTO `sym_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`)
VALUES
	(14,6,8,'good','kv235l2KL@JV#Rkj3v253kv55662f3@$}{','24 hours');

/*!40000 ALTER TABLE `sym_fields_memberpassword` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_memberrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_memberrole`;

CREATE TABLE `sym_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_memberrole` WRITE;
/*!40000 ALTER TABLE `sym_fields_memberrole` DISABLE KEYS */;

INSERT INTO `sym_fields_memberrole` (`id`, `field_id`, `default_role`)
VALUES
	(14,9,1);

/*!40000 ALTER TABLE `sym_fields_memberrole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_multilingual
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_multilingual`;

CREATE TABLE `sym_fields_multilingual` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') DEFAULT 'medium',
  `formatter` varchar(255) DEFAULT NULL,
  `text_validator` varchar(255) DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `unique_handle` enum('yes','no') DEFAULT 'yes',
  `use_def_lang_vals` enum('yes','no') DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_multilingual` WRITE;
/*!40000 ALTER TABLE `sym_fields_multilingual` DISABLE KEYS */;

INSERT INTO `sym_fields_multilingual` (`id`, `field_id`, `column_length`, `text_size`, `formatter`, `text_validator`, `text_length`, `unique_handle`, `use_def_lang_vals`)
VALUES
	(90,14,25,'single','none',NULL,0,'yes','yes'),
	(92,17,25,'medium','markdown_extra_with_smartypants',NULL,0,'yes','yes'),
	(91,22,25,'single','none','/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/',0,'yes','yes');

/*!40000 ALTER TABLE `sym_fields_multilingual` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_order_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_order_entries`;

CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_select
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_select`;

CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') NOT NULL DEFAULT 'no',
  `static_options` text,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;

INSERT INTO `sym_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `sort_options`, `static_options`, `dynamic_options`)
VALUES
	(13,11,'no','no','no','Male, Female',NULL);

/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_selectbox_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;

CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;

INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`)
VALUES
	(40,13,'no','yes','5',20);

/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_stage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_stage`;

CREATE TABLE `sym_fields_stage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL DEFAULT '0',
  `constructable` smallint(1) DEFAULT '0',
  `destructable` smallint(1) DEFAULT '0',
  `draggable` smallint(1) DEFAULT '0',
  `droppable` smallint(1) DEFAULT '0',
  `searchable` smallint(1) DEFAULT '0',
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `sym_fields_stage` WRITE;
/*!40000 ALTER TABLE `sym_fields_stage` DISABLE KEYS */;

INSERT INTO `sym_fields_stage` (`id`, `field_id`, `constructable`, `destructable`, `draggable`, `droppable`, `searchable`, `context`)
VALUES
	(9,12,1,1,0,0,0,'datetime');

/*!40000 ALTER TABLE `sym_fields_stage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_stage_sorting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_stage_sorting`;

CREATE TABLE `sym_fields_stage_sorting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `order` text,
  `context` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_subsectionmanager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_subsectionmanager`;

CREATE TABLE `sym_fields_subsectionmanager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `subsection_id` varchar(255) NOT NULL,
  `filter_tags` text,
  `caption` text,
  `droptext` text,
  `included_fields` text,
  `allow_multiple` tinyint(1) DEFAULT '0',
  `show_preview` tinyint(1) DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_taglist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_taglist`;

CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `pre_populate_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_textarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_textarea`;

CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_fields_uniqueinput
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_uniqueinput`;

CREATE TABLE `sym_fields_uniqueinput` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) DEFAULT NULL,
  `auto_unique` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table sym_fields_uniqueupload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_uniqueupload`;

CREATE TABLE `sym_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_fields_uniqueupload` WRITE;
/*!40000 ALTER TABLE `sym_fields_uniqueupload` DISABLE KEYS */;

INSERT INTO `sym_fields_uniqueupload` (`id`, `field_id`, `destination`, `validator`)
VALUES
	(39,16,'/workspace/uploads/projects','/\\.(?:bmp|gif|jpe?g|png)$/i');

/*!40000 ALTER TABLE `sym_fields_uniqueupload` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_fields_upload
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_fields_upload`;

CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_forgotpass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_forgotpass`;

CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(6) NOT NULL,
  `expiry` varchar(25) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table sym_members_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles`;

CREATE TABLE `sym_members_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `sym_members_roles` WRITE;
/*!40000 ALTER TABLE `sym_members_roles` DISABLE KEYS */;

INSERT INTO `sym_members_roles` (`id`, `name`, `handle`)
VALUES
	(1,'Public','public'),
	(2,'Member','member'),
	(3,'Not yet activated','not-yet-activated');

/*!40000 ALTER TABLE `sym_members_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_members_roles_event_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_event_permissions`;

CREATE TABLE `sym_members_roles_event_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `event` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`event`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sym_members_roles_forbidden_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_members_roles_forbidden_pages`;

CREATE TABLE `sym_members_roles_forbidden_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table sym_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages`;

CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `handle` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `data_sources` text,
  `events` text,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`)
VALUES
	(1,NULL,'Home','home',NULL,'pt1/pt2/pt3','members',NULL,1),
	(2,NULL,'Member','member',NULL,'pt1/pt2','members','members_activate_account,members_create,members_generate_recovery_code,members_regenerate_activation_code,members_reset_password',2),
	(3,NULL,'Project','project',NULL,'pt1/pt2/pt3','members','project_create',3);

/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_pages_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_pages_types`;

CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`)
VALUES
	(3,1,'index');

/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections`;

CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `handle` varchar(255) NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') DEFAULT 'asc',
  `hidden` enum('yes','no') NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`)
VALUES
	(1,'Members','members',1,NULL,'asc','no','Members'),
	(2,'Project','project',2,NULL,'asc','no','Members');

/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sections_association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sections_association`;

CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;

INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`)
VALUES
	(40,1,5,2,13,'no');

/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sym_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sym_sessions`;

CREATE TABLE `sym_sessions` (
  `session` varchar(100) NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;

INSERT INTO `sym_sessions` (`session`, `session_expires`, `session_data`)
VALUES
	('67c9c2536fec8db7a11564d57f3cc52a',1320268685,'sym-|a:2:{s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:40:\"7e523a069053bd727bf980a2eaef2913c8692c1e\";}sym-members|a:0:{}'),
	('e2b30627a0150fa5ae2718a514d72ac2',1320440169,'sym-|a:0:{}sym-members|a:0:{}'),
	('cc2880a432a920cc89af715884fdee7c',1320978072,'sym-|a:2:{s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:40:\"7e523a069053bd727bf980a2eaef2913c8692c1e\";}sym-members|a:3:{s:2:\"id\";s:1:\"8\";s:5:\"email\";s:17:\"kirk@strobeck.com\";s:8:\"password\";s:40:\"b5bde009c7ef85f05fa1a3ffc1fa43a545ac3c62\";}');

/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
