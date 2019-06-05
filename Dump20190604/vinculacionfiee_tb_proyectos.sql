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
-- Table structure for table `tb_proyectos`
--

DROP TABLE IF EXISTS `tb_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_proyectos` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(45) DEFAULT NULL,
  `Dependencia` varchar(45) DEFAULT NULL,
  `Horario` varchar(45) DEFAULT NULL,
  `FechaInicio` varchar(45) DEFAULT NULL,
  `FechaFin` varchar(45) DEFAULT NULL,
  `Objetivo` varchar(45) DEFAULT NULL,
  `Actividades` varchar(100) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Aspirantes` int(11) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `idEncargado` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProyecto`),
  KEY `fk_Encargado_Proyecto_idx` (`idEncargado`),
  KEY `fk_Estado_Proyecto_idx` (`Estado`),
  KEY `idEstudiante` (`idEstudiante`),
  CONSTRAINT `fk_Encargado_Proyecto` FOREIGN KEY (`idEncargado`) REFERENCES `tb_encargados` (`idEncargado`),
  CONSTRAINT `fk_Estado_Proyecto` FOREIGN KEY (`Estado`) REFERENCES `ctg_estados` (`idEstado`),
  CONSTRAINT `tb_proyectos_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proyectos`
--

LOCK TABLES `tb_proyectos` WRITE;
/*!40000 ALTER TABLE `tb_proyectos` DISABLE KEYS */;
INSERT INTO `tb_proyectos` VALUES (1,'TITULO','DEPENDENCIA','HORARIO','04/06/2019','06/06/2019','OBJETIVOS','ACTIVIDADES','UBICACION',0,'Servicio Social',2,1,NULL);
/*!40000 ALTER TABLE `tb_proyectos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 23:20:39
