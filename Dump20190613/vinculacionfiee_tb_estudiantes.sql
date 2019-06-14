-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: vinculacionfiee
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_estudiantes`
--

DROP TABLE IF EXISTS `tb_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_estudiantes` (
  `idEstudiate` int(11) NOT NULL AUTO_INCREMENT,
  `Matricula` varchar(10) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Carrera` int(11) DEFAULT NULL,
  `Celular` varchar(12) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Semestre` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `firma` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEstudiate`),
  KEY `fk_Estado_Estudiantes_idx` (`idUsuario`),
  KEY `fk_Carrera_Estudiantes` (`Carrera`),
  KEY `fk_Estados_Estudiantes_idx` (`Estado`),
  CONSTRAINT `fk_Carrera_Estudiantes` FOREIGN KEY (`Carrera`) REFERENCES `ctg_carreras` (`idCarrera`),
  CONSTRAINT `fk_Estados_Estudiantes` FOREIGN KEY (`Estado`) REFERENCES `ctg_estados` (`idEstado`),
  CONSTRAINT `fk_Usuario_Estudiantes` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estudiantes`
--

LOCK TABLES `tb_estudiantes` WRITE;
/*!40000 ALTER TABLE `tb_estudiantes` DISABLE KEYS */;
INSERT INTO `tb_estudiantes` VALUES (13,'S12001347','KSORIANO@HOTMAIL.COM',5,'2299191094','2299191094',8,1,30,'\\KARINA SORIANO\\firma.png'),(14,'S15001119','ARUTH@HOTMAIL.COM',7,'2299183992','2299183992',8,1,40,NULL),(15,'ASDJKH','LASDHKKLAJHSD@ASIDHAKLDH.COM',5,'123456789','2345678',8,1,41,NULL),(16,'S15001347','S15001347@ESTUDIANTES.UV.MX',5,'2291847482','2291847482',8,1,42,NULL),(17,'345678','OLGUIN@UV.MX',5,'12345678','23456789',10,1,43,NULL),(18,'234567','123456789@UV.MX',5,'123456789','123456789',8,1,44,NULL);
/*!40000 ALTER TABLE `tb_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-13 20:16:23
