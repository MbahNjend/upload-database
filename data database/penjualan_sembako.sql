-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Sep 2023 pada 04.38
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
-- Database: `penjualan_sembako`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBarang` ()   BEGIN
	SELECT * FROM barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetJenisBarang` (IN `p_id_jenis_barang` INT(11), IN `p_nama_jenis_barang` VARCHAR(255))   BEGIN
	INSERT INTO jenis_barang (id_jenis_barang,jenis_barang)
    VALUES (p_id_jenis_barang, p_nama_jenis_barang);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTotalBayar` (IN `p_pembeli_nama` VARCHAR(255), OUT `p_total_bayar` VARCHAR(255))   BEGIN
	SELECT SUM(tb.total_bayar) INTO p_total_bayar
    FROM transaksi_barang tb
    INNER JOIN penjualan_pembeli p ON tb.id_pembeli = p.id_pembeli
    WHERE p.nama_pembeli = p_pembeli_nama;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTransaksi` ()   BEGIN
	SELECT*FROM transaksi_barang;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(300) NOT NULL,
  `harga_barang` varchar(255) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `id_jenis_barang` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `jumlah_barang`, `id_jenis_barang`, `id_toko`) VALUES
(121, 'Indomie Goreng', '3500', 60, 136, 101),
(122, 'Indomie Jumbo', '3500', 90, 132, 102),
(123, 'Indomie Soto', '2500', 120, 133, 103),
(124, 'Indomie Rendang', '3000', 150, 134, 104),
(125, 'Mie Sedap Goreng', '3000', 40, 135, 105),
(126, 'Mie Sedap Ayam Kremes', '3000', 300, 136, 106);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis_barang` int(11) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis_barang`, `jenis_barang`) VALUES
(131, 'Sembako'),
(132, 'Sembako'),
(133, 'Sembako'),
(134, 'Sembako'),
(135, 'Sembako'),
(136, 'Sembako'),
(137, 'Sembako');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_pembeli`
--

CREATE TABLE `penjualan_pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(255) NOT NULL,
  `alamat_pembeli` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan_pembeli`
--

INSERT INTO `penjualan_pembeli` (`id_pembeli`, `nama_pembeli`, `alamat_pembeli`) VALUES
(141, 'Rafa', 'Jl.Glagah'),
(142, 'Adi', 'Jl.Jendral Sudirman'),
(143, 'Age', 'Jl.Paris'),
(144, 'Eko', 'Jl.Jaksel'),
(145, 'Jabran', 'Jl.Jaktim'),
(146, 'Hamdan', 'Jl.Bandung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_supplier`
--

CREATE TABLE `penjualan_supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `alamat_supplier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan_supplier`
--

INSERT INTO `penjualan_supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`) VALUES
(151, 'Teguh', 'Pontianak'),
(152, 'Wann', 'Jogja'),
(153, 'Albertt', 'Bali'),
(154, 'Regi', 'Padang'),
(155, 'Mondy', 'Jakarta'),
(156, 'Yurino', 'Surabaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_toko`
--

CREATE TABLE `penjualan_toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `pemilik_toko` varchar(255) NOT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan_toko`
--

INSERT INTO `penjualan_toko` (`id_toko`, `nama_toko`, `pemilik_toko`, `id_supplier`) VALUES
(101, 'Ndepis', 'Dalvin', 151),
(102, 'Fams', 'Deden', 152),
(103, 'Gogas', 'Gustian', 153),
(104, 'Hasbuna', 'Fajar', 154),
(105, 'Barokah', 'Gata', 155),
(106, 'Mart', 'Alessa', 156);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `id_transaksi_barang` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `jumlah_beli_barang` int(11) NOT NULL,
  `total_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id_transaksi_barang`, `tanggal_transaksi`, `id_barang`, `id_pembeli`, `jumlah_beli_barang`, `total_bayar`) VALUES
(1501, '2023-03-25', 121, 141, 25, '87.500'),
(1502, '2023-09-21', 122, 142, 35, '122.500'),
(1503, '2023-06-14', 123, 143, 50, '125.000'),
(1504, '2023-02-15', 124, 144, 6, '18.000'),
(1505, '2023-06-07', 125, 145, 10, '30.000'),
(1506, '2023-12-16', 126, 146, 75, '225.000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `fk_jenisbarang` (`id_jenis_barang`),
  ADD KEY `fk_penjualantoko` (`id_toko`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis_barang`);

--
-- Indeks untuk tabel `penjualan_pembeli`
--
ALTER TABLE `penjualan_pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `penjualan_supplier`
--
ALTER TABLE `penjualan_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `penjualan_toko`
--
ALTER TABLE `penjualan_toko`
  ADD PRIMARY KEY (`id_toko`),
  ADD KEY `fk_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`id_transaksi_barang`),
  ADD KEY `fk_idbarang` (`id_barang`),
  ADD KEY `fk_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT untuk tabel `penjualan_pembeli`
--
ALTER TABLE `penjualan_pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT untuk tabel `penjualan_supplier`
--
ALTER TABLE `penjualan_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT untuk tabel `penjualan_toko`
--
ALTER TABLE `penjualan_toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT untuk tabel `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  MODIFY `id_transaksi_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1507;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_jenisbarang` FOREIGN KEY (`id_jenis_barang`) REFERENCES `jenis_barang` (`id_jenis_barang`),
  ADD CONSTRAINT `fk_penjualantoko` FOREIGN KEY (`id_toko`) REFERENCES `penjualan_toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `penjualan_toko`
--
ALTER TABLE `penjualan_toko`
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `penjualan_supplier` (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD CONSTRAINT `fk_idbarang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `fk_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `penjualan_pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
