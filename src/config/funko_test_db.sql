CREATE DATABASE  IF NOT EXISTS `funko_test` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `funko_test`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: funko_test
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Funkos','Figuras coleccionables Funko Pop'),(2,'Remeras','Remeras de anime, series, peliculas y más'),(3,'LLaveros','Llaveros coleccionables');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licence`
--

DROP TABLE IF EXISTS `licence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licence` (
  `licence_id` int NOT NULL AUTO_INCREMENT,
  `licence_name` varchar(45) NOT NULL,
  `licence_description` varchar(255) NOT NULL,
  `licence_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`licence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence`
--

LOCK TABLES `licence` WRITE;
/*!40000 ALTER TABLE `licence` DISABLE KEYS */;
INSERT INTO `licence` VALUES (1,'Pokemon','Atrapa todos los que puedas y disfruta de una colección llena de amigos.','/img/pokemon/pk-cover.jpg'),(2,'Star Wars','Disfruta de una saga que sigue agregando personajes a su colección.','/img/star-wars/st-cover.jpg'),(3,'Harry Potter','Revive los recuerdos de una saga llena de magia y encanto.','/img/harry-potter/hp-cover.jpg');
/*!40000 ALTER TABLE `licence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(60) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `discount` int DEFAULT NULL,
  `sku` varchar(30) NOT NULL,
  `dues` int DEFAULT NULL,
  `image_front` varchar(200) NOT NULL,
  `image_back` varchar(200) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `licence_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  KEY `fk_product_licence1_idx` (`licence_id`),
  KEY `fk_product_category1_idx` (`category_id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `fk_product_licence1` FOREIGN KEY (`licence_id`) REFERENCES `licence` (`licence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Baby Yoda Blueball','Figura coleccionable de Baby Yoda (Grogu) - The Mandalorian Saga, edición limitada.',1799.99,8,10,'STW001001',3,'/star-wars/baby-yoda-1.webp','/star-wars/baby-yoda-box.webp','2023-06-27 23:33:21',2,1),(2,'Boba Fett Fighter','Figura coleccionable de Boba Fett Fighter - The Mandalorian Saga.',1799.99,8,10,'STW001002',3,'/star-wars/bobbafeth-1.webp','/star-wars/bobbafeth-box.webp','2023-06-27 23:33:21',2,1),(3,'Luke Skylwalker & Grogu','Figura coleccionable de Luke Skylwalker & Grogu - The Mandalorian Saga.',1799.99,8,10,'STW001003',3,'/star-wars/luke-1.webp','/star-wars/luke-box.webp','2023-06-27 23:33:21',2,1),(4,'Stormtrooper Lightsaber','Figura coleccionable de Stormtrooper Lightsaber - Star Wars Saga.',1799.99,8,10,'STW001004',3,'/star-wars/trooper-1.webp','/star-wars/trooper-box.webp','2023-06-27 23:33:21',2,1),(5,'Charmander Smiley','Figura coleccionable de Charmander - Pokemon Saga.',1799.99,8,10,'PKM001001',3,'/pokemon/charmander-1.webp','/pokemon/charmander-box.webp','2023-06-27 23:33:21',1,1),(6,'Dragonite Hi!','Figura coleccionable de Dragonite - Pokemon Saga.',1799.99,8,10,'PKM001002',3,'/pokemon/dragonite-1.webp','/pokemon/dragonite-box.webp','2023-06-27 23:33:21',1,1),(7,'Pidgeotto Flying','Figura coleccionable de Pidgeotto - Pokemon Saga.',1799.99,8,10,'PKM00103',3,'/pokemon/pidgeotto-1.webp','/pokemon/pidgeotto-box.webp','2023-06-27 23:33:21',1,1),(8,'Pikachu Smiley','Figura coleccionable de Pikachu - Pokemon Saga.',1799.99,8,10,'PKM001004',3,'/pokemon/pikachu-1.webp','/pokemon/pikachu-box.webp','2023-06-27 23:33:21',1,1),(9,'Vulpix Fancy','Figura coleccionable de Vulpix - Pokemon Saga.',1799.99,8,10,'PKM001005',3,'/pokemon/vulpix-1.webp','/pokemon/vulpix-box.webp','2023-06-27 23:33:21',1,1),(10,'Harry Potter & Hegwid','Figura coleccionable de Harry Potter & Hegwid - Harry Potter Saga.',1799.99,8,10,'HPT001001',3,'/harry-potter/harry-1.webp','/harry-potter/harry-box.webp','2023-06-27 23:33:21',3,1),(11,'Herminione Ball Dress','Figura coleccionable de Herminione - Harry Potter Saga.',1799.99,8,10,'HPT001002',3,'/harry-potter/hermione-1.webp','/harry-potter/hermione-box.webp','2023-06-27 23:33:21',3,1),(12,'Luna Lovegood Lion Mask','Figura coleccionable de Luna Lovegood - Harry Potter Saga.',1799.99,8,10,'HPT001003',3,'/harry-potter/luna-1.webp','/harry-potter/luna-box.webp','2023-06-27 23:33:21',3,1),(13,'Snape Patronus','Figura coleccionable de Snape Patronus - Harry Potter Saga.',1799.99,13,10,'HPT001004',3,'/harry-potter/snape-patronus-1.webp','/harry-potter/snape-patronus-box.webp','2023-06-27 23:33:21',3,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_role`
--

DROP TABLE IF EXISTS `user_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_role` (
  `user_user_id` int NOT NULL,
  `role_role_id` int NOT NULL,
  PRIMARY KEY (`user_user_id`,`role_role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_role_id`),
  KEY `fk_user_has_role_user_idx` (`user_user_id`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_has_role_user` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_role`
--

LOCK TABLES `user_has_role` WRITE;
/*!40000 ALTER TABLE `user_has_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-27 20:40:47
