-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Apr 2025 pada 17.05
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `id` int(11) NOT NULL,
  `npm_mahasiswa` int(13) DEFAULT NULL,
  `kodemk_matakuliah` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`id`, `npm_mahasiswa`, `kodemk_matakuliah`) VALUES
(1, 220001, 'MK001'),
(2, 220002, 'MK002'),
(3, 220003, 'MK001'),
(4, 220004, 'MK003'),
(5, 220005, 'MK004'),
(6, 220006, 'MK001'),
(7, 220007, 'MK001'),
(8, 220008, 'MK002'),
(9, 220009, 'MK002'),
(10, 220010, 'MK003'),
(12, 220011, 'MK002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` int(13) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama`, `jurusan`, `alamat`) VALUES
(220001, 'Siska Putri', 'Teknik Informatika', 'Jl. Tebet Timur Dalam I No.15, Jakarta Selatan'),
(220002, 'Ujang Aziz', 'Teknik Informatika', 'Jl. Raya Cibinong No.23, Bogor'),
(220003, 'Veronica Setyano', 'Teknik Informatika', 'Jl. Margonda Raya No.88, Depok'),
(220004, 'Rizka Nurmala Putri', 'Teknik Informatika', 'Jl. BSD Raya Utama No.10, Serpong, Tangerang Selatan'),
(220005, 'Eren Putra', 'Teknik Informatika', 'Jl. Ir. H. Juanda No.12, Bekasi Timur'),
(220006, 'Putra Abdul Rachman', 'Teknik Informatika', 'Jl. Taman Mini No.2, Jakarta Timur'),
(220007, 'Rahmat Andriyadi', 'Teknik Informatika', 'Jl. Pajajaran No.7, Bogor Tengah'),
(220008, 'Ayu Puspitasari', 'Teknik Informatika', 'Jl. Ciledug Raya No.45, Tangerang'),
(220009, 'Putri Ayuni', 'Teknik Informatika', 'Jl. Raya Kalimalang No.99, Bekasi'),
(220010, 'Andri Muhammad', 'Teknik Informatika', 'Jl. Kemang Raya No.20, Jakarta Selatan'),
(220011, 'Andi Junaedin', 'Sistem Informasi', 'Jl. Imam Bonjol No.3 Makasar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kodemk` char(6) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jumlah_sks` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kodemk`, `nama`, `jumlah_sks`) VALUES
('MK001', 'Basis Data', 3),
('MK002', 'Pemrograman Berbasis Web', 3),
('MK003', 'Algoritma dan Struktur Data', 3),
('MK004', 'Kajian Jurnal Informatika', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `npm_mahasiswa` (`npm_mahasiswa`),
  ADD KEY `kodemk_matakuliah` (`kodemk_matakuliah`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kodemk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `krs`
--
ALTER TABLE `krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`npm_mahasiswa`) REFERENCES `mahasiswa` (`npm`),
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`kodemk_matakuliah`) REFERENCES `matakuliah` (`kodemk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
