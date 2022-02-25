-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.9    Database: MovieApp
-- ------------------------------------------------------
-- Server version	5.7.37

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
-- Dumping data for table `Distributor`
--

LOCK TABLES `Distributor` WRITE;
/*!40000 ALTER TABLE `Distributor` DISABLE KEYS */;
INSERT INTO `Distributor` VALUES ('101 Studios',3),('20th Century Studios',8),('3388 Films',1),('3D Entertainment',2),('8x Entertainment',2),('A24',42),('Affirm Films',5),('Alive Films',6),('Alliance Atlantis Vivafilm',4),('Amazon Studios',8),('American International Pictures (AIP)',1),('Anchor Bay Films',2),('Annapurna Pictures',6),('Apparition',4),('Arc Entertainment',2),('Area 23a',1),('Aries Films',2),('Artisan Entertainment',24),('Atlantic Releasing Corporation',24),('Atlas Distribution Company',4),('AVCO Embassy Pictures',1),('Avenue Pictures Productions',9),('Aviron Pictures',4),('BH Tilt',9),('Bleecker Street Media',30),('Blue Sky Cinema',1),('BritBox',1),('Broad Green Pictures',6),('Cannon Film Distributors',55),('Capelight Pictures',1),('CBS Films',16),('Chicago Pictures',1),('Cinecom Pictures',14),('Cinelou Films',1),('Cinetel',1),('CJ Entertainment',1),('Clarius Entertainment',3),('Cloud Ten Pictures',1),('Cloudburst Entertainment',1),('CMC Pictures',4),('Codeblack Entertainment',1),('Cohen Media Group',1),('Columbia Pictures',209),('Concorde Pictures',9),('Corsair Pictures',2),('Crown',4),('De Laurentiis Entertainment Group (DEG)',21),('Destination Films',6),('Dimension Films',26),('Drafthouse Films',1),('Dragon Dynasty',1),('DreamWorks',43),('DreamWorks Distribution',65),('EchoLight Studios',1),('Electric Entertainment',1),('Embassy Pictures',15),('Empire Pictures',5),('Entertainment One',4),('Entertainment Studios Motion Pictures',8),('Eros Worldwide',10),('EuropaCorp',4),('Excel Entertainment',3),('Faith Media Distribution',3),('Fathom Events',22),('FilmDistrict',13),('Fine Line Features',29),('FIP',9),('First Look International',5),('First National Film Corporation',1),('Flyhigh Cinemas',1),('Focus Features',136),('Four Square',1),('Fox Atomic',4),('Fox Searchlight Pictures',150),('Freestyle Releasing',14),('FUNimation Entertainment',8),('GKIDS',5),('Global View Entertainment',1),('Good Deed Entertainment',2),('Good Machine',1),('Gramercy Pictures (I)',36),('Gravitas Ventures',4),('Great India Films',2),('Greenwich Entertainment',3),('GVN Releasing',1),('Hemdale',16),('Hidden Empire Film Group (HEFG)',1),('High Top Releasing',1),('IDP Distribution',7),('IFC Films',26),('IMAX',43),('Imperial Entertainment',1),('Independent Artists',1),('International Film Marketing',1),('IRS Media',1),('Island Alive',4),('Island Pictures',7),('Janus Films',1),('Kino International',1),('Kino Lorber',1),('LD Entertainment',2),('Lionsgate',270),('Lorimar Motion Pictures',8),('MacGillivray Freeman Films',3),('Magnolia Pictures',18),('Manifold Productions Inc.',1),('Metro-Goldwyn-Mayer (MGM)',283),('Millennium Entertainment',2),('Miramax',248),('Music Box Films',8),('National Geographic Entertainment',8),('Neon',22),('New Century',11),('New Line Cinema',229),('New World Pictures',36),('Newmarket Films',7),('October Films',16),('Odeon',1),('Open Road Films (II)',44),('Orion Classics',13),('Orion Pictures',134),('Oscilloscope',3),('Overture Films',15),('Pantelion Films',9),('Paramount Classics',11),('Paramount Pictures',592),('Paramount Vantage',18),('Picturehouse',10),('PolyGram',7),('Providence Entertainment',1),('Pryor Entertainment',1),('Purdie Distribution',3),('Pure Flix Entertainment',11),('Quiver Distribution',2),('R.S. Entertainment',2),('RADiUS-TWC',3),('Rainbow Releasing',2),('Relativity Media',32),('Reliance Big Pictures',6),('Reliance Entertainment',2),('Revolution Studios',42),('Rhythm Boyz Entertainment',1),('Rialto Distribution',1),('RLJE Films',3),('Roadside Attractions',51),('Rocky Mountain Pictures',5),('Rogue Pictures',15),('Roxie Releasing',2),('Saban Films',5),('Screen Gems',81),('Screen Media Films',1),('Screenvision',1),('Searchlight Pictures',9),('Shorts International',4),('SK Films',1),('Skouras Pictures',8),('Solstice Studios',1),('Sony Pictures Classics',137),('Sony Pictures Entertainment (SPE)',427),('Stage 6 Films',6),('Studio 8',2),('STX Entertainment',37),('Summit Entertainment',33),('Taurus Entertainment Company',4),('Televisa Cine',1),('The Film Arcade',1),('The H Collective',1),('The Orchard',2),('The Samuel Goldwyn Company',65),('The Weinstein Company',74),('THINKFilm',5),('Trafalgar Releasing',4),('Trans World Entertainment (TWE)',3),('Trimark Pictures',14),('TriStar Pictures',168),('Triton Pictures',4),('Triumph Releasing Corporation',18),('Troma',3),('truTV',1),('Twentieth Century Fox',672),('United Artists',40),('United Artists Releasing',16),('Universal Classics',1),('Universal Pictures',766),('USA Films',14),('UTV Motion Pictures',7),('Vertical Entertainment',10),('Vestron Pictures',14),('Visio Entertainment',1),('Viva Pictures',4),('Vivendi Entertainment',2),('Walt Disney Pictures',4),('Walt Disney Studios Motion Pictures',688),('Warner Bros.',964),('Warner Independent Pictures (WIP)',10),('Well Go USA Entertainment',8),('Yari Film Group Releasing',2),('Yash Raj Films',7),('Zeitgeist Films',1);
/*!40000 ALTER TABLE `Distributor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 21:07:28
