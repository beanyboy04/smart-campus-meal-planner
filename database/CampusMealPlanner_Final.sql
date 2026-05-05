CREATE DATABASE IF NOT EXISTS campus_meal_planner;
USE campus_meal_planner;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: campus_meal_planner
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `3_day_plans`
--

DROP TABLE IF EXISTS `3_day_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `3_day_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `day1_meal_id` int DEFAULT NULL,
  `day2_meal_id` int DEFAULT NULL,
  `day3_meal_id` int DEFAULT NULL,
  `total_price` decimal(6,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`plan_id`),
  KEY `students.student_id_idx` (`student_id`),
  KEY `fk_3day_meal1_idx` (`day1_meal_id`),
  KEY `fk_3day_meal2_idx` (`day2_meal_id`),
  KEY `fk_3day_meal3_idx` (`day3_meal_id`),
  CONSTRAINT `fk_3day_meal1` FOREIGN KEY (`day1_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_3day_meal2` FOREIGN KEY (`day2_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_3day_meal3` FOREIGN KEY (`day3_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_3day_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `3_day_plans`
--

LOCK TABLES `3_day_plans` WRITE;
/*!40000 ALTER TABLE `3_day_plans` DISABLE KEYS */;
INSERT INTO `3_day_plans` VALUES (1,1,'Johns Classic Plan',1,8,15,29.97,1),(2,2,'Emmas Healthy Plan',2,9,16,28.47,1),(3,3,'Michaels Protein Plan',3,10,17,27.97,1),(4,14,'Sarahs Vegan Plan',5,13,17,26.47,1),(5,15,'Emilys Budget Plan',1,8,15,29.97,1),(6,16,'Davids Hearty Plan',4,11,18,30.97,1),(7,17,'Jessicas Light Plan',3,9,16,26.97,1),(8,18,'Daniels Standard Plan',2,10,19,32.47,1),(9,19,'Ashleys GF Plan',5,13,17,26.47,1),(10,20,'Christophers Plan',1,8,15,29.97,1);
/*!40000 ALTER TABLE `3_day_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `7_day_plans`
--

DROP TABLE IF EXISTS `7_day_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `7_day_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `day1_meal_id` int DEFAULT NULL,
  `day2_meal_id` int DEFAULT NULL,
  `day3_meal_id` int DEFAULT NULL,
  `day4_meal_id` int DEFAULT NULL,
  `day5_meal_id` int DEFAULT NULL,
  `day6_meal_id` int DEFAULT NULL,
  `day7_meal_id` int DEFAULT NULL,
  `total_price` decimal(6,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`plan_id`),
  KEY `fk_7day_student_idx` (`student_id`),
  KEY `fk_7day_meal1_idx` (`day1_meal_id`),
  KEY `fk_7day_meal2_idx` (`day2_meal_id`),
  KEY `fk_7day_meal3_idx` (`day3_meal_id`),
  KEY `fk_7day_meal4_idx` (`day4_meal_id`),
  KEY `fk_7day_meal5_idx` (`day5_meal_id`),
  KEY `fk_7day_meal6_idx` (`day6_meal_id`),
  KEY `fk_7day_meal7_idx` (`day7_meal_id`),
  CONSTRAINT `fk_7day_meal1` FOREIGN KEY (`day1_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_meal2` FOREIGN KEY (`day2_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_meal3` FOREIGN KEY (`day3_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_meal4` FOREIGN KEY (`day4_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_meal5` FOREIGN KEY (`day5_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_meal6` FOREIGN KEY (`day6_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_meal7` FOREIGN KEY (`day7_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_7day_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `7_day_plans`
--

LOCK TABLES `7_day_plans` WRITE;
/*!40000 ALTER TABLE `7_day_plans` DISABLE KEYS */;
INSERT INTO `7_day_plans` VALUES (1,1,'Johns Full Week',1,2,3,4,5,6,7,59.93,1),(2,2,'Emmas Deluxe Week',8,9,10,11,12,13,14,62.93,1),(3,14,'Sarahs Vegan Week',5,6,7,13,14,15,17,58.93,1),(4,15,'Emilys Wellness Week',2,3,4,9,10,16,17,61.93,1),(5,16,'Davids Power Week',4,5,6,11,12,18,19,64.93,1);
/*!40000 ALTER TABLE `7_day_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_id_number` varchar(45) NOT NULL,
  `student_id_number` varchar(20) DEFAULT NULL,
  `role` enum('admin','kitchen_staff','menu_manager','cashier') DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_email_UNIQUE` (`emp_email`),
  KEY `students.student_id_number_idx` (`student_id_number`),
  KEY `students.student_id_idx` (`student_id`),
  CONSTRAINT `students.student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `students.student_id_number` FOREIGN KEY (`student_id_number`) REFERENCES `students` (`student_id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,NULL,'Jane Manager','jane@campus.edu','EMP001',NULL,'admin',1),(2,NULL,'Bob Cook','bob@campus.edu','EMP002',NULL,'kitchen_staff',1),(33,NULL,'Robert Johnson','rjohnson@dining.georgiasouthern.edu','E1001',NULL,'admin',1),(34,NULL,'Lisa Williams','lwilliams@dining.georgiasouthern.edu','E1002',NULL,'admin',1),(35,NULL,'Patricia Brown','pbrown@dining.georgiasouthern.edu','E1003',NULL,'menu_manager',1),(36,NULL,'Thomas Wilson','twilson@dining.georgiasouthern.edu','E1004',NULL,'admin',1),(37,NULL,'Jennifer Lee','jlee@dining.georgiasouthern.edu','E1005',NULL,'cashier',1),(38,NULL,'Barbara Martinez','bmartinez@dining.georgiasouthern.edu','E1006',NULL,'kitchen_staff',1),(39,NULL,'Donald Clark','dclark@dining.georgiasouthern.edu','E1007',NULL,'kitchen_staff',1),(69,1,'John Smith','jsmith@dining.georgiasouthern.edu','E1008','901234567','cashier',1),(70,3,'Michael Lee','mlee@dining.georgiasouthern.edu','E1009','903456789','kitchen_staff',1),(71,15,'Emma Johnson','ejohnson@dining.georgiasouthern.edu','E1010','902345678','cashier',1),(72,18,'James Jones','jjones@dining.georgiasouthern.edu','E1011','905678901','kitchen_staff',1),(73,21,'Jessica Davis','jdavis@dining.georgiasouthern.edu','E1012','908901234','cashier',1),(74,23,'Ashley Martinez','amartinez@dining.georgiasouthern.edu','E1013','910123456','kitchen_staff',1),(75,28,'Joshua Moore','jmoore@dining.georgiasouthern.edu','E1014','915678901','cashier',1),(76,31,'Sophia Harris','sharris@dining.georgiasouthern.edu','E1015','918901234','kitchen_staff',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_login`
--

DROP TABLE IF EXISTS `employee_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_attempts` int DEFAULT '0',
  `is_locked` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `emp_id_UNIQUE` (`emp_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  CONSTRAINT `fk_employee_login_employee1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_login`
--

LOCK TABLES `employee_login` WRITE;
/*!40000 ALTER TABLE `employee_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `calories` int DEFAULT NULL,
  `dietary_tags` varchar(200) DEFAULT NULL,
  `protein_g` decimal(5,2) DEFAULT NULL COMMENT 'Grams of protein',
  `carbs_g` decimal(5,2) DEFAULT NULL COMMENT 'Grams of carbs',
  `fat_g` decimal(5,2) DEFAULT NULL,
  `is_vegetarian` tinyint(1) DEFAULT '0' COMMENT 'No meat',
  `is_vegan` tinyint(1) DEFAULT '0' COMMENT 'No animal products',
  `is_keto` tinyint(1) DEFAULT '0' COMMENT 'Low carb',
  `is_gluten_free` tinyint(1) DEFAULT '0' COMMENT 'No gluten/wheat',
  `is_dairy_free` tinyint(1) DEFAULT '0' COMMENT 'No milk products',
  `is_gmo_free` tinyint(1) DEFAULT '0' COMMENT 'Non-GMO ingredients',
  `is_organic` tinyint(1) DEFAULT '0' COMMENT 'Certified organic',
  `contains_shellfish` tinyint(1) DEFAULT '0' COMMENT 'Has Shelfish',
  `contains_peanuts` tinyint(1) DEFAULT '0' COMMENT 'Has peanuts',
  `contains_tree_nuts` tinyint(1) DEFAULT '0' COMMENT 'Has tree nuts',
  `contains_soy` tinyint(1) DEFAULT '0' COMMENT 'Has soy',
  `contains_eggs` tinyint(1) DEFAULT '0' COMMENT 'Has eggs',
  `is_seafood_free` tinyint(1) DEFAULT '1' COMMENT 'Safe for seafood allergies',
  `is_shellfish_safe` tinyint(1) DEFAULT '1' COMMENT 'Safe for shellfish allergies',
  `is_peanut_free` tinyint(1) DEFAULT '1' COMMENT 'SAFE for peanut allergies',
  `is_available` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_employee_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `employees.emp_id_idx` (`updated_by_employee_id`),
  CONSTRAINT `employees.emp_id` FOREIGN KEY (`updated_by_employee_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Grilled Chicken Sandwich','Main',6.99,450,'High Protein, Contains Gluten',32.00,42.00,12.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:00:38','2026-04-06 01:44:31',NULL),(2,'Veggie Wrap','Main',5.99,350,'Vegetarian, Contains Gluten',14.00,45.00,16.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:00:38','2026-04-06 01:44:31',NULL),(3,'Fruit Cup','Side',2.49,120,'Low Fat',1.00,22.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:00:38','2026-04-06 01:40:03',NULL),(4,'Greek Yogurt','Breakfast',3.49,280,'High Protein, Contains Dairy',18.00,12.00,5.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:00:38','2026-04-06 01:44:31',NULL),(5,'Caesar Salad','Salad',4.99,320,'Contains Dairy, Contains Gluten',12.00,15.00,28.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:00:38','2026-04-06 01:44:31',NULL),(6,'Hard Boiled Eggs','Breakfast',1.50,80,'High Protein',6.00,1.00,5.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(7,'Scrambled Eggs','Breakfast',2.00,180,'High Protein',12.00,2.00,14.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(8,'Plain Grits','Breakfast',1.50,110,'Low Fat',2.00,22.00,1.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(9,'Pork Sausage Patty','Breakfast',2.25,180,'High Protein',10.00,1.00,15.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(10,'Hash Brown Triangles','Breakfast',1.75,90,'Low Protein',1.00,11.00,5.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(11,'Vanilla Yogurt','Breakfast',1.50,150,'Contains Dairy',8.00,18.00,5.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(12,'Fieldstone Granola','Breakfast',1.75,110,'Low Fat',3.00,22.00,2.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(13,'Assorted Danish','Breakfast',2.00,260,'High Carb',4.00,45.00,8.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(14,'Assorted Muffins','Breakfast',2.00,240,'High Carb',5.00,42.00,7.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(15,'Blueberry Bagel','Breakfast',1.75,160,'Low Fat',8.00,32.00,1.50,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(16,'Cinnamon Raisin Bagel','Breakfast',1.75,290,'High Carb',9.00,58.00,2.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(17,'Sesame Seed Bagel','Breakfast',1.75,290,'Contains Sesame',10.00,55.00,3.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(18,'Wheat Bagel','Breakfast',1.75,280,'Whole Grain',11.00,52.00,2.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(19,'Plain Cream Cheese','Condiment',0.75,70,'Contains Dairy',2.00,1.00,7.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(20,'Romaine Lettuce','Salad Bar',3.50,0,'Low Calorie',0.50,1.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(21,'Harvest Salad Mix','Salad Bar',3.50,25,'Low Calorie',1.00,5.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(22,'Bell Peppers','Salad Bar',3.50,25,'Low Calorie',1.00,6.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(23,'Broccoli','Salad Bar',3.50,30,'Low Calorie',2.50,6.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(24,'Black Olives','Salad Bar',3.50,25,'Healthy Fats',0.50,2.00,2.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(25,'Cucumbers','Salad Bar',3.50,10,'Low Calorie',0.50,2.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(26,'Cherry Tomatoes','Salad Bar',3.50,15,'Low Calorie',1.00,3.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(27,'Shredded Carrots','Salad Bar',3.50,20,'Vitamin A',0.50,5.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(28,'Red Onions','Salad Bar',3.50,15,'Low Calorie',1.00,7.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(29,'Croutons','Salad Bar',0.50,60,'Contains Gluten',2.00,12.00,2.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(30,'Shredded Cheese','Salad Bar',1.00,110,'Contains Dairy',7.00,1.00,9.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(31,'Hard Boiled Eggs','Salad Bar',1.50,80,'High Protein',6.00,1.00,5.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:02',NULL),(32,'Grilled Chicken','Salad Bar',2.50,150,'Lean Protein',25.00,0.00,3.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(33,'Tuna Salad','Salad Bar',2.50,200,'High Protein',22.00,2.00,12.00,0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(34,'Ranch Dressing','Dressing',0.75,140,'High Fat',1.00,2.00,14.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(35,'Caesar Dressing','Dressing',0.75,150,'High Fat',1.00,2.00,16.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(36,'Balsamic Vinaigrette','Dressing',0.75,90,'Low Carb',0.00,4.00,7.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(37,'Italian Dressing','Dressing',0.75,80,'Low Carb',0.00,3.00,8.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(38,'Blue Cheese Dressing','Dressing',0.75,150,'High Fat',1.00,2.00,16.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(39,'Fat Free Ranch','Dressing',0.75,60,'Low Fat',1.00,8.00,3.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(40,'Grilled Chicken Breast','Main',6.99,220,'Lean Protein',35.00,0.00,8.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(41,'Chicken Tenders','Main',5.99,450,'Fried',28.00,25.00,24.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(42,'Buffalo Chicken Tenders','Main',6.49,480,'Spicy',30.00,28.00,26.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(43,'Chicken Parmesan','Main',7.99,520,'Contains Dairy',32.00,45.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(44,'BBQ Chicken','Main',6.49,310,'BBQ',34.00,15.00,12.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(45,'Lemon Pepper Chicken','Main',6.49,280,'Citrus',33.00,2.00,10.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(46,'Chicken Alfredo','Main',7.49,650,'High Carb',30.00,55.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(47,'Chicken Marsala','Main',7.49,490,'Italian',31.00,25.00,20.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(48,'Chicken Piccata','Main',7.49,380,'Italian',32.00,20.00,18.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(49,'Teriyaki Chicken','Main',6.99,410,'Asian',32.00,35.00,14.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(50,'Chicken Quesadilla','Main',5.99,540,'Mexican',28.00,40.00,24.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(51,'Chicken Wrap','Main',6.49,490,'Portable',30.00,42.00,20.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(52,'Chicken Noodle Soup','Soup',3.99,180,'Comfort Food',8.00,18.00,5.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(53,'Chicken Pot Pie','Main',5.99,560,'Comfort Food',20.00,45.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(54,'Chicken Fried Rice','Main',5.99,480,'Asian',22.00,55.00,18.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(55,'Hamburger','Main',4.99,450,'Classic',25.00,40.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(56,'Cheeseburger','Main',5.49,520,'Contains Dairy',28.00,42.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(57,'Bacon Cheeseburger','Main',6.49,600,'High Protein',32.00,44.00,35.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(58,'Double Cheeseburger','Main',7.49,720,'High Calorie',45.00,45.00,42.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(59,'Beef Tacos','Main',3.99,380,'Mexican',15.00,28.00,18.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(60,'Beef Burrito','Main',5.99,620,'Mexican',28.00,55.00,25.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(61,'Meatloaf','Main',5.49,490,'Comfort Food',25.00,30.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(62,'Beef Stew','Main',4.99,350,'Hearty',22.00,28.00,15.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(63,'Roast Beef','Main',6.99,280,'Lean Protein',30.00,0.00,15.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(64,'Beef Stroganoff','Main',6.49,540,'Russian',28.00,45.00,25.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(65,'Shepherd\'s Pie','Main',5.99,480,'Irish',24.00,35.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(66,'Corned Beef','Main',5.99,290,'Delicatessen',20.00,5.00,18.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(67,'Philly Cheesesteak','Main',6.99,620,'Philly',30.00,45.00,32.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(68,'Beef Meatballs','Main',5.49,420,'Italian',22.00,25.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(69,'Sloppy Joes','Main',4.99,470,'Sandwich',18.00,45.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(70,'Pulled Pork Sandwich','Main',5.99,510,'BBQ',28.00,50.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(71,'Pork Chop','Main',6.49,340,'Lean Protein',30.00,0.00,18.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(72,'BBQ Ribs','Main',8.99,580,'BBQ',35.00,25.00,38.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(73,'Ham Sandwich','Main',4.99,380,'Sandwich',18.00,35.00,15.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(74,'Pork Carnitas','Main',6.49,420,'Mexican',28.00,15.00,22.00,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(75,'Ham & Cheese Omelet','Main',5.49,490,'Breakfast',25.00,5.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(76,'Fish Sandwich','Main',5.49,420,'Contains Shellfish',20.00,35.00,18.00,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,'2026-04-06 01:18:38','2026-04-07 00:50:56',NULL),(77,'Fish Tacos','Main',5.99,460,'Contains Shellfish',18.00,28.00,20.00,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,'2026-04-06 01:18:38','2026-04-07 00:50:56',NULL),(78,'Grilled Salmon','Main',8.99,360,'Omega-3, Contains Shellfish',35.00,0.00,18.00,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,'2026-04-06 01:18:38','2026-04-07 00:50:56',NULL),(79,'Shrimp Scampi','Main',7.99,480,'Contains Shellfish',25.00,30.00,22.00,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(80,'Popcorn Shrimp','Main',5.99,390,'Contains Shellfish',15.00,25.00,18.00,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(81,'Tuna Salad Sandwich','Main',4.99,440,'Contains Shellfish',22.00,30.00,16.00,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(82,'Fried Cod','Main',5.99,430,'Contains Shellfish',22.00,28.00,20.00,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(83,'Crab Cakes','Main',6.99,310,'Contains Shellfish',18.00,22.00,22.00,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:38','2026-04-06 01:40:03',NULL),(84,'Veggie Burger','Main',5.49,350,'Vegetarian',15.00,35.00,12.00,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(85,'Black Bean Burger','Main',5.99,380,'Vegan, High Fiber',18.00,40.00,8.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(86,'Impossible Burger','Main',7.49,420,'Vegan',20.00,25.00,18.00,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(87,'Vegetable Stir Fry','Main',5.49,280,'Vegan, Low Fat',8.00,30.00,5.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(88,'Tofu Bowl','Main',5.99,340,'Vegan',15.00,25.00,12.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(89,'Vegan Chili','Main',4.49,260,'Vegan, High Fiber',12.00,35.00,5.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(90,'Stuffed Bell Peppers','Main',5.49,310,'Vegetarian',6.00,28.00,3.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(91,'Eggplant Parmesan','Main',6.99,450,'Vegetarian',12.00,45.00,22.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(92,'Veggie Lasagna','Main',6.99,480,'Vegetarian',18.00,55.00,20.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(93,'Spinach Ricotta Roll','Main',6.49,390,'Vegetarian',15.00,35.00,18.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(94,'Falafel Wrap','Main',5.99,460,'Vegan',12.00,45.00,18.00,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(95,'Hummus & Pita','Main',4.49,380,'Vegan',6.00,25.00,12.00,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(96,'Spaghetti & Meatballs','Main',7.49,580,'Italian',28.00,65.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(97,'Fettuccine Alfredo','Main',6.99,620,'Contains Dairy',12.00,55.00,35.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(98,'Mac & Cheese','Main',4.99,540,'Comfort Food',15.00,48.00,28.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(99,'Baked Ziti','Main',6.49,560,'Italian',20.00,60.00,25.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(100,'Penne Vodka','Main',6.99,590,'Italian',18.00,58.00,28.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(101,'Lasagna','Main',6.99,610,'Italian',28.00,50.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(102,'Ravioli','Main',6.49,480,'Italian',15.00,48.00,22.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(103,'Pesto Pasta','Main',6.49,520,'Italian',12.00,52.00,25.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(104,'Garlic Noodles','Side',3.99,390,'Asian',8.00,55.00,15.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(105,'Cheese Pizza Slice','Main',2.99,300,'Contains Dairy',12.00,35.00,12.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(106,'Pepperoni Pizza Slice','Main',3.29,350,'Contains Dairy',14.00,36.00,14.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(107,'Sausage Pizza Slice','Main',3.29,360,'Contains Dairy',14.00,35.00,15.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(108,'Vegetable Pizza Slice','Main',3.29,310,'Vegetarian',10.00,35.00,10.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(109,'BBQ Chicken Pizza Slice','Main',3.49,340,'BBQ',15.00,38.00,12.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(110,'White Pizza Slice','Main',3.29,320,'Contains Dairy',11.00,34.00,13.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(111,'Gluten Free Cheese Pizza','Main',4.99,280,'Gluten Free',10.00,32.00,11.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(112,'Turkey Club Sandwich','Main',6.49,520,'Sandwich',28.00,48.00,25.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(113,'BLT Sandwich','Main',5.49,460,'Sandwich',18.00,35.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(114,'Grilled Cheese','Main',3.99,380,'Vegetarian',12.00,32.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(115,'Reuben Sandwich','Main',6.99,580,'Deli',25.00,48.00,32.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(116,'Chicken Salad Sandwich','Main',5.99,470,'Sandwich',24.00,42.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(117,'Egg Salad Sandwich','Main',4.49,410,'Vegetarian',12.00,38.00,22.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(118,'Meatball Sub','Main',6.49,610,'Italian',28.00,55.00,28.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(119,'Italian Sub','Main',6.99,590,'Deli',26.00,52.00,30.00,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(120,'French Fries','Side',2.49,380,'Fried',4.00,48.00,18.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(121,'Sweet Potato Fries','Side',2.99,350,'Healthy',3.00,42.00,16.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(122,'Mashed Potatoes','Side',1.99,210,'Comfort Food',4.00,32.00,8.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(123,'Baked Potato','Side',1.99,220,'Low Fat',5.00,48.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(124,'Steamed Rice','Side',1.49,200,'Low Fat',4.00,45.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(125,'Brown Rice','Side',1.49,180,'Whole Grain',3.00,40.00,1.50,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(126,'French Bread','Side',1.29,150,'Bread',5.00,28.00,1.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(127,'Garlic Bread','Side',1.79,190,'Garlic',5.00,30.00,6.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(128,'Corn on Cob','Side',1.99,140,'Vegetable',3.00,28.00,2.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(129,'Green Beans','Side',1.49,60,'Low Calorie',2.00,7.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(130,'Steamed Broccoli','Side',1.49,55,'Low Calorie',3.00,7.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(131,'Cauliflower','Side',1.49,50,'Low Calorie',2.00,5.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(132,'Brussels Sprouts','Side',1.99,70,'Low Calorie',3.00,8.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(133,'Asparagus','Side',2.49,40,'Low Calorie',3.00,4.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(134,'Coleslaw','Side',1.79,150,'Creamy',1.00,14.00,10.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(135,'Potato Salad','Side',1.99,210,'Creamy',3.00,22.00,12.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(136,'Macaroni Salad','Side',1.99,260,'Creamy',4.00,28.00,14.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(137,'Fruit Cup','Side',2.49,90,'Low Fat',1.00,22.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(138,'Apple Slices','Side',1.29,45,'Low Calorie',0.50,12.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(139,'Tomato Soup','Soup',3.49,160,'Contains Dairy',2.00,18.00,8.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(140,'Broccoli Cheddar Soup','Soup',3.99,280,'Contains Dairy',8.00,15.00,18.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(141,'French Onion Soup','Soup',3.49,190,'Onion',4.00,15.00,8.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(142,'Loaded Baked Potato Soup','Soup',4.49,320,'Comfort Food',8.00,32.00,16.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(143,'Minestrone Soup','Soup',3.49,140,'Vegetarian',5.00,22.00,3.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(144,'Lentil Soup','Soup',3.49,180,'Vegan, High Protein',12.00,28.00,2.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(145,'Clam Chowder','Soup',4.49,230,'Contains Shellfish',12.00,22.00,12.00,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(146,'Chocolate Chip Cookie','Dessert',1.29,180,'Sweet',2.00,24.00,10.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(147,'Brownie','Dessert',1.99,220,'Chocolate',2.00,28.00,12.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(148,'Cheesecake Slice','Dessert',3.99,380,'Contains Dairy',6.00,28.00,24.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(149,'Chocolate Cake Slice','Dessert',3.49,350,'Chocolate',4.00,42.00,18.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(150,'Vanilla Ice Cream','Dessert',1.99,150,'Contains Dairy',3.00,18.00,8.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(151,'Chocolate Ice Cream','Dessert',1.99,160,'Contains Dairy',3.00,20.00,8.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(152,'Strawberry Ice Cream','Dessert',1.99,150,'Contains Dairy',2.00,18.00,7.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(153,'Frozen Yogurt','Dessert',1.99,120,'Low Fat',3.00,22.00,3.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(154,'Rice Pudding','Dessert',2.29,190,'Comfort Food',3.00,35.00,4.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(155,'Fruit Sorbet','Dessert',2.29,110,'Vegan',1.00,28.00,0.00,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(156,'Apple Pie Slice','Dessert',3.49,300,'Fruit',2.00,42.00,14.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(157,'Brownie Sundae','Dessert',4.49,420,'Sundae',6.00,55.00,22.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(158,'Coffee','Beverage',1.99,5,'Caffeine',0.30,0.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(159,'Decaf Coffee','Beverage',1.99,5,'Caffeine Free',0.30,0.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(160,'Hot Tea','Beverage',1.99,0,'Herbal',0.00,0.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(161,'Orange Juice','Beverage',2.49,110,'Vitamin C',1.50,26.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(162,'Apple Juice','Beverage',2.49,120,'Fruit Juice',0.50,28.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(163,'Cranberry Juice','Beverage',2.49,130,'Fruit Juice',0.50,32.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(164,'Lemonade','Beverage',2.29,100,'Citrus',0.00,26.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(165,'Iced Tea','Beverage',1.99,90,'Tea',0.00,22.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(166,'Soda','Beverage',1.99,150,'Carbonated',0.00,39.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(167,'Diet Soda','Beverage',1.99,0,'Sugar Free',0.00,0.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(168,'Water Bottle','Beverage',1.49,0,'Hydration',0.00,0.00,0.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(169,'Chocolate Milk','Beverage',2.29,210,'Contains Dairy',8.00,26.00,8.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(170,'White Milk','Beverage',1.99,120,'Contains Dairy',8.00,12.00,5.00,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(171,'Almond Milk','Beverage',2.49,60,'Dairy Free',1.00,3.00,2.50,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL),(172,'Soy Milk','Beverage',2.49,100,'Dairy Free',7.00,4.00,4.00,1,1,0,1,0,0,0,0,0,0,0,0,1,1,1,1,'2026-04-06 01:18:39','2026-04-06 01:40:03',NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_items`
--

DROP TABLE IF EXISTS `meal_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_items` (
  `meal_item_id` int NOT NULL AUTO_INCREMENT,
  `meal_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`meal_item_id`),
  KEY `meals.meal_id_idx` (`meal_id`),
  KEY `items.item_id_idx` (`item_id`),
  CONSTRAINT `items.item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `meals.meal_id` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_items`
--

LOCK TABLES `meal_items` WRITE;
/*!40000 ALTER TABLE `meal_items` DISABLE KEYS */;
INSERT INTO `meal_items` VALUES (1,1,7,2),(2,1,10,1),(3,2,6,3),(4,2,4,1),(5,2,9,2),(6,3,11,1),(7,3,12,1),(8,3,3,1),(9,4,7,3),(10,4,9,2),(11,4,10,2),(12,5,8,1),(13,5,3,1),(14,6,7,2),(15,6,10,2),(16,6,14,1),(17,7,7,2),(18,7,120,1),(19,7,3,1),(20,8,56,1),(21,8,120,1),(22,9,5,1),(23,9,32,1),(24,10,96,1),(25,10,127,1),(26,11,40,1),(27,11,130,1),(28,11,124,1),(29,12,59,2),(30,13,89,1),(31,13,125,1),(32,14,112,1),(33,14,138,1),(34,15,61,1),(35,15,122,1),(36,15,129,1),(37,16,40,1),(38,16,130,1),(39,16,125,1),(40,17,89,1),(41,17,130,1),(42,17,125,1),(43,18,41,2),(44,18,122,1),(45,18,128,1),(46,19,78,1),(47,19,124,1),(48,19,133,1),(49,20,96,1),(50,20,127,1),(51,21,72,1),(52,21,120,1),(53,21,134,1);
/*!40000 ALTER TABLE `meal_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meals`
--

DROP TABLE IF EXISTS `meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meals` (
  `meal_id` int NOT NULL AUTO_INCREMENT,
  `meal_name` varchar(50) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `total_calories` int DEFAULT NULL,
  `total_price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals`
--

LOCK TABLES `meals` WRITE;
/*!40000 ALTER TABLE `meals` DISABLE KEYS */;
INSERT INTO `meals` VALUES (1,'Classic Breakfast','Monday',450,6.99),(2,'Protein Breakfast','Tuesday',520,7.99),(3,'Light Breakfast','Wednesday',310,5.49),(4,'Hearty Breakfast','Thursday',680,8.99),(5,'Vegan Breakfast','Friday',380,6.49),(6,'Weekend Special','Saturday',590,7.99),(7,'Brunch','Sunday',650,9.99),(8,'Classic Burger Lunch','Monday',780,9.99),(9,'Healthy Salad Lunch','Tuesday',450,8.49),(10,'Pasta Lunch','Wednesday',720,9.49),(11,'Chicken Lunch Combo','Thursday',650,8.99),(12,'Mexican Lunch','Friday',810,10.99),(13,'Vegan Lunch Bowl','Saturday',480,8.99),(14,'Sandwich Lunch','Sunday',560,7.99),(15,'Hearty Dinner','Monday',890,12.99),(16,'Grilled Chicken Dinner','Tuesday',620,11.99),(17,'Vegan Dinner','Wednesday',510,10.99),(18,'Comfort Food Dinner','Thursday',940,13.99),(19,'Seafood Dinner','Friday',720,14.99),(20,'Italian Dinner','Saturday',850,12.99),(21,'BBQ Dinner','Sunday',980,13.99);
/*!40000 ALTER TABLE `meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_update_log`
--

DROP TABLE IF EXISTS `menu_update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_update_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `change_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `employee.emp_id_idx` (`emp_id`),
  CONSTRAINT `employee.emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_update_log`
--

LOCK TABLES `menu_update_log` WRITE;
/*!40000 ALTER TABLE `menu_update_log` DISABLE KEYS */;
INSERT INTO `menu_update_log` VALUES (1,1,'items',45,'UPDATE','{\"price\": 5.99}','{\"price\": 6.49}','2026-04-07 00:23:22'),(2,1,'items',78,'UPDATE','{\"price\": 8.49}','{\"price\": 8.99}','2026-04-07 00:23:22'),(3,1,'meals',7,'UPDATE','{\"total_price\": 8.99}','{\"total_price\": 9.99}','2026-04-07 00:23:22'),(4,33,'items',112,'INSERT',NULL,'{\"item_name\": \"Turkey Club Sandwich\"}','2026-04-07 00:23:22'),(5,33,'meals',5,'UPDATE','{\"total_price\": 8.99}','{\"total_price\": 9.49}','2026-04-07 00:23:22'),(6,33,'items',88,'UPDATE','{\"price\": 5.49}','{\"price\": 5.99}','2026-04-07 00:23:22'),(7,34,'items',56,'UPDATE','{\"is_vegetarian\": 0}','{\"is_vegetarian\": 1}','2026-04-07 00:23:22'),(8,34,'items',89,'INSERT',NULL,'{\"item_name\": \"Vegan Chili\"}','2026-04-07 00:23:22'),(9,34,'meals',16,'UPDATE','{\"total_calories\": 580}','{\"total_calories\": 620}','2026-04-07 00:23:22'),(10,36,'items',120,'UPDATE','{\"price\": 2.29}','{\"price\": 2.49}','2026-04-07 00:23:22'),(11,36,'meals',10,'UPDATE','{\"total_calories\": 650}','{\"total_calories\": 620}','2026-04-07 00:23:22'),(12,36,'items',150,'UPDATE','{\"is_available\": 1}','{\"is_available\": 0}','2026-04-07 00:23:22'),(13,36,'items',34,'DELETE','{\"item_name\": \"Old Dressing\"}',NULL,'2026-04-07 00:23:22');
/*!40000 ALTER TABLE `menu_update_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition_facts`
--

DROP TABLE IF EXISTS `nutrition_facts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition_facts` (
  `nutrition_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `serving_size` varchar(50) DEFAULT NULL,
  `ingredients` text,
  `allergens` varchar(255) DEFAULT NULL,
  `preparation_notes` text,
  PRIMARY KEY (`nutrition_id`),
  KEY `fk_nutrition_item_id` (`item_id`),
  CONSTRAINT `fk_nutrition_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition_facts`
--

LOCK TABLES `nutrition_facts` WRITE;
/*!40000 ALTER TABLE `nutrition_facts` DISABLE KEYS */;
INSERT INTO `nutrition_facts` VALUES (1,110,'1 slice (110g)','Pizza dough, white sauce (cream, butter, garlic), mozzarella cheese, ricotta cheese, parmesan, Italian seasoning','Dairy, Gluten, Eggs','Baked at 450°F until golden brown. Contains 320 calories per slice.'),(2,170,'8 fl oz (240ml)','Grade A pasteurized milk, vitamin D3','Dairy, Lactose','Served cold at 38°F. Pasteurized for safety.'),(3,18,'1 bagel (95g)','Whole wheat flour, water, yeast, brown sugar, salt, wheat gluten, molasses','Gluten, Wheat','Baked fresh daily. Can be toasted upon request. Contains 280 calories.'),(4,168,'16.9 fl oz (500ml)','Purified drinking water, trace minerals for taste','None','Bottled at source. No calories, sugar, or additives.'),(5,2,'1 wrap (280g)','Whole wheat tortilla, hummus, cucumber, bell peppers, spinach, shredded carrots, red onion, romaine lettuce, avocado','Gluten, Sesame (tahini in hummus)','Wrapped fresh to order. Vegetarian. 350 calories.'),(6,92,'1 serving (300g)','Lasagna noodles, ricotta cheese, mozzarella, parmesan, spinach, zucchini, yellow squash, mushrooms, marinara sauce','Dairy, Gluten, Eggs','Layered and baked for 45 minutes. Vegetarian. 480 calories.'),(7,84,'1 burger (200g)','Vegetable patty (carrots, peas, corn, potatoes, bell peppers), whole wheat bun, lettuce, tomato, onion, pickles','Gluten, Soy (may contain)','Grilled on flat top. Served with lettuce, tomato, onion. 350 calories.'),(8,87,'1 serving (320g)','Broccoli, bell peppers, carrots, snap peas, onions, mushrooms, water chestnuts, garlic, ginger, low-sodium soy sauce, sesame oil','Soy, Sesame','Wok-fried at high heat. Vegan option - no egg or oyster sauce. 280 calories.'),(9,108,'1 slice (120g)','Pizza dough, marinara sauce, mozzarella cheese, bell peppers, red onions, mushrooms, black olives, spinach','Dairy, Gluten','Baked fresh. Topped with assorted vegetables. 310 calories.'),(10,89,'1 cup (240ml)','Kidney beans, black beans, pinto beans, tomatoes, corn, bell peppers, onions, garlic, chili powder, cumin, paprika, vegetable broth','None','Slow-simmered for 2 hours. Vegan and gluten-free. 260 calories.'),(11,11,'5.3 oz (150g)','Cultured pasteurized milk, sugar, vanilla extract, pectin, live active cultures (S. thermophilus, L. bulgaricus)','Dairy','Keep refrigerated. Contains probiotics. 150 calories.'),(12,150,'1/2 cup (66g)','Milk, cream, sugar, vanilla extract, egg yolks, guar gum, carrageenan','Dairy, Eggs','Churned and frozen. Contains real vanilla bean specks. 150 calories per serving.'),(13,112,'1 sandwich (280g)','Oven-roasted turkey breast, bacon, lettuce, tomato, mayonnaise, sourdough bread','Gluten, Eggs','Grilled on panini press. Served with pickle spear. 520 calories.'),(14,81,'1 sandwich (250g)','Tuna, mayonnaise, celery, onion, relish, wheat bread, lettuce','Fish (Tuna), Eggs, Gluten','Prepared fresh daily. Tuna is dolphin-safe. 440 calories.'),(15,33,'1/2 cup (120g)','Tuna, mayonnaise, celery, onion, sweet pickle relish, black pepper','Fish (Tuna), Eggs','Made in-house each morning. Serve chilled. 200 calories.'),(16,139,'1 cup (240ml)','Tomatoes, heavy cream, onion, garlic, basil, vegetable stock, butter, salt, pepper','Dairy','Simmered then blended until smooth. 160 calories per cup.'),(17,88,'1 bowl (400g)','Firm tofu, brown rice, edamame, shredded carrots, cucumber, avocado, sesame seeds, green onions, soy-ginger dressing','Soy, Sesame','Served cold. Build your own bowl style. 340 calories.'),(18,49,'1 serving (200g)','Chicken breast, teriyaki sauce (soy sauce, mirin, sugar, ginger, garlic), sesame seeds, green onions','Soy, Sesame','Grilled then glazed with teriyaki. Served with steamed rice. 410 calories.'),(19,121,'1 serving (150g)','Sweet potatoes, canola oil, cornstarch, sea salt, paprika, garlic powder','None','Baked until crispy. Healthier alternative to regular fries. 350 calories.'),(20,90,'1 pepper (280g)','Bell pepper, quinoa, black beans, corn, tomatoes, onions, garlic, cumin, chili powder, shredded cheddar cheese','Dairy','Baked until pepper is tender. 310 calories.'),(21,152,'1/2 cup (66g)','Milk, cream, sugar, strawberries, natural flavors, beet juice (for color)','Dairy','Contains real strawberry pieces. 150 calories per serving.'),(22,124,'1 cup (158g)','White rice, water, salt','None','Steamed to order. Fluffy and tender. 200 calories per cup.'),(23,130,'1 cup (91g)','Fresh broccoli florets, water','None','Lightly steamed until bright green. Retains crunch. 55 calories.'),(24,93,'1 roll (220g)','Pasta dough, fresh spinach, ricotta cheese, parmesan cheese, nutmeg, marinara sauce','Dairy, Gluten, Eggs','Rolled and baked with marinara. 390 calories.'),(25,96,'1 serving (400g)','Spaghetti pasta, beef meatballs (beef, breadcrumbs, egg, parmesan, parsley), marinara sauce, parmesan cheese','Dairy, Gluten, Eggs','Meatballs are baked then simmered in sauce. 580 calories.'),(26,1,'1 sandwich (250g)','Grilled chicken breast, lettuce, tomato, mayo, whole wheat bun','Gluten, Eggs','Grilled to order. 450 calories.'),(27,2,'1 wrap (280g)','Whole wheat tortilla, hummus, cucumber, bell peppers, spinach, carrots, red onion','Gluten, Sesame','Wrapped fresh. 350 calories. Vegetarian.'),(28,3,'1 cup (150g)','Fresh mixed fruit: grapes, pineapple, melon, berries','None','Fresh cut daily. 120 calories.'),(29,4,'5.3 oz (150g)','Greek yogurt, live active cultures','Dairy','High protein. 280 calories.'),(30,5,'1 salad (250g)','Romaine lettuce, parmesan cheese, croutons, Caesar dressing','Dairy, Gluten, Eggs','Tossed to order. 320 calories.'),(31,6,'2 eggs (100g)','Grade A eggs, water','Eggs','Hard boiled. 80 calories.'),(32,7,'2 eggs (120g)','Grade A eggs, milk, butter, salt, pepper','Dairy, Eggs','Scrambled fresh. 180 calories.'),(33,8,'1 cup (240g)','Stone-ground grits, water, salt, butter','Dairy','Creamy and smooth. 110 calories.'),(34,9,'1 patty (45g)','Pork, sage, black pepper, salt, red pepper flakes','None','Grilled until browned. 180 calories.'),(35,10,'3 pieces (85g)','Shredded potatoes, onion powder, salt, vegetable oil','None','Fried until golden. 90 calories.'),(36,11,'5.3 oz (150g)','Cultured milk, sugar, vanilla, pectin','Dairy','Creamy vanilla flavor. 150 calories.'),(37,12,'1/2 cup (50g)','Rolled oats, honey, almonds, dried cranberries, coconut','Tree Nuts','Baked until crunchy. 110 calories.'),(38,13,'1 pastry (85g)','Puff pastry, cream cheese filling or fruit filling, powdered sugar','Dairy, Gluten, Eggs','Baked fresh daily. 260 calories.'),(39,14,'1 muffin (85g)','Flour, sugar, eggs, oil, blueberries or chocolate chips','Gluten, Eggs','Baked fresh. 240 calories.'),(40,15,'1 bagel (95g)','Enriched flour, water, blueberries, sugar, yeast, salt','Gluten, Wheat','Boiled then baked. 160 calories.'),(41,16,'1 bagel (95g)','Enriched flour, water, raisins, cinnamon, sugar, yeast, salt','Gluten, Wheat','Sweet cinnamon swirl. 290 calories.'),(42,17,'1 bagel (95g)','Enriched flour, water, sesame seeds, sugar, yeast, salt','Gluten, Wheat, Sesame','Topped with sesame seeds. 290 calories.'),(43,18,'1 bagel (95g)','Whole wheat flour, water, molasses, yeast, salt, wheat gluten','Gluten, Wheat','100% whole wheat. 280 calories.'),(44,19,'2 tbsp (30g)','Pasteurized cream cheese, salt, stabilizers','Dairy','Creamy spread. 70 calories.'),(45,20,'2 cups (85g)','Fresh romaine lettuce','None','Crisp and fresh. 0 calories.'),(46,21,'2 cups (85g)','Spring mix: baby lettuces, arugula, spinach','None','Fresh mixed greens. 25 calories.'),(47,22,'1/2 cup (75g)','Fresh bell peppers, red, green, yellow','None','Sliced fresh. 25 calories.'),(48,23,'1 cup (90g)','Fresh broccoli florets','None','Raw, crisp texture. 30 calories.'),(49,24,'2 tbsp (15g)','Cured black olives in brine','None','Sliced. 25 calories.'),(50,25,'1/2 cup (50g)','Fresh cucumber slices','None','Refreshing and crisp. 10 calories.'),(51,26,'1/2 cup (75g)','Cherry tomatoes, fresh','None','Sweet and juicy. 15 calories.'),(52,27,'1/4 cup (30g)','Shredded carrots','None','Fresh shredded. 20 calories.'),(53,28,'1/4 cup (40g)','Red onion, thinly sliced','None','Sharp and tangy. 15 calories.'),(54,29,'2 tbsp (15g)','White bread cubes, garlic, olive oil, herbs','Gluten','Toasted until golden. 60 calories.'),(55,30,'2 tbsp (15g)','Shredded cheddar and mozzarella blend','Dairy','Finely shredded. 110 calories.'),(56,31,'2 eggs (100g)','Grade A eggs, water','Eggs','Hard boiled. 80 calories.'),(57,32,'3 oz (85g)','Grilled chicken breast, sliced','None','Grilled, sliced thin. 150 calories.'),(58,33,'1/2 cup (120g)','Tuna, mayo, celery, onion, relish','Fish, Eggs','Made fresh daily. 200 calories.'),(59,34,'2 tbsp (30ml)','Buttermilk, mayo, garlic, onion, herbs','Dairy, Eggs','Creamy ranch. 140 calories.'),(60,35,'2 tbsp (30ml)','Mayo, parmesan, garlic, anchovy, lemon','Fish, Dairy, Eggs','Classic Caesar. 150 calories.'),(61,36,'2 tbsp (30ml)','Balsamic vinegar, olive oil, garlic, herbs','None','Tangy vinaigrette. 90 calories.'),(62,37,'2 tbsp (30ml)','Red wine vinegar, oil, garlic, oregano, basil','None','Zesty Italian. 80 calories.'),(63,38,'2 tbsp (30ml)','Mayo, sour cream, blue cheese, buttermilk','Dairy, Eggs','Bold blue cheese. 150 calories.'),(64,39,'2 tbsp (30ml)','Buttermilk, yogurt, garlic, onion, herbs','Dairy','Reduced fat. 60 calories.'),(65,40,'6 oz (170g)','Boneless skinless chicken breast','None','Grilled to perfection. 220 calories.'),(66,41,'4 pieces (150g)','Chicken breast, breading, spices','Gluten, Eggs','Crispy fried. 450 calories.'),(67,42,'4 pieces (150g)','Chicken tenders, buffalo sauce, breading','Gluten, Eggs','Spicy and crispy. 480 calories.'),(68,43,'1 serving (280g)','Chicken breast, marinara, mozzarella, parmesan, pasta','Dairy, Gluten','Baked with cheese. 520 calories.'),(69,44,'6 oz (170g)','Chicken breast, BBQ sauce, spices','None','Grilled with BBQ glaze. 310 calories.'),(70,45,'6 oz (170g)','Chicken breast, lemon pepper seasoning, olive oil','None','Zesty lemon flavor. 280 calories.'),(71,46,'1 serving (350g)','Fettuccine, chicken, alfredo sauce, parmesan','Dairy, Gluten, Eggs','Creamy pasta. 650 calories.'),(72,47,'1 serving (300g)','Chicken, mushrooms, marsala wine sauce','Dairy, Gluten','Rich mushroom sauce. 490 calories.'),(73,48,'1 serving (280g)','Chicken, lemon, capers, butter sauce','Dairy','Tangy caper sauce. 380 calories.'),(74,49,'1 serving (280g)','Chicken, teriyaki sauce, sesame seeds, green onions','Soy','Grilled with teriyaki. 410 calories.'),(75,50,'1 quesadilla (250g)','Flour tortilla, chicken, cheese, peppers, onions','Dairy, Gluten','Griddled crispy. 540 calories.'),(76,51,'1 wrap (300g)','Flour tortilla, chicken, lettuce, tomato, ranch','Gluten, Dairy, Eggs','Wrapped fresh. 490 calories.'),(77,52,'1 cup (240ml)','Chicken broth, noodles, chicken, carrots, celery','Gluten','Homestyle soup. 180 calories.'),(78,53,'1 pie (350g)','Chicken, vegetables, creamy sauce, pie crust','Dairy, Gluten','Baked in flaky crust. 560 calories.'),(79,54,'1 serving (300g)','Chicken, rice, egg, vegetables, soy sauce','Soy, Eggs','Wok-fried. 480 calories.'),(80,55,'1 burger (200g)','Beef patty, lettuce, tomato, onion, pickles, bun','Gluten','Grilled to order. 450 calories.'),(81,56,'1 burger (220g)','Beef patty, American cheese, lettuce, tomato, bun','Dairy, Gluten','Classic cheeseburger. 520 calories.'),(82,57,'1 burger (250g)','Beef patty, bacon, cheese, lettuce, tomato, bun','Dairy, Gluten','Loaded with bacon. 600 calories.'),(83,58,'1 burger (300g)','Two beef patties, double cheese, toppings, bun','Dairy, Gluten','Double patty. 720 calories.'),(84,59,'2 tacos (150g)','Ground beef, lettuce, cheese, taco shell','Dairy, Gluten','Crispy shell. 380 calories.'),(85,60,'1 burrito (350g)','Beef, rice, beans, cheese, salsa, sour cream, tortilla','Dairy, Gluten','Grilled burrito. 620 calories.'),(86,61,'1 slice (200g)','Ground beef, breadcrumbs, onions, tomato glaze','Gluten, Eggs','Homestyle meatloaf. 490 calories.'),(87,62,'1 cup (240ml)','Beef, potatoes, carrots, peas, beef broth','None','Slow-cooked stew. 350 calories.'),(88,63,'4 oz (115g)','Roasted beef sirloin','None','Slow-roasted. 280 calories.'),(89,64,'1 serving (300g)','Beef strips, mushrooms, onions, sour cream sauce over egg noodles','Dairy, Gluten','Creamy stroganoff. 540 calories.'),(90,65,'1 serving (350g)','Ground beef, peas, carrots, mashed potatoes','Dairy, Gluten','Topped with mashed potatoes. 480 calories.'),(91,66,'4 oz (115g)','Corned beef brisket','None','Brined and slow-cooked. 290 calories.'),(92,67,'1 sandwich (300g)','Shaved beef, onions, peppers, cheese, hoagie roll','Dairy, Gluten','Classic Philly. 620 calories.'),(93,68,'4 meatballs (150g)','Beef, breadcrumbs, parmesan, eggs, herbs','Dairy, Gluten, Eggs','Baked meatballs. 420 calories.'),(94,69,'1 sandwich (250g)','Ground beef, BBQ sauce, onions, hamburger bun','Gluten','Tangy sloppy joes. 470 calories.'),(95,70,'1 sandwich (280g)','Pulled pork, BBQ sauce, coleslaw, bun','Gluten','Slow-cooked pork. 510 calories.'),(96,71,'6 oz (170g)','Pork chop, seasoned','None','Grilled pork chop. 340 calories.'),(97,72,'1/2 rack (300g)','Pork ribs, BBQ rub, BBQ sauce','None','Slow-roasted ribs. 580 calories.'),(98,73,'1 sandwich (200g)','Ham, cheese, lettuce, tomato, mayo, bread','Dairy, Gluten, Eggs','Classic ham sandwich. 380 calories.'),(99,74,'4 oz (115g)','Pork carnitas, Mexican spices','None','Slow-cooked pulled pork. 420 calories.'),(100,75,'1 omelet (250g)','Ham, cheese, eggs','Dairy, Eggs','Fluffy omelet. 490 calories.'),(101,76,'1 sandwich (200g)','Breaded fish, tartar sauce, lettuce, bun','Fish, Gluten, Eggs','Crispy fish sandwich. 420 calories.'),(102,77,'2 tacos (200g)','Fish, cabbage slaw, crema, corn tortillas','Fish, Eggs','Baja-style fish tacos. 460 calories.'),(103,78,'6 oz (170g)','Atlantic salmon, lemon, dill','Fish','Grilled salmon fillet. 360 calories.'),(104,79,'1 serving (250g)','Shrimp, garlic, butter, white wine, pasta','Shellfish, Dairy, Gluten','Garlic shrimp scampi. 480 calories.'),(105,80,'1 serving (150g)','Popcorn shrimp, breading','Shellfish, Gluten','Crispy popcorn shrimp. 390 calories.'),(106,81,'1 sandwich (250g)','Tuna salad, lettuce, tomato, bread','Fish, Eggs, Gluten','Classic tuna salad. 440 calories.'),(107,82,'1 fillet (150g)','Cod fillet, beer batter','Fish, Gluten','English-style fried cod. 430 calories.'),(108,83,'2 cakes (150g)','Crab meat, breadcrumbs, mayo, spices','Crab, Eggs, Gluten','Pan-seared crab cakes. 310 calories.'),(109,84,'1 burger (200g)','Vegetable patty, lettuce, tomato, onion, bun','Gluten','Plant-based burger. 350 calories.'),(110,85,'1 burger (200g)','Black bean patty, lettuce, tomato, onion, bun','Gluten','Hearty bean burger. 380 calories.'),(111,86,'1 burger (200g)','Impossible patty, lettuce, tomato, onion, bun','Gluten','Plant-based meat. 420 calories.'),(112,87,'1 serving (300g)','Broccoli, bell peppers, carrots, snap peas, soy sauce','Soy','Wok-fried vegetables. 280 calories.'),(113,88,'1 bowl (400g)','Tofu, brown rice, edamame, carrots, cucumber, avocado','Soy','Build your own bowl. 340 calories.'),(114,89,'1 cup (240ml)','Kidney beans, black beans, tomatoes, corn, chili spices','None','Hearty vegan chili. 260 calories.'),(115,90,'1 pepper (280g)','Bell pepper, quinoa, black beans, corn, cheese','Dairy','Baked stuffed pepper. 310 calories.'),(116,91,'1 serving (250g)','Eggplant, marinara, mozzarella, parmesan, breadcrumbs','Dairy, Gluten, Eggs','Baked eggplant parmesan. 450 calories.'),(117,92,'1 serving (300g)','Lasagna noodles, ricotta, mozzarella, spinach, marinara','Dairy, Gluten, Eggs','Vegetarian lasagna. 480 calories.'),(118,93,'1 roll (220g)','Pasta, spinach, ricotta, parmesan, marinara','Dairy, Gluten, Eggs','Stuffed pasta rolls. 390 calories.'),(119,94,'1 wrap (280g)','Falafel, hummus, lettuce, tomato, cucumber, tahini','Sesame, Gluten','Mediterranean wrap. 460 calories.'),(120,95,'1 serving (200g)','Hummus, pita bread, olive oil','Gluten, Sesame','Served with warm pita. 380 calories.'),(121,96,'1 serving (350g)','Spaghetti, beef meatballs, marinara, parmesan','Dairy, Gluten, Eggs','Classic Italian. 580 calories.'),(122,97,'1 serving (350g)','Fettuccine, alfredo sauce, parmesan','Dairy, Gluten, Eggs','Creamy Alfredo. 620 calories.'),(123,98,'1 serving (250g)','Elbow macaroni, cheddar cheese sauce','Dairy, Gluten','Creamy mac and cheese. 540 calories.'),(124,99,'1 serving (300g)','Ziti pasta, ricotta, mozzarella, marinara','Dairy, Gluten, Eggs','Baked ziti. 560 calories.'),(125,100,'1 serving (300g)','Penne pasta, vodka sauce, parmesan, cream','Dairy, Gluten, Eggs','Creamy vodka sauce. 590 calories.'),(126,101,'1 serving (350g)','Lasagna noodles, beef, ricotta, mozzarella, marinara','Dairy, Gluten, Eggs','Classic lasagna. 610 calories.'),(127,102,'1 serving (250g)','Ravioli, marinara or alfredo sauce, parmesan','Dairy, Gluten, Eggs','Stuffed pasta. 480 calories.'),(128,103,'1 serving (300g)','Pasta, pesto sauce, pine nuts, parmesan','Tree Nuts, Dairy, Gluten','Fresh basil pesto. 520 calories.'),(129,104,'1 serving (250g)','Egg noodles, garlic, butter, parmesan, herbs','Dairy, Gluten, Eggs','Garlic butter noodles. 390 calories.'),(130,105,'1 slice (120g)','Pizza dough, marinara, mozzarella cheese','Dairy, Gluten','Classic cheese slice. 300 calories.'),(131,106,'1 slice (130g)','Pizza dough, marinara, mozzarella, pepperoni','Dairy, Gluten','Pepperoni slice. 350 calories.'),(132,107,'1 slice (130g)','Pizza dough, marinara, mozzarella, Italian sausage','Dairy, Gluten','Sausage slice. 360 calories.'),(133,108,'1 slice (130g)','Pizza dough, marinara, mozzarella, assorted vegetables','Dairy, Gluten','Veggie slice. 310 calories.'),(134,109,'1 slice (130g)','Pizza dough, BBQ sauce, chicken, red onion, mozzarella','Dairy, Gluten','BBQ chicken slice. 340 calories.'),(135,110,'1 slice (120g)','Pizza dough, white sauce, ricotta, mozzarella, garlic','Dairy, Gluten','White pizza slice. 320 calories.'),(136,111,'1 slice (120g)','Gluten-free crust, marinara, mozzarella cheese','Dairy','Gluten-free crust. 280 calories.'),(137,112,'1 sandwich (280g)','Turkey, bacon, lettuce, tomato, mayo, sourdough','Gluten, Eggs','Triple-decker club. 520 calories.'),(138,113,'1 sandwich (200g)','Bacon, lettuce, tomato, mayo, white toast','Gluten, Eggs','Classic BLT. 460 calories.'),(139,114,'1 sandwich (150g)','White bread, American cheese, butter','Dairy, Gluten','Grilled cheese. 380 calories.'),(140,115,'1 sandwich (300g)','Corned beef, Swiss cheese, sauerkraut, Russian dressing, rye bread','Dairy, Gluten, Eggs','Grilled reuben. 580 calories.'),(141,116,'1 sandwich (250g)','Chicken salad, lettuce, tomato, croissant','Gluten, Eggs','Homestyle chicken salad. 470 calories.'),(142,117,'1 sandwich (200g)','Egg salad, lettuce, white bread','Gluten, Eggs','Classic egg salad. 410 calories.'),(143,118,'1 sub (350g)','Meatballs, marinara, mozzarella, sub roll','Dairy, Gluten','Hearty meatball sub. 610 calories.'),(144,119,'1 sub (350g)','Ham, salami, pepperoni, provolone, lettuce, tomato, onion, Italian dressing','Dairy, Gluten','Classic Italian sub. 590 calories.'),(145,120,'1 serving (150g)','Potatoes, vegetable oil, salt','None','Crispy french fries. 380 calories.'),(146,121,'1 serving (150g)','Sweet potatoes, canola oil, salt, cornstarch','None','Baked sweet potato fries. 350 calories.'),(147,122,'1 cup (210g)','Potatoes, butter, milk, salt, pepper','Dairy','Creamy mashed potatoes. 210 calories.'),(148,123,'1 potato (170g)','Russet potato, olive oil, salt','None','Baked potato. 220 calories.'),(149,124,'1 cup (158g)','White rice, water, salt','None','Steamed white rice. 200 calories.'),(150,125,'1 cup (195g)','Brown rice, water, salt','None','Steamed brown rice. 180 calories.'),(151,126,'1 slice (50g)','French bread, flour, water, yeast, salt','Gluten','Crusty baguette. 150 calories.'),(152,127,'1 slice (50g)','French bread, garlic butter, parsley','Dairy, Gluten','Toasted garlic bread. 190 calories.'),(153,128,'1 ear (100g)','Fresh corn on the cob, butter, salt','Dairy','Steamed corn. 140 calories.'),(154,129,'1 cup (100g)','Fresh green beans, steamed','None','Lightly steamed. 60 calories.'),(155,130,'1 cup (90g)','Fresh broccoli florets, steamed','None','Lightly steamed. 55 calories.'),(156,131,'1 cup (100g)','Fresh cauliflower, steamed','None','Lightly steamed. 50 calories.'),(157,132,'1 cup (80g)','Fresh Brussels sprouts, roasted','None','Roasted until crispy. 70 calories.'),(158,133,'1 cup (100g)','Fresh asparagus, grilled','None','Grilled asparagus. 40 calories.'),(159,134,'1/2 cup (100g)','Cabbage, carrots, mayonnaise, vinegar, sugar','Eggs','Creamy coleslaw. 150 calories.'),(160,135,'1/2 cup (120g)','Potatoes, mayonnaise, celery, onion, mustard, eggs','Eggs','Classic potato salad. 210 calories.'),(161,136,'1/2 cup (120g)','Macaroni, mayonnaise, celery, onion, bell peppers, eggs','Gluten, Eggs','Creamy macaroni salad. 260 calories.'),(162,137,'1 cup (150g)','Mixed fresh fruit','None','Fresh fruit cup. 90 calories.'),(163,138,'1 apple (150g)','Fresh apple, sliced','None','Fresh apple slices. 45 calories.'),(164,139,'1 cup (240ml)','Tomatoes, cream, onion, garlic, basil','Dairy','Creamy tomato soup. 160 calories.'),(165,140,'1 cup (240ml)','Broccoli, cheddar cheese, cream, chicken broth','Dairy','Cheesy broccoli soup. 280 calories.'),(166,141,'1 cup (240ml)','Onions, beef broth, white wine, bread, cheese','Dairy, Gluten','French onion soup. 190 calories.'),(167,142,'1 cup (240ml)','Baked potato, cheddar, bacon, chives, sour cream','Dairy','Loaded potato soup. 320 calories.'),(168,143,'1 cup (240ml)','Vegetables, beans, pasta, tomato broth','Gluten','Hearty vegetable soup. 140 calories.'),(169,144,'1 cup (240ml)','Lentils, carrots, celery, onions, vegetable broth','None','High protein lentil soup. 180 calories.'),(170,145,'1 cup (240ml)','Clams, potatoes, cream, celery, onions, bacon','Shellfish, Dairy','New England clam chowder. 230 calories.'),(171,146,'1 cookie (30g)','Flour, butter, sugar, chocolate chips, eggs, vanilla','Dairy, Gluten, Eggs','Baked fresh. 180 calories.'),(172,147,'1 brownie (50g)','Flour, butter, sugar, cocoa, eggs, chocolate','Dairy, Gluten, Eggs','Fudgy brownie. 220 calories.'),(173,148,'1 slice (100g)','Cream cheese, sugar, eggs, graham cracker crust','Dairy, Gluten, Eggs','New York style. 380 calories.'),(174,149,'1 slice (100g)','Flour, sugar, cocoa, butter, eggs, frosting','Dairy, Gluten, Eggs','Rich chocolate cake. 350 calories.'),(175,150,'1/2 cup (66g)','Milk, cream, sugar, vanilla, egg yolks','Dairy, Eggs','Creamy vanilla. 150 calories.'),(176,151,'1/2 cup (66g)','Milk, cream, sugar, cocoa, egg yolks','Dairy, Eggs','Rich chocolate. 160 calories.'),(177,152,'1/2 cup (66g)','Milk, cream, sugar, strawberries, egg yolks','Dairy, Eggs','Fresh strawberry. 150 calories.'),(178,153,'1/2 cup (100g)','Cultured milk, sugar, vanilla','Dairy','Reduced fat. 120 calories.'),(179,154,'1/2 cup (120g)','Rice, milk, sugar, cinnamon, raisins','Dairy','Creamy rice pudding. 190 calories.'),(180,155,'1/2 cup (100g)','Fruit puree, sugar, water','None','Dairy-free sorbet. 110 calories.'),(181,156,'1 slice (100g)','Apples, sugar, cinnamon, pie crust','Gluten','Classic apple pie. 300 calories.'),(182,157,'1 sundae (200g)','Brownie, vanilla ice cream, chocolate sauce, whipped cream, cherry','Dairy, Gluten, Eggs','Decadent sundae. 420 calories.'),(183,158,'12 oz (355ml)','Fresh brewed coffee','None','Fresh brewed. 5 calories.'),(184,159,'12 oz (355ml)','Decaffeinated coffee','None','Decaf brewed. 5 calories.'),(185,160,'12 oz (355ml)','Hot tea, tea bag, hot water','None','Assorted tea bags. 0 calories.'),(186,161,'12 oz (355ml)','Fresh squeezed orange juice','None','100% juice. 110 calories.'),(187,162,'12 oz (355ml)','Apple juice from concentrate','None','100% juice. 120 calories.'),(188,163,'12 oz (355ml)','Cranberry juice cocktail','None','Cranberry blend. 130 calories.'),(189,164,'12 oz (355ml)','Lemonade, fresh squeezed','None','Fresh lemonade. 100 calories.'),(190,165,'12 oz (355ml)','Fresh brewed iced tea','None','Unsweetened. 90 calories.'),(191,166,'12 oz (355ml)','Carbonated soda','None','Regular soda. 150 calories.'),(192,167,'12 oz (355ml)','Diet carbonated soda','None','Zero sugar. 0 calories.'),(193,168,'16.9 oz (500ml)','Purified water','None','Bottled water. 0 calories.'),(194,169,'8 oz (240ml)','Chocolate milk, cocoa, sugar','Dairy','Creamy chocolate milk. 210 calories.'),(195,170,'8 oz (240ml)','Grade A milk','Dairy','Whole white milk. 120 calories.'),(196,171,'8 oz (240ml)','Almond milk, calcium, vitamins','Tree Nuts','Unsweetened. 60 calories.'),(197,172,'8 oz (240ml)','Soy milk, calcium, vitamins','Soy','Original flavor. 100 calories.');
/*!40000 ALTER TABLE `nutrition_facts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_type` enum('3-day','7-day','singe_meal') DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `meal_id` int DEFAULT NULL,
  `total_amount` decimal(6,2) DEFAULT NULL,
  `status` enum('pending','confirmed','completed','cancelled') DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_student_idx` (`student_id`),
  KEY `fk_orders_meal_idx` (`meal_id`),
  CONSTRAINT `fk_orders_meal` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_orders_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-04-06 21:26:06',NULL,NULL,1,6.99,'completed'),(2,2,'2026-04-06 21:26:06',NULL,NULL,8,9.99,'completed'),(3,3,'2026-04-06 21:26:06',NULL,NULL,15,12.99,'confirmed'),(4,14,'2026-04-06 21:26:06',NULL,NULL,2,7.99,'completed'),(5,15,'2026-04-06 21:26:06',NULL,NULL,9,8.49,'completed'),(6,16,'2026-04-06 21:26:06',NULL,NULL,16,11.99,'confirmed'),(7,17,'2026-04-06 21:26:06',NULL,NULL,3,5.49,'completed'),(8,18,'2026-04-06 21:26:06',NULL,NULL,10,9.49,'pending'),(9,19,'2026-04-06 21:26:06',NULL,NULL,4,8.99,'completed'),(10,20,'2026-04-06 21:26:06',NULL,NULL,17,10.99,'confirmed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `reset_id` int NOT NULL AUTO_INCREMENT,
  `user_type` enum('student','employee') NOT NULL,
  `user_id` int NOT NULL,
  `reset_token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `used` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reset_id`),
  UNIQUE KEY `reset_token_UNIQUE` (`reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_modifications`
--

DROP TABLE IF EXISTS `plan_modifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_modifications` (
  `modification_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `plan_type` enum('3-day','7-day') NOT NULL,
  `plan_id` int DEFAULT NULL,
  `old_meal_id` int DEFAULT NULL,
  `new_meal_id` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','approved','denied') DEFAULT 'pending',
  `reviewed_by_employee_id` int DEFAULT NULL,
  PRIMARY KEY (`modification_id`),
  KEY `fk_modifications_student_idx` (`student_id`),
  KEY `fk_modifications_employee_idx` (`reviewed_by_employee_id`),
  KEY `fk_modifications_old_meal_idx` (`old_meal_id`),
  KEY `fk_modifications_new_meal_idx` (`new_meal_id`),
  CONSTRAINT `fk_modifications_employee` FOREIGN KEY (`reviewed_by_employee_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `fk_modifications_new_meal` FOREIGN KEY (`new_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_modifications_old_meal` FOREIGN KEY (`old_meal_id`) REFERENCES `meals` (`meal_id`),
  CONSTRAINT `fk_modifications_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_modifications`
--

LOCK TABLES `plan_modifications` WRITE;
/*!40000 ALTER TABLE `plan_modifications` DISABLE KEYS */;
INSERT INTO `plan_modifications` VALUES (1,1,'3-day',1,8,9,'Want healthier lunch option','2026-04-07 00:29:42','approved',1),(2,2,'7-day',1,12,13,'Vegan preference','2026-04-07 00:29:42','pending',NULL),(3,3,'3-day',2,15,16,'Too many calories for dinner','2026-04-07 00:29:42','approved',33),(4,14,'7-day',3,6,5,'Gluten free request','2026-04-07 00:29:42','pending',NULL),(5,15,'3-day',4,8,9,'Prefer chicken over beef','2026-04-07 00:29:42','approved',34),(6,16,'7-day',4,18,19,'Seafood allergy','2026-04-07 00:29:42','denied',36),(7,17,'3-day',5,10,11,'Want more protein','2026-04-07 00:29:42','pending',NULL),(8,18,'7-day',2,14,13,'Budget constraints','2026-04-07 00:29:42','approved',1),(9,19,'3-day',6,5,6,'Weekend schedule change','2026-04-07 00:29:42','pending',NULL),(10,20,'7-day',5,21,20,'Prefer Italian over BBQ','2026-04-07 00:29:42','approved',33);
/*!40000 ALTER TABLE `plan_modifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_login`
--

DROP TABLE IF EXISTS `student_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_attempts` int DEFAULT '0',
  `is_locked` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `student_login_username_UNIQUE` (`username`),
  UNIQUE KEY `student_login_student_id_UNIQUE` (`student_id`),
  CONSTRAINT `fk_student_login_students1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_login`
--

LOCK TABLES `student_login` WRITE;
/*!40000 ALTER TABLE `student_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_id_number` varchar(20) DEFAULT NULL,
  `balance` decimal(8,2) DEFAULT '0.00',
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_email_UNIQUE` (`student_email`),
  UNIQUE KEY `student_id_number_UNIQUE` (`student_id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'John Smith','john@campus.edu','S001',0.00),(2,'Emma Davis','emma@campus.edu','S002',0.00),(3,'Michael Lee','michael@campus.edu','S003',0.00),(14,'John Smith','jsmith@georgiasouthern.edu','901234567',500.00),(15,'Emma Johnson','ejohnson@georgiasouthern.edu','902345678',350.00),(16,'Michael Williams','mwilliams@georgiasouthern.edu','903456789',200.00),(17,'Sarah Brown','sbrown@georgiasouthern.edu','904567890',600.00),(18,'James Jones','jjones@georgiasouthern.edu','905678901',150.00),(19,'Emily Garcia','egarcia@georgiasouthern.edu','906789012',400.00),(20,'David Miller','dmiller@georgiasouthern.edu','907890123',300.00),(21,'Jessica Davis','jdavis@georgiasouthern.edu','908901234',550.00),(22,'Daniel Rodriguez','drodriguez@georgiasouthern.edu','909012345',250.00),(23,'Ashley Martinez','amartinez@georgiasouthern.edu','910123456',450.00),(24,'Christopher Wilson','cwilson@georgiasouthern.edu','911234567',100.00),(25,'Amanda Anderson','aanderson@georgiasouthern.edu','912345678',700.00),(26,'Matthew Thomas','mthomas@georgiasouthern.edu','913456789',350.00),(27,'Jennifer Taylor','jtaylor@georgiasouthern.edu','914567890',180.00),(28,'Joshua Moore','jmoore@georgiasouthern.edu','915678901',500.00),(29,'Olivia Jackson','ojackson@georgiasouthern.edu','916789012',425.00),(30,'William White','wwhite@georgiasouthern.edu','917890123',275.00),(31,'Sophia Harris','sharris@georgiasouthern.edu','918901234',600.00),(32,'Benjamin Martin','bmartin@georgiasouthern.edu','919012345',320.00),(33,'Isabella Thompson','ithompson@georgiasouthern.edu','920123456',480.00);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-07 14:34:33
