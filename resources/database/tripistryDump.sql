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
  `name` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `buildingNumber` varchar(20) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `suburb` varchar(100) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `agencyId` int DEFAULT NULL,
  PRIMARY KEY (`accommodationId`),
  KEY `agencyId` (`agencyId`),
  CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
INSERT INTO `accommodation` VALUES (1,'The Capital Menlyn Maine','Hotel','194','Bancor Ave','Menlyn','0181',1),(2,'Mount Nelson Hotel','Hotel','76','Orange St','Gardens','8001',2),(3,'The Saxon Hotel','Boutique','36','Saxon Rd','Sandhurst','2196',3),(4,'The Oyster Box','Resort','2','Lighthouse Rd','Umhlanga','4319',1),(5,'Boardwalk Hotel','Hotel','1','Marine Dr','Summerstrand','6001',NULL),(6,'Protea Hotel Willow Lake','Hotel','101','Henry St','Willows','9301',3),(7,'Protea Hotel Nelspruit','Hotel','30','Jerepico St','Orchards','1201',NULL),(8,'Town Lodge Polokwane','Hotel','45','Bendor Dr','Bendor','0699',2),(9,'Protea Hotel Kimberley','Hotel','120','Du Toitspan Rd','CBD','8301',3),(10,'Lanzerac Hotel','Estate','1','Lanzerac Rd','Jonkershoek','7600',1),(11,'The Turbine Hotel','Boutique','36','Sawmill Ln','Thesen Island','6571',2),(12,'Marine Hotel','Hotel','14','Marine Dr','CBD','7200',NULL),(13,'Redlands Hotel','Hotel','1','George Macfarlane','Wembley','3201',1),(14,'Mmabatho Palms','Resort','1','Nelson Mandela Dr','Mmabatho','2735',2),(15,'Desert Palace','Resort','1','Olyvenhoutsdrift','Keimoes Rd','8800',3),(16,'Queens Hotel','Hotel','1','Baron Van Reede St','CBD','6620',1),(17,'Protea Hotel Clarens','Hotel','1','Main St','CBD','9707',NULL),(18,'The Cock House','Guesthouse','10','Market St','CBD','6139',NULL),(19,'Kapama River Lodge','Lodge','1','R40','Kapama Reserve','1380',NULL),(20,'Sun City Resort','Resort','1','R556','Sun City','0316',NULL);
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accommodationimage`
--

DROP TABLE IF EXISTS `accommodationimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodationimage` (
  `imageId` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `accommodationId` int NOT NULL,
  PRIMARY KEY (`imageId`),
  KEY `fk_accommodation_image` (`accommodationId`),
  CONSTRAINT `fk_accommodation_image` FOREIGN KEY (`accommodationId`) REFERENCES `accommodation` (`accommodationId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodationimage`
--

LOCK TABLES `accommodationimage` WRITE;
/*!40000 ALTER TABLE `accommodationimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `accommodationimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `agencyId` int NOT NULL AUTO_INCREMENT,
  `agencyName` varchar(255) NOT NULL,
  `emailDomain` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`agencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (1,'Wanderlust Travels','@wanderlust.com','www.wanderlust.com'),(2,'Global Explorers','@globalx.com','www.globalx.com'),(3,'Sunny Destinations','@sunnydest.com','www.sunnydest.com');
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
  `name` varchar(255) NOT NULL,
  `entranceFee` decimal(10,2) DEFAULT NULL,
  `buildingNumber` varchar(20) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `suburb` varchar(100) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `agencyId` int DEFAULT NULL,
  PRIMARY KEY (`attractionId`),
  KEY `agencyId` (`agencyId`),
  CONSTRAINT `attraction_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attraction`
--

LOCK TABLES `attraction` WRITE;
/*!40000 ALTER TABLE `attraction` DISABLE KEYS */;
INSERT INTO `attraction` VALUES (1,'Voortrekker Monument',120.00,'1','Eeufees Rd','Groenkloof','0181',1),(2,'Table Mountain Aerial Cableway',420.00,'1','Tafelberg Rd','Gardens','8001',2),(3,'Apartheid Museum',150.00,'1','Northern Parkway','Ormonde','2091',NULL),(4,'uShaka Marine World',220.00,'1','King Shaka Ave','Point','4001',1),(5,'Addo Elephant National Park',380.00,'1','R335','Addo','6105',NULL),(6,'Naval Hill (Mandela Statue)',0.00,'1','Union Ave','Naval Hill','9301',3),(7,'Kruger National Park (Malelane Gate)',480.00,'1','R570','Malelane','1320',1),(8,'Mapungubwe National Park',250.00,'1','R572','Musina','0900',NULL),(9,'The Big Hole',110.00,'1','Tucker St','CBD','8301',3),(10,'Franschhoek Motor Museum',150.00,'1','R45','Franschhoek','7690',1),(11,'Knysna Heads',0.00,'1','George Rex Dr','The Heads','6571',2),(12,'Hermanus Whale Watching',600.00,'1','Marine Dr','CBD','7200',NULL),(13,'Nelson Mandela Capture Site',100.00,'1','R103','Howick','3290',1),(14,'Mafikeng Game Reserve',80.00,'1','R49','Mmabatho','2735',NULL),(15,'Augrabies Falls',280.00,'1','R359','Augrabies','8874',3),(16,'Cango Caves',170.00,'1','Cango Valley Rd','Oudtshoorn','6620',1),(17,'Golden Gate Highlands National Park',250.00,'1','R712','Clarens','9707',NULL),(18,'1820 Settlers Monument',50.00,'1','Fort Selwyn Dr','Makhanda','6139',3),(19,'Blyde River Canyon (Gods Window)',100.00,'1','R532','Graskop','1270',NULL),(20,'Valley of Waves',350.00,'1','R556','Sun City','0316',2);
/*!40000 ALTER TABLE `attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attractionimage`
--

DROP TABLE IF EXISTS `attractionimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attractionimage` (
  `imageId` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `attractionId` int NOT NULL,
  PRIMARY KEY (`imageId`),
  KEY `fk_attraction_image_idx` (`attractionId`),
  CONSTRAINT `fk_attraction_image` FOREIGN KEY (`attractionId`) REFERENCES `attraction` (`attractionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attractionimage`
--

LOCK TABLES `attractionimage` WRITE;
/*!40000 ALTER TABLE `attractionimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `attractionimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `destinationId` int NOT NULL AUTO_INCREMENT,
  `cityName` varchar(100) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `agencyId` int DEFAULT NULL,
  PRIMARY KEY (`destinationId`),
  KEY `agencyId` (`agencyId`),
  CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (41,'Pretoria','Gauteng',1),(42,'Cape Town','Western Cape',2),(43,'Johannesburg','Gauteng',3),(44,'Durban','KwaZulu-Natal',1),(45,'Gqeberha','Eastern Cape',2),(46,'Bloemfontein','Free State',3),(47,'Nelspruit (Mbombela)','Mpumalanga',1),(48,'Polokwane','Limpopo',2),(49,'Kimberley','Northern Cape',3),(50,'Stellenbosch','Western Cape',1),(51,'Knysna','Western Cape',2),(52,'Hermanus','Western Cape',3),(53,'Pietermaritzburg','KwaZulu-Natal',1),(54,'Mahikeng','North West',2),(55,'Upington','Northern Cape',3),(56,'Oudtshoorn','Western Cape',1),(57,'Clarens','Free State',2),(58,'Makhanda','Eastern Cape',3),(59,'Hoedspruit','Limpopo',1),(60,'Rustenburg','North West',2);
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinationimage`
--

DROP TABLE IF EXISTS `destinationimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinationimage` (
  `imageId` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `destinationId` int NOT NULL,
  PRIMARY KEY (`imageId`),
  KEY `fk_destination_image_idx` (`destinationId`),
  CONSTRAINT `fk_destination_image` FOREIGN KEY (`destinationId`) REFERENCES `destination` (`destinationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinationimage`
--

LOCK TABLES `destinationimage` WRITE;
/*!40000 ALTER TABLE `destinationimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinationimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flightId` int NOT NULL AUTO_INCREMENT,
  `airline` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `departureAirport` varchar(100) DEFAULT NULL,
  `arrivalAirport` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`flightId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'FlySafair',950.00,'JNB','CPT'),(2,'Airlink',1500.00,'JNB','MQP'),(3,'LIFT',1100.00,'JNB','CPT'),(4,'CemAir',1800.00,'JNB','BFN'),(5,'South African Airways',1600.00,'CPT','DUR'),(6,'FlySafair',850.00,'HLA','CPT'),(7,'Airlink',2100.00,'JNB','PTG'),(8,'FlySafair',900.00,'JNB','PLZ'),(9,'CemAir',2400.00,'CPT','KIM'),(10,'LIFT',1300.00,'JNB','DUR'),(11,'Airlink',2800.00,'CPT','GRJ'),(12,'South African Airways',1450.00,'JNB','PLZ'),(13,'FlySafair',1150.00,'CPT','HLA'),(14,'Airlink',3100.00,'JNB','UTN'),(15,'CemAir',2200.00,'JNB','MQP'),(16,'FlySafair',1050.00,'DUR','PLZ'),(17,'Airlink',2500.00,'JNB','PHW'),(18,'LIFT',1250.00,'CPT','DUR'),(19,'South African Airways',1850.00,'JNB','CPT'),(20,'Airlink',3400.00,'CPT','MQP');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itineraryattraction`
--

DROP TABLE IF EXISTS `itineraryattraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itineraryattraction` (
  `packageId` int NOT NULL,
  `dayNumber` int NOT NULL,
  `attractionId` int NOT NULL,
  PRIMARY KEY (`packageId`,`dayNumber`,`attractionId`),
  KEY `attractionId` (`attractionId`),
  CONSTRAINT `itineraryattraction_ibfk_1` FOREIGN KEY (`packageId`, `dayNumber`) REFERENCES `itineraryday` (`packageId`, `dayNumber`) ON DELETE CASCADE,
  CONSTRAINT `itineraryattraction_ibfk_2` FOREIGN KEY (`attractionId`) REFERENCES `attraction` (`attractionId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraryattraction`
--

LOCK TABLES `itineraryattraction` WRITE;
/*!40000 ALTER TABLE `itineraryattraction` DISABLE KEYS */;
INSERT INTO `itineraryattraction` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20);
/*!40000 ALTER TABLE `itineraryattraction` ENABLE KEYS */;
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
  `description` text,
  `destinationId` int NOT NULL,
  `accommodationId` int DEFAULT NULL,
  `flightId` int DEFAULT NULL,
  PRIMARY KEY (`packageId`,`dayNumber`),
  KEY `destinationId` (`destinationId`),
  KEY `accommodationId` (`accommodationId`),
  KEY `flightId` (`flightId`),
  CONSTRAINT `itineraryday_ibfk_1` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE,
  CONSTRAINT `itineraryday_ibfk_2` FOREIGN KEY (`destinationId`) REFERENCES `destination` (`destinationId`),
  CONSTRAINT `itineraryday_ibfk_3` FOREIGN KEY (`accommodationId`) REFERENCES `accommodation` (`accommodationId`) ON DELETE SET NULL,
  CONSTRAINT `itineraryday_ibfk_4` FOREIGN KEY (`flightId`) REFERENCES `flight` (`flightId`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraryday`
--

LOCK TABLES `itineraryday` WRITE;
/*!40000 ALTER TABLE `itineraryday` DISABLE KEYS */;
INSERT INTO `itineraryday` VALUES (1,1,'Arrival and check-in. Explore the Jacaranda lined streets of Pretoria.',41,1,NULL),(2,1,'Touch down in the Mother City and settle into your luxury hotel.',42,2,1),(3,1,'Arrival in Jozi. Afternoon at leisure to explore Rosebank.',43,3,NULL),(4,1,'Flight to Durban. Check in and hit the warm waters of the Golden Mile.',44,4,5),(5,1,'Arrival in the Friendly City. Evening walk along the beachfront.',45,5,8),(6,1,'Check into Bloemfontein and visit Naval Hill.',46,6,4),(7,1,'Arrive in the Lowveld. Prepare for your upcoming panorama route drive.',47,7,2),(8,1,'Head north to Polokwane for a bushveld experience.',48,8,7),(9,1,'Arrive in the Diamond City and settle in.',49,9,9),(10,1,'Settle in among the beautiful Cape Winelands.',50,10,3),(11,1,'Start the Garden Route drive. Arrive at the Knysna lagoon.',51,11,11),(12,1,'Coastal drive to the Whale Coast. Check in at Hermanus.',52,12,NULL),(13,1,'Begin the Midlands Meander with a quiet afternoon at the hotel.',53,13,17),(14,1,'Arrival in the North West province for a savannah sunset.',54,14,NULL),(15,1,'Venture into the Kalahari. First night under the desert stars.',55,15,14),(16,1,'Settle into the Klein Karoo. Enjoy a traditional farm-style dinner.',56,16,NULL),(17,1,'Arrive at the foothills of the Maluti Mountains in Clarens.',57,17,NULL),(18,1,'Check in to Frontier Country in historic Makhanda.',58,18,16),(19,1,'Luxury lodge check-in. Prepare for your first evening game drive.',59,19,20),(20,1,'Arrive at Sun City Resort. Afternoon at the Valley of Waves.',60,20,NULL);
/*!40000 ALTER TABLE `itineraryday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itineraryrestaurant`
--

DROP TABLE IF EXISTS `itineraryrestaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itineraryrestaurant` (
  `packageId` int NOT NULL,
  `dayNumber` int NOT NULL,
  `restaurantId` int NOT NULL,
  PRIMARY KEY (`packageId`,`dayNumber`,`restaurantId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `itineraryrestaurant_ibfk_1` FOREIGN KEY (`packageId`, `dayNumber`) REFERENCES `itineraryday` (`packageId`, `dayNumber`) ON DELETE CASCADE,
  CONSTRAINT `itineraryrestaurant_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itineraryrestaurant`
--

LOCK TABLES `itineraryrestaurant` WRITE;
/*!40000 ALTER TABLE `itineraryrestaurant` DISABLE KEYS */;
INSERT INTO `itineraryrestaurant` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20);
/*!40000 ALTER TABLE `itineraryrestaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `duration` int DEFAULT NULL,
  `basePrice` decimal(10,2) NOT NULL,
  `agencyId` int NOT NULL,
  `maxCapacity` int DEFAULT NULL,
  PRIMARY KEY (`packageId`),
  KEY `agencyId` (`agencyId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'Pretoria Jacaranda Experience','Explore the administrative capital.',3,4500.00,1,10),(2,'Cape Peninsula Tour','Table mountain, penguins, and wine.',5,8500.00,2,NULL),(3,'Egoli Heritage Route','History and hustle in Jozi.',3,5000.00,3,15),(4,'Durban Golden Mile','Beaches, curries, and warm water.',4,6000.00,1,NULL),(5,'Sunshine Coast Getaway','Relax in the friendly city.',4,5500.00,2,8),(6,'Free State Historical Trail','Monuments and vast landscapes.',3,4000.00,3,NULL),(7,'Lowveld Panorama Route','Canyons, waterfalls, and viewpoints.',5,7500.00,1,10),(8,'Limpopo Wildlife Safari','Baobabs and Big 5.',6,12000.00,2,NULL),(9,'Diamond City Discovery','Explore the Big Hole and history.',2,3500.00,3,15),(10,'Cape Winelands Escape','Premium wine tasting and dining.',4,9000.00,1,NULL),(11,'Garden Route Adventure','Forests, lagoons, and coastlines.',7,14000.00,2,12),(12,'Whale Coast Retreat','Watch giants of the ocean in Hermanus.',3,6500.00,3,NULL),(13,'Midlands Meander','Arts, crafts, and green rolling hills.',4,5500.00,1,15),(14,'North West Savannah Tour','Big game and beautiful skies.',4,7000.00,2,NULL),(15,'Kalahari Desert Trek','Red dunes and starry nights.',6,11000.00,3,8),(16,'Klein Karoo Ostrich Trail','Caves and farm life.',3,4800.00,1,NULL),(17,'Maluti Mountain Hike','Explore the Golden Gate highlands.',4,5200.00,2,10),(18,'Frontier Country Tour','History and arts in Makhanda.',3,4200.00,3,NULL),(19,'Kruger Luxury Safari','Exclusive game drives in the bushveld.',5,25000.00,1,4),(20,'Sun City Weekend','Casinos, golf, and the Valley of Waves.',3,8500.00,2,NULL);
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
  `name` varchar(255) NOT NULL,
  `buildingNumber` varchar(20) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `suburb` varchar(100) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `agencyId` int DEFAULT NULL,
  PRIMARY KEY (`restaurantId`),
  KEY `agencyId` (`agencyId`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Hazelwood Pizzeria','15','16th St','Hazelwood','0081',1),(2,'Wolfgat','10','Sampson St','Paternoster','7381',2),(3,'Marble','1','Keyes Ave','Rosebank','2196',NULL),(4,'Moyo uShaka','1','Bell St','Point','4001',1),(5,'Something Good Roadhouse','1','Marine Dr','Summerstrand','6001',NULL),(6,'Avanti Restaurant','30','Kellner St','Westdene','9301',3),(7,'Orange Restaurant','1','Du Preez St','Steiltes','1201',1),(8,'Nguni Grill','10','Kerk St','CBD','0699',NULL),(9,'The Occidental Bar','1','Tucker St','Big Hole','8301',3),(10,'Rust en Vrede','1','Annandale Rd','Stellenbosch','7600',1),(11,'Ile de Pain','10','Thesen Island','Knysna','6571',2),(12,'Bientang’s Cave','1','Marine Dr','CBD','7200',NULL),(13,'Tumbleweed','4','Chief Albert Luthuli','CBD','3201',1),(14,'The Kraal','1','Nelson Mandela Dr','Mmabatho','2735',NULL),(15,'Bi Lo Bistro','20','Schroder St','CBD','8800',3),(16,'Nostalgie','14','Baron Van Reede St','CBD','6620',1),(17,'Clementines','1','Main St','CBD','9707',NULL),(18,'Rat & Parrot','59','New St','CBD','6139',3),(19,'Hat & Creek','1','Main Rd','CBD','1380',NULL),(20,'The Raj','1','Sun City Resort','Sun City','0316',2);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantcuisine`
--

DROP TABLE IF EXISTS `restaurantcuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantcuisine` (
  `restaurantId` int NOT NULL,
  `cuisineType` varchar(100) NOT NULL,
  PRIMARY KEY (`restaurantId`,`cuisineType`),
  CONSTRAINT `restaurantcuisine_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantcuisine`
--

LOCK TABLES `restaurantcuisine` WRITE;
/*!40000 ALTER TABLE `restaurantcuisine` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurantcuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantimage`
--

DROP TABLE IF EXISTS `restaurantimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantimage` (
  `imageId` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `restaurantId` int NOT NULL,
  PRIMARY KEY (`imageId`),
  KEY `fk_restaurant_image_idx` (`restaurantId`),
  CONSTRAINT `fk_restaurant_image` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantimage`
--

LOCK TABLES `restaurantimage` WRITE;
/*!40000 ALTER TABLE `restaurantimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurantimage` ENABLE KEYS */;
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
  `comment` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int NOT NULL,
  `packageId` int NOT NULL,
  PRIMARY KEY (`reviewId`),
  KEY `userId` (`userId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE CASCADE,
  CONSTRAINT `review_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `dateJoined` datetime DEFAULT CURRENT_TIMESTAMP,
  `apiKey` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `agencyId` int DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email` (`email`),
  KEY `agencyId` (`agencyId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`agencyId`) REFERENCES `agency` (`agencyId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2026-05-20  9:58:45
