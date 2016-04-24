-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2016 at 11:07 PM
-- Server version: 10.0.20-MariaDB-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `amiktega_sipus`
--

-- --------------------------------------------------------

--
-- Table structure for table `det_pinjam`
--

CREATE TABLE IF NOT EXISTS `det_pinjam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_pinjam` int(9) NOT NULL,
  `kd_buku` varchar(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `det_pinjam`
--

INSERT INTO `det_pinjam` (`id`, `kd_pinjam`, `kd_buku`, `status`) VALUES
(1, 90715001, '10447', 'sudah dikembalikan'),
(2, 120715002, '10412', 'sudah dikembalikan');

-- --------------------------------------------------------

--
-- Table structure for table `set_pinjam`
--

CREATE TABLE IF NOT EXISTS `set_pinjam` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `set_maks` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `set_pinjam`
--

INSERT INTO `set_pinjam` (`id`, `set_maks`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_anggota`
--

CREATE TABLE IF NOT EXISTS `t_anggota` (
  `id_anggota` int(9) NOT NULL,
  `nim` int(8) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` varchar(12) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `tanggal` date NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_anggota`
--

INSERT INTO `t_anggota` (`id_anggota`, `nim`, `nama`, `email`, `alamat`, `telp`, `pass`, `tanggal`, `aktif`) VALUES
(201506001, 12383023, 'pandu aldi pratama', 'pandusosmed652@gmail.com', 'pulosari', '083938882998', '040a5b752d1ad1be4a63bc118ca4e210', '2015-06-29', 'Y'),
(201506002, 12383016, 'Ikhwan K.', 'ikwan@gmail.com', 'tegal', '099918891899', '3c918a7388d05d7eeb4546579cd01649', '2015-06-29', 'Y'),
(201507003, 12383025, 'nurdiyansah nova k', 'novakun@gmail.com', 'kelampok brebes', '018291829189', '827ccb0eea8a706c4c34a16891f84e7b', '2015-07-07', 'Y'),
(201507004, 14503010, 'imam fauzi', 'imam@gmail.com', 'slawi', '082392389283', '4b5dd0cf982dcf9a79272ec840710856', '2015-07-11', 'Y'),
(201507005, 12383022, 'oktavan', 'oktvvan@gmail.com', 'tegal', '912781872718', 'e91c8da082cfcc4955c46ffd1415023b', '2015-07-11', 'N'),
(201511006, 15203011, 'saiful falah', 'ipul5015@gmail.com', 'tegal', '082326054059', '202cb962ac59075b964b07152d234b70', '2015-11-25', 'Y'),
(201512007, 0, 'maryono', 'maryono45@gmail.com', 'puri cikarang indah blok E6 nmr 48. sukatani.cikar', '088212781011', 'f1ffc157447be0178e76d05d9a5ee05f', '2015-12-29', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `t_booking`
--

CREATE TABLE IF NOT EXISTS `t_booking` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `id_anggota` int(9) NOT NULL,
  `kd_buku` varchar(10) NOT NULL,
  `tempo` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_booking`
--

INSERT INTO `t_booking` (`id`, `id_anggota`, `kd_buku`, `tempo`) VALUES
(1, 201506001, '10044', '2016-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `t_buku`
--

CREATE TABLE IF NOT EXISTS `t_buku` (
  `kd_buku` varchar(10) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `kd_penerbit` int(3) NOT NULL,
  `kd_pengarang` int(3) NOT NULL,
  `kd_kategori` int(3) NOT NULL,
  `tahun` int(4) NOT NULL,
  `tgl_perolehan` date NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `cover` varchar(50) NOT NULL,
  `isbn` int(20) NOT NULL,
  `ddc` varchar(10) NOT NULL,
  `rak` int(3) NOT NULL,
  `abstraksi` text NOT NULL,
  `jum_hal` int(4) NOT NULL,
  `status` varchar(30) NOT NULL,
  `most_new` enum('Y','N') NOT NULL,
  PRIMARY KEY (`kd_buku`),
  KEY `kd_buku` (`kd_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_buku`
--

INSERT INTO `t_buku` (`kd_buku`, `judul`, `kd_penerbit`, `kd_pengarang`, `kd_kategori`, `tahun`, `tgl_perolehan`, `jumlah_buku`, `ket`, `cover`, `isbn`, `ddc`, `rak`, `abstraksi`, `jum_hal`, `status`, `most_new`) VALUES
('10019', 'Tip & Trik Unik Delphi', 1, 72, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5.113', 1, '', 0, 'tersedia', 'Y'),
('10037', 'Tutorial Praktis Membangun Website Komunitas dengan Plume', 1, 105, 1, 2007, '2014-09-25', 1, '', 'membangunwe_1.jpeg', 2147483647, '4.678', 1, '', 0, 'tersedia', 'Y'),
('10041', 'Mudah dan Menyenangkan Belajar Mikrokontroler', 1, 118, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '4.64', 3, '', 0, 'tersedia', 'Y'),
('10043', 'Membangun Website Interaktif Sekolah ', 1, 64, 1, 2007, '2014-09-25', 1, '', '', 2147483647, '4.678', 1, '', 0, 'tersedia', 'Y'),
('10044', 'Belajar Sendiri Mikrokontroler AVR Seri ATMega8535', 1, 82, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '4.64', 3, '', 0, 'sudah dibooking', 'N'),
('10046', 'MemperCantik WEB dengan CSS ', 1, 132, 1, 2006, '2014-09-25', 1, '', '', 979763583, '4.678', 1, '', 0, 'tersedia', 'N'),
('100461', 'Modul Kuliah PBO', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100462', 'Modul Kuliah Sistem Operasi', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100463', 'Modul Kuliah Perancangan Web', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100464', 'Modul Kuliah Multimedia', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100465', 'Modul Kuliah SQL', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100466', 'Modul Kuliah Metodologi Penelitian', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100467', 'Modul Kuliah Etika Profesi', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100468', 'Modul Kuliah Teknik Komputer', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100469', 'Modul Kuliah Pancasila', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('10047', 'DAFTAR ALAMAT WEB HOSTING GRATIS ', 1, 119, 3, 2005, '2014-09-25', 1, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('100470', 'Modul Kuliah Bahasa Inggris', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100471', 'Modul Kuliah Pendidikan Agama Islam', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100472', 'Modul Kuliah PPN 1', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('100497', 'Modul Praktikum MySQL', 41, 354, 10, 2013, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('10054', 'Panduan NGEBLOG Menggunakan WORDPRESS', 1, 100, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '4.678', 6, '', 0, 'tersedia', 'N'),
('10055', 'Berbagai Teknik Mengupload Web', 1, 73, 1, 2014, '2014-09-25', 1, '', '', 2147483647, '4.678', 1, '', 0, 'tersedia', 'N'),
('10060', 'Panduan Praktis PEMROGRAMAN VISUAL Berbasis C++', 5, 50, 1, 2006, '2014-09-25', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('10063', 'HTTP ATTACK Untuk Script kiddies', 1, 98, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('10064', 'Teknik Mengembangkan Aplikasi Eterprise dengan Teknologi Open Source berbasis Java', 1, 52, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5.133', 1, '', 0, 'tersedia', 'N'),
('10067', 'Membangun Web Portal Multibahasa dengan Joomla 1.5.x', 4, 112, 1, 2009, '2014-09-25', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10069', 'Menjadi Seorang Desainer Web', 1, 132, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5.365', 1, '', 0, 'tersedia', 'N'),
('10071', 'Pemrograman Menggunakan Oracle Developer', 1, 137, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '005.785.5', 1, '', 0, 'tersedia', 'N'),
('10076', 'Program Akuntansi Terpadu untuk Bisnis Retail dengan Visual Basic', 1, 81, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '657.420.28', 1, '', 0, 'tersedia', 'N'),
('10078', 'Konsep Bahasa Pemrograman', 1, 70, 1, 2006, '2014-09-25', 1, '', '', 2147483647, '380.1', 1, '', 0, 'tersedia', 'N'),
('10080', 'Membangun Web Portal dengan eNdonesia 8.3', 1, 12, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.365', 1, '', 0, 'tersedia', 'N'),
('10082', 'First Step To Be A Programmer', 1, 37, 1, 2007, '2014-09-25', 1, '', '', 2147483647, '5.1', 1, '', 0, 'tersedia', 'N'),
('10083', 'Pemrograman Game dengan Visual Basic', 1, 83, 1, 2003, '2014-09-25', 1, '', '', 2147483647, '5.3', 1, '', 0, 'tersedia', 'N'),
('10084', 'Pemrograman Menggunakan Oracle Developer Tingkat Lanjut', 1, 137, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '005.785.5', 1, '', 0, 'tersedia', 'N'),
('10085', 'Membangun Database dengan Visual Basic 6.0 dan perintah SQL', 4, 77, 1, 2002, '2014-09-25', 2, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10086', 'Tuntunan Praktis PHP GTK', 1, 138, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.365', 1, '', 0, 'tersedia', 'N'),
('10089', 'Robotika : Reasoning,Planning,Learning', 5, 45, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('10094', 'Pemrograman Mikroprosesor', 1, 46, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10095', 'Cara mudah mendesain situs e-Commerce dengan Joomla', 1, 100, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '5.365', 1, '', 0, 'tersedia', 'N'),
('10096', 'Cara mudah mempelajari PHP, Apache, dan MySQL', 5, 68, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10104', 'Membangun sistem andal dengan delphi', 1, 37, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '5.113', 1, '', 0, 'tersedia', 'N'),
('10105', 'Teleakses Database Pendidikan Berbasis Ponsel', 1, 28, 5, 2003, '2014-09-25', 1, '', '', 2147483647, '621.382', 5, '', 0, 'tersedia', 'N'),
('10107', 'Membangun Aplikasi Handphone dengan FBUS & Visual Basic', 1, 137, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '621.384.5', 1, '', 0, 'tersedia', 'N'),
('10114', 'Pemrograman Database dengan Visual basic dan Microsoft SQL', 1, 14, 1, 2007, '2014-09-25', 1, '', '', 2147483647, '5.74', 1, '', 0, 'tersedia', 'N'),
('10115', 'Tuntunan Praktis Pemrograman Clipper 5', 4, 130, 1, 1994, '2014-09-25', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10117', 'Cara mudah menguasai Microsoft C# 2008', 1, 32, 1, 2009, '2014-09-25', 1, '', '', 2147483647, '5.118', 1, '', 0, 'tersedia', 'N'),
('10118', 'Web Security & Commerce', 11, 95, 1, 1997, '2014-09-25', 1, '', '', 1565922697, '5', 1, '', 0, 'tersedia', 'N'),
('10126', 'Mudah membuat website dengan Aura CMS', 1, 5, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '4.678', 1, '', 0, 'tersedia', 'N'),
('10130', 'Teknik Pembuatan Animasi untuk Banner dan Web dengan CorelRAVE', 1, 132, 3, 2004, '2014-09-25', 1, '', '', 979731331, '6.68', 3, '', 0, 'tersedia', 'N'),
('10133', 'Membangun Aplikasi SMS Berbasis Open Source', 1, 97, 1, 2006, '2014-09-25', 1, '', '', 2147483647, '364.53', 1, '', 0, 'tersedia', 'N'),
('10137', 'Web My Profile dengan Joomla 1.5.x', 4, 141, 1, 2010, '2014-09-25', 1, '', '', 2147483647, '5', 6, '', 0, 'tersedia', 'N'),
('10138', 'Mahir Pemrograman Web dengan Adobe Flex', 1, 26, 1, 2010, '2014-09-25', 1, '', '', 2147483647, '5.3', 1, '', 0, 'tersedia', 'N'),
('10144', 'Jargon e-Business', 5, 27, 2, 2003, '2014-09-25', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('10146', 'Introduction to Visual C++.NET and C#.NET', 1, 60, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.133', 6, '', 0, 'tersedia', 'N'),
('10151', 'Bahasa Assembly dalam penerapannya pada Microprocessor', 1, 46, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '5.136', 1, '', 0, 'tersedia', 'N'),
('10154', 'Struktur Data dan Pemrograman dengan Pascal', 1, 62, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.133', 6, '', 0, 'tersedia', 'N'),
('10157', 'Membuat Homepage Pribadi dengan CFML', 1, 38, 1, 2002, '2014-09-25', 1, '', '', 2147483647, '5.365', 6, '', 0, 'tersedia', 'N'),
('10158', 'Dasar-dasar Pemrograman Borland C++', 1, 115, 1, 2000, '2014-09-25', 1, '', '', 979533624, '5.369', 6, '', 0, 'tersedia', 'N'),
('10159', 'Belajar java secara Visual + Interaktif', 1, 43, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '5.133', 6, '', 0, 'tersedia', 'N'),
('10160', 'Konsep dan Aplikasi Sistem Pendukung Keputusan', 1, 78, 5, 2007, '2014-09-25', 1, '', '', 2147483647, '658.403.02', 5, '', 0, 'tersedia', 'N'),
('10164', 'Pemrograman Mikrokontroler AT89S51 dengan C/C++', 1, 129, 1, 2007, '2014-09-25', 2, 'punya pak tri satu agak rusak,', '', 2147483647, '4.64', 6, '', 0, 'tersedia', 'N'),
('10167', 'Pemrograman Visual Basic 6.0 Tingkat Lanjut', 1, 132, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.362', 1, '', 0, 'sedang dipinjam', 'N'),
('10168', 'Pemrograman Matlab', 1, 93, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5.12', 1, '', 0, 'tersedia', 'N'),
('10169', 'Konsep Pemrograman 1', 1, 25, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5.115', 1, '', 0, 'tersedia', 'N'),
('10172', 'Panduan Praktis Membuat Aplikasi FoxPro', 5, 139, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5', 6, '', 0, 'tersedia', 'N'),
('10173', 'Konsep dasar pengolahan dan pemrograman database dengan SQL Server, Ms. Access dan Ms. Vsual Basic', 1, 40, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '5.74', 6, '', 0, 'tersedia', 'N'),
('10178', 'Visual Basic', 5, 125, 1, 2009, '2014-09-25', 1, '', '', 2147483647, '5', 6, '', 0, 'tersedia', 'N'),
('10180', 'Pengantar logika dan algoritma', 1, 140, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.1', 6, '', 0, 'tersedia', 'N'),
('10181', 'Belajar sendiri Pemrograman Pascal', 5, 85, 1, 2002, '2014-09-25', 1, '', '', 2147483647, '5', 6, '', 0, 'tersedia', 'N'),
('10182', 'Pemrograman Visual Java', 5, 48, 1, 2007, '2014-09-25', 1, '', '', 2147483647, '5', 6, '', 0, 'tersedia', 'N'),
('10184', 'Struktur Data', 8, 23, 1, 2003, '2013-05-05', 1, '', '', 979, '5.73', 1, '', 0, 'tersedia', 'N'),
('10187', 'Dasar-Dasar Algoritma & Pemrograman', 1, 49, 1, 2004, '2013-05-05', 1, '', '', 2147483647, '5.1', 1, '', 0, 'tersedia', 'N'),
('10195', 'Rekayasa Web', 1, 172, 1, 2010, '2013-05-05', 1, '', '', 2147483647, '5.12', 1, '', 0, 'tersedia', 'N'),
('10201', 'Algoritma Dan Pemrograman Menggunakan Java', 1, 147, 1, 2012, '2013-05-05', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('10204', 'Mudah Belajar Java', 8, 159, 1, 2012, '2013-05-05', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('10205', 'Tip Dan Trik Java Swing', 4, 147, 1, 2012, '2013-05-05', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10210', 'Panduan Pemrograman C++', 1, 166, 1, 2006, '2013-09-26', 1, '', '', 2147483647, '005.368.2', 1, '', 0, 'tersedia', 'N'),
('10213', 'Visual Basic 2012 Programming', 1, 132, 1, 2012, '2013-09-26', 1, '', '', 2147483647, '5.118', 1, '', 0, 'tersedia', 'N'),
('10214', 'Modul Pembelajaran Algoritma dan Pemrograman', 31, 191, 1, 2010, '2013-09-26', 1, '', '', 0, '5', 1, '', 0, 'tersedia', 'N'),
('10215', 'Algoritma dan Pemrograman dengan C++', 5, 150, 1, 2013, '2013-09-26', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('10218', 'Pemrograman Android untuk Pemula', 4, 174, 1, 2013, '2013-09-26', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10219', '24 jam!! Pintar Pemrograman Android', 1, 151, 1, 2012, '2013-09-26', 1, '', '', 2147483647, '5.117', 1, '', 0, 'tersedia', 'N'),
('10222', 'Belajar Pemrograman WEB', 31, 158, 1, 2011, '2013-09-26', 1, '', '', 602, '5', 1, '', 0, 'tersedia', 'N'),
('10223', 'Modul Pemrograman WEB HTML, PHP, MYSQL', 31, 160, 1, 2012, '2013-09-26', 1, '', '', 602, '5', 1, '', 0, 'tersedia', 'N'),
('10224', 'Java Algoritma, Struktur Data dan Pemrograman GUI', 8, 189, 1, 2013, '2013-09-26', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('10226', 'Pemrograman Database dengan Visual Basic 2010', 10, 181, 1, 2013, '2013-09-26', 1, '', '', 978, '5', 1, '', 0, 'tersedia', 'N'),
('10227', 'Step by Step menjadi Programmer Android 2013', 1, 132, 1, 2013, '2013-10-20', 1, '', '', 978, '5.133', 1, '', 0, 'tersedia', 'N'),
('10228', 'Pemrograman Visual Basic.Net 2005 dan Aplikasi Nyata dengan DBMS SQL Server 2005', 39, 148, 1, 2005, '2013-10-20', 1, '', '', 978, '5.369', 1, '', 0, 'tersedia', 'N'),
('10229', 'Super Web Design', 4, 194, 1, 2013, '2013-10-20', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10236', 'Microsoft Visual Basic 2010 & MySQL untuk Aplikasi Point of Sales', 1, 132, 1, 2011, '2013-12-27', 1, '', '', 978, '5.118', 1, '', 0, 'tersedia', 'N'),
('10237', 'VISUAL BASIC.NET MEMBUAT APLIKASI DATABASE DAN PROGRAM KREATIF', 8, 188, 1, 2012, '2013-12-27', 1, '', '', 978, '5', 1, '', 0, 'tersedia', 'N'),
('10242', 'Aplikasi Resto & Cafe dengan Visual Basic 2010 untuk Orang Awam', 10, 181, 1, 2012, '2013-02-15', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('10244', '7 Proyek Aplikasi dengan Java', 4, 149, 1, 2010, '2013-02-15', 1, '', '', 978, '5', 1, '', 0, 'tersedia', 'N'),
('10250', 'Business with a Creative Learning', 36, 179, 2, 2011, '2013-02-15', 2, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('10256', 'Membangun Aplikasi Java Enterpriese dengan Arsitektur MVC', 1, 185, 1, 2010, '2013-02-15', 1, '', '', 2147483647, '5.133', 1, '', 0, 'tersedia', 'N'),
('10258', 'Membuat Toko Online dengan PHP untuk orang awam', 10, 181, 1, 2011, '2014-09-05', 1, '', '', 2147483647, '5.13', 1, '', 0, 'tersedia', 'N'),
('10272', 'Pengolahan Citra menggunakan Delphi', 5, 200, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10273', 'Belajar Pemrograman Delphi', 31, 201, 1, 2011, '2013-09-27', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10278', 'Membuat Blog dengan Blogspot', 4, 204, 1, 2008, '2014-09-25', 1, '', '', 2147483647, '4', 6, '', 0, 'tersedia', 'N'),
('10396', 'Algoritma (Algoritma & Struktur Data 1) dengan C, C++, dan Java', 53, 317, 1, 2010, '2014-12-20', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10398', 'Visual Basic 6.0', 10, 181, 1, 2010, '2014-12-20', 1, 'CD', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10400', 'Membangun Website Interaktif dengan Adobe Creative Suite 5', 54, 320, 1, 2011, '2014-12-20', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10401', 'Template CMS', 9, 321, 1, 2009, '2014-12-20', 1, 'CD', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10412', 'Mudah menjadi Programmer (AJAX)', 55, 147, 1, 2010, '2014-12-20', 1, '', '', 2147483647, '5.3', 1, '', 0, 'tersedia', 'N'),
('10413', 'CodeIgniter: Cara Mudah membangun Aplikasi PHP', 56, 327, 1, 2010, '2014-12-20', 1, 'CD', '', 2147483647, '0', 1, '', 0, 'tersedia', 'N'),
('10414', 'Jquery BlackBox untuk Pemula', 57, 147, 1, 2011, '2014-12-20', 1, 'CD', '', 2147483647, '600', 1, '', 0, 'tersedia', 'N'),
('10415', '100% Sukses Hacking Website', 57, 328, 1, 2012, '2014-12-20', 1, 'CD', '', 2147483647, '600', 1, '', 0, 'tersedia', 'N'),
('10418', 'Membuat Helpdesk System berbasis OOP & PDO dengan PHP', 59, 330, 1, 2014, '2014-12-22', 1, 'CD', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10419', 'Program Absensi Siswa Realtime dengan PHP & SMS Gateway', 59, 331, 1, 2014, '2014-12-22', 1, 'CD', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10425', 'Belajar Sendiri Pasti Bisa jQuery', 1, 147, 1, 2013, '2014-12-22', 1, 'CD', '', 2147483647, '5.118', 1, '', 0, 'tersedia', 'N'),
('10428', 'Mobile App Development with Phone Gap', 1, 132, 1, 2014, '2014-12-22', 1, '', '', 2147483647, '5.117', 1, '', 0, 'tersedia', 'N'),
('10429', 'Soft Computing', 8, 338, 1, 2008, '2014-12-22', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10431', 'Mudah & Cepat membuat website dengan CodeIgniter', 1, 132, 1, 2011, '2014-12-22', 1, '', '', 2147483647, '5.3', 1, '', 0, 'tersedia', 'N'),
('10434', 'Membuat sendiri aplikasi e-commerce dengan PHP & MySQL menggunakan CodeIgniter & JQuery', 1, 342, 1, 2011, '2014-12-22', 1, 'CD', '', 2147483647, '4.678', 1, '', 0, 'tersedia', 'N'),
('10439', 'Buku Pintar C++ untuk Pemula', 57, 147, 1, 2012, '2014-12-22', 1, 'CD', '', 2147483647, '600', 1, '', 0, 'tersedia', 'N'),
('10447', 'Membangun Aplikasi Sistem SMS Quick Count dengan PHP', 65, 348, 1, 2014, '2014-12-27', 1, 'CD', 'asq.jpg', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10450', 'Desain Web dengan Adobe Dreamweaver CS3 + Fireworks CS3', 1, 88, 1, 2008, '2014-12-27', 1, '', '', 2147483647, '5.365', 1, '', 0, 'tersedia', 'N'),
('10451', 'Memahami Visuak C#.Net secara mudah', 1, 350, 1, 2008, '2014-12-27', 1, 'CD', '', 2147483647, '5.304', 1, '', 0, 'tersedia', 'N'),
('10452', 'Mudah menjadi Programmer Java', 55, 147, 1, 2011, '2014-12-27', 1, 'CD', '', 2147483647, '5.13', 1, '', 0, 'tersedia', 'N'),
('10453', 'Kupas Tuntas Android dari Nol sampai Mahir', 66, 351, 1, 2011, '2014-12-27', 1, '', '', 2147483647, '5', 1, '', 0, 'tersedia', 'N'),
('10456', 'Step by step Delphi 2010 Programming', 1, 132, 1, 2010, '2014-12-27', 1, '', '', 2147483647, '5.113', 1, '', 0, 'tersedia', 'N'),
('10459', 'Microsoft Visual C# 2010', 1, 132, 1, 2011, '2014-12-27', 1, '', '', 2147483647, '5.118', 1, '', 0, 'tersedia', 'N'),
('10479', 'Konsep dan Implementasi Struktur Data dengan C++', 1, 361, 1, 2012, '2015-01-13', 1, '', '', 2147483647, '5.118', 0, '', 0, 'tersedia', 'N'),
('10502', 'VB sebagai Pusat Kendali Peralatan Elektronik', 4, 390, 1, 2005, '2015-01-24', 1, 'punya pak tri', '', 979206950, '5', 0, '', 0, 'tersedia', 'N'),
('110473', 'IAENG Journal Vol.38 Issue 1', 41, 355, 11, 2011, '2013-03-01', 1, '', '', 1819, '', 0, '', 0, 'tersedia', 'N'),
('110474', 'IAENG Journal Vol.38 Issue 2', 67, 356, 11, 2011, '2013-03-01', 1, '', '', 1819, '', 0, '', 0, 'tersedia', 'N'),
('110475', 'Academy Publish Volume 2 Issue 1', 68, 357, 11, 2012, '2013-03-01', 1, '', '', 2161, '', 0, '', 0, 'tersedia', 'N'),
('110476', 'Academy Publish Volume 2 Issue 2', 68, 358, 11, 2011, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('110477', 'Academy Publish Volume 1 Issue 3', 68, 359, 11, 2011, '2013-03-01', 1, '', '', 2161, '', 0, '', 0, 'tersedia', 'N'),
('110478', 'Academy Publish Volume 1 Issue 1', 68, 360, 11, 2011, '2013-03-01', 1, '', '', 2161, '', 0, '', 0, 'tersedia', 'N'),
('20147', 'Sistem Informasi Akuntansi', 1, 126, 1, 2004, '2014-09-25', 1, '', '', 979731135, '657.42', 2, '', 0, 'tersedia', 'N'),
('20148', 'Membangun Sistem Informasi Akuntansi dengan Visual Basic dan Ms. SQL Server', 1, 79, 1, 2007, '2014-09-25', 1, '', '', 2147483647, '657.42', 1, '', 0, 'tersedia', 'N'),
('20149', 'Sistem Akuntansi Online Berbasis Komputer', 1, 132, 1, 2003, '2014-09-25', 1, '', '', 2147483647, '657.420.28', 2, '', 0, 'tersedia', 'N'),
('20161', 'Etika Komputer dan Tanggung Jawab Profesional di Bidang Teknologi Informasi', 1, 127, 2, 2006, '2014-09-25', 1, '', '', 2147483647, '658.403.8', 2, '', 0, 'tersedia', 'N'),
('20186', 'Dasar-Dasar Akuntansi Jilid 1, Edisi 7', 14, 7, 2, 2011, '2013-05-05', 1, '', '', 979, '658.48', 2, '', 0, 'tersedia', 'N'),
('20198', 'Dasar-Dasar Manajemen', 30, 196, 1, 2011, '2013-05-05', 1, '', '', 978, '658', 2, '', 0, 'tersedia', 'N'),
('20206', 'Kewirausahaan', 35, 178, 2, 2011, '2013-05-05', 1, '', '', 978, '658', 2, '', 0, 'tersedia', 'N'),
('20232', 'ETIKA BISNIS DAN PROFESI Tantangan Membangun Manusia Seutuhnya', 35, 197, 2, 2009, '2013-12-27', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('20234', 'Akuntansi dengan MYOB UNTUK PEMULA & ORANG AWAM', 26, 184, 2, 2013, '2013-12-27', 1, '', '', 0, '657453', 2, '', 0, 'tersedia', 'N'),
('20248', 'Organisasi dan Manajemen', 22, 167, 1, 1984, '2013-02-15', 1, '', '', 0, '658', 2, '', 0, 'tersedia', 'N'),
('20249', '26 Entrepreneur dan CEO Terhebat Dunia', 38, 161, 2, 2009, '2013-02-15', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20251', 'Psikologi dan Organisasi', 37, 152, 1, 2008, '2013-02-15', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20252', 'Kenapa Gagal Wawancara dan Melamar Kerja', 36, 179, 2, 2010, '2013-02-15', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20253', 'Manajemen (Dasar, Pengertian, dan Masalah)', 19, 180, 1, 2011, '2013-02-15', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20254', 'Dasar-Dasar Pembelanjaan Perusahaan', 18, 153, 1, 2008, '2013-02-15', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20255', 'Manajemen Pemasaran Modern', 27, 155, 2, 1990, '2013-02-15', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20262', 'Manajemen Bisnis', 34, 187, 1, 2009, '2014-09-05', 1, '', '', 978, '658', 2, '', 0, 'tersedia', 'N'),
('20263', 'Managing yor Better Personality', 21, 182, 2, 2009, '2014-09-05', 1, '', '', 0, '658.3', 2, '', 0, 'tersedia', 'N'),
('20264', 'Solusi Lengkap Manajemen Bisnis dengan Myob Accounting v18', 1, 132, 2, 2011, '2014-09-05', 2, '', '', 978, '657.420.28', 2, '', 0, 'tersedia', 'N'),
('20265', 'Leadpreneurship', 22, 144, 2, 2009, '2014-09-05', 1, '', '', 2147483647, '658421', 0, '', 0, 'tersedia', 'N'),
('20275', 'Menjadi Sukses di Usia Muda', 40, 75, 2, 2013, '2014-09-25', 1, '', '', 2147483647, '658', 2, '', 0, 'tersedia', 'N'),
('20426', 'Kewirausahaan', 17, 336, 2, 2013, '2014-12-22', 1, '', '', 2147483647, '', 2, '', 0, 'tersedia', 'N'),
('20430', 'Sistem Informasi Manajemen', 19, 339, 2, 2011, '2014-12-22', 1, '', '', 2147483647, '658.403.80', 2, '', 0, 'tersedia', 'N'),
('30003', 'SISTEM PAKAR TEORI DAN APLIKASI', 1, 78, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '6.33', 3, '', 0, 'tersedia', 'N'),
('30004', 'PENGANTAR BAHASA RAKITAN', 7, 94, 5, 1995, '2014-09-25', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('30005', 'PENGANTAR SISTEM PENGATURAN', 15, 120, 5, 1995, '2014-09-25', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('30006', 'PENGANTAR ORGANISASI SISTEM KOMPUTER', 7, 113, 5, 1995, '2014-09-25', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('30008', 'pasti 6 jam Microsoft Word 2007', 1, 80, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30009', 'STRATEGI RISET LEWAT INTERNET', 1, 47, 3, 2002, '2014-09-25', 1, '', '', 2147483647, '1.42', 3, '', 0, 'tersedia', 'N'),
('30011', 'BUKU LATIHAN 3D Studio MAX R4', 6, 122, 3, 2002, '2014-09-25', 1, '', '', 979203563, '6', 3, '', 0, 'tersedia', 'N'),
('30012', 'Cara mudah dan pasti mendapatkan Sertifikat Microsoft', 5, 69, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30013', 'WORKSHOP ONNO Intel Platform Administrastration Technology', 1, 94, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '6.64', 3, '', 0, 'tersedia', 'N'),
('30014', 'DIGITAL MULTI MEDIA:Animasi, Sound Editing,&Video Editing', 1, 9, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '6.7', 3, '', 0, 'tersedia', 'N'),
('30015', 'Konsep dan Latihan Menggambar 3D dengan AutoCAD', 1, 96, 3, 2003, '2014-09-25', 1, '', '', 2147483647, '6.6', 3, '', 0, 'tersedia', 'N'),
('30018', 'CARA MUDAH & PRAKTIS MENGOLAH VIDEO MENGGUNAKAN ULEAD VIDEO STUDIO 7.0', 1, 63, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '6.6', 3, '', 0, 'tersedia', 'N'),
('30020', 'Virus Komputer teori dan Praktik', 5, 107, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30021', '3DS MaxExpress', 1, 22, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '6.693', 3, '', 0, 'tersedia', 'N'),
('30022', '3D Modeling dengan Google SkethUp', 1, 91, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '6.693', 3, '', 0, 'tersedia', 'N'),
('30023', 'Bikin Animasimu Lebih Hidup dengan 3D Studio Max', 1, 109, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '6.696', 3, '', 0, 'tersedia', 'N'),
('30024', 'KOMPUTER GRAFIS:image Editing, Grapic Design, dan Page Layout', 1, 10, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30025', 'Adobe Photoshop panduan PAINTING & RETOUCHING', 1, 39, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '6.69', 3, '', 0, 'tersedia', 'N'),
('30026', 'Bikin Komik dengan Adobe IIIustrator Adobe Photoshop', 1, 84, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30027', 'Algoritma Genetik', 5, 44, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30028', 'Pengenalan Komputer', 7, 33, 5, 1996, '2014-09-25', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('30029', 'RAHASIA DESAIN DAN CETAK Peluang Bisnis Desain Grafis', 1, 75, 3, 2008, '2014-09-25', 2, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30030', 'UTILITY FOTO DIGITAL', 4, 67, 3, 2003, '2014-09-25', 1, '', '', 979, '6.69', 3, '', 0, 'tersedia', 'N'),
('30031', 'T-Shirt Distro', 1, 21, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30032', 'PENGANTAR KOMPUTER GRAFIK', 7, 116, 5, 1996, '2014-09-25', 1, '', '', 0, '5', 3, '', 0, 'tersedia', 'N'),
('30033', 'TELEKOMUNIKASI dan KOMPUTER', 7, 116, 5, 1996, '2014-09-25', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('30034', 'PENGANTAR ARSITEKTUR KOMPUTER', 7, 33, 5, 1994, '2014-09-25', 1, '', '', 0, '5', 5, '', 0, 'tersedia', 'N'),
('30038', 'Desain Grafis dengan FLASH & corelDRAW', 2, 121, 3, 2003, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30039', 'ayo Tune Up Komputer Anda', 1, 35, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '4.84', 3, '', 0, 'tersedia', 'N'),
('30048', 'Pemanfaatan Search Engine Sebagai Sarana Penunjang Proses Pembelajaran', 1, 103, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('30050', 'VIRUS KOMPUTER Teknik Pembuatan & Langkah-langkah Penanggulanganya', 1, 61, 3, 1990, '2014-09-25', 1, '', '', 0, '5', 3, '', 0, 'tersedia', 'N'),
('30052', 'Berburu Dolar dengan Google Adsense', 1, 24, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('30056', 'Buku Latihan Flash Cartoon ', 4, 121, 3, 2003, '2014-09-25', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30057', '46tips Menguasai Adobe Indesign', 5, 34, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30058', 'Mau Gaul? Mau Sukses? Pakai Facebook', 1, 39, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('30059', 'SPECIAL WORKSHOP', 1, 114, 1, 2006, '2014-09-25', 1, '', '', 2147483647, '4.65', 1, '', 0, 'tersedia', 'N'),
('30068', 'Microsoft Visio 2007', 1, 132, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30070', 'Service dan Reparasi AC', 5, 30, 8, 2009, '2014-09-25', 1, '', '', 2147483647, '0', 6, '', 0, 'tersedia', 'N'),
('30072', 'Resep Cespleng Memanfaatkan Jurus Tersembunyi Powerpoint', 1, 51, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30073', 'Ayo belajar mudah Microsoft Excel 2007', 1, 35, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30074', 'Mengubah Komputer  menjadi Playstation', 1, 55, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '5.3', 3, '', 0, 'tersedia', 'N'),
('30075', 'Memproses Berbagai Media CD/DVD dengan nero 7 Premium Ultra Edition', 4, 67, 3, 2006, '2014-09-25', 0, '', '', 2147483647, '5', 3, '', 0, 'tersedia', 'N'),
('30087', 'Trik mendayagunakan Visio', 5, 51, 3, 2007, '2014-09-25', 2, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30092', 'Special Workshop: Membuat Presentasi Interaktif dengan Macromedia Flash 8', 1, 132, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '5.365', 3, '', 0, 'tersedia', 'N'),
('30093', 'Rahasia Sukses Bisnis di Internet', 1, 131, 3, 2007, '2014-09-25', 2, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('30097', 'Belajar cepat Adobe Photoshop 6.0', 2, 112, 3, 2001, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30099', 'Nero Burning 6', 1, 42, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30101', 'Ayo lindungi komputer anda dari virus ganas', 1, 35, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '5.84', 3, '', 0, 'tersedia', 'N'),
('30102', 'Membangun Decision Support System', 1, 76, 3, 2005, '2014-09-25', 1, '', '', 2147483647, '658.403.6', 3, '', 0, 'tersedia', 'N'),
('30106', 'Kajian Strategis Cost Benefit Teknologi Informasi', 1, 102, 5, 2004, '2014-09-25', 1, '', '', 2147483647, '658.155.4', 5, '', 0, 'tersedia', 'N'),
('30108', 'PLC (Programmable Logic Control) FP Sigma', 1, 65, 1, 2007, '2014-09-25', 1, '', '', 2147483647, '629.89', 1, '', 0, 'tersedia', 'N'),
('30111', 'Sistem Kontrol I/O dan Kontrol Suara', 1, 6, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '621.3', 3, '', 0, 'tersedia', 'N'),
('30112', '30 menit bersama powerpoint 2007', 1, 41, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30119', 'Cara Mudah Belajar EasyOffice Windows', 3, 106, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30121', 'Referensi Cepat Menggunakan Microsoft Power Point 2007', 1, 58, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30123', 'Pengantar Sistem Simulasi', 1, 128, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '3.3', 3, '', 0, 'tersedia', 'N'),
('30125', 'Kolaborasi Flash, Dreamweaver, dan PHP', 1, 13, 1, 2005, '2014-09-25', 1, '', '', 2147483647, '4.678', 1, '', 0, 'tersedia', 'N'),
('30127', 'Nokia PC Suite 5 dengan Oxygen Phone Manager II', 4, 67, 3, 2004, '2014-09-25', 1, '', '', 979205241, '5', 3, '', 0, 'tersedia', 'N'),
('30129', 'Tuangkan Imajinasi Liarmu dengan Photoshop CS4', 1, 35, 3, 2009, '2014-09-25', 1, '', '', 2147483647, '6.69', 3, '', 0, 'tersedia', 'N'),
('30134', 'Cara Mudah Menguasai Komputer Forensik dan Aplikasinya', 5, 51, 3, 2005, '2014-09-25', 1, '', '', 2147483647, '5', 3, '', 0, 'tersedia', 'N'),
('30135', 'Kiat jitu menyusun skripsi', 1, 3, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '1.42', 3, '', 0, 'tersedia', 'N'),
('30136', 'Pengelolaan dan Penyelamatan Partisi Harddisk dengan System Rescue CD', 1, 51, 3, 2005, '2014-09-25', 1, '', '', 979731653, '5.8', 3, '', 0, 'tersedia', 'N'),
('30140', 'Microsoft Excel', 1, 111, 3, 2003, '2014-09-25', 2, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30141', 'Microsoft Office Word 2007', 5, 4, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '5', 3, '', 0, 'tersedia', 'N'),
('30143', 'Panduan Dasar Menggunakan StarOffice 6.0', 1, 19, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '5.3', 3, '', 0, 'tersedia', 'N'),
('30153', 'Virus Worm dan Trojan Horse', 1, 57, 3, 2004, '2014-09-25', 1, '', '', 2147483647, '5.84', 3, '', 0, 'tersedia', 'N'),
('30162', 'Tip dan Trik Macromedia Flash', 5, 1, 3, 2006, '2014-09-25', 1, '', '', 2147483647, '6', 3, '', 0, 'tersedia', 'N'),
('30163', 'Microsoft Word 2007 untuk Pemula', 1, 88, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30170', 'Microsoft Outlook 2007', 1, 88, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30175', 'Panduan Visual Photoshop 7 untuk Fotografer', 4, 2, 3, 2003, '2014-09-25', 1, '', '', 2147483647, '5', 3, '', 0, 'tersedia', 'N'),
('30179', 'Microsoft Power Point 2007 untuk menyusun presentasi profesional', 1, 132, 3, 2007, '2014-09-25', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30183', 'Panduan Hardware Komputer', 1, 8, 5, 2010, '2013-05-05', 1, '', '', 2147483647, '4.64', 5, '', 0, 'tersedia', 'N'),
('30189', 'Visio 2010', 10, 56, 3, 2011, '2013-05-05', 1, '', '', 2147483647, '5', 3, '', 0, 'tersedia', 'N'),
('30191', 'Panduan Karir Di Dunia Teknologi Informasi', 4, 135, 5, 2005, '2013-05-05', 1, '', '', 979, '', 0, '', 0, 'tersedia', 'N'),
('30212', 'Adobe Flash Professional CS6', 1, 88, 3, 2012, '2013-09-26', 1, '', '', 0, '6.7', 0, '', 0, 'tersedia', 'N'),
('30217', 'Microsoft Office 2007', 39, 183, 3, 2012, '2013-09-26', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('30225', 'Penuntun Praktis Belajar Database menggunakan MICROSOFT ACCESS', 1, 147, 3, 2004, '2013-09-26', 1, '', '', 2147483647, '005.437.69', 3, '', 0, 'tersedia', 'N'),
('30238', 'Membuat Desain Kemasan Produk dengan CorelDRAW X6 dan Adobe Photoshop CS6', 1, 132, 3, 2013, '2013-12-27', 1, '', '', 978, '6.68', 3, '', 0, 'tersedia', 'N'),
('30239', 'Belajar Otodidak COREL DRAW', 8, 163, 3, 2012, '2013-12-27', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('30240', 'Merancang Obyek 3D dengan AutoCAD 2006', 25, 145, 3, 2006, '2013-12-27', 1, '', '', 0, '5', 3, '', 0, 'tersedia', 'N'),
('30241', 'Mudah Membuat Animasi dengan Adobe Flash CS5', 1, 132, 3, 2011, '2013-02-15', 1, '', '', 978, '6.7', 3, '', 0, 'tersedia', 'N'),
('30243', 'Manipulasi FOTO Spektakuler Photoshop CS5', 10, 173, 3, 2011, '2013-02-15', 1, '', '', 978, '5', 3, '', 0, 'tersedia', 'N'),
('30245', 'Sistem Informasi Geografis dengan ArcView GIS', 1, 164, 3, 2010, '2013-02-15', 1, '', '', 978, '526.022.1', 3, '', 0, 'tersedia', 'N'),
('30257', 'Membangun SI UMKM jasa dengan MS Access', 4, 157, 3, 2010, '2014-09-05', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('30259', 'Statistik Deskriptif for IT', 1, 195, 5, 2012, '2014-09-05', 1, '', '', 2147483647, '310', 5, '', 0, 'tersedia', 'N'),
('30267', 'Pedoman Umum Ejaan Bahasa Indonesia yang disempurnakan', 24, 168, 8, 2010, '2014-09-05', 1, '', '', 2147483647, '411.52', 6, '', 0, 'tersedia', 'N'),
('30276', 'Menggambar Teknik menggunakan Autocad 2007', 5, 203, 3, 2008, '2014-09-25', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30277', 'Panduan Belajar Corel Draw 12', 1, 88, 3, 2005, '2014-09-25', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30394', 'Panduan Merakit PC', 52, 315, 3, 2003, '2014-12-20', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30399', 'Dahsyatnya Excel 2010', 4, 319, 3, 2011, '2014-12-20', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30402', 'Power Point 2010 untuk Orang Awam', 10, 322, 3, 2011, '2014-12-20', 1, 'CD', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30403', 'Microsoft Word 2010 untuk Skripsi, Tesis, & Karya Ilmiah', 1, 132, 3, 2010, '2014-12-20', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30404', 'Membuat Macro lebih Interaktif dengan Activex Control', 4, 323, 3, 2010, '2014-12-20', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30406', 'Photoshop Most Wanted Effects', 1, 325, 3, 2010, '2014-12-20', 1, 'CD', '', 2147483647, '6.69', 3, '', 0, 'tersedia', 'N'),
('30407', 'Presentasi Multimedia dengan MS-PowerPoint 2010', 1, 88, 3, 2010, '2014-12-20', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30408', 'Analisis Statistik Pendekatan Praktis dengan Microsoft Excel', 1, 326, 3, 2012, '2014-12-20', 1, 'CD', '', 2147483647, '1.4', 3, '', 0, 'tersedia', 'N'),
('30409', 'Adobe Photoshop untuk Desainer Web', 1, 132, 3, 2005, '2014-12-20', 1, '', '', 979731796, '6.69', 3, '', 0, 'tersedia', 'N'),
('30410', '25 Kreasi Grafis Populer dengan CorelDraw X6', 1, 132, 3, 2012, '2014-12-20', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30411', 'Memaksimalkan Rumus dan Fungsi Microsoft Access 2010', 1, 88, 3, 2011, '2014-12-20', 1, 'CD', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30417', 'Microsoft Access 2010', 1, 132, 3, 2010, '2014-12-20', 1, '', '', 2147483647, '5.3', 3, '', 0, 'tersedia', 'N'),
('30436', 'Kupas Tuntas bemacam aplikasi generasi cloud computing', 1, 132, 3, 2011, '2014-12-22', 1, '', '', 2147483647, '4.678', 3, '', 0, 'tersedia', 'N'),
('30438', 'Adobe Photoshop CS5 untuk Manipulasi Foto Profesional', 1, 132, 3, 2011, '2014-12-22', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30440', 'Mengolah Dokumen dengan Microsoft Word 2010', 1, 132, 3, 2010, '2014-12-22', 1, '', '', 2147483647, '5.369', 3, '', 0, 'tersedia', 'N'),
('30441', 'Ngedit Video dengan Adobe Premier cs3', 62, 344, 3, 2011, '2014-12-22', 1, 'CD', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30445', '67 Trik Tersembunyi Photoshop', 10, 346, 3, 2008, '2014-12-27', 1, 'CD', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30446', 'Panduan Cepat Kuasai Ms. Office Power Point 2010', 64, 347, 3, 2010, '2014-12-27', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30448', 'Resep Jitu Presentasi dengan Grafik', 4, 174, 3, 2011, '2014-12-27', 1, '', '', 2147483647, '4', 3, '', 0, 'tersedia', 'N'),
('30457', 'Langkah Cerdas Membasmi Virus Komputer', 1, 88, 3, 2011, '2014-12-27', 1, '', '', 2147483647, '5.84', 3, '', 0, 'tersedia', 'N'),
('30458', 'Corel Ulead Video Studio Pro X2', 1, 132, 3, 2010, '2014-12-27', 1, '', '', 2147483647, '6.68', 3, '', 0, 'tersedia', 'N'),
('30460', 'Video Editing dengan Pinnacle Studio 9', 1, 132, 3, 2005, '2014-12-27', 1, '', '', 2147483647, '6.6', 3, '', 0, 'tersedia', 'N'),
('40007', 'cara Mudah Belajar LINUX', 5, 108, 4, 2008, '2014-09-25', 1, '', '', 2147483647, '4', 4, '', 0, 'tersedia', 'N'),
('40016', 'Antena Wiraless untuk Rakyat', 1, 136, 4, 2008, '2014-09-25', 1, '', '', 2147483647, '384.5', 0, '', 0, 'tersedia', 'N'),
('40035', 'Trik Mendayagunakan Linuk', 5, 51, 4, 2006, '2014-09-25', 1, '', '', 2147483647, '4', 4, '', 0, 'tersedia', 'N'),
('40036', 'Langkah Mudah Membangun Jaringan Berbasis Windows 2003 Server', 1, 71, 4, 2006, '2014-09-25', 1, '', '', 2147483647, '4.65', 0, '', 0, 'tersedia', 'N'),
('40042', 'JARINGAN KOMPUTER', 1, 134, 4, 2007, '2014-09-25', 1, '', '', 2147483647, '4.65', 0, '', 0, 'tersedia', 'N'),
('40045', 'Panduan Mudah Merakit+Menginstal Server Linux', 1, 94, 4, 2008, '2014-09-25', 2, '', '', 2147483647, '4.425', 0, '', 0, 'tersedia', 'N'),
('40049', 'KAMUS LINUX', 1, 132, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '4.03', 0, '', 0, 'tersedia', 'N'),
('40051', 'IP Rounting dan FIREWALL dalam Linux', 1, 99, 4, 2006, '2014-09-25', 1, '', '', 2147483647, '4.65', 0, '', 0, 'tersedia', 'N'),
('40061', 'Citrix MetaframeXP', 1, 92, 4, 2003, '2014-09-25', 1, '', '', 2147483647, '5.712', 4, '', 0, 'tersedia', 'N'),
('40062', 'Server e-mail Dial-Up Menggunakan Linux', 1, 59, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '4.692', 4, '', 0, 'tersedia', 'N'),
('40077', 'Mengelola banyak PC dalam Jaringan', 1, 51, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '5.369', 0, '', 0, 'tersedia', 'N'),
('40079', 'Aplikasi Rancang Bangun di Linux menggunakan QCAD', 1, 11, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '5.42', 4, '', 0, 'tersedia', 'N'),
('40081', 'Dasar-dasar Penggunaan Linux Redhat 7.1', 1, 15, 4, 2001, '2014-09-25', 1, '', '', 2147483647, '5.432', 4, '', 0, 'tersedia', 'N'),
('40088', 'Mengelola Komputer Jaringan dengan Remote Administrator', 5, 66, 4, 2007, '2014-09-25', 1, '', '', 2147483647, '5', 4, '', 0, 'tersedia', 'N'),
('40091', 'Membuat Sever Jaringan dengan MandrakeSecurity', 1, 51, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '4', 4, '', 0, 'tersedia', 'N'),
('40098', 'Tip dan Trik Microsoft Windows XP', 1, 143, 4, 2005, '2014-09-25', 1, '', '', 979731815, '5.43', 4, '', 0, 'tersedia', 'N'),
('40100', 'PC Cloning Windows pakai Linux LTSP', 1, 94, 4, 2006, '2014-09-25', 1, '', '', 2147483647, '5.43', 0, '', 0, 'tersedia', 'N'),
('40109', 'Seri buku pintar menjadi administrator jaringan komputer', 1, 132, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '4.65', 0, '', 0, 'tersedia', 'N'),
('40110', 'Pemrograman Shell Linux', 1, 133, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '5.42', 0, '', 0, 'tersedia', 'N'),
('40113', 'Jaringan Komputer Linux', 1, 108, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '5.43', 0, '', 0, 'tersedia', 'N'),
('40116', 'Implementasi Jaringan Komputer dengan Linux Redhat 9', 1, 66, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '425', 0, '', 0, 'tersedia', 'N'),
('40120', 'Linux Desktop', 1, 89, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '5.432', 4, '', 0, 'tersedia', 'N'),
('40122', 'Lebih lanjut dengan Pemrograman C++ di Linux', 1, 70, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '005.368.2', 4, '', 0, 'tersedia', 'N'),
('40124', 'Mengamankan Linux dari bahaya hacking', 5, 51, 4, 2006, '2014-09-25', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('40128', 'Membangun Jaringan Komputer dengan Server Linux dan Client Windows', 1, 123, 4, 2007, '2014-09-25', 1, '', '', 2147483647, '4.65', 0, '', 0, 'tersedia', 'N'),
('40142', 'Membangun VPN Linux Secara Cepat', 1, 18, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '5.43', 0, '', 0, 'tersedia', 'N'),
('40150', 'Kumpulan Tool Proteksi PC dan Jaringan', 1, 132, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '658.478', 0, '', 0, 'tersedia', 'N'),
('40152', 'An Ubuntu Guide with Ubuntu8', 1, 16, 4, 2008, '2014-09-25', 1, '', '', 2147483647, '5.432', 0, '', 0, 'tersedia', 'N'),
('40155', 'Sistem Operasi', 5, 36, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('40156', 'Tips dan Trik Linux', 1, 124, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '5.432', 0, '', 0, 'tersedia', 'N'),
('40166', 'Protel Schematic Design for Windows', 1, 132, 4, 2004, '2014-09-25', 1, '', '', 2147483647, '5.369', 0, '', 0, 'tersedia', 'N'),
('40177', 'Sistem Operasi', 1, 70, 4, 2005, '2014-09-25', 1, '', '', 2147483647, '5.43', 0, '', 0, 'tersedia', 'N'),
('40193', 'Konsep Dan Implemetasi Routing', 9, 101, 1, 2012, '2013-05-05', 1, '', '', 2147483647, '5', 4, '', 0, 'tersedia', 'N'),
('40200', 'Sistem Operasi', 1, 146, 4, 2010, '2013-05-05', 1, '', '', 978, '5.43', 4, '', 0, 'tersedia', 'N'),
('40220', 'Jaringan Komputer Teori dan Implementasi Berbasis Linux', 29, 198, 4, 2007, '2013-09-26', 1, '', '', 979, '', 0, '', 0, 'tersedia', 'N'),
('40221', 'Teori dan Modul Praktikum Jaringan Komputer', 31, 171, 4, 2011, '2013-09-26', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('40269', 'Cisco CCNP dan Jaringan Komputer', 8, 171, 4, 2012, '2013-03-27', 1, '', '', 2147483647, '5', 4, '', 0, 'tersedia', 'N'),
('40270', 'Cisco CCNP dan Jaringan Komputer edisi Revisi', 8, 171, 4, 2012, '2013-03-27', 1, '', '', 2147483647, '5', 4, '', 0, 'tersedia', 'N'),
('40271', 'MCSE Windows 2000 Server Study Guide', 16, 199, 4, 2000, '2014-09-25', 1, '', '', 0, '4', 4, '', 0, 'tersedia', 'N'),
('40274', 'Mengenal Wireless LAN (WLAN)', 1, 202, 4, 2007, '2014-09-25', 1, '', '', 2147483647, '384.5', 4, '', 0, 'tersedia', 'N'),
('40393', 'Aplikasi General Ledger Menggunakan Visual FoxPro', 1, 12, 1, 2004, '2014-09-25', 1, '', '', 2147483647, '5.758', 1, '', 0, 'tersedia', 'N'),
('40395', 'Pemrograman Jaringan dengan Java', 1, 316, 4, 2011, '2014-12-20', 1, 'CD', '', 2147483647, '5.133', 4, '', 0, 'tersedia', 'N'),
('40397', 'Jaringan Komputer untuk Orang Awam', 10, 318, 4, 2007, '2014-12-20', 1, 'CD', '', 2147483647, '5', 4, '', 0, 'tersedia', 'N'),
('40421', 'Networking Hacking dengan Linux BackTrack', 1, 132, 4, 2012, '2014-12-22', 1, '', '', 2147483647, '4.65', 4, '', 0, 'tersedia', 'N'),
('40427', 'Jurus Kilat membuat Jaringan Komputer', 62, 337, 4, 2014, '2014-12-22', 1, 'CD', '', 2147483647, '4', 4, '', 0, 'tersedia', 'N'),
('40449', 'Optimalisasi Windows untuk Orang Awam', 10, 349, 4, 2009, '2014-12-27', 1, 'CD', '', 2147483647, '4', 4, '', 0, 'tersedia', 'N'),
('40454', 'Sistem Operasi', 1, 352, 4, 2008, '2014-12-27', 1, '', '', 2147483647, '5.43', 4, '', 0, 'tersedia', 'N'),
('40500', 'Pengembangan Jaringan Linux', 1, 132, 4, 2003, '2015-01-16', 1, 'punya mba Nana', '', 2147483647, '5.432', 4, '', 0, 'tersedia', 'N'),
('50040', 'Kamus Istilah TEKNOLOGI IFORMASI', 1, 49, 5, 2002, '2014-09-25', 1, '', '', 2147483647, '4.03', 5, '', 0, 'tersedia', 'N'),
('50053', 'Model Kesuksesan Sistem Teknologi Informasi', 1, 74, 5, 2007, '2014-09-25', 1, '', '', 2147483647, '658.403.80', 5, '', 0, 'tersedia', 'N'),
('50065', 'Step by Step Microsoft Exchange 5.0', 4, 31, 1, 1998, '2014-09-25', 1, '', '', 2147483647, '5', 6, '', 0, 'tersedia', 'N'),
('50066', 'MCSE Windows 2000 Directory Services Administrasion Study Guide', 16, 17, 4, 2000, '2014-09-25', 2, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('50103', 'Elektronika Dasar & Peripheral Komputer', 1, 117, 5, 2004, '2014-09-25', 1, '', '', 2147483647, '621.398', 5, '', 0, 'tersedia', 'N'),
('50139', 'Analisa Sistem Informasi', 1, 126, 5, 2004, '2014-09-25', 1, '', '', 2147483647, '658.403 80', 5, '', 0, 'tersedia', 'N'),
('50165', 'Sistem Basis Data', 5, 87, 5, 2004, '2014-09-25', 1, '', '', 2147483647, '5', 5, '', 0, 'tersedia', 'N'),
('50174', 'Manajemen Database Identitas', 1, 142, 5, 2005, '2014-09-25', 1, '', '', 2147483647, '5.74', 5, '', 0, 'tersedia', 'N'),
('50176', 'Pengantar Basis Data', 7, 120, 5, 1996, '2014-09-25', 1, '', '', 0, '5', 5, '', 0, 'tersedia', 'N'),
('50188', 'Sql Server 2008', 1, 132, 5, 2010, '2013-05-05', 1, '', '', 978, '5.74', 5, '', 0, 'tersedia', 'N'),
('50190', 'Sistem Informasi Manajemen', 1, 126, 5, 2005, '2013-05-05', 1, '', '', 979, '658.403.8', 0, '', 0, 'tersedia', 'N'),
('50192', 'Pengantar Sistem Informasi', 7, 53, 5, 1992, '2013-05-05', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('50194', 'Database Relational Dengan Mysql', 1, 29, 5, 2005, '2013-05-05', 1, '', '', 979, '5.756', 0, '', 0, 'tersedia', 'N'),
('50196', 'Pengenalan Teknologi Informasi', 1, 176, 5, 2005, '2013-05-05', 1, '', '', 979, '658.403.8', 5, '', 0, 'tersedia', 'N'),
('50197', 'Manajemen Proyek Sistem Informasi', 1, 192, 5, 2012, '2013-05-05', 1, '', '', 978, '658404', 5, '', 0, 'tersedia', 'N'),
('50199', 'Komunikasi Data', 1, 162, 5, 2002, '2013-05-05', 1, '', '', 979, '', 0, '', 0, 'tersedia', 'N'),
('50202', 'Rekayasa Perangkat Lunak (Terstruktur Dan Berorientasi Obyek)', 31, 191, 5, 2011, '2013-05-05', 1, '', '', 978, '4', 5, '', 0, 'tersedia', 'N'),
('50203', 'Basis Data', 8, 165, 5, 2012, '2013-05-05', 1, '', '', 978, '4', 5, '', 0, 'tersedia', 'N'),
('50207', 'Teknologi Komunikasi Data Modern', 1, 175, 5, 2013, '2013-05-05', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('50208', 'Struktur Data', 8, 23, 1, 2008, '2013-09-26', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('50209', 'RPL', 8, 191, 5, 2013, '2013-09-26', 1, '', '', 978, '', 0, '', 0, 'tersedia', 'N'),
('50211', 'Multimedia Digital', 1, 70, 3, 2010, '2013-09-26', 1, '', '', 978, '6.7', 3, '', 0, 'tersedia', 'N'),
('50216', 'Analisis dan Perancangan Sistem', 33, 177, 5, 2010, '2013-09-26', 1, '', '', 2147483647, '', 0, '', 0, 'tersedia', 'N'),
('50230', 'Metodologi Penelitian SISTEM INFORMASI', 1, 74, 5, 2008, '2013-12-27', 1, '', '', 2147483647, '1.4', 5, '', 0, 'tersedia', 'N'),
('50231', 'Dasar Perancangan & Implementasi Database Relasional', 1, 147, 5, 2008, '2013-12-27', 1, '', '', 2147483647, '5.74', 5, '', 0, 'tersedia', 'N'),
('50233', 'MANAJEMEN PROYEK BERBASIS TEKNOLOGI INFORMASI', 8, 170, 5, 2013, '2013-12-27', 1, '', '', 978, '658404', 5, '', 0, 'tersedia', 'N'),
('50235', 'Dasar-dasar Statistika', 17, 190, 8, 2003, '2013-12-27', 1, '', '', 979, '519', 6, '', 0, 'tersedia', 'N'),
('50246', 'Interaksi Manusia dan Komputer', 1, 186, 5, 2004, '2013-02-15', 1, '', '', 979, '5', 5, '', 0, 'tersedia', 'N'),
('50247', 'Ilmu Pendidikan Islam', 20, 156, 8, 2009, '2013-02-15', 1, '', '', 0, '200', 6, '', 0, 'tersedia', 'N'),
('50260', 'Information System Management in Practice', 28, 154, 5, 2006, '2014-09-05', 1, '', '', 0, '4', 5, '', 0, 'tersedia', 'N'),
('50261', 'Komputer dan Masyarakat', 1, 126, 5, 2013, '2014-09-05', 1, '', '', 2147483647, '4', 5, '', 0, 'tersedia', 'N'),
('50266', 'Mastery on English Grammar', 25, 169, 8, 2011, '2014-09-05', 1, '', '', 0, '0', 6, '', 0, 'tersedia', 'N'),
('50279', 'Rekayasa Perangkat Lunak', 8, 191, 5, 2013, '2013-03-01', 1, '', '', 2147483647, '4', 5, '', 0, 'tersedia', 'N'),
('50435', 'Komputer & Masyarakat', 8, 343, 5, 2014, '2014-12-22', 1, '', '', 2147483647, '', 5, '', 0, 'tersedia', 'N'),
('50437', 'Pengantar Teknologi Informasi', 1, 126, 5, 2014, '2014-12-22', 1, '', '', 2147483647, '4', 5, '', 0, 'tersedia', 'N'),
('50444', 'Rekayasa Perangkat Lunak', 1, 172, 5, 2010, '2014-12-27', 1, '', '', 2147483647, '5.1', 5, '', 0, 'tersedia', 'N'),
('50455', 'Keamanan Sistem Informasi', 1, 353, 5, 2011, '2014-12-27', 1, '', '', 2147483647, '658.4', 5, '', 0, 'tersedia', 'N'),
('50498', 'Dasar-Dasar Metodologi Penelitian', 1, 377, 5, 2014, '2014-12-20', 1, '', '', 2147483647, '1.42', 2, '', 0, 'tersedia', 'N'),
('50499', 'Pengenalan Komputer', 1, 74, 5, 2005, '2015-01-15', 1, 'punya mba Nana', '', 2147483647, '4', 2, '', 0, 'tersedia', 'N'),
('50501', 'Berkarya dengan Mikrokontroler AT89C2051', 4, 389, 5, 2006, '2015-01-24', 2, 'punya pak tri', '', 2147483647, '4', 0, '', 0, 'tersedia', 'N'),
('50503', 'Teori dan Aplikasi Mikrokontroler', 5, 391, 5, 2005, '2015-01-24', 1, 'punya pak tri', '', 2147483647, '4', 0, '', 0, 'tersedia', 'N'),
('60280', 'Sistem Komputerisasi Penjualan Produk pada PT. Asaputex Nusantara Tegal', 41, 247, 6, 1998, '2014-09-25', 1, '96743192', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60281', 'Perancangan Sistem Informasi Pengolahan Data Tabungan pada PD. Badan Kredit Kecamatan Slawi', 41, 248, 6, 2006, '2014-09-25', 1, '2303034', '', 0, '0', 0, '<p>lorem lorem lorem lorem</p>\r\n', 0, 'tersedia', 'N'),
('60282', 'Sistem Komputerisasi Inventaris pada Perusahaan Daerah Air Minum (PDAM) Slawi', 41, 249, 6, 2006, '2014-09-25', 1, '193114', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60283', 'Sistem Komputerisasi dan Pengolahan Data Stock Barang pada Rumah Makan Sampurna Tegal', 41, 250, 6, 2006, '2014-09-25', 1, '2303027', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60284', 'Sistem Komputerisasi Restoran pada Hotel Taguya Tegal', 41, 251, 6, 2005, '2014-09-25', 1, '183115', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60285', 'Komputerisasi Data Perkreditan pada BPR Bangun Randu Kencana', 41, 252, 6, 1999, '2014-09-25', 1, '96743061', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60286', 'Perancangan Sistem Komputerisasi Pembayaran Pajak Bumi dan Bangunan (PBB) pada Kantor Pelayanan Paja', 41, 253, 6, 2005, '2014-09-25', 1, '2303017', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60287', 'Sistem Komputerisasi Pembayaran Pasien Rawat Inap pada RSU Kardinah Tegal', 41, 254, 6, 2005, '2014-09-25', 1, '1293115', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60288', 'Sistem Komputerisasi Stok Obat pada Balai Pengobatan Penyakit Paru-Paru (BP 4) Tegal', 41, 255, 6, 2006, '2014-09-25', 1, '1293050', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60289', 'Sistem Komputerisasi Penjualan pada CV. Emerald Indo Jaya Tegal', 41, 256, 6, 2005, '2014-09-25', 1, '1293073', '', 0, '', 0, '', 0, 'tersedia', 'N');
INSERT INTO `t_buku` (`kd_buku`, `judul`, `kd_penerbit`, `kd_pengarang`, `kd_kategori`, `tahun`, `tgl_perolehan`, `jumlah_buku`, `ket`, `cover`, `isbn`, `ddc`, `rak`, `abstraksi`, `jum_hal`, `status`, `most_new`) VALUES
('60290', 'Sistem Informasi Manajemen pada Perpustakaan Dinas P dan K UPTD Slawi Kab. Tegal', 41, 257, 6, 2005, '2014-09-25', 1, '1293093', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60291', 'Sistem Komputerisasi Kaur Hasil Hutan Perum Perhutani KPH Balapulang', 41, 258, 6, 2005, '2014-09-25', 1, '1293026', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60292', 'Sistem Komputerisasi Pemasukan dan Pengeluaran Kas pada Lembaga Pendidikan Komputer AISI Tegal', 41, 259, 6, 2005, '2014-09-25', 1, '1293098', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60293', 'Sistem Komputerisasi Persediaan Barang pada PT. Asaputex Nusantara Tegal', 41, 260, 6, 2006, '2014-09-25', 1, '2303005', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60294', 'Sistem Informasi Penjualan dan Pembelian pada Dedy Jaya Motor Tegal', 41, 261, 6, 2005, '2014-09-25', 1, '2303101', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60295', 'Sistem Informasi Pengolahan Data Pajak Hotel pada Dinas Perhubungan dan Pariwisata Kabupaten Tegal', 41, 262, 6, 2006, '2014-09-25', 1, '1293011', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60296', 'Sistem Komputerisasi Stock Beras pada Kantor Bulog Sub Divre Wilayah VI Pekalongan', 41, 263, 6, 2006, '2014-09-25', 1, '2303003', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60297', 'Sistem Komputerisasi Penjualan Produk Sarung Tenun pada PT. Asaputex Nusantara Tegal', 41, 264, 6, 2006, '2014-09-25', 1, '2303009', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60298', 'Sistem Informasi pada UPTD Perpustakaan Umum di Dinas Pendidikan dan Kebudayaan Kabupaten Tegal', 41, 265, 6, 2006, '2014-09-25', 1, '1293053', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60299', 'Sistem Komputerisasi Stock Barang pada Perusahaan Daerah Air Minum (PDAM) Kabupaten Tegal', 41, 266, 6, 2006, '2014-09-25', 1, '1293033', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60300', 'Sistem Komputerisasi Penggajian Karyawan pada CV. Bima Amantik Tegal', 41, 267, 6, 2001, '2014-09-25', 1, '98963106', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60301', 'Perancangan Sistem Informasi Layanan Klaim pada PT. Asuransi Jasa Indonesia Cabang Tegal', 41, 268, 6, 2009, '2014-09-25', 1, '6733013', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60302', 'Perancangan Aplikasi Media Pembelajaran Desain Grafis Berbasis Web di STMIK AMIK YMI Tegal', 41, 269, 6, 2009, '2014-09-25', 1, '5623006', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60303', 'Perancangan Sistem Informasi Pengadaan dan Penghapusan Barang Milik Negara pada Kejaksaan Negeri Teg', 41, 270, 6, 2008, '2014-09-25', 1, '3413037', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60304', 'Sistem Informasi Perpustakaan Digital pada SMP N 1 Tegal', 41, 271, 6, 2009, '2014-09-25', 1, '6733016', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60305', 'Perancangan Sistem Informasi Persediaan Bawang Merah pada UD. Hasil Bumi HRD Brebes', 41, 272, 6, 2008, '2014-09-25', 1, '4513026', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60306', 'Perancangan Sistem Informasi Penerimaan Tamu pada Hotel Kudus Permata Kabupaten Tegal', 41, 273, 6, 2007, '2014-09-25', 1, '4513024', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60307', 'Perancangan Sistem Informasi Persediaan The Hijau pada CV. Duta Jaya Tea Industri Kab. Tegal', 41, 274, 6, 2007, '2014-09-25', 1, '1293095', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60308', 'Membuat PC Router dengan Mikrotik OS Studi Kasus Jaringan Intranet SMP N 1 Tegal', 41, 275, 6, 2010, '2014-09-25', 1, '7834006', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60309', 'Aplikasi Pengolahan Data Tabungan pada BPR BKK Talang Cabang Dukuhturi Kabupaten Tegal', 41, 276, 6, 2008, '2014-09-25', 1, '5623013', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60310', 'Aplikasi Web Sebagai Media Promosi pada Plaza Hotel Tegal', 41, 277, 6, 2009, '2014-09-25', 1, '6733008', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60311', 'Komputerisasi Rekam Medik Morbiditas Pasien Rawat Inap pada RSUD Dokter Soeselo Kabupaten Tegal', 41, 278, 6, 2008, '2014-09-25', 1, '4513028', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60312', 'Perancangan Sistem Informasi Perpustakaan pada SMP N 1 Tegal', 41, 279, 6, 2009, '2014-09-25', 1, '6733007', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60313', 'Perancangan Sistem Informasi Penjualan dan Pembelian Barang pada UD. Mulya Damai Tegal', 41, 280, 6, 2007, '2014-09-25', 1, '3413023', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60314', 'Perancangan Sistem Informasi Stok Barang Jadi pada PT Sampurnatex Tegal', 41, 281, 6, 2007, '2014-09-25', 1, '3413012', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60315', 'Rancangan Sistem Informasi Penjualan Sarung Tenun pada PT. Asaputex Nusantara Tegal', 41, 282, 6, 2007, '2014-09-25', 1, '3413014', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60316', 'Sistem Informasi Penjualan Barang pada PT Columbia Sub Cabang Tegal', 41, 283, 6, 2007, '2014-09-25', 1, '3413005', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60317', 'Sistem Informasi Tabungan BPR Adiwerna', 41, 284, 6, 2010, '2014-09-25', 1, '7834002', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60318', 'Komputerisasi Penerimaan Peserta Didik Baru (PPDB) pada SMP Negeri 12 Tegal', 41, 285, 6, 2009, '2014-09-25', 1, '5623010', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60319', 'Rancangan Sistem Informasi Rawat Inap Pasien pada Rumah Sakit Umum Islam (RSUI) Harapan Anda Tegal', 41, 286, 6, 2007, '2014-09-25', 1, '3413027', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60320', 'Komputerisasi Pengolahan Data Simpan Pinjam pada KUD Daya Bhakti', 41, 287, 6, 2003, '2014-09-25', 1, '99073123', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60321', 'Perancangan Sistem Informasi Bahan Baku pada PT Sampurnatex Tegal', 41, 288, 6, 2007, '2014-09-25', 1, '2303107', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60322', 'Sistem komputerisasi Pengolahan Data Sewa Tanah Obyek Wisata Purwahamba Indah pada Dinas Perhubungan', 41, 289, 6, 2006, '2014-09-25', 1, '1293007', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60323', 'Sistem Komputerisasi Pengolahan Data Tabungan pada PT Bank Perkreditan Rakyat (BPR) Arthapuspa Mega ', 41, 290, 6, 2001, '2014-09-25', 1, '98963119', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60324', 'Sistem Informasi Stock Barang pada PT. Plambo Pratama Tegal', 41, 291, 6, 2006, '2014-09-25', 1, '183034', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60325', 'Sistem Informasi Pengolahan Data Pinjaman pada Perusahaan Daerah Badan Kredit Kecamatan (BKK) Slawi ', 41, 292, 6, 2006, '2014-09-25', 1, '2303001', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60326', 'Perancangan Sistem Informasi Tagihan Rekening Air Minum pada Perusahaan Daerah Air Minum (PDAM) Kabu', 41, 293, 6, 2006, '2014-09-25', 1, '2303033', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60327', 'Sistem Informasi Distribusi Beras pada Sub Divre VI Pekalongan', 41, 294, 6, 2006, '2014-09-25', 1, '2303038', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60328', 'Rancangan Sistem Informasi Upah Mingguan Wartawan Honorer Harian Radar Tegal pada PT Wahana Semesta', 41, 295, 6, 2007, '2014-09-25', 1, '3413025', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60329', 'Perancangan Sistem Informasi Pengolahan Data Iklan pada Harian Pagi Radar Tegal', 41, 296, 6, 2007, '2014-09-25', 1, '3413016', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60330', 'Perancangan Sistem Informasi Pembelian Perlengkapan Kantor pada Perusahaan Daerah Air Minum (PDAM) K', 41, 297, 6, 2007, '2014-09-25', 1, '3413041', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60331', 'Rancangan Sistem Informasi Persediaan Barang Jadi pada PT Fumakilla Indonesia Perwakilan Tegal', 41, 298, 6, 2007, '2014-09-25', 1, '2303011', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60332', 'Sistem Informasi pada Perusahaan Daerah Air Minum (PDAM) Kabupaten Brebes', 41, 299, 6, 2007, '2014-09-25', 1, '3413017', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60333', 'Rancangan Sistem Informasi Simpan Pinjam pada Baitul Maal Wat Tamwil Syirkah Muawanah Nahdlatul Ulam', 41, 300, 6, 2007, '2014-09-25', 1, '3413036', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60334', 'Perancangan Sistem Informasi Tagihan Rekening Air Minum pada Perusahaan Daerah Air Minum (PDAM) Kabu', 41, 301, 6, 2007, '2014-09-25', 1, '2303037', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60335', 'Perancangan Sistem Informasi Penjualan dan Pembelian Voucher Isi Ulang Kartu Pra Bayar pada UD. Sumb', 41, 302, 6, 2007, '2014-09-25', 1, '1293021', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60336', 'Perancangan Sistem Informasi Stok Barang Instalasi Sarana pada Badan Pengelola Rumah Sakit Umum Daer', 41, 303, 6, 2007, '2014-09-25', 1, '4513015', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60337', 'Perancangan Sistem Informasi Penjualan pada PT Sampurnatex Tegal', 41, 304, 6, 2007, '2014-09-25', 1, '3413038', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60338', 'Sistem Informasi Pengambilan Barang pada Perum Pegadaian Slawi', 41, 305, 6, 2007, '2014-09-25', 1, '3413013', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60339', 'Perancangan Sistem Informasi Penjualan pada Supermarket Mulya Dana Tegal', 41, 306, 6, 2007, '2014-09-25', 1, '3413022', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60340', 'Komputerisasi Penggajian Pegawai pada PT. Cipta Niaga Tegal', 41, 213, 6, 2001, '2014-09-25', 1, '0018109/00181027', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60341', 'Sistem Komputerisasi Inventaris Alat-Alat Kantor di Perum Perhutani KPH Pekalongan Barat-Slawi', 41, 214, 6, 2000, '2014-09-25', 1, '99071112/99071107', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60342', 'Sistem Komputerisasi Pendataan Karyawan di KSU Sembada Guna Tegal', 41, 215, 6, 2000, '2014-09-25', 1, '99071131', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60343', 'Sistem Komputerisasi Prosedur Penyaluran Beras pada Sub Dolog Wilayah VI Pekalongan', 41, 216, 6, 2003, '2014-09-25', 1, '1291002', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60344', 'Sistem Pendataan Stok Barang pada KSU Swasembada Guna Tegal dengan Aplikasi dBase III+', 41, 217, 6, 2000, '2014-09-25', 1, '99071058/99071057', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60345', 'Sistem Komputerisasi Pendataan Stok Barang pada KPRI Sinar Murni Jatibarang', 41, 218, 6, 2004, '2014-09-25', 1, '02301005 / 01291032', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60346', 'Sistem Aplikasi Peminjaman Buku Perpustakaan SMU Negeri 1 Slawi', 41, 219, 6, 2001, '2014-09-25', 1, '00181051/00181054', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60347', 'Sistem Komputerisasi Inventaris pada Kantor Pengolahan Data Elektronik dan Kearsipan Pemerintah Daer', 41, 220, 6, 2005, '2014-09-25', 1, '3411004', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60348', 'Sistem Komputerisasi Stock Motor pada UD. Tiga Bersaudara Motor Adiwerna Tegal', 41, 221, 6, 2003, '2014-09-25', 1, '0230100/02301012', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60349', 'Aplikasi Dbase III Plus dalam Penggajian pada CV. Frintakaru di Lingkungan Industri Kecil ( LIK ) Te', 41, 222, 6, 1998, '2014-09-25', 1, '97851014', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60350', 'Analisa Sistem Administrasi Pinjaman pada Unit Simpan Pinjam KUD "BHAKTI" Tanjung', 41, 223, 6, 2006, '2014-09-25', 1, '5621006', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60351', 'Sistem Komputerisasi Pengolahan Data Upah Karyawan dengan Aplikasi dBase III+ pada Setia  Kawan Tega', 41, 224, 6, 2000, '2014-09-25', 1, '99071014/99071016', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60352', 'Sistem Komputerisasi Rencana Anggaran Biaya Pemasangan Sambungan Baru di PDAM DATI II Brebes', 41, 225, 6, 2000, '2014-09-25', 1, '99071079/99071087', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60353', 'Komputerisasi Pendataan Stock Barang pada CV. Yamaha Utama Nusantara Motor Slawi', 41, 226, 6, 2001, '2014-09-25', 1, '00181048/00181036', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60354', 'Komputerisasi Pengolahan Data Pegawai pada Badan Koordinasi Keluarga Berencana Nasional Kota Tegal', 41, 227, 6, 2001, '2014-09-25', 1, '00181003/00181044', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60355', 'Komputerisasi Servis Kendaraan Bermotor pada CV. Yamaha Utama Nusantara Motor Slawi', 41, 228, 6, 2001, '2014-09-25', 1, '181052', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60356', 'Sistem Komputerisasi Inventaris pada Kantor Pengolahan Data Elektronik dan Kearsipan Pemerintah Daer', 41, 229, 6, 2005, '2014-09-25', 1, '3411014', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60357', 'Sistem Pengolahan Data Pajak Hotel dan Restoran pada Kantor Pariwisata dan Perhubungan Kabupaten Teg', 41, 230, 6, 2005, '2014-09-25', 1, '04511012/04511013', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60358', 'Sistem Pengolahan Data Penjualan pada UD. Surya Utama Perkasa (SUPER) Motor Banjaran-Tegal', 41, 231, 6, 2005, '2014-09-25', 1, '04511001/04511005', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60359', 'Sistem Komputerisasi Stock Barang pada KPRI "Sinar Murni" Jatibarang Kabupaten Brebes', 41, 232, 6, 2003, '2014-09-25', 1, '01291011/01291030', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60360', 'Rancangan Sistem Pengolahan Data Kepegawaian Politeknik Keselamatan Transportasi Jalan Kota Tegal', 41, 205, 6, 2013, '2013-02-05', 1, '12183008', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60361', 'Perancangan Sistem Kependudukan di Kecamatan Dukuhturi Kabupaten Tegal', 41, 206, 6, 2013, '2013-02-05', 1, '12183007', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60362', 'Aplikasi Sistem Pengajuan Kredit di KSU Swamitra Dewi Sri Tegal', 41, 207, 6, 2013, '2013-02-05', 1, '12183004', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60363', 'Perancangan Aplikasi Pendataan Akta Tanah di Kecamatan Wanasari', 41, 208, 6, 2013, '2013-02-05', 1, '12183011', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60364', 'Sistem Informasi Perekrutan Tenaga Kerja di BKK SMK N 1 Adiwerna', 41, 209, 6, 2013, '2013-02-05', 1, '12183006', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60365', 'Aplikasi Pendataan Kartu Tanda Penduduk di Kantor Kecamatan Dukuhturi', 41, 210, 6, 2013, '2013-02-05', 1, '12183009', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('60366', 'Rancangan Sistem Informasi Perhitungan Pajak Pegawai Politeknik Keselamatan Transportasi Jalan Kota ', 41, 211, 6, 2013, '2013-02-05', 1, '12183005', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70010', 'ILMU LINGKUNGAN', 5, 54, 8, 2007, '2014-09-25', 1, '', '', 2147483647, '0', 6, '', 0, 'tersedia', 'N'),
('70132', 'Khutbah Jumat Ekonomi Syariah', 13, 86, 7, 2008, '2014-09-25', 1, '', '', 2147483647, '0', 0, '', 0, 'tersedia', 'N'),
('70145', 'Himpunan dan Logika Samar serta Aplikasinya', 5, 110, 8, 2009, '2014-09-25', 1, '', '', 2147483647, '519', 6, '', 0, 'tersedia', 'N'),
('70171', 'Simulasi Komputer Sistem Diskrit', 1, 20, 8, 2007, '2014-09-25', 1, '', '', 2147483647, '670', 6, '', 0, 'tersedia', 'N'),
('70185', 'Aljabar For Dummies', 12, 90, 8, 2010, '2013-05-05', 1, '', '', 978, '519', 6, '', 0, 'tersedia', 'N'),
('70268', 'Kiat Menulis Artikel pada Jurnal Nasional Terakreditasi', 1, 193, 7, 2014, '2014-09-05', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70367', 'Sistem Informasi Penjualan Pakaian pada Distro ONFIRE Tegal', 41, 233, 7, 2014, '2014-07-10', 1, '12383039', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70368', 'Sistem Informasi Pembayaran Pembiayaan LPB KUMKM Tegal', 41, 234, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70369', 'Sistem Informasi Penilaian Kinerja Karyawan pada PT. Bank Sahabat Purba Danarta Slawi', 41, 235, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70370', 'Sistem Informasi Pengolahan Data barang di Toko Mas Mantep Putra Jaya Tegal', 41, 236, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70371', 'Sistem Informasi Penggajian Pegawai pada UPTD PU Pengairan Balapulang', 41, 237, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70372', 'Sistem Informasi Pendaftaran Siswa Baru pada SMA Negeri 1 Balapulang', 41, 238, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70373', 'Sistem Informasi Absensi Siswa di MI Hidayatul Mubtadiin Harjosari Kidul-Adiwerna', 41, 239, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70374', 'Sistem Informasi Perpustakaan pada SMP PLUS NU 01 Penawaja Talang', 41, 240, 7, 2014, '2014-07-10', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70375', 'Sistem Informasi Gaji Karyawan pada PT. Telesindo Shop dengan menggunakan Microsoft Visual Basic 6.0', 41, 241, 7, 2014, '2014-07-10', 1, '12383003', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70376', 'Sistem Informasi Gaji Pegawai pada CV. Sinar Perkasa Talang', 41, 242, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70377', 'Sistem Informasi Data Pegawai pada TK Aisyiyah Bilingual Slawi', 41, 243, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70378', 'Sistem Informasi Penjualan Obat pada Apotek Amalia Tegal', 41, 244, 7, 2014, '2014-07-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70379', 'Perancangan Sistem Informasi Kependudukan pada Desa Cempaka Kecamatan Bumijawa', 41, 245, 7, 2014, '2014-10-10', 1, '', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70380', 'Perancangan Sistem Informasi Pengolahan Data Anak Buah Kapal Berbasis Web pada PT. Media Maritim Teg', 41, 246, 7, 2014, '2014-10-10', 1, 'CD', '', 0, '', 7, '', 0, 'tersedia', 'N'),
('70387', 'Perancangan Sistem Informasi Kepegawaian pada Kantor Urusan Agama Kecamatan Talang', 41, 311, 7, 2014, '2014-11-15', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70388', 'Perancangan Sistem Informasi Penggajian Karyawan pada PT Hidup Artha Mandiri Tegal', 41, 312, 7, 2014, '2014-11-15', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70389', 'Perancangan Sistem Informasi Tagihan Rekening PDAM pada Kabupaten Tegal Berbasis Web', 41, 210, 7, 2014, '2014-11-15', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70390', 'Perancangan Sistem Informasi Penjualan pada PT Asaputex Jaya Tegal', 41, 211, 7, 2014, '2014-11-15', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70391', 'SISTEM INFORMASI PENGOLAHAN DAFTAR PEMILIH TETAP KPU KABUPATEN BREBES', 41, 313, 7, 2014, '2014-11-17', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70392', 'SISTEM INFORMASI NILAI ULANGAN HARIAN BERBASIS WEB PADA MTS NU 01 KRAMAT', 41, 314, 7, 2014, '2014-11-17', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70495', 'Sistem Informasi Penggajian pada BMT Bina Ummat Mandiri Tegal', 41, 375, 7, 2014, '2015-01-14', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('70496', 'Perancangan Sistem Informasi Pengolahan Data Logistik pada PT. Pamitran Brebes Adhidaya', 41, 376, 7, 2014, '2015-01-14', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('80381', 'Lolong Lelaki Lansia', 42, 307, 8, 2013, '2013-03-01', 1, '', '', 0, '0', 6, '', 0, 'tersedia', 'N'),
('80405', 'Aljabar Linier Elementer', 22, 324, 8, 1981, '2014-12-20', 1, '', '', 0, '', 6, '', 0, 'tersedia', 'N'),
('80416', 'Pendidikan Kewarganegaraan Berbasis Nilai', 58, 329, 8, 2010, '2014-12-20', 1, '', '', 0, '4', 4, '', 0, 'tersedia', 'N'),
('80420', 'Belajar Bahasa Indonesia', 60, 93, 8, 2011, '2014-12-22', 1, '', '', 0, '', 8, '', 0, 'tersedia', 'N'),
('80422', 'Tata Kalimat Bahasa Indonesia', 61, 333, 8, 2012, '2014-12-22', 1, '', '', 2147483647, '', 8, '', 0, 'tersedia', 'N'),
('80423', 'Matematika Terapan untuk Bisnis dan Ekonomi', 18, 334, 8, 2012, '2014-12-22', 1, '', '', 2147483647, '8', 8, '', 0, 'tersedia', 'N'),
('80424', 'Pokok-pokok Materi Statistik 1', 19, 335, 8, 2012, '2014-12-22', 1, '', '', 2147483647, '', 8, '', 0, 'tersedia', 'N'),
('80432', 'Statistik | Teori dan Aplikasi', 22, 340, 8, 2008, '2014-12-22', 1, '', '', 0, '', 8, '', 0, 'tersedia', 'N'),
('80433', 'Matematika Ekonomi dan Bisnis', 35, 341, 8, 2014, '2014-12-22', 1, '', '', 2147483647, '', 8, '', 0, 'tersedia', 'N'),
('80442', 'Kamus Inggris Indonesia', 6, 345, 8, 2010, '2014-12-20', 1, '', '', 2147483647, '0', 8, '', 0, 'tersedia', 'N'),
('80443', 'How do they say them in English?', 1, 112, 8, 2011, '2014-12-27', 1, '', '', 2147483647, '420.076', 8, '', 0, 'tersedia', 'N'),
('90382', 'Info Linux 10/2010', 43, 308, 9, 2010, '2013-03-01', 1, '', '', 0, '', 6, '', 0, 'tersedia', 'N'),
('90383', 'Simetris Jurnal Volume 1 No.1', 45, 310, 9, 2012, '2013-03-01', 2, '', '', 0, '', 6, '', 0, 'tersedia', 'N'),
('90384', 'Simetris Jurnal Volume 3 No.1', 45, 310, 9, 2013, '2013-03-01', 2, '', '', 0, '', 6, '', 0, 'tersedia', 'N'),
('90385', 'BISKOM', 44, 309, 9, 2010, '2013-03-01', 2, '', '', 0, '', 6, '', 0, 'tersedia', 'N'),
('90386', 'Simetris Jurnal Volume 2 No.1', 45, 310, 9, 2012, '2013-03-01', 2, '', '', 0, '', 6, '', 0, 'tersedia', 'N'),
('90480', 'Jurnal Sistem Komputer Vol. 1 No. 2', 69, 362, 9, 2011, '2013-03-01', 1, '', '', 2087, '', 0, '', 0, 'tersedia', 'N'),
('90481', 'Jurnal Sistem Komputer Vol. 2 No. 2', 69, 362, 9, 2012, '2013-03-01', 1, '', '', 2087, '', 0, '', 0, 'tersedia', 'N'),
('90482', 'Jurnal Sistem Komputer Vol. 2 No. 1', 69, 363, 9, 2012, '2013-03-01', 1, '', '', 2087, '', 0, '', 0, 'tersedia', 'N'),
('90483', 'Jurnal Sistem Komputer Vol. 1 No. 1', 69, 363, 9, 2011, '2013-03-01', 1, '', '', 2087, '', 0, '', 0, 'tersedia', 'N'),
('90484', 'Jurnal Ilmu Komputer dan Informasi Vol. 4 No. 1', 70, 364, 9, 2011, '2013-03-01', 1, '', '', 2088, '', 0, '', 0, 'tersedia', 'N'),
('90485', 'Pekomnas Vol. 15 No. 1', 71, 365, 9, 2012, '2013-03-01', 1, '', '', 1411, '', 0, '', 0, 'tersedia', 'N'),
('90486', 'Jurnal Generic Vol. 5 No. 1', 72, 366, 9, 2010, '2013-03-01', 1, '', '', 1907, '', 0, '', 0, 'tersedia', 'N'),
('90487', 'Jurnal Generic Vol. 5 No. 2', 72, 367, 9, 2010, '2013-03-01', 1, '', '', 1907, '', 0, '', 0, 'tersedia', 'N'),
('90488', 'Jurnal Generic Vol. 6 No. 2 Hal. 1-32', 72, 368, 9, 2011, '2013-03-01', 1, '', '', 1907, '', 0, '', 0, 'tersedia', 'N'),
('90489', 'Jurnal Generic Vol. 6 No. 2 Hal. 33-70', 72, 369, 9, 2011, '2013-03-01', 1, '', '', 1907, '', 0, '', 0, 'tersedia', 'N'),
('90490', 'Jurnal Ilmu Komputer dan Informasi Vol. 5 No. 1', 70, 370, 9, 2012, '2013-03-01', 1, '', '', 0, '', 0, '', 0, 'tersedia', 'N'),
('90491', 'Jurnal Ilmu Komputer dan Informasi Vol. 4 No. 2', 70, 371, 9, 2011, '2013-03-01', 1, '', '', 2088, '', 0, '', 0, 'tersedia', 'N'),
('90492', 'Jurnal Ilmu Komputer dan Informasi Vol. 5 No. 2', 70, 372, 9, 2012, '2013-03-01', 1, '', '', 2088, '', 0, '', 0, 'tersedia', 'N'),
('90493', 'Journal Intelligent Systems and Business Intelligence', 73, 373, 9, 2012, '2013-03-01', 1, '', '', 2302, '', 0, '', 0, 'tersedia', 'N'),
('90494', 'Jurnal Ilmiah Ilmu Komputer Vol. 14 No. 1', 74, 374, 9, 2010, '2013-03-01', 1, '', '', 1693, '', 0, '', 0, 'tersedia', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `t_chat`
--

CREATE TABLE IF NOT EXISTS `t_chat` (
  `id` int(23) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `chat` varchar(250) NOT NULL,
  `tgl` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_chat`
--

INSERT INTO `t_chat` (`id`, `nama`, `chat`, `tgl`) VALUES
(1, 'pandu aldi pratama', 'Komentar pertama ... ', '2015-07-09 23:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `t_info`
--

CREATE TABLE IF NOT EXISTS `t_info` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `label` varchar(10) NOT NULL,
  `tgl_publish` datetime NOT NULL,
  `cover` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `t_info`
--

INSERT INTO `t_info` (`id`, `judul`, `deskripsi`, `label`, `tgl_publish`, `cover`) VALUES
(1, 'Profil Perpustakaan AMIK YMI TEGAL', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor eos id laudantium in mollitia numquam ipsum dolores nisi rerum corrupti. Explicabo, mollitia voluptates consequatur placeat nisi temporibus ipsum vero maiores! ini adalah profil perpustkaan amik ymi tegal</p>\r\n', 'profil', '2015-06-15 15:14:19', 'perpus.jpg'),
(2, 'Informasi Pembayaran Denda Buku Perpustakaan', '<p>DI beritahukan Kepada mahasiswa AMIK YMI Tegal bahwa mulai hari ini, setiap keterlambatan lebih dari 7 hari akan dikenakan denda sebesar Rp. 500,- berlaku kelipatannya.</p>\n', 'pengumuman', '2015-06-17 04:07:36', ''),
(3, 'Perpustaaan umum indonesia', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto officia velit voluptates quae architecto aut tempora esse dolorum necessitatibus eaque facilis illum adipisci, maxime dolore placeat voluptatem, obcaecati, voluptatibus nostrum.</p>\r\n', 'artikel', '2015-07-06 18:17:47', 'lailatul_coding.jpg'),
(5, 'web Kopertis 6', 'http://www.kopertis6.or.id/', 'link', '2015-07-07 02:38:07', 'kopertis 6.jpg'),
(6, 'web amik tegal', 'http://www.amiktegal.ac.id/', 'link', '2015-07-07 02:38:21', 'amik_tegal.png'),
(7, 'visi dan misi perpustakaan', '<p>kamsasiasijaisj</p>\r\n', 'lain', '2015-06-23 03:59:02', 'Rizki-Ridho.jpeg'),
(8, 'web perpusnas', 'http://www.pnri.go.id/', 'link', '2015-07-07 02:38:32', 'logo_perpusnas.png'),
(9, 'situ simak', 'http://simak.amiktegal.ac.id/mahasiswa/login.php', 'link', '2015-07-07 02:36:13', 'SIMAK.png'),
(10, 'situ simkeu', 'http://simkeu.amiktegal.ac.id/login.php', 'link', '2015-07-07 02:36:57', 'SIMKEU.png'),
(11, 'situ simpmb', 'http://pmb.amiktegal.ac.id/', 'link', '2015-07-07 02:37:40', 'SIMPMB.png'),
(12, 'Pengambilan KHS Semester Genap 2014/2015', '<p>Diberitahukan kepada semua mahasiswa AMIK YMI TEGAL, Bahwa Pengambilan KHS Semester Ganjil 2014/2015 di mulai pada:</p>\r\n\r\n<p><strong>Tanggal = 13 Juni 2015</strong><br />\r\n<br />\r\nAdapun anda dapat melihat dan mencetak KRS dan KHS online dengan cara:<br />\r\n&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Masuk ke SITU Center atau dengan cara klik <a href="http://amiktegal.ac.id/panel" target="_blank">disini</a></li>\r\n	<li>Pilih panel SIMAK - Mahasiswa</li>\r\n	<li>Login dengan username dan password anda</li>\r\n	<li>Setelah berhasil login, pilih menu KRS/KHS anda</li>\r\n	<li>Klik tombol cetak jika ingin cetak KRS/KHS anda</li>\r\n</ol>\r\n\r\n<p><br />\r\n<br />\r\nDemikian harap diperhatikan, Terimakasih.<br />\r\nBest Regards,</p>\r\n', 'pengumuman', '2015-07-07 08:23:28', ''),
(13, 'Pengisian KRS Semester Ganjil 2015/2016', '<p>Diberitahukan kepada semua mahasiswa AMIK YMI TEGAL, Bahwa Pengisian KRS Semester Genap 2015/2016 di mulai pada:</p>\r\n\r\n<p><strong>Tanggal = 13 Juni 2015</strong><br />\r\n<br />\r\nAdapun anda dapat melihat dan mencetak KRS dan KHS online dengan cara:<br />\r\n&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Masuk ke SITU Center atau dengan cara klik <a href="http://amiktegal.ac.id/panel" target="_blank">disini</a></li>\r\n	<li>Pilih panel SIMAK - Mahasiswa</li>\r\n	<li>Login dengan username dan password anda</li>\r\n	<li>Setelah berhasil login, pilih menu KRS/KHS anda</li>\r\n	<li>Klik tombol cetak jika ingin cetak KRS/KHS anda</li>\r\n</ol>\r\n\r\n<p><br />\r\n<br />\r\nDemikian harap diperhatikan, Terimakasih.<br />\r\nBest Regards,<br />\r\n<br />\r\n<br />\r\nBAAK AMIK YMI TEGAL</p>\r\n', 'pengumuman', '2015-07-07 08:27:50', ''),
(14, 'Pendaftaran SP Semester Genap TA. 2014/2015', '<p>Diberitahukan kepada semua mahasiswa AMIK YMI TEGAL, Bahwa:</p>\r\n\r\n<ol>\r\n	<li>Pendaftaran Semester Pendek (SP) Semester Genap TA. 2015/2016 paling lambat <strong>Tanggal 27 Juli 2015</strong></li>\r\n	<li>Libur lebaran untuk Staff <strong>Tanggal 12 s.d 26 Juli 2015</strong></li>\r\n	<li>Sehingga selama libur lebaran kampus tidak memberikan pelayanan</li>\r\n</ol>\r\n\r\n<p><br />\r\nDemikian harap diperhatikan, Terimakasih.</p>\r\n', 'pengumuman', '2015-07-07 08:28:23', ''),
(18, 'Fasilitas Booking Buku Online Perpustakaan AMIK YMI Tegal', '<p>Bagi mahasiswa/i AMIK YMI Tegal yang telah terdaftar sebagai anggota perpustakaan. Dapat memiliki fasilitas booking buku sebelum anda pinjam. Berikut prosedur cara membooking buku perpustakaan :</p>\r\n\r\n<ol>\r\n	<li>Silahkan login terlebih dahulu (Pastikan akun anggota telah di aktivasi).</li>\r\n	<li>Pilih judul buku yang akan di booking pada katalog buku.</li>\r\n	<li>Klik link Booking buku pada deskripsi buku.</li>\r\n	<li>Setelah Muncul Windows klik Booking Buku. Proses buku selesai.</li>\r\n</ol>\r\n\r\n<p>Mahasiswa hanya di batasi 2 buku yang akan di booking. Jika di sistem kami mendapati lebih dari 2 buku kami akan menghapus data booking tersebut. Batas tempo maksimal booking buku sebelum di pinjam adalah 3 hari. Sistem akan otomatis menghapus data booking anda jika batas tempo telah habis</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Terima Kasih</p>\r\n\r\n<p>Admin</p>\r\n', 'pengumuman', '2015-07-09 23:28:08', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_kategori`
--

CREATE TABLE IF NOT EXISTS `t_kategori` (
  `kd_kategori` int(3) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(20) NOT NULL,
  PRIMARY KEY (`kd_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `t_kategori`
--

INSERT INTO `t_kategori` (`kd_kategori`, `kategori`) VALUES
(1, 'Programming'),
(2, 'Manajemen'),
(3, 'Application and Edit'),
(4, 'Networking and Opera'),
(5, 'Information System, '),
(6, 'Tugas Akhir'),
(7, 'Laporan PKL & Peneli'),
(8, 'Umum'),
(9, 'Journal, Comp. Magaz'),
(10, 'Modul Kuliah'),
(11, 'International Journa'),
(12, 'E-book');

-- --------------------------------------------------------

--
-- Table structure for table `t_peminjaman`
--

CREATE TABLE IF NOT EXISTS `t_peminjaman` (
  `kd_pinjam` int(9) NOT NULL,
  `id_anggota` int(9) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_hrskembali` date NOT NULL,
  `ket` varchar(100) NOT NULL,
  PRIMARY KEY (`kd_pinjam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_peminjaman`
--

INSERT INTO `t_peminjaman` (`kd_pinjam`, `id_anggota`, `tgl_pinjam`, `tgl_hrskembali`, `ket`) VALUES
(90715001, 201506001, '2015-07-09', '2015-07-16', ''),
(120715002, 201506001, '2015-07-12', '2015-07-19', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_penerbit`
--

CREATE TABLE IF NOT EXISTS `t_penerbit` (
  `kd_penerbit` int(3) NOT NULL AUTO_INCREMENT,
  `penerbit` varchar(20) NOT NULL,
  PRIMARY KEY (`kd_penerbit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `t_penerbit`
--

INSERT INTO `t_penerbit` (`kd_penerbit`, `penerbit`) VALUES
(1, 'ANDI'),
(2, 'Datakom'),
(3, 'Dinastindo'),
(4, 'Elek Media Komputind'),
(5, 'Graha Ilmu'),
(6, 'Gramedia'),
(7, 'GUNADARMA'),
(8, 'Informatika Bandung'),
(9, 'Jasakom'),
(10, 'Maxicom'),
(11, 'O Reilly'),
(12, 'Pakar Karya Bandung'),
(13, 'PKES'),
(14, 'STIE Ykpn Yogyakarta'),
(15, 'Suryadi'),
(16, 'SYBEX'),
(17, 'ALFABETA'),
(18, 'BPFE-Yogyakarta'),
(19, 'Bumi Aksara'),
(20, 'CV. Pustaka Setia'),
(21, 'Diva Press'),
(22, 'Erlangga'),
(23, 'Esensi Erlangga Grou'),
(24, 'Hi-Fest Publishing'),
(25, 'INDAH Surabaya'),
(26, 'Laskar AKSARA'),
(27, 'Liberty-Yogyakarta'),
(28, 'Pearson Prentice Hal'),
(29, 'Penerbit Gava Media'),
(30, 'Penerbit Mandar Maju'),
(31, 'Penerbit Modula'),
(33, 'PT Indeks'),
(34, 'Rineka Cipta'),
(35, 'Salemba Empat'),
(36, 'STEMBI Bandung'),
(37, 'UIP'),
(38, 'Venus'),
(39, 'Yrama Widya'),
(40, 'Platinum'),
(41, 'AMIK YMI TEGAL'),
(42, 'FLP'),
(43, 'PC Media'),
(44, 'Langkah Swadaya Mand'),
(45, 'UMK'),
(52, 'Dataprin'),
(53, 'Mitra Wacana Media'),
(54, 'Skripta'),
(55, 'Yescom'),
(56, 'Media Kita'),
(57, 'MediaKom'),
(58, 'Ghalia Indonesia'),
(59, 'Lokomedia'),
(60, 'Cakrawala Media'),
(61, 'Refika Aditama'),
(62, 'Dunia Komputer'),
(64, 'Baduose Media'),
(65, 'Kresnamedia'),
(66, 'Gudang Ilmu'),
(67, 'IAENG'),
(68, 'Academy Publish'),
(69, 'Universitas Diponego'),
(70, 'Universitas Indonesi'),
(71, 'Balai Besar Pengkaji'),
(72, 'Universitas Sriwijay'),
(73, 'UDINUS Semarang'),
(74, 'IPB'),
(75, 'Batavia Press'),
(76, 'Kompas Gramedia');

-- --------------------------------------------------------

--
-- Table structure for table `t_pengarang`
--

CREATE TABLE IF NOT EXISTS `t_pengarang` (
  `kd_pengarang` int(3) NOT NULL AUTO_INCREMENT,
  `pengarang` varchar(50) NOT NULL,
  PRIMARY KEY (`kd_pengarang`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=393 ;

--
-- Dumping data for table `t_pengarang`
--

INSERT INTO `t_pengarang` (`kd_pengarang`, `pengarang`) VALUES
(1, 'A. Zainul Fanani'),
(2, 'Adi Kurniadi'),
(3, 'Agnes Maria Polina dan Jong Jek Siang'),
(4, 'Ahmad Iskandar Z dan Taryana Suryana'),
(5, 'Ahmad Luthfie'),
(6, 'Ahmad Muammar'),
(7, 'Al. Haryono Yusup'),
(8, 'Ali Zaki'),
(9, 'Amir Fatah Sofyan,Agus Purwanto'),
(10, 'Amir Fatah Sofyan,Tonny Hidayat'),
(11, 'Andhie Lala Adam dan Rafiza'),
(12, 'ANDI'),
(13, 'Andi Pramono, M. Syafii'),
(14, 'Andi Sunyoto'),
(15, 'Andry Syahputra'),
(16, 'Anggoro Dewanto dan Erlangga Al Farozi'),
(17, 'Anil Desai,with James Cellis'),
(18, 'Aris Wendy dan Ahmad SS Ramadhana'),
(19, 'Aryo Prasetyo'),
(20, 'Asmungi'),
(21, 'Atang Sukirman'),
(22, 'Aulia Soma'),
(23, 'Bambang Hariyanto'),
(24, 'Bambang Lakso Yuwono'),
(25, 'Bernaridho Hutabarat'),
(26, 'Budi Susilo,dkk'),
(27, 'Budi Sutedjo Dharma Oetomo dan Jarot Priyogutomo'),
(28, 'Budi Sutedjo Dharma Oetomo, Yosia Handoko'),
(29, 'Bunafit Nugroho'),
(30, 'Buntarto'),
(31, 'Catapult'),
(32, 'Cybertron Solution'),
(33, 'D. SURYADI H.S'),
(34, 'Dharna A'),
(35, 'Digibook Technology'),
(36, 'Djoko Hartomo'),
(37, 'Eko Indriyawan'),
(38, 'Eko Yuwono'),
(39, 'ELCOM'),
(40, 'Ema Utami dan Sukrisno'),
(41, 'Erwin Sutomo'),
(42, 'Eryanto Sitorus & Andi Ismayadi'),
(43, 'Eueung Mulyana'),
(44, 'Fadlisyah Arnawan Faisal'),
(45, 'Fadlisyah, Adzuha Desmi, T. Iqbal Faridiansyah'),
(46, 'Fadlisyah, Nurdin, Burhanuddin'),
(47, 'FandyTjiptono & Totok Budi Santoso'),
(48, 'Fatchurrohman dan Achmad Basuki'),
(49, 'Fathul Wahid'),
(50, 'Felix Andreas Sutanto'),
(51, 'Firrar Utdirartatmo'),
(52, 'Frans Thamura'),
(53, 'Gunadarma'),
(54, 'H.R Mulyanto'),
(55, 'Hajiyanto'),
(56, 'Handi Chandra'),
(57, 'Happy Chandraleka'),
(58, 'Hari Widjanarko'),
(59, 'Harijanto Pribadi'),
(60, 'Hary Gunarto'),
(61, 'Hatojo Salim'),
(62, 'Heri Sismoro dan Kusrini Iskandar'),
(63, 'Herly Saptoadji'),
(64, 'Heru Purwanto'),
(65, 'Husanto & Thomas'),
(66, 'Husni'),
(67, 'Ian Chandra K'),
(68, 'Ibnu Gunawan, Djoni H. Setaibudi'),
(69, 'Ibnu Gunawan,Rudy  Adipranata'),
(70, 'Iwan Binanto'),
(71, 'Iwan Setiawan'),
(72, 'Jaja Jamaludin Malik'),
(73, 'Jasmadi'),
(74, 'Jogiyanto HM'),
(75, 'Joko Raharjo'),
(76, 'Julius hermawan'),
(77, 'Kok Yung'),
(78, 'Kusrini'),
(79, 'Kusrini dan Andri Koniyo'),
(80, 'Laksamana Media'),
(81, 'Lim Phek Yiong'),
(82, 'Lingga Wardana'),
(83, 'Lukman Hakim'),
(84, 'Lusia Susiani'),
(85, 'M. Hasbi'),
(86, 'M. Nadratuzzaman Hosen, dkk'),
(87, 'M.A. Ineke Pakereng dan Teguh Wahyono'),
(88, 'Madcoms'),
(89, 'Mandahadi Kusuma & Hari Sudibyo'),
(90, 'Mary Jane Sterling'),
(91, 'Mikael Sugianto'),
(92, 'Moh.Sulhan'),
(93, 'Muhammad Arhami dan Anita Desiani'),
(94, 'Onno W purbo'),
(95, 'O Reilly & Associates, Inc'),
(96, 'Philip Christiawan'),
(97, 'Prasetya Ambang Utomo'),
(98, 'Rachmad Saleh,Sulistawan,M Lutfi'),
(99, 'Rachmat Rafiudin'),
(100, 'Raden Budiarto'),
(101, 'Rendra Towidjojo'),
(102, 'Richards Eko Indrajit'),
(103, 'Richardus Eko Indrajit,Alexander Rusli,Marta Adi D'),
(104, 'Ridi Ferdiana'),
(105, 'Ridwan sanjaya,Tommy Hendrawan'),
(106, 'Rijanto Tosin dan Juni Muliawan Faizal'),
(107, 'Rindra Yusianto'),
(108, 'Samuel Prakoso'),
(109, 'Seno Suharyo'),
(110, 'Setiadji'),
(111, 'Singgih Santoso'),
(112, 'Slamet Riyanto'),
(113, 'SOEPONO SOEPARLAN'),
(114, 'Soetam Rizky'),
(115, 'Steve Potts dan Clayton Walnum'),
(116, 'Subiyantoro'),
(117, 'Sugiri'),
(118, 'Sulhan Setiawan'),
(119, 'Sunneng Sandino Berutu'),
(120, 'Suryadi'),
(121, 'Suryanto Thabarani'),
(122, 'Suryanto Thabarani,Bayu Adjie'),
(123, 'Suyanto EA, dkk'),
(124, 'Syafii'),
(125, 'Taryana Suryana'),
(126, 'Tata Sutabri'),
(127, 'Teguh Wahyono'),
(128, 'Thomas J. Kakiay'),
(129, 'Tim Lab. Mikroprosesor'),
(130, 'Tjendry Herianto'),
(131, 'W. Imanto'),
(132, 'Wahana Komputer'),
(133, 'Wahyu Wijanarko'),
(134, 'Wiharsono Kurniawan'),
(135, 'Wiwit Siswoutomo'),
(136, 'Wowok'),
(137, 'X-Oerang Technology'),
(138, 'YB Mulyana'),
(139, 'Yosafat Chayo'),
(140, 'Yulikuspartono'),
(141, 'Yuniar Supardi'),
(142, 'Yuniarto Nurwono'),
(143, 'Yusmadi'),
(144, 'A.B. Susanto'),
(145, 'A.Taufiq Hidayatullah'),
(146, 'Abas Ali Pangera Dan Dony Ariyus'),
(147, 'Abdul Kadir'),
(148, 'Ade Rahmat dan Yono Suryadi'),
(149, 'Aloysius Sigit W'),
(150, 'Andi Kristanto'),
(151, 'Arif Akbarul Huda'),
(152, 'Ashar Sunyoto Munandar'),
(153, 'Bambang Riyanto'),
(154, 'Barbara C. McNurlin, Ralph H. Sprague, Jr'),
(155, 'Basu Swastha DH dan Irawan'),
(156, 'Beni Ahmad Saebani'),
(157, 'Bonnie Soeherman, Steven Ariyanto, Maria Vanessa Y'),
(158, 'Budi Raharjo'),
(159, 'Budi Raharjo, Imam Heryanto, Arif Haryono'),
(160, 'Budi Raharjo, Imam Heryanto, Enjang RK'),
(161, 'Daru Wijayanti'),
(162, 'Dc Green'),
(163, 'Dedi Mulyadi R'),
(164, 'Eko Budiyanto'),
(165, 'Fathansyah'),
(166, 'Frieyadie'),
(167, 'Gibson Ivancevich Donnely'),
(168, 'Hi-Fest'),
(169, 'Imam D. Djauhari'),
(170, 'Imam Heryanto dan Totok Triwibowo'),
(171, 'Iwan Sofana'),
(172, 'Janner Simarmata'),
(173, 'Jayan'),
(174, 'Jubilee Enterprise'),
(175, 'Jusak'),
(176, 'Kadir, Abdul Dan Ch, Terra Triwahyuni'),
(177, 'Kendall, Kenneth E, Kendall, Julie E'),
(178, 'Leonardus Saiman'),
(179, 'M. Budi Djatmiko'),
(180, 'Malayu S.P Hasibuan'),
(181, 'Muhammad Sadeli'),
(182, 'Muhammad Taqi Ustmani'),
(183, 'Nana Suarna'),
(184, 'NIZAM MANSOOR'),
(185, 'Nur Widiyanto'),
(186, 'P. Insap Santosa'),
(187, 'Pandji Anoraga'),
(188, 'Priyanto Hidayatullah'),
(189, 'R. H. Sianipar'),
(190, 'Riduwan'),
(191, 'Rosa A. S Dan M. Shalahuddin'),
(192, 'Rudi Tantra'),
(193, 'Sonnny Heru Priyanto'),
(194, 'Su Rahman'),
(195, 'Sudaryono, Asep Saefullah, Untung Rahardja'),
(196, 'Sukarna'),
(197, 'Sukrisno Agoes dan I Cenik Ardana'),
(198, 'Wagito'),
(199, 'Lisa Donald and James Chellis'),
(200, 'Fadlinsyah, Taufiq, Zulfikar, Fauzan'),
(201, 'Kusnassriyanto'),
(202, 'Zaenal Arifin'),
(203, 'Deni, Salwin, Eva, Fadlisyah'),
(204, 'Ridwan Sanjaya'),
(205, 'Devi Febriyani'),
(206, 'Herlina Wiyani'),
(207, 'Ismi Aminul Khasanah'),
(208, 'Danu Mahardika'),
(209, 'Mega Nurjanah'),
(210, 'Siti Amalia'),
(211, 'Kiki Tri Wulandari'),
(212, 'Maulana Abdurahman'),
(213, 'Sanidah dan SitiBaety Ilmi'),
(214, 'Siti Masrohati dan Sunarsih'),
(215, 'Suciati Mustikasari'),
(216, 'Sarnida Sinabariba'),
(217, 'Rina Afriani dan Sumirah'),
(218, 'Hasan Mubarok dan Johan Untung Raharjo'),
(219, 'Sri Waljiyati dan Dian Yuliani'),
(220, 'Santi Nurlyta Sari'),
(221, 'Rosa Indika dan Juriyah'),
(222, 'Tjasmudi'),
(223, 'Ike Wijayanti'),
(224, 'Murianingsih dan Susanti'),
(225, 'Eka Henry Martioningsih dan Heppy Krisna'),
(226, 'Minhatun Maola dan Sri Mulyaningsih'),
(227, 'Eka Damayanti dan Dwi Linda Melani'),
(228, 'Lia Rustianty Setiawani'),
(229, 'Marheti Ardiani'),
(230, 'Eris Utami dan Aprilia Nur Hidayah'),
(231, 'Nurlaela dan Sri Ayati'),
(232, 'Rosiyati dan Nugraheni M.D'),
(233, 'Herlyna Purwanty'),
(234, 'Fitriasih'),
(235, 'Intan Diyana'),
(236, 'Eka Putri Lestari'),
(237, 'Resti Pertiwi'),
(238, 'Irawati Dwi Andayani'),
(239, 'Siti Umi Khamidah'),
(240, 'Dyah Permata Sarie'),
(241, 'Ade Fitri Yani'),
(242, 'Qoriatul Rizka Aenur'),
(243, 'Nur Dwi Hartini'),
(244, 'Novita Sri Astuti'),
(245, 'Binti Ismahiya'),
(246, 'Apri Wulandari'),
(247, 'Dian Asri Yunanti'),
(248, 'Nurul Dina Auliyah'),
(249, 'Adam Maulana'),
(250, 'Murni Rahmawati'),
(251, 'Neneng Zulfa'),
(252, 'Moh. Bagir'),
(253, 'Yeyen Marliah'),
(254, 'Suci Novianti'),
(255, 'Nur Wati'),
(256, 'Luhuro Setiyawan'),
(257, 'Wuri Ambarwati'),
(258, 'Hanifah'),
(259, 'Yusiana Puspa Sari'),
(260, 'Eri Krisnawati'),
(261, 'Dwi Adhi Arianto'),
(262, 'Beny Sulistiyadi'),
(263, 'Rizal Aji Prasojo'),
(264, 'Sutini'),
(265, 'Eka Herwanti'),
(266, 'Sugeng Raharjo'),
(267, 'Irkhamudin'),
(268, 'Krisnawati'),
(269, 'Alfi Nur Azis'),
(270, 'Bambang DwiSusanto'),
(271, 'Dennis Kurniawan'),
(272, 'Achmad Abdul Ghofir'),
(273, 'Cisilia Fina Anjela'),
(274, 'Eko Sulistiono'),
(275, 'Nurul Fadilah'),
(276, 'Rodiersih'),
(277, 'Herry Setiyawan'),
(278, 'Tatag Sindu Hatmoko'),
(279, 'Abdul Basri'),
(280, 'Ahmad Arief Fadlil'),
(281, 'Arif Budianto'),
(282, 'Hendro Setiono'),
(283, 'Heni Arianti'),
(284, 'Heru Siswono'),
(285, 'Dina Irmawati'),
(286, 'Sumiyati'),
(287, 'Tanti Mulyani'),
(288, 'Arif Mujiarto'),
(289, 'Datuk Suhendro'),
(290, 'Iwan Setiawan'),
(291, 'Mariana'),
(292, 'Puji Trisnawati'),
(293, 'Dede Indra Setiawan'),
(294, 'Tony Zamroni'),
(295, 'Latifah Abdat'),
(296, 'Idah Faridah'),
(297, 'Khusnul Herynah'),
(298, 'Lia Rosmiati'),
(299, 'Iim Naimah'),
(300, 'Suciati'),
(301, 'Sri Darmayanti'),
(302, 'Ari Saptyoyudo'),
(303, 'Raghastya Yoga Permana'),
(304, 'Malisi Adi Wibowo'),
(305, 'Khurotul Aeni'),
(306, 'Achmad Mustofa'),
(307, 'S.N Ratmana'),
(308, 'PC Media'),
(309, 'Langkah Swadaya Mandiri'),
(310, 'UMK'),
(311, 'Endah Safitri'),
(312, 'Uswatun Khasanah'),
(313, 'WINDHY OCTAVIA PUTRI RAGIL'),
(314, 'MOHAMAD RAMLAN'),
(315, 'Oke Hendradhy dan Asep Suheri'),
(316, 'Agus Kurniawan'),
(317, 'Moh. Sjukani'),
(318, 'Wahidin'),
(319, 'Adi Kusrianto'),
(320, 'Heni A. Puspitosari'),
(321, 'Eri Bowo dan Kurniawan dgt'),
(322, 'Dwi Ninggar'),
(323, 'Yudhi Wicaksono'),
(324, 'Howard Anton dan Pantur Silaban'),
(325, 'Dhani Yudhiantoro dan Kamila N. L'),
(326, 'Suliyanto'),
(327, 'Antonius Nugraha Widhi Pratama'),
(328, 'C.W. Aditya'),
(329, 'Ine Kusuma Aryani dan Markum Susatim'),
(330, 'Hendra Santoso'),
(331, 'Aminudin'),
(332, 'Muhammad Rohmadi & Aninditya Sri Nugraheni'),
(333, 'Ida Bagus Putrayasa'),
(334, 'Dumairy'),
(335, 'M. Iqbal Hasan'),
(336, 'Buchari Alma'),
(337, 'Alexius Setyo Widijanuarto'),
(338, 'Suyanto'),
(339, 'Sondang P. Siagian'),
(340, 'J. Supranto'),
(341, 'Josep Bintang Kalangi'),
(342, 'Riyanto'),
(343, 'I Putu Agus Eka Pratama'),
(344, 'Melvy Ayuningtyas'),
(345, 'Jhon M. Echolis dan Hassan Shadily'),
(346, 'Fandi'),
(347, 'Laksamana'),
(348, 'Akhmad Dharma Kasman'),
(349, 'Irawan'),
(350, 'Budi Hartanto'),
(351, 'Endah Tri Utami'),
(352, 'Kusnadi dkk'),
(353, 'IBISA'),
(354, 'AMIK YMI TEGAL'),
(355, 'James Hamilton dkk'),
(356, 'Yoyon K. Suprapto dkk'),
(357, 'Arash Mohammadi'),
(358, 'Giovanni Sagio dkk'),
(359, 'Samuel Ace Winchenbach dkk'),
(360, 'Jorge de Andres Sanches dkk'),
(361, 'Lamhot Sitorus & David J.M. Sembiring'),
(362, 'Kurniawan Teguh Martono dkk'),
(363, 'Rinta Kridalukmana dkk'),
(364, 'Elly Matul Imah dkk'),
(365, 'Tasmil dkk'),
(366, 'Iyan Supriyana dkk'),
(367, 'Jaidan Jauhari dkk'),
(368, 'Norsharina Abu Bakar dkk'),
(369, 'Saparudin dkk'),
(370, 'Sudi Mungkasi dkk'),
(371, 'Aryuanto Soetedjo dkk'),
(372, 'Agustian K. Herdianta dkk'),
(373, 'Yanuar Wicaksono dkk'),
(374, 'Hari Agung Adrianto dkk'),
(375, 'Octavan Fajrinshah'),
(376, 'Nurdiansyah Nova K'),
(377, 'Suwartono'),
(378, 'Moch. Tofik'),
(379, 'Eko Koswara'),
(380, 'Didik Dwi Prasetyo'),
(381, 'Pamungkas'),
(382, 'Uus Rusmawan'),
(383, 'Bunafit Nugroho & Cuk Subiyantoro'),
(384, 'David Odang'),
(385, 'Privida Kristiono'),
(386, 'Retna Prasetia & Catur Edi Widodo'),
(387, 'Jaja Jamaludin Malik'),
(388, 'Firdaus'),
(389, 'Nino Guevara Ruwano'),
(390, 'Suhata'),
(391, 'Sudjadi'),
(392, 'Prima Info Sarana Media');

-- --------------------------------------------------------

--
-- Table structure for table `t_pengembalian`
--

CREATE TABLE IF NOT EXISTS `t_pengembalian` (
  `kd_pengembalian` int(9) NOT NULL,
  `kd_pinjam` int(9) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` int(11) NOT NULL,
  `kd_buku` varchar(10) NOT NULL,
  `kondisi` varchar(10) NOT NULL,
  PRIMARY KEY (`kd_pengembalian`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengembalian`
--

INSERT INTO `t_pengembalian` (`kd_pengembalian`, `kd_pinjam`, `tgl_kembali`, `denda`, `kd_buku`, `kondisi`) VALUES
(40316002, 120715002, '2016-03-04', 114500, '10412', 'baik'),
(120715001, 90715001, '2015-07-12', 0, '10447', 'baik');

-- --------------------------------------------------------

--
-- Table structure for table `t_trans_buku_temp`
--

CREATE TABLE IF NOT EXISTS `t_trans_buku_temp` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `kd_buku` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `t_trans_buku_temp`
--

INSERT INTO `t_trans_buku_temp` (`id`, `kd_buku`) VALUES
(1, ''),
(2, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_usulan_buku`
--

CREATE TABLE IF NOT EXISTS `t_usulan_buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(50) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `penerbit` varchar(60) NOT NULL,
  `pengarang` varchar(60) NOT NULL,
  `tahun` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `baca` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `level` enum('admin','petugas','','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `pass`, `level`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(3, 'pandu', '8acf7115033fa7bbfebe4b9b726ab374', 'petugas');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
