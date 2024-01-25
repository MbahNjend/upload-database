-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jan 2024 pada 05.07
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_baru`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `no_akun` char(5) NOT NULL,
  `nm_akun` varchar(100) NOT NULL,
  `header_akun` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_kategori` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama`, `harga`, `stok`, `id_kategori`) VALUES
('24LN4100', 'LED TV LG 24 Inch', '2036900', 100, 'ELK'),
('32LN5100', 'LED TV LG 32 Inch', '3492000', 100, 'ELK'),
('ATTCMAX', 'ATTACK CLEAN MAXIMIZER 800GR', '14325', 100, 'BZR'),
('ATTSOFT', 'ATTACK SOFTENER 800GR', '14325', 100, 'BZR'),
('DH-6330P', 'HOME THEATHER LG', '2461700', 100, 'ELK'),
('ES-FL8605-WW', 'WASHING MACHINE SHARP 6KG', '2863600', 100, 'ELK'),
('HITLEMON', 'HIT AEROSOL LEMON 600ML', '24150', 100, 'BZR'),
('INDOMIE', 'INDOMIE ALL VARIAN', '1500', 100, 'GMK'),
('KC-105', 'KOMPOR MINI PORTABLE', '124900', 100, 'BZR'),
('KLV-24EX430', 'LED TV SONY 24 Inch', '1999600', 100, 'ELK'),
('KNWTPUMP', 'KENMASTER WATER PUMP', '27500', 100, 'BZR'),
('MUG-ANI', 'MUG ANIMAL', '19900', 100, 'BZR'),
('MUG-SHO', 'MUG SHIO', '19900', 100, 'BZR'),
('MUG-ZDK', 'MUG ZODIAK', '19900', 100, 'BZR'),
('NA-F852', 'WASHING MACHINE PANASONIC', '2590000', 100, 'ELK'),
('STELLA70GR', 'STELLA ALL IN ONE 70 GR', '7200', 100, 'BZR'),
('UA-22F5000', 'LED TV Samsung 22 inch', '1900000', 100, 'ELK'),
('UHT1000ML', 'ULTRAMILK 1000ML', '11350', 100, 'GMK'),
('UHT125ML', 'ULTRAMILK 125ML', '1800', 100, 'GMK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_nota` char(5) NOT NULL,
  `id_barang` char(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_retur`
--

CREATE TABLE `detail_retur` (
  `id_nota` char(5) NOT NULL,
  `id_barang` char(50) NOT NULL,
  `id_retur` char(5) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal`
--

CREATE TABLE `jurnal` (
  `no_akun` char(5) NOT NULL,
  `id_trans` char(5) NOT NULL,
  `posisi_dr_cr` varchar(10) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` char(3) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `nama_kategori`, `keterangan`) VALUES
('BZR', 'Bazar', 'Perlengkapan Rumah Tangga'),
('ELK', 'Elektronik', 'Elektronik'),
('GMK', '\r\nGrocery Makanan Minuman', 'Makanan dan Minuman'),
('GPK', 'GroceryPerawatanKecantikan', 'Perawatan dan kecantikan'),
('PSG', 'Pasar Segar', 'Sayur, buah dan daging'),
('SFL', 'Softline', 'Pakaian Siap Pakai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota_penjualan_1`
--

CREATE TABLE `nota_penjualan_1` (
  `id_nota` char(5) NOT NULL,
  `tgl_nota` date NOT NULL,
  `total` int(11) NOT NULL,
  `id_pelanggan` char(12) NOT NULL,
  `id_pegawai` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nota_penjualan_1`
--

INSERT INTO `nota_penjualan_1` (`id_nota`, `tgl_nota`, `total`, `id_pelanggan`, `id_pegawai`) VALUES
('86856', '2013-05-01', 45675, '1111111111', '201301001'),
('86857', '2013-05-01', 52800, ' 8924234423', '201301001'),
('86858', '2013-05-01', 38500, '8924234423', '201301002'),
('86859', '2013-05-01', 3492000, '8935353535', '201301002'),
('86860', '2013-06-01', 8817300, '8911223344', '201301002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(12) NOT NULL,
  `no_ktp` char(16) NOT NULL,
  `nama_pegawai` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `posisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `no_ktp`, `nama_pegawai`, `alamat`, `no_telp`, `posisi`) VALUES
('201301001', '3372026404830000', 'Jeko', 'Jl.Bojong Soang Bandung', '022734412234', 'kasir'),
('201301002', '3372026404777777', 'Budi', 'Jl.Sukapura Bandung', '08988776655', 'kasir'),
('201302001', '3372026404987654', 'Wawan', 'Jl.Sukabirus Bandung', '089899999', 'kasir'),
('201302009', '3372026404135792', 'Wati', 'Jl.TelekomunikasiBandung', '14000', 'supervisor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` char(12) NOT NULL,
  `no_ktp` char(16) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_ktp`, `nama`, `alamat`, `no_telp`, `pekerjaan`) VALUES
('8911223344', '3372026404112233', 'Domino', 'Jl.Moch.Toha Bandung', '02254321', 'Wirausaha'),
('8924234423', '337202640483000', 'Jeko', 'Jl.Bojong Soang Bandung', '022734412234', 'Swasta'),
('8935353535', '3372026404832420', 'Boy', 'Jl.Sukabirus Bandung', '098987654321', 'Mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` char(5) NOT NULL,
  `sisa_piutang` varchar(50) NOT NULL,
  `id_nota` char(5) NOT NULL,
  `id_pegawai` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `sisa_piutang`, `id_nota`, `id_pegawai`) VALUES
('BYR1', '0', '86856', '201301001'),
('BYR2', '0', '86857', '201301001'),
('BYR3', '0', '86858', '201301002'),
('BYR4', '492000', '86859', '201301002'),
('BYR5', '0', '86859', '201301001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `retur`
--

CREATE TABLE `retur` (
  `id_retur` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `retur`
--

INSERT INTO `retur` (`id_retur`) VALUES
('RTR1'),
('RTR2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trans` char(5) NOT NULL,
  `tgl_trans` date NOT NULL,
  `jml_trans` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_trans`, `tgl_trans`, `jml_trans`) VALUES
('BYR1', '2013-05-01', 45675),
('BYR2', '2013-05-01', 52800),
('BYR3', '2013-05-01', 38500),
('BYR4', '2013-05-01', 3000000),
('BYR5', '2013-06-01', 492000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`no_akun`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `fk_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD KEY `fk_barang_2` (`id_barang`);

--
-- Indeks untuk tabel `detail_retur`
--
ALTER TABLE `detail_retur`
  ADD KEY `fk_nota7` (`id_nota`),
  ADD KEY `fk_barang6` (`id_barang`),
  ADD KEY `fk_retur5` (`id_retur`);

--
-- Indeks untuk tabel `jurnal`
--
ALTER TABLE `jurnal`
  ADD KEY `fk_akun` (`no_akun`),
  ADD KEY `fk_trans` (`id_trans`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `nota_penjualan_1`
--
ALTER TABLE `nota_penjualan_1`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `fk_pelanggan_4` (`id_pelanggan`),
  ADD KEY `fk_pegawai_3` (`id_pegawai`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `fk_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id_retur`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trans`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `fk_barang_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `detail_retur`
--
ALTER TABLE `detail_retur`
  ADD CONSTRAINT `fk_barang6` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `fk_nota7` FOREIGN KEY (`id_nota`) REFERENCES `nota_penjualan_1` (`id_nota`),
  ADD CONSTRAINT `fk_retur5` FOREIGN KEY (`id_retur`) REFERENCES `retur` (`id_retur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
