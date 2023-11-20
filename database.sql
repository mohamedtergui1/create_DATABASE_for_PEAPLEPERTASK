-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour peoplepertask
CREATE DATABASE IF NOT EXISTS `peoplepertask` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `peoplepertask`;

-- Listage de la structure de table peoplepertask. categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table peoplepertask. freelances
CREATE TABLE IF NOT EXISTS `freelances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `freelandersNAME` varchar(255) NOT NULL,
  `freelanderCompétences` varchar(300) NOT NULL,
  `usersID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usersID` (`usersID`),
  CONSTRAINT `freelances_ibfk_1` FOREIGN KEY (`usersID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table peoplepertask. offres
CREATE TABLE IF NOT EXISTS `offres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Offresprice` float NOT NULL,
  `delay` float NOT NULL,
  `freelancesID` int DEFAULT NULL,
  `projectsID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `freelancesID` (`freelancesID`),
  KEY `projectsID` (`projectsID`),
  CONSTRAINT `offres_ibfk_1` FOREIGN KEY (`freelancesID`) REFERENCES `freelances` (`id`),
  CONSTRAINT `offres_ibfk_2` FOREIGN KEY (`projectsID`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table peoplepertask. projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projrctNAME` varchar(255) NOT NULL,
  `projrctDescription` varchar(255) NOT NULL,
  `categoriesID` int DEFAULT NULL,
  `souscategoriesID` int DEFAULT NULL,
  `usersID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriesID` (`categoriesID`),
  KEY `souscategoriesID` (`souscategoriesID`),
  KEY `usersID` (`usersID`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`categoriesID`) REFERENCES `categories` (`id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`souscategoriesID`) REFERENCES `souscategories` (`id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`usersID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table peoplepertask. souscategories
CREATE TABLE IF NOT EXISTS `souscategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `souscategoriesNAME` varchar(255) NOT NULL,
  `categoriesID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriesID` (`categoriesID`),
  CONSTRAINT `souscategories_ibfk_1` FOREIGN KEY (`categoriesID`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table peoplepertask. temoignages
CREATE TABLE IF NOT EXISTS `temoignages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TemoignagesComment` varchar(1000) DEFAULT NULL,
  `usersID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usersID` (`usersID`),
  CONSTRAINT `temoignages_ibfk_1` FOREIGN KEY (`usersID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de table peoplepertask. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `autres_informations_pertinentes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
