-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                8.0.18 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- eticaretio için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `eticaretio` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eticaretio`;

-- tablo yapısı dökülüyor eticaretio.kargo
CREATE TABLE IF NOT EXISTS `kargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sirket_ad` varchar(150) DEFAULT NULL,
  `adres` varchar(500) DEFAULT NULL,
  `telefon` char(15) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.marka
CREATE TABLE IF NOT EXISTS `marka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `resimyolu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.musteri
CREATE TABLE IF NOT EXISTS `musteri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) DEFAULT NULL,
  `soyad` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefon` char(11) DEFAULT NULL,
  `adres` varchar(500) DEFAULT NULL,
  `sifre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.satis
CREATE TABLE IF NOT EXISTS `satis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musteri_id` int(11) NOT NULL,
  `satis_tarihi` varchar(50) NOT NULL DEFAULT '',
  `toplam_tutar` double DEFAULT NULL,
  `kargo_id` int(11) DEFAULT NULL,
  `kargo_takip_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_satis_kargo` (`kargo_id`),
  KEY `FK_satis_musteri` (`musteri_id`),
  CONSTRAINT `FK_satis_kargo` FOREIGN KEY (`kargo_id`) REFERENCES `kargo` (`id`),
  CONSTRAINT `FK_satis_musteri` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.satis_urun
CREATE TABLE IF NOT EXISTS `satis_urun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `satis_id` int(11) NOT NULL DEFAULT '0',
  `urun_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`,`satis_id`),
  KEY `FK_satis_urun_satis` (`satis_id`),
  KEY `FK_satis_urun_urun` (`urun_id`),
  CONSTRAINT `FK_satis_urun_satis` FOREIGN KEY (`satis_id`) REFERENCES `satis` (`id`),
  CONSTRAINT `FK_satis_urun_urun` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.urun
CREATE TABLE IF NOT EXISTS `urun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alisfiyati` double DEFAULT NULL,
  `satisfiyati` double DEFAULT NULL,
  `ekleme_tarihi` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `son_kullanma_tarihi` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aciklama` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `marka_id` int(11) DEFAULT NULL,
  `resimyolu` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_urun_kategori` (`kategori_id`),
  KEY `FK_urun_marka` (`marka_id`),
  CONSTRAINT `FK_urun_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  CONSTRAINT `FK_urun_marka` FOREIGN KEY (`marka_id`) REFERENCES `marka` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Veri çıktısı seçilmemişti

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
