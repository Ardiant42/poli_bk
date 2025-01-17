-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 01:46 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli_bk`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED NOT NULL,
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `status_periksa` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(3, 10, 8, 'Sakit tenggorokan perih\r\n', 1, '1'),
(4, 13, 11, 'Gusi berdarah', 1, '0'),
(5, 10, 8, 'Telinga sakit', 2, '0'),
(6, 14, 13, 'Mata Merah', 1, '1'),
(7, 15, 15, 'Batuk, Pilek', 1, '1'),
(8, 16, 14, 'Sariawan', 1, '1'),
(9, 17, 14, 'batuk, pilek, radang tenggorokan', 2, '1'),
(10, 17, 17, 'cek kesehatan', 1, '0'),
(11, 15, 14, 'pusing', 3, '0'),
(12, 18, 20, 'Batuk, pusing, pilek', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(4, 3, 13),
(5, 3, 14),
(6, 4, 19),
(7, 5, 11),
(8, 5, 13),
(9, 6, 13),
(10, 6, 17),
(11, 7, 11),
(12, 7, 13),
(13, 7, 17),
(14, 7, 21),
(15, 8, 11),
(16, 8, 12),
(17, 8, 13),
(18, 8, 21);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(12, 'Kusuma', 'eee462bf8b460595e91b5aab19fd61c2', 'Semarang', '085678876543', 10),
(13, 'Andra', '839ddfea673b23c89c87ca5bfd74ac3c', 'Semarang', '08907524675678', 21),
(16, 'Novan', '0c646b9d777ee31b005228bdc3d469a1', 'Semarang', '089456543456', 11),
(19, 'Budi', '00dfc53ee86af02e742515cdcf075ed3', 'Jl. Simpang 5', '089234567', 24),
(20, 'Ahmad', 'a244bc2be4245c022748235a46dedf15', 'Semarang', '0882723763713', 24),
(22, 'Dedi', '06b1674142e7ac88c536d83e6ae7c31c', 'Solo', '0814613475134', 21),
(24, 'Tono Baru', '827ccb0eea8a706c4c34a16891f84e7b', 'Solo', '088111111111', 24);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `aktif` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `aktif`) VALUES
(6, 12, 'Senin', '08:00:00', '12:00:00', 'N'),
(7, 12, 'Selasa', '13:00:00', '17:00:00', 'N'),
(8, 12, 'Senin', '18:00:00', '22:00:00', 'Y'),
(9, 13, 'Senin', '13:00:00', '17:00:00', 'Y'),
(10, 16, 'Senin', '08:00:00', '12:00:00', 'N'),
(11, 16, 'Selasa', '13:00:00', '17:00:00', 'Y'),
(12, 19, 'Senin', '08:00:00', '12:30:00', 'N'),
(13, 19, 'Senin', '13:00:00', '15:30:00', 'N'),
(14, 20, 'Senin', '09:00:00', '15:00:00', 'Y'),
(15, 20, 'Selasa', '09:00:00', '15:00:00', 'N'),
(16, 20, 'Rabu', '09:00:00', '15:00:00', 'N'),
(17, 22, 'Senin', '09:00:00', '15:00:00', 'Y'),
(18, 22, 'Selasa', '09:00:00', '15:00:00', 'N'),
(19, 19, 'Kamis', '09:00:00', '16:00:00', 'Y'),
(20, 24, 'Jumat', '09:00:00', '16:00:00', 'Y'),
(21, 24, 'Sabtu', '09:00:00', '16:00:00', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(11, 'Obat Batuk', 'Tablet', 18000),
(12, 'Obat Pusing', 'Botol', 32000),
(13, 'Vitamin C', 'Botol Pil', 10000),
(14, 'Vitamin B Complex', 'Botol Pil', 10000),
(17, 'Obat Radang', 'Tablet', 23000),
(18, 'Obat Diare', 'Tablet', 12000),
(19, 'Vitamin A', 'Tablet', 8000),
(20, 'Panadol', 'Tablet', 15000),
(21, 'Obat Pilek', 'Tablet', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(10, 'Andra', 'e83ef9da2046e040c6a7017fd6912e08', 'Semarang', '123', '085', '202401-001'),
(13, 'Budi', '827ccb0eea8a706c4c34a16891f84e7b', 'Semarang', '0987654', '98765', '202401-002'),
(14, 'Dian', '827ccb0eea8a706c4c34a16891f84e7b', 'Semarang', '9876543', '0878', '202401-003'),
(15, 'Luluk', '11fc2e08327227d802532d48ee16960b', 'Semarang', '3374143005030002', '08819747806', '202412-004'),
(16, 'Ardi', 'beec4e44a9c4fb14432d957892eb7be2', 'Semarang', '124135325', '134235242', '202412-005'),
(17, 'Ryan', 'beec4e44a9c4fb14432d957892eb7be2', 'Semarang', '1219476417867323', '08126464134', '202412-006'),
(18, 'Anto', '202cb962ac59075b964b07152d234b70', 'Semarang Barat', '1471673648732193', '0173461736434', '202412-007');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(3, 3, '2024-01-08 01:07:00', 'silahkan tidur cukup', 170000),
(4, 6, '2024-01-08 14:15:00', 'sudah sedikit membaik, jangan lupa habiskan obatnya', 158000),
(5, 7, '2024-12-02 09:40:00', 'Kurangi minum es, banyak minum air putih', 178000),
(6, 8, '2024-12-23 10:00:00', 'Banyak banyak minum air putih, dan makan buah', 183000),
(7, 9, '2024-12-23 10:30:00', 'Kurangin minum es, banyakin air putih', 213000),
(8, 12, '2024-12-26 14:56:00', 'Istirahat yang cukup, jangan terlalu banyak minum es', 222000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(10, 'Poli THT', 'Available'),
(11, 'Poli Gigi', 'Available'),
(21, 'Poli Gizi', 'Available'),
(22, 'Poli Mata Baik', 'kosong'),
(23, 'Poli Syaraf', 'Kosong'),
(24, 'Poli Umum', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarPoli_jadwal` (`id_jadwal`),
  ADD KEY `fk_daftarPoli_pasien` (`id_pasien`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailPeriksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailPeriksa_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarPoli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftarPoli_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftarPoli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailPeriksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailPeriksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwal_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarPoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
