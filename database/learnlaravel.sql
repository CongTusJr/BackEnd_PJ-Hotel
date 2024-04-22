-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 11:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learnlaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `cmt` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `cmt`, `created_at`, `updated_at`) VALUES
(1, 'Hoàng An', 'Dịch vụ rất tốt và chuyên nghiệp, rất cảm ơn các bạn và chúc các bạn thành công hơn nữa', '2024-04-17 10:20:26', '2024-04-19 10:20:26'),
(2, 'Minh Quốc', 'Rất ấn tượng với dịch vụ và nhân viên phục vụ ở đây, sẽ ghé thăm các bạn vào lần sau', '2024-04-17 10:20:26', '2024-04-19 10:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_04_16_153013_create_personal_access_tokens_table', 2),
(5, '2024_04_17_114046_create_products_table', 3),
(6, '2024_04_17_152240_create_services_table', 4),
(7, '2024_04_17_153541_create_services_table', 5),
(8, '2024_04_17_171725_create_feedback_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maxPeople` int(11) DEFAULT NULL,
  `amenities` text DEFAULT NULL,
  `services` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `bio`, `price`, `image`, `created_at`, `updated_at`, `maxPeople`, `amenities`, `services`) VALUES
(1, 'PHÒNG SUPERIOR', 'Phòng Superior có diện tích 28m2 được thiết kế hài hòa với nội thất sang trọng và đầy đủ tiện nghi hiện đại mang đến sự thoải mái, tiện lợi nhất cho quý khách.', 1850000, 'https://reynaluxuryhotel.com/files/images/DSC_0272-min.jpg', '2024-04-17 06:33:24', '2024-04-17 06:34:09', 2, '[\r\n    \"Diện tích: 28m2\",\r\n    \"TV truyền hình cab 50\\\"\",\r\n    \"Giường King\",\r\n    \"Điều hòa\",\r\n    \"Tủ mini bar\",\r\n    \"Vòi sen\",\r\n    \"Máy sấy tóc\",\r\n    \"Két an toàn\",\r\n    \"Hệ thống khóa tự động\",\r\n    \"Hệ thống bơm nước nóng\",\r\n    \"Điện thoại\",\r\n    \"Wifi miễn phí\"\r\n]', '[\r\n    \"Dọn phòng hằng ngày\",\r\n    \"Miễn phí 2 chai nước uống hằng ngày\",\r\n    \"Trà/ cà phê miễn phí\",\r\n    \"Dịch vụ giặt là/ giặt nhanh (tính phí)\",\r\n    \"Dịch vụ văn phòng (tính phí)\",\r\n    \"Dịch vụ ăn uống phục vụ tại phòng (tính phí)\",\r\n    \"Dịch vụ đón tiễn sân bay (tính phí)\"\r\n]'),
(2, 'PHÒNG DELUXE', 'Phòng Deluxe với thiết kế hài hòa, nội thất sang trọng với đầy đủ tiện nghi hiện đại. Diện tích khoảng 26 - 28m2 với hướng nhìn ra phía thành phố giúp quý khách có thể ngắm nhìn khung cảnh xung quanh.', 2150000, 'https://reynaluxuryhotel.com/files/images/DSC_0249-min.jpg', '2024-04-17 06:34:31', '2024-04-17 06:34:31', 2, '[\r\n    \"Diện tích: 26 - 28m2\",\r\n    \"TV truyền hình cab 50\\\"\",\r\n    \"Loại giường: 1 giường King hoặc 2 giường Twin\",\r\n    \"Điều hòa\",\r\n    \"Tủ mini bar\",\r\n    \"Vòi sen\",\r\n    \"Máy sấy tóc\",\r\n    \"Két an toàn\",\r\n    \"Hệ thống khóa tự động\",\r\n    \"Hệ thống bơm nước nóng\",\r\n    \"Điện thoại\",\r\n    \"Wifi miễn phí\"\r\n]', '[\r\n    \"Dọn phòng hằng ngày\",\r\n    \"Miễn phí 2 chai nước uống hằng ngày\",\r\n    \"Trà/ cà phê miễn phí\",\r\n    \"Dịch vụ giặt là/ giặt nhanh (tính phí)\",\r\n    \"Dịch vụ văn phòng (tính phí)\",\r\n    \"Dịch vụ ăn uống phục vụ tại phòng (tính phí)\",\r\n    \"Dịch vụ đón tiễn sân bay (tính phí)\"\r\n]'),
(3, 'PHÒNG EXECUTIVE', 'Phòng Executive có tầm nhìn bao quát, có diện tích khoảng 32m2 được trang bị giường ngủ king size đem lại sự thoải mái và thư giãn nhất cho quý khách, với lối kiến trúc độc đáo và nội thất sang trọng sẽ mang đến cho bạn cảm giác thoải mái, như lạc vào không gian sang trọng, đẳng cấp.', 2450000, 'https://reynaluxuryhotel.com/files/images/DSC_0303-min.jpg', '2024-04-17 08:05:32', '2024-04-18 08:05:32', 2, '[\r\n    \"Diện tích: 30 - 32m2\",\r\n    \"TV truyền hình cab 50\\\"\",\r\n    \"Giường King\",\r\n    \"Điều hòa\",\r\n    \"Phòng khách\",\r\n    \"Tủ lạnh\",\r\n    \"Vòi sen hoặc bồn tắm\",\r\n    \"Máy sấy tóc\",\r\n    \"Két an toàn\",\r\n    \"Hệ thống khóa tự động\",\r\n    \"Hệ thống bơm nước nóng\",\r\n    \"Điện thoại\",\r\n    \"Wifi miễn phí\"\r\n]', '[\r\n    \"Dọn phòng hằng ngày\",\r\n    \"Miễn phí 2 chai nước uống hằng ngày\",\r\n    \"Trà/ cà phê miễn phí\",\r\n    \"Dịch vụ giặt là/ giặt nhanh (tính phí)\",\r\n    \"Dịch vụ văn phòng (tính phí)\",\r\n    \"Dịch vụ ăn uống phục vụ tại phòng (tính phí)\",\r\n    \"Dịch vụ đón tiễn sân bay (tính phí)\"\r\n]'),
(4, 'PHÒNG JUNIOR SUITE', 'Phòng Junior suite có tầm nhìn bao quát, có diện tích khoảng 40m2 được trang bị giường ngủ king size và ghế sofa đem lại sự thoải mái và thư giãn nhất cho quý khách, với lối kiến trúc độc đáo và nội thất sang trọng và tầm nhìn trên cao sẽ mang đến cho bạn cảm giác thoải mái, lạc vào 1 không gian sang trọng, đẳng cấp.', 2850000, 'https://reynaluxuryhotel.com/files/images/DSC_0303-min.jpg', '2024-04-17 08:11:19', '2024-04-18 08:11:19', 2, '[\r\n    \"Diện tích: 40m2\",\r\n    \"TV truyền hình cab 50\\\"\",\r\n    \"Giường King\",\r\n    \"Điều hòa\",\r\n    \"Phòng khách\",\r\n    \"Tủ lạnh\",\r\n    \"Vòi sen & bồn tắm jacuzzi\",\r\n    \"Máy sấy tóc\",\r\n    \"Két an toàn\",\r\n    \"Hệ thống khóa tự động\",\r\n    \"Hệ thống bơm nước nóng\",\r\n    \"Điện thoại\",\r\n    \"Wifi miễn phí\"\r\n]', '[\r\n    \"Dọn phòng hằng ngày\",\r\n    \"Miễn phí 2 chai nước uống hằng ngày\",\r\n    \"Trà/ cà phê miễn phí\",\r\n    \"Dịch vụ giặt là/ giặt nhanh (tính phí)\",\r\n    \"Dịch vụ văn phòng (tính phí)\",\r\n    \"Dịch vụ ăn uống phụ vụ tại phòng (tính phí)\",\r\n    \"Dịch vụ đón tiễn sân bay (tính phí)\"\r\n]');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `bio`, `image`, `created_at`, `updated_at`) VALUES
(1, 'NHÀ HÀNG REYNA', 'Nhà hàng Reyna Hà Nội phục vụ tiệc buffet quốc tế vào buổi sáng và A la carte suốt cả ngày. Nhà hàng của chúng tôi mang đến những trải nghiệm ẩm thực đáng nhớ thông qua các hương vị mang bản sắc quốc tế và địa phương.', 'https://reynaluxuryhotel.com/files/images/Restaurant/nh.jpg', '2024-04-17 08:54:56', '2024-04-18 08:54:56'),
(2, 'DỊCH VỤ MÁT XA', 'Chúng tôi cung cấp dịch vụ mát-xa chất lượng cao, đặt lịch linh hoạt và cam kết cung cấp dịch vụ chăm sóc chất lượng. Cho dù bạn đang muốn tìm cảm giác cân bằng và yên bình hay giảm đau, chúng tôi đều có thể đáp ứng nhu cầu trị liệu xoa bóp của bạn.', 'https://reynaluxuryhotel.com/files/images/DSC_8673-min.jpg', '2024-04-17 08:55:13', '2024-04-17 08:55:13'),
(3, 'PHÒNG GYM', '<div className=\"text-center\">- Địa điểm: Tầng hầm <br />- Thời gian phục vụ: 06:00-22:00 <br />Miễn phí phục vụ cho Quý khách hàng lưu trú tại khách sạn</div>', 'https://reynaluxuryhotel.com/files/images/DSC_8637-min.jpg', '2024-04-17 08:55:39', '2024-04-26 08:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9q1ZRsCLr5biIg7rixLIhxEPl64t6Y09tzVkKeih', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUd1cWJEOU5pYU9NRDFRMUdEWUdFR0NIT0RMZTV3d3pOUW9MSXVTZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1713263134),
('l2Q8fWjW8kdNbmjFWaXajNLqtSjdhKUY0LYkv8sO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUk5nbXFFMHU2TlZKMkVEcFppODJkNHZPSEJBdmp0QWlrV3lzM0FXbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713338579),
('ljRaaPSBvj5pfPblVNYkLrFREjLQvcpxsoCrN3TF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidTcwa1NWN3dwQnNNSXNROFBwSjV6bDU5STNWSlZJMGlSNDUzR0hjZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1713321005);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
