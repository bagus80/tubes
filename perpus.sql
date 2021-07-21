-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 06:55 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jenkel` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `jenkel`, `alamat`, `no_hp`, `image`) VALUES
('AG001', 'Bagus Susilo', 'Laki-laki', 'Faletehan', '083822657188', 'bagussusilo - update.jpg'),
('AG002', 'Muhammad Rofi', 'Laki-laki', 'Banjaran', '089678218272', 'muhammadrofi.jpg'),
('AG003', 'Mona Lisa', 'Perempuan', 'Italia', '025516525125', 'monalisa.jpg'),
('AG004', 'Albert Einstein', 'Laki-laki', 'Jerman', '056458254654', 'alberteinstein.jpg'),
('AG005', 'Hermione Granger', 'Perempuan', 'Hogwart', '052545854125', 'hermionegranger.jpg'),
('AG007', 'TUBES Pemrog Web', 'Laki-laki', 'Faletehan', '0897654567756', 'tubespemrogweb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `id_pengarang` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `tahun_terbit` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_pengarang`, `id_penerbit`, `judul_buku`, `tahun_terbit`, `jumlah`) VALUES
('BK001', 1, 2, 'Laskar Pelangi', 2005, 19),
('BK002', 2, 3, 'Matahari', 2003, 3),
('BK003', 3, 6, 'Sang Guru: Novel Biografi Ki Hadjar Dewantoro', 2001, 4),
('BK004', 5, 3, 'Underground', 2003, 7),
('BK005', 6, 2, 'O', 2004, 1),
('BK006', 7, 1, 'Kisah Untuk Geri', 2009, 4),
('BK007', 8, 2, 'Bumi Manusia', 2001, 7),
('BK008', 9, 4, 'Berjuang di Tanah Rantau', 2003, 6),
('BK009', 10, 7, 'Tubes Pemrog Web', 2020, 11);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator'),
(2, 'petugas', 'petugas', 'e10adc3949ba59abbe56e057f20f883e', 'Petugas'),
(3, 'sarjana koding', 'sarjana', 'e10adc3949ba59abbe56e057f20f883e', 'Petugas');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pm` varchar(10) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pm`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`) VALUES
('PM001', 'AG004', 'BK007', '2021-07-01', '2021-07-08'),
('PM002', 'AG001', 'BK003', '2021-07-08', '2021-07-15'),
('PM003', 'AG006', 'BK002', '2021-07-10', '2021-07-17'),
('PM004', 'AG003', 'BK006', '2021-07-14', '2021-07-21'),
('PM005', 'AG005', 'BK005', '2021-07-14', '2021-07-21'),
('PM006', 'AG007', 'BK001', '2021-07-20', '2021-07-27');

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `jml_after_pinjam` AFTER INSERT ON `peminjaman` FOR EACH ROW update buku set buku.jumlah = buku.jumlah -1 where buku.id_buku = new.id_buku
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`) VALUES
(1, 'Mizan'),
(2, 'Bumi Aksara'),
(3, 'Gagas Media'),
(4, 'Grasindo'),
(5, 'Airlangga'),
(6, 'Bentang Pustaka'),
(7, 'Penerbit');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id_pengarang`, `nama_pengarang`) VALUES
(1, 'Andrea Hirata'),
(2, 'Tere Liye'),
(3, 'Haidar Musyafa'),
(5, 'Ika Natassa'),
(6, 'Eka Kurniawan'),
(7, 'Erisca Febriani'),
(8, 'Pramodyea Ananta Toer'),
(9, 'Ahmad Fuadi'),
(10, 'Pengarang');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_anggota` varchar(20) NOT NULL,
  `id_buku` varchar(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_kembalikan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `tgl_kembalikan`) VALUES
(1, 'AG004', 'BK006', '2020-12-18', '2020-12-25', '2021-01-27'),
(4, 'AG006', 'BK002', '2020-12-01', '2020-12-08', '2021-01-27'),
(5, 'AG002', 'BK001', '2021-01-27', '2021-02-03', '2021-01-27'),
(6, 'AG001', 'BK002', '2021-01-27', '2021-02-03', '2021-01-30'),
(7, 'AG004', 'BK002', '2021-01-31', '2021-02-07', '2021-07-14'),
(8, 'AG003', 'BK002', '2021-03-17', '2021-03-24', '2021-07-14'),
(9, 'AG005', 'BK005', '2021-03-18', '2021-03-25', '2021-07-14'),
(10, 'AG007', 'BK009', '2021-07-20', '2021-07-27', '2021-07-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pm`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `id_pengarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
