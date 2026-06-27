CREATE DATABASE  IF NOT EXISTS `sgost` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sgost`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sgost
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `ID_ADMINISTRADOR` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `Correo` varchar(100) NOT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_ADMINISTRADOR`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'juan Parra','Admi1','$2b$10$gyxexy5Rpmbc82uQRXZ0K.5sIrZnEJfJHn5YcsgnUX1CmGU76Qy4K','Juanpxxx@gmail.com','Cedula de ciudadania','3174569855'),(2,'Alejo','Admi2','$2b$10$/qs04UGhpdaVvbaL2D0Ik.2E9F2rDTJKTvYkxZgy6rTdd3V9KkO.m','Alejoxxx@gmail.com','Cedula de ciudadania','3124567891'),(3,'Administrador numero 3','Admi3','$2b$10$1sCXQYJjhnnNmNOqt5rXGuLK.2OPN2B3XdpskNKLtEHHv4H7c/ZyW','administradornumerTres@gmail.com','Cedula de ciudadania','3124567891'),(4,'Administrador numero 4','Admi4','$2b$10$5meC508xnDPX5GptfhRX7e4huNXrxB6XMWKkEgDUhCOuUJzTqw56K','administradornumer4@gmail.com','Cedula de extranjeria','3124567891');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLIENTES` int(11) NOT NULL AUTO_INCREMENT,
  `Ubicacion` varchar(40) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `TipoDocumento` varchar(45) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_CLIENTES`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Bogota D.C','User Cliente nuevo','user','$2b$10$2tavQabXiHOrBK2jrfHD/eZoGs0UMUdk7.pYmht/Dz15pPEQBqS5G','CC','userxxx@gmail.com','3124567891'),(2,'Bogota D.C','usuario numero dos','usuario2','$2b$10$GcwXhXLUhg9cnvQ7X4dOkuYqPvlohq0lTfBOatketE5C5PH5nJOpW','CC','usuario2@gmai.com','3124567891'),(3,'BOGOTA D.C','CLIENTE TRE','cli3','$2b$10$Hk4Ou4nSDXrA6BafuWsNkO27exwdl2vfrzwpEbxI2djzdKQGl71M2','CC','cli3xxx@gmail.com','3123456789'),(4,'Bogota','cliente numero 4','cli4','$2b$10$sbu7QB.OUMKegK2XQsOtSuWTc6wiD/3VAzhzEo2fKyYXTl/h.vKTK','CC','cli4xxxx@gmail.com','321564891');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `ID_COMPROBANTE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_INFORME` int(11) DEFAULT NULL,
  `ID_CLIENTES` int(11) NOT NULL,
  `ID_ADMINISTRADOR` int(11) NOT NULL,
  `Monto` varchar(100) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado_pago` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_COMPROBANTE`),
  KEY `comp_ibfk_1` (`ID_INFORME`),
  KEY `comp_ibfk_2` (`ID_CLIENTES`),
  KEY `comp_ibfk_3` (`ID_ADMINISTRADOR`),
  CONSTRAINT `comp_ibfk_1` FOREIGN KEY (`ID_INFORME`) REFERENCES `informe` (`ID_INFORME`) ON DELETE CASCADE,
  CONSTRAINT `comp_ibfk_2` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`) ON DELETE CASCADE,
  CONSTRAINT `comp_ibfk_3` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_orden_servicio`
--

DROP TABLE IF EXISTS `detalles_orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_orden_servicio` (
  `ID_DETALLES_ORDEN_SERVICIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDEN_SERVICIO` int(11) NOT NULL,
  `ID_SERVICIOS` int(11) DEFAULT NULL,
  `ID_PRODUCTOS` int(11) DEFAULT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_DETALLES_ORDEN_SERVICIO`),
  KEY `dos_ibfk_1` (`ID_ORDEN_SERVICIO`),
  KEY `dos_ibfk_2` (`ID_SERVICIOS`),
  KEY `dos_ibfk_3` (`ID_PRODUCTOS`),
  CONSTRAINT `dos_ibfk_1` FOREIGN KEY (`ID_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`) ON DELETE CASCADE,
  CONSTRAINT `dos_ibfk_2` FOREIGN KEY (`ID_SERVICIOS`) REFERENCES `servicios` (`ID_SERVICIOS`) ON DELETE CASCADE,
  CONSTRAINT `dos_ibfk_3` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_orden_servicio`
--

LOCK TABLES `detalles_orden_servicio` WRITE;
/*!40000 ALTER TABLE `detalles_orden_servicio` DISABLE KEYS */;
INSERT INTO `detalles_orden_servicio` VALUES (1,1,3,3,'14',450000.00),(2,2,1,1,'100',332000.00),(3,3,3,4,'20',470000.00),(4,4,4,3,'10',750000.00),(5,5,2,2,'30',380000.00);
/*!40000 ALTER TABLE `detalles_orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `ID_HISTORIAL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ORDEN_SERVICIO` int(11) NOT NULL,
  `ID_COMPROBANTE` int(11) NOT NULL,
  `ID_INFORME` int(11) NOT NULL,
  `ID_TECNICOS` int(11) NOT NULL,
  `ID_CLIENTES` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`ID_HISTORIAL`),
  KEY `hist_ibfk_1` (`ID_ORDEN_SERVICIO`),
  KEY `hist_ibfk_2` (`ID_COMPROBANTE`),
  KEY `hist_ibfk_3` (`ID_INFORME`),
  KEY `hist_ibfk_4` (`ID_TECNICOS`),
  KEY `hist_ibfk_5` (`ID_CLIENTES`),
  CONSTRAINT `hist_ibfk_1` FOREIGN KEY (`ID_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`) ON DELETE CASCADE,
  CONSTRAINT `hist_ibfk_2` FOREIGN KEY (`ID_COMPROBANTE`) REFERENCES `comprobante` (`ID_COMPROBANTE`) ON DELETE CASCADE,
  CONSTRAINT `hist_ibfk_3` FOREIGN KEY (`ID_INFORME`) REFERENCES `informe` (`ID_INFORME`) ON DELETE CASCADE,
  CONSTRAINT `hist_ibfk_4` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`) ON DELETE CASCADE,
  CONSTRAINT `hist_ibfk_5` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informe`
--

DROP TABLE IF EXISTS `informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informe` (
  `ID_INFORME` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DETALLES_ORDEN_SERVICIO` int(11) NOT NULL,
  `ID_ADMINISTRADOR` int(11) NOT NULL,
  `ID_TECNICOS` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_INFORME`),
  KEY `inf_ibfk_1` (`ID_DETALLES_ORDEN_SERVICIO`),
  KEY `inf_ibfk_2` (`ID_ADMINISTRADOR`),
  KEY `inf_ibfk_3` (`ID_TECNICOS`),
  CONSTRAINT `inf_ibfk_1` FOREIGN KEY (`ID_DETALLES_ORDEN_SERVICIO`) REFERENCES `detalles_orden_servicio` (`ID_DETALLES_ORDEN_SERVICIO`) ON DELETE CASCADE,
  CONSTRAINT `inf_ibfk_2` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`) ON DELETE CASCADE,
  CONSTRAINT `inf_ibfk_3` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motos`
--

DROP TABLE IF EXISTS `motos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motos` (
  `ID_MOTOS` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CLIENTES` int(11) NOT NULL,
  `Placa` varchar(20) NOT NULL,
  `Modelo` varchar(100) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Recorrido` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_MOTOS`),
  KEY `motos_ibfk_1` (`ID_CLIENTES`),
  CONSTRAINT `motos_ibfk_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES (1,1,'BGT657','200','DUKE','120000'),(2,2,'BGT657','1290','DUKE','150000'),(3,3,'DFH360','390','DUKE','30000'),(4,4,'DFH360','390','DUKE','30000');
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `ID_ORDEN_SERVICIO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CLIENTES` int(11) NOT NULL,
  `ID_ADMINISTRADOR` int(11) NOT NULL,
  `ID_TECNICOS` int(11) NOT NULL,
  `ID_MOTOS` int(11) NOT NULL,
  `Fecha_inicio` datetime NOT NULL,
  `Fecha_estimada` datetime NOT NULL,
  `Fecha_fin` datetime DEFAULT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ORDEN_SERVICIO`),
  KEY `os_ibfk_1` (`ID_CLIENTES`),
  KEY `os_ibfk_2` (`ID_ADMINISTRADOR`),
  KEY `os_ibfk_3` (`ID_TECNICOS`),
  KEY `os_ibfk_4` (`ID_MOTOS`),
  CONSTRAINT `os_ibfk_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`) ON DELETE CASCADE,
  CONSTRAINT `os_ibfk_2` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`) ON DELETE CASCADE,
  CONSTRAINT `os_ibfk_3` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`) ON DELETE CASCADE,
  CONSTRAINT `os_ibfk_4` FOREIGN KEY (`ID_MOTOS`) REFERENCES `motos` (`ID_MOTOS`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,1,1,1,1,'2026-06-27 01:43:22','2026-06-28 01:43:22',NULL,'PENDIENTE'),(2,1,1,1,1,'2026-06-27 02:04:19','2026-06-28 02:04:19',NULL,'PENDIENTE'),(3,3,1,1,3,'2026-06-27 03:37:11','2026-06-28 03:37:11',NULL,'PENDIENTE'),(4,3,1,1,3,'2026-06-27 03:59:21','2026-06-28 03:59:21',NULL,'PENDIENTE'),(5,1,1,1,1,'2026-06-27 05:26:38','2026-06-28 05:26:38',NULL,'PENDIENTE');
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_PRODUCTOS` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(100) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTOS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Lubricantes y refrigerantes','Motorex','Aceite','2',120000.00,8,'Disponibles'),(2,'Accesorios','Rombo','Cadena','30',180000.00,5,'Disponibles'),(3,'Accesorios','Minda','Direccionales','10',150000.00,15,'Disponibles'),(4,'Accesorios','DUKE','CHAQUETA ROCKET','20',170000.00,1,'Disponibles');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `ID_SERVICIOS` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Precio` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_SERVICIOS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Mantenimiento preventivo','Mantenimientos','100','No disponible','212000'),(2,'Reparacion por daños','Reparaciones','30','Disponible','200000'),(3,'Instalaciones de accesorios','Instalaciones','14','Disponible','300000'),(4,'Diagnosticos motor','Diagnosticos','10','Disponible','600000');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `ID_TECNICOS` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TECNICOS`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,'Camilo','tec1','$2b$10$cXmPbqyYZqCSdB4d0S2JX.s2xVsBZ6DpkWA4IX.D16eouATQ00iE.','CC','tecnico2@email.com','3001234567'),(2,'Alejo','tec2','$2b$10$VPMotdHtLLA1uJIctzY0OO.VNHYIETk8qaJSCW4FOVxCyqE52VAmG','CC','tecnico2@email.com','300123456'),(3,'TED','tec3','$2b$10$dYKxvMnyw5BAGtw/YECmSOGzvp9bEKo7nJXHgtI25bVlWfXR9EeEu','Pasaporte','Tedxxx@gmail.com','3124567891'),(4,'JET','tec4','$2b$10$ch6OBKOG/r8E4B.0HRvDdeliNRpdpPlZaNPImSIoFElT6RTdfhi6q','Cedula de ciudadania','jetxxx@gmail.com','3174569852');
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-27  0:34:57
