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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Lubricantes y refrigerantes','PRODUCTO','Productos para mantenimientos del vehiculo','Activo'),(2,'Accesorios','PRODUCTO','Accesorios para motocicletas ktm Duke','Activo'),(3,'Mantenimientos','SERVICIO','Servicios preventivos','Activo'),(4,'Reparaciones','SERVICIO','Servicios correctivos','Activo'),(5,'Instalaciones','SERVICIO','Instalación de accesorios','Activo'),(6,'Diagnósticos','SERVICIO','Diagnóstico de las motos','Activo');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES (1,1,'COMP-20260728-0001','2026-07-28 17:06:47',332000.00,332000.00,'Efectivo','Pagado'),(2,2,'COMP-20260729-0002','2026-07-28 19:40:54',450000.00,450000.00,'Efectivo','Pagado');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_orden_servicio`
--

LOCK TABLES `detalles_orden_servicio` WRITE;
/*!40000 ALTER TABLE `detalles_orden_servicio` DISABLE KEYS */;
INSERT INTO `detalles_orden_servicio` VALUES (1,1,NULL,6,1,15,212000.00,212000.00),(2,1,1,NULL,1,30,120000.00,120000.00),(3,2,NULL,7,1,20,300000.00,300000.00),(4,2,3,NULL,1,90,150000.00,150000.00);
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
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_historial`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,1,'usuarios',2,'INSERT','Se creó el técnico Tecnico Nª 1','2026-07-22 19:09:57'),(2,1,'usuarios',2,'UPDATE','Se actualizó el técnico Tecnico Nº 1','2026-07-22 19:11:00'),(3,1,'usuarios',3,'INSERT','Se creó el técnico Tecnico Nº2','2026-07-22 19:11:54'),(4,1,'usuarios',6,'INSERT','Se creó el cliente User numero uno','2026-07-22 19:14:39'),(5,1,'motos',1,'INSERT','Se creó una nueva moto (placa: DES456)','2026-07-22 19:14:39'),(6,1,'usuarios',8,'INSERT','Se creó el cliente User numero uno','2026-07-22 19:16:22'),(7,1,'motos',2,'INSERT','Se creó una nueva moto (placa: DES456)','2026-07-22 19:16:22'),(8,1,'usuarios',4,'INSERT','Se creó el cliente Usuario numero 1','2026-07-22 19:18:44'),(9,1,'motos',3,'INSERT','Se creó una nueva moto (placa: QWE444)','2026-07-22 19:18:44'),(10,1,'orden_servicio',1,'INSERT','Se creó la orden de servicio #1','2026-07-22 19:19:34'),(11,3,'orden_servicio',1,'UPDATE','Actualizó el estado de la orden a En proceso','2026-07-22 19:21:08'),(12,3,'informe',1,'INSERT','Redactó un informe para la orden 1','2026-07-22 19:22:26'),(13,3,'orden_servicio',1,'UPDATE','Actualizó el estado de la orden a Finalizada','2026-07-22 19:22:26'),(14,4,'orden_servicio',2,'INSERT','Se creó la orden de servicio #2','2026-07-24 17:59:29'),(15,1,'usuarios',6,'INSERT','Se creó el administrador Administrador numero dos','2026-07-28 11:51:33'),(16,1,'usuarios',6,'DELETE','Se eliminó el administrador Administrador numero dos','2026-07-28 11:51:43'),(17,1,'informe',0,'','Generó reporte de informes desde 2026-07-22 hasta 2026-07-28','2026-07-28 17:04:48'),(18,1,'informe',0,'','Generó reporte de informes desde 2026-07-22 hasta 2026-07-28','2026-07-28 17:05:39'),(19,1,'comprobante',1,'INSERT','Admin generó comprobante COMP-20260728-0001 para informe #1, orden #1, total: 332000','2026-07-28 17:06:47'),(20,4,'comprobante',1,'UPDATE','El cliente pagó el comprobante COMP-20260728-0001','2026-07-28 17:55:07'),(21,2,'orden_servicio',2,'UPDATE','Cambió estado de Pendiente a En proceso. Obs: N/A','2026-07-28 19:13:36'),(22,2,'informe',2,'INSERT','Redactó un informe para la orden 2','2026-07-28 19:14:42'),(23,2,'orden_servicio',2,'UPDATE','Cambió estado de En proceso a Finalizada. Obs: N/A','2026-07-28 19:14:42'),(24,1,'comprobante',2,'INSERT','Admin generó comprobante COMP-20260729-0002 para informe #2, orden #2, total: 450000','2026-07-28 19:40:54'),(25,4,'comprobante',2,'UPDATE','El cliente pagó el comprobante COMP-20260729-0002','2026-07-28 19:58:57'),(26,1,'categorias',5,'UPDATE','Se inhabilitó la categoría ID 5','2026-08-11 11:07:19'),(27,1,'categorias',5,'UPDATE','Se habilitó la categoría ID 5','2026-08-11 12:12:08'),(28,1,'categorias',5,'UPDATE','Se inhabilitó la categoría ID 5','2026-08-11 12:12:13'),(29,1,'categorias',5,'UPDATE','Se habilitó la categoría ID 5','2026-08-11 12:12:20'),(30,1,'categorias',6,'UPDATE','Se inhabilitó la categoría ID 6','2026-08-11 12:12:23'),(31,1,'categorias',6,'UPDATE','Se inhabilitó la categoría ID 6','2026-08-11 12:18:40'),(32,1,'servicios',6,'UPDATE','Se actualizó el servicio ID 6','2026-08-11 13:01:42'),(33,1,'productos',4,'DELETE','Se eliminó el producto ID 4','2026-08-11 13:04:08'),(34,1,'servicios',8,'UPDATE','Se actualizó el servicio ID 8','2026-08-11 13:05:38'),(35,1,'servicios',7,'UPDATE','Se actualizó el servicio ID 7','2026-08-11 13:05:46'),(36,1,'categorias',5,'UPDATE','Se inhabilitó la categoría ID 5','2026-08-11 13:06:04'),(37,1,'categorias',4,'UPDATE','Se inhabilitó la categoría ID 4','2026-08-11 13:06:08'),(38,1,'categorias',3,'UPDATE','Se inhabilitó la categoría ID 3','2026-08-11 13:06:13'),(39,1,'categorias',2,'UPDATE','Se inhabilitó la categoría ID 2','2026-08-11 13:06:17'),(40,1,'categorias',1,'UPDATE','Se inhabilitó la categoría ID 1','2026-08-11 13:06:20'),(41,1,'categorias',6,'UPDATE','Se inhabilitó la categoría ID 6','2026-08-11 13:11:31'),(42,1,'servicios',8,'UPDATE','Se habilitó el servicio ID 8','2026-08-11 13:11:42'),(43,1,'categorias',6,'UPDATE','Se inhabilitó la categoría ID 6','2026-08-11 13:12:00'),(44,1,'productos',4,'DELETE','Se eliminó el producto ID 4','2026-08-11 13:12:34'),(45,1,'usuarios',1,'UPDATE','Se actualizó el administrador Administrador','2026-08-11 16:17:05'),(46,1,'usuarios',1000000001,'UPDATE','Se restableció la contraseña mediante correo electrónico','2026-08-11 16:35:58');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informe`
--

LOCK TABLES `informe` WRITE;
/*!40000 ALTER TABLE `informe` DISABLE KEYS */;
INSERT INTO `informe` VALUES (1,1,3,'Se reviso cambio de aceite 60000 kilometros','Se realizo cambio de aceite y filtro ','Proximo cambio de aceite 620000 mil kilometros','2026-07-22 19:22:26'),(2,2,2,'Se reviso las direccionales','Cambio de direccionales','Revisar bomba','2026-07-28 19:14:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES (3,4,'QWE444','KTM','DUKE 250',250,70000),(4,4,'RET345','KTM','DUKE 250',22000,32000);
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
  PRIMARY KEY (`id_orden`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_tecnico` (`id_tecnico`),
  KEY `id_moto` (`id_moto`),
  CONSTRAINT `fk_orden_moto` FOREIGN KEY (`id_moto`) REFERENCES `motos` (`id_moto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,4,3,3,'2026-07-23 00:19:34','2026-07-23 00:00:00','2026-07-23 00:22:26','Se realizo en tiempo record','Finalizada',332000),(2,4,2,4,'2026-07-24 22:59:29','2026-07-28 00:00:00','2026-07-29 00:14:42','Se realizo cambio de direccionales','Finalizada',450000);
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
  `Precio` decimal(10,2) NOT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_PRODUCTOS`),
  KEY `fk_productos_categoria` (`ID_CATEGORIA`),
  CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Motorex','Aceite',120000.00,'Activo',0),(2,2,'Rombo','Cadena',180000.00,'Activo',0),(3,2,'Minda','Direccionales',150000.00,'Activo',0),(4,2,'DUKE','CHAQUETA ROCKET',170000.00,'Inactivo',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (5,4,'Reparacion por daños','200000','Activo'),(6,3,'Mantenimiento preventivo','212000','Activo'),(7,5,'Instalaciones de accesorios','300000','Activo'),(8,6,'Diagnosticos motor','600000','Activo');
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
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,1000000001,'Administrador','Bogotá','Admi1','$2b$10$K5xy5GpyN5116LR5CI65xObYgybvwKQC6lfnudyKtwepZQINRV4ha','duvan2002pinto@gmail.com','3000000000','Activo',NULL,NULL),(2,2,1,5223644588,'Tecnico Nº 1',NULL,'tec1','$2b$10$ofQpbXH8kd6borSO4oRoeONYEsaBknl812hrNrC8xOu0QnRf8d/Hu','TecnicoN1@gmail.com','3004556321','Activo',NULL,NULL),(3,2,4,1200365478,'Tecnico Nº2',NULL,'tec2','$2b$10$eMs/mdPE7g.WKUEokuyaDeatR9LNBEYFQ/VSOnhlgAiGgDrlhnYNi','TecnicoN2@gmail.com','3115698788','Activo',NULL,NULL),(4,3,1,1225899866,'Usuario numero 1','Bogota D.C','user','$2b$10$vQvy/pYS.19Q48lZzmkniOo6RXyA5lzf/q.WgLcCF1YtjW7blnV76','numerounoxxx@Usuariogmail.com','3165456987','Activo',NULL,NULL);
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

-- Dump completed on 2026-08-11 17:50:25
