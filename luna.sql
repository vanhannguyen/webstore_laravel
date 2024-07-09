-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 07:08 AM
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
-- Database: `luna`
--
CREATE DATABASE IF NOT EXISTS `luna` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `luna`;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image`, `content`, `created_at`, `updated_at`) VALUES
(3, 'chau dep trai vl', '1705495554.jpg', 'Châu đẹp trai là hiện thực quá rõ ràng', '2024-01-17 05:45:54', '2024-01-17 05:45:54'),
(4, 'Hùng bầu đuồi', '1705500724.jpg', 'Hùng óc chó is real', '2024-01-17 07:11:12', '2024-01-17 07:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(19, 5, '2024-01-23 19:05:04', '2024-01-23 19:05:04'),
(20, 4, '2024-01-23 19:09:54', '2024-01-23 19:09:54');

--
-- Triggers `carts`
--
DELIMITER $$
CREATE TRIGGER `cart_items_delete_on_cart_delete` AFTER DELETE ON `carts` FOR EACH ROW BEGIN
    DELETE FROM cart_items WHERE cart_items.cart_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `variant_id` int(10) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `quantity`, `cart_id`, `variant_id`, `price`, `created_at`, `updated_at`) VALUES
(19, 3, 19, 3, 117, '2024-01-23 19:05:04', '2024-01-23 19:05:04'),
(20, 1, 20, 7, 80, '2024-01-23 19:09:54', '2024-01-23 19:11:31');

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_12_18_040720_create_users_table', 1),
(3, '2023_12_18_040830_create_user_addresses_table', 1),
(4, '2023_12_18_041020_create_product_categories_table', 1),
(5, '2023_12_18_041127_create_products_table', 1),
(6, '2023_12_18_041206_create_product_ratings_table', 1),
(7, '2023_12_18_041302_create_product_discounts_table', 1),
(8, '2023_12_18_041418_create_product_variants_table', 1),
(9, '2023_12_18_041521_create_product_variant_details_table', 1),
(10, '2023_12_18_041657_create_payments_table', 1),
(11, '2023_12_18_041742_create_orders_table', 1),
(12, '2023_12_18_041847_create_order_items_table', 1),
(13, '2023_12_18_042111_create_carts_table', 1),
(14, '2023_12_18_042231_create_cart_items_table', 1),
(15, '2024_01_16_090931_create_cart_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `payment_id`, `created_at`, `updated_at`, `active`) VALUES
(6, 4, 730.20, 1, '2024-01-17 10:08:10', '2024-01-17 10:08:10', NULL),
(7, 4, 382.60, 1, '2024-01-17 10:09:01', '2024-01-17 10:09:01', NULL),
(8, 4, 190.60, 2, '2024-01-17 10:22:09', '2024-01-17 11:45:25', 3),
(9, 4, 652.00, 1, '2024-01-23 18:36:07', '2024-01-23 18:36:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `quantity`, `created_at`, `updated_at`, `variant_id`) VALUES
(7, 6, 1, '2024-01-17 10:08:10', '2024-01-17 10:08:10', 3),
(8, 6, 5, '2024-01-17 10:08:10', '2024-01-17 10:08:10', 7),
(9, 6, 3, '2024-01-17 10:08:10', '2024-01-17 10:08:10', 10),
(10, 7, 3, '2024-01-17 10:09:01', '2024-01-17 10:09:01', 7),
(11, 7, 3, '2024-01-17 10:09:01', '2024-01-17 10:09:01', 3),
(12, 8, 3, '2024-01-17 10:22:09', '2024-01-17 10:22:09', 3),
(13, 9, 3, '2024-01-23 18:36:07', '2024-01-23 18:36:07', 7),
(14, 9, 3, '2024-01-23 18:36:07', '2024-01-23 18:36:07', 12);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Thanh toán ONLINE', 'Thanh toán qua thẻ ngân hàng, Ví điện tử,v.v', NULL, NULL),
(2, 'Thanh toán OFFLINE', 'Thanh toán ngay sau khi nhận được hàng', NULL, NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `percent` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sortBy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `created_at`, `updated_at`, `variant`, `image`, `percent`, `price`, `sortBy`) VALUES
(1, 'Màn hình Gaming 166Hz LG IPS', 'Tốc độ làm mới 165Hz\r\n1ms Motion Blur Reduction\r\nCông nghệ AMD FreeSync™ Premium\r\nGiao diện người dùng chơi game\r\nViền màn hình 3 cạnh siêu mỏng', 1, NULL, '2024-01-23 18:32:47', 'Màu sắc', '1706059967.jpg', 40, 200, NULL),
(2, 'Màn hình AOC Q24G2 24\" IPS 2K 165Hz G-Sync chuyên game', 'Màn hình AOC Q24G2 24 inch IPS 2K 165Hz chuyên game sẽ mang đến cho bạn những trải nghiệm chơi game bất tận. Kích thước màn hình 24 inch dưới tấm nền IPS kết hợp với độ phủ màu cao cùng nhiều công nghệ hỗ trợ chơi game tiên tiến đi kèm, AOC Q24G2 chắc chắn là kép phụ không thể thiếu cho dàn PC gaming của bạn.', 1, NULL, '2024-01-23 18:32:37', 'Kích thước', '1706059957.jpg', 20, 180, NULL),
(3, 'Màn hình Asus TUF GAMING VG249Q3A 24\" Fast IPS 180Hz Gsync chuyên game', 'Màn hình Asus TUF GAMING VG249Q3A rộng 24 inch, sử dụng tấm nền IPS, độ phân giải Full HD với tốc độ làm mới cực nhanh. Màn hình được thiết kế dành cho các game thủ chuyên nghiệp và những người chơi muốn hòa mình vào các trò chơi thực sự. Không chỉ vậy, công nghệ ELMB độc quyền cho phép phản hồi 1ms và sự kết hợp của công nghệ đồng bộ hóa thích ứng của để mang đến cho người dùng màn hình mượt mà và trải nghiệm chơi game tuyệt vời.', 1, NULL, '2024-01-23 18:32:25', 'Phiên bản', '1706059945.jpg', 50, 120, NULL),
(9, 'Iphone pro max', 'Sản phẩm này tới từ nhà iphone', 4, '2024-01-08 00:16:12', '2024-01-23 18:30:32', 'Phiên bản', '1706059832.jpg', 0, 80, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Màn hình', '', NULL, NULL),
(2, 'Laptop', '', NULL, NULL),
(4, 'Smartphone', 'Sản phẩm này không phải là thuốc', '2024-01-07 11:25:53', '2024-01-07 11:25:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `discount_percent` decimal(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `name`, `description`, `product_id`, `discount_percent`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Lộc đầu năm mới 2024', 'chúc bạn năm mới an khang thịnh vượng', 1, 12.00, 0, '2024-01-04 10:54:01', '2024-01-04 11:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `star` decimal(10,2) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `star`, `comment`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 8.00, 'sản phẩm như con cặc vậy', 3, 9, '2024-01-13 04:14:04', '2024-01-13 04:14:04'),
(4, 5.00, 'Sản phẩm này phải làm sao nhỉ', 3, 1, '2024-01-13 06:25:10', '2024-01-13 06:25:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `name`, `image`, `price`, `created_at`, `updated_at`, `quantity`) VALUES
(3, 1, 'Màu đen', '1706060056.jpg', 117.00, '2024-01-04 09:35:13', '2024-01-23 18:34:16', 200),
(7, 2, '12inch', '1705392141.jpg', 80.00, '2024-01-04 18:24:18', '2024-01-23 18:36:07', 117),
(9, 9, 'Màu xanh', '1705060866.jpg', 123.00, '2024-01-12 05:01:06', '2024-01-12 05:01:06', 12),
(10, 9, '16GB 1TB', '1706060079.jpg', 120.00, '2024-01-16 01:03:00', '2024-01-23 18:34:39', 200),
(11, 9, '3012', '1706060014.jpg', 120.00, '2024-01-23 18:33:34', '2024-01-23 18:33:34', 120),
(12, 2, '60inch', '1706060044.jpg', 200.00, '2024-01-23 18:34:04', '2024-01-23 18:36:07', 197);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `phone`, `avatar`, `created_at`, `updated_at`, `first_name`, `last_name`, `last_login`, `role`) VALUES
(1, 'hung', 'chaudeptrai123@gmail.com', '1', '0336002583', '', NULL, '2024-01-02 06:41:09', 'Nguyễn ', 'Hùng', NULL, NULL),
(2, 'anthunguyen0101', 'annguyen123@gmail.com', '$2y$10$1uRnwr821I8PuMAf7GQTluHs2khrxNZGVbdxWM5bX4T5IRu1iTvBW', NULL, NULL, '2024-01-02 07:21:43', '2024-01-02 07:21:43', 'Nguyễn ', 'An', NULL, NULL),
(3, 'chaudeptrai', 'tranchaucbhk54@gmail.com', '$2y$10$LIIXyAazgZDTLuWcqCu0XuB0m6t3qaIkgqBNo.101LOW69Y6e6D0.', '0923660028', NULL, '2024-01-12 21:50:44', '2024-01-17 00:06:25', 'Trần', 'Châu', NULL, NULL),
(4, 'yeuemratnhieu', 'ngoxuanthao1958@gmail.com', '$2y$10$j5gXyxeaegaJYMwsxisizOigwnuK4SLz6tn8cH5bV1IacHxsYCRVa', '03333333333', NULL, '2024-01-14 20:00:33', '2024-01-17 07:15:11', NULL, NULL, NULL, 1),
(5, 'hung', 'hung@gmail.com', '$2y$10$2Mw1kPQ/MFJabeIiIkljO.8nz6DEBi9B/Gu815EQEV8GN3ebC0xKW', NULL, NULL, '2024-01-23 19:02:24', '2024-01-23 19:02:24', NULL, NULL, NULL, NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `trigger_delete_orders` AFTER DELETE ON `users` FOR EACH ROW BEGIN
  -- Xóa tất cả các đơn hàng của khách hàng đã xóa
  DELETE FROM orders
  WHERE user_id = OLD.id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_delete_user_addresses` AFTER DELETE ON `users` FOR EACH ROW BEGIN
  -- Xóa tất cả các đơn hàng của khách hàng đã xóa
  DELETE FROM user_addresses
  WHERE user_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `ward` varchar(255) NOT NULL,
  `absolute_address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `city`, `district`, `ward`, `absolute_address`, `created_at`, `updated_at`) VALUES
(1, 1, 'tỉnh Hà Nam', 'huyện Thanh Liêm', 'xã Thanh Hương', 'Đội 2 thôn Lác Nội', NULL, NULL),
(2, 2, 'tỉnh Hà Nam', 'huyện Thanh Liêm', 'xã Thanh Hương', 'Đội 2 thôn Lác Nội', NULL, NULL),
(3, 3, 'Tỉnh Hà Nam', 'Huyện Thanh Liêm', 'Xã Thanh Hương', 'Thôn Lác Nội', '2024-01-17 00:06:25', '2024-01-17 00:06:25'),
(4, 4, 'Tỉnh Cao Bằng', 'Thành phố Cao Bằng', 'Phường Sông Bằng', 'óc chó', '2024-01-17 07:15:11', '2024-01-17 07:15:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_carts_cart_id` (`cart_id`),
  ADD KEY `fk_product_variants_variant_id` (`variant_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `fk_product_varints_variants_variant_id` (`variant_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_discounts_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ratings_user_id_foreign` (`user_id`),
  ADD KEY `product_ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk_carts_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_variants_variant_id` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_product_varints_variants_variant_id` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`),
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD CONSTRAINT `product_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
