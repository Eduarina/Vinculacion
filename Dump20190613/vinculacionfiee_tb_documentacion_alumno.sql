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
-- Table structure for table `tb_documentacion_alumno`
--

DROP TABLE IF EXISTS `tb_documentacion_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tb_documentacion_alumno` (
  `idDocumentacionAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `idEstudiante` int(11) DEFAULT NULL,
  `idDocumento` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `path` text,
  PRIMARY KEY (`idDocumentacionAlumno`),
  KEY `fk_Estudiantes_Documetacion_idx` (`idEstudiante`),
  KEY `fk_Documentos_Documentacion_idx` (`idDocumento`),
  KEY `fk_Estado_Documentacion_idx` (`Estado`),
  CONSTRAINT `fk_Documentos_Documentacion` FOREIGN KEY (`idDocumento`) REFERENCES `ctg_documentos` (`idDocumento`),
  CONSTRAINT `fk_Estado_Documentacion` FOREIGN KEY (`Estado`) REFERENCES `ctg_estados` (`idEstado`),
  CONSTRAINT `fk_Estudiantes_Documetacion` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_estudiantes` (`idEstudiate`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_documentacion_alumno`
--

LOCK TABLES `tb_documentacion_alumno` WRITE;
/*!40000 ALTER TABLE `tb_documentacion_alumno` DISABLE KEYS */;
INSERT INTO `tb_documentacion_alumno` VALUES (11,13,6,4,'KARINA SORIANO\\Carta de Aceptación.xlsx'),(12,13,7,4,'KARINA SORIANO\\Formato de asignación de proyecto.jpg'),(13,13,8,3,NULL),(14,13,9,3,NULL),(15,13,10,3,NULL),(16,14,6,3,NULL),(17,14,7,3,NULL),(18,14,8,3,NULL),(19,14,9,3,NULL),(20,14,10,3,NULL),(21,15,6,4,'ALSDKJlk\\Carta de Aceptación.png'),(22,15,7,4,'ALSDKJlk\\Formato de asignación de proyecto.jpg'),(23,15,8,4,'ALSDKJlk\\Horario servicio social.png'),(24,15,9,3,NULL),(25,15,10,3,NULL),(26,16,6,3,NULL),(27,16,7,3,NULL),(28,16,8,3,NULL),(29,16,9,3,NULL),(30,16,10,3,NULL),(31,17,6,3,NULL),(32,17,7,3,NULL),(33,17,8,3,NULL),(34,17,9,3,NULL),(35,17,10,3,NULL),(36,18,6,3,NULL),(37,18,7,3,NULL),(38,18,8,3,NULL),(39,18,9,3,NULL),(40,18,10,3,NULL);
/*!40000 ALTER TABLE `tb_documentacion_alumno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-13 20:16:25
