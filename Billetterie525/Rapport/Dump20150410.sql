-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: gti525labo4
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `factures`
--

DROP TABLE IF EXISTS `factures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factures` (
  `idFactures` int(11) NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `nomClient` varchar(45) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFactures`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factures`
--

LOCK TABLES `factures` WRITE;
/*!40000 ALTER TABLE `factures` DISABLE KEYS */;
INSERT INTO `factures` VALUES (1,'2015/04/09 22:08:30',NULL,240),(2,'2015/04/09 22:19:07','lol lol',2600),(3,'2015/04/09 22:37:15','lol lol',2600),(4,'2015/04/09 22:50:36','lol lol',1113),(5,'2015/04/09 23:25:10','lol lol',208),(6,'2015/04/09 23:29:31','lol lol',420),(7,'2015/04/09 23:30:53','lol lol',300),(8,'2015/04/10 16:56:32','lol LOl',300);
/*!40000 ALTER TABLE `factures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representations`
--

DROP TABLE IF EXISTS `representations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representations` (
  `idRepresentations` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Prix` int(11) NOT NULL,
  `FK_Spectacle` int(11) NOT NULL,
  `FK_Salle` int(11) NOT NULL,
  `nbBillets` int(11) NOT NULL,
  `nbBilletsReserver` int(11) NOT NULL,
  PRIMARY KEY (`idRepresentations`),
  KEY `FK_Spectacle_idx` (`FK_Spectacle`),
  KEY `FK_Salle_idx` (`FK_Salle`),
  CONSTRAINT `FK_Salle` FOREIGN KEY (`FK_Salle`) REFERENCES `salles` (`idsalles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Spectacle` FOREIGN KEY (`FK_Spectacle`) REFERENCES `spectacles` (`idSpectacle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representations`
--

LOCK TABLES `representations` WRITE;
/*!40000 ALTER TABLE `representations` DISABLE KEYS */;
INSERT INTO `representations` VALUES (1,'2015-11-03',52,14,2,50,0),(2,'2015-05-04',60,14,3,50,0),(3,'2015-06-05',45,14,4,50,0),(4,'2015-05-23',52,14,4,50,0),(5,'2015-06-12',53,14,0,50,0),(6,'2015-09-12',53,14,1,50,0),(7,'2015-11-06',52,11,2,50,0),(8,'2015-05-07',60,11,3,50,12),(9,'2015-06-08',45,11,4,50,0),(10,'2015-07-30',52,11,4,50,4),(11,'2015-06-04',53,11,1,50,3),(12,'2015-09-17',53,11,0,50,50),(13,'2015-09-06',52,12,2,50,0),(14,'2015-10-07',60,12,3,50,6),(15,'2015-06-18',45,12,4,50,0),(16,'2015-08-30',52,12,4,50,0),(17,'2015-11-04',53,12,0,50,0),(18,'2015-09-22',53,12,0,50,0),(19,'2015-09-06',52,13,2,50,0),(20,'2016-01-07',60,13,3,50,11),(21,'2015-06-18',45,13,4,50,1),(22,'2015-08-30',52,13,4,50,0),(23,'2016-03-04',53,13,0,50,0),(24,'2015-09-22',53,13,1,50,0);
/*!40000 ALTER TABLE `representations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salles` (
  `idsalles` int(11) NOT NULL,
  `Addresse` varchar(45) DEFAULT NULL,
  `Ville` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsalles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (0,'12 rue V','Montreal'),(1,'34 rue W','Brossard'),(2,'56 rue X','Longueuil'),(3,'78 rue Y','Laval'),(4,'90 rue Z','Montreal');
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectacles`
--

DROP TABLE IF EXISTS `spectacles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spectacles` (
  `idSpectacle` int(11) NOT NULL AUTO_INCREMENT,
  `Description` longblob NOT NULL,
  `Nom` varchar(45) NOT NULL,
  `Artiste` varchar(45) NOT NULL,
  `Categorie` varchar(45) NOT NULL,
  `AffichePath` varchar(45) NOT NULL,
  `IconePath` varchar(45) NOT NULL,
  PRIMARY KEY (`idSpectacle`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 PACK_KEYS=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectacles`
--

LOCK TABLES `spectacles` WRITE;
/*!40000 ALTER TABLE `spectacles` DISABLE KEYS */;
INSERT INTO `spectacles` VALUES (11,'Sacré Découverte de l’année au Gala les Olivier 2012 François Bellefeuille est un humoriste hors du commun. L’humour de François est un mélange d’absurdité de colère de confusion et de pragmatisme qui étourdira votre sens logique. Il parcourt le Québec et propage sa folie partout où il va. Il charme le public à tous les coups grâce à sa perception unique du monde armé d’un des personnages les plus marquants des dernières années : un fou charmant dont la bêtise est d’une intelligence surprenante. Aussi attachant que colérique François Bellefeuille n’a pas fini de vous surprendre!','Faucon','Francois Bellefeuille','Humour','images/affiches/s0_big.jpg','images/icones/s0_small.jpg'),(12,'Après l’engouement entourant le spectacle Sugar Sammy : You’re Gonna Rire – Le Show franglais qui sera présenté à Montréal en février 2012 – le spectacle affiche déjà complet pour 15 représentations à l’Olympia – Sugar Sammy ne pouvait pas laisser pour compte ses fans francophones à l’extérieur de Montréal. À la demande générale, dès septembre 2012 l’humoriste arpentera la belle province pour présenter son tout premier spectacle en langue française dans 15 villes du Québec.','En Français SVP!','Sugar Sammy','Humour','images/affiches/s1_big.jpg','images/icones/s1_small.jpg'),(13,'Prydz reste l un des artistes les plus singuliers de la musique électronique, libérant la musique sous plusieurs alias, sur plusieurs genres;d hymnes dossiers Eric Prydz, de genre définissant maison progresse comme Pryda et l obscurité, de dos dépouillé techno de Cirez D. À une époque où les artistes de MainStage dans la musique de danse semblent presque interchangeables, Prydz continue de se démarquer.','Generate Tour','Eric Prydz','Techno','images/affiches/s2_big.jpg','images/icones/s2_small.jpg'),(14,'Disney on Ice sera de retour! Cette fois, il s agira du spectacle Disney Sur Glace : La Reine des Neiges, basé sur les personnages du film à succès de Frozen. En plus des personnages de Frozen, Mickey et Minnie Mouse animeront le spectacle, qui proposera également des personnages de TOYStory, Finding Nemo et le Roi Lion. Ce spectacle magique qui ravira petits et grands. Êtes-vous prêts pour l aventure?','Disney sur glace','Patineurs','ComediesMusicales','images/affiches/s3_big.jpg','images/icones/s3_small.jpg');
/*!40000 ALTER TABLE `spectacles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-10 17:09:23
