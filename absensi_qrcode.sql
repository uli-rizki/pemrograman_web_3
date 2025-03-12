-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 09, 2024 at 06:25 AM
-- Server version: 8.0.40-0ubuntu0.22.04.1
-- PHP Version: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_qrcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `absensi_id` int NOT NULL,
  `tanggal` datetime NOT NULL,
  `pokok_bahasan` text NOT NULL,
  `deskripsi_bahasan` text NOT NULL,
  `pengampu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `absensi_detail`
--

CREATE TABLE `absensi_detail` (
  `absensi_detail_id` int NOT NULL,
  `absen_id` int NOT NULL,
  `mahasiswa_id` int NOT NULL,
  `keterangan` enum('H','S','I','A') NOT NULL DEFAULT 'H'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `dosen_id` int NOT NULL,
  `nidn` char(10) DEFAULT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `gelar_depan` varchar(20) DEFAULT NULL,
  `gelar_belakang` varchar(30) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `prodi_id` int NOT NULL,
  `status` enum('aktif','cuti','nonaktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `fakultas_id` int NOT NULL,
  `nama_fakultas` varchar(255) NOT NULL,
  `nama_pendek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas_id` int NOT NULL,
  `prodi_id` int NOT NULL,
  `nama_kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `mahasiswa_id` int NOT NULL,
  `nim` char(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `prodi_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(16) DEFAULT NULL,
  `tahun_angkatan` year NOT NULL,
  `status` enum('aktif','cuti','nonaktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `matakuliah_id` int NOT NULL,
  `prodi_id` int NOT NULL,
  `kode_mk` char(8) NOT NULL,
  `nama_matakuliah` varchar(255) NOT NULL,
  `bobot` int NOT NULL,
  `semester` int NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengampu_mk`
--

CREATE TABLE `pengampu_mk` (
  `pengampu_id` int NOT NULL,
  `dosen_id` int NOT NULL,
  `matakuliah_id` int NOT NULL,
  `tahun_ajaran_id` int NOT NULL,
  `kelas_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `prodi_id` int NOT NULL,
  `nama_prodi` varchar(255) NOT NULL,
  `nama_pendek` varchar(255) NOT NULL,
  `fakultas_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `tahun_ajaran_id` int NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `semester` enum('ganjil','genap') NOT NULL,
  `aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`absensi_id`),
  ADD KEY `fk_absesnsi_pengampu_id` (`pengampu_id`);

--
-- Indexes for table `absensi_detail`
--
ALTER TABLE `absensi_detail`
  ADD PRIMARY KEY (`absensi_detail_id`),
  ADD KEY `fk_absensi_detail_absen_id` (`absen_id`),
  ADD KEY `fk_absensi_detail_mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dosen_id`),
  ADD KEY `fk_dosen_prodi_id` (`prodi_id`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`fakultas_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD KEY `fk_kelas_prodi_id` (`prodi_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`mahasiswa_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_mahasiswa_prodi_id` (`prodi_id`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`matakuliah_id`),
  ADD KEY `fk_matakuliah_prodi_id` (`prodi_id`);

--
-- Indexes for table `pengampu_mk`
--
ALTER TABLE `pengampu_mk`
  ADD PRIMARY KEY (`pengampu_id`),
  ADD KEY `fk_pengampu_mk_dosen_id` (`dosen_id`),
  ADD KEY `fk_pengampu_mk_matakuliah_id` (`matakuliah_id`),
  ADD KEY `fk_pengampu_mk_tahun_ajaran_id` (`tahun_ajaran_id`),
  ADD KEY `fk_pengampu_id_kelas_Id` (`kelas_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`prodi_id`),
  ADD KEY `fk_prodi_fakultas_id` (`fakultas_id`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`tahun_ajaran_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `absensi_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absensi_detail`
--
ALTER TABLE `absensi_detail`
  MODIFY `absensi_detail_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `dosen_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `fakultas_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kelas_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `mahasiswa_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `matakuliah_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengampu_mk`
--
ALTER TABLE `pengampu_mk`
  MODIFY `pengampu_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `prodi_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `tahun_ajaran_id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `fk_absesnsi_pengampu_id` FOREIGN KEY (`pengampu_id`) REFERENCES `pengampu_mk` (`pengampu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `absensi_detail`
--
ALTER TABLE `absensi_detail`
  ADD CONSTRAINT `fk_absensi_detail_absen_id` FOREIGN KEY (`absen_id`) REFERENCES `absensi` (`absensi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_absensi_detail_mahasiswa_id` FOREIGN KEY (`mahasiswa_id`) REFERENCES `absensi_detail` (`absensi_detail_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `fk_dosen_prodi_id` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_kelas_prodi_id` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_mahasiswa_prodi_id` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `fk_matakuliah_prodi_id` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pengampu_mk`
--
ALTER TABLE `pengampu_mk`
  ADD CONSTRAINT `fk_pengampu_id_kelas_Id` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_pengampu_mk_dosen_id` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`dosen_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_pengampu_mk_matakuliah_id` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`matakuliah_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_pengampu_mk_tahun_ajaran_id` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `fk_prodi_fakultas_id` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`fakultas_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
