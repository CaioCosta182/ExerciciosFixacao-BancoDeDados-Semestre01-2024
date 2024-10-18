CREATE DATABASE  IF NOT EXISTS `BDCaioCesar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `BDCaioCesar`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 195.200.2.145    Database: BDCaioCesar
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.1

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
-- Table structure for table `AUTOR`
--

DROP TABLE IF EXISTS `AUTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTOR` (
  `ID_AUTOR` int NOT NULL,
  `NOME` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_AUTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOR`
--

LOCK TABLES `AUTOR` WRITE;
/*!40000 ALTER TABLE `AUTOR` DISABLE KEYS */;
INSERT INTO `AUTOR` VALUES (1,'J.K. Rowling'),(2,'Isaac Asimov'),(3,'Stephen King'),(4,'Jane Austen'),(5,'George Orwell'),(6,'Agatha Christie'),(7,'J.R.R. Tolkien'),(8,'Mark Twain'),(9,'F. Scott Fitzgerald'),(10,'Ernest Hemingway');
/*!40000 ALTER TABLE `AUTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTORIA`
--

DROP TABLE IF EXISTS `AUTORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTORIA` (
  `NR_OBRA` int NOT NULL,
  `ID_AUTOR` int NOT NULL,
  PRIMARY KEY (`NR_OBRA`,`ID_AUTOR`),
  KEY `ID_AUTOR` (`ID_AUTOR`),
  CONSTRAINT `AUTORIA_ibfk_1` FOREIGN KEY (`NR_OBRA`) REFERENCES `OBRA` (`NR_OBRA`) ON DELETE RESTRICT,
  CONSTRAINT `AUTORIA_ibfk_2` FOREIGN KEY (`ID_AUTOR`) REFERENCES `AUTOR` (`ID_AUTOR`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTORIA`
--

LOCK TABLES `AUTORIA` WRITE;
/*!40000 ALTER TABLE `AUTORIA` DISABLE KEYS */;
INSERT INTO `AUTORIA` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `AUTORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDITORA`
--

DROP TABLE IF EXISTS `EDITORA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDITORA` (
  `ID_EDITORA` char(5) NOT NULL,
  `NOME_FANTASIA` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_EDITORA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDITORA`
--

LOCK TABLES `EDITORA` WRITE;
/*!40000 ALTER TABLE `EDITORA` DISABLE KEYS */;
INSERT INTO `EDITORA` VALUES ('P001','Editora ABC'),('P002','Editora XYZ'),('P003','Editora Global'),('P004','Editora Novo Mundo'),('P005','Editora Primavera'),('P006','Editora Ouro'),('P007','Editora Horizonte'),('P008','Editora Infinito'),('P009','Editora Aquarela'),('P010','Editora Legado');
/*!40000 ALTER TABLE `EDITORA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENERO`
--

DROP TABLE IF EXISTS `GENERO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GENERO` (
  `ID_GENERO` char(3) NOT NULL,
  `DESCRICAO` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_GENERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENERO`
--

LOCK TABLES `GENERO` WRITE;
/*!40000 ALTER TABLE `GENERO` DISABLE KEYS */;
INSERT INTO `GENERO` VALUES ('ADV','Aventura'),('BIO','Biografia'),('FIC','Ficção'),('HIS','História'),('HOR','Terror'),('MYS','Mistério'),('POE','Poesia'),('ROM','Romance'),('SFI','Ficção Científica'),('TEC','Tecnologia');
/*!40000 ALTER TABLE `GENERO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIVRO`
--

DROP TABLE IF EXISTS `LIVRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LIVRO` (
  `NR_LIVRO` int NOT NULL AUTO_INCREMENT,
  `DATA_AQUISICAO` date NOT NULL,
  `EDICAO` int DEFAULT NULL,
  `NR_OBRA` int NOT NULL,
  `ID_EDITORA` char(5) NOT NULL,
  PRIMARY KEY (`NR_LIVRO`),
  KEY `NR_OBRA` (`NR_OBRA`),
  KEY `ID_EDITORA` (`ID_EDITORA`),
  CONSTRAINT `LIVRO_ibfk_1` FOREIGN KEY (`NR_OBRA`) REFERENCES `OBRA` (`NR_OBRA`) ON DELETE RESTRICT,
  CONSTRAINT `LIVRO_ibfk_2` FOREIGN KEY (`ID_EDITORA`) REFERENCES `EDITORA` (`ID_EDITORA`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVRO`
--

LOCK TABLES `LIVRO` WRITE;
/*!40000 ALTER TABLE `LIVRO` DISABLE KEYS */;
INSERT INTO `LIVRO` VALUES (1,'2024-01-10',1,1,'P001'),(2,'2024-01-15',1,2,'P002'),(3,'2024-02-01',1,3,'P003'),(4,'2024-03-01',1,4,'P001'),(5,'2024-03-10',1,5,'P004'),(6,'2024-04-01',1,6,'P005'),(7,'2024-04-15',1,7,'P006'),(8,'2024-05-01',1,8,'P007'),(9,'2024-05-15',1,9,'P008'),(10,'2024-06-01',1,10,'P009');
/*!40000 ALTER TABLE `LIVRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVIMENTACAO`
--

DROP TABLE IF EXISTS `MOVIMENTACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVIMENTACAO` (
  `MATRICULA` int NOT NULL,
  `NR_LIVRO` int NOT NULL,
  `DATA_EMPRESTIMO` date NOT NULL,
  `DATA_PREVISTA` date NOT NULL,
  `DATA_DEVOLUCAO` date DEFAULT NULL,
  `MULTA` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`,`NR_LIVRO`,`DATA_EMPRESTIMO`),
  KEY `NR_LIVRO` (`NR_LIVRO`),
  CONSTRAINT `MOVIMENTACAO_ibfk_1` FOREIGN KEY (`MATRICULA`) REFERENCES `USUARIO` (`MATRICULA`) ON DELETE RESTRICT,
  CONSTRAINT `MOVIMENTACAO_ibfk_2` FOREIGN KEY (`NR_LIVRO`) REFERENCES `LIVRO` (`NR_LIVRO`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVIMENTACAO`
--

LOCK TABLES `MOVIMENTACAO` WRITE;
/*!40000 ALTER TABLE `MOVIMENTACAO` DISABLE KEYS */;
INSERT INTO `MOVIMENTACAO` VALUES (1,1,'2024-07-01','2024-07-15',NULL,NULL),(2,2,'2024-07-05','2024-07-20',NULL,NULL),(3,3,'2024-07-10','2024-07-25','2024-07-20',5.00),(4,4,'2024-07-12','2024-07-26',NULL,NULL),(5,5,'2024-07-15','2024-07-30','2024-07-28',2.00),(6,6,'2024-07-20','2024-08-05',NULL,NULL),(7,7,'2024-07-22','2024-08-10',NULL,NULL),(8,8,'2024-07-25','2024-08-15','2024-08-10',3.00),(9,9,'2024-07-28','2024-08-20',NULL,NULL),(10,10,'2024-07-30','2024-08-25',NULL,NULL);
/*!40000 ALTER TABLE `MOVIMENTACAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OBRA`
--

DROP TABLE IF EXISTS `OBRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OBRA` (
  `NR_OBRA` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(60) NOT NULL,
  `ID_GENERO` char(3) NOT NULL,
  PRIMARY KEY (`NR_OBRA`),
  KEY `ID_GENERO` (`ID_GENERO`),
  CONSTRAINT `OBRA_ibfk_1` FOREIGN KEY (`ID_GENERO`) REFERENCES `GENERO` (`ID_GENERO`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OBRA`
--

LOCK TABLES `OBRA` WRITE;
/*!40000 ALTER TABLE `OBRA` DISABLE KEYS */;
INSERT INTO `OBRA` VALUES (1,'Harry Potter e a Pedra Filosofal','FIC'),(2,'Fundação','TEC'),(3,'O Iluminado','FIC'),(4,'Orgulho e Preconceito','ROM'),(5,'1984','BIO'),(6,'Assassinato no Expresso Oriente','MYS'),(7,'O Senhor dos Anéis','FIC'),(8,'As Aventuras de Tom Sawyer','ADV'),(9,'O Grande Gatsby','ROM'),(10,'O Velho e o Mar','BIO');
/*!40000 ALTER TABLE `OBRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `MATRICULA` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(50) NOT NULL,
  `SEXO` char(1) NOT NULL,
  `DATA_NASCIMENTO` date NOT NULL,
  `ENDERECO` varchar(60) NOT NULL,
  PRIMARY KEY (`MATRICULA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES (1,'Carlos Silva','M','1980-05-15','Rua das Flores, 123'),(2,'Maria Oliveira','F','1990-07-22','Avenida Central, 456'),(3,'Pedro Santos','M','1985-09-30','Praça do Comércio, 789'),(4,'Ana Costa','F','1982-04-12','Rua dos Limoeiros, 321'),(5,'Roberto Almeida','M','1978-11-05','Avenida das Palmeiras, 654'),(6,'Juliana Pereira','F','1995-03-22','Rua dos Coqueiros, 987'),(7,'Eduardo Mendes','M','1988-06-17','Rua das Orquídeas, 234'),(8,'Laura Gomes','F','1992-08-30','Rua das Acácias, 567'),(9,'Bruno Lima','M','1987-12-25','Avenida dos Jacarandás, 890'),(10,'Clara Martins','F','1991-09-15','Praça das Azaléias, 345');
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 19:55:34
