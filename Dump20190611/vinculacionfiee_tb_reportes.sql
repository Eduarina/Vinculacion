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
-- Table structure for table `tb_reportes`
--

DROP TABLE IF EXISTS `tb_reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_reportes` (
  `idReporte` int(11) NOT NULL AUTO_INCREMENT,
  `Num_Reporte` int(11) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `Actividades` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `Problemas` varchar(100) DEFAULT NULL,
  `Soluciones` varchar(100) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Fecha` varchar(20) DEFAULT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `Vbo_Maestro` text,
  `VBo_Encargado` text,
  PRIMARY KEY (`idReporte`),
  KEY `fk_AsignacionProyecto_Reporte_idx` (`idProyecto`),
  KEY `fk_Estado_Reporte_idx` (`Estado`),
  KEY `idEstudiante` (`idEstudiante`),
  CONSTRAINT `fk_AsignacionProyecto_Reporte` FOREIGN KEY (`idProyecto`) REFERENCES `tb_asignacion_proyecto` (`idAsignacionProyecto`),
  CONSTRAINT `fk_Estado_Reporte` FOREIGN KEY (`Estado`) REFERENCES `ctg_estados` (`idEstado`),
  CONSTRAINT `tb_reportes_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reportes`
--

LOCK TABLES `tb_reportes` WRITE;
/*!40000 ALTER TABLE `tb_reportes` DISABLE KEYS */;
INSERT INTO `tb_reportes` VALUES (10,1,4,1,'Actividades generales','Descripción de las actividades','Problemas encontrados','Soluciones empleadas',1,'09/06/2019',30,'1','1'),(11,1,4,2,'asda','jkaskdh',NULL,NULL,1,'09/06/2019',30,'1','1');
/*!40000 ALTER TABLE `tb_reportes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-11 23:27:57
