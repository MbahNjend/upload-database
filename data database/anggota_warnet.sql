-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2023 pada 03.07
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anggota_warnet`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama_anggota` varchar(80) NOT NULL,
  `pekerjaan` varchar(80) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `pekerjaan`, `alamat`) VALUES
(1, 'Rafa Rajendra', 'Pelajar', 'Jl.Perwira No 625'),
(2, 'Alexander', 'Pelajar', 'Jl.Kereta Muda'),
(3, 'Indira Putri', 'Penyanyi', 'Jl.Pangeran Antasari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kartu_anggota`
--

CREATE TABLE `kartu_anggota` (
  `id_kartu` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `nomor_kartu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kartu_anggota`
--

INSERT INTO `kartu_anggota` (`id_kartu`, `id_anggota`, `nomor_kartu`) VALUES
(2312, 1, 'Wnt-011'),
(2313, 2, 'Wnt-012'),
(2314, 3, 'Wnt-013');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komputer`
--

CREATE TABLE `komputer` (
  `id_pc` int(11) NOT NULL,
  `nama_pc` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `tanggal_dibeli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komputer`
--

INSERT INTO `komputer` (`id_pc`, `nama_pc`, `nama_perusahaan`, `tanggal_dibeli`) VALUES
(1, 'LG', 'PT.LG Indonesia', '2023-12-16'),
(2, 'Hewlett Packard', 'PT.Hewleet Packard', '2023-07-31'),
(3, 'Toshiba', 'PT.Toshiba Indonesia', '2023-07-31'),
(4, 'Samsung', 'PT.Samsung Indonesia', '2023-08-30'),
(5, 'Asus', 'PT.Asus Indonesia', '2023-07-27'),
(7, 'Compaq', 'PT.Compaq Indonesia', '2023-06-12'),
(8, 'Acer', 'PT.Acer Indonesia', '2023-07-04'),
(9, 'Apple', 'Apple.INC', '2023-02-05'),
(10, 'Lenovo', 'PT.Lenovo Indonesia', '2023-07-01'),
(11, 'Dell', 'PT.Dell Indonesia', '2023-10-25'),
(12, 'IBM', 'IBM.INC', '2023-06-12'),
(13, 'Sony', 'PT.Sony Indonesia', '2023-03-15'),
(14, 'Aoc', 'PT.AOC Indonesia', '2023-05-30'),
(15, 'ViewSonic', 'ViewSonic.inc', '2023-09-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_pc` int(11) NOT NULL,
  `tgl_pesewaan` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_pc`, `tgl_pesewaan`, `tgl_kembali`) VALUES
(1, 3, 5, '2023-08-05', '2023-08-15'),
(2, 2, 2, '2023-08-08', '2023-08-28'),
(3, 3, 4, '2023-08-11', '2023-08-20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `kartu_anggota`
--
ALTER TABLE `kartu_anggota`
  ADD PRIMARY KEY (`id_kartu`),
  ADD KEY `fk_anggota` (`id_anggota`);

--
-- Indeks untuk tabel `komputer`
--
ALTER TABLE `komputer`
  ADD PRIMARY KEY (`id_pc`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `fk_keanggotaan` (`id_anggota`),
  ADD KEY `fk_komputer` (`id_pc`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kartu_anggota`
--
ALTER TABLE `kartu_anggota`
  MODIFY `id_kartu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2315;

--
-- AUTO_INCREMENT untuk tabel `komputer`
--
ALTER TABLE `komputer`
  MODIFY `id_pc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kartu_anggota`
--
ALTER TABLE `kartu_anggota`
  ADD CONSTRAINT `fk_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_keanggotaan` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_komputer` FOREIGN KEY (`id_pc`) REFERENCES `komputer` (`id_pc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
