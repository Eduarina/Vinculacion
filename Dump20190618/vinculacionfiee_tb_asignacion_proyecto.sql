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
-- Table structure for table `tb_asignacion_proyecto`
--

DROP TABLE IF EXISTS `tb_asignacion_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_asignacion_proyecto` (
  `idAsignacionProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `idEstudiante` int(11) DEFAULT NULL,
  `idProyecto` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAsignacionProyecto`),
  KEY `fk_Estudiante_AsignacionProyecto_idx` (`idEstudiante`),
  KEY `fk_Proyecto_AsignacionProyecto_idx` (`idProyecto`),
  KEY `fk_Estado_AsignacionProyecto_idx` (`Estado`),
  CONSTRAINT `fk_Estado_AsignacionProyecto` FOREIGN KEY (`Estado`) REFERENCES `ctg_estados` (`idEstado`),
  CONSTRAINT `fk_Estudiante_AsignacionProyecto` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_estudiantes` (`idEstudiate`),
  CONSTRAINT `fk_Proyecto_AsignacionProyecto` FOREIGN KEY (`idProyecto`) REFERENCES `tb_proyectos` (`idProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_asignacion_proyecto`
--

LOCK TABLES `tb_asignacion_proyecto` WRITE;
/*!40000 ALTER TABLE `tb_asignacion_proyecto` DISABLE KEYS */;
INSERT INTO `tb_asignacion_proyecto` VALUES (11,16,1,5),(12,17,2,6);
/*!40000 ALTER TABLE `tb_asignacion_proyecto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-18 18:11:07
