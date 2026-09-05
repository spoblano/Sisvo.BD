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


-- Volcando estructura de base de datos para sisvo_dev
DROP DATABASE IF EXISTS `sisvo_dev`;
CREATE DATABASE IF NOT EXISTS `sisvo_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sisvo_dev`;

-- Volcando estructura para tabla sisvo_dev.msc_ajustes_empresa
DROP TABLE IF EXISTS `msc_ajustes_empresa`;
CREATE TABLE IF NOT EXISTS `msc_ajustes_empresa` (
  `ajuste_empresa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `ajuste_sistema_id` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ajuste_empresa_id`) USING BTREE,
  UNIQUE KEY `uk_empresa_ajuste` (`empresa_id`,`ajuste_sistema_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_ajustes_empresa: ~4 rows (aproximadamente)
DELETE FROM `msc_ajustes_empresa`;
INSERT INTO `msc_ajustes_empresa` (`ajuste_empresa_id`, `empresa_id`, `ajuste_sistema_id`, `valor`, `usuario_actualiza`, `fecha_actualiza`) VALUES
	(1, 2, 2, '2', 1, '2026-08-25 01:06:54'),
	(2, 2, 5, '12', 1, '2026-08-25 01:06:54'),
	(3, 2, 1, '1', 1, '2026-09-01 01:30:44'),
	(4, 1, 2, '3', 1, '2026-08-27 23:51:43');

-- Volcando estructura para tabla sisvo_dev.msc_ajustes_sistema
DROP TABLE IF EXISTS `msc_ajustes_sistema`;
CREATE TABLE IF NOT EXISTS `msc_ajustes_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) NOT NULL,
  `submodulo` varchar(50) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor_defecto` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT 0,
  `usuario_registro` int(10) unsigned DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  `usuario_actualiza` int(10) unsigned DEFAULT NULL,
  `fecha_actualiza` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_ajustes_clave` (`clave`) USING BTREE,
  KEY `idx_ajustes_modulo_submodulo` (`modulo`,`submodulo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_ajustes_sistema: ~6 rows (aproximadamente)
DELETE FROM `msc_ajustes_sistema`;
INSERT INTO `msc_ajustes_sistema` (`id`, `modulo`, `submodulo`, `clave`, `valor_defecto`, `descripcion`, `orden`, `usuario_registro`, `fecha_registro`, `usuario_actualiza`, `fecha_actualiza`) VALUES
	(1, 'seguridad', 'usuarios', 'bloquear_intentos_fallidos', 'true', 'Bloquear cuenta al fallar logins continuous', 1, 1, '2026-08-25 01:06:54', NULL, '2026-08-25 01:06:54'),
	(2, 'seguridad', 'usuarios', 'max_intentos_fallidos', '3', 'Intentos permitidos antes del bloqueo', 2, 1, '2026-08-25 01:06:54', NULL, '2026-08-25 01:06:54'),
	(3, 'seguridad', 'usuarios', 'minutos_bloqueo', '15', 'Tiempo en minutos que dura el bloqueo', 3, 1, '2026-08-25 01:06:54', NULL, '2026-08-25 01:06:54'),
	(4, 'seguridad', 'passwords', 'pwd_requiere_mayuscula', 'true', 'Exigir al menos una letra mayúscula', 1, 1, '2026-08-25 01:06:54', NULL, '2026-08-25 01:06:54'),
	(5, 'seguridad', 'passwords', 'pwd_longitud_minima', '8', 'Cantidad mínima de caracteres para la contraseña', 2, 1, '2026-08-25 01:06:54', NULL, '2026-08-25 01:06:54'),
	(6, 'seguridad', 'passwords', 'pwd_dias_expiracion', '90', 'Días de validez de la contraseña (0 para nunca)', 3, 1, '2026-08-25 01:06:54', NULL, '2026-08-25 01:06:54');

-- Volcando estructura para tabla sisvo_dev.msc_componentes
DROP TABLE IF EXISTS `msc_componentes`;
CREATE TABLE IF NOT EXISTS `msc_componentes` (
  `componente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `url_cshtml` varchar(255) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `orden` int(11) NOT NULL DEFAULT 0,
  `icono` varchar(50) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_creacion` varchar(50) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`componente_id`),
  KEY `IX_msc_componentes_Padre_Orden` (`padre_id`,`orden`,`nombre`,`url_cshtml`,`icono`,`activo`),
  CONSTRAINT `FK_msc_componentes_Padre` FOREIGN KEY (`padre_id`) REFERENCES `msc_componentes` (`componente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_componentes: ~0 rows (aproximadamente)
DELETE FROM `msc_componentes`;

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
  `id_empresa` int(10) unsigned DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `usuario_id` int(10) unsigned DEFAULT NULL,
  `clase` varchar(50) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `mensaje_corto` text DEFAULT NULL,
  `stack_trace` text DEFAULT NULL,
  `fecha_error` datetime DEFAULT NULL,
  PRIMARY KEY (`error_id`),
  KEY `idx_log_tenant_sucursal` (`id_sucursal`),
  KEY `idx_log_fecha` (`fecha_error`),
  KEY `idx_log_usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_log_errores_catchs: ~21 rows (aproximadamente)
DELETE FROM `msc_log_errores_catchs`;
INSERT INTO `msc_log_errores_catchs` (`error_id`, `id_empresa`, `id_sucursal`, `usuario_id`, `clase`, `metodo`, `mensaje_corto`, `stack_trace`, `fecha_error`) VALUES
	(1, 0, 0, 1, 'Clase de prueba', 'Metodo de prueba', 'Mensaje de prueba', 'Mensaje largo de prueba', '2026-08-20 22:07:18'),
	(2, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 17:35:54'),
	(3, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:15:06'),
	(4, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:15:53'),
	(5, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:25:39'),
	(6, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:29:35'),
	(7, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'Parameter \'p_tenant_id\' not found in the collection.', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre.', '2026-08-21 19:48:39'),
	(8, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Parameter \'p_tenant_id\' not found in the collection.', 'System.ArgumentException: Parameter \'p_tenant_id\' not found in the collection.\r\n   at MySqlConnector.Core.CachedProcedure.AlignParamsWithDb(MySqlParameterCollection parameterCollection) in /_/src/MySqlConnector/Core/CachedProcedure.cs:line 128\r\n   at MySqlConnector.Core.SingleCommandPayloadCreator.WriteStoredProcedure(IMySqlCommand command, IDictionary`2 cachedProcedures, ByteBufferWriter writer) in /_/src/MySqlConnector/Core/SingleCommandPayloadCreator.cs:line 341\r\n   at MySqlConnector.Core.SingleCommandPayloadCreator.WriteQueryPayload(IMySqlCommand command, IDictionary`2 cachedProcedures, ByteBufferWriter writer, Boolean appendSemicolon, Boolean isFirstCommand, Boolean isLastCommand) in /_/src/MySqlConnector/Core/SingleCommandPayloadCreator.cs:line 144\r\n   at MySqlConnector.Core.SingleCommandPayloadCreator.WriteQueryCommand(CommandListPosition& commandListPosition, IDictionary`2 cachedProcedures, ByteBufferWriter writer, Boolean appendSemicolon, Activity activity) in /_/src/MySqlConnector/Core/SingleCommandPayloadCreator.cs:line 111\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 46\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 72\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-21 19:57:10'),
	(9, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error parsing column 2 (Estatus=Activo - String)', 'System.Data.DataException: Error parsing column 2 (Estatus=Activo - String)\r\n ---> System.FormatException: The input string \'Activo\' was not in a correct format.\r\n   at System.Number.ThrowFormatException[TChar](ReadOnlySpan`1 value)\r\n   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)\r\n   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)\r\n   at Deserializea99a081c-a7ab-43a1-bee7-a3bddd90ec4a(DbDataReader)\r\n   --- End of inner exception stack trace ---\r\n   at Dapper.SqlMapper.ThrowDataException(Exception ex, Int32 index, IDataReader reader, Object value) in /_/Dapper/SqlMapper.cs:line 4001\r\n   at Deserializea99a081c-a7ab-43a1-bee7-a3bddd90ec4a(DbDataReader)\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 496\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:03:54'),
	(10, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:26:41'),
	(11, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:47:18'),
	(12, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:48:13'),
	(13, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:55:50'),
	(14, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:56:24'),
	(15, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 20:56:54'),
	(16, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 21:01:17'),
	(17, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 21:01:42'),
	(18, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 21:25:50'),
	(19, 1, 1, 1, 'AuthManager.cs', 'ValidarTenantAsync', 'ERROR EN LOGIN TENANT: Falló la autenticación Tenant: ferre: Error interno en la base de datos al recuperar la entidad.', 'System.Exception: Error interno en la base de datos al recuperar la entidad.\r\n ---> MySqlConnector.MySqlException (0x80004005): Incorrect number of arguments for PROCEDURE sisvo_dev.log_errores_catchs_sp; expected 10, got 8\r\n   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync(IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/ServerSession.cs:line 1185\r\n   at MySqlConnector.Core.ResultSet.ReadResultSetHeaderAsync(IOBehavior ioBehavior) in /_/src/MySqlConnector/Core/ResultSet.cs:line 37\r\n   at MySqlConnector.MySqlDataReader.ActivateResultSet(CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 133\r\n   at MySqlConnector.MySqlDataReader.InitAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, IDictionary`2 cachedProcedures, IMySqlCommand command, CommandBehavior behavior, Activity activity, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlDataReader.cs:line 489\r\n   at MySqlConnector.Core.CommandExecutor.ExecuteReaderAsync(CommandListPosition commandListPosition, ICommandPayloadCreator payloadCreator, CommandBehavior behavior, Activity activity, MySqlConnectorSemanticConventionsKinds conventionsKinds, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/Core/CommandExecutor.cs:line 58\r\n   at MySqlConnector.MySqlCommand.ExecuteReaderAsync(CommandBehavior behavior, IOBehavior ioBehavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 352\r\n   at MySqlConnector.MySqlCommand.ExecuteDbDataReaderAsync(CommandBehavior behavior, CancellationToken cancellationToken) in /_/src/MySqlConnector/MySqlCommand.cs:line 345\r\n   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 489\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 128\r\n   --- End of inner exception stack trace ---\r\n   at Sisvo.SaaS.Core.DataAccess.DBExecutor.GetEntityAsync[T](String nombreSP, List`1 parametros, List`1 valores) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DataAccess\\DBExecutor.cs:line 143\r\n   at Sisvo.SaaS.Core.DAL.DomainAuth.AuthRepository.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\DAL\\DomainAuth\\AuthRepository.cs:line 56\r\n   at Sisvo.SaaS.Core.BLL.DomainAuth.AuthManager.ValidateSubdomainAsync(String subdominio) in C:\\Users\\sergio\\source\\repos\\Sisvo.SaaS\\Sisvo.SaaS.Core\\BLL\\DomainAuth\\AuthManager.cs:line 102', '2026-08-23 21:43:28'),
	(20, NULL, 1, 1, 'STORED PROCEDURE', 'usuarios_operaciones_sp', 'Error MySQL Fatal: 1054 (State: 42S22)', 'Unknown column \'estatus\' in \'field list\'', '2026-08-23 21:46:19'),
	(21, 1, 1, 1, 'STORED PROCEDURE', 'usuarios_operaciones_sp', 'Error MySQL Fatal: 1054 (State: 42S22)', 'Unknown column \'u.empresa_id\' in \'field list\'', '2026-08-24 08:49:23'),
	(22, 1, 1, 1, 'STORED PROCEDURE', 'usuarios_autenticacion_sp', 'Error MySQL Fatal: 1054 (State: 42S22)', 'Unknown column \'id_usuario\' in \'where clause\'', '2026-08-31 21:13:54'),
	(23, 1, 1, 1, 'STORED PROCEDURE', 'usuarios_autenticacion_sp', 'Error MySQL Fatal: 1054 (State: 42S22)', 'Unknown column \'id_usuario\' in \'where clause\'', '2026-08-31 21:16:18');

-- Volcando estructura para tabla sisvo_dev.msc_rol_componente
DROP TABLE IF EXISTS `msc_rol_componente`;
CREATE TABLE IF NOT EXISTS `msc_rol_componente` (
  `rol_componente_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `componente_id` int(11) NOT NULL,
  `permitido` bit(1) NOT NULL DEFAULT b'1',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_creacion` varchar(50) NOT NULL,
  PRIMARY KEY (`rol_componente_id`),
  UNIQUE KEY `UQ_rol_id_componente_id` (`rol_id`,`componente_id`),
  KEY `FK_msc_rol_componente_Componente` (`componente_id`),
  KEY `IX_msc_rol_componente_Rol` (`rol_id`,`componente_id`,`permitido`),
  CONSTRAINT `FK_msc_rol_componente_Componente` FOREIGN KEY (`componente_id`) REFERENCES `msc_componentes` (`componente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_rol_componente: ~0 rows (aproximadamente)
DELETE FROM `msc_rol_componente`;

-- Volcando estructura para tabla sisvo_dev.msc_roles
DROP TABLE IF EXISTS `msc_roles`;
CREATE TABLE IF NOT EXISTS `msc_roles` (
  `rol_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `uk_rol_tenant_nombre` (`empresa_id`,`nombre_rol`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_roles: ~3 rows (aproximadamente)
DELETE FROM `msc_roles`;
INSERT INTO `msc_roles` (`rol_id`, `empresa_id`, `nombre_rol`, `descripcion`, `fecha_registro`) VALUES
	(1, 1, 'Administrador', 'Control total Tenant 1', '2026-08-20 15:07:59'),
	(2, 1, 'Operador', 'Usuario operativo Tenant 1', '2026-08-20 15:07:59'),
	(3, 2, 'Administrador', 'Control total Tenant 2', '2026-08-20 15:07:59');

-- Volcando estructura para tabla sisvo_dev.msc_usuarios
DROP TABLE IF EXISTS `msc_usuarios`;
CREATE TABLE IF NOT EXISTS `msc_usuarios` (
  `usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `empresa_id` int(10) unsigned NOT NULL,
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
  PRIMARY KEY (`usuario_id`) USING BTREE,
  UNIQUE KEY `uk_usuario_empresa_username` (`empresa_id`,`username`) USING BTREE,
  UNIQUE KEY `uk_usuario_empresa_email` (`empresa_id`,`email`) USING BTREE,
  KEY `fk_msc_usuarios_estatus` (`estatus_id`) USING BTREE,
  KEY `fk_msc_usuarios_rol` (`rol_id`) USING BTREE,
  CONSTRAINT `fk_msc_usuarios_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `msc_estatus_usuarios` (`estatus_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_msc_usuarios_rol` FOREIGN KEY (`rol_id`) REFERENCES `msc_roles` (`rol_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.msc_usuarios: ~3 rows (aproximadamente)
DELETE FROM `msc_usuarios`;
INSERT INTO `msc_usuarios` (`usuario_id`, `empresa_id`, `rol_id`, `username`, `email`, `password_hash`, `pin_autorizacion`, `nombre`, `apellido_paterno`, `apellido_materno`, `telefono`, `estatus_id`, `intentos_fallidos`, `esta_bloqueado`, `token_sesion`, `ultimo_acceso`, `actualiza_password`, `usuario_registro`, `fecha_registro`, `usuario_actualiza`, `fecha_actualiza`) VALUES
	(4, 1, 1, 'admin_juan', 'juan.perez@empresa1.com', '100000.mf0o9cf/vIvfyKWwlTtutg==.oXW41SkR0/lLbFMERs142tR/eD5x/r6cHpvn7nH5kgM=', '1234', 'Juan', 'Pérez', 'López', '5551234567', 1, 0, 0, NULL, '2026-09-04 16:38:29', '2026-08-24 08:30:00', 1, '2026-08-24 08:30:00', NULL, '2026-08-31 21:09:58'),
	(5, 1, 2, 'marta_sup', 'marta.gomez@empresa1.com', '100000.mf0o9cf/vIvfyKWwlTtutg==.oXW41SkR0/lLbFMERs142tR/eD5x/r6cHpvn7nH5kgM=', NULL, 'Marta', 'Gómez', NULL, '5559876543', 1, 2, 0, NULL, NULL, NULL, 1, '2026-08-24 08:35:00', NULL, NULL),
	(6, 2, 3, 'carlos_op', 'carlos.ruiz@empresa2.com', '100000.mf0o9cf/vIvfyKWwlTtutg==.oXW41SkR0/lLbFMERs142tR/eD5x/r6cHpvn7nH5kgM=', '4321', 'Carlos', 'Ruiz', 'Díaz', NULL, 1, 2, 1, NULL, '2026-08-23 18:00:00', NULL, 1, '2026-08-20 10:00:00', 1, '2026-08-23 18:05:00');

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
  `razon_social` varchar(200) NOT NULL,
  `razon_comercial` varchar(200) NOT NULL,
  `rfc` varchar(20) NOT NULL,
  `subdominio` varchar(50) NOT NULL,
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
  UNIQUE KEY `uk_empresa_subdominio` (`subdominio`),
  KEY `fk_empresas_giro` (`giro_id`),
  KEY `fk_empresas_estatus` (`estatus_id`),
  CONSTRAINT `fk_empresas_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `sisvo_estatus_empresas` (`estatus_id`),
  CONSTRAINT `fk_empresas_giro` FOREIGN KEY (`giro_id`) REFERENCES `sisvo_giros_empresa` (`giro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla sisvo_dev.sisvo_empresas: ~2 rows (aproximadamente)
DELETE FROM `sisvo_empresas`;
INSERT INTO `sisvo_empresas` (`empresa_id`, `razon_social`, `razon_comercial`, `rfc`, `subdominio`, `giro_id`, `estatus_id`, `logo`, `correo_1`, `correo_2`, `telefono_1`, `telefono_2`, `usuario_registro`, `fecha_registro`, `usuario_actualiza`, `fecha_actualiza`) VALUES
	(1, 'Ferretería General S.A. de C.V.', 'FerreFácil', 'FGE260821AAA', 'ferre', 1, 1, 'logos/ferrefacil.png', 'contacto@ferrefacil.com', 'soporte@ferrefacil.com', '5512345678', '5587654321', 1, '2026-08-24 02:03:35', NULL, NULL),
	(2, 'Consultores Tecnológicos de México S.C.', 'Sisvo Tech', 'CTM150212BBB', 'tech', 2, 5, NULL, 'admin@sisvotech.com', NULL, '5544332211', NULL, 1, '2026-08-24 02:03:35', NULL, NULL),
	(3, 'Distribuidora de Alimentos del Norte', 'Alimentos Norte', 'DAN990505CCC', 'alimentos', 3, 4, 'logos/alimentos_norte.jpg', 'ventas@alinorte.com', NULL, '8112345678', '8187654321', 1, '2026-08-24 02:03:35', NULL, NULL);

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

-- Volcando estructura para procedimiento sisvo_dev.cascaron_sp
DROP PROCEDURE IF EXISTS `cascaron_sp`;
DELIMITER //
CREATE PROCEDURE `cascaron_sp`(
	IN `p_opcion` VARCHAR(50),
	IN `p_empresa_id` INT,
	-- Agrega aquí tus parámetros de entrada (IN) adicionales
	-- Agrega aquí tus parámetros de salida (OUT) adicionales
	OUT `p_codigo_respuesta` VARCHAR(10),
	OUT `p_mensaje_respuesta` VARCHAR(255)
)
    COMMENT 'Plantilla base para la creación de Stored Procedures del sistema'
BEGIN
    -- =========================================================================
    -- 1️⃣ DECLARACIÓN DE VARIABLES LOCALES
    -- =========================================================================
    DECLARE v_mysql_errno INT;
    DECLARE v_sql_state VARCHAR(5);
    DECLARE v_error_msg TEXT;

    -- =========================================================================
    -- 2️⃣ MANEJADOR DE EXCEPCIONES (TRY-CATCH GLOVAL)
    -- =========================================================================
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Captura los detalles exactos del error de MySQL
        GET DIAGNOSTICS CONDITION 1 
            v_mysql_errno = MYSQL_ERRNO, 
            v_sql_state = RETURNED_SQLSTATE, 
            v_error_msg = MESSAGE_TEXT;
        
        -- Inserta el error en la bitácora unificada de auditoría
        CALL log_errores_catchs_sp(
            'insertar',
            p_empresa_id, 
            1, -- Módulo ID (Ajustar según catálogo)
            1, -- Usuario ID (Ajustar según contexto)
            'STORED PROCEDURE', 
            'cascaron_sp', -- ⚠️ RECUERDA: Cambiar este nombre al clonar la plantilla
            CONCAT('Error MySQL Fatal: ', v_mysql_errno, ' (State: ', v_sql_state, ')'), 
            v_error_msg, 
            p_codigo_respuesta, 
            p_mensaje_respuesta 
        );
        
        -- Formatea la respuesta genérica para el cliente (C#)
        SET p_codigo_respuesta = 'ERR_500';
        SET p_mensaje_respuesta = 'Error interno en el servidor de datos.';
    END;

    -- =========================================================================
    -- 3️⃣ CONTROLADOR DE OPCIONES OPERATIVAS (IF / ELSEIF / ELSE)
    -- =========================================================================
    
    -- 🔹 OPCIÓN A: [Nombre descriptivo de la acción]
    IF p_opcion = 'opcionA' THEN
        
        -- Tu código SQL aquí (SELECT, INSERT, UPDATE, DELETE)
        
        SET p_codigo_respuesta = 'SUCCESS';
        SET p_mensaje_respuesta = 'Operación A ejecutada con éxito.';

    -- 🔹 OPCIÓN B: [Nombre descriptivo de la acción]
    ELSEIF p_opcion = 'opcionB' THEN
        
        -- Tu código SQL aquí
        
        SET p_codigo_respuesta = 'SUCCESS';
        SET p_mensaje_respuesta = 'Operación B ejecutada con éxito.';
	
    -- 🚫 CONTROL DE OPCIONES INCORRECTAS
    ELSE
        SET p_codigo_respuesta = '400';
        SET p_mensaje_respuesta = 'La opción operativa solicitada no existe o no es válida.';
    END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento sisvo_dev.config_settings_sp
DROP PROCEDURE IF EXISTS `config_settings_sp`;
DELIMITER //
CREATE PROCEDURE `config_settings_sp`(
	IN `p_opcion` VARCHAR(50),
	IN `p_empresa_id` INT,
	IN `p_clave` VARCHAR(100),
	OUT `p_codigo_respuesta` VARCHAR(10),
	OUT `p_mensaje_respuesta` VARCHAR(255)
)
BEGIN
    -- 1️⃣ PRIMERO: Declaración de variables locales
    DECLARE v_mysql_errno INT;
    DECLARE v_sql_state VARCHAR(5);
    DECLARE v_error_msg TEXT;
    DECLARE v_existe_ajuste INT DEFAULT 0; -- Nueva variable para validación segura

    -- 2️⃣ SEGUNDO: Declarador de manejador de excepciones (Handler)
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 
            v_mysql_errno = MYSQL_ERRNO, 
            v_sql_state = RETURNED_SQLSTATE, 
            v_error_msg = MESSAGE_TEXT;
        
        -- Corregidos los arrobas @ que estaban de más en las variables de salida del CALL
        CALL log_errores_catchs_sp('insertar',
            p_empresa_id, 1, 1,
            'STORED PROCEDURE', 'config_settings_sp', -- Se corrigió el nombre del SP en la bitácora
            CONCAT('Error MySQL Fatal: ', v_mysql_errno, ' (State: ', v_sql_state, ')'), 
            v_error_msg, p_codigo_respuesta, p_mensaje_respuesta 
        );
        
        SET p_codigo_respuesta = 'ERR_500';
        SET p_mensaje_respuesta = 'Error interno en el servidor de datos.';
    END;

    -- =========================================================================
    -- OPCIÓN: validaConfig (Retorna el valor aplicable para la empresa)
    -- =========================================================================
    IF p_opcion = 'validaConfig' THEN
        
        -- Validamos primero si la clave existe en el catálogo maestro del sistema
        SELECT COUNT(*) INTO v_existe_ajuste 
        FROM `msc_ajustes_sistema` 
        WHERE `clave` = p_clave;

        IF v_existe_ajuste = 0 THEN
            SET p_codigo_respuesta = 'ERROR';
            SET p_mensaje_respuesta = 'El ajuste solicitado no existe en el sistema.';
        ELSE
            -- Si existe, hacemos la consulta unificada (Valor Empresa o Valor por Defecto)
            SELECT 
                s.`id` AS AjusteSistemaId,
                s.`modulo` AS Modulo,
                s.`submodulo` AS Submodulo,
                s.`clave` AS Clave,
                COALESCE(e.`valor`, s.`valor_defecto`) AS Valor,
                p_empresa_id AS EmpresaId
            FROM `msc_ajustes_sistema` s
            LEFT JOIN `msc_ajustes_empresa` e 
                ON s.`id` = e.`ajuste_sistema_id` AND e.`empresa_id` = p_empresa_id
            WHERE s.`clave` = p_clave; -- Se agregó el punto y coma faltante

            SET p_codigo_respuesta = 'SUCCESS';
            SET p_mensaje_respuesta = 'Configuración obtenida con éxito.';
        END IF;

    -- =========================================================================
    -- OPCIÓN 2: Ejemplo de estructura para otra opción operativa
    -- =========================================================================
    ELSEIF p_opcion = 'opcion2' THEN
        
        -- Tu lógica de la opción 2 aquí...
        SET p_codigo_respuesta = 'SUCCESS';
        SET p_mensaje_respuesta = 'Opción 2 ejecutada.';
	
    ELSE
        SET p_codigo_respuesta = '400';
        SET p_mensaje_respuesta = 'La opción operativa solicitada no existe.';
    END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento sisvo_dev.log_errores_catchs_sp
DROP PROCEDURE IF EXISTS `log_errores_catchs_sp`;
DELIMITER //
CREATE PROCEDURE `log_errores_catchs_sp`(
	IN `p_opcion` VARCHAR(50),
	IN `p_id_empresa` INT,
	IN `p_id_sucursal` INT,
	IN `p_usuario_id` INT,
	IN `p_clase` VARCHAR(50),
	IN `p_metodo` VARCHAR(50),
	IN `p_mensaje_corto` TEXT,
	IN `p_stack_trace` TEXT,
	OUT `p_codigo_respuesta` VARCHAR(10),
	OUT `p_mensaje_respuesta` VARCHAR(255)
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
            `id_empresa`,
            `id_sucursal`,
            `usuario_id`,
            `clase`,
            `metodo`,
            `mensaje_corto`,
            `stack_trace`,
            `fecha_error`
        ) VALUES (
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
	IN `p_empresa_id` INT,
	IN `p_subdominio` VARCHAR(50),
	IN `p_username_or_email` VARCHAR(100),
	IN `p_usuario_id` INT,
	OUT `p_codigo_respuesta` VARCHAR(10),
	OUT `p_mensaje_respuesta` VARCHAR(255)
)
    COMMENT 'Procedimiento unificado para el flujo completo de autenticación y login'
BEGIN
    -- =========================================================================
    -- 1️⃣ DECLARACIÓN DE VARIABLES LOCALES
    -- =========================================================================
    DECLARE v_mysql_errno INT;
    DECLARE v_sql_state VARCHAR(5);
    DECLARE v_error_msg TEXT;


    DECLARE v_existe_usuario INT DEFAULT 0;
    DECLARE v_existe_empresa INT DEFAULT 0;
    DECLARE v_estatus_actual INT DEFAULT 1; 
    DECLARE v_intentos_actuales INT DEFAULT 0;
    DECLARE v_max_intentos_configurado INT DEFAULT 3;
	
    -- =========================================================================
    -- 2️⃣ MANEJADOR DE EXCEPCIONES (TRY-CATCH)
    -- =========================================================================
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 
            v_mysql_errno = MYSQL_ERRNO, 
            v_sql_state = RETURNED_SQLSTATE, 
            v_error_msg = MESSAGE_TEXT;
        
        -- Corregidos los arrobas y actualizado el nombre real del SP para auditoría
        CALL log_errores_catchs_sp(
            'insertar',
            p_empresa_id, 1, 1,
            'STORED PROCEDURE', 'usuarios_autenticacion_sp',
            CONCAT('Error MySQL Fatal: ', v_mysql_errno, ' (State: ', v_sql_state, ')'), 
            v_error_msg, p_codigo_respuesta, p_mensaje_respuesta 
        );
        
        SET p_codigo_respuesta = 'ERR_500';
        SET p_mensaje_respuesta = 'Error interno en el servidor de datos.';
    END;

    -- =========================================================================
    -- 3️⃣ CONTROLADOR UNIFICADO DE OPCIONES OPERATIVAS
    -- =========================================================================
  
    -- 🔹 OPCIÓN 1: validaUsuario (Extracción Pura de Datos)
    IF p_opcion = 'validaUsuario' THEN
        
        -- Verificación segura de existencia previa
        SELECT COUNT(*) INTO v_existe_usuario
        FROM msc_usuarios
        WHERE empresa_id = p_empresa_id 
          AND (username = p_username_or_email OR email = p_username_or_email);

        IF v_existe_usuario = 0 THEN
            SET p_codigo_respuesta = 'ERROR';
            SET p_mensaje_respuesta = 'El usuario no existe en este entorno.';
        ELSE
            SELECT 
                 u.usuario_id         AS UsuarioId,       
                 u.empresa_id         AS EmpresaId,        
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
            WHERE u.empresa_id = p_empresa_id 
              AND (u.username = p_username_or_email OR u.email = p_username_or_email)
            LIMIT 1; -- Se agregó el punto y coma faltante

            SET p_codigo_respuesta = 'SUCCESS';
            SET p_mensaje_respuesta = 'Consulta ejecutada con datos.';
        END IF;

    -- 🔹 OPCIÓN 2: validaEmpresa (Validación de Tenant por Subdominio)
    ELSEIF p_opcion = 'validaEmpresa' THEN
        
        SELECT COUNT(*) INTO v_existe_empresa
        FROM sisvo_empresas
        WHERE subdominio = p_subdominio;

        IF v_existe_empresa = 0 THEN
            SET p_codigo_respuesta = 'ERROR';
            SET p_mensaje_respuesta = 'La empresa no existe.';
        ELSE
            SELECT empresa_id AS EmpresaId, subdominio AS Subdominio, estatus_id AS Estatus
            FROM sisvo_empresas
            WHERE subdominio = p_subdominio 
            LIMIT 1; -- Se agregó el punto y coma faltante
    		
            SET p_codigo_respuesta = 'SUCCESS';
            SET p_mensaje_respuesta = 'Consulta ejecutada con datos.';
        END IF;
	
    -- 🔹 OPCIÓN 3: procesoIntentos (Gestión Dinámica de Bloqueos por Estatus)
    ELSEIF p_opcion = 'procesoIntentos' THEN
        
        SELECT COUNT(*), IFNULL(MAX(`estatus_id`), 1), IFNULL(MAX(`intentos_fallidos`), 0)
        INTO v_existe_usuario, v_estatus_actual, v_intentos_actuales
        FROM `msc_usuarios`
        WHERE `empresa_id` = p_empresa_id AND `usuario_id` = p_usuario_id;

       
        IF v_estatus_actual = 3 THEN
        
            SET p_codigo_respuesta = 'BLOQUEADO';
            SET p_mensaje_respuesta = 'La cuenta se encuentra bloqueada por intentos fallidos.';
            
            SELECT v_intentos_actuales AS ColumnLookup,
				p_codigo_respuesta AS CodigoRespuesta,p_mensaje_respuesta AS MensajeRespuesta;
				
        ELSE
            -- Búsqueda jerárquica del ajuste (Empresa -> Sistema) con llave exacta
            SELECT CAST(COALESCE(e.`valor`, s.`valor_defecto`) AS UNSIGNED) INTO v_max_intentos_configurado
            FROM `msc_ajustes_sistema` s
            LEFT JOIN `msc_ajustes_empresa` e 
                ON s.`id` = e.`ajuste_sistema_id` AND e.`empresa_id` = p_empresa_id
            WHERE s.`clave` = 'max_intentos_fallidos';

            SET v_intentos_actuales = v_intentos_actuales + 1;
            
            IF v_intentos_actuales >= v_max_intentos_configurado THEN
                UPDATE `msc_usuarios`
                SET `intentos_fallidos` = v_intentos_actuales,
                    `estatus_id` = 3, -- Bloqueo definitivo por intentos
                    `fecha_actualiza` = CURRENT_TIMESTAMP()
                WHERE `empresa_id` = p_empresa_id AND `usuario_id` = p_usuario_id;

              
                SET p_codigo_respuesta = 'XBLOQUEAR';
                SET p_mensaje_respuesta = CONCAT('Límite alcanzado (', v_intentos_actuales, '/', v_max_intentos_configurado, '). La cuenta ha sido bloqueada.');
           
           		 SELECT v_intentos_actuales AS ColumnLookup,
					 p_codigo_respuesta AS CodigoRespuesta,p_mensaje_respuesta AS MensajeRespuesta;
			  
			   ELSE
                UPDATE `msc_usuarios`
                SET `intentos_fallidos` = v_intentos_actuales,
                    `fecha_actualiza` = CURRENT_TIMESTAMP()
                WHERE `empresa_id` = p_empresa_id AND `usuario_id` = p_usuario_id;

                SET p_codigo_respuesta = 'SUCCESS';
                SET p_mensaje_respuesta = CONCAT('Intento fallido (', v_intentos_actuales, '/', v_max_intentos_configurado, ').');
           
           		SELECT v_intentos_actuales AS ColumnLookup,
					 p_codigo_respuesta AS CodigoRespuesta,p_mensaje_respuesta AS MensajeRespuesta;
			  
			   END IF;
        END IF;

    -- 🔹 OPCIÓN 4: Se registra acceso correcto
    ELSEIF p_opcion = 'accessCorrect' THEN
    
        	 UPDATE msc_usuarios 
		    SET estatus_id = 1,
			 intentos_fallidos = 0,
			 ultimo_acceso = NOW()
		    WHERE usuario_id = p_usuario_id
		    AND empresa_id = p_empresa_id;
		
		    IF ROW_COUNT() > 0 THEN
		        SET p_codigo_respuesta = 'SUCCESS';
		        SET p_mensaje_respuesta = 'Operación B ejecutada con éxito. Registro actualizado.';
		    ELSE
		        SET p_codigo_respuesta = 'NOUPDATE';
		        SET p_mensaje_respuesta = 'No se realizaron cambios. Verifica el ID o los datos enviados.';
		    END IF;
    -- 🔹 OPCIÓN 5: OpcionB (Espacio de crecimiento para el dominio de Auth)
    ELSEIF p_opcion = 'opcionB' THEN
        SET p_codigo_respuesta = 'SUCCESS';
        SET p_mensaje_respuesta = 'Operación B ejecutada con éxito.';
    ELSE
        SET p_codigo_respuesta = '400';
        SET p_mensaje_respuesta = 'La opción operativa solicitada no existe o no es válida.';
    END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento sisvo_dev.utilities_sp
DROP PROCEDURE IF EXISTS `utilities_sp`;
DELIMITER //
CREATE PROCEDURE `utilities_sp`(
	IN `p_opcion` VARCHAR(50),
	IN `p_empresa_id` INT,
	IN `p_usuario_id` INT,
	OUT `p_codigo_respuesta` VARCHAR(10),
	OUT `p_mensaje_respuesta` VARCHAR(255)
)
BEGIN
    -- =========================================================================
    -- 1️⃣ DECLARACIÓN DE VARIABLES LOCALES
    -- =========================================================================
    DECLARE v_mysql_errno INT;
    DECLARE v_sql_state VARCHAR(5);
    DECLARE v_error_msg TEXT;
    
    DECLARE v_existe_usuario INT DEFAULT 0;
    DECLARE v_estatus_actual INT DEFAULT 1; -- Almacenará el id de estatus del usuario
    DECLARE v_intentos_actuales INT DEFAULT 0;
    
    -- Variables para la lógica dinámica de ajustes
    DECLARE v_max_intentos_configurado INT DEFAULT 3; 

    -- =========================================================================
    -- 2️⃣ MANEJADOR DE EXCEPCIONES (TRY-CATCH GLOBAL)
    -- =========================================================================
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 
            v_mysql_errno = MYSQL_ERRNO, 
            v_sql_state = RETURNED_SQLSTATE, 
            v_error_msg = MESSAGE_TEXT;
        
        CALL log_errores_catchs_sp(
            'insertar', p_empresa_id, 1, p_usuario_id,
            'STORED PROCEDURE', 'utilities_sp', 
            CONCAT('Error MySQL Fatal: ', v_mysql_errno, ' (State: ', v_sql_state, ')'), 
            v_error_msg, p_codigo_respuesta, p_mensaje_respuesta 
        );
        
        SET p_codigo_respuesta = 'ERR_500';
        SET p_mensaje_respuesta = 'Error interno en el servidor de datos.';
    END;

    -- =========================================================================
    -- 3️⃣ CONTROLADOR DE OPCIONES OPERATIVAS
    -- =========================================================================
    
    IF p_opcion = 'procesoIntentos' THEN
        
        -- 1. Verificar existencia, id de estatus actual e intentos actuales del usuario
        SELECT COUNT(*), IFNULL(MAX(`estatus_id`), 1), IFNULL(MAX(`intentos_fallidos`), 0)
        INTO v_existe_usuario, v_estatus_actual, v_intentos_actuales
        FROM `msc_usuarios`
        WHERE `empresa_id` = p_empresa_id AND `usuario_id` = p_usuario_id;

        IF v_existe_usuario = 0 THEN
            SET p_codigo_respuesta = 'ERROR';
            SET p_mensaje_respuesta = 'El usuario no existe en esta empresa.';
        
        -- 2. Si el estatus es igual a 3, significa que ya está bloqueado por intentos fallidos
        ELSEIF v_estatus_actual = 3 THEN
            -- Devolvemos el valor actual directamente a C# sin incrementar nada
            SELECT v_intentos_actuales AS ColumnLookup;
            SET p_codigo_respuesta = 'BLOQUEADO';
            SET p_mensaje_respuesta = 'La cuenta se encuentra bloqueada por intentos fallidos.';
        
        ELSE
            -- 3. Buscar ajuste personalizado de la empresa o el valor por defecto del sistema
            SELECT CAST(COALESCE(e.`valor`, s.`valor_defecto`) AS UNSIGNED) INTO v_max_intentos_configurado
            FROM `msc_ajustes_sistema` s
            LEFT JOIN `msc_ajustes_empresa` e 
                ON s.`id` = e.`ajuste_sistema_id` AND e.`empresa_id` = p_empresa_id
            WHERE s.`clave` = 'auth_max_intentos_fallidos';

            -- 4. Incrementar el contador local de intentos
            SET v_intentos_actuales = v_intentos_actuales + 1;
            
            -- 5. Validar si con este nuevo intento alcanza o supera el límite dinámico
            IF v_intentos_actuales >= v_max_intentos_configurado THEN
                -- Límite alcanzado: Actualizamos intentos y cambiamos el estatus a 3 (Bloqueado)
                UPDATE `msc_usuarios`
                SET `intentos_fallidos` = v_intentos_actuales,
                    `estatus_id` = 3, -- 🔒 Cambiar a estatus de bloqueo por intentos fallidos
                    `fecha_actualiza` = CURRENT_TIMESTAMP()
                WHERE `empresa_id` = p_empresa_id AND `usuario_id` = p_usuario_id;

                SELECT v_intentos_actuales AS ColumnLookup;
                SET p_codigo_respuesta = 'ALERTA_BLQ';
                SET p_mensaje_respuesta = CONCAT('Límite alcanzado (', v_intentos_actuales, '/', v_max_intentos_configurado, '). La cuenta ha sido bloqueada.');
            ELSE
                -- Aún le quedan intentos: Solo incrementamos el contador
                UPDATE `msc_usuarios`
                SET `intentos_fallidos` = v_intentos_actuales,
                    `fecha_actualiza` = CURRENT_TIMESTAMP()
                WHERE `empresa_id` = p_empresa_id AND `usuario_id` = p_usuario_id;

                SELECT v_intentos_actuales AS ColumnLookup;
                SET p_codigo_respuesta = 'SUCCESS';
                SET p_mensaje_respuesta = CONCAT('Intento registrado (', v_intentos_actuales, '/', v_max_intentos_configurado, ').');
            END IF;
            
        END IF;

    ELSEIF p_opcion = 'opcionB' THEN
        SET p_codigo_respuesta = 'SUCCESS';
        SET p_mensaje_respuesta = 'Operación B ejecutada con éxito.';
    ELSE
        SET p_codigo_respuesta = '400';
        SET p_mensaje_respuesta = 'La opción operativa solicitada no existe o no es válida.';
    END IF;

END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
