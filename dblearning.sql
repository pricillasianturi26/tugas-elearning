-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2019 at 02:45 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id_feed` int(5) NOT NULL,
  `notes_feed` varchar(20) NOT NULL,
  `tgl_posting` date NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `jml_rupiah` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studycenter`
--

CREATE TABLE `studycenter` (
  `id_center` int(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `lokasi` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbkategori`
--

CREATE TABLE `tbkategori` (
  `id_kategori` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbmateri`
--

CREATE TABLE `tbmateri` (
  `kode_mat` char(5) NOT NULL,
  `judul_mat` varchar(30) NOT NULL,
  `jml_mat` int(3) NOT NULL,
  `kode_pel` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbpelajaran`
--

CREATE TABLE `tbpelajaran` (
  `kode_pel` char(5) NOT NULL,
  `nama_pel` varchar(20) NOT NULL,
  `jml_pel` int(3) NOT NULL,
  `id_pengajar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbpengajar`
--

CREATE TABLE `tbpengajar` (
  `id_pengajar` int(10) NOT NULL,
  `nama_pengajar` varchar(30) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `email` char(15) NOT NULL,
  `id_kategori` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbsiswa`
--

CREATE TABLE `tbsiswa` (
  `id_siswa` int(10) NOT NULL,
  `nama_siswa` varchar(30) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `telepon` int(12) NOT NULL,
  `email` char(15) NOT NULL,
  `id_kategori` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feed`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `studycenter`
--
ALTER TABLE `studycenter`
  ADD PRIMARY KEY (`id_center`);

--
-- Indexes for table `tbkategori`
--
ALTER TABLE `tbkategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbmateri`
--
ALTER TABLE `tbmateri`
  ADD PRIMARY KEY (`kode_mat`),
  ADD KEY `kode_pel` (`kode_pel`);

--
-- Indexes for table `tbpelajaran`
--
ALTER TABLE `tbpelajaran`
  ADD PRIMARY KEY (`kode_pel`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `tbpengajar`
--
ALTER TABLE `tbpengajar`
  ADD PRIMARY KEY (`id_pengajar`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tbsiswa`
--
ALTER TABLE `tbsiswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tbsiswa` (`id_siswa`);

--
-- Constraints for table `tbmateri`
--
ALTER TABLE `tbmateri`
  ADD CONSTRAINT `tbmateri_ibfk_1` FOREIGN KEY (`kode_pel`) REFERENCES `tbpelajaran` (`kode_pel`);

--
-- Constraints for table `tbpelajaran`
--
ALTER TABLE `tbpelajaran`
  ADD CONSTRAINT `tbpelajaran_ibfk_1` FOREIGN KEY (`id_pengajar`) REFERENCES `tbpengajar` (`id_pengajar`);

--
-- Constraints for table `tbpengajar`
--
ALTER TABLE `tbpengajar`
  ADD CONSTRAINT `tbpengajar_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbkategori` (`id_kategori`);

--
-- Constraints for table `tbsiswa`
--
ALTER TABLE `tbsiswa`
  ADD CONSTRAINT `tbsiswa_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbkategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
