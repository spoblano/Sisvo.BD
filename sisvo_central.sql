-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.17.0.7270
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sisvo_central
DROP DATABASE IF EXISTS `sisvo_central`;
CREATE DATABASE IF NOT EXISTS `sisvo_central` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sisvo_central`;

-- Volcando estructura para tabla sisvo_central.clientes_sisvo
DROP TABLE IF EXISTS `clientes_sisvo`;
CREATE TABLE IF NOT EXISTS `clientes_sisvo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) NOT NULL,
  `subdominio` varchar(50) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `db_server` varchar(100) DEFAULT 'localhost',
  `db_usuario` varchar(50) NOT NULL,
  `db_password` varchar(255) NOT NULL,
  `plan_contratado` varchar(20) DEFAULT 'basico',
  `estatus` tinyint(4) DEFAULT 1,
  `fecha_alta` datetime DEFAULT current_timestamp(),
  `fecha_vencimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_subdominio` (`subdominio`),
  UNIQUE KEY `uq_db_name` (`db_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_central.clientes_sisvo: ~2 rows (aproximadamente)
DELETE FROM `clientes_sisvo`;
INSERT INTO `clientes_sisvo` (`id`, `nombre_empresa`, `subdominio`, `db_name`, `db_server`, `db_usuario`, `db_password`, `plan_contratado`, `estatus`, `fecha_alta`, `fecha_vencimiento`) VALUES
	(1, 'Ferreteria', 'ferre', 'sisvo_ferreteria', 'localhost', 'root', '', 'premium', 1, '2026-08-08 22:44:51', '0000-00-00'),
	(2, 'Abarrotes El Güero', 'abarrotes', 'sisvo_abarrotes', 'localhost', 'root', '', 'basico', 1, '2026-08-08 22:44:51', '0000-00-00');

-- Volcando estructura para tabla sisvo_central.historial_pagos
DROP TABLE IF EXISTS `historial_pagos`;
CREATE TABLE IF NOT EXISTS `historial_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime DEFAULT current_timestamp(),
  `periodo_pagado_inicio` date NOT NULL,
  `periodo_pagado_fin` date NOT NULL,
  `metodo_pago` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `historial_pagos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_sisvo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_central.historial_pagos: ~0 rows (aproximadamente)
DELETE FROM `historial_pagos`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
