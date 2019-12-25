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
CREATE DATABASE IF NOT EXISTS `eticaretio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eticaretio`;

-- tablo yapısı dökülüyor eticaretio.kargo
CREATE TABLE IF NOT EXISTS `kargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sirket_ad` varchar(150) DEFAULT NULL,
  `adres` varchar(500) DEFAULT NULL,
  `telefon` char(15) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_kargo_kategori` FOREIGN KEY (`id`) REFERENCES `kategori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `resim_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kategori_resim` (`resim_id`),
  CONSTRAINT `FK_kategori_resim` FOREIGN KEY (`resim_id`) REFERENCES `resim` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.kullanici_rol
CREATE TABLE IF NOT EXISTS `kullanici_rol` (
  `user_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`rol_id`),
  KEY `FK_kullanici_rol_rol` (`rol_id`),
  CONSTRAINT `FK_kullanici_rol_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `FK_kullanici_rol_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.marka
CREATE TABLE IF NOT EXISTS `marka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `resim_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_marka_resim` (`resim_id`),
  CONSTRAINT `FK_marka_resim` FOREIGN KEY (`resim_id`) REFERENCES `resim` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.musteri
CREATE TABLE IF NOT EXISTS `musteri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) DEFAULT NULL,
  `soyad` varchar(45) DEFAULT NULL,
  `kullanici_adi` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefon` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_musteri_musteri_adres` FOREIGN KEY (`id`) REFERENCES `musteri_adres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.musteri_adres
CREATE TABLE IF NOT EXISTS `musteri_adres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musteri_id` int(11) DEFAULT NULL,
  `adres` varchar(500) DEFAULT NULL,
  `ad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.ozellik_deger
CREATE TABLE IF NOT EXISTS `ozellik_deger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `ozellik_tip_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ozellik_deger_ozellik_tip` (`ozellik_tip_id`),
  CONSTRAINT `FK_ozellik_deger_ozellik_tip` FOREIGN KEY (`ozellik_tip_id`) REFERENCES `ozellik_tip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.ozellik_tip
CREATE TABLE IF NOT EXISTS `ozellik_tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  `kategori_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ozellik_tip_kategori` (`kategori_id`),
  CONSTRAINT `FK_ozellik_tip_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.resim
CREATE TABLE IF NOT EXISTS `resim` (
  `id` int(11) NOT NULL,
  `buyukyol` varchar(500) NOT NULL DEFAULT '',
  `ortayol` varchar(500) NOT NULL DEFAULT '',
  `kucukyol` varchar(500) NOT NULL DEFAULT '',
  `varsayilan` bit(1) NOT NULL,
  `sirano` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_resim_urun` (`urun_id`),
  CONSTRAINT `FK_resim_urun` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(45) DEFAULT NULL,
  `kucuk_harflerle_rol_name` varchar(45) DEFAULT NULL,
  `aciklama` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.satis
CREATE TABLE IF NOT EXISTS `satis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musteri_id` int(11) NOT NULL,
  `satis_tarihi` date NOT NULL,
  `toplam_tutar` double DEFAULT NULL,
  `sepettemi` bit(1) DEFAULT NULL,
  `kargo_id` int(11) DEFAULT NULL,
  `siparis_durum_id` int(11) DEFAULT NULL,
  `kargo_takip_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_satis_siparis_durum` (`siparis_durum_id`),
  KEY `FK_satis_kargo` (`kargo_id`),
  KEY `FK_satis_musteri` (`musteri_id`),
  CONSTRAINT `FK_satis_kargo` FOREIGN KEY (`kargo_id`) REFERENCES `kargo` (`id`),
  CONSTRAINT `FK_satis_musteri` FOREIGN KEY (`musteri_id`) REFERENCES `musteri` (`id`),
  CONSTRAINT `FK_satis_siparis_durum` FOREIGN KEY (`siparis_durum_id`) REFERENCES `siparis_durum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.satis_detay
CREATE TABLE IF NOT EXISTS `satis_detay` (
  `satis_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `fiyat` double NOT NULL,
  `indirim` double NOT NULL,
  PRIMARY KEY (`satis_id`,`urun_id`),
  KEY `FK_satis_detay_urun` (`urun_id`),
  CONSTRAINT `FK_satis_detay_satis` FOREIGN KEY (`satis_id`) REFERENCES `satis` (`id`),
  CONSTRAINT `FK_satis_detay_urun` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.siparis_durum
CREATE TABLE IF NOT EXISTS `siparis_durum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) NOT NULL,
  `aciklama` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.urun
CREATE TABLE IF NOT EXISTS `urun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(45) DEFAULT NULL,
  `alisfiyati` double DEFAULT NULL,
  `satisfiyati` double DEFAULT NULL,
  `ekleme_tarihi` date DEFAULT NULL,
  `son_kullanma_tarihi` date DEFAULT NULL,
  `aciklama` varchar(250) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `marka_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_urun_kategori` (`kategori_id`),
  KEY `FK_urun_marka` (`marka_id`),
  CONSTRAINT `FK_urun_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  CONSTRAINT `FK_urun_marka` FOREIGN KEY (`marka_id`) REFERENCES `marka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.ururn_ozellik
CREATE TABLE IF NOT EXISTS `ururn_ozellik` (
  `urun_id` int(11) NOT NULL,
  `ozellik_tip_id` int(11) NOT NULL,
  `ozellik_deger_id` int(11) NOT NULL,
  PRIMARY KEY (`urun_id`,`ozellik_tip_id`,`ozellik_deger_id`),
  KEY `FK_ururn_ozellik_ozellik_tip` (`ozellik_tip_id`),
  KEY `FK_ururn_ozellik_ozellik_deger` (`ozellik_deger_id`),
  CONSTRAINT `FK_ururn_ozellik_ozellik_deger` FOREIGN KEY (`ozellik_deger_id`) REFERENCES `ozellik_deger` (`id`),
  CONSTRAINT `FK_ururn_ozellik_ozellik_tip` FOREIGN KEY (`ozellik_tip_id`) REFERENCES `ozellik_tip` (`id`),
  CONSTRAINT `FK_ururn_ozellik_urun` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor eticaretio.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `kucuk_harflerle_user_name` varchar(45) DEFAULT NULL,
  `telefon_no` char(11) DEFAULT NULL,
  `gizlimi` bit(1) DEFAULT NULL,
  `son_aktif_olma` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_musteri` FOREIGN KEY (`user_id`) REFERENCES `musteri` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
