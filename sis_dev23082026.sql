-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sisvo_dev
DROP DATABASE IF EXISTS `sisvo_dev`;
CREATE DATABASE IF NOT EXISTS `sisvo_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sisvo_dev`;

-- Volcando estructura para tabla sisvo_dev.msc_estatus_usuarios
DROP TABLE IF EXISTS `msc_estatus_usuarios`;
CREATE TABLE IF NOT EXISTS `msc_estatus_usuarios` (
  `estatus_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_creacion` int(10) unsigned DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`estatus_id`),
  UNIQUE KEY `uk_estatus_descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_estatus_usuarios: ~5 rows (aproximadamente)
DELETE FROM `msc_estatus_usuarios`;
INSERT INTO `msc_estatus_usuarios` (`estatus_id`, `descripcion`, `fecha_creacion`, `fecha_actualizacion`, `usuario_creacion`, `usuario_actualiza`) VALUES
	(1, 'Activo', '2026-08-20 21:07:59', '2026-08-20 21:07:59', NULL, NULL),
	(2, 'Inactivo', '2026-08-20 21:07:59', '2026-08-20 21:07:59', NULL, NULL),
	(3, 'Bloqueado por intentos', '2026-08-20 21:07:59', '2026-08-20 21:07:59', NULL, NULL),
	(4, 'Bloqueado', '2026-08-21 02:47:13', '2026-08-21 02:47:13', NULL, NULL),
	(5, 'Por Activar', '2026-08-21 02:47:13', '2026-08-21 02:47:13', NULL, NULL);

-- Volcando estructura para tabla sisvo_dev.msc_log_errores_catchs
DROP TABLE IF EXISTS `msc_log_errores_catchs`;
CREATE TABLE IF NOT EXISTS `msc_log_errores_catchs` (
  `error_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(10) unsigned DEFAULT NULL,
  `id_empresa` int(10) unsigned DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `usuario_id` int(10) unsigned DEFAULT NULL,
  `clase` varchar(50) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `mensaje_corto` text DEFAULT NULL,
  `stack_trace` text DEFAULT NULL,
  `fecha_error` datetime DEFAULT NULL,
  PRIMARY KEY (`error_id`),
  KEY `idx_log_tenant_sucursal` (`tenant_id`,`id_sucursal`),
  KEY `idx_log_fecha` (`fecha_error`),
  KEY `idx_log_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_log_errores_catchs: ~8 rows (aproximadamente)
DELETE FROM `msc_log_errores_catchs`;
INSERT INTO `msc_log_errores_catchs` (`error_id`, `tenant_id`, `id_empresa`, `id_sucursal`, `usuario_id`, `clase`, `metodo`, `mensaje_corto`, `stack_trace`, `fecha_error`) VALUES
	(1, 1, 0, 0, 1, 'Clase de prueba', 'Metodo de prueba', 'Mensaje de prueba', 'Mensaje largo de prueba', '2026-08-20 22:07:18'),
	(2, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 17:35:54'),
	(3, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:15:06'),
	(4, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:15:53'),
	(5, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:25:39'),
	(6, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:29:35'),
	(7, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:48:39'),
	(8, 1, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Parameter \'p_tenant_id\' not found in the collection.', 'System.ArgumentException: Parameter \'p_tenant_id\' not found in the collection.\r\n   at MySqlConnector.Core.CachedProcedure.AlignParamsWithDb(MySqlParameterCollection parameterCollection) in /_/src/MySqlConnector/Core/CachedProcedure.cs:line 128\r\n   at MySqlConnector.Core.SingleCommandPayloadCreator.WriteStoredProcedure(IMySqlCommand command, IDictionary`2 cachedProcedures, ByteBufferWriter writer) in /_/src/MySqlConnector/Core/SingleCommandPayloadCreator.cs:line 341\r\n   at MySqlConnector.Core.SingleCommandPayloadCreator.WriteQueryPayload(IMySqlCommand command, IDictionary`2 cachedProcedures, ByteBufferWriter writer, Boolean appendSemicolon, Boolean isFirstCommand, Boolean isLastCommand) in /_/src/MySqlConnector/Core/SingleCommandPayloadCreator.cs:line 144\r\n   at MySqlConnector.Core.SingleCommandPayloadCreator.WriteQueryCommand(CommandListPosition& commandListPosition, IDictionary`2 cachedProcedures, ByteBufferWriter writer, Boolean appendSemicolon, Activity activity) in /_/src/MySqlConnector/Core/SingleCommandPayloadCreator.cs:line 111\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 46\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 72\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-21 19:57:10');

-- Volcando estructura para tabla sisvo_dev.msc_roles
DROP TABLE IF EXISTS `msc_roles`;
CREATE TABLE IF NOT EXISTS `msc_roles` (
  `rol_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(10) unsigned NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `uk_rol_tenant_nombre` (`tenant_id`,`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_roles: ~3 rows (aproximadamente)
DELETE FROM `msc_roles`;
INSERT INTO `msc_roles` (`rol_id`, `tenant_id`, `nombre_rol`, `descripcion`, `fecha_registro`) VALUES
	(1, 1, 'Administrador', 'Control total Tenant 1', '2026-08-20 15:07:59'),
	(2, 1, 'Operador', 'Usuario operativo Tenant 1', '2026-08-20 15:07:59'),
	(3, 2, 'Administrador', 'Control total Tenant 2', '2026-08-20 15:07:59');

-- Volcando estructura para tabla sisvo_dev.msc_usuarios
DROP TABLE IF EXISTS `msc_usuarios`;
CREATE TABLE IF NOT EXISTS `msc_usuarios` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(10) unsigned NOT NULL,
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
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `uk_usuario_tenant_username` (`tenant_id`,`username`),
  UNIQUE KEY `uk_usuario_tenant_email` (`tenant_id`,`email`),
  KEY `fk_msc_usuarios_estatus` (`estatus_id`),
  KEY `fk_msc_usuarios_rol` (`rol_id`),
  CONSTRAINT `fk_msc_usuarios_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `msc_estatus_usuarios` (`estatus_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_msc_usuarios_rol` FOREIGN KEY (`rol_id`) REFERENCES `msc_roles` (`rol_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_usuarios: ~3 rows (aproximadamente)
DELETE FROM `msc_usuarios`;
INSERT INTO `msc_usuarios` (`usuario_id`, `tenant_id`, `rol_id`, `username`, `email`, `password_hash`, `pin_autorizacion`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `estatus_id`, `intentos_fallidos`, `esta_bloqueado`, `token_sesion`, `ultimo_acceso`, `actualiza_password`, `usuario_registro`, `fecha_registro`, `usuario_actualiza`, `fecha_actualiza`) VALUES
	(1, 1, 1, 'juan.perez', 'juan.perez@alfa.com', '100000.U+nu1MDs6Fe++oOJsyX24A==.rD1x4YymrUN+LIqMCg2gJYZpzpLSVdp8FwG5k5gEpQg=', NULL, 'Juan', 'Pérez', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 1, '2026-08-20 15:07:59', NULL, NULL),
	(2, 1, 2, 'maria.lopez', 'maria.lopez@alfa.com', '100000.U+nu1MDs6Fe++oOJsyX24A==.rD1x4YymrUN+LIqMCg2gJYZpzpLSVdp8FwG5k5gEpQg=', NULL, 'María', 'López', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 1, '2026-08-20 15:07:59', NULL, NULL),
	(3, 2, 3, 'juan.perez', 'juan.perez@beta.com', '100000.U+nu1MDs6Fe++oOJsyX24A==.rD1x4YymrUN+LIqMCg2gJYZpzpLSVdp8FwG5k5gEpQg=', NULL, 'Juan', 'Pérez', NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 3, '2026-08-20 15:07:59', NULL, NULL);

-- Volcando estructura para tabla sisvo_dev.sisvo_direcciones
DROP TABLE IF EXISTS `sisvo_direcciones`;
CREATE TABLE IF NOT EXISTS `sisvo_direcciones` (
  `direccion_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entidad_tipo` varchar(20) NOT NULL,
  `entidad_id` int(10) unsigned NOT NULL,
  `calle` varchar(150) NOT NULL,
  `numero_exterior` varchar(20) NOT NULL,
  `numero_interior` varchar(20) DEFAULT NULL,
  `colonia` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `municipio_alcaldia` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL DEFAULT 'México',
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`direccion_id`),
  KEY `idx_direccion_entidad` (`entidad_tipo`,`entidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_direcciones: ~0 rows (aproximadamente)
DELETE FROM `sisvo_direcciones`;

-- Volcando estructura para tabla sisvo_dev.sisvo_empresas
DROP TABLE IF EXISTS `sisvo_empresas`;
CREATE TABLE IF NOT EXISTS `sisvo_empresas` (
  `empresa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL DEFAULT 0,
  `razon_social` varchar(200) NOT NULL,
  `razon_comercial` varchar(200) NOT NULL,
  `rfc` varchar(20) NOT NULL,
  `giro_id` int(10) unsigned NOT NULL,
  `estatus_id` int(10) unsigned NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `correo_1` varchar(100) DEFAULT NULL,
  `correo_2` varchar(100) DEFAULT NULL,
  `telefono_1` varchar(15) DEFAULT NULL,
  `telefono_2` varchar(15) DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  UNIQUE KEY `idx_empresas_rfc` (`rfc`),
  UNIQUE KEY `idx_empresas_razon_social` (`razon_social`),
  KEY `fk_empresas_giro` (`giro_id`),
  KEY `fk_empresas_estatus` (`estatus_id`),
  CONSTRAINT `fk_empresas_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `sisvo_estatus_empresas` (`estatus_id`),
  CONSTRAINT `fk_empresas_giro` FOREIGN KEY (`giro_id`) REFERENCES `sisvo_giros_empresa` (`giro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_empresas: ~0 rows (aproximadamente)
DELETE FROM `sisvo_empresas`;

-- Volcando estructura para tabla sisvo_dev.sisvo_estatus_empresas
DROP TABLE IF EXISTS `sisvo_estatus_empresas`;
CREATE TABLE IF NOT EXISTS `sisvo_estatus_empresas` (
  `estatus_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estatus` varchar(50) NOT NULL,
  `tipo_entidad` varchar(30) NOT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`estatus_id`),
  UNIQUE KEY `idx_estatus_entidad` (`estatus`,`tipo_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_estatus_empresas: ~0 rows (aproximadamente)
DELETE FROM `sisvo_estatus_empresas`;

-- Volcando estructura para tabla sisvo_dev.sisvo_giros_empresa
DROP TABLE IF EXISTS `sisvo_giros_empresa`;
CREATE TABLE IF NOT EXISTS `sisvo_giros_empresa` (
  `giro_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `giro` varchar(50) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`giro_id`),
  UNIQUE KEY `idx_giro_unico` (`giro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_giros_empresa: ~0 rows (aproximadamente)
DELETE FROM `sisvo_giros_empresa`;

-- Volcando estructura para tabla sisvo_dev.sisvo_regimenes_fiscales
DROP TABLE IF EXISTS `sisvo_regimenes_fiscales`;
CREATE TABLE IF NOT EXISTS `sisvo_regimenes_fiscales` (
  `regimen_fiscal_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_sat` varchar(10) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`regimen_fiscal_id`),
  UNIQUE KEY `idx_regimen_codigo` (`codigo_sat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_regimenes_fiscales: ~0 rows (aproximadamente)
DELETE FROM `sisvo_regimenes_fiscales`;

-- Volcando estructura para tabla sisvo_dev.sisvo_sucursales
DROP TABLE IF EXISTS `sisvo_sucursales`;
CREATE TABLE IF NOT EXISTS `sisvo_sucursales` (
  `sucursal_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `razon_comercial` varchar(200) DEFAULT NULL,
  `rfc` varchar(20) DEFAULT NULL,
  `estatus_id` int(10) unsigned NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `correo_1` varchar(100) DEFAULT NULL,
  `correo_2` varchar(100) DEFAULT NULL,
  `telefono_1` varchar(15) DEFAULT NULL,
  `telefono_2` varchar(15) DEFAULT NULL,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` datetime DEFAULT NULL,
  PRIMARY KEY (`sucursal_id`),
  UNIQUE KEY `idx_sucursal_codigo_empresa` (`empresa_id`,`codigo`),
  UNIQUE KEY `idx_sucursal_nombre_empresa` (`empresa_id`,`nombre`),
  KEY `fk_sucursales_empresa` (`empresa_id`),
  KEY `fk_sucursales_estatus` (`estatus_id`),
  CONSTRAINT `fk_sucursales_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `sisvo_empresas` (`empresa_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sucursales_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `sisvo_estatus_empresas` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_sucursales: ~0 rows (aproximadamente)
DELETE FROM `sisvo_sucursales`;

-- Volcando estructura para tabla sisvo_dev.sisvo_tenants
DROP TABLE IF EXISTS `sisvo_tenants`;
CREATE TABLE IF NOT EXISTS `sisvo_tenants` (
  `tenant_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `subdominio` varchar(50) NOT NULL,
  `plan_contratado` varchar(20) DEFAULT 'basico',
  `estatus` tinyint(4) DEFAULT 1,
  `fecha_alta` datetime DEFAULT current_timestamp(),
  `fecha_vencimiento` date DEFAULT NULL,
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `uq_subdominio` (`subdominio`),
  UNIQUE KEY `uq_plan_db` (`plan_contratado`),
  KEY `idx_tenant_estatus` (`estatus`),
  KEY `idx_tenant_vencimiento` (`fecha_vencimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_tenants: ~2 rows (aproximadamente)
DELETE FROM `sisvo_tenants`;
INSERT INTO `sisvo_tenants` (`tenant_id`, `nombre`, `subdominio`, `plan_contratado`, `estatus`, `fecha_alta`, `fecha_vencimiento`) VALUES
	(1, 'Ferreteria', 'ferre', 'sisvo_ferreteria', 1, '2026-08-08 22:44:51', '2027-08-08'),
	(2, 'Abarrotes El Güero', 'abarrotes', 'sisvo_abarrotes', 1, '2026-08-08 22:44:51', NULL);

-- Volcando estructura para procedimiento sisvo_dev.log_errores_catchs_sp
DROP PROCEDURE IF EXISTS `log_errores_catchs_sp`;
DELIMITER //
CREATE PROCEDURE `log_errores_catchs_sp`(
    IN p_opcion VARCHAR(50),
    IN p_tenant_id INT,
    IN p_id_empresa INT,
    IN p_id_sucursal INT,
    IN p_usuario_id INT,
    IN p_clase VARCHAR(50),
    IN p_metodo VARCHAR(50),
    IN p_mensaje_corto TEXT,
    IN p_stack_trace TEXT,
    OUT p_codigo_respuesta VARCHAR(10),
    OUT p_mensaje_respuesta VARCHAR(255)
)
BEGIN
    -- 🛡️ Seguridad extrema: Evitamos bucles infinitos si la inserción de logs llegara a fallar
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
    BEGIN 
        SET p_codigo_respuesta = 'ERR_500';
        SET p_mensaje_respuesta = 'Error crítico e irrecuperable al intentar escribir la bitácora de logs.';
    END;

    -- =========================================================================
    -- OPCIÓN: insertar (Registro de Excepciones del Sistema)
    -- =========================================================================
    IF p_opcion = 'insertar' THEN
        
        -- Inserción directa basada en los índices estratégicos de tu tabla msc_log_errores_catchs
        INSERT INTO `msc_log_errores_catchs` (
            `tenant_id`,
            `id_empresa`,
            `id_sucursal`,
            `usuario_id`,
            `clase`,
            `metodo`,
            `mensaje_corto`,
            `stack_trace`,
            `fecha_error`
        ) VALUES (
            p_tenant_id,
            p_id_empresa,
            p_id_sucursal,
            p_usuario_id,
            p_clase,
            p_metodo,
            p_mensaje_corto,
            p_stack_trace,
            NOW() -- Estampa de tiempo exacta del servidor MySQL
        );

        -- Respuesta exitosa para tu DBExecutor de Dapper
        SET p_codigo_respuesta = 'SUCCESS';
        SET p_mensaje_respuesta = 'Error registrado en la bitácora física exitosamente.';

    -- =========================================================================
    -- CONTROL DE OPCIONES FUTURAS (Ej: 'limpiarLogsAntiguos', 'consultarPorTenant')
    -- =========================================================================
    ELSE
        SET p_codigo_respuesta = 'ERR_400';
        SET p_mensaje_respuesta = 'La opción solicitada para el catálogo de logs no es válida.';
    END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento sisvo_dev.usuarios_autenticacion_sp
DROP PROCEDURE IF EXISTS `usuarios_autenticacion_sp`;
DELIMITER //
CREATE PROCEDURE `usuarios_autenticacion_sp`(
	IN `p_opcion` VARCHAR(50),
	IN `p_tenant_id` INT,
	IN `p_subdominio` VARCHAR(50),
	IN `p_username_or_email` VARCHAR(100),
	OUT `p_codigo_respuesta` VARCHAR(10),
	OUT `p_mensaje_respuesta` VARCHAR(255)
)
BEGIN
    -- 1️⃣ PRIMERO: Declaración de variables locales
    DECLARE v_mysql_errno INT;
    DECLARE v_sql_state VARCHAR(5);
    DECLARE v_error_msg TEXT;

    -- 2️⃣ SEGUNDO: Declarador de manejador de excepciones (Handler)
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 
            v_mysql_errno = MYSQL_ERRNO, 
            v_sql_state = RETURNED_SQLSTATE, 
            v_error_msg = MESSAGE_TEXT;
        
        CALL log_errores_catchs_sp(
            p_tenant_id, NULL, NULL, NULL,
            'STORED PROCEDURE', 'usuarios_operaciones_sp',
            CONCAT('Error MySQL Fatal: ', v_mysql_errno, ' (State: ', v_sql_state, ')'), 
            v_error_msg
        );
        
        SET p_codigo_respuesta = 'ERR_500';
        SET p_mensaje_respuesta = 'Error interno en el servidor de datos.';
    END;

    -- 3️⃣ TERCERO: Lógica del procedimiento (Asignaciones y consultas)
    
    -- Si el parámetro llega vacío (''), lo convertimos a NULL internamente
    SET p_subdominio = IF(TRIM(p_subdominio) = '', NULL, p_subdominio);
    SET p_tenant_id = IF(p_tenant_id = 0, NULL, p_tenant_id); 
    SET p_username_or_email = IF(TRIM(p_username_or_email) = '', NULL, p_username_or_email);

    -- =========================================================================
    -- OPCIÓN: validaUsuario (Extracción Pura de Datos)
    -- =========================================================================
    IF p_opcion = 'validaUsuario' THEN
        
        -- Ejecutamos la consulta directa usando los índices
        SELECT 
             u.usuario_id         AS UsuarioId,       
             u.tenant_id          AS TenantId,        
             u.rol_id             AS RolId,           
             u.username           AS Username,        
             u.email              AS Email,           
             u.password_hash      AS PasswordHash,    
             u.nombre             AS Nombre,          
             u.apellido_paterno   AS ApellidoPaterno, 
             u.estatus_id         AS EstatusId,       
             u.esta_bloqueado     AS EstaBloqueado,   
             r.nombre_rol         AS NombreRol        
        FROM msc_usuarios u
        INNER JOIN msc_roles r ON u.rol_id = r.rol_id
        WHERE u.tenant_id = p_tenant_id 
          AND (u.username = p_username_or_email OR u.email = p_username_or_email)
        LIMIT 1;

        -- 🛡️ VALIDADOR CLAVE
        IF FOUND_ROWS() = 0 THEN
            -- Si no se encontró ninguna fila para ese Tenant, regresamos error de inmediato
            SET p_codigo_respuesta = 'ERROR';
            SET p_mensaje_respuesta = 'El usuario no existe en este entorno.';
        ELSE
            -- Si trajo datos, todo un éxito
            SET p_codigo_respuesta = 'SUCCESS';
            SET p_mensaje_respuesta = 'Consulta ejecutada con datos.';
        END IF;

    -- =========================================================================
    -- OPCIÓN: validaTenant
    -- =========================================================================
    ELSEIF p_opcion = 'validaTenant' THEN
        SELECT tenant_id AS TenantId, subdominio AS Subdominio, estatus AS Estatus
        FROM sisvo_tenants
        WHERE subdominio = p_subdominio 
        LIMIT 1;
		
        -- 🛡️ VALIDADOR CLAVE
        IF FOUND_ROWS() = 0 THEN
            -- Si no se encontró ninguna fila para ese Tenant, regresamos error de inmediato
            SET p_codigo_respuesta = 'ERROR';
            SET p_mensaje_respuesta = 'El tenant no existe.';
        ELSE
            -- Si trajo datos, todo un éxito
            SET p_codigo_respuesta = 'SUCCESS';
            SET p_mensaje_respuesta = 'Consulta ejecutada con datos.';
        END IF;
	
    ELSE
        SET p_codigo_respuesta = '400';
        SET p_mensaje_respuesta = 'La opción operativa solicitada no existe.';
    END IF;

END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
