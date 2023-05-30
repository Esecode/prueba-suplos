-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table ofertas.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ofertas.estado: ~2 rows (approximately)
INSERT INTO `estado` (`id_estado`, `tipo_estado`) VALUES
	(1, 'Activo'),
	(2, 'Inactivo');

-- Dumping structure for table ofertas.moneda
CREATE TABLE IF NOT EXISTS `moneda` (
  `id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_moneda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ofertas.moneda: ~3 rows (approximately)
INSERT INTO `moneda` (`id_moneda`, `tipo_moneda`) VALUES
	(1, 'COP'),
	(2, 'USD'),
	(3, 'EUR');

-- Dumping structure for table ofertas.oferta
CREATE TABLE IF NOT EXISTS `oferta` (
  `id_oferta` int(11) NOT NULL AUTO_INCREMENT,
  `creador_oferta` varchar(255) DEFAULT NULL,
  `objeto` varchar(255) NOT NULL,
  `actividad` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_moneda` int(11) NOT NULL DEFAULT 0,
  `presupuesto` bigint(20) NOT NULL DEFAULT 0,
  `fecha_ini` date NOT NULL,
  `hora_ini` time NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_fin` time NOT NULL,
  `id_estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id_oferta`) USING BTREE,
  KEY `FK_oferta_moneda` (`id_moneda`),
  KEY `FK_oferta_estado` (`id_estado`),
  CONSTRAINT `FK_oferta_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `FK_oferta_moneda` FOREIGN KEY (`id_moneda`) REFERENCES `moneda` (`id_moneda`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ofertas.oferta: ~1 rows (approximately)
INSERT INTO `oferta` (`id_oferta`, `creador_oferta`, `objeto`, `actividad`, `descripcion`, `id_moneda`, `presupuesto`, `fecha_ini`, `hora_ini`, `fecha_fin`, `hora_fin`, `id_estado`) VALUES
	(70, 'assa', 'saaass', 'wqdqwdwqd', 'wqdwqdqwd', 2, 1221, '2023-05-02', '23:13:00', '2023-05-23', '23:12:00', 1),
	(71, 'Santiago', 'Prueba', 'prueba', 'descripcion', 1, 1000, '2023-06-03', '23:17:00', '2023-05-26', '23:16:00', 1),
	(72, 'sadasd', 'wdqw', 'dqwdawsdawd', 'dasdqwdqw', 2, 12, '2023-05-10', '23:19:00', '2023-05-23', '01:16:00', 1),
	(73, 'asasa', 'qwdqwdqwdqwdqw', 'asas', 'qwdqwd', 2, 122121, '2023-05-18', '23:25:00', '2023-05-12', '02:21:00', 1),
	(74, 'beex', 'dwas', 'asas', 'dasdasdasdasd', 1, 12212, '2023-05-26', '04:22:00', '2023-05-11', '01:22:00', 1),
	(75, 'prueba', 'ultima', 'ninguna', 'descripcion', 2, 211221, '2023-05-12', '03:26:00', '2023-05-12', '05:22:00', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
