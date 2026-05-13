/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.2.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Tripistry
-- ------------------------------------------------------
-- Server version	12.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `accommodation`
--

DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodation` (
  `accommodationId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('Hotel','Motel','BnB','Resort') DEFAULT NULL,
  `buildingNumber` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `suburb` varchar(100) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  PRIMARY KEY (`accommodationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
INSERT INTO `accommodation` VALUES
(1,'Sea View Hotel','Hotel',10,'Beach Road','Sea Point','8005'),
(2,'City Lodge','Hotel',22,'Main Street','Sandton','2196'),
(3,'Safari Lodge','Resort',5,'Wild Ave','Kruger','1350'),
(4,'Ocean BnB','BnB',18,'Coastal Rd','Durban','4001');
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agencyId` int(11) NOT NULL AUTO_INCREMENT,
  `agencyName` varchar(255) NOT NULL,
  `emailDomain` varchar(100) NOT NULL,
  `website` varchar(255) NOT NULL,
  PRIMARY KEY (`agencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES
(1,'SkyHigh Travel','skyhigh.co.za','https://skyhigh.co.za'),
(2,'Explore SA','exploresa.co.za','https://exploresa.co.za'),
(3,'Global Voyages','globalvoyages.com','https://globalvoyages.com'),
(4,'Wander World','wanderworld.co.za','https://wanderworld.co.za');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attraction`
--

DROP TABLE IF EXISTS `attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction` (
  `attractionId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `entranceFee` decimal(10,2) NOT NULL,
  `buildingNumber` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `suburb` varchar(100) NOT NULL,
  `postalCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`attractionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attraction` WRITE;
/*!40000 ALTER TABLE `attraction` DISABLE KEYS */;
INSERT INTO `attraction` VALUES
(1,'Table Mountain',350.00,1,'Tafelberg Rd','Cape Town','8001'),
(2,'Apartheid Museum',120.00,55,'Northern Pkwy','Johannesburg','2000'),
(3,'Kruger Safari',500.00,9,'Park Gate','Kruger','1350'),
(4,'uShaka Marine World',250.00,1,'Marine Parade','Durban','4001');
/*!40000 ALTER TABLE `attraction` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attraction_itinerary`
--

DROP TABLE IF EXISTS `attraction_itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attraction_itinerary` (
  `attractionId` int(11) NOT NULL,
  `dayNumber` int(11) NOT NULL,
  `packageId` int(11) NOT NULL,
  PRIMARY KEY (`attractionId`,`dayNumber`,`packageId`),
  KEY `fk_attractionIt_day` (`packageId`,`dayNumber`),
  CONSTRAINT `fk_attractionIt_day` FOREIGN KEY (`packageId`, `dayNumber`) REFERENCES `itineraryday` (`packageId`, `dayNumber`),
  CONSTRAINT `fk_attractionIt_id` FOREIGN KEY (`attractionId`) REFERENCES `attraction` (`attractionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction_itinerary`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attraction_itinerary` WRITE;
/*!40000 ALTER TABLE `attraction_itinerary` DISABLE KEYS */;
INSERT INTO `attraction_itinerary` VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4);
/*!40000 ALTER TABLE `attraction_itinerary` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cuisinetype`
--

DROP TABLE IF EXISTS `cuisinetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisinetype` (
  `cuisineType` varchar(255) NOT NULL,
  `restaurantId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cuisineType`),
  KEY `fk_restaurant_cuisine` (`restaurantId`),
  CONSTRAINT `fk_restaurant_cuisine` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisinetype`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cuisinetype` WRITE;
/*!40000 ALTER TABLE `cuisinetype` DISABLE KEYS */;
INSERT INTO `cuisinetype` VALUES
('Italian',1),
('Chinese',2),
('Local Cuisine',3),
('Fast Food',4);
/*!40000 ALTER TABLE `cuisinetype` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `destinationId` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  PRIMARY KEY (`destinationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES
(1,'Cape Town','Western Cape'),
(2,'Johannesburg','Gauteng'),
(3,'Kruger Park','Mpumalanga'),
(4,'Durban','KwaZulu-Natal');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flightId` int(11) NOT NULL AUTO_INCREMENT,
  `airline` varchar(255) NOT NULL,
  `arrivalAirport` varchar(255) NOT NULL,
  `departureDate` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`flightId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES
(1,'FlySafair','CPT','2026-06-01',1500.00),
(2,'Airlink','JNB','2026-06-02',1200.00),
(3,'SA Express','MQP','2026-06-03',1800.00),
(4,'Kulula','DUR','2026-06-04',1400.00);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `imagesURL` varchar(500) NOT NULL,
  `packageId` int(11) NOT NULL,
  PRIMARY KEY (`imagesURL`,`packageId`),
  KEY `fk_package_image` (`packageId`),
  CONSTRAINT `fk_package_image` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES
('https://source.unsplash.com/800x600/?cape-town,table-mountain',1),
('https://source.unsplash.com/800x600/?johannesburg,city,night',2),
('https://source.unsplash.com/800x600/?safari,africa,wildlife',3),
('https://source.unsplash.com/800x600/?durban,beach,ocean',4);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `itineraryday`
--

DROP TABLE IF EXISTS `itineraryday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `itineraryday` (
  `packageId` int(11) NOT NULL,
  `dayNumber` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `destinationId` int(11) DEFAULT NULL,
  `flightId` int(11) DEFAULT NULL,
  `accommodationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`packageId`,`dayNumber`),
  KEY `fk_itinerary_destination` (`destinationId`),
  KEY `fk_itinerary_flight` (`flightId`),
  KEY `fk_itinerary_accommodation` (`accommodationId`),
  CONSTRAINT `fk_itinerary_accommodation` FOREIGN KEY (`accommodationId`) REFERENCES `accommodation` (`accommodationId`) ON DELETE CASCADE,
  CONSTRAINT `fk_itinerary_destination` FOREIGN KEY (`destinationId`) REFERENCES `destination` (`destinationId`) ON DELETE CASCADE,
  CONSTRAINT `fk_itinerary_flight` FOREIGN KEY (`flightId`) REFERENCES `flight` (`flightId`) ON DELETE CASCADE,
  CONSTRAINT `fk_itinerary_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraryday`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `itineraryday` WRITE;
/*!40000 ALTER TABLE `itineraryday` DISABLE KEYS */;
INSERT INTO `itineraryday` VALUES
(1,1,'Arrival and city tour',1,1,1),
(2,1,'Night city experience',2,2,2),
(3,1,'Safari arrival',3,3,3),
(4,1,'Beach relaxation',4,4,4);
/*!40000 ALTER TABLE `itineraryday` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `basePrice` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `agencyId` int(11) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_package_agency` (`agencyId`),
  CONSTRAINT `fk_package_agency` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES
(1,'Cape Escape','3-day Cape Town tour',4999.99,3,1),
(2,'Joburg Nights','City nightlife experience',2999.99,2,2),
(3,'Safari Adventure','Wildlife experience trip',8999.99,5,3),
(4,'Coastal Relax','Beach holiday package',6500.00,4,4);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cuisineTypeId` int(11) DEFAULT NULL,
  `buildingNumber` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `suburb` varchar(100) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  PRIMARY KEY (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES
(1,'Bella Italia',NULL,12,'Main Road','Sandton','2196'),
(2,'Golden Dragon',NULL,44,'Market Street','Johannesburg','2001'),
(3,'Braai House',NULL,8,'Heritage Rd','Pretoria','0001'),
(4,'Burger Hub',NULL,55,'Central Ave','Cape Town','8001');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `restaurant_itinerary`
--

DROP TABLE IF EXISTS `restaurant_itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_itinerary` (
  `restaurantId` int(11) NOT NULL,
  `dayNumber` int(11) NOT NULL,
  `packageId` int(11) NOT NULL,
  PRIMARY KEY (`restaurantId`,`dayNumber`,`packageId`),
  KEY `fk_restaurantIt_day` (`packageId`,`dayNumber`),
  CONSTRAINT `fk_restaurantIt_Id` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`) ON DELETE CASCADE,
  CONSTRAINT `fk_restaurantIt_day` FOREIGN KEY (`packageId`, `dayNumber`) REFERENCES `itineraryday` (`packageId`, `dayNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_itinerary`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `restaurant_itinerary` WRITE;
/*!40000 ALTER TABLE `restaurant_itinerary` DISABLE KEYS */;
INSERT INTO `restaurant_itinerary` VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4);
/*!40000 ALTER TABLE `restaurant_itinerary` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `timest` timestamp NULL DEFAULT NULL,
  `packageId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `fk_review_package` (`packageId`),
  KEY `fk_user_review` (`userId`),
  CONSTRAINT `fk_review_package` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_review` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES
(1,5,'Excellent experience','2026-05-12 23:31:29',1,1),
(2,4,'Very enjoyable trip','2026-05-12 23:31:29',2,2),
(3,5,'Amazing safari adventure','2026-05-12 23:31:29',3,3),
(4,4,'Relaxing and well organised','2026-05-12 23:31:29',4,4);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `dateJoined` date NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `agencyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `fk_user_agency` (`agencyId`),
  CONSTRAINT `fk_user_agency` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Alex','Smith','0712345678','alex@mail.com','pass1','2026-01-10','South Africa',1),
(2,'Jordan','Lee','0723456789','jordan@mail.com','pass2','2026-02-11','South Africa',2),
(3,'Taylor','Brown','0734567890','taylor@mail.com','pass3','2026-03-05','South Africa',3),
(4,'Casey','Davis','0745678901','casey@mail.com','pass4','2026-04-01','South Africa',4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-05-13  9:56:54
