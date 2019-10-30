-- MariaDB dump 10.17  Distrib 10.4.6-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: praktikum3
-- ------------------------------------------------------
-- Server version	10.4.6-MariaDB

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
-- Table structure for table `jalur_masuk`
--

DROP TABLE IF EXISTS `jalur_masuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jalur_masuk` (
  `kode` enum('0','3','5') NOT NULL,
  `nama` varchar(200) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jalur_masuk`
--

LOCK TABLES `jalur_masuk` WRITE;
/*!40000 ALTER TABLE `jalur_masuk` DISABLE KEYS */;
INSERT INTO `jalur_masuk` VALUES ('3','SB');
/*!40000 ALTER TABLE `jalur_masuk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfakultas`
--

DROP TABLE IF EXISTS `tfakultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tfakultas` (
  `kode` varchar(1) NOT NULL,
  `nama` varchar(200) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfakultas`
--

LOCK TABLES `tfakultas` WRITE;
/*!40000 ALTER TABLE `tfakultas` DISABLE KEYS */;
INSERT INTO `tfakultas` VALUES ('H','MIPA');
/*!40000 ALTER TABLE `tfakultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmahasiswa`
--

DROP TABLE IF EXISTS `tmahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmahasiswa` (
  `id` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `kode_fakultas` varchar(1) NOT NULL,
  `kode_prodi` int(2) unsigned zerofill NOT NULL,
  `tahun_masuk` int(4) NOT NULL,
  `jalur_masuk` enum('0','3','5') NOT NULL,
  `nama` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_fakultas` (`kode_fakultas`),
  KEY `kode_prodi` (`kode_prodi`),
  KEY `jalur_masuk` (`jalur_masuk`),
  CONSTRAINT `tmahasiswa_ibfk_1` FOREIGN KEY (`kode_fakultas`) REFERENCES `tfakultas` (`kode`),
  CONSTRAINT `tmahasiswa_ibfk_2` FOREIGN KEY (`kode_prodi`) REFERENCES `tprodi` (`kode`),
  CONSTRAINT `tmahasiswa_ibfk_3` FOREIGN KEY (`jalur_masuk`) REFERENCES `jalur_masuk` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmahasiswa`
--

LOCK TABLES `tmahasiswa` WRITE;
/*!40000 ALTER TABLE `tmahasiswa` DISABLE KEYS */;
INSERT INTO `tmahasiswa` VALUES (01,'H',07,2018,'3','Fathur Fahrizal'),(02,'H',07,2018,'3','ardi s');
/*!40000 ALTER TABLE `tmahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tnim`
--

DROP TABLE IF EXISTS `tnim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tnim` (
  `nama` varchar(200) NOT NULL,
  `nim` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tnim`
--

LOCK TABLES `tnim` WRITE;
/*!40000 ALTER TABLE `tnim` DISABLE KEYS */;
INSERT INTO `tnim` VALUES ('Fathur Fahrizal','H071181301'),('Fathur Fahrizal','H071181301'),('ardi s','H071181302');
/*!40000 ALTER TABLE `tnim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprodi`
--

DROP TABLE IF EXISTS `tprodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tprodi` (
  `kode` int(2) unsigned zerofill NOT NULL,
  `nama` varchar(200) NOT NULL,
  `kode_fakultas` varchar(1) NOT NULL,
  PRIMARY KEY (`kode`),
  KEY `kode_fakultas` (`kode_fakultas`),
  CONSTRAINT `tprodi_ibfk_1` FOREIGN KEY (`kode_fakultas`) REFERENCES `tfakultas` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprodi`
--

LOCK TABLES `tprodi` WRITE;
/*!40000 ALTER TABLE `tprodi` DISABLE KEYS */;
INSERT INTO `tprodi` VALUES (07,'ILMU KOMPUTER','H');
/*!40000 ALTER TABLE `tprodi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-30 14:54:47
