-- MySQL dump 10.13  Distrib 5.5.62, for osx10.13 (x86_64)
--
-- Host: localhost    Database: estoque_mateus
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `idEstoque` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `qntEstoque` int(10) unsigned NOT NULL,
  `idFilial` int(11) NOT NULL,
  PRIMARY KEY (`idEstoque`),
  KEY `fkFilial_idx` (`idFilial`),
  KEY `fkProduto_idx` (`idProduto`),
  CONSTRAINT `fkFilial` FOREIGN KEY (`idFilial`) REFERENCES `filial` (`idfilial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkProduto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idproduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,1,100,60),(2,2,80,60),(3,3,200,60),(4,4,90,60),(5,1,150,61),(6,1,120,62),(7,2,101,61),(8,7993,100,60);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filial` (
  `idfilial` int(11) NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (60,'Cohama'),(61,'São Fransisco'),(62,'Renascença');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_ped_estoque`
--

DROP TABLE IF EXISTS `item_ped_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_ped_estoque` (
  `iditemPedEstoque` int(11) NOT NULL AUTO_INCREMENT,
  `idPedidoEstoque` int(11) NOT NULL,
  `idEstoque` int(11) NOT NULL,
  `qntSolicitada` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iditemPedEstoque`),
  KEY `fkPedidoEstoque_idx` (`idPedidoEstoque`),
  KEY `fkEstoque_idx` (`idEstoque`),
  CONSTRAINT `fkEstoque` FOREIGN KEY (`idEstoque`) REFERENCES `estoque` (`idEstoque`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkPedidoEstoque` FOREIGN KEY (`idPedidoEstoque`) REFERENCES `pedido_estoque` (`idPedidoEstoque`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_ped_estoque`
--

LOCK TABLES `item_ped_estoque` WRITE;
/*!40000 ALTER TABLE `item_ped_estoque` DISABLE KEYS */;
INSERT INTO `item_ped_estoque` VALUES (1,1,6,5),(4,1,8,10),(5,1,4,10),(6,1,4,11);
/*!40000 ALTER TABLE `item_ped_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_estoque`
--

DROP TABLE IF EXISTS `pedido_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_estoque` (
  `idPedidoEstoque` int(11) NOT NULL AUTO_INCREMENT,
  `dataSolicitacao` datetime NOT NULL,
  `tipoSolicitacao` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idPedidoEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_estoque`
--

LOCK TABLES `pedido_estoque` WRITE;
/*!40000 ALTER TABLE `pedido_estoque` DISABLE KEYS */;
INSERT INTO `pedido_estoque` VALUES (1,'2019-03-30 10:23:00','SAIDA'),(2,'2019-03-30 12:17:00','ENTRADA');
/*!40000 ALTER TABLE `pedido_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `nomeproduto` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idproduto`),
  UNIQUE KEY `nomeproduto_UNIQUE` (`nomeproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7994 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'ARROZ'),(4,'BUDWEISER'),(3,'CERVEJA ANTARTICA'),(7993,'CHAPEU MAGICO'),(2,'FEIJAO');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-30 13:18:14
