-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2023 pada 15.50
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iurann_kas_rt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `checklist`
--

CREATE TABLE `checklist` (
  `id` int(11) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `toilet_id` int(11) NOT NULL,
  `kloset` tinyint(1) DEFAULT NULL,
  `wastafel` tinyint(1) DEFAULT NULL,
  `lantai` tinyint(1) DEFAULT NULL,
  `dinding` tinyint(1) DEFAULT NULL,
  `kaca` tinyint(1) DEFAULT NULL,
  `bau` tinyint(1) DEFAULT NULL,
  `sabun` tinyint(1) DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `checklist`
--

INSERT INTO `checklist` (`id`, `tanggal`, `toilet_id`, `kloset`, `wastafel`, `lantai`, `dinding`, `kaca`, `bau`, `sabun`, `users_id`) VALUES
(2, '2023-01-06 14:25:51', 1, 1, 2, 1, 2, 1, 2, 1, 2),
(4, '2023-01-06 14:26:08', 2, 1, 2, 2, 1, 2, 2, 1, 1),
(5, '2023-01-07 09:53:27', 2, 3, 1, 1, 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `toilet`
--

CREATE TABLE `toilet` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(45) DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `toilet`
--

INSERT INTO `toilet` (`id`, `lokasi`, `keterangan`) VALUES
(1, 'Toilet Masjid', 'Toilet yang berlokasi di sebelah masjid'),
(2, 'Toilet Sebelah Kelas', 'Toilet yang berlokasi di sebelah kelas'),
(4, 'Toilet Guru', 'Toilet sebelah ruang guru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `role` tinyint(1) DEFAULT 2 COMMENT '1:Admin\n2:User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `email`, `status`, `role`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin', 'admin@gmail.com', 1, 1),
(2, 'user', '6ad14ba9986e3615423dfca256d04e3f', 'user', 'user@gmail.com', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_checklist_toilet_idx` (`toilet_id`),
  ADD KEY `fk_checklist_users1_idx` (`users_id`);

--
-- Indeks untuk tabel `toilet`
--
ALTER TABLE `toilet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `toilet`
--
ALTER TABLE `toilet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `checklist`
--
ALTER TABLE `checklist`
  ADD CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checklist_ibfk_2` FOREIGN KEY (`toilet_id`) REFERENCES `toilet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
