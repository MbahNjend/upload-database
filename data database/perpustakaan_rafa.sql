-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2023 pada 03.09
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
-- Database: `perpustakaan_rafa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayar_denda`
--

CREATE TABLE `bayar_denda` (
  `id` int(11) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `telat_kembali` int(10) NOT NULL,
  `hilang` varchar(80) NOT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `rusak` varchar(80) NOT NULL,
  `jumlah_rusak` int(10) DEFAULT NULL,
  `bayar` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bayar_denda`
--

INSERT INTO `bayar_denda` (`id`, `nama`, `telat_kembali`, `hilang`, `jumlah`, `rusak`, `jumlah_rusak`, `bayar`) VALUES
(1101, 'Dean', 0, 'No', 0, 'Yes', 1, 15000),
(1102, 'Agus', 5, 'Yes', 1, 'No', 0, 32500),
(1103, 'Jessica', 3, 'No', 0, 'No', 0, 15000),
(1104, 'Adel', 0, 'No', 0, 'No', 0, 0),
(1106, 'Shani', 0, 'No', 0, 'No', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `nama_buku` varchar(80) NOT NULL,
  `tipe_buku` varchar(80) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `nama_buku`, `tipe_buku`, `jumlah`, `harga`) VALUES
(1201, 'Sang Pencerah', 'Dongeng', 20, 30000),
(1202, 'UUD 1945', 'Pelajaran', 60, 25000),
(1203, 'Kumpulan Lagu Th 90', 'History', 15, 50000),
(1204, 'Attack On Titan', 'Komik', 50, 30000),
(1205, 'Sejarah Indonesia', 'History', 30, 15000),
(1206, 'Lawang Sewu', 'History', 20, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `donasi`
--

CREATE TABLE `donasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `donasi` varchar(80) NOT NULL,
  `nama_buku` varchar(80) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `donasi`
--

INSERT INTO `donasi` (`id`, `nama`, `donasi`, `nama_buku`, `jumlah`) VALUES
(1102, 'Agus', 'Yes', 'Naruto', 1),
(1104, 'Adel', 'Yes', 'Panduan Menyanyi', 3),
(1105, 'Freya', 'Yes', 'Story Of Spain', 2),
(1106, 'Shani', 'Yes', 'Kisah Kancil', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `nama_buku` varchar(80) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `nama`, `nama_buku`, `jumlah`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(1101, 'Dean', 'Attack On Titan', 2, '2023-11-26', '2023-11-30'),
(1102, 'Agus', 'Attack On Titan', 2, '2023-06-10', '2023-07-22'),
(1103, 'Jessica', 'Sejarah Indonesia', 1, '2023-07-10', '2023-07-20'),
(1104, 'Adel', 'UUD 1945', 1, '2023-08-23', '2023-08-26'),
(1106, 'Shani', 'Kumpulan Lagu Th 90', 1, '2023-07-12', '2023-07-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_anggota` int(10) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `pekerjaan` varchar(80) NOT NULL,
  `alamat` text NOT NULL,
  `no_telpon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_anggota`, `kode_anggota`, `nama_anggota`, `pekerjaan`, `alamat`, `no_telpon`) VALUES
(1101, 'AA121', 'Dean', 'Streamer', 'Rejowinangun', '08119992383'),
(1102, 'AB131', 'Agus', 'ASN', 'Kusumanegara', '08332156465'),
(1103, 'AC131', 'Jessica', 'Designer', 'Gayam', '08779231465'),
(1104, 'AD151', 'Adel', 'Chef', 'Pakualaman', '08931564898'),
(1105, 'AE161', 'Freya', 'Penyanyi', 'Malioboro', '08321456489'),
(1106, 'AF171', 'Shani', 'Penyanyi', 'Godean', '08196433246');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bayar_denda`
--
ALTER TABLE `bayar_denda`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `donasi`
--
ALTER TABLE `donasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bayar_denda`
--
ALTER TABLE `bayar_denda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1107;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1207;

--
-- AUTO_INCREMENT untuk tabel `donasi`
--
ALTER TABLE `donasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1107;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1107;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_anggota` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1107;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
