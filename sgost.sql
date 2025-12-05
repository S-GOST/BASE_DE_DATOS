-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
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
  `ID_ADMINISTRADOR` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `Correo` varchar(100) NOT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_ADMINISTRADOR`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES ('ADM1','JuanP','admi1','$2y$12$nDYUThk.eATWvBATzZmr3.Mk5B3pddtohoLpFyVm21QrPux4T75MS','Juanpxxx@gmail.com','Cedula de Ciudadania','322546987'),('ADM2','Alejo','admi2','$2y$12$H8qe.WjD1ERPsxb45ID.k.6xppKmULdUOTnp4LIZmB9z0DEYDXgyG','Alejopxxx@gmail.com','Pasaporte','325586785');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_CLIENTES` varchar(20) NOT NULL,
  `Ubicacion` varchar(40) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `TipoDocumento` varchar(45) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_CLIENTES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('CLI1','Bogota','Bok','Nit','Bokxxx@gmail.com','3002125478'),('CLI2','Bogota','Rosa','Cedula de Ciudadania','Rosaxxx@gmail.com','311202547'),('CLI3','Cundinamarca','Teodoro','Pasaporte','Teodoroxxx@gmail.com','312256478'),('CLI4','Bogota','Terry','Cedula de Ciudadania','Terryxxx@gmail.com','300785141');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `ID_COMPROBANTE` varchar(20) NOT NULL,
  `ID_INFORME` varchar(20) DEFAULT NULL,
  `ID_CLIENTES` varchar(20) DEFAULT NULL,
  `ID_ADMINISTRADOR` varchar(20) DEFAULT NULL,
  `Monto` varchar(100) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado_pago` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_COMPROBANTE`),
  KEY `ID_INFORME` (`ID_INFORME`),
  KEY `ID_CLIENTES` (`ID_CLIENTES`),
  KEY `ID_ADMINISTRADOR` (`ID_ADMINISTRADOR`),
  CONSTRAINT `comprobante_ibfk_1` FOREIGN KEY (`ID_INFORME`) REFERENCES `informe` (`ID_INFORME`),
  CONSTRAINT `comprobante_ibfk_2` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`),
  CONSTRAINT `comprobante_ibfk_3` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `ID_DETALLES_ORDEN_SERVICIO` varchar(20) NOT NULL,
  `ID_ORDEN_SERVICIO` varchar(20) DEFAULT NULL,
  `ID_SERVICIOS` varchar(20) DEFAULT NULL,
  `ID_PRODUCTOS` varchar(20) DEFAULT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_DETALLES_ORDEN_SERVICIO`),
  KEY `ID_ORDEN_SERVICIO` (`ID_ORDEN_SERVICIO`),
  KEY `ID_SERVICIOS` (`ID_SERVICIOS`),
  KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`),
  CONSTRAINT `detalles_orden_servicio_ibfk_1` FOREIGN KEY (`ID_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`),
  CONSTRAINT `detalles_orden_servicio_ibfk_2` FOREIGN KEY (`ID_SERVICIOS`) REFERENCES `servicios` (`ID_SERVICIOS`),
  CONSTRAINT `detalles_orden_servicio_ibfk_3` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_orden_servicio`
--

LOCK TABLES `detalles_orden_servicio` WRITE;
/*!40000 ALTER TABLE `detalles_orden_servicio` DISABLE KEYS */;
INSERT INTO `detalles_orden_servicio` VALUES ('DET1','ORD1','SER1','PRO2','15','En espera',180.00),('DET2','ORD2','SER2','PRO3','14','Finalizada',200.00),('DET3','ORD3','SER4','PRO1','30','En espera',50.00);
/*!40000 ALTER TABLE `detalles_orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `ID_HISTORIAL` varchar(20) NOT NULL,
  `ID_ORDEN_SERVICIO` varchar(20) DEFAULT NULL,
  `ID_COMPROBANTE` varchar(20) DEFAULT NULL,
  `ID_INFORME` varchar(20) DEFAULT NULL,
  `ID_TECNICOS` varchar(20) DEFAULT NULL,
  `ID_CLIENTES` varchar(20) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `Fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`ID_HISTORIAL`),
  KEY `ID_ORDEN_SERVICIO` (`ID_ORDEN_SERVICIO`),
  KEY `ID_COMPROBANTE` (`ID_COMPROBANTE`),
  KEY `historial_ibfk_3` (`ID_INFORME`),
  KEY `historial_ibfk_4` (`ID_TECNICOS`),
  KEY `historial_ibfk_5` (`ID_CLIENTES`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`ID_ORDEN_SERVICIO`) REFERENCES `orden_servicio` (`ID_ORDEN_SERVICIO`),
  CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`ID_COMPROBANTE`) REFERENCES `comprobante` (`ID_COMPROBANTE`),
  CONSTRAINT `historial_ibfk_3` FOREIGN KEY (`ID_INFORME`) REFERENCES `informe` (`ID_INFORME`),
  CONSTRAINT `historial_ibfk_4` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`),
  CONSTRAINT `historial_ibfk_5` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `ID_INFORME` varchar(20) NOT NULL,
  `ID_DETALLES_ORDEN_SERVICIO` varchar(20) DEFAULT NULL,
  `ID_ADMINISTRADOR` varchar(20) DEFAULT NULL,
  `ID_TECNICOS` varchar(20) DEFAULT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_INFORME`),
  KEY `ID_DETALLES_ORDEN_SERVICIO` (`ID_DETALLES_ORDEN_SERVICIO`),
  KEY `ID_ADMINISTRADOR` (`ID_ADMINISTRADOR`),
  KEY `ID_TECNICOS` (`ID_TECNICOS`),
  CONSTRAINT `informe_ibfk_1` FOREIGN KEY (`ID_DETALLES_ORDEN_SERVICIO`) REFERENCES `detalles_orden_servicio` (`ID_DETALLES_ORDEN_SERVICIO`),
  CONSTRAINT `informe_ibfk_2` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`),
  CONSTRAINT `informe_ibfk_3` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES ('INF1','DET1','ADM1','TEC1','En espera','2025-11-13 13:14:00','En espera'),('INF2','DET2','ADM2','TEC2','Lista para entrega','2025-11-13 13:14:00','En espera'),('INF3','DET3','ADM1','TEC1','Informe orden tres','2025-11-13 13:15:00','Finalizada');
/*!40000 ALTER TABLE `informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motos`
--

DROP TABLE IF EXISTS `motos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motos` (
  `ID_MOTOS` varchar(20) NOT NULL,
  `ID_CLIENTES` varchar(20) DEFAULT NULL,
  `Placa` varchar(20) NOT NULL,
  `Modelo` varchar(100) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Recorrido` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_MOTOS`),
  KEY `ID_CLIENTES` (`ID_CLIENTES`),
  CONSTRAINT `motos_ibfk_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES ('M1','CLI2','BGT654','250','DUKE','70.000'),('M2','CLI3','AKT654','250','DUKE','80.000'),('M3','CLI4','LMT564','390','DUKE','90.000'),('M4','CLI1','SER569','250','DUKE','38.000');
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `ID_ORDEN_SERVICIO` varchar(20) NOT NULL,
  `ID_CLIENTES` varchar(20) DEFAULT NULL,
  `ID_ADMINISTRADOR` varchar(20) DEFAULT NULL,
  `ID_TECNICOS` varchar(20) DEFAULT NULL,
  `ID_MOTOS` varchar(20) DEFAULT NULL,
  `Fecha_inicio` datetime NOT NULL,
  `Fecha_estimada` datetime NOT NULL,
  `Fecha_fin` datetime NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_ORDEN_SERVICIO`),
  KEY `ID_CLIENTES` (`ID_CLIENTES`),
  KEY `ID_ADMINISTRADOR` (`ID_ADMINISTRADOR`),
  KEY `ID_TECNICOS` (`ID_TECNICOS`),
  KEY `ID_MOTOS` (`ID_MOTOS`),
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`ID_CLIENTES`) REFERENCES `clientes` (`ID_CLIENTES`),
  CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`ID_ADMINISTRADOR`) REFERENCES `administradores` (`ID_ADMINISTRADOR`),
  CONSTRAINT `orden_servicio_ibfk_3` FOREIGN KEY (`ID_TECNICOS`) REFERENCES `tecnicos` (`ID_TECNICOS`),
  CONSTRAINT `orden_servicio_ibfk_4` FOREIGN KEY (`ID_MOTOS`) REFERENCES `motos` (`ID_MOTOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES ('ORD1','CLI1','ADM1','TEC3','M4','2025-11-10 13:14:00','2025-11-13 13:14:00','2025-11-20 13:14:00','En espera'),('ORD2','CLI2','ADM1','TEC2','M2','2025-11-10 13:14:00','2025-11-13 13:14:00','2025-11-20 13:14:00','Finalizada'),('ORD3','CLI3','ADM2','TEC3','M3','2025-11-10 13:14:00','2025-11-13 13:14:00','2025-11-20 13:14:00','Finalizada');
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_PRODUCTOS` varchar(20) NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('PRO1','Lubricantes y Refrigerantes','Motorex','Aceite','30',120.00,8,'Disponibles'),('PRO2','Accesorios Mecanicos','Rombo','Cadena','30',180.00,5,'Disponibles'),('PRO3','Accesorios Electricos','Minda','Direccionales','10',150.00,15,'Disponibles');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `ID_SERVICIOS` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Categoria` varchar(100) NOT NULL,
  `Garantia` varchar(100) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Precio` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_SERVICIOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES ('SER1','Mantenimiento preventivo','Mantenimientos','30','Disponible','180.000'),('SER2','Reparacion por daños','Reparaciones','30','Disponible','200.000'),('SER3','Instalaciones de accesorios','Instalaciones','14','Disponible','300.000'),('SER4','Diagnosticos motor','Diagnosticos','10','Disponible','600.000');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `ID_TECNICOS` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `TipoDocumento` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TECNICOS`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES ('TEC1','Camilo','tec1','$2y$12$X9SuJUbs.LVoixcdiDywKOD1pYlgifqBTlHdQnjY2LMypqwz8bUea','Cedula de Ciudadania','Camiloxxx@gmail.com','315487962'),('TEC2','Alejandro','tec2','$2y$12$D/H/WNYOtLUe9Nudbj7WeOXEoVdFqE.5xzI6ltn3P5/Gl8StYT8J.','Cedula de ciudadania','Alejandroxxx@gmail.com','311486562'),('TEC3','Santiago','tec3','$2y$12$SWAG1jyIlayXCP8p0scODOGJK46CUGtvc5RYDYus12boGBo6DrN/a','Tarjeta de Identidad','Santiagoxxx@gmail.com','3112012365');
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

-- Dump completed on 2025-12-04 21:13:54
