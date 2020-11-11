-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 11 Kas 2020, 15:37:28
-- Sunucu sürümü: 5.7.17-log
-- PHP Sürümü: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `deneme`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firma_isim`
--

CREATE TABLE `firma_isim` (
  `id` int(11) NOT NULL,
  `isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `konumid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `firma_isim`
--

INSERT INTO `firma_isim` (`id`, `isim`, `konumid`) VALUES
(1, 'ANK1', 1),
(2, 'ESK1', 2),
(3, 'GAZ1', 3),
(4, 'IST1', 4),
(5, 'IST2', 4),
(6, 'IST3', 4),
(7, 'LON1', 5),
(8, 'BER1', 6),
(9, 'BER2', 6),
(10, 'SB1', 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hammadde`
--

CREATE TABLE `hammadde` (
  `hammadde_id` int(11) NOT NULL,
  `firma_id` int(11) NOT NULL,
  `urun` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `stok` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `hammadde`
--

INSERT INTO `hammadde` (`hammadde_id`, `firma_id`, `urun`, `stok`, `fiyat`) VALUES
(1, 1, 'N', 100, 8),
(2, 1, 'H', 300, 9),
(3, 1, 'C', 150, 10),
(4, 1, 'O', 400, 11),
(5, 1, 'S', 200, 12),
(6, 1, 'Cl', 250, 13),
(7, 2, 'N', 0, 1),
(8, 2, 'H', 0, 2),
(9, 2, 'C', 20, 3),
(10, 3, 'N', 0, 3),
(11, 3, 'H', 0, 4),
(12, 3, 'C', 200, 5),
(13, 3, 'S', 200, 6),
(14, 3, 'Cl', 200, 7),
(15, 4, 'N', 1000, 10),
(16, 4, 'H', 3000, 11),
(17, 4, 'C', 2000, 12),
(18, 4, 'O', 1000, 13),
(19, 4, 'S', 1000, 14),
(20, 4, 'Cl', 1000, 14),
(21, 5, 'N', 50, 7),
(22, 5, 'C', 50, 8),
(23, 5, 'O', 50, 9),
(24, 5, 'H', 50, 10),
(25, 6, 'N', 0, 5),
(26, 6, 'H', 0, 6),
(27, 6, 'C', 30, 7),
(28, 6, 'O', 30, 7),
(29, 6, 'S', 30, 8),
(30, 6, 'Cl', 40, 8),
(31, 7, 'N', 1000, 20),
(32, 7, 'H', 1000, 25),
(33, 7, 'C', 1000, 30),
(34, 8, 'N', 500, 7),
(35, 8, 'H', 645, 8),
(36, 8, 'O', 2000, 9),
(37, 8, 'S', 600, 10),
(38, 8, 'C', 1000, 11),
(39, 9, 'N', 0, 3),
(40, 9, 'H', 0, 4),
(41, 9, 'C', 200, 5),
(42, 9, 'O', 300, 6),
(43, 9, 'S', 100, 7),
(44, 9, 'Cl', 100, 8),
(45, 10, 'N', 0, 1),
(46, 10, 'C', 5, 2),
(47, 10, 'O', 5, 3),
(48, 10, 'S', 10, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hammadde_id`
--

CREATE TABLE `hammadde_id` (
  `hammadde_ıd` int(11) NOT NULL,
  `sembol` varchar(255) CHARACTER SET utf32 COLLATE utf32_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesafe`
--

CREATE TABLE `mesafe` (
  `sehir_id` int(11) NOT NULL,
  `ulke_id` int(11) NOT NULL,
  `km` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `mesafe`
--

INSERT INTO `mesafe` (`sehir_id`, `ulke_id`, `km`) VALUES
(1, 1, 342),
(2, 1, 214),
(3, 1, 1000),
(4, 1, 111),
(5, 2, 2582),
(6, 3, 1809),
(7, 4, 1008);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri`
--

CREATE TABLE `musteri` (
  `id` int(11) NOT NULL,
  `musteri_id` int(11) NOT NULL,
  `talep` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `miktar` int(11) NOT NULL,
  `fiyat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `musteri`
--

INSERT INTO `musteri` (`id`, `musteri_id`, `talep`, `miktar`, `fiyat`) VALUES
(1, 1, 'NH3', 0, 165),
(2, 2, 'CO2', 0, 0),
(3, 2, 'CO2', 0, 442),
(4, 3, 'CO2', 0, 130),
(5, 1, 'NH3', 0, 5970);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteri_kayit`
--

CREATE TABLE `musteri_kayit` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `soyad` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `konum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `musteri_kayit`
--

INSERT INTO `musteri_kayit` (`id`, `ad`, `soyad`, `konum`) VALUES
(1, 'Kutay', 'Erten', 1),
(2, 'Murat', 'Çakır', 2),
(3, 'Fırat', 'Albayrak', 3),
(4, 'Onur', 'Güler', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rafomru`
--

CREATE TABLE `rafomru` (
  `id` int(11) NOT NULL,
  `yil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `rafomru`
--

INSERT INTO `rafomru` (`id`, `yil`) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sehir`
--

CREATE TABLE `sehir` (
  `konumid` int(11) NOT NULL,
  `sehir` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sehir`
--

INSERT INTO `sehir` (`konumid`, `sehir`) VALUES
(1, 'Ankara'),
(2, 'Eskisehir'),
(3, 'Gaziantep'),
(4, 'Istanbul'),
(5, 'Londra'),
(6, 'Berlin'),
(7, 'Saraybosna');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stok`
--

CREATE TABLE `stok` (
  `bilesik_id` int(11) NOT NULL,
  `stok_sayı` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `stok`
--

INSERT INTO `stok` (`bilesik_id`, `stok_sayı`) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ulke`
--

CREATE TABLE `ulke` (
  `ulkeid` int(11) NOT NULL,
  `ulke_isim` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ulke`
--

INSERT INTO `ulke` (`ulkeid`, `ulke_isim`) VALUES
(1, 'Türkiye'),
(2, 'İngiltere'),
(3, 'Almanya'),
(4, 'Bosna-Hersek');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uretici_bilesik`
--

CREATE TABLE `uretici_bilesik` (
  `id` int(11) NOT NULL,
  `bilesik` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `uretici_id` int(11) NOT NULL,
  `hammadde1` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `adet1` int(11) NOT NULL,
  `hammadde2` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `adet2` int(11) NOT NULL,
  `hammadde3` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `adet3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uretici_bilesik`
--

INSERT INTO `uretici_bilesik` (`id`, `bilesik`, `uretici_id`, `hammadde1`, `adet1`, `hammadde2`, `adet2`, `hammadde3`, `adet3`) VALUES
(1, 'NH3', 1, 'N', 1, 'H', 3, '', 0),
(2, 'CO2', 1, 'C', 1, 'O', 2, '', 0),
(3, 'SO2', 1, 'S', 1, 'O', 2, '', 0),
(4, 'C6H12O6', 1, 'C', 6, 'H', 12, 'O', 6),
(5, 'HCl', 1, 'H', 1, 'Cl', 1, '', 0),
(19, 'CNO3', 1, 'C', 1, 'N', 1, 'O', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uretici_firma`
--

CREATE TABLE `uretici_firma` (
  `id` int(11) NOT NULL,
  `isim` varchar(255) NOT NULL,
  `konum` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uretici_firma`
--

INSERT INTO `uretici_firma` (`id`, `isim`, `konum`) VALUES
(1, 'koü', 'Izmit');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `firma_isim`
--
ALTER TABLE `firma_isim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `firma_isim_ibfk_1` (`konumid`);

--
-- Tablo için indeksler `hammadde`
--
ALTER TABLE `hammadde`
  ADD PRIMARY KEY (`hammadde_id`),
  ADD KEY `firma_id` (`firma_id`);

--
-- Tablo için indeksler `hammadde_id`
--
ALTER TABLE `hammadde_id`
  ADD PRIMARY KEY (`hammadde_ıd`,`sembol`);

--
-- Tablo için indeksler `mesafe`
--
ALTER TABLE `mesafe`
  ADD PRIMARY KEY (`sehir_id`,`ulke_id`,`km`),
  ADD KEY `mesafe_ibfk_2` (`ulke_id`);

--
-- Tablo için indeksler `musteri`
--
ALTER TABLE `musteri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Tablo için indeksler `musteri_kayit`
--
ALTER TABLE `musteri_kayit`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `rafomru`
--
ALTER TABLE `rafomru`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sehir`
--
ALTER TABLE `sehir`
  ADD PRIMARY KEY (`konumid`);

--
-- Tablo için indeksler `stok`
--
ALTER TABLE `stok`
  ADD UNIQUE KEY `bilesik_id` (`bilesik_id`);

--
-- Tablo için indeksler `ulke`
--
ALTER TABLE `ulke`
  ADD PRIMARY KEY (`ulkeid`,`ulke_isim`);

--
-- Tablo için indeksler `uretici_bilesik`
--
ALTER TABLE `uretici_bilesik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bilesik` (`bilesik`),
  ADD KEY `uretici_id` (`uretici_id`);

--
-- Tablo için indeksler `uretici_firma`
--
ALTER TABLE `uretici_firma`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `firma_isim`
--
ALTER TABLE `firma_isim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Tablo için AUTO_INCREMENT değeri `hammadde`
--
ALTER TABLE `hammadde`
  MODIFY `hammadde_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- Tablo için AUTO_INCREMENT değeri `hammadde_id`
--
ALTER TABLE `hammadde_id`
  MODIFY `hammadde_ıd` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `musteri`
--
ALTER TABLE `musteri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `musteri_kayit`
--
ALTER TABLE `musteri_kayit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `sehir`
--
ALTER TABLE `sehir`
  MODIFY `konumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Tablo için AUTO_INCREMENT değeri `ulke`
--
ALTER TABLE `ulke`
  MODIFY `ulkeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `uretici_bilesik`
--
ALTER TABLE `uretici_bilesik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Tablo için AUTO_INCREMENT değeri `uretici_firma`
--
ALTER TABLE `uretici_firma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `firma_isim`
--
ALTER TABLE `firma_isim`
  ADD CONSTRAINT `firma_isim_ibfk_1` FOREIGN KEY (`konumid`) REFERENCES `sehir` (`konumid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `hammadde`
--
ALTER TABLE `hammadde`
  ADD CONSTRAINT `hammadde_ibfk_1` FOREIGN KEY (`firma_id`) REFERENCES `firma_isim` (`id`);

--
-- Tablo kısıtlamaları `mesafe`
--
ALTER TABLE `mesafe`
  ADD CONSTRAINT `mesafe_ibfk_1` FOREIGN KEY (`sehir_id`) REFERENCES `sehir` (`konumid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mesafe_ibfk_2` FOREIGN KEY (`ulke_id`) REFERENCES `ulke` (`ulkeid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `musteri`
--
ALTER TABLE `musteri`
  ADD CONSTRAINT `musteri_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteri_kayit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `rafomru`
--
ALTER TABLE `rafomru`
  ADD CONSTRAINT `rafomru_ibfk_1` FOREIGN KEY (`id`) REFERENCES `uretici_bilesik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`bilesik_id`) REFERENCES `uretici_bilesik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `uretici_bilesik`
--
ALTER TABLE `uretici_bilesik`
  ADD CONSTRAINT `uretici_bilesik_ibfk_1` FOREIGN KEY (`uretici_id`) REFERENCES `uretici_firma` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
