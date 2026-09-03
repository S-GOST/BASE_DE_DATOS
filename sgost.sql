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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('PRODUCTO','SERVICIO') NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Aceites y Lubricantes','PRODUCTO','Aceites de motor, lubricantes y líquidos','Activo'),(2,'Filtros','PRODUCTO','Filtros de aire, aceite y combustible','Activo'),(3,'Frenos','PRODUCTO','Pastillas, discos y zapatas de freno','Activo'),(4,'Llantas','PRODUCTO','Llantas y neumáticos para motos','Activo'),(5,'Eléctricos','PRODUCTO','Baterías, bombillos, fusibles','Activo'),(6,'Transmisión','PRODUCTO','Cadenas, piñones, kit de arrastre','Activo'),(7,'Accesorios','PRODUCTO','Chaquetas, cascos, guantes y accesorios','Activo'),(8,'Mantenimiento Preventivo','SERVICIO','Revisiones periódicas y mantenimiento general','Activo'),(9,'Reparación de Motor','SERVICIO','Diagnóstico y reparación de motores','Activo'),(10,'Sistema Eléctrico','SERVICIO','Diagnóstico y reparación del sistema eléctrico','Activo'),(11,'Suspension','SERVICIO','Suspension de motos ktm ready','Activo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `id_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `numero_comprobante` varchar(30) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `subtotal` decimal(10,2) NOT NULL,
  `total_pagar` decimal(10,2) NOT NULL,
  `metodo_pago` enum('Efectivo','Nequi','Daviplata','Transferencia','Tarjeta') NOT NULL,
  `estado` enum('Pendiente','Pagado','Anulado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_comprobante`),
  UNIQUE KEY `numero_comprobante` (`numero_comprobante`),
  KEY `id_orden` (`id_orden`),
  CONSTRAINT `fk_comprobante_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_servicio` (`id_orden`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `ID_PRODUCTOS` int(11) DEFAULT NULL,
  `ID_SERVICIOS` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1,
  `garantia` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_orden` (`id_orden`),
  KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`),
  KEY `ID_SERVICIOS` (`ID_SERVICIOS`),
  CONSTRAINT `detalles_orden_servicio_ibfk_2` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`),
  CONSTRAINT `detalles_orden_servicio_ibfk_3` FOREIGN KEY (`ID_SERVICIOS`) REFERENCES `servicios` (`ID_SERVICIOS`),
  CONSTRAINT `fk_detalle_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_servicio` (`id_orden`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_orden_servicio`
--

LOCK TABLES `detalles_orden_servicio` WRITE;
/*!40000 ALTER TABLE `detalles_orden_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `tabla_afectada` varchar(50) NOT NULL,
  `id_registro` int(11) NOT NULL,
  `accion` enum('INSERT','UPDATE','DELETE','LOGIN','LOGOUT') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `datos_antes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_antes`)),
  `datos_despues` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`datos_despues`)),
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_historial`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,1,'usuarios',1,'LOGOUT','Cierre de sesi�n de: SUPER ADMIN',NULL,NULL,'2026-08-28 17:31:09'),(2,1,'usuarios',1,'LOGIN','Inicio de sesi�n exitoso para usuario: admi1',NULL,NULL,'2026-08-29 10:07:48'),(3,1,'usuarios',1,'LOGOUT','Cierre de sesi�n de: SUPER ADMIN',NULL,NULL,'2026-08-29 10:08:31'),(4,1,'usuarios',3,'INSERT','Se creó el cliente Cliente nuevo uno',NULL,NULL,'2026-08-29 10:09:45'),(5,1,'usuarios',1,'LOGIN','Inicio de sesi�n exitoso para usuario: admi1',NULL,NULL,'2026-08-29 10:10:08'),(6,1,'usuarios',3,'UPDATE','Se rechazar el cliente Cliente nuevo uno',NULL,NULL,'2026-08-29 10:10:23'),(7,1,'usuarios',1,'LOGOUT','Cierre de sesi�n de: SUPER ADMIN',NULL,NULL,'2026-08-29 11:27:12');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informe`
--

DROP TABLE IF EXISTS `informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informe` (
  `id_informe` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `diagnostico` text DEFAULT NULL,
  `trabajo_realizado` text DEFAULT NULL,
  `recomendaciones` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_informe`),
  KEY `id_orden` (`id_orden`),
  KEY `id_tecnico` (`id_tecnico`),
  CONSTRAINT `fk_informe_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden_servicio` (`id_orden`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `informe_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `usuarios` (`id_usuario`)
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
  `id_moto` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `cilindraje` int(11) DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_moto`),
  UNIQUE KEY `placa` (`placa`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `fk_moto_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `id_orden` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `id_moto` int(11) NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_estimada` datetime DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `estado` enum('Pendiente','En proceso','Finalizada','Cancelada') DEFAULT NULL,
  `total` decimal(20,0) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT 'efectivo',
  PRIMARY KEY (`id_orden`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tecnico` (`id_tecnico`),
  KEY `id_moto` (`id_moto`),
  CONSTRAINT `fk_orden_moto` FOREIGN KEY (`id_moto`) REFERENCES `motos` (`id_moto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
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
  `ID_CATEGORIA` int(11) DEFAULT NULL,
  `Marca` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `precio_costo` decimal(12,2) DEFAULT 0.00,
  `precio_venta` decimal(12,2) DEFAULT 0.00,
  `Estado` varchar(20) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) DEFAULT 5,
  PRIMARY KEY (`ID_PRODUCTOS`),
  KEY `fk_productos_categoria` (`ID_CATEGORIA`),
  CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,NULL,'Motul','Aceite',80000.00,120000.00,'Activo',9,5),(2,6,'DID','Cadena',120000.00,180000.00,'Activo',8,3),(3,5,'Osram','Direccionales',100000.00,150000.00,'Activo',15,5),(4,7,'Rockect','CHAQUETA ROCKET',400000.00,500000.00,'Disponibles',10,5),(5,5,'KTM','Led faro moto',120000.00,200000.00,'Próximamente',20,5),(6,6,'KTM','Monoshop',300000.00,450000.00,'Disponibles',5,1),(7,7,'KTM','Casco',1200000.00,2000000.00,'Disponibles',3,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(3,'Cliente'),(2,'Tecnico');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `ID_SERVICIOS` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CATEGORIA` int(11) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_SERVICIOS`),
  KEY `fk_servicios_categoria` (`ID_CATEGORIA`),
  CONSTRAINT `fk_servicios_categoria` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,8,'Cambio de aceite','30000','Activo'),(2,8,'Revisión general','50000','Activo'),(3,9,'Reparación de motor','200000','Activo'),(4,10,'Revisión eléctrica','80000','Activo'),(5,11,'Suspencion trasera','150000','Disponible');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES (1,'Cédula de ciudadanía'),(2,'Tarjeta de identidad'),(3,'Cédula de extranjería'),(4,'Pasaporte'),(5,'NIT'),(6,'Permiso por Protección Tempora');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `numero_documento` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estado` enum('Activo','Inactivo','Pendiente') DEFAULT 'Pendiente',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,1000000001,'SUPER ADMIN','Bogotá','Admi1','$2b$10$V2sT800p7FtBFqDk5aZkMuOW/TMOwi.sbxyi/ZNnHU/GI4qwcGm..','duvan2002pinto@gmail.com','3002545695','Activo',NULL,NULL),(2,2,1,1200365693,'Tecnico N uno',NULL,'Tec1','$2b$10$1A.t/1FkxgJ5puOblCyOeeosf2rI8xGbU9mUtEvX5Y1MQCotTj1sy','tecnicon1@gmail.com','3112547896','Activo',NULL,NULL),(3,3,1,1000000002,'Cliente nuevo uno','Bogota D.C','Cli1','$2b$10$EKZANyJZKyu.mz2WczWAR.aYN/3ow7VzA.WFWdEa9DvQ5CBGQ5So.','mandopese@gmail.com','3110023698','Activo',NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-03 16:43:33
