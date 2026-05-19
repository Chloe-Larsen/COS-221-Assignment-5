DROP DATABASE IF EXISTS tripistry;
CREATE DATABASE tripistry;
USE tripistry;

CREATE TABLE Agency (
    agencyId INT AUTO_INCREMENT PRIMARY KEY,
    agencyName VARCHAR(255) NOT NULL,
    emailDomain VARCHAR(100),
    website VARCHAR(255)
);

CREATE TABLE User (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL,
    dateJoined DATETIME DEFAULT CURRENT_TIMESTAMP,
    apiKey VARCHAR(255) NOT NULL,
    country VARCHAR(255), 
    agencyId INT,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId) ON DELETE CASCADE

);

CREATE TABLE Accommodation (
    accommodationId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(100),
    buildingNumber VARCHAR(20),
    street VARCHAR(255),
    suburb VARCHAR(100),
    postalCode VARCHAR(20),
    agencyId INT,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId) ON DELETE CASCADE
);

CREATE TABLE Restaurant (
    restaurantId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    buildingNumber VARCHAR(20),
    street VARCHAR(255),
    suburb VARCHAR(100),
    postalCode VARCHAR(20),
    agencyId INT,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId) ON DELETE CASCADE
);

CREATE TABLE Flight (
    flightId INT AUTO_INCREMENT PRIMARY KEY,
    airline VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    departureAirport VARCHAR(100),
    arrivalAirport VARCHAR(100)
);

CREATE TABLE Attraction (
    attractionId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    entranceFee DECIMAL(10, 2),
    buildingNumber VARCHAR(20),
    street VARCHAR(255),
    suburb VARCHAR(100),
    postalCode VARCHAR(20),
    agencyId INT,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId) ON DELETE CASCADE
);

CREATE TABLE Package (
    packageId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    duration INT,
    basePrice DECIMAL(10, 2) NOT NULL,
    agencyId INT NOT NULL,
    maxCapacity INT,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId) ON DELETE CASCADE
);

CREATE TABLE Destination (
    destinationId INT AUTO_INCREMENT PRIMARY KEY,
    cityName VARCHAR(100) NOT NULL,
    province VARCHAR(100),
    agencyId INT,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId) ON DELETE CASCADE
);

CREATE TABLE Review (
    reviewId INT AUTO_INCREMENT PRIMARY KEY,
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment VARCHAR(255) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    userId INT NOT NULL,
    packageId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES User(userId) ON DELETE CASCADE,
    FOREIGN KEY (packageId) REFERENCES Package(packageId) ON DELETE CASCADE
);

CREATE TABLE RestaurantCuisine (
    restaurantId INT,
    cuisineType VARCHAR(100),
    PRIMARY KEY (restaurantId, cuisineType),
    FOREIGN KEY (restaurantId) REFERENCES Restaurant(restaurantId) ON DELETE CASCADE
);

CREATE TABLE ItineraryDay (
    packageId INT NOT NULL,
    dayNumber INT NOT NULL,
    description TEXT,
    destinationId INT NOT NULL,
    accommodationId INT,
    flightId INT,
    PRIMARY KEY (packageId, dayNumber),
    FOREIGN KEY (packageId) REFERENCES Package(packageId) ON DELETE CASCADE,
    FOREIGN KEY (destinationId) REFERENCES Destination(destinationId),
    FOREIGN KEY (accommodationId) REFERENCES Accommodation(accommodationId) ON DELETE SET NULL,
    FOREIGN KEY (flightId) REFERENCES Flight(flightId) ON DELETE SET NULL
);

CREATE TABLE ItineraryAttraction (
    packageId INT,
    dayNumber INT,
    attractionId INT,
    PRIMARY KEY (packageId, dayNumber, attractionId),
    FOREIGN KEY (packageId, dayNumber) REFERENCES ItineraryDay(packageId, dayNumber) ON DELETE CASCADE,
    FOREIGN KEY (attractionId) REFERENCES Attraction(attractionId) ON DELETE CASCADE
);

CREATE TABLE ItineraryRestaurant (
    packageId INT,
    dayNumber INT,
    restaurantId INT,
    PRIMARY KEY (packageId, dayNumber, restaurantId),
    FOREIGN KEY (packageId, dayNumber) REFERENCES ItineraryDay(packageId, dayNumber) ON DELETE CASCADE,
    FOREIGN KEY (restaurantId) REFERENCES Restaurant(restaurantId) ON DELETE CASCADE
);

CREATE TABLE Image (
    imageId INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255) NOT NULL
);

CREATE TABLE DestinationImage (
    destinationId INT,
    imageId INT,
    PRIMARY KEY (destinationId, imageId),
    FOREIGN KEY (destinationId) REFERENCES Destination(destinationId) ON DELETE CASCADE,
    FOREIGN KEY (imageId) REFERENCES Image(imageId) ON DELETE CASCADE
);

CREATE TABLE AttractionImage (
    attractionId INT,
    imageId INT,
    PRIMARY KEY (attractionId, imageId),
    FOREIGN KEY (attractionId) REFERENCES Attraction(attractionId) ON DELETE CASCADE,
    FOREIGN KEY (imageId) REFERENCES Image(imageId) ON DELETE CASCADE
);

CREATE TABLE RestaurantImage (
    restaurantId INT,
    imageId INT,
    PRIMARY KEY (restaurantId, imageId),
    FOREIGN KEY (restaurantId) REFERENCES Restaurant(restaurantId) ON DELETE CASCADE,
    FOREIGN KEY (imageId) REFERENCES Image(imageId) ON DELETE CASCADE
);

CREATE TABLE AccommodationImage (
    accommodationId INT,
    imageId INT,
    PRIMARY KEY (accommodationId, imageId),
    FOREIGN KEY (accommodationId) REFERENCES Accommodation(accommodationId) ON DELETE CASCADE,
    FOREIGN KEY (imageId) REFERENCES Image(imageId) ON DELETE CASCADE
);