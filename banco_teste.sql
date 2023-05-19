-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rh
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Assistente de RH'),(2,'Auxiliar de RH'),(3,'Programador Júnior'),(4,'Programador Pleno'),(5,'Programador Sênior'),(6,'Analista de RH'),(7,'Gerente'),(8,'Assistente Financeiro');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(512) NOT NULL,
  `data_nascimento` date NOT NULL,
  `matricula` varchar(100) NOT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `data_contratacao` date NOT NULL,
  `data_demissao` date DEFAULT NULL,
  `setor_id` int(11) NOT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_funcionarios_cargos` (`cargo_id`),
  KEY `fk_funcionarios_setores` (`setor_id`),
  CONSTRAINT `fk_funcionarios_cargos` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `fk_funcionarios_setores` FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'João da Silva','1995-04-05','1',2,'2021-01-05',NULL,3,2347.98,'M'),(2,'Maria Pereira','1991-01-30','54',2,'2020-12-10',NULL,3,6400.01,'F'),(3,'Joana Souza','1993-12-23','693',NULL,'2021-03-19','2021-04-19',3,2388.90,'F'),(4,'Maristela Silva','1976-12-21','54',3,'2021-03-19',NULL,1,1005.99,'F'),(5,'Alberto Lima','1956-07-30','3',4,'2019-07-29',NULL,1,8566.60,'M'),(6,'Ricardo Lima','1988-03-13','587',5,'2019-07-30',NULL,1,NULL,'M'),(7,'Alexandre Silva','1980-01-28','23',6,'2019-07-30',NULL,3,NULL,'M'),(8,'Borba Fernandes','1986-08-20','670',7,'2010-09-10','2021-03-19',4,3922.43,'M'),(9,'Alberto Lima','1967-11-11','21',8,'2018-02-24',NULL,2,4399.01,'M'),(10,'Castro Menezes','1999-07-02','002',2,'2019-10-10',NULL,3,6566.89,'M');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setores`
--

DROP TABLE IF EXISTS `setores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `responsavel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_setores_responsavel` (`responsavel_id`),
  CONSTRAINT `fk_setores_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setores`
--

LOCK TABLES `setores` WRITE;
/*!40000 ALTER TABLE `setores` DISABLE KEYS */;
INSERT INTO `setores` VALUES (1,'Desenvolvimento',NULL),(2,'Financeiro',NULL),(3,'RH',NULL),(4,'Jurídico',8),(5,'Comercial',NULL);
/*!40000 ALTER TABLE `setores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-24 10:12:40
