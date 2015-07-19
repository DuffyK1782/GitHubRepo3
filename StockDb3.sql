-- MySQL dump 10.13  Distrib 5.6.25, for Win32 (x86)
--
-- Host: localhost    Database: StockDb
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `StockDb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `StockDb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `StockDb`;

--
-- Table structure for table `company_profile`
--

DROP TABLE IF EXISTS `company_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_profile` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(50) NOT NULL,
  `Sector` varchar(50) DEFAULT NULL,
  `Industry` varchar(50) DEFAULT NULL,
  `StockSymbol` varchar(10) NOT NULL,
  `SharesOutstanding` double(10,0) DEFAULT NULL,
  `AverageVolume` double(10,0) DEFAULT NULL,
  `Beta` float(3,2) DEFAULT NULL,
  `ForwardPE` float(3,2) DEFAULT NULL,
  `PEG` float(3,2) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  UNIQUE KEY `StockSymbol` (`StockSymbol`),
  CONSTRAINT `StockSymbol_FK` FOREIGN KEY (`StockSymbol`) REFERENCES `price_history` (`StockSymbol`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_profile`
--

LOCK TABLES `company_profile` WRITE;
/*!40000 ALTER TABLE `company_profile` DISABLE KEYS */;
INSERT INTO `company_profile` VALUES (2,'CompanyName','Sector','Industry','StockSymbo',0,0,0.00,0.00,0.00),(3,'3-D Systems Corp','Technology','Computer Peripherals','DDD',111000000,2580360,1.32,9.99,2.08),(4,'3M','Conglomerates','Basic Materials','MMM',634000000,2279380,1.19,9.99,2.35),(5,'Apple Inc.','Consumer Goods','Electronic Equipment','AAPL',5750000000,49000700,0.91,9.99,1.11),(6,'Chevron Corporation','Conglomerates','Major Oil & Gas','CVX',1880000000,6879720,1.20,9.99,-7.83),(7,'Boeing','Industrial Goods','\"Aerospace/\nDefense\"','BA',691520000,3858450,0.89,9.99,1.34),(8,'Intel Corp','Technology','\"Semiconductor - \nBroad Line\"','INTC',4740000000,31192900,0.94,9.99,1.91),(9,'JP Morgan','Financial','Money Center Banks','JPM',3710000000,14695200,1.78,9.99,1.48),(10,'Microsoft Corporation','Technology','Business Software & Services','MSFT',8110000000,36997600,0.86,9.99,2.66),(11,'Nextera Energy Inc','Utilities','Electric Utilities','NEE',444120000,2256070,0.29,9.99,2.81),(12,'Pepsico Inc','Consumer Goods','Beverages - Soft Drinks','PEP',1480000000,4516750,0.60,9.99,3.39),(13,'Pfizer','Healthcare','\"Drug Manufactures -\nMajor\"','PFE',6160000000,26162600,0.84,9.99,5.34),(14,'Procter & Gamble Co','Consumer Goods','Personal Products','PG',2710000000,8063700,0.84,9.99,2.97),(15,'Walt Disney','Services ','Entertainment - Diversified','DIS',1700000000,5836120,1.08,9.99,1.44),(16,'Celgene Corp','Healthcare','Biotechnology','CELG',793140000,5287580,1.79,9.99,0.96),(17,'Gilead Sciences','Healthcare','Biotechnology','GILD',1470000000,11072700,0.93,9.99,0.78);
/*!40000 ALTER TABLE `company_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_ratings_junction`
--

DROP TABLE IF EXISTS `company_ratings_junction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_ratings_junction` (
  `CompanyID` int(11) DEFAULT NULL,
  `AnalystID` int(11) DEFAULT NULL,
  `StockSymbol` varchar(10) NOT NULL,
  `RatingDateID` date NOT NULL,
  `AnalystReport` blob,
  UNIQUE KEY `Company_Ratings_Junction_PK` (`CompanyID`,`AnalystID`,`StockSymbol`,`RatingDateID`),
  KEY `AnalystID_FK` (`AnalystID`,`StockSymbol`,`RatingDateID`),
  CONSTRAINT `AnalystID_FK` FOREIGN KEY (`AnalystID`, `StockSymbol`, `RatingDateID`) REFERENCES `stock_ratings` (`AnalystID`, `StockSymbol`, `RatingDateID`),
  CONSTRAINT `CompanyID_FK` FOREIGN KEY (`CompanyID`) REFERENCES `company_profile` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_ratings_junction`
--

LOCK TABLES `company_ratings_junction` WRITE;
/*!40000 ALTER TABLE `company_ratings_junction` DISABLE KEYS */;
INSERT INTO `company_ratings_junction` VALUES (16,8,'CELG','2015-07-15',NULL),(13,17,'PFE','2015-06-17',NULL),(9,6,'JPM','2015-05-05',NULL),(5,3,'AAPL','2015-06-09',NULL),(10,13,'MSFT','2015-05-12',NULL),(17,16,'GILD','2015-04-06',NULL),(6,4,'CVX','2015-02-06',NULL),(8,5,'INTC','2015-07-06',NULL),(7,20,'BA','2015-02-23',NULL),(15,9,'DIS','2015-05-07',NULL),(16,21,'CELG','2015-02-18','010101111010110100001010010');
/*!40000 ALTER TABLE `company_ratings_junction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_history`
--

DROP TABLE IF EXISTS `price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_history` (
  `StockSymbol` varchar(10) NOT NULL DEFAULT '',
  `Date_ID` date NOT NULL DEFAULT '0000-00-00',
  `Opening_Price` float(6,2) DEFAULT NULL,
  `High_Price` float(6,2) DEFAULT NULL,
  `Low_Price` float(6,2) DEFAULT NULL,
  `Closing_Price` float(6,2) DEFAULT NULL,
  `Volume` double(20,2) DEFAULT NULL,
  `Adjusted_Close` float(6,2) DEFAULT NULL,
  `Price_Target` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`StockSymbol`,`Date_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_history`
--

LOCK TABLES `price_history` WRITE;
/*!40000 ALTER TABLE `price_history` DISABLE KEYS */;
INSERT INTO `price_history` VALUES ('AAPL','0000-00-00',128.19,128.33,127.11,127.17,36754200.00,127.17,148.75),('BA','0000-00-00',142.62,142.86,141.09,142.80,2389100.00,142.80,163.00),('CELG','0000-00-00',110.42,111.35,109.34,111.00,2892200.00,111.00,137.15),('CVX','0000-00-00',100.52,100.69,99.63,99.87,6431200.00,99.87,113.11),('DDD','0000-00-00',21.34,21.53,21.17,21.32,1305500.00,21.32,24.44),('DIS','0000-00-00',109.27,110.41,108.93,110.18,4444300.00,110.18,118.37),('GILD','0000-00-00',116.72,118.39,116.40,118.16,9597500.00,118.16,122.00),('INTC','0000-00-00',31.72,32.10,31.20,31.32,31568300.00,31.32,34.64),('JPM','0000-00-00',67.58,68.21,67.30,67.99,14063800.00,67.99,71.11),('MMM','0000-00-00',159.85,159.99,157.88,158.04,1906900.00,158.04,167.57),('MSFT','0000-00-00',45.45,45.65,45.02,45.48,30080100.00,45.48,49.30),('NEE','0000-00-00',98.49,99.65,98.49,99.12,1517100.00,99.12,117.33),('PEP','0000-00-00',93.27,93.42,92.54,92.64,7137800.00,92.64,106.15),('PFE','0000-00-00',34.30,34.46,34.10,34.21,21581200.00,34.21,36.36),('PG','0000-00-00',78.33,78.46,77.93,78.12,7428400.00,78.12,88.06),('StockSymbo','0000-00-00',0.00,0.00,0.00,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_ratings`
--

DROP TABLE IF EXISTS `stock_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_ratings` (
  `AnalystID` int(11) NOT NULL AUTO_INCREMENT,
  `StockSymbol` varchar(10) NOT NULL,
  `RatingDateID` date NOT NULL,
  `analysts_FirstName` varchar(50) DEFAULT NULL,
  `analysts_NickName` varchar(50) DEFAULT NULL,
  `analysts_LastName` varchar(50) DEFAULT NULL,
  `IndustrySector` varchar(100) DEFAULT NULL,
  `InstitutionName` varchar(100) DEFAULT NULL,
  `InstitutionType` varchar(100) DEFAULT NULL,
  `Recommendation` varchar(50) DEFAULT NULL,
  `analysts_TargetPrice` float(6,2) DEFAULT NULL,
  `analysts_SuccessRate` float(6,2) DEFAULT NULL,
  `analysts_AverageReturn` float(6,2) DEFAULT NULL,
  `ConsensusPrice` float(6,2) DEFAULT NULL,
  `ConsensusRating` float(6,2) DEFAULT NULL,
  PRIMARY KEY (`AnalystID`,`StockSymbol`,`RatingDateID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_ratings`
--

LOCK TABLES `stock_ratings` WRITE;
/*!40000 ALTER TABLE `stock_ratings` DISABLE KEYS */;
INSERT INTO `stock_ratings` VALUES (1,'StockSymbo','0000-00-00','analysts_FirstName','analysts_NickName','analysts_LastName','IndustrySector','InstitutionName','InstitutionType','Recommendation',0.00,0.00,0.00,0.00,0.00),(2,'DDD','0000-00-00','Lewis','NA','Holden','Technology','Oppenheimer','Financial','Perform',38.00,-0.23,-0.16,24.41,3.10),(3,'AAPL','0000-00-00','Andrew','NA','Uerkwitz','Consumer','Oppenheimer','Financial','OutPerform',155.00,0.60,0.04,148.88,1.90),(4,'CVX','0000-00-00','Fadel','NA','Gheit','Basic Materials','Oppenheimer','Financial','Perform',115.00,-0.07,-0.18,111.98,2.80),(5,'INTC','0000-00-00','Rick','NA','Schafer','Technology','Oppenheimer','Financial','Perform',31.25,0.76,0.24,33.69,2.60),(6,'JPM','0000-00-00','Chris','NA','Kotowski','Financial','Oppenheimer','Financial','OutPerform',81.00,0.71,0.04,72.36,2.00),(7,'MSFT','0000-00-00','Shaul','NA','Eyal','Technology','Oppenheimer','Financial','OutPerform',50.00,0.75,0.20,49.57,2.60),(8,'CELG','0000-00-00','David','NA','Toung','Healthcare','Argus Research','Financial','Buy',155.00,0.87,0.20,136.89,1.90),(9,'DIS','0000-00-00','Joseph','NA','Bonner','Technology','Argus Research','Financial','Buy',123.00,0.77,0.12,121.11,2.00),(10,'DIS','0000-00-00','Jessica','NA','Reif-Cohen','Services','Merrill Lynch','Financial','Buy',130.00,0.82,0.14,121.11,2.00),(11,'NEE','0000-00-00','Brian','NA','Chin','Utilities','Merrill Lynch','Financial','Buy',110.00,0.76,0.10,102.77,0.00),(12,'MMM','0000-00-00','Shannon','NA','O\'Callaghan','Industrial Goods','UBS','Financial','Buy',195.00,0.81,0.17,168.77,2.60),(13,'MSFT','0000-00-00','Brent','NA','Thill','Technology','UBS','Financial','Buy',50.00,0.71,0.16,49.57,2.60),(14,'GILD','0000-00-00','Mark','NA','SchoeneBaum','Healthcare','Evercore ISI','Financial','Buy',35.11,0.88,0.23,38.18,2.30),(15,'PFE','0000-00-00','Mark','NA','SchoeneBaum','Healthcare','Evercore ISI','Financial','Buy',35.11,0.88,0.23,38.18,2.30),(16,'GILD','0000-00-00','Yaron','NA','Werber','Healthcare','Citigroup','Financial','Buy',120.00,0.78,0.22,123.32,2.00),(17,'PFE','0000-00-00','Richard','NA','Purkiss','Healthcare','Piper Jaffray','Financial','OverWeight',45.00,0.60,0.03,38.18,2.30),(18,'PG','0000-00-00','Bill','NA','Schmitz','Consumer Goods','Deutsche Bank','Financial','Buy',96.00,0.72,0.08,88.00,2.60),(19,'MSFT','0000-00-00','Robert','NA','Breza','Technology','Wunderlich Securities','Financial','Hold',52.00,0.73,0.19,49.57,2.60),(20,'BA','0000-00-00','Noah','NA','Poponak','Industrial Goods','Goldman Sachs','Financial','Sell',132.00,0.69,0.16,163.60,2.20),(21,'CELG','0000-00-00','John','NA','Newman','Healthcare','Canaccord Genuity','Financial','Buy',156.00,0.66,0.20,136.89,1.90),(22,'INTC','0000-00-00','Mark','NA','Lipacis','Technology','Jefferies','Financial','Buy',36.00,0.64,0.12,33.69,2.60);
/*!40000 ALTER TABLE `stock_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-18 21:38:12
