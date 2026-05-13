-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tripistry
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `accommodation`
--

DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation` (
  `accommodationId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('Hotel','Motel','BnB','Resort') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `buildingNumber` int NOT NULL,
  `street` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `suburb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `postalCode` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`accommodationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
INSERT INTO `accommodation` VALUES (1,'Sea View Hotel','Hotel',10,'Beach Road','Sea Point','8005'),(2,'City Lodge','Hotel',22,'Main Street','Sandton','2196'),(3,'Safari Lodge','Resort',5,'Wild Ave','Kruger','1350'),(4,'Ocean BnB','BnB',18,'Coastal Rd','Durban','4001');
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agencyId` int NOT NULL AUTO_INCREMENT,
  `agencyName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `emailDomain` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`agencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'SkyHigh Travel','skyhigh.co.za','https://skyhigh.co.za'),(2,'Explore SA','exploresa.co.za','https://exploresa.co.za'),(3,'Global Voyages','globalvoyages.com','https://globalvoyages.com'),(4,'Wander World','wanderworld.co.za','https://wanderworld.co.za');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attraction`
--

DROP TABLE IF EXISTS `attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction` (
  `attractionId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `entranceFee` decimal(10,2) NOT NULL,
  `buildingNumber` int NOT NULL,
  `street` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `suburb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `postalCode` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`attractionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction`
--

LOCK TABLES `attraction` WRITE;
/*!40000 ALTER TABLE `attraction` DISABLE KEYS */;
INSERT INTO `attraction` VALUES (1,'Table Mountain',350.00,1,'Tafelberg Rd','Cape Town','8001'),(2,'Apartheid Museum',120.00,55,'Northern Pkwy','Johannesburg','2000'),(3,'Kruger Safari',500.00,9,'Park Gate','Kruger','1350'),(4,'uShaka Marine World',250.00,1,'Marine Parade','Durban','4001');
/*!40000 ALTER TABLE `attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attraction_itinerary`
--

DROP TABLE IF EXISTS `attraction_itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction_itinerary` (
  `attractionId` int NOT NULL,
  `dayNumber` int NOT NULL,
  `packageId` int NOT NULL,
  PRIMARY KEY (`attractionId`,`dayNumber`,`packageId`),
  KEY `fk_attractionIt_day` (`packageId`,`dayNumber`),
  CONSTRAINT `fk_attractionIt_day` FOREIGN KEY (`packageId`, `dayNumber`) REFERENCES `itineraryday` (`packageId`, `dayNumber`),
  CONSTRAINT `fk_attractionIt_id` FOREIGN KEY (`attractionId`) REFERENCES `attraction` (`attractionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction_itinerary`
--

LOCK TABLES `attraction_itinerary` WRITE;
/*!40000 ALTER TABLE `attraction_itinerary` DISABLE KEYS */;
INSERT INTO `attraction_itinerary` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
/*!40000 ALTER TABLE `attraction_itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisinetype`
--

DROP TABLE IF EXISTS `cuisinetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisinetype` (
  `cuisineTypeId` int NOT NULL AUTO_INCREMENT,
  `cuisineName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cuisineTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisinetype`
--

LOCK TABLES `cuisinetype` WRITE;
/*!40000 ALTER TABLE `cuisinetype` DISABLE KEYS */;
INSERT INTO `cuisinetype` VALUES (1,'Italian'),(2,'Chinese'),(3,'Local Cuisine'),(4,'Fast Food');
/*!40000 ALTER TABLE `cuisinetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `destinationId` int NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`destinationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'Cape Town','Western Cape'),(2,'Johannesburg','Gauteng'),(3,'Kruger Park','Mpumalanga'),(4,'Durban','KwaZulu-Natal');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flightId` int NOT NULL AUTO_INCREMENT,
  `airline` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `arrivalAirport` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `departureAirport` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`flightId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'FlySafair','CPT','JNB',1500.00),(2,'Airlink','JNB','CPT',1200.00),(3,'SA Express','MQP','JNB',1800.00),(4,'Kulula','DUR','CPT',1400.00);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `imagesURL` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `packageId` int NOT NULL,
  PRIMARY KEY (`imagesURL`,`packageId`),
  KEY `fk_package_image` (`packageId`),
  CONSTRAINT `fk_package_image` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('https://source.unsplash.com/800x600/?cape-town,table-mountain',1),('https://source.unsplash.com/800x600/?johannesburg,city,night',2),('https://source.unsplash.com/800x600/?safari,africa,wildlife',3),('https://source.unsplash.com/800x600/?durban,beach,ocean',4);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itineraryday`
--

DROP TABLE IF EXISTS `itineraryday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itineraryday` (
  `packageId` int NOT NULL,
  `dayNumber` int NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `destinationId` int DEFAULT NULL,
  `flightId` int DEFAULT NULL,
  `accommodationId` int DEFAULT NULL,
  PRIMARY KEY (`packageId`,`dayNumber`),
  KEY `fk_itinerary_destination` (`destinationId`),
  KEY `fk_itinerary_flight` (`flightId`),
  KEY `fk_itinerary_accommodation` (`accommodationId`),
  CONSTRAINT `fk_itinerary_accommodation` FOREIGN KEY (`accommodationId`) REFERENCES `accommodation` (`accommodationId`) ON DELETE CASCADE,
  CONSTRAINT `fk_itinerary_destination` FOREIGN KEY (`destinationId`) REFERENCES `destination` (`destinationId`) ON DELETE CASCADE,
  CONSTRAINT `fk_itinerary_flight` FOREIGN KEY (`flightId`) REFERENCES `flight` (`flightId`) ON DELETE CASCADE,
  CONSTRAINT `fk_itinerary_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraryday`
--

LOCK TABLES `itineraryday` WRITE;
/*!40000 ALTER TABLE `itineraryday` DISABLE KEYS */;
INSERT INTO `itineraryday` VALUES (1,1,'Arrival and city tour',1,1,1),(2,1,'Night city experience',2,2,2),(3,1,'Safari arrival',3,3,3),(4,1,'Beach relaxation',4,4,4);
/*!40000 ALTER TABLE `itineraryday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `basePrice` decimal(10,2) NOT NULL,
  `duration` int NOT NULL,
  `images` text COLLATE utf8mb4_general_ci,
  `agencyId` int NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_package_agency` (`agencyId`),
  CONSTRAINT `fk_package_agency` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'Cape Escape','3-day Cape Town tour',4999.99,3,NULL,1),(2,'Joburg Nights','City nightlife experience',2999.99,2,NULL,2),(3,'Safari Adventure','Wildlife experience trip',8999.99,5,NULL,3),(4,'Coastal Relax','Beach holiday package',6500.00,4,NULL,4);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cuisineTypeId` int DEFAULT NULL,
  `buildingNumber` int NOT NULL,
  `street` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `suburb` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `postalCode` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`restaurantId`),
  KEY `fk_restaurant_cuisine` (`cuisineTypeId`),
  CONSTRAINT `fk_restaurant_cuisine` FOREIGN KEY (`cuisineTypeId`) REFERENCES `cuisinetype` (`cuisineTypeId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Bella Italia',1,12,'Main Road','Sandton','2196'),(2,'Golden Dragon',2,44,'Market Street','Johannesburg','2001'),(3,'Braai House',3,8,'Heritage Rd','Pretoria','0001'),(4,'Burger Hub',4,55,'Central Ave','Cape Town','8001');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_itinerary`
--

DROP TABLE IF EXISTS `restaurant_itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_itinerary` (
  `restaurantId` int NOT NULL,
  `dayNumber` int NOT NULL,
  `packageId` int NOT NULL,
  PRIMARY KEY (`restaurantId`,`dayNumber`,`packageId`),
  KEY `fk_restaurantIt_day` (`packageId`,`dayNumber`),
  CONSTRAINT `fk_restaurantIt_day` FOREIGN KEY (`packageId`, `dayNumber`) REFERENCES `itineraryday` (`packageId`, `dayNumber`),
  CONSTRAINT `fk_restaurantIt_Id` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_itinerary`
--

LOCK TABLES `restaurant_itinerary` WRITE;
/*!40000 ALTER TABLE `restaurant_itinerary` DISABLE KEYS */;
INSERT INTO `restaurant_itinerary` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4);
/*!40000 ALTER TABLE `restaurant_itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewId` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_general_ci,
  `timest` timestamp NULL DEFAULT NULL,
  `packageId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `fk_review_package` (`packageId`),
  KEY `fk_user_review` (`userId`),
  CONSTRAINT `fk_review_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_review` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,5,'Excellent experience','2026-05-12 23:31:29',1,1),(2,4,'Very enjoyable trip','2026-05-12 23:31:29',2,2),(3,5,'Amazing safari adventure','2026-05-12 23:31:29',3,3),(4,4,'Relaxing and well organised','2026-05-12 23:31:29',4,4);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` char(10) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dateJoined` date NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `agencyId` int DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_user_agency` (`agencyId`),
  CONSTRAINT `fk_user_agency` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alex','Smith','0712345678','alex@mail.com','pass1','2026-01-10','South Africa',NULL),(2,'Jordan','Lee','0723456789','jordan@mail.com','pass2','2026-02-11',NULL,1),(3,'Taylor','Brown','0734567890','taylor@mail.com','pass3','2026-03-05','South Africa',3),(4,'Casey','Davis','0745678901','casey@mail.com','pass4','2026-04-01','South Africa',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-13  8:06:27
