-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2024 pada 15.35
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kejaksaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jaksa_sekolah`
--

CREATE TABLE `tb_jaksa_sekolah` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sekolah` varchar(55) NOT NULL,
  `nama_pemohon` varchar(55) NOT NULL,
  `permohonan` varchar(55) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jaksa_sekolah`
--

INSERT INTO `tb_jaksa_sekolah` (`id`, `user_id`, `sekolah`, `nama_pemohon`, `permohonan`, `status`, `created_at`, `updated_at`) VALUES
(10, 4, 'tes', 'tes', 'tes', 'Approved', '2024-07-04 14:44:58', '2024-07-04 14:44:58'),
(15, 10, 'sekolah 1', 'user 1', 'permohonan 1', 'Approved', '2024-07-08 08:45:50', '2024-07-08 08:45:50'),
(16, 2, 'v', 'v', 'v', 'Pending', '2024-07-08 12:26:33', '2024-07-08 12:26:33'),
(17, 2, 'c', 'c', 'c', 'Pending', '2024-07-08 12:29:13', '2024-07-08 12:29:13'),
(18, 17, 'SMA 1 Padang', 'user2', 'tes permohonan', 'Approved', '2024-07-08 13:11:59', '2024-07-08 13:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pelapor` varchar(55) NOT NULL,
  `no_hp` varchar(55) NOT NULL,
  `laporan_pengaduan_pdf` varchar(255) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `ktp_pdf` varchar(255) NOT NULL,
  `ktp` varchar(55) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id`, `user_id`, `nama_pelapor`, `no_hp`, `laporan_pengaduan_pdf`, `laporan_pengaduan`, `ktp_pdf`, `ktp`, `status`, `created_at`, `updated_at`) VALUES
(25, 10, 'user pengaduan', '08230000000', 'uploads/66667f20b2cf16.44260594.pdf', 'user pengaduan', 'uploads/66667f20b2ed44.76622023.pdf', '1300000000000', 'Approved', '2024-06-10 04:20:48', '2024-06-10 04:20:48'),
(26, 4, 'tes', '1234', 'uploads/6686b739b93901.97215640.pdf', 'tes', 'uploads/6686b739b959e7.74101499.pdf', 'tes', 'Pending', '2024-07-04 14:52:41', '2024-07-04 14:52:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengawasan`
--

CREATE TABLE `tb_pengawasan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pelapor` varchar(55) NOT NULL,
  `no_hp` varchar(55) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `laporan_pengaduan_pdf` varchar(55) NOT NULL,
  `ktp` varchar(55) NOT NULL,
  `ktp_pdf` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pengawasan`
--

INSERT INTO `tb_pengawasan` (`id`, `user_id`, `nama_pelapor`, `no_hp`, `laporan_pengaduan`, `laporan_pengaduan_pdf`, `ktp`, `ktp_pdf`, `status`, `created_at`, `updated_at`) VALUES
(14, 10, 'user aliran', '085345243462', 'user aliran', 'uploads/6666836c05c315.54141379.pdf', '130876543456783', 'uploads/6666836c05dde6.66798391.pdf', 'Pending', '2024-06-10 04:39:08', '2024-06-10 04:39:08'),
(15, 4, 'tes', '09876', 'tes', 'uploads/6686b84cd1ef45.80979020.pdf', '1234', 'uploads/6686b84cd20942.82107501.pdf', 'Approved', '2024-07-04 14:57:16', '2024-07-04 14:57:16'),
(16, 10, 'user 1', '085363782219', 'tes laporan pengaduan', 'uploads/668ba36fd10f56.67189086.pdf', '13020202029000', 'uploads/668ba36fd12846.89181575.pdf', 'Pending', '2024-07-08 08:29:35', '2024-07-08 08:29:35'),
(17, 17, 'user2', '0852673676', 'tes', 'uploads/668be6279b8c85.27876725.pdf', '13098765', 'uploads/668be6279bbdd7.58531753.pdf', 'Pending', '2024-07-08 13:14:15', '2024-07-08 13:14:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penyuluhan`
--

CREATE TABLE `tb_penyuluhan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pelapor` varchar(55) NOT NULL,
  `no_hp` varchar(55) NOT NULL,
  `bentuk_permasalahan` text NOT NULL,
  `bentuk_permasalahan_pdf` varchar(55) NOT NULL,
  `ktp` varchar(55) NOT NULL,
  `ktp_pdf` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penyuluhan`
--

INSERT INTO `tb_penyuluhan` (`id`, `user_id`, `nama_pelapor`, `no_hp`, `bentuk_permasalahan`, `bentuk_permasalahan_pdf`, `ktp`, `ktp_pdf`, `status`, `created_at`, `updated_at`) VALUES
(12, 10, 'User pengawasan', '083245152612', 'User pengawasan', 'uploads/66667d3eaf7723.26415023.pdf', '13001202010222', 'uploads/66667d3eaf9439.34107979.pdf', 'Pending', '2024-06-10 04:12:46', '2024-06-10 04:12:46'),
(13, 4, 'tes', '09876', 'tes', 'uploads/6686b819e7b656.89297072.pdf', 'tes', 'uploads/6686b819e7d166.89804886.pdf', 'Pending', '2024-07-04 14:56:25', '2024-07-04 14:56:25'),
(14, 17, 'user2', '085384981123', 'tes permohonan', 'uploads/668be607cf5c39.11170768.pdf', '1309876543', 'uploads/668be607cf8779.70167084.pdf', 'Pending', '2024-07-08 13:13:43', '2024-07-08 13:13:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pidana_korupsi`
--

CREATE TABLE `tb_pidana_korupsi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pelapor` varchar(55) NOT NULL,
  `no_hp` varchar(55) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `laporan_pengaduan_pdf` varchar(255) NOT NULL,
  `ktp` varchar(55) NOT NULL,
  `ktp_pdf` varchar(255) NOT NULL,
  `uraian` text NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pidana_korupsi`
--

INSERT INTO `tb_pidana_korupsi` (`id`, `user_id`, `nama_pelapor`, `no_hp`, `laporan_pengaduan`, `laporan_pengaduan_pdf`, `ktp`, `ktp_pdf`, `uraian`, `status`, `created_at`, `updated_at`) VALUES
(11, 2, 'admin pidana', '083256578', 'admin pidana', 'uploads/666681a32551d0.16581512.pdf', '130000000000', 'uploads/666681a3257818.02000901.pdf', 'admin pidana', 'Pending', '2024-06-10 04:31:31', '2024-06-10 04:31:31'),
(12, 10, 'user pidana', '0876543456', 'user pidanaa', 'uploads/666681df638695.41123175.pdf', '13098765432345', 'uploads/666681df63a130.94170684.pdf', 'user pidana', 'Approved', '2024-06-10 04:32:31', '2024-06-10 04:32:31'),
(13, 4, 'tes', 'tes', 'tes', 'uploads/6686b7df999765.75882644.pdf', 'tes', 'uploads/6686b7df99bef3.65153346.pdf', 'tes', 'Pending', '2024-07-04 14:55:27', '2024-07-04 14:55:27'),
(14, 2, 'd', '0987', 'd', 'uploads/668bdacb5331f1.99935500.pdf', '34567', 'uploads/668bdacb539c21.44450087.pdf', 'd', 'Pending', '2024-07-08 12:25:47', '2024-07-08 12:25:47'),
(15, 17, 'user2', '085367878', 'tes permohonan', 'uploads/668be5d6aaf2e8.32417908.pdf', '130298765432', 'uploads/668be5d6ab2024.13152974.pdf', 'tes permohonan', 'Pending', '2024-07-08 13:12:54', '2024-07-08 13:12:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pilkada`
--

CREATE TABLE `tb_pilkada` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pelapor` varchar(55) NOT NULL,
  `no_hp` varchar(55) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `laporan_pengaduan_pdf` varchar(55) NOT NULL,
  `ktp` varchar(55) NOT NULL,
  `ktp_pdf` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pilkada`
--

INSERT INTO `tb_pilkada` (`id`, `user_id`, `nama_pelapor`, `no_hp`, `laporan_pengaduan`, `laporan_pengaduan_pdf`, `ktp`, `ktp_pdf`, `status`, `created_at`, `updated_at`) VALUES
(12, 10, 'user pilkada', '0823912212', 'user pilkada', 'uploads/6666854824f2e7.13333002.pdf', '1308292898932', 'uploads/66668548250bd1.99066783.pdf', 'Pending', '2024-06-10 04:47:04', '2024-06-10 04:47:04'),
(13, 4, 'tes1', '0987', 'tes', 'uploads/6686b878ea0aa8.56609789.pdf', '2345', 'uploads/6686b878ea2e84.63687297.pdf', 'Pending', '2024-07-04 14:58:00', '2024-07-04 14:58:00'),
(14, 17, 'user2', '08536526536', 'tes', 'uploads/668be6458a0296.24301660.pdf', '13098654334', 'uploads/668be6458a3eb3.89677842.pdf', 'Pending', '2024-07-08 13:14:45', '2024-07-08 13:14:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rating`
--

CREATE TABLE `tb_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pelapor` varchar(55) NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `ulasan` varchar(55) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_rating`
--

INSERT INTO `tb_rating` (`id`, `user_id`, `nama_pelapor`, `rating`, `ulasan`, `created_at`, `updated_at`) VALUES
(4, 4, 'fira', '4', 'baik', '2024-05-17 14:53:05', '2024-05-17 14:53:05'),
(5, 4, 'fira', '4', 'baik', '2024-05-17 14:55:30', '2024-05-17 14:55:30'),
(11, 4, 'fira', '4', 'sangat berguna', '2024-05-18 04:24:59', '2024-05-18 04:24:59'),
(12, 4, 'fira', '2', 'cukup memuaskan', '2024-05-18 04:25:19', '2024-05-18 04:25:19'),
(13, 4, 'fira', '4', 'baik', '2024-05-18 14:00:27', '2024-05-18 14:00:27'),
(14, 4, 'fira', '4', 'sangat membantu', '2024-05-18 15:03:46', '2024-05-18 15:03:46'),
(15, 1, 'jamal', '4', 'sangat membantu', '2024-05-20 15:36:02', '2024-05-20 15:36:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_log_application`
--

CREATE TABLE `t_log_application` (
  `log_description` longtext NOT NULL,
  `log_activity_type` varchar(55) NOT NULL,
  `table_modified` varchar(55) NOT NULL,
  `user_id` int(11) NOT NULL,
  `log_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `t_log_application`
--

INSERT INTO `t_log_application` (`log_description`, `log_activity_type`, `table_modified`, `user_id`, `log_date`) VALUES
('User Register', 'REGISTER', 'users', 14, '2024-06-27 21:41:07'),
('User login', 'LOGIN', 'users', 14, '2024-06-27 21:49:48'),
('User Register', 'REGISTER', 'users', 15, '2024-06-27 22:40:59'),
('User login', 'LOGIN', 'users', 15, '2024-06-27 22:41:45'),
('User Login', 'LOGIN', 'users', 4, '2024-07-03 21:54:50'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 4', 'IMAGE_CLICK', 'image', 4, '2024-07-03 22:20:29'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 4', 'IMAGE_CLICK', 'image', 4, '2024-07-03 22:22:29'),
('IMAGE_CLICK 6281371534130 By User id 4', 'IMAGE_CLICK', 'whatsapp', 4, '2024-07-03 22:22:50'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 4', 'IMAGE_CLICK', 'image', 4, '2024-07-03 22:23:08'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 4', 'IMAGE_CLICK', 'image', 4, '2024-07-03 22:23:22'),
('User Login', 'LOGIN', 'users', 4, '2024-07-04 21:27:06'),
('User Login', 'LOGIN', 'users', 4, '2024-07-04 21:28:13'),
('User Login', 'LOGIN', 'users', 4, '2024-07-04 21:29:01'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:29:05'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:29:56'),
('User Login', 'LOGIN', 'users', 4, '2024-07-04 21:37:18'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:37:21'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 4, '2024-07-04 21:44:58'),
('User Login', 'LOGIN', 'users', 2, '2024-07-04 21:45:51'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 21:45:54'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 21:50:00'),
('User Login', 'LOGIN', 'users', 4, '2024-07-04 21:50:10'),
('CARD_CLICK Pengaduan Pegawai By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:50:13'),
('User Create Permohonan', 'ADD', 't_pengaduan', 4, '2024-07-04 21:52:41'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:54:58'),
('User Create Permohonan', 'ADD', 't_pidana_korupsi', 4, '2024-07-04 21:55:27'),
('CARD_CLICK Penyuluhan Hukum By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:55:57'),
('User Create Permohonan', 'ADD', 't_penyuluhan', 4, '2024-07-04 21:56:25'),
('CARD_CLICK Pengawasan Aliran & Kepercayaan By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:56:54'),
('User Create Permohonan', 'ADD', 't_pengawasan', 4, '2024-07-04 21:57:16'),
('CARD_CLICK Posko Pilkada By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 21:57:37'),
('User Create Permohonan', 'ADD', 't_pilkada', 4, '2024-07-04 21:58:00'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 4', 'CARD_CLICK', 'card', 4, '2024-07-04 22:00:37'),
('User Login', 'LOGIN', 'users', 2, '2024-07-04 22:00:47'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:00:50'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:01:54'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:02:32'),
('User Login', 'LOGIN', 'users', 2, '2024-07-04 22:22:35'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:22:38'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:22:59'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:23:09'),
('User Login', 'LOGIN', 'users', 10, '2024-07-04 22:24:15'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-04 22:24:17'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 10, '2024-07-04 22:24:32'),
('User Login', 'LOGIN', 'users', 2, '2024-07-04 22:24:44'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-04 22:24:47'),
('User Login', 'LOGIN', 'users', 10, '2024-07-04 22:25:01'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-04 22:25:03'),
('User Login', 'LOGIN', 'users', 2, '2024-07-05 22:09:55'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 22:09:59'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 22:10:22'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 22:10:27'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 22:10:37'),
('CARD_CLICK Penyuluhan Hukum By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 22:10:47'),
('CARD_CLICK Pengawasan Aliran & Kepercayaan By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 22:11:05'),
('User Login', 'LOGIN', 'users', 10, '2024-07-05 22:34:23'),
('CARD_CLICK Pengaduan Pegawai By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-05 22:34:27'),
('User Login', 'LOGIN', 'users', 2, '2024-07-05 22:34:39'),
('User Login', 'LOGIN', 'users', 2, '2024-07-05 22:36:21'),
('User Login', 'LOGIN', 'users', 2, '2024-07-05 23:00:17'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-05 23:10:38'),
('User Login', 'LOGIN', 'users', 2, '2024-07-07 16:05:51'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-07 16:06:20'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-07 16:06:25'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 14:55:08'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 14:55:58'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 14:56:46'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 14:57:03'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 14:57:17'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:01:59'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 15:09:15'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 15:16:56'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 15:23:47'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:23:50'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 10, '2024-07-08 15:24:22'),
('CARD_CLICK Pengaduan Pegawai By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:24:36'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:24:39'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 15:27:59'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:28:01'),
('CARD_CLICK Pengawasan Aliran & Kepercayaan By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:28:47'),
('User Create Permohonan', 'ADD', 't_pengawasan', 10, '2024-07-08 15:29:35'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:30:44'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:31:02'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 10, '2024-07-08 15:31:08'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:32:08'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:42:37'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 10, '2024-07-08 15:45:25'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 15:45:36'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 10, '2024-07-08 15:45:50'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 15:46:00'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 15:46:02'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 16:38:07'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 16:38:40'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 16:45:57'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 16:46:02'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 16:46:18'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:46:25'),
('IMAGE_CLICK 6281371534130 By User id 10', 'IMAGE_CLICK', 'whatsapp', 10, '2024-07-08 16:46:28'),
('CARD_CLICK Pengaduan Pegawai By User id 10', 'CARD_CLICK', 'card', 10, '2024-07-08 16:46:46'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 16:47:36'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 16:52:43'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 16:52:52'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 16:54:38'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 16:56:14'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:56:17'),
('IMAGE_CLICK 6281371534130 By User id 10', 'IMAGE_CLICK', 'whatsapp', 10, '2024-07-08 16:56:23'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:56:30'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:56:36'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:56:43'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 16:57:23'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:57:29'),
('IMAGE_CLICK 6281371534130 By User id 10', 'IMAGE_CLICK', 'whatsapp', 10, '2024-07-08 16:57:38'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 16:57:44'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 17:02:23'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 17:02:30'),
('IMAGE_CLICK 6281371534130 By User id 10', 'IMAGE_CLICK', 'whatsapp', 10, '2024-07-08 17:02:38'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 17:02:42'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 17:02:49'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 10', 'IMAGE_CLICK', 'image', 10, '2024-07-08 17:02:58'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 17:21:47'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 18:34:52'),
('User Register', 'REGISTER', 'users', 16, '2024-07-08 18:35:36'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 18:35:44'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 18:57:08'),
('User Login', 'LOGIN', 'users', 10, '2024-07-08 19:01:23'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 19:04:33'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:07:08'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:07:48'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:07:50'),
('IMAGE_CLICK 6281371534130 By User id 2', 'IMAGE_CLICK', 'whatsapp', 2, '2024-07-08 19:07:57'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:08:02'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:08:04'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:08:07'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:08:09'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:08:13'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:11:09'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 19:12:36'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:12:39'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:12:46'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:14:27'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:15:13'),
('CARD_CLICK Penyuluhan Hukum By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:16:22'),
('CARD_CLICK Pengawasan Aliran & Kepercayaan By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:16:24'),
('CARD_CLICK Posko Pilkada By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:16:27'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:16:29'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:18:03'),
('CARD_CLICK Posko Pilkada By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:19:47'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:21:09'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:23:13'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:23:17'),
('CARD_CLICK Posko Pilkada By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:23:21'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:23:43'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:23:51'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:24:00'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:24:03'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:25:19'),
('User Create Permohonan', 'ADD', 't_pidana_korupsi', 2, '2024-07-08 19:25:47'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:25:53'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 2, '2024-07-08 19:26:33'),
('CARD_CLICK Pengaduan Pegawai By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:28:38'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:28:43'),
('CARD_CLICK Pengawasan Aliran & Kepercayaan By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:28:49'),
('CARD_CLICK Posko Pilkada By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:28:53'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:28:56'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 2', 'IMAGE_CLICK', 'image', 2, '2024-07-08 19:29:00'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 19:29:08'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 2, '2024-07-08 19:29:13'),
('User Register', 'REGISTER', 'users', 17, '2024-07-08 20:10:14'),
('User Login', 'LOGIN', 'users', 17, '2024-07-08 20:10:24'),
('IMAGE_CLICK https://halojpn.id/sites/ By User id 17', 'IMAGE_CLICK', 'image', 17, '2024-07-08 20:10:35'),
('IMAGE_CLICK 6281371534130 By User id 17', 'IMAGE_CLICK', 'whatsapp', 17, '2024-07-08 20:10:42'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 17', 'IMAGE_CLICK', 'image', 17, '2024-07-08 20:10:55'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 17', 'IMAGE_CLICK', 'image', 17, '2024-07-08 20:10:59'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 17', 'IMAGE_CLICK', 'image', 17, '2024-07-08 20:11:12'),
('CARD_CLICK Pengaduan Pegawai By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:11:30'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:11:36'),
('User Create Permohonan', 'ADD', 't_jaksa_sekolah', 17, '2024-07-08 20:11:59'),
('CARD_CLICK Pengaduan Tindak Pidana By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:12:15'),
('User Create Permohonan', 'ADD', 't_pidana_korupsi', 17, '2024-07-08 20:12:54'),
('CARD_CLICK Penyuluhan Hukum By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:13:16'),
('User Create Permohonan', 'ADD', 't_penyuluhan', 17, '2024-07-08 20:13:43'),
('CARD_CLICK Pengawasan Aliran & Kepercayaan By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:13:51'),
('User Create Permohonan', 'ADD', 't_pengawasan', 17, '2024-07-08 20:14:15'),
('CARD_CLICK Posko Pilkada By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:14:21'),
('User Create Permohonan', 'ADD', 't_pilkada', 17, '2024-07-08 20:14:45'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 20:14:59'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 20:16:15'),
('User Login', 'LOGIN', 'users', 17, '2024-07-08 20:16:49'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 17', 'CARD_CLICK', 'card', 17, '2024-07-08 20:16:51'),
('BUTTON_CLICK User opened rating dialog By User id 17', 'BUTTON_CLICK', 'Rating', 17, '2024-07-08 20:17:15'),
('User Login', 'LOGIN', 'users', 2, '2024-07-08 20:17:22'),
('CARD_CLICK JMS (Jaksa Masuk Sekolah) By User id 2', 'CARD_CLICK', 'card', 2, '2024-07-08 20:17:32'),
('User Login', 'LOGIN', 'users', 17, '2024-07-08 20:19:48'),
('IMAGE_CLICK 6281371534130 By User id 17', 'IMAGE_CLICK', 'whatsapp', 17, '2024-07-08 20:19:51'),
('IMAGE_CLICK https://www.lapor.go.id/ By User id 17', 'IMAGE_CLICK', 'image', 17, '2024-07-08 20:20:01'),
('IMAGE_CLICK https://docs.google.com/forms/d/e/1FAIpQLSdplUq-eYLAF73CMDNvVJhdlO10q4Z4CL-kLuavs1muYxpe0Q/viewform By User id 17', 'IMAGE_CLICK', 'image', 17, '2024-07-08 20:20:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone_number` varchar(55) NOT NULL,
  `ktp` varchar(55) NOT NULL,
  `alamat` text NOT NULL,
  `role` enum('Admin','User') NOT NULL DEFAULT 'User',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `phone_number`, `ktp`, `alamat`, `role`, `created_at`, `updated_at`) VALUES
(1, 'lala', 'lala@gmail.com', '$2y$10$IyWcRDOzq1xymMaPwqe3TenDpTgFqgjfgVaI8T01bInf9VLemd5Fa', 'lala', '082300000000', '13000000008', '', '', '2024-05-12 13:50:55', '2024-05-12 13:50:55'),
(2, 'admin', 'admin@gmail.com', '$2y$10$BZ31QcKNecoKPb/g0Y4WeuNGFu.2jShiY4LYEhYbGwOx5oV0aYwO.', 'admin', '082300000000', '13000000000', 'Padang', 'Admin', '2024-05-12 15:00:11', '2024-05-12 15:00:11'),
(3, 'faradilla', 'faradilla@gmail.com', '$2y$10$zIQFiaZnAXjE2i7nv/PkI.rlipQT4CoOCk496AzWo9CvhaugI02e2', 'faradilla fira', '082211990000', '13000000001', 'jakarta', '', '2024-05-13 12:19:07', '2024-05-13 12:19:07'),
(4, 'fira', 'fira@gmail.com', '$2y$10$L.SVpzE5B3k.cyi91vMAj..l9tdCRGbTnK8ruC4Qv0OE/FnDiuXPi', 'fira faradilla', '082345875212', '130202029000', 'padang', 'Admin', '2024-05-14 09:33:42', '2024-05-14 09:33:42'),
(5, 'bub2', 'bub2@gmail.com', '$2y$10$N6iQ/kfg82gZNvnXifhYw.BdyZWH4sVs7Yd26/Vfrg8ZAMAVjrWuO', 'bub2', '08537252000', '130202020202000', 'Jakarta', '', '2024-05-20 15:22:26', '2024-05-20 15:22:26'),
(6, 'lala', 'lala@gmail.com', '$2y$10$HFf.EO5/dWu4PQAAi0GPuu/f9eB55zSQIYf5dtmcHbX6xzJF0Pk3q', 'lalala', '0853628211983', '130293927932322', 'Padang', '', '2024-05-20 15:27:58', '2024-05-20 15:27:58'),
(10, 'user', 'user@gmail.com', '$2y$10$pbgf7PuXfWNrx0vK226nTuDnYmlhShaNjQDH2zAlESL.l2NAJk7dy', 'user', '082300000000', '1300000000000', 'Padang', 'User', '2024-06-10 02:55:17', '2024-06-10 02:55:17'),
(14, 'nana', 'nana@gmail.com', '$2y$10$z6VJmdsxSpwJU0PWgV4S/OJGVI6kd4E1bkePzj99KEw1XxTxDKM7m', 'nana', '0987654321', '1234567890', 'jakarta', 'User', '2024-06-27 14:41:07', '2024-06-27 14:41:07'),
(15, 'nini', 'nini@gmail.com', '$2y$10$exzxCMBAzHIx8AXXM/px.OP7yBqXpI1T7lZBLXw7/aOH8pXuSk/8i', 'nini', '00987654321', '12345678909', 'padang', 'User', '2024-06-27 15:40:59', '2024-06-27 15:40:59'),
(16, 'a', 'a@gmail.com', '$2y$10$3iB/DHEkDCW3dVU6wSBd2ehoy75BgiP8qHkmTqS.cf1u8G55u4p9.', 'a', '0987654321', '1234567890', 'a', 'User', '2024-07-08 11:35:36', '2024-07-08 11:35:36'),
(17, 'user2', 'user2@gmail.com', '$2y$10$9UAlUyuGhkWPWlb7JPl9gOiou1IYwmdKq01R/sBmqK6e6wSgYaGTm', 'user2', '0853746411186', '130928373', 'padang', 'User', '2024-07-08 13:10:14', '2024-07-08 13:10:14');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_jaksa_sekolah`
--
ALTER TABLE `tb_jaksa_sekolah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_pengawasan`
--
ALTER TABLE `tb_pengawasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_penyuluhan`
--
ALTER TABLE `tb_penyuluhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_pidana_korupsi`
--
ALTER TABLE `tb_pidana_korupsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_pilkada`
--
ALTER TABLE `tb_pilkada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tb_rating`
--
ALTER TABLE `tb_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `t_log_application`
--
ALTER TABLE `t_log_application`
  ADD KEY `t_log_application_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_jaksa_sekolah`
--
ALTER TABLE `tb_jaksa_sekolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tb_pengawasan`
--
ALTER TABLE `tb_pengawasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_penyuluhan`
--
ALTER TABLE `tb_penyuluhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_pidana_korupsi`
--
ALTER TABLE `tb_pidana_korupsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_pilkada`
--
ALTER TABLE `tb_pilkada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_rating`
--
ALTER TABLE `tb_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jaksa_sekolah`
--
ALTER TABLE `tb_jaksa_sekolah`
  ADD CONSTRAINT `tb_jaksa_sekolah_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD CONSTRAINT `tb_pengaduan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_pengawasan`
--
ALTER TABLE `tb_pengawasan`
  ADD CONSTRAINT `tb_pengawasan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_penyuluhan`
--
ALTER TABLE `tb_penyuluhan`
  ADD CONSTRAINT `tb_penyuluhan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_pidana_korupsi`
--
ALTER TABLE `tb_pidana_korupsi`
  ADD CONSTRAINT `tb_pidana_korupsi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_pilkada`
--
ALTER TABLE `tb_pilkada`
  ADD CONSTRAINT `tb_pilkada_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_rating`
--
ALTER TABLE `tb_rating`
  ADD CONSTRAINT `tb_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_log_application`
--
ALTER TABLE `t_log_application`
  ADD CONSTRAINT `t_log_application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
