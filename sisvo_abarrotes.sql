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


-- Volcando estructura de base de datos para sisvo_abarrotes
DROP DATABASE IF EXISTS `sisvo_abarrotes`;
CREATE DATABASE IF NOT EXISTS `sisvo_abarrotes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sisvo_abarrotes`;

-- Volcando estructura para tabla sisvo_abarrotes.ajustes_sistema
DROP TABLE IF EXISTS `ajustes_sistema`;
CREATE TABLE IF NOT EXISTS `ajustes_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT 0,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave` (`clave`),
  KEY `idx_ajustes_modulo` (`modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.msc_estatus_usuarios
DROP TABLE IF EXISTS `msc_estatus_usuarios`;
CREATE TABLE IF NOT EXISTS `msc_estatus_usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_creacion` int(10) unsigned NOT NULL,
  `usuario_actualiza` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.msc_log_errores_catchs
DROP TABLE IF EXISTS `msc_log_errores_catchs`;
CREATE TABLE IF NOT EXISTS `msc_log_errores_catchs` (
  `id_log_error` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_empresa` int(10) unsigned DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `clase` varchar(50) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `mensaje_corto` text DEFAULT NULL,
  `stack_trace` text DEFAULT NULL,
  `fecha_error` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log_error`),
  KEY `fk_log_empresa` (`id_empresa`),
  CONSTRAINT `fk_log_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `sisvo_empresas` (`id_empresa`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.msc_roles
DROP TABLE IF EXISTS `msc_roles`;
CREATE TABLE IF NOT EXISTS `msc_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nivel_autoridad` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_creacion` int(10) unsigned NOT NULL,
  `usuario_actualiza` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rol_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.msc_usuarios
DROP TABLE IF EXISTS `msc_usuarios`;
CREATE TABLE IF NOT EXISTS `msc_usuarios` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rol_id` int(10) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `pin_autorizacion` varchar(255) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estatus_id` int(10) unsigned NOT NULL,
  `intentos_fallidos` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `esta_bloqueado` tinyint(1) NOT NULL DEFAULT 0,
  `token_sesion` varchar(255) DEFAULT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `actualiza_password` datetime DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `uk_usuario_username` (`username`),
  UNIQUE KEY `uk_usuario_email` (`email`),
  KEY `fk_usuario_rol` (`rol_id`),
  KEY `fk_usuario_estatus` (`estatus_id`),
  CONSTRAINT `fk_usuario_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `msc_estatus_usuarios` (`id`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `msc_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.sisvo_empresas
DROP TABLE IF EXISTS `sisvo_empresas`;
CREATE TABLE IF NOT EXISTS `sisvo_empresas` (
  `id_empresa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(200) DEFAULT NULL,
  `razon_comercial` varchar(200) DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `id_giro` int(10) unsigned DEFAULT NULL,
  `id_estatus` int(10) unsigned DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `correo_1` varchar(100) DEFAULT NULL,
  `correo_2` varchar(100) DEFAULT NULL,
  `telefono_1` varchar(12) DEFAULT NULL,
  `telefono_2` varchar(12) DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `fk_empresas_giro` (`id_giro`),
  KEY `fk_empresas_estatus` (`id_estatus`),
  CONSTRAINT `fk_empresas_estatus` FOREIGN KEY (`id_estatus`) REFERENCES `sisvo_estatus_empresas` (`id_estatus`),
  CONSTRAINT `fk_empresas_giro` FOREIGN KEY (`id_giro`) REFERENCES `sisvo_giros_empresa` (`id_giro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.sisvo_estatus_empresas
DROP TABLE IF EXISTS `sisvo_estatus_empresas`;
CREATE TABLE IF NOT EXISTS `sisvo_estatus_empresas` (
  `id_estatus` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estatus` varchar(50) DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.sisvo_giros_empresa
DROP TABLE IF EXISTS `sisvo_giros_empresa`;
CREATE TABLE IF NOT EXISTS `sisvo_giros_empresa` (
  `id_giro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `giro` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`id_giro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.sisvo_sucursales
DROP TABLE IF EXISTS `sisvo_sucursales`;
CREATE TABLE IF NOT EXISTS `sisvo_sucursales` (
  `id_sucursal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_empresa` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `razon_comercial` varchar(200) DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `id_estatus` int(10) unsigned DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `correo_1` varchar(100) DEFAULT NULL,
  `correo_2` varchar(100) DEFAULT NULL,
  `telefono_1` varchar(12) DEFAULT NULL,
  `telefono_2` varchar(12) DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `fk_sucursales_empresa` (`id_empresa`),
  KEY `fk_sucursales_estatus` (`id_estatus`),
  CONSTRAINT `fk_sucursales_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `sisvo_empresas` (`id_empresa`),
  CONSTRAINT `fk_sucursales_estatus` FOREIGN KEY (`id_estatus`) REFERENCES `sisvo_estatus_empresas` (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla sisvo_abarrotes.sisvo_usuarios_empresas
DROP TABLE IF EXISTS `sisvo_usuarios_empresas`;
CREATE TABLE IF NOT EXISTS `sisvo_usuarios_empresas` (
  `id_usuario` int(10) unsigned NOT NULL,
  `id_empresa` int(10) unsigned NOT NULL,
  `id_sucursal` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_empresa`,`id_sucursal`),
  KEY `fk_usu_emp_empresa` (`id_empresa`),
  KEY `fk_usu_emp_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_usu_emp_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `sisvo_empresas` (`id_empresa`) ON DELETE CASCADE,
  CONSTRAINT `fk_usu_emp_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sisvo_sucursales` (`id_sucursal`) ON DELETE CASCADE,
  CONSTRAINT `fk_usu_emp_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `msc_usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
