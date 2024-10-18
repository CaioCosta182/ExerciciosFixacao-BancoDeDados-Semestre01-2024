CREATE DATABASE  IF NOT EXISTS `estacionamento` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estacionamento`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: estacionamento
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cpf` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `datNasc` date DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=9103 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (73,'Marta Sidney','1970-04-15'),(1234,'Fernanda Marinho','1998-12-05'),(3456,'Davi Passos','1973-02-10'),(5678,'Jose Geraldo Silva','1982-05-03'),(9102,'Alice Alves','1981-07-03');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciona`
--

DROP TABLE IF EXISTS `estaciona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estaciona` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `patio_num` int DEFAULT NULL,
  `veiculo_placa` varchar(8) DEFAULT NULL,
  `dtEntrada` date DEFAULT NULL,
  `dtSaida` date DEFAULT NULL,
  `hrEntrada` varchar(10) DEFAULT NULL,
  `hrSaida` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `patio_num` (`patio_num`),
  KEY `veiculo_placa` (`veiculo_placa`),
  CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`patio_num`) REFERENCES `patio` (`num`),
  CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`veiculo_placa`) REFERENCES `veiculo` (`placa`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciona`
--

LOCK TABLES `estaciona` WRITE;
/*!40000 ALTER TABLE `estaciona` DISABLE KEYS */;
INSERT INTO `estaciona` VALUES (1,2,'JJJ-2020','2020-09-10','2020-09-11','12:00','09:00'),(2,1,'GGG-1010','2020-11-01','2020-11-01','14:00','18:00'),(3,1,'HHH-1010','2020-06-10','2020-06-15','16:37','08:00'),(4,3,'JJJ-2020','2019-01-25','2019-01-25','07:30','18:47'),(5,4,'FFF-9999','2018-09-08','2018-09-08','10:03','14:06'),(6,3,'HHH-1010','2009-04-10','2009-04-10','12:34','13:33'),(7,4,'YYY-0101','2020-05-10','2020-05-10','14:46','18:23'),(8,3,'UUU-5555','2020-10-13','2020-10-13','12:03','13:50'),(9,1,'TTT-3333','2020-10-13','2020-10-13','09:12','15:33'),(10,2,'JEG-1010','2020-10-13','2020-10-13','10:08','20:18'),(11,1,'HHH-1010','2020-10-31','2020-10-31','17:38','19:45');
/*!40000 ALTER TABLE `estaciona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `codMod` int NOT NULL AUTO_INCREMENT,
  `desc_2` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`codMod`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Fiesta'),(2,'Gol'),(3,'Corola'),(4,'Fiat Uno'),(5,'Corsa'),(6,'HB20');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patio`
--

DROP TABLE IF EXISTS `patio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patio` (
  `num` int NOT NULL AUTO_INCREMENT,
  `ender` varchar(40) DEFAULT NULL,
  `capacidade` int DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patio`
--

LOCK TABLES `patio` WRITE;
/*!40000 ALTER TABLE `patio` DISABLE KEYS */;
INSERT INTO `patio` VALUES (1,'Rua A',100),(2,'Rua B',50),(3,'Rua C',75),(4,'Rua D',65);
/*!40000 ALTER TABLE `patio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `placa` varchar(8) NOT NULL,
  `modelo_codMod` int DEFAULT NULL,
  `cliente_cpf` int DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`placa`),
  KEY `modelo_codMod` (`modelo_codMod`),
  KEY `cliente_cpf` (`cliente_cpf`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`modelo_codMod`) REFERENCES `modelo` (`codMod`),
  CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES ('AAA-2222',1,5678,'Azul'),('BBB-5555',5,1234,'Prata'),('FFF-9999',2,73,'Verde'),('GGG-1010',5,3456,'Prata'),('HHH-1010',1,1234,'Branco'),('JEG-1010',2,9102,'Verde'),('JJJ-2020',3,9102,'Dourado'),('TTT-3333',3,3456,'Branco'),('UUU-5555',4,5678,'Vermelho'),('YYY-0101',6,73,'Vermelho');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22 20:23:44
desc cliente;
desc veiculo;


-- Exiba a placa e o nome dos donos de todos os veículos.
select cliente.nome, veiculo.placa
from cliente join veiculo
on cliente.cpf = veiculo.cliente_cpf;

-- pode ser feito tambem da forma a seguir
select cliente.nome, veiculo.placa
from cliente, veiculo
where cliente.cpf = veiculo.cliente_cpf;

-- 2. Exiba o CPF e o nome do cliente que possui o veículo de placa “JJJ-2020”
select c.nome, c.cpf
from cliente as c join veiculo as v
on c.cpf = v.cliente_cpf
where v.placa = 'JJJ-2020';

select c.nome, c.cpf
from cliente as c, veiculo as v
where c.cpf = v.cliente_cpf and v.placa = 'jjj-2020';

-- 3. Exiba a placa e a cor dos veículos que estão estacionados no patio de número 1.
select v.placa, v.cor
from veiculo as v join estaciona as e 
on v.placa = e.veiculo_placa
where e.patio_num = 1;

-- 4. Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa
-- “JEG-1010”.
select p.ender, e.dtEntrada, e.dtSaida
from estaciona as e join patio as p
on e.patio_num = p.num
where e.veiculo_placa = 'JEG-1010';
-- utilizando produto cartesiano para solucionar a questão 04
select p.ender, e.dtEntrada, e.dtSaida
from estaciona as e, patio as p
where e.patio_num = p.num and e.veiculo_placa = 'JEG-1010';

-- 5. Exiba a quantidade de vezes que os veículos de cor branco estacionaram.
select count(*)
from veiculo as v join estaciona as e
on v.placa = e.veiculo_placa
where v.cor like 'branc%';

-- 6. Liste todos os clientes que possuem carro de modelo 1.
select c.nome
from veiculo as v join cliente as c
on v.cliente_cpf = c.cpf
where v.modelo_codMod = 1;
-- conferindo resultado Ex06
select c.nome, c.cpf, m.desc_2, v.placa, v.modelo_codMod, v.cor
from cliente as c join veiculo as v
join modelo as m
on c.cpf = v.cliente_cpf and v.modelo_codMod = m.codMod;

-- 7. Exiba o nome dos clientes que estacionaram veículos no pátio 2.
select distinct(c.nome)
from cliente as c join veiculo as v
join estaciona as e
on c.cpf = v.cliente_cpf and v.placa =  e.veiculo_placa
where e.patio_num = 2;

-- 8. Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos.
select v.placa, c.nome, m.desc_2
from cliente as c join veiculo as v join modelo as m
on c.cpf = v.cliente_cpf
and m.codMod = v.modelo_codMod;

-- 9. Sobre os carros de modelo corola ou HB20 deseja saber: Nome do cliente/proprietário,
-- placa, data de entrada e data de saída, o número do pátio e seu endereço.
select c.nome, v.placa, e.dtEntrada, e.dtSaida, p.num, p.ender
from cliente as c join veiculo as v 
join estaciona as e join patio as p
join modelo as m
on c.cpf = v.cliente_cpf 
and v.placa = e.veiculo_placa
and m.codMod = v.modelo_codMod
and e.patio_num = p.num 
where m.desc_2 = 'corola'or m.desc_2 = 'HB20';

-- 10. Exiba o CPF, nome do cliente que possui o veículo cujo código do
-- estacionamento(estaciona) é 3
select c.cpf,c.nome, e.cod, e.veiculo_placa
from cliente as c 
join veiculo as v 
join estaciona as e 
on c.cpf = v.cliente_cpf
and v.placa = e.veiculo_placa
where e.cod = 3;