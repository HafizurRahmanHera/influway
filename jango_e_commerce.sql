-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2020 at 02:19 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jango_e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(1, '1561548993663_product_schema', 1, '2019-06-26 12:32:34'),
(2, '1561549295539_custom_product_schema', 1, '2019-06-26 12:32:34'),
(3, '1561549642173_custom_product_link_schema', 1, '2019-06-26 12:32:36'),
(4, '1561804896753_users_schema', 2, '2019-06-29 11:06:50'),
(5, '1561805523940_product_category_schema', 2, '2019-06-29 11:06:50'),
(6, '1561805621409_product_colors_schema', 2, '2019-06-29 11:06:51'),
(7, '1561805640002_product_sizes_schema', 2, '2019-06-29 11:06:52'),
(8, '1561805654400_product_images_schema', 2, '2019-06-29 11:06:53'),
(9, '1561872227696_size_schema', 3, '2019-06-30 05:29:16'),
(10, '1561872248513_color_schema', 3, '2019-06-30 05:29:16'),
(11, '1562660012157_collage_schema', 4, '2019-07-09 09:42:32'),
(12, '1562660108977_collage_linked_product_schema', 4, '2019-07-09 09:42:33'),
(14, '1563011123482_blog_schema', 5, '2019-07-13 18:56:18'),
(15, '1563011277171_blog_tag_schema', 5, '2019-07-13 18:56:20'),
(19, '1563020445062_vlog_schema', 6, '2019-07-16 10:08:15'),
(20, '1563020496501_vlog_tag_schema', 6, '2019-07-16 10:08:17'),
(21, '1563355780571_feed_schema', 7, '2019-07-17 09:41:06'),
(22, '1563355815168_comment_schema', 7, '2019-07-17 09:41:08'),
(23, '1567230003045_product_tag_schema', 8, '2019-08-31 05:42:35'),
(24, '1567314593128_like_schema', 9, '2019-09-01 05:13:46'),
(25, '1567340052364_product_review_schema', 10, '2019-09-01 12:37:24'),
(26, '1569069516550_token_value_schema', 11, '2019-09-21 12:46:30'),
(28, '1569144403347_token_transaction_schema', 12, '2019-09-22 09:33:09'),
(29, '1569403866183_follow_schema', 13, '2019-09-25 09:34:25'),
(32, '1570476431857_verification_form_schema', 14, '2019-10-07 19:58:42'),
(34, '1570538214599_country_schema', 15, '2019-10-08 12:37:45'),
(35, '1571810995044_token_dollar_value_schema', 16, '2019-10-23 06:19:48'),
(36, '1571815350951_token_deduct_value_schema', 17, '2019-10-23 07:26:06');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `feature_image` varchar(255) DEFAULT NULL,
  `text` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `feature_image`, `text`, `user_id`, `category_id`, `feed_id`, `created_at`, `updated_at`) VALUES
(6, 'New blog', '/uploads/1569242889950.jpeg', '<p>lsdfdskfkdskfds</p><p>fds</p><p>f</p><p>ds</p><p>f</p><p>sd</p><p>ffdsfdsfsdfdsfdsfsd dsf sf dsfsdf</p>', 4, 1, 68, '2019-09-23 18:48:21', '2019-09-23 18:48:21'),
(7, 'New pant', '', '<p><span style=\"color: rgb(0, 0, 0);\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', 3, 2, 72, '2019-09-23 18:52:40', '2019-09-23 18:52:41'),
(8, 'sdadasd', '', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 3, 2, 81, '2019-12-09 17:02:05', '2019-12-24 18:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `blog_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `tag`, `blog_id`, `created_at`, `updated_at`) VALUES
(18, 'asd', 6, '2019-09-23 18:48:21', '2019-09-23 18:48:21'),
(19, 'asdf', 6, '2019-09-23 18:48:21', '2019-09-23 18:48:21'),
(20, 'wqeqw', 6, '2019-09-23 18:48:21', '2019-09-23 18:48:21'),
(22, 'asd', 7, '2019-11-21 12:18:34', '2019-11-21 12:18:34'),
(23, 'asd', 7, '2019-11-21 12:18:34', '2019-11-21 12:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `collages`
--

CREATE TABLE `collages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `collages`
--

INSERT INTO `collages` (`id`, `user_id`, `feed_id`, `created_at`, `updated_at`) VALUES
(17, 3, 67, '2019-09-23 18:46:27', '2019-09-23 18:46:27'),
(18, 11, 71, '2019-09-23 18:51:41', '2019-09-23 18:51:41'),
(19, 14, 75, '2019-10-26 18:14:56', '2019-10-26 18:14:57'),
(20, 3, 78, '2019-11-17 18:15:22', '2019-11-17 18:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `collage_linked_products`
--

CREATE TABLE `collage_linked_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `i` int(10) UNSIGNED DEFAULT NULL,
  `collage_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `collage_linked_products`
--

INSERT INTO `collage_linked_products` (`id`, `x`, `y`, `w`, `h`, `i`, `collage_id`, `created_at`, `updated_at`) VALUES
(76, 3, 0, 3, 10, 3, 17, '2019-09-23 18:46:27', '2019-09-23 18:46:27'),
(77, 0, 0, 3, 10, 2, 17, '2019-09-23 18:46:27', '2019-09-23 18:46:27'),
(78, 2, 0, 4, 14, 11, 18, '2019-09-23 18:51:41', '2019-09-23 18:51:41'),
(79, 0, 7, 2, 7, 7, 18, '2019-09-23 18:51:41', '2019-09-23 18:51:41'),
(80, 0, 0, 2, 7, 6, 18, '2019-09-23 18:51:41', '2019-09-23 18:51:41'),
(81, 0, 6, 2, 6, 2, 19, '2019-10-26 18:14:56', '2019-10-26 18:14:56'),
(82, 0, 0, 2, 6, 3, 19, '2019-10-26 18:14:56', '2019-10-26 18:14:56'),
(83, 4, 0, 2, 17, 11, 20, '2019-11-17 18:15:22', '2019-11-17 18:15:22'),
(84, 0, 9, 2, 8, 7, 20, '2019-11-17 18:15:22', '2019-11-17 18:15:22'),
(85, 0, 0, 2, 9, 4, 20, '2019-11-17 18:15:22', '2019-11-17 18:15:22'),
(86, 2, 9, 2, 8, 6, 20, '2019-11-17 18:15:22', '2019-11-17 18:15:22'),
(87, 2, 0, 2, 9, 3, 20, '2019-11-17 18:15:22', '2019-11-17 18:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `color_name` varchar(255) DEFAULT NULL,
  `color_code` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color_name`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 'beige', '#E2CBA9', NULL, NULL),
(2, 'black', '#000', NULL, NULL),
(3, 'blue', '#0078D7', NULL, NULL),
(4, 'brown', '#B5651D', NULL, NULL),
(5, 'green', '#026928', NULL, NULL),
(6, 'grey', '#808080', NULL, NULL),
(7, 'orange', '#FF8300', NULL, NULL),
(8, 'purple', '#7719AA', NULL, NULL),
(9, 'red', '#E00201', NULL, NULL),
(10, 'white', '#fff', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `feed_id`, `created_at`, `updated_at`) VALUES
(1, 'vcxv', 3, 75, '2019-10-26 18:18:38', '2019-10-26 18:18:38'),
(2, 'asd', 3, 75, '2019-11-11 11:16:04', '2019-11-11 11:16:04'),
(3, 'ASD', 3, 77, '2019-11-13 13:19:48', '2019-11-13 13:19:48'),
(4, 'fsdfsf', 3, 72, '2019-11-17 12:16:07', '2019-11-17 12:16:07'),
(5, 'Looking good Dianna! I like the image grid on the left, but it feels like a lot to process and doesn\'t really show me what the product does? I think using a short looping video or something similar demo\'ing the product might be better?', 3, 72, '2019-11-17 12:18:05', '2019-11-17 12:18:05'),
(6, 'Looking good Dianna! I like the image grid on the left, but it feels like a lot to process and doesn\'t really show me what the product does? I think using a short looping video or something similar demo\'ing the product might be better?', 3, 72, '2019-11-17 12:18:24', '2019-11-17 12:18:24'),
(7, 'hhhj', 3, 77, '2019-11-17 17:47:01', '2019-11-17 17:47:01'),
(8, 'dfgdfg', 3, 73, '2019-11-20 16:34:18', '2019-11-20 16:34:18'),
(9, 'dvcvcxv', 3, 80, '2019-11-20 16:40:57', '2019-11-20 16:40:57'),
(10, 'ecec\n', 3, 79, '2019-11-20 16:42:14', '2019-11-20 16:42:14'),
(11, 'ceccec', 3, 79, '2019-11-20 16:42:16', '2019-11-20 16:42:16'),
(12, 'cece', 3, 79, '2019-11-20 16:42:20', '2019-11-20 16:42:20'),
(13, 'sfdsfsfsd', 3, 72, '2019-11-21 12:46:56', '2019-11-21 12:46:56'),
(14, 'ffsdfsdfdsf\n', 3, 73, '2019-11-21 13:06:34', '2019-11-21 13:06:34'),
(15, 'asdasdasd', 3, 78, '2019-11-21 13:14:56', '2019-11-21 13:14:56'),
(16, 'dasdasd', 3, 65, '2019-11-21 13:24:21', '2019-11-21 13:24:21'),
(17, 'weffsdfs', 3, 74, '2019-11-25 12:14:29', '2019-11-25 12:14:29'),
(18, 'ggf\n', 3, 74, '2019-11-25 12:23:11', '2019-11-25 12:23:11'),
(19, 'hrhr', 3, 74, '2019-11-25 12:23:21', '2019-11-25 12:23:21'),
(20, 'dfdg', 3, 74, '2019-11-25 12:23:25', '2019-11-25 12:23:25'),
(21, 'gdg', 3, 74, '2019-11-25 12:23:27', '2019-11-25 12:23:27'),
(22, 'gg', 3, 74, '2019-11-25 12:23:29', '2019-11-25 12:23:29'),
(23, 'g', 3, 74, '2019-11-25 12:23:30', '2019-11-25 12:23:30'),
(24, 'gdgd', 3, 74, '2019-11-25 12:23:34', '2019-11-25 12:23:34'),
(25, 'dgd', 3, 74, '2019-11-25 12:23:37', '2019-11-25 12:23:37'),
(26, 'dfg', 3, 70, '2019-11-25 12:26:51', '2019-11-25 12:26:51'),
(27, 'dfg', 3, 70, '2019-11-25 12:26:55', '2019-11-25 12:26:55'),
(28, 'f', 3, 70, '2019-11-25 12:26:56', '2019-11-25 12:26:56'),
(29, 'f', 3, 70, '2019-11-25 12:26:58', '2019-11-25 12:26:58'),
(30, 'f', 3, 70, '2019-11-25 12:26:59', '2019-11-25 12:26:59'),
(31, 'f', 3, 70, '2019-11-25 12:27:01', '2019-11-25 12:27:01'),
(32, 'gfbdg', 3, 65, '2019-11-25 12:27:27', '2019-11-25 12:27:27'),
(33, 'fgfd', 3, 65, '2019-11-25 12:27:28', '2019-11-25 12:27:28'),
(34, 'dfg', 3, 65, '2019-11-25 12:27:30', '2019-11-25 12:27:30'),
(35, 'dfg', 3, 65, '2019-11-25 12:27:31', '2019-11-25 12:27:31'),
(36, 'dfg', 3, 65, '2019-11-25 12:27:32', '2019-11-25 12:27:32'),
(37, 'fdg', 3, 65, '2019-11-25 12:27:33', '2019-11-25 12:27:33'),
(38, 'dfg', 3, 65, '2019-11-25 12:27:35', '2019-11-25 12:27:35'),
(39, 'h', 3, 80, '2019-11-25 12:34:29', '2019-11-25 12:34:29'),
(40, 'rg', 3, 80, '2019-11-25 12:40:09', '2019-11-25 12:40:09'),
(41, 'fdg', 3, 80, '2019-11-25 12:40:11', '2019-11-25 12:40:11'),
(42, 'fdg', 3, 80, '2019-11-25 12:40:12', '2019-11-25 12:40:12'),
(43, 'asdasd\n', 3, 80, '2019-11-28 12:12:21', '2019-11-28 12:12:21'),
(44, 'sfdsdfsfd', 3, 82, '2019-12-12 11:59:56', '2019-12-12 11:59:56'),
(45, 'sdfsfd', 3, 81, '2019-12-12 12:00:08', '2019-12-12 12:00:08'),
(46, 'hahdhfhsd', 3, 82, '2019-12-12 12:03:22', '2019-12-12 12:03:22'),
(47, 'sdcsdcs', 3, 82, '2019-12-12 14:24:17', '2019-12-12 14:24:17'),
(48, 'sdfsfsdf\n', 3, 84, '2019-12-12 16:20:01', '2019-12-12 16:20:01'),
(49, 'sdfsdfsdf', 3, 84, '2019-12-12 16:20:05', '2019-12-12 16:20:05'),
(50, 'nwnenwe', 3, 84, '2019-12-12 16:20:09', '2019-12-12 16:20:09'),
(51, 'sfsdfsdf', 1, 87, '2019-12-23 16:48:23', '2019-12-23 16:48:23'),
(52, 'sdfsdf', 1, 81, '2019-12-23 16:56:23', '2019-12-23 16:56:23'),
(53, 'sdfdsf', 1, 80, '2019-12-23 16:56:31', '2019-12-23 16:56:31'),
(54, 'sdf', 1, 78, '2019-12-23 16:56:40', '2019-12-23 16:56:40'),
(55, 'dsfds', 1, 77, '2019-12-23 16:59:21', '2019-12-23 16:59:21'),
(56, 'sdf', 1, 87, '2019-12-23 17:01:22', '2019-12-23 17:01:22'),
(57, 'gdfgd', 3, 81, '2019-12-23 18:31:25', '2019-12-23 18:31:25'),
(58, 'sdf', 3, 81, '2019-12-23 18:37:47', '2019-12-23 18:37:47'),
(59, 'dsfsdf', 3, 87, '2019-12-23 19:02:36', '2019-12-23 19:02:36'),
(60, 'adasd', 3, 87, '2019-12-24 11:50:49', '2019-12-24 11:50:49'),
(61, 'sdfsdf', 3, 87, '2019-12-24 11:59:02', '2019-12-24 11:59:02'),
(62, 'new cooment', 3, 84, '2019-12-24 11:59:11', '2019-12-24 11:59:11'),
(63, 'czxc', 3, 80, '2019-12-24 14:53:34', '2019-12-24 14:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'United State', NULL, NULL),
(2, 'United KingDom', NULL, NULL),
(3, 'France', NULL, NULL),
(4, 'China', NULL, NULL),
(5, 'Colombia', NULL, NULL),
(6, 'Bangladesh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_products`
--

CREATE TABLE `custom_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_products`
--

INSERT INTO `custom_products` (`id`, `title`, `image`, `user_id`, `feed_id`, `created_at`, `updated_at`) VALUES
(47, 'custom pro', '/uploads/1569242681672.jpeg', 3, 65, '2019-09-23 18:44:59', '2019-09-23 18:44:59'),
(48, 'custom pro', '/uploads/1569242740109.jpeg', 4, 66, '2019-09-23 18:45:52', '2019-09-23 18:45:52'),
(49, 'custom pro', '/uploads/1569243039908.jpeg', 11, 70, '2019-09-23 18:50:53', '2019-09-23 18:50:53'),
(50, 'custom pro', '/uploads/1569243319263.jpeg', 4, 74, '2019-09-23 18:55:28', '2019-09-23 18:55:28'),
(51, 'custom pro', '/uploads/1573548525612.jpeg', 5, 76, '2019-11-12 14:48:59', '2019-11-12 14:48:59'),
(52, 'custom pro', '/uploads/1573622807648.jpeg', 7, 77, '2019-11-13 11:26:57', '2019-11-13 11:26:58'),
(53, 'custom pro', '/uploads/1574241463116.jpeg', 14, 79, '2019-11-20 15:17:55', '2019-11-20 15:17:55'),
(54, 'custom pro', '/uploads/1574241484660.jpeg', 3, 80, '2019-11-20 15:18:16', '2019-11-20 15:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `custom_product_links`
--

CREATE TABLE `custom_product_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `x_cor` int(11) DEFAULT NULL,
  `y_cor` int(11) DEFAULT NULL,
  `linked_product_id` int(10) UNSIGNED DEFAULT NULL,
  `custom_product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_product_links`
--

INSERT INTO `custom_product_links` (`id`, `x_cor`, `y_cor`, `linked_product_id`, `custom_product_id`, `created_at`, `updated_at`) VALUES
(113, 32, 33, 7, 47, '2019-09-23 18:44:59', '2019-09-23 18:44:59'),
(114, 54, 79, 6, 47, '2019-09-23 18:44:59', '2019-09-23 18:44:59'),
(115, 50, 23, 2, 48, '2019-09-23 18:45:52', '2019-09-23 18:45:52'),
(116, 55, 92, 5, 48, '2019-09-23 18:45:52', '2019-09-23 18:45:52'),
(117, 41, 38, 8, 49, '2019-09-23 18:50:53', '2019-09-23 18:50:53'),
(118, 44, 16, 2, 50, '2019-09-23 18:55:28', '2019-09-23 18:55:28'),
(119, 57, 16, 2, 51, '2019-11-12 14:48:59', '2019-11-12 14:48:59'),
(120, 31, 52, 6, 51, '2019-11-12 14:48:59', '2019-11-12 14:48:59'),
(121, 18, 14, 7, 51, '2019-11-12 14:48:59', '2019-11-12 14:48:59'),
(122, 40, 62, 2, 52, '2019-11-13 11:26:58', '2019-11-13 11:26:58'),
(123, 14, 2, 3, 52, '2019-11-13 11:26:58', '2019-11-13 11:26:58'),
(124, 76, 46, 9, 53, '2019-11-20 15:17:55', '2019-11-20 15:17:55'),
(125, 40, 41, 1, 54, '2019-11-20 15:18:17', '2019-11-20 15:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--

CREATE TABLE `feeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT 'lookbook, collage, blog, vlog, status',
  `lookbook_id` int(10) UNSIGNED DEFAULT NULL,
  `collage_id` int(10) UNSIGNED DEFAULT NULL,
  `blog_id` int(10) UNSIGNED DEFAULT NULL,
  `vlog_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feeds`
--

INSERT INTO `feeds` (`id`, `type`, `lookbook_id`, `collage_id`, `blog_id`, `vlog_id`, `status_id`, `created_at`, `updated_at`) VALUES
(65, 'lookbook', 47, NULL, NULL, NULL, NULL, '2019-09-23 18:44:59', '2019-09-23 18:44:59'),
(66, 'lookbook', 48, NULL, NULL, NULL, NULL, '2019-09-23 18:45:52', '2019-09-23 18:45:52'),
(67, 'collage', NULL, 17, NULL, NULL, NULL, '2019-09-23 18:46:27', '2019-09-23 18:46:27'),
(68, 'blog', NULL, NULL, 6, NULL, NULL, '2019-09-23 18:48:21', '2019-09-23 18:48:21'),
(69, 'vlog', NULL, NULL, NULL, 6, NULL, '2019-09-23 18:49:42', '2019-09-23 18:49:42'),
(70, 'lookbook', 49, NULL, NULL, NULL, NULL, '2019-09-23 18:50:53', '2019-09-23 18:50:53'),
(71, 'collage', NULL, 18, NULL, NULL, NULL, '2019-09-23 18:51:41', '2019-09-23 18:51:41'),
(72, 'blog', NULL, NULL, 7, NULL, NULL, '2019-09-23 18:52:41', '2019-09-23 18:52:41'),
(73, 'vlog', NULL, NULL, NULL, 7, NULL, '2019-09-23 18:53:36', '2019-09-23 18:53:36'),
(74, 'lookbook', 50, NULL, NULL, NULL, NULL, '2019-09-23 18:55:28', '2019-09-23 18:55:28'),
(75, 'collage', NULL, 19, NULL, NULL, NULL, '2019-10-26 18:14:56', '2019-10-26 18:14:56'),
(76, 'lookbook', 51, NULL, NULL, NULL, NULL, '2019-11-12 14:48:59', '2019-11-12 14:48:59'),
(77, 'lookbook', 52, NULL, NULL, NULL, NULL, '2019-11-13 11:26:58', '2019-11-13 11:26:58'),
(78, 'collage', NULL, 20, NULL, NULL, NULL, '2019-11-17 18:15:22', '2019-11-17 18:15:22'),
(79, 'lookbook', 53, NULL, NULL, NULL, NULL, '2019-11-20 15:17:55', '2019-11-20 15:17:55'),
(80, 'lookbook', 54, NULL, NULL, NULL, NULL, '2019-11-20 15:18:17', '2019-11-20 15:18:17'),
(81, 'blog', NULL, NULL, 8, NULL, NULL, '2019-12-09 17:02:05', '2019-12-09 17:02:05'),
(82, 'status', NULL, NULL, NULL, NULL, 1, '2019-12-12 11:52:56', '2019-12-12 11:52:56'),
(83, 'status', NULL, NULL, NULL, NULL, 2, '2019-12-12 12:09:18', '2019-12-12 12:09:18'),
(84, 'status', NULL, NULL, NULL, NULL, 3, '2019-12-12 12:10:15', '2019-12-12 12:10:15'),
(87, 'status', NULL, NULL, NULL, NULL, 6, '2019-12-12 12:54:50', '2019-12-12 12:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `follower_user_id` int(10) UNSIGNED DEFAULT NULL,
  `following_user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `follower_user_id`, `following_user_id`, `created_at`, `updated_at`) VALUES
(1, 5, 4, NULL, NULL),
(2, 3, 7, NULL, NULL),
(3, 4, 3, NULL, NULL),
(4, 5, 4, NULL, NULL),
(5, 5, 11, NULL, NULL),
(6, 4, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `feed_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 75, 3, '2019-11-12 15:52:55', '2019-11-12 15:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `details` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `details`, `stock`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'new pant', 23, 'new pant', 20, 1, 2, NULL, '2019-07-03 13:42:04'),
(2, 'cote', 50, 'new itme\nthat are available\n- Car\n- Banana\n- Yellow', 10, 1, 1, NULL, '2019-12-24 16:37:48'),
(3, 'cote2', 40, '', 25, 1, 1, NULL, '2019-07-03 14:45:38'),
(4, 'shoe', 15, '', 100, 2, 3, NULL, NULL),
(5, 'shoe2', 25, '', 50, 2, 3, NULL, NULL),
(6, 'pant2', 30, '', 44, 1, 2, NULL, NULL),
(7, 'shirt', 30, 'nice shirt for normal use', 54, 2, 4, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(8, 'title', 60, 'kfskdfkksfkksdfkkds', 66, 8, 1, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(9, 'title', 30, 'asdasdasd', 23, 6, 4, '2019-06-30 17:51:48', '2019-06-30 17:51:48'),
(10, 'dssdf', 34, 'weweqwe', 30, 6, 1, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(11, 'new shirt', 34, 'new shirt for winter', 10, 6, 4, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(12, 'new pant', 20, 'new pant for summer', 15, 8, 2, '2019-07-02 15:08:43', '2019-07-02 15:08:43'),
(13, 'new shoe', 12, 'nice shoe', 5, 10, 3, '2019-07-18 21:37:14', '2019-07-18 21:37:14'),
(14, 'new pant', 16, 'efssefsef', 8, 1, 2, '2019-08-11 23:03:34', '2019-08-11 23:03:34'),
(15, 'hdthd', 34, '', 40, 1, 2, '2019-08-22 18:12:14', '2019-08-22 18:12:14'),
(16, 'summer shirt', 20, 'new shirt\nnew shirt\nnew shirt\nnew shirt', 20, 1, 4, '2019-08-31 11:52:00', '2019-08-31 11:52:00'),
(17, 'Shirt', 14, 'new \n2019\nnice shirt\nfor winter', 20, 1, 4, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(18, 'Shirt', 14, 'new \n2019\nnice shirt\nfor winter', 20, 1, 4, '2019-12-26 13:09:06', '2019-12-26 13:09:06'),
(21, 'asd', 22, 'asdsa\nasdas\nd\n\nsad\nas', 22, 1, NULL, '2019-12-26 15:50:49', '2019-12-26 15:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cote', NULL, NULL),
(2, 'Pant', NULL, NULL),
(3, 'Shoe', NULL, NULL),
(4, 'Shirt', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

CREATE TABLE `product_colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `color_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `color_id`, `product_id`, `created_at`, `updated_at`) VALUES
(10, 2, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(11, 3, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(12, 7, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(13, 8, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(14, 3, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(15, 2, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(16, 4, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(17, 5, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(18, 9, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(19, 4, 9, '2019-06-30 17:51:48', '2019-06-30 17:51:48'),
(20, 5, 9, '2019-06-30 17:51:48', '2019-06-30 17:51:48'),
(21, 2, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(22, 3, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(23, 4, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(24, 5, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(25, 5, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(26, 6, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(27, 4, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(28, 3, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(29, 2, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(30, 1, 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(31, 4, 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(32, 7, 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(33, 3, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(34, 5, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(35, 7, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(36, 8, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(37, 9, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(38, 10, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(39, 3, 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(40, 2, 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(41, 9, 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(42, 3, 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(43, 5, 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(44, 4, 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(68, 6, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(69, 4, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(70, 5, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(71, 7, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(96, 1, 15, '2019-08-22 18:23:36', '2019-08-22 18:23:36'),
(97, 2, 15, '2019-08-22 18:23:36', '2019-08-22 18:23:36'),
(98, 4, 15, '2019-08-22 18:23:36', '2019-08-22 18:23:36'),
(105, 1, 16, '2019-08-31 12:24:11', '2019-08-31 12:24:11'),
(106, 2, 16, '2019-08-31 12:24:11', '2019-08-31 12:24:11'),
(113, 8, 17, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(114, 9, 17, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(115, 10, 17, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(125, 8, 18, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(126, 9, 18, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(127, 10, 18, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(134, 7, 21, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(135, 9, 21, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(136, 1, 2, '2019-12-26 16:42:20', '2019-12-26 16:42:20'),
(137, 2, 2, '2019-12-26 16:42:20', '2019-12-26 16:42:20'),
(138, 4, 2, '2019-12-26 16:42:20', '2019-12-26 16:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(4, '/products_image/shoe.jpg', 4, NULL, NULL),
(5, '/products_image/shoe2.jpg', 5, NULL, NULL),
(7, '/uploads/1561894388855.jpeg', 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(8, '/uploads/1561894630945.jpeg', 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(9, '/uploads/1561895505766.jpeg', 9, '2019-06-30 17:51:48', '2019-06-30 17:51:48'),
(10, '/uploads/1561903594039.jpeg', 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(15, '/uploads/1562058080890.jpeg', 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(16, '/uploads/1562058095840.jpeg', 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(17, '/uploads/1562058088071.jpeg', 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(18, '/uploads/1562058511885.jpeg', 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(19, '/uploads/1562058519763.jpeg', 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(20, '/products_image/pant.jpg', 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(21, '/uploads/1562139708386.jpeg', 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(22, '/products_image/pant2.jpg', 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(23, '/products_image/cote4.jpg', 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(24, '/uploads/1563464212072.jpeg', 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(25, '/uploads/1563464220451.jpeg', 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(26, '/uploads/1563464109569.jpeg', 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(34, '/uploads/1565543897645.jpeg', 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(51, '/uploads/1566475922371.png', 15, '2019-08-22 18:23:36', '2019-08-22 18:23:36'),
(52, '/uploads/1566475930630.png', 15, '2019-08-22 18:23:36', '2019-08-22 18:23:36'),
(56, '/uploads/1567230698722.jpeg', 16, '2019-08-31 12:24:11', '2019-08-31 12:24:11'),
(63, '/uploads/1577343953275.jpeg', 17, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(67, '/uploads/1577343953275.jpeg', 18, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(74, '/uploads/1577353848273.jpeg', 21, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(75, '/products_image/pant4.jpg', 6, '2019-12-26 16:24:06', '2019-12-26 16:24:06'),
(76, '/products_image/cote.jpg', 2, '2019-12-26 16:42:20', '2019-12-26 16:42:20'),
(77, '/products_image/cote2.jpg', 2, '2019-12-26 16:42:20', '2019-12-26 16:42:20'),
(78, '/products_image/cote3.jpg', 2, '2019-12-26 16:42:20', '2019-12-26 16:42:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` tinyint(1) DEFAULT NULL,
  `comment` text,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `rating`, `comment`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'very nice cote  asd', 2, 3, '2019-09-01 00:00:00', '2019-12-24 13:00:27'),
(2, 5, 'wow ', 1, 3, '2019-09-01 19:10:10', '2019-09-01 19:10:10'),
(3, 2, 'asda\nsdf\nasd', 3, 3, '2019-09-01 19:12:56', '2019-09-01 19:29:35'),
(4, 4, 'look good', 2, 5, '2019-09-01 00:00:00', '2019-09-01 00:00:00'),
(5, 5, 'look good', 2, 4, '2019-09-01 00:00:00', '2019-09-01 00:00:00'),
(11, 2, 'dasdasd\nsadasd\ndadkdla skdkas', 2, 11, '2019-09-02 12:53:50', '2019-09-02 15:46:58'),
(19, 4, 'asdad\nasdads', 5, 11, '2019-09-02 15:38:13', '2019-09-02 15:38:30'),
(20, 4, 'fsadf', 6, 3, '2019-09-02 16:03:39', '2019-09-02 16:03:39'),
(21, 4, 'fsadf', 6, 4, '2019-09-02 16:03:39', '2019-09-02 16:03:39'),
(22, 5, 'like it', 13, 3, '2019-09-02 18:01:23', '2019-09-02 18:01:23'),
(23, 5, 'sdfsdfsd', 2, 1, '2019-12-24 13:02:34', '2019-12-24 13:02:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `size_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `size_id`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 4, 4, NULL, NULL),
(10, 2, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(11, 3, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(12, 7, 7, '2019-06-30 17:33:11', '2019-06-30 17:33:11'),
(14, 2, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(15, 3, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(16, 4, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(17, 5, 8, '2019-06-30 17:37:14', '2019-06-30 17:37:14'),
(19, 4, 9, '2019-06-30 17:51:48', '2019-06-30 17:51:48'),
(20, 5, 9, '2019-06-30 17:51:48', '2019-06-30 17:51:48'),
(21, 2, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(22, 3, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(23, 4, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(24, 5, 10, '2019-06-30 20:06:35', '2019-06-30 20:06:35'),
(25, 2, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(26, 3, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(27, 4, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(28, 5, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(29, 6, 11, '2019-07-02 15:02:02', '2019-07-02 15:02:02'),
(30, 1, 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(31, 4, 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(32, 7, 12, '2019-07-02 15:08:44', '2019-07-02 15:08:44'),
(33, 3, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(34, 1, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(35, 2, 1, '2019-07-03 13:42:04', '2019-07-03 13:42:04'),
(36, 1, 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(37, 2, 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(38, 3, 3, '2019-07-03 14:45:38', '2019-07-03 14:45:38'),
(39, 1, 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(40, 2, 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(41, 3, 13, '2019-07-18 21:37:15', '2019-07-18 21:37:15'),
(65, 3, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(66, 4, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(67, 2, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(68, 5, 14, '2019-08-11 23:24:35', '2019-08-11 23:24:35'),
(93, 2, 15, '2019-08-22 18:23:37', '2019-08-22 18:23:37'),
(94, 3, 15, '2019-08-22 18:23:37', '2019-08-22 18:23:37'),
(95, 4, 15, '2019-08-22 18:23:37', '2019-08-22 18:23:37'),
(102, 1, 16, '2019-08-31 12:24:12', '2019-08-31 12:24:12'),
(103, 2, 16, '2019-08-31 12:24:12', '2019-08-31 12:24:12'),
(110, 1, 17, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(111, 2, 17, '2019-12-26 13:06:27', '2019-12-26 13:06:27'),
(118, 1, 18, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(119, 2, 18, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(126, 5, 21, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(127, 6, 21, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(128, 4, 6, '2019-12-26 16:24:06', '2019-12-26 16:24:06'),
(129, 2, 2, '2019-12-26 16:42:21', '2019-12-26 16:42:21'),
(130, 3, 2, '2019-12-26 16:42:21', '2019-12-26 16:42:21'),
(131, 4, 2, '2019-12-26 16:42:21', '2019-12-26 16:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_subcategories`
--

CREATE TABLE `product_subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_subcategories`
--

INSERT INTO `product_subcategories` (`id`, `product_id`, `subcategory_id`, `created_at`, `updated_at`) VALUES
(7, 18, 3, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(8, 18, 4, '2019-12-26 13:56:25', '2019-12-26 13:56:25'),
(11, 21, 2, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(12, 21, 3, '2019-12-26 15:50:49', '2019-12-26 15:50:49'),
(13, 6, 5, '2019-12-26 16:24:06', '2019-12-26 16:24:06'),
(14, 2, 4, '2019-12-26 16:42:21', '2019-12-26 16:42:21'),
(15, 2, 3, '2019-12-26 16:42:21', '2019-12-26 16:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `tag`, `product_id`, `created_at`, `updated_at`) VALUES
(10, 'new shirt', 16, '2019-08-31 12:24:12', '2019-08-31 12:24:12'),
(11, 'new 2019', 16, '2019-08-31 12:24:12', '2019-08-31 12:24:12'),
(12, '2019 shirt', 16, '2019-08-31 12:24:12', '2019-08-31 12:24:12'),
(13, '2019', 16, '2019-08-31 12:24:12', '2019-08-31 12:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, 'XS', NULL, NULL),
(2, 'S', NULL, NULL),
(3, 'M', NULL, NULL),
(4, 'L', NULL, NULL),
(5, 'XL', NULL, NULL),
(6, 'XXL', NULL, NULL),
(7, 'XXXL', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text,
  `user_id` int(10) UNSIGNED NOT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `text`, `user_id`, `feed_id`, `created_at`, `updated_at`) VALUES
(1, 'this is my first status \nthis is my first status \nthis is my first status  this is my first status  this is my first status  this is my first status  this is my first status  this is my first status \nthis is my first status \nthis is my first status ', 3, 82, '2019-12-12 11:52:56', '2019-12-12 11:52:56'),
(3, 'skkfkdksfkksdfkdf\nsadadasdasdasdasdas\nd\nas\nd\n\n\nad', 3, 84, '2019-12-12 12:10:15', '2019-12-12 15:43:11'),
(6, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 3, 87, '2019-12-12 12:54:49', '2019-12-24 18:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `status_images`
--

CREATE TABLE `status_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_images`
--

INSERT INTO `status_images` (`id`, `image`, `status_id`, `created_at`, `updated_at`) VALUES
(9, '/uploads/1576143786707.jpeg', 3, '2019-12-12 15:43:11', '2019-12-12 15:43:11'),
(10, '/uploads/1576143790441.jpeg', 3, '2019-12-12 15:43:11', '2019-12-12 15:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `store_subcategories`
--

CREATE TABLE `store_subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `subcategory_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store_subcategories`
--

INSERT INTO `store_subcategories` (`id`, `store_id`, `subcategory_id`, `created_at`, `updated_at`) VALUES
(5, 1, 2, '2019-12-26 15:56:16', '2019-12-26 15:56:16'),
(6, 1, 3, '2019-12-26 15:56:16', '2019-12-26 15:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Shoes', NULL, NULL),
(2, 'Shirt', NULL, NULL),
(3, 'Belt', NULL, NULL),
(4, 'Hat', NULL, NULL),
(5, 'Pant', '2019-12-25 18:55:47', '2019-12-25 18:55:47'),
(6, 'Cote', '2019-12-25 18:56:30', '2019-12-25 18:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `token_deduct_values`
--

CREATE TABLE `token_deduct_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `lookbook` smallint(4) DEFAULT NULL,
  `collage` smallint(4) DEFAULT NULL,
  `blog` smallint(4) DEFAULT NULL,
  `vlog` smallint(4) DEFAULT NULL,
  `user_like_deducted_value` smallint(4) DEFAULT NULL COMMENT 'when user like an item how much token will be deducted form him',
  `owner_like_removed_value` smallint(4) DEFAULT NULL COMMENT 'when user remove a like how much token from item owner will be deducted',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token_deduct_values`
--

INSERT INTO `token_deduct_values` (`id`, `lookbook`, `collage`, `blog`, `vlog`, `user_like_deducted_value`, `owner_like_removed_value`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `token_dollar_values`
--

CREATE TABLE `token_dollar_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` float(8,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token_dollar_values`
--

INSERT INTO `token_dollar_values` (`id`, `value`, `created_at`, `updated_at`) VALUES
(1, 0.0500, '2019-10-23 00:00:00', '2019-10-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `token_transactions`
--

CREATE TABLE `token_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `action_type` varchar(255) NOT NULL DEFAULT 'created' COMMENT 'created,received,deducted,delete',
  `token` int(11) NOT NULL DEFAULT '0',
  `item_type` varchar(191) DEFAULT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token_transactions`
--

INSERT INTO `token_transactions` (`id`, `action_type`, `token`, `item_type`, `feed_id`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 'created', 6, 'Lookbook', 65, 3, '2019-09-23 18:45:00', '2019-09-23 18:45:00'),
(15, 'created', 6, 'Lookbook', 66, 3, '2019-09-23 18:45:52', '2019-09-23 18:45:52'),
(16, 'created', 8, 'Collage', 67, 3, '2019-09-23 18:46:27', '2019-09-23 18:46:27'),
(17, 'created', 4, 'Blog', 68, 4, '2019-09-23 18:48:21', '2019-09-23 18:48:21'),
(18, 'created', 5, 'Vlog', 69, 4, '2019-09-23 18:49:42', '2019-09-23 18:49:42'),
(19, 'created', 6, 'Lookbook', 70, 11, '2019-09-23 18:50:53', '2019-09-23 18:50:53'),
(20, 'created', 8, 'Collage', 71, 11, '2019-09-23 18:51:41', '2019-09-23 18:51:41'),
(21, 'created', 4, 'Bolg', 72, 11, '2019-09-23 18:52:41', '2019-09-23 18:52:41'),
(22, 'created', 5, 'Vlog', 73, 11, '2019-09-23 18:53:36', '2019-09-23 18:53:36'),
(23, 'created', 6, 'Lookbook', 74, 3, '2019-09-23 18:55:28', '2019-09-23 18:55:28'),
(24, 'created', 4, 'Blog', NULL, 3, '2019-09-24 11:09:09', '2019-09-24 11:09:09'),
(69, 'deducted', 3, 'Like', NULL, 4, '2019-10-07 22:37:48', '2019-10-07 22:37:48'),
(70, 'received', 2, 'Like', NULL, 3, '2019-10-07 22:37:48', '2019-10-07 22:37:48'),
(71, 'got_back', 3, 'Like', NULL, 4, '2019-10-07 22:45:55', '2019-10-07 22:45:55'),
(72, 'like_removed', 2, 'Like', NULL, 3, '2019-10-07 22:45:55', '2019-10-07 22:45:55'),
(73, 'received', 2, 'Like', 73, 11, '2019-10-23 19:07:11', '2019-10-23 19:07:11'),
(74, 'deducted', 3, 'Like', 73, 3, '2019-10-23 19:07:11', '2019-10-23 19:07:11'),
(75, 'like_removed', 2, 'Like', 73, 11, '2019-10-23 19:08:00', '2019-10-23 19:08:00'),
(76, 'got_back', 3, 'Like', 73, 3, '2019-10-23 19:08:00', '2019-10-23 19:08:00'),
(77, 'delete', 8, 'Blog', NULL, 3, '2019-10-23 19:09:01', '2019-10-23 19:09:01'),
(78, 'deducted', 3, 'Like', 75, 3, '2019-10-26 18:18:11', '2019-10-26 18:18:11'),
(79, 'got_back', 3, 'Like', 75, 3, '2019-10-26 18:18:31', '2019-10-26 18:18:31'),
(80, 'created', 6, 'Lookbook', 76, 3, '2019-11-12 14:48:59', '2019-11-12 14:48:59'),
(81, 'deducted', 3, 'Like', 75, 3, '2019-11-12 15:52:44', '2019-11-12 15:52:44'),
(82, 'got_back', 3, 'Like', 75, 3, '2019-11-12 15:52:49', '2019-11-12 15:52:49'),
(83, 'deducted', 3, 'Like', 75, 3, '2019-11-12 15:52:55', '2019-11-12 15:52:55'),
(84, 'created', 6, 'Lookbook', 77, 3, '2019-11-13 11:26:58', '2019-11-13 11:26:58'),
(85, 'received', 2, 'Like', 68, 4, '2019-11-17 12:00:33', '2019-11-17 12:00:33'),
(86, 'deducted', 3, 'Like', 68, 3, '2019-11-17 12:00:33', '2019-11-17 12:00:33'),
(87, 'like_removed', 2, 'Like', 68, 4, '2019-11-17 12:00:49', '2019-11-17 12:00:49'),
(88, 'got_back', 3, 'Like', 68, 3, '2019-11-17 12:00:49', '2019-11-17 12:00:49'),
(89, 'created', 8, 'Collage', 78, 3, '2019-11-17 18:15:22', '2019-11-17 18:15:22'),
(90, 'created', 6, 'Lookbook', 79, 3, '2019-11-20 15:17:55', '2019-11-20 15:17:55'),
(91, 'created', 6, 'Lookbook', 80, 3, '2019-11-20 15:18:17', '2019-11-20 15:18:17'),
(92, 'received', 2, 'Like', 68, 4, '2019-11-21 12:50:21', '2019-11-21 12:50:21'),
(93, 'deducted', 3, 'Like', 68, 3, '2019-11-21 12:50:21', '2019-11-21 12:50:21'),
(94, 'like_removed', 2, 'Like', 68, 4, '2019-11-21 12:55:23', '2019-11-21 12:55:23'),
(95, 'got_back', 3, 'Like', 68, 3, '2019-11-21 12:55:23', '2019-11-21 12:55:23'),
(96, 'received', 2, 'Like', 68, 4, '2019-11-21 12:55:35', '2019-11-21 12:55:35'),
(97, 'deducted', 3, 'Like', 68, 3, '2019-11-21 12:55:35', '2019-11-21 12:55:35'),
(98, 'like_removed', 2, 'Like', 68, 4, '2019-11-21 12:55:38', '2019-11-21 12:55:38'),
(99, 'got_back', 3, 'Like', 68, 3, '2019-11-21 12:55:38', '2019-11-21 12:55:38'),
(100, 'received', 2, 'Like', 70, 11, '2019-11-21 13:24:41', '2019-11-21 13:24:41'),
(101, 'deducted', 3, 'Like', 70, 3, '2019-11-21 13:24:41', '2019-11-21 13:24:41'),
(102, 'like_removed', 2, 'Like', 70, 11, '2019-11-21 13:24:45', '2019-11-21 13:24:45'),
(103, 'got_back', 3, 'Like', 70, 3, '2019-11-21 13:24:45', '2019-11-21 13:24:45'),
(104, 'created', 4, 'Blog', 81, 3, '2019-12-09 17:02:05', '2019-12-09 17:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `token_values`
--

CREATE TABLE `token_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `lookbook` smallint(4) DEFAULT NULL,
  `collage` smallint(4) DEFAULT NULL,
  `blog` smallint(4) DEFAULT NULL,
  `vlog` smallint(4) DEFAULT NULL,
  `user_like_got_back_value` smallint(4) DEFAULT NULL COMMENT 'when user remove a like how much token he will get back',
  `owner_like_added_value` smallint(4) DEFAULT NULL COMMENT 'when user like an item how much token the item owner will get',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token_values`
--

INSERT INTO `token_values` (`id`, `lookbook`, `collage`, `blog`, `vlog`, `user_like_got_back_value`, `owner_like_added_value`, `created_at`, `updated_at`) VALUES
(1, 6, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(2, NULL, 8, NULL, NULL, NULL, 0, NULL, NULL),
(3, NULL, NULL, 4, NULL, NULL, 0, NULL, NULL),
(4, NULL, NULL, NULL, 5, NULL, 0, NULL, NULL),
(5, NULL, NULL, NULL, NULL, 3, NULL, '2019-10-23 00:00:00', NULL),
(6, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1 for seller, 2 for influencer/buyer, 5 for admin',
  `image` varchar(191) DEFAULT NULL,
  `shop_description` text,
  `shop_category_id` int(10) UNSIGNED DEFAULT NULL,
  `verification_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 Unverified, 1 Progress, 2 Missing, 3 Rejected, 4 Approved',
  `ethereum_address` varchar(191) DEFAULT NULL,
  `cover_image` varchar(191) DEFAULT NULL,
  `message` text,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `apiToken` varchar(255) DEFAULT NULL,
  `user_own_site` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role`, `image`, `shop_description`, `shop_category_id`, `verification_status`, `ethereum_address`, `cover_image`, `message`, `address`, `phone`, `apiToken`, `user_own_site`, `created_at`, `updated_at`) VALUES
(1, 'Apex', 'apex', 'hafiz@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 1, '/images/apex_logo.jpg', 'High quality Cotes and Pants of all sizes are available', 1, 0, NULL, NULL, NULL, 'Sunamgong Road, Amrobkhana, Sylhet', '+880811111164', '5hl8359ok60kw5et', NULL, NULL, '2020-01-30 16:11:08'),
(2, 'Lotto', 'lotto', 'kamran@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 1, '/images/lotto_logo.jpg', 'High quality Shoes are available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role`, `image`, `shop_description`, `shop_category_id`, `verification_status`, `ethereum_address`, `cover_image`, `message`, `address`, `phone`, `apiToken`, `user_own_site`, `created_at`, `updated_at`) VALUES
(3, 'Kollol Chokroborty', 'kollol', 'kollol@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 2, '/uploads/1574923357292.jpeg', NULL, NULL, 4, '1xde0b295669a9fd93d5f28d9ec85e40f4cb697bae', '/uploads/1574923593175.jpeg', NULL, NULL, NULL, '5hl838mgk60r5ilg', '{\"sectionsName\":\"[\\\"benefits-4col-7\\\",\\\"desc-img-text-9\\\"]\",\"pagesStorageObj\":\"[{\\\"_selfDOM\\\":{},\\\"id\\\":0,\\\"sections\\\":{\\\"benefits-4col-7\\\":{\\\"sectionPreview\\\":{\\\"groupName\\\":\\\"benefits\\\"},\\\"name\\\":\\\"benefits-4col-7\\\",\\\"_selfDOM\\\":{}},\\\"desc-img-text-9\\\":{\\\"sectionPreview\\\":{\\\"name\\\":\\\"desc-img-text-9\\\",\\\"groupName\\\":\\\"descriptions\\\",\\\"overallJs\\\":\\\"\\\",\\\"html\\\":\\\"<section id=\\\\\\\"desc-img-text-9\\\\\\\" class=\\\\\\\"pt-75 pb-75 pt-md-100 pb-md-100 dark\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n            <div class=\\\\\\\"col-md-6 col-lg-5 order-md-2\\\\\\\">\\\\n                <h3><strong>Feature description</strong></h3>\\\\n                <img class=\\\\\\\"mb-30 svg-secondary\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-2.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\">\\\\n                <p class=\\\\\\\"mb-30\\\\\\\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique.</p>\\\\n                <ul class=\\\\\\\"list-unstyled padding-x2-list separate-list mb-50\\\\\\\">\\\\n                    <li><img class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\">List item description</li>\\\\n                    <li><img class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\">List item description</li>\\\\n                    <li><img class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\">List item description</li>\\\\n                    <li><img class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\">List item description</li>\\\\n                </ul>\\\\n                <a class=\\\\\\\"btn btn-secondary\\\\\\\" href=\\\\\\\"#\\\\\\\" style=\\\\\\\"\\\\\\\"><span class=\\\\\\\"spr-option-textedit-link\\\\\\\" style=\\\\\\\"\\\\\\\">Details</span></a>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-md-6 mr-auto order-md-1 text-center\\\\\\\">\\\\n                <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                    <img class=\\\\\\\"mw-100 shadow mt-50 mt-lg-0\\\\\\\" src=\\\\\\\"images/gallery/item-arch-1.jpg\\\\\\\" alt=\\\\\\\"image\\\\\\\">\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n\\\",\\\"style\\\":\\\"#desc-img-text-9 .bg {\\\\n    background-image: url(\'images/gallery/item-grid-horizontal-3.jpg\');\\\\n    background-repeat: no-repeat;\\\\n    background-position: center center;\\\\n    background-size: cover;\\\\n    opacity:0.15;\\\\n}\\\",\\\"script\\\":\\\"\\\",\\\"preview\\\":\\\"sections/descriptions/desc-img-text-9/desc-img-text-9.jpg\\\",\\\"_selfDOM\\\":{}},\\\"name\\\":\\\"desc-img-text-9\\\",\\\"_selfDOM\\\":{}}},\\\"html\\\":\\\"\\\",\\\"htmlDOM\\\":null,\\\"preloader\\\":\\\"\\\",\\\"load\\\":true,\\\"_title\\\":\\\"index\\\",\\\"_name\\\":\\\"index\\\",\\\"_className\\\":\\\"index\\\",\\\"_metaDes\\\":\\\"\\\",\\\"_metaKey\\\":\\\"\\\",\\\"_metaJs\\\":\\\"\\\"}]\",\"projectData\":\"\\\"\\\\n    <style>/* default */\\\\n.dark .light , .light  , .dark .light  , .light  {\\\\n\\\\tfont-family: \'OpenSans\';\\\\n\\\\tfont-size: 14px;\\\\n\\\\tline-height: 1.5;\\\\n\\\\tcolor: #555;\\\\n}\\\\n.light .dark , .dark  , .light .dark  , .dark  {\\\\n\\\\tfont-family: \'OpenSans\';\\\\n\\\\tfont-size: 14px;\\\\n\\\\tline-height: 1.5;\\\\n\\\\tcolor: #ffffff;\\\\n}\\\\n.light-page {\\\\n\\\\tbackground-color: #fff;\\\\n}\\\\n.dark-page {\\\\n\\\\tbackground-color: #232122;\\\\n}\\\\nsection.light, footer.light, header.light {\\\\n}\\\\nsection.dark, footer.dark, header.dark {\\\\n}\\\\n.dark .section-line.light, .light .section-line, .dark .light .section-line, .section-line.light, .dark .section-line-container.light::after, .light .section-line-container::after, .dark .light .section-line-container::after, .section-line-container.light::after {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .section-line.dark, .dark .section-line, .light .dark .section-line, .section-line.dark, .light .section-line-container.dark::after, .dark .section-line-container::after, .light .dark .section-line-container::after, .section-line-container.dark::after {\\\\n\\\\tborder-color: #888888;\\\\n}\\\\n.dark .bg-wrap.light, .light .bg-wrap, .dark .light .bg-wrap, .bg-wrap.light, .dark .bg-default.light, .light .bg-default, .dark .light .bg-default, .bg-default.light {\\\\n\\\\tbackground-color: #fff;\\\\n}\\\\n.light .bg-wrap.dark, .dark .bg-wrap, .light .dark .bg-wrap, .bg-wrap.dark, .light .bg-default.dark, .dark .bg-default, .light .dark .bg-default, .bg-default.dark {\\\\n\\\\tbackground-color: #232122;\\\\n}\\\\n.dark h1.light, .light h1, .dark .light h1, h1.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 100px;\\\\n\\\\tfont-weight: 200;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #222;\\\\n}\\\\n.light h1.dark, .dark h1, .light .dark h1, h1.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 100px;\\\\n\\\\tfont-weight: 200;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark h2.light, .light h2, .dark .light h2, h2.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 50px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #222;\\\\n}\\\\n.light h2.dark, .dark h2, .light .dark h2, h2.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 50px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark h3.light, .light h3, .dark .light h3, h3.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 35px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #444;\\\\n}\\\\n.light h3.dark, .dark h3, .light .dark h3, h3.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 35px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark h4.light, .light h4, .dark .light h4, h4.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 18px;\\\\n\\\\tfont-weight: 400;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #555;\\\\n}\\\\n.light h4.dark, .dark h4, .light .dark h4, h4.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 18px;\\\\n\\\\tfont-weight: 400;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark a.light:not(.btn), .light a:not(.btn), .dark .light a:not(.btn), a.light:not(.btn) {\\\\n}\\\\n.light a.dark:not(.btn), .dark a:not(.btn), .light .dark a:not(.btn), a.dark:not(.btn) {\\\\n}\\\\n.dark a.light:not(.btn):hover, .light a:not(.btn):hover, .dark .light a:not(.btn):hover, a.light:not(.btn):hover {\\\\n\\\\tcolor: #000000;\\\\n\\\\ttext-decoration: underline;\\\\n}\\\\n.light a.dark:not(.btn):hover, .dark a:not(.btn):hover, .light .dark a:not(.btn):hover, a.dark:not(.btn):hover {\\\\n\\\\tcolor: #fff;\\\\n\\\\ttext-decoration: underline;\\\\n}\\\\n.dark .navbar-nav.light a, .light .navbar-nav a, .dark .light .navbar-nav a, .navbar-nav.light a {\\\\n\\\\tcolor: #777;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.light .navbar-nav.dark a, .dark .navbar-nav a, .light .dark .navbar-nav a, .navbar-nav.dark a {\\\\n\\\\tcolor: #aaa;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.dark .navbar-nav.light a.nav-link:hover, .light .navbar-nav a.nav-link:hover, .dark .light .navbar-nav a.nav-link:hover, .navbar-nav.light a.nav-link:hover, .dark .navbar-nav.light .nav-item:hover > a.nav-link, .light .navbar-nav .nav-item:hover > a.nav-link, .dark .light .navbar-nav .nav-item:hover > a.nav-link, .navbar-nav.light .nav-item:hover > a.nav-link, .dark .navbar-nav.light a.nav-link.active, .light .navbar-nav a.nav-link.active, .dark .light .navbar-nav a.nav-link.active, .navbar-nav.light a.nav-link.active {\\\\n\\\\tcolor: #222;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.light .navbar-nav.dark a.nav-link:hover, .dark .navbar-nav a.nav-link:hover, .light .dark .navbar-nav a.nav-link:hover, .navbar-nav.dark a.nav-link:hover, .light .navbar-nav.dark .nav-item:hover > a.nav-link, .dark .navbar-nav .nav-item:hover > a.nav-link, .light .dark .navbar-nav .nav-item:hover > a.nav-link, .navbar-nav.dark .nav-item:hover > a.nav-link, .light .navbar-nav.dark a.nav-link.active, .dark .navbar-nav a.nav-link.active, .light .dark .navbar-nav a.nav-link.active, .navbar-nav.dark a.nav-link.active {\\\\n\\\\tcolor: #fff;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.dark .nav-tabs.light a.nav-link, .light .nav-tabs a.nav-link, .dark .light .nav-tabs a.nav-link, .nav-tabs.light a.nav-link {\\\\n\\\\tcolor: #A2AAB1;\\\\n}\\\\n.light .nav-tabs.dark a.nav-link, .dark .nav-tabs a.nav-link, .light .dark .nav-tabs a.nav-link, .nav-tabs.dark a.nav-link {\\\\n\\\\tcolor: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .nav-tabs.light, .light .nav-tabs, .dark .light .nav-tabs, .nav-tabs.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .nav-tabs.dark, .dark .nav-tabs, .light .dark .nav-tabs, .nav-tabs.dark {\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .nav-tabs.light a.nav-link:hover, .light .nav-tabs a.nav-link:hover, .dark .light .nav-tabs a.nav-link:hover, .nav-tabs.light a.nav-link:hover, .dark .nav-tabs.light a.nav-link.active, .light .nav-tabs a.nav-link.active, .dark .light .nav-tabs a.nav-link.active, .nav-tabs.light a.nav-link.active {\\\\n\\\\tcolor: #444;\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.light .nav-tabs.dark a.nav-link:hover, .dark .nav-tabs a.nav-link:hover, .light .dark .nav-tabs a.nav-link:hover, .nav-tabs.dark a.nav-link:hover, .light .nav-tabs.dark a.nav-link.active, .dark .nav-tabs a.nav-link.active, .light .dark .nav-tabs a.nav-link.active, .nav-tabs.dark a.nav-link.active {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tborder-color: #FFF;\\\\n}\\\\n.dark .pagination.light .page-link, .light .pagination .page-link, .dark .light .pagination .page-link, .pagination.light .page-link {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .pagination.dark .page-link, .dark .pagination .page-link, .light .dark .pagination .page-link, .pagination.dark .page-link {\\\\n\\\\tborder-color: #555;\\\\n}\\\\n.dark .pagination.light .page-link:hover, .light .pagination .page-link:hover, .dark .light .pagination .page-link:hover, .pagination.light .page-link:hover, .dark .pagination.light .page-link.active, .light .pagination .page-link.active, .dark .light .pagination .page-link.active, .pagination.light .page-link.active {\\\\n\\\\tborder-color: #D1D7DD;\\\\n\\\\tbackground-color: #D1D7DD;\\\\n}\\\\n.light .pagination.dark .page-link:hover, .dark .pagination .page-link:hover, .light .dark .pagination .page-link:hover, .pagination.dark .page-link:hover, .light .pagination.dark .page-link.active, .dark .pagination .page-link.active, .light .dark .pagination .page-link.active, .pagination.dark .page-link.active {\\\\n\\\\tborder-color: #555;\\\\n\\\\tbackground-color: #555;\\\\n}\\\\n.dark .btn.light, .light .btn, .dark .light .btn, .btn.light {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 2px 2px 2px 2px;\\\\n}\\\\n.light .btn.dark, .dark .btn, .light .dark .btn, .btn.dark {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 2px 2px 2px 2px;\\\\n}\\\\n.dark .btn-primary.light, .light .btn-primary, .dark .light .btn-primary, .btn-primary.light, .dark .badge-primary.light, .light .badge-primary, .dark .light .badge-primary, .badge-primary.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #AF9F8C;\\\\n}\\\\n.light .btn-primary.dark, .dark .btn-primary, .light .dark .btn-primary, .btn-primary.dark, .light .badge-primary.dark, .dark .badge-primary, .light .dark .badge-primary, .badge-primary.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #AF9F8C;\\\\n}\\\\n.dark .btn-primary.light:hover, .light .btn-primary:hover, .dark .light .btn-primary:hover, .btn-primary.light:hover, .dark .btn-primary.light:active, .light .btn-primary:active, .dark .light .btn-primary:active, .btn-primary.light:active, .dark .btn-primary.active.light, .light .btn-primary.active, .dark .light .btn-primary.active, .btn-primary.active.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #998B7A;\\\\n}\\\\n.light .btn-primary.dark:hover, .dark .btn-primary:hover, .light .dark .btn-primary:hover, .btn-primary.dark:hover, .light .btn-primary.dark:active, .dark .btn-primary:active, .light .dark .btn-primary:active, .btn-primary.dark:active, .light .btn-primary.active.dark, .dark .btn-primary.active, .light .dark .btn-primary.active, .btn-primary.active.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #998B7A;\\\\n}\\\\n.dark .btn-outline-primary.light, .light .btn-outline-primary, .dark .light .btn-outline-primary, .btn-outline-primary.light {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.light .btn-outline-primary.dark, .dark .btn-outline-primary, .light .dark .btn-outline-primary, .btn-outline-primary.dark {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.dark .btn-outline-primary.light:hover, .light .btn-outline-primary:hover, .dark .light .btn-outline-primary:hover, .btn-outline-primary.light:hover, .dark .btn-outline-primary.light:active, .light .btn-outline-primary:active, .dark .light .btn-outline-primary:active, .btn-outline-primary.light:active, .dark .btn-outline-primary.active.light, .light .btn-outline-primary.active, .dark .light .btn-outline-primary.active, .btn-outline-primary.active.light {\\\\n\\\\tcolor: #998B7A;\\\\n}\\\\n.light .btn-outline-primary.dark:hover, .dark .btn-outline-primary:hover, .light .dark .btn-outline-primary:hover, .btn-outline-primary.dark:hover, .light .btn-outline-primary.dark:active, .dark .btn-outline-primary:active, .light .dark .btn-outline-primary:active, .btn-outline-primary.dark:active, .light .btn-outline-primary.active.dark, .dark .btn-outline-primary.active, .light .dark .btn-outline-primary.active, .btn-outline-primary.active.dark {\\\\n\\\\tcolor: #998B7A;\\\\n}\\\\n.dark .btn-primary.light, .light .btn-primary, .dark .light .btn-primary, .btn-primary.light, .dark .btn-outline-primary.light, .light .btn-outline-primary, .dark .light .btn-outline-primary, .btn-outline-primary.light {\\\\n\\\\tborder-color: #AF9F8C;\\\\n}\\\\n.light .btn-primary.dark, .dark .btn-primary, .light .dark .btn-primary, .btn-primary.dark, .light .btn-outline-primary.dark, .dark .btn-outline-primary, .light .dark .btn-outline-primary, .btn-outline-primary.dark {\\\\n\\\\tborder-color: #AF9F8C;\\\\n}\\\\n.dark .btn-primary.light:hover, .light .btn-primary:hover, .dark .light .btn-primary:hover, .btn-primary.light:hover, .dark .btn-primary.light:active, .light .btn-primary:active, .dark .light .btn-primary:active, .btn-primary.light:active, .dark .btn-primary.active.light, .light .btn-primary.active, .dark .light .btn-primary.active, .btn-primary.active.light, .dark .btn-outline-primary.light:hover, .light .btn-outline-primary:hover, .dark .light .btn-outline-primary:hover, .btn-outline-primary.light:hover, .dark .btn-outline-primary.light:active, .light .btn-outline-primary:active, .dark .light .btn-outline-primary:active, .btn-outline-primary.light:active, .dark .btn-outline-primary.active.light, .light .btn-outline-primary.active, .dark .light .btn-outline-primary.active, .btn-outline-primary.active.light {\\\\n\\\\tborder-color: #998B7A;\\\\n}\\\\n.light .btn-primary.dark:hover, .dark .btn-primary:hover, .light .dark .btn-primary:hover, .btn-primary.dark:hover, .light .btn-primary.dark:active, .dark .btn-primary:active, .light .dark .btn-primary:active, .btn-primary.dark:active, .light .btn-primary.active.dark, .dark .btn-primary.active, .light .dark .btn-primary.active, .btn-primary.active.dark, .light .btn-outline-primary.dark:hover, .dark .btn-outline-primary:hover, .light .dark .btn-outline-primary:hover, .btn-outline-primary.dark:hover, .light .btn-outline-primary.dark:active, .dark .btn-outline-primary:active, .light .dark .btn-outline-primary:active, .btn-outline-primary.dark:active, .light .btn-outline-primary.active.dark, .dark .btn-outline-primary.active, .light .dark .btn-outline-primary.active, .btn-outline-primary.active.dark {\\\\n\\\\tborder-color: #998B7A;\\\\n}\\\\n.dark .btn-secondary.light, .light .btn-secondary, .dark .light .btn-secondary, .btn-secondary.light, .dark .badge-secondary.light, .light .badge-secondary, .dark .light .badge-secondary, .badge-secondary.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #A2AAB1;\\\\n}\\\\n.light .btn-secondary.dark, .dark .btn-secondary, .light .dark .btn-secondary, .btn-secondary.dark, .light .badge-secondary.dark, .dark .badge-secondary, .light .dark .badge-secondary, .badge-secondary.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #444;\\\\n}\\\\n.dark .btn-secondary.light:hover, .light .btn-secondary:hover, .dark .light .btn-secondary:hover, .btn-secondary.light:hover, .dark .btn-secondary.light:active, .light .btn-secondary:active, .dark .light .btn-secondary:active, .btn-secondary.light:active, .dark .btn-secondary.active.light, .light .btn-secondary.active, .dark .light .btn-secondary.active, .btn-secondary.active.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #91989F;\\\\n}\\\\n.light .btn-secondary.dark:hover, .dark .btn-secondary:hover, .light .dark .btn-secondary:hover, .btn-secondary.dark:hover, .light .btn-secondary.dark:active, .dark .btn-secondary:active, .light .dark .btn-secondary:active, .btn-secondary.dark:active, .light .btn-secondary.active.dark, .dark .btn-secondary.active, .light .dark .btn-secondary.active, .btn-secondary.active.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #555;\\\\n}\\\\n.dark .btn-outline-secondary.light, .light .btn-outline-secondary, .dark .light .btn-outline-secondary, .btn-outline-secondary.light {\\\\n\\\\tcolor: #A2AAB1;\\\\n}\\\\n.light .btn-outline-secondary.dark, .dark .btn-outline-secondary, .light .dark .btn-outline-secondary, .btn-outline-secondary.dark {\\\\n\\\\tcolor: #888;\\\\n}\\\\n.dark .btn-outline-secondary.light:hover, .light .btn-outline-secondary:hover, .dark .light .btn-outline-secondary:hover, .btn-outline-secondary.light:hover, .dark .btn-outline-secondary.light:active, .light .btn-outline-secondary:active, .dark .light .btn-outline-secondary:active, .btn-outline-secondary.light:active, .dark .btn-outline-secondary.active.light, .light .btn-outline-secondary.active, .dark .light .btn-outline-secondary.active, .btn-outline-secondary.active.light {\\\\n\\\\tcolor: #91989F;\\\\n}\\\\n.light .btn-outline-secondary.dark:hover, .dark .btn-outline-secondary:hover, .light .dark .btn-outline-secondary:hover, .btn-outline-secondary.dark:hover, .light .btn-outline-secondary.dark:active, .dark .btn-outline-secondary:active, .light .dark .btn-outline-secondary:active, .btn-outline-secondary.dark:active, .light .btn-outline-secondary.active.dark, .dark .btn-outline-secondary.active, .light .dark .btn-outline-secondary.active, .btn-outline-secondary.active.dark {\\\\n\\\\tcolor: #888;\\\\n}\\\\n.dark .btn-secondary.light, .light .btn-secondary, .dark .light .btn-secondary, .btn-secondary.light, .dark .btn-outline-secondary.light, .light .btn-outline-secondary, .dark .light .btn-outline-secondary, .btn-outline-secondary.light {\\\\n\\\\tborder-color: #A2AAB1;\\\\n}\\\\n.light .btn-secondary.dark, .dark .btn-secondary, .light .dark .btn-secondary, .btn-secondary.dark, .light .btn-outline-secondary.dark, .dark .btn-outline-secondary, .light .dark .btn-outline-secondary, .btn-outline-secondary.dark {\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.dark .btn-secondary.light:hover, .light .btn-secondary:hover, .dark .light .btn-secondary:hover, .btn-secondary.light:hover, .dark .btn-secondary.light:active, .light .btn-secondary:active, .dark .light .btn-secondary:active, .btn-secondary.light:active, .dark .btn-secondary.active.light, .light .btn-secondary.active, .dark .light .btn-secondary.active, .btn-secondary.active.light, .dark .btn-outline-secondary.light:hover, .light .btn-outline-secondary:hover, .dark .light .btn-outline-secondary:hover, .btn-outline-secondary.light:hover, .dark .btn-outline-secondary.light:active, .light .btn-outline-secondary:active, .dark .light .btn-outline-secondary:active, .btn-outline-secondary.light:active, .dark .btn-outline-secondary.active.light, .light .btn-outline-secondary.active, .dark .light .btn-outline-secondary.active, .btn-outline-secondary.active.light {\\\\n\\\\tborder-color: #91989F;\\\\n}\\\\n.light .btn-secondary.dark:hover, .dark .btn-secondary:hover, .light .dark .btn-secondary:hover, .btn-secondary.dark:hover, .light .btn-secondary.dark:active, .dark .btn-secondary:active, .light .dark .btn-secondary:active, .btn-secondary.dark:active, .light .btn-secondary.active.dark, .dark .btn-secondary.active, .light .dark .btn-secondary.active, .btn-secondary.active.dark, .light .btn-outline-secondary.dark:hover, .dark .btn-outline-secondary:hover, .light .dark .btn-outline-secondary:hover, .btn-outline-secondary.dark:hover, .light .btn-outline-secondary.dark:active, .dark .btn-outline-secondary:active, .light .dark .btn-outline-secondary:active, .btn-outline-secondary.dark:active, .light .btn-outline-secondary.active.dark, .dark .btn-outline-secondary.active, .light .dark .btn-outline-secondary.active, .btn-outline-secondary.active.dark {\\\\n\\\\tborder-color: #555;\\\\n}\\\\n.dark .form-group.light, .light .form-group, .dark .light .form-group, .form-group.light {\\\\n}\\\\n.light .form-group.dark, .dark .form-group, .light .dark .form-group, .form-group.dark {\\\\n}\\\\n.dark .form-control.light, .light .form-control, .dark .light .form-control, .form-control.light, .dark .form-inline>.btn-link.light, .light .form-inline>.btn-link, .dark .light .form-inline>.btn-link, .form-inline>.btn-link.light {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 0px 0px 1px 0px;\\\\n\\\\tborder-color: rgba(0,0,0,0.2);\\\\n}\\\\n.light .form-control.dark, .dark .form-control, .light .dark .form-control, .form-control.dark, .light .form-inline>.btn-link.dark, .dark .form-inline>.btn-link, .light .dark .form-inline>.btn-link, .form-inline>.btn-link.dark {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 0px 0px 1px 0px;\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .form-control.light::placeholder, .light .form-control::placeholder, .dark .light .form-control::placeholder, .form-control.light::placeholder, .dark .form-control.light .placeholder, .light .form-control .placeholder, .dark .light .form-control .placeholder, .form-control.light .placeholder {\\\\n\\\\tcolor: #aaa;\\\\n}\\\\n.light .form-control.dark::placeholder, .dark .form-control::placeholder, .light .dark .form-control::placeholder, .form-control.dark::placeholder, .light .form-control.dark .placeholder, .dark .form-control .placeholder, .light .dark .form-control .placeholder, .form-control.dark .placeholder {\\\\n\\\\tcolor: #aaa;\\\\n}\\\\n.dark input[type=checkbox]+.lbl.light::after, .light input[type=checkbox]+.lbl::after, .dark .light input[type=checkbox]+.lbl::after, input[type=checkbox]+.lbl.light::after, .dark input[type=radio]+.lbl.light::after, .light input[type=radio]+.lbl::after, .dark .light input[type=radio]+.lbl::after, input[type=radio]+.lbl.light::after {\\\\n\\\\tbackground-color: #A48F77;\\\\n}\\\\n.light input[type=checkbox]+.lbl.dark::after, .dark input[type=checkbox]+.lbl::after, .light .dark input[type=checkbox]+.lbl::after, input[type=checkbox]+.lbl.dark::after, .light input[type=radio]+.lbl.dark::after, .dark input[type=radio]+.lbl::after, .light .dark input[type=radio]+.lbl::after, input[type=radio]+.lbl.dark::after {\\\\n\\\\tbackground-color: #A48F77;\\\\n}\\\\n.dark svg.svg-default.light, .light svg.svg-default, .dark .light svg.svg-default, svg.svg-default.light {\\\\n\\\\tfill: #555;\\\\n}\\\\n.light svg.svg-default.dark, .dark svg.svg-default, .light .dark svg.svg-default, svg.svg-default.dark {\\\\n\\\\tfill: #fff;\\\\n}\\\\n.dark svg.svg-primary.light, .light svg.svg-primary, .dark .light svg.svg-primary, svg.svg-primary.light {\\\\n\\\\tfill: #c3b6a5;\\\\n}\\\\n.light svg.svg-primary.dark, .dark svg.svg-primary, .light .dark svg.svg-primary, svg.svg-primary.dark {\\\\n\\\\tfill: #c3b6a5;\\\\n}\\\\n.dark svg.svg-secondary.light, .light svg.svg-secondary, .dark .light svg.svg-secondary, svg.svg-secondary.light {\\\\n\\\\tfill: #bbc3cc;\\\\n}\\\\n.light svg.svg-secondary.dark, .dark svg.svg-secondary, .light .dark svg.svg-secondary, svg.svg-secondary.dark {\\\\n\\\\tfill: #555;\\\\n}\\\\n.dark .gallery-item.light:not(.masonry-item), .light .gallery-item:not(.masonry-item), .dark .light .gallery-item:not(.masonry-item), .gallery-item.light:not(.masonry-item), .dark .masonry-item.gallery-item.light .wrapper, .light .masonry-item.gallery-item .wrapper, .dark .light .masonry-item.gallery-item .wrapper, .masonry-item.gallery-item.light .wrapper {\\\\n\\\\tbackground-color: #ffffff;\\\\n}\\\\n.light .gallery-item.dark:not(.masonry-item), .dark .gallery-item:not(.masonry-item), .light .dark .gallery-item:not(.masonry-item), .gallery-item.dark:not(.masonry-item), .light .masonry-item.gallery-item.dark .wrapper, .dark .masonry-item.gallery-item .wrapper, .light .dark .masonry-item.gallery-item .wrapper, .masonry-item.gallery-item.dark .wrapper {\\\\n\\\\tbackground-color: #232122;\\\\n}\\\\n.dark .owl-prev.light, .light .owl-prev, .dark .light .owl-prev, .owl-prev.light, .dark .owl-next.light, .light .owl-next, .dark .light .owl-next, .owl-next.light {\\\\n\\\\tborder-color: #444;\\\\n\\\\tbackground-color: #fff;\\\\n}\\\\n.light .owl-prev.dark, .dark .owl-prev, .light .dark .owl-prev, .owl-prev.dark, .light .owl-next.dark, .dark .owl-next, .light .dark .owl-next, .owl-next.dark {\\\\n\\\\tborder-color: #fff;\\\\n\\\\tbackground-color: #444;\\\\n}\\\\n.dark .owl-prev.light:hover, .light .owl-prev:hover, .dark .light .owl-prev:hover, .owl-prev.light:hover, .dark .owl-next.light:hover, .light .owl-next:hover, .dark .light .owl-next:hover, .owl-next.light:hover {\\\\n\\\\tborder-color: #444;\\\\n\\\\tbackground-color: #ded8d0;\\\\n}\\\\n.light .owl-prev.dark:hover, .dark .owl-prev:hover, .light .dark .owl-prev:hover, .owl-prev.dark:hover, .light .owl-next.dark:hover, .dark .owl-next:hover, .light .dark .owl-next:hover, .owl-next.dark:hover {\\\\n\\\\tborder-color: #fff;\\\\n\\\\tbackground-color: #af9f8c;\\\\n}\\\\n.dark .owl-dot>span.light, .light .owl-dot>span, .dark .light .owl-dot>span, .owl-dot>span.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .owl-dot>span.dark, .dark .owl-dot>span, .light .dark .owl-dot>span, .owl-dot>span.dark {\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.dark .owl-dot.active>span.light, .light .owl-dot.active>span, .dark .light .owl-dot.active>span, .owl-dot.active>span.light, .dark .owl-dot.light:hover>span, .light .owl-dot:hover>span, .dark .light .owl-dot:hover>span, .owl-dot.light:hover>span {\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.light .owl-dot.active>span.dark, .dark .owl-dot.active>span, .light .dark .owl-dot.active>span, .owl-dot.active>span.dark, .light .owl-dot.dark:hover>span, .dark .owl-dot:hover>span, .light .dark .owl-dot:hover>span, .owl-dot.dark:hover>span {\\\\n\\\\tborder-color: #fff;\\\\n}\\\\n.dark [class*=border].light, .light [class*=border], .dark .light [class*=border], [class*=border].light, .dark hr.light, .light hr, .dark .light hr, hr.light, .dark .separate-list.light li, .light .separate-list li, .dark .light .separate-list li, .separate-list.light li, .dark .media.light, .light .media, .dark .light .media, .media.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light [class*=border].dark, .dark [class*=border], .light .dark [class*=border], [class*=border].dark, .light hr.dark, .dark hr, .light .dark hr, hr.dark, .light .separate-list.dark li, .dark .separate-list li, .light .dark .separate-list li, .separate-list.dark li, .light .media.dark, .dark .media, .light .dark .media, .media.dark {\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.light-page #preloader>div, .light-page #preloader>div>*, .light-page #preloader>div::before, .light-page #preloader>div::after {\\\\n\\\\tborder-color: #DDD;\\\\n\\\\tbackground-color: #DDD;\\\\n}\\\\n.dark-page #preloader>div, .dark-page #preloader>div>*, .dark-page #preloader>div::before, .dark-page #preloader>div::after {\\\\n\\\\tborder-color: #888;\\\\n\\\\tbackground-color: #888;\\\\n}\\\\n.dark .border-x2.light, .light .border-x2, .dark .light .border-x2, .border-x2.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .border-x2.dark, .dark .border-x2, .light .dark .border-x2, .border-x2.dark {\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .text-primary.light, .light .text-primary, .dark .light .text-primary, .text-primary.light {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.light .text-primary.dark, .dark .text-primary, .light .dark .text-primary, .text-primary.dark {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.dark .text-secondary.light, .light .text-secondary, .dark .light .text-secondary, .text-secondary.light, .dark .breadcrumb-item.light + .breadcrumb-item::before, .light .breadcrumb-item + .breadcrumb-item::before, .dark .light .breadcrumb-item + .breadcrumb-item::before, .breadcrumb-item.light + .breadcrumb-item::before, .dark .breadcrumb-item.active.light, .light .breadcrumb-item.active, .dark .light .breadcrumb-item.active, .breadcrumb-item.active.light {\\\\n\\\\tcolor: #A2AAB1;\\\\n}\\\\n.light .text-secondary.dark, .dark .text-secondary, .light .dark .text-secondary, .text-secondary.dark, .light .breadcrumb-item.dark + .breadcrumb-item::before, .dark .breadcrumb-item + .breadcrumb-item::before, .light .dark .breadcrumb-item + .breadcrumb-item::before, .breadcrumb-item.dark + .breadcrumb-item::before, .light .breadcrumb-item.active.dark, .dark .breadcrumb-item.active, .light .dark .breadcrumb-item.active, .breadcrumb-item.active.dark {\\\\n\\\\tcolor: rgba(255,255,255,0.5);\\\\n}\\\\n/* end default */\\\\n@media all and (max-width: 1279px) {\\\\n\\\\t.dark h1.light, .light h1, .dark .light h1, h1.light {\\\\n\\\\tfont-size: 70px;\\\\n\\\\t}\\\\n\\\\t.light h1.dark, .dark h1, .light .dark h1, h1.dark {\\\\n\\\\tfont-size: 70px;\\\\n\\\\t}\\\\n\\\\t.dark h2.light, .light h2, .dark .light h2, h2.light {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n\\\\t.light h2.dark, .dark h2, .light .dark h2, h2.dark {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n}\\\\n@media all and (max-width: 576px) {\\\\n\\\\t.dark h1.light, .light h1, .dark .light h1, h1.light {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n\\\\t.light h1.dark, .dark h1, .light .dark h1, h1.dark {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n\\\\t.dark h2.light, .light h2, .dark .light h2, h2.light {\\\\n\\\\tfont-size: 30px;\\\\n\\\\t}\\\\n\\\\t.light h2.dark, .dark h2, .light .dark h2, h2.dark {\\\\n\\\\tfont-size: 30px;\\\\n\\\\t}\\\\n\\\\t.dark h3.light, .light h3, .dark .light h3, h3.light {\\\\n\\\\tfont-size: 25px;\\\\n\\\\t}\\\\n\\\\t.light h3.dark, .dark h3, .light .dark h3, h3.dark {\\\\n\\\\tfont-size: 25px;\\\\n\\\\t}\\\\n}\\\\n</style>\\\\n  <ul class=\\\\\\\"index light-page blr-active-page edit-sections page-mode-project-pages\\\\\\\" data-id=\\\\\\\"0\\\\\\\" data-name=\\\\\\\"index\\\\\\\"><li class=\\\\\\\"section-item\\\\\\\" data-name=\\\\\\\"desc-img-text-9\\\\\\\" data-group=\\\\\\\"descriptions\\\\\\\" data-img=\\\\\\\"sections/descriptions/desc-img-text-9/desc-img-text-9.jpg\\\\\\\"><section id=\\\\\\\"desc-img-text-9\\\\\\\" class=\\\\\\\"pt-75 pb-75 pt-md-100 pb-md-100 dark\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n            <div class=\\\\\\\"col-md-6 col-lg-5 order-md-2\\\\\\\">\\\\n                <h3><strong>Feature description</strong></h3>\\\\n                <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"20\\\\\\\" viewBox=\\\\\\\"0 0 100 20\\\\\\\" width=\\\\\\\"100\\\\\\\" class=\\\\\\\"mb-30 svg-secondary\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-2.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\"><path d=\\\\\\\"m0 9h100v2h-100z\\\\\\\" fill-rule=\\\\\\\"evenodd\\\\\\\"></path></svg>\\\\n                <p class=\\\\\\\"mb-30\\\\\\\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique.</p>\\\\n                <ul class=\\\\\\\"list-unstyled padding-x2-list separate-list mb-50\\\\\\\">\\\\n                    <li><svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"16\\\\\\\" viewBox=\\\\\\\"0 0 16 16\\\\\\\" width=\\\\\\\"16\\\\\\\" class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\"><path d=\\\\\\\"m8 16c-4.418278 0-8-3.581722-8-8s3.581722-8 8-8 8 3.581722 8 8-3.581722 8-8 8zm-1-9v6h2v-6zm0-4v2h2v-2z\\\\\\\"></path></svg>List item description</li>\\\\n                    <li><svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"16\\\\\\\" viewBox=\\\\\\\"0 0 16 16\\\\\\\" width=\\\\\\\"16\\\\\\\" class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\"><path d=\\\\\\\"m8 16c-4.418278 0-8-3.581722-8-8s3.581722-8 8-8 8 3.581722 8 8-3.581722 8-8 8zm-1-9v6h2v-6zm0-4v2h2v-2z\\\\\\\"></path></svg>List item description</li>\\\\n                    <li><svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"16\\\\\\\" viewBox=\\\\\\\"0 0 16 16\\\\\\\" width=\\\\\\\"16\\\\\\\" class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\"><path d=\\\\\\\"m8 16c-4.418278 0-8-3.581722-8-8s3.581722-8 8-8 8 3.581722 8 8-3.581722 8-8 8zm-1-9v6h2v-6zm0-4v2h2v-2z\\\\\\\"></path></svg>List item description</li>\\\\n                    <li><svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"16\\\\\\\" viewBox=\\\\\\\"0 0 16 16\\\\\\\" width=\\\\\\\"16\\\\\\\" class=\\\\\\\"icon svg-default icon-pos-left\\\\\\\" src=\\\\\\\"images/gallery/icons/info-circle.svg\\\\\\\" alt=\\\\\\\"\\\\\\\"><path d=\\\\\\\"m8 16c-4.418278 0-8-3.581722-8-8s3.581722-8 8-8 8 3.581722 8 8-3.581722 8-8 8zm-1-9v6h2v-6zm0-4v2h2v-2z\\\\\\\"></path></svg>List item description</li>\\\\n                </ul>\\\\n                <a class=\\\\\\\"btn btn-secondary\\\\\\\" href=\\\\\\\"#\\\\\\\" style=\\\\\\\"\\\\\\\"><span class=\\\\\\\"spr-option-textedit-link\\\\\\\" style=\\\\\\\"\\\\\\\">Details</span></a>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-md-6 mr-auto order-md-1 text-center\\\\\\\">\\\\n                <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                    <img class=\\\\\\\"mw-100 shadow mt-50 mt-lg-0\\\\\\\" src=\\\\\\\"images/gallery/item-arch-1.jpg\\\\\\\" alt=\\\\\\\"image\\\\\\\">\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n<style>#desc-img-text-9 .bg {\\\\n    background-image: url(\'images/gallery/item-grid-horizontal-3.jpg\');\\\\n    background-repeat: no-repeat;\\\\n    background-position: center center;\\\\n    background-size: cover;\\\\n    opacity:0.15;\\\\n}</style><script type=\\\\\\\"text/javascript\\\\\\\">\\\\n</script></li><li class=\\\\\\\"section-item\\\\\\\" data-name=\\\\\\\"benefits-4col-7\\\\\\\" data-group=\\\\\\\"benefits\\\\\\\" data-img=\\\\\\\"sections/benefits/benefits-4col-7/benefits-4col-7.jpg\\\\\\\"><section id=\\\\\\\"benefits-4col-7\\\\\\\" class=\\\\\\\"pb-50 pt-100 light\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row\\\\\\\">\\\\n            <div class=\\\\\\\"col-lg-12\\\\\\\">\\\\n                <h3><strong>Benefits</strong></h3>\\\\n                <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"20\\\\\\\" viewBox=\\\\\\\"0 0 40 20\\\\\\\" width=\\\\\\\"40\\\\\\\" class=\\\\\\\"svg-secondary mb-50\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-1.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\"><path d=\\\\\\\"m0 8h40v4h-40z\\\\\\\" fill-rule=\\\\\\\"evenodd\\\\\\\"></path></svg>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_elaboration_mail_heart.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m54 0h-44v21.142l-10 4.193v38.665h64v-38.665l-10-4.193zm-2 2v29.716l-20 12.537-20-12.537v-29.716zm-42 28.462-6.835-4.285 6.835-2.866zm-8 31.538v-34.193l30 18.807 30-18.807v34.193zm58.835-35.823-6.835 4.285v-7.151z\\\\\\\"></path><path d=\\\\\\\"m31.529 31.882.471.251.471-.251c.429-.229 10.529-5.698 10.529-12.882 0-3.42-2.579-6-6-6-2.085 0-3.924 1.068-5 2.687-1.076-1.619-2.915-2.687-5-2.687-3.421 0-6 2.58-6 6 0 7.184 10.1 12.653 10.529 12.882zm-4.529-16.882c2.206 0 4 1.794 4 4h2c0-2.206 1.794-4 4-4 2.317 0 4 1.682 4 4 0 5.203-7.086 9.724-9 10.85-1.914-1.126-9-5.647-9-10.85 0-2.318 1.683-4 4-4z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/weather_fog_fullmoon.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m5.383 33.022c-.243.949-.383 1.945-.383 2.978 0 5.794 4.206 10 10 10v-2c-4.71 0-8-3.29-8-8 0-4.962 3.589-9 8-9h2.829l.153-.815c1.546-8.22 9.123-14.185 18.018-14.185 10.477 0 19 7.626 19 17v1h1c3.536 0 6 4.216 6 8 0 3.645-2.355 6-6 6v2c4.71 0 8-3.29 8-8 0-4.493-2.783-9.282-7.024-9.927-.537-10.048-9.74-18.073-20.976-18.073-4.097 0-7.938 1.156-11.156 3.157-2.647-3.251-6.59-5.157-10.844-5.157-7.72 0-14 6.28-14 14 0 2.682.761 5.288 2.201 7.538.85 1.327 1.939 2.509 3.182 3.484zm8.617-23.022c3.591 0 6.929 1.581 9.197 4.291-3.457 2.653-5.989 6.375-7.008 10.709h-1.189c-3.88 0-7.242 2.448-8.9 6.009-.849-.747-1.606-1.601-2.214-2.549-1.234-1.927-1.886-4.161-1.886-6.46 0-6.617 5.383-12 12-12z\\\\\\\"></path><path d=\\\\\\\"m17 44h37v2h-37z\\\\\\\"></path><path d=\\\\\\\"m17 50h37v2h-37z\\\\\\\"></path><path d=\\\\\\\"m17 56h37v2h-37z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_globe.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m58 28c0 13.851-12.149 26-26 26-9.265 0-12.178-3.573-12.2-3.6l-1.6 1.2c.13.174 3.223 4.11 12.8 4.375v6.025h-9v2h9 2 9v-2h-9v-6.027c14.495-.569 27-13.392 27-27.973 0-14.916-13.084-28-28-28v2c13.851 0 26 12.149 26 26z\\\\\\\"></path><path d=\\\\\\\"m32 49c11.58 0 21-9.42 21-21s-9.42-21-21-21-21 9.42-21 21 9.42 21 21 21zm0-40c10.477 0 19 8.523 19 19s-8.523 19-19 19-19-8.523-19-19 8.523-19 19-19z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_elaboration_browser_check.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m0 58h64v-52h-64zm2-2v-40h60v40zm60-48v6h-60v-6z\\\\\\\"></path><path d=\\\\\\\"m6 10h4v2h-4z\\\\\\\"></path><path d=\\\\\\\"m14 10h4v2h-4z\\\\\\\"></path><path d=\\\\\\\"m22 10h4v2h-4z\\\\\\\"></path><path d=\\\\\\\"m30 40.586-6.293-6.293-1.414 1.561 7 7.146h1.414l13-13.146-1.414-1.488z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n<style>#benefits-4col-7 .bg-wrap {\\\\n    background-color: #F4F5F6;\\\\n}\\\\n\\\\n\\\\n#benefits-4col-7 .bg {\\\\n    background-image: url(\'images/gallery/bg-pattern-3.png\');\\\\n    background-repeat: repeat;\\\\n    background-position: center;\\\\n    background-size: 50px 50px;\\\\n    opacity:0.075;\\\\n}\\\\n</style><script type=\\\\\\\"text/javascript\\\\\\\">\\\\n</script></li></ul>\\\"\",\"modalContainer\":\"\\\"\\\"\",\"modalFormContainer\":\"\\\"\\\"\",\"forms\":\"{}\",\"video_bg\":\"false\",\"gallery\":\"false\",\"form_section\":\"false\",\"smooth\":\"false\",\"parallax\":\"false\",\"datepicker\":\"false\",\"filefield\":\"false\",\"countup\":\"false\",\"countdown\":\"false\",\"gMaps\":\"[]\",\"plugins\":\"[]\",\"optionsStyle\":\"{\\\"mediaResolution\\\":{\\\"mobile\\\":\\\"max-width: 576px\\\",\\\"tablet\\\":\\\"max-width: 1279px\\\",\\\"desktop\\\":\\\"min-width: 1280px\\\"},\\\"sections\\\":[\\\"section\\\",\\\"footer\\\",\\\"header\\\",\\\"nav\\\",\\\".modal\\\"],\\\"defaultActiveMedia\\\":\\\"default\\\",\\\"defaultActiveMode\\\":\\\"light\\\",\\\"defaultPropertiesForTags\\\":[{\\\"name\\\":\\\"Body\\\",\\\"tag\\\":\\\" \\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'OpenSans\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'OpenSans\'\\\"}}},\\\"tag\\\":\\\" \\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"14px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"14px\\\"}}},\\\"tag\\\":\\\" \\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"1.5\\\"},\\\"dark\\\":{\\\"value\\\":\\\"1.5\\\"}}},\\\"tag\\\":\\\" \\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#555\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#ffffff\\\"}}},\\\"tag\\\":\\\" \\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Body\\\",\\\"tag\\\":\\\"body\\\",\\\"elements\\\":[{\\\"name\\\":\\\"Padding\\\",\\\"title\\\":\\\"Padding\\\",\\\"property\\\":\\\"padding\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"body\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundImage\\\",\\\"title\\\":\\\"Background image\\\",\\\"property\\\":\\\"background-image\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"body\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundPosition\\\",\\\"title\\\":\\\"Background position\\\",\\\"property\\\":\\\"background-position\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"body\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundRepeat\\\",\\\"title\\\":\\\"Background repeat\\\",\\\"property\\\":\\\"background-repeat\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"body\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundSize\\\",\\\"title\\\":\\\"Background size\\\",\\\"property\\\":\\\"background-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"body\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background color\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#fff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#232122\\\"}}},\\\"tag\\\":\\\"body\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Sections\\\",\\\"tag\\\":[\\\"section\\\",\\\"footer\\\",\\\"header\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"Margin\\\",\\\"title\\\":\\\"Margin\\\",\\\"property\\\":\\\"margin\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":[\\\"section\\\",\\\"footer\\\",\\\"header\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Sections\\\",\\\"tag\\\":[\\\".section-line\\\",\\\".section-line-container::after\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Separator color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888888\\\"}}},\\\"tag\\\":[\\\".section-line\\\",\\\".section-line-container::after\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Sections\\\",\\\"tag\\\":[\\\".bg-wrap\\\",\\\".bg-default\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Default background\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#fff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#232122\\\"}}},\\\"tag\\\":[\\\".bg-wrap\\\",\\\".bg-default\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"H1\\\",\\\"tag\\\":\\\"h1\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"100px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"100px\\\"}},\\\"tablet\\\":{\\\"light\\\":{\\\"value\\\":\\\"70px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"70px\\\"}},\\\"mobile\\\":{\\\"light\\\":{\\\"value\\\":\\\"40px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"40px\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"200\\\"},\\\"dark\\\":{\\\"value\\\":\\\"200\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#222\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h1\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"H2\\\",\\\"tag\\\":\\\"h2\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"50px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"50px\\\"}},\\\"tablet\\\":{\\\"light\\\":{\\\"value\\\":\\\"40px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"40px\\\"}},\\\"mobile\\\":{\\\"light\\\":{\\\"value\\\":\\\"30px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"30px\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"300\\\"},\\\"dark\\\":{\\\"value\\\":\\\"300\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#222\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"H3\\\",\\\"tag\\\":\\\"h3\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"35px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"35px\\\"}},\\\"mobile\\\":{\\\"light\\\":{\\\"value\\\":\\\"25px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"25px\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"300\\\"},\\\"dark\\\":{\\\"value\\\":\\\"300\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h3\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"H4\\\",\\\"tag\\\":\\\"h4\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"18px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"18px\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"400\\\"},\\\"dark\\\":{\\\"value\\\":\\\"400\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#555\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"h4\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Link\\\",\\\"tag\\\":\\\"a:not(.btn)\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"a:not(.btn)\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\"a:not(.btn)\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Link\\\",\\\"tag\\\":\\\"a:not(.btn):hover\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Hover color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#000000\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":\\\"a:not(.btn):hover\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Hover text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"underline\\\"},\\\"dark\\\":{\\\"value\\\":\\\"underline\\\"}}},\\\"tag\\\":\\\"a:not(.btn):hover\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Navigation\\\",\\\"tag\\\":\\\".navbar-nav a\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#777\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#aaa\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Decoration\\\",\\\"order\\\":\\\"9\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"none\\\"},\\\"dark\\\":{\\\"value\\\":\\\"none\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"11\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"}}},\\\"tag\\\":\\\".navbar-nav a\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Navigation\\\",\\\"tag\\\":[\\\".navbar-nav a.nav-link:hover\\\",\\\".navbar-nav .nav-item:hover > a.nav-link\\\",\\\".navbar-nav a.nav-link.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Hover font color\\\",\\\"order\\\":\\\"8\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#222\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":[\\\".navbar-nav a.nav-link:hover\\\",\\\".navbar-nav .nav-item:hover > a.nav-link\\\",\\\".navbar-nav a.nav-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Hover decoration\\\",\\\"order\\\":\\\"10\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"none\\\"},\\\"dark\\\":{\\\"value\\\":\\\"none\\\"}}},\\\"tag\\\":[\\\".navbar-nav a.nav-link:hover\\\",\\\".navbar-nav .nav-item:hover > a.nav-link\\\",\\\".navbar-nav a.nav-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Hover background\\\",\\\"order\\\":\\\"12\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"}}},\\\"tag\\\":[\\\".navbar-nav a.nav-link:hover\\\",\\\".navbar-nav .nav-item:hover > a.nav-link\\\",\\\".navbar-nav a.nav-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Tabs\\\",\\\"tag\\\":\\\".nav-tabs a.nav-link\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}},\\\"tag\\\":\\\".nav-tabs a.nav-link\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".nav-tabs a.nav-link\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Tabs\\\",\\\"tag\\\":\\\".nav-tabs\\\",\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}},\\\"tag\\\":\\\".nav-tabs\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Tabs\\\",\\\"tag\\\":[\\\".nav-tabs a.nav-link:hover\\\",\\\".nav-tabs a.nav-link.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Active font color\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}},\\\"tag\\\":[\\\".nav-tabs a.nav-link:hover\\\",\\\".nav-tabs a.nav-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Active border color\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}},\\\"tag\\\":[\\\".nav-tabs a.nav-link:hover\\\",\\\".nav-tabs a.nav-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Active background\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":[\\\".nav-tabs a.nav-link:hover\\\",\\\".nav-tabs a.nav-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Pagination\\\",\\\"tag\\\":\\\".pagination .page-link\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".pagination .page-link\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}},\\\"tag\\\":\\\".pagination .page-link\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".pagination .page-link\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Pagination\\\",\\\"tag\\\":[\\\".pagination .page-link:hover\\\",\\\".pagination .page-link.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Active font color\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":[\\\".pagination .page-link:hover\\\",\\\".pagination .page-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Active border color\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}},\\\"tag\\\":[\\\".pagination .page-link:hover\\\",\\\".pagination .page-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Active background\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}},\\\"tag\\\":[\\\".pagination .page-link:hover\\\",\\\".pagination .page-link.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons\\\",\\\"tag\\\":\\\".btn\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderRadius\\\",\\\"title\\\":\\\"Border radius\\\",\\\"property\\\":\\\"border-radius\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderWidth\\\",\\\"title\\\":\\\"Border width\\\",\\\"property\\\":\\\"border-width\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"2px 2px 2px 2px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"2px 2px 2px 2px\\\"}}},\\\"tag\\\":\\\".btn\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary\\\",\\\".badge-primary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}},\\\"tag\\\":[\\\".btn-primary\\\",\\\".badge-primary\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}},\\\"tag\\\":[\\\".btn-primary\\\",\\\".badge-primary\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font :hover\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}},\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background :hover\\\",\\\"order\\\":\\\"8\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#998B7A\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#998B7A\\\"}}},\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":\\\".btn-outline-primary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}},\\\"tag\\\":\\\".btn-outline-primary\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-outline-primary:hover\\\",\\\".btn-outline-primary:active\\\",\\\".btn-outline-primary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline :hover\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#998B7A\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#998B7A\\\"}}},\\\"tag\\\":[\\\".btn-outline-primary:hover\\\",\\\".btn-outline-primary:active\\\",\\\".btn-outline-primary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary\\\",\\\".btn-outline-primary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}},\\\"tag\\\":[\\\".btn-primary\\\",\\\".btn-outline-primary\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\",\\\".btn-outline-primary:hover\\\",\\\".btn-outline-primary:active\\\",\\\".btn-outline-primary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border :hover\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#998B7A\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#998B7A\\\"}}},\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\",\\\".btn-outline-primary:hover\\\",\\\".btn-outline-primary:active\\\",\\\".btn-outline-primary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary\\\",\\\".badge-secondary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}},\\\"tag\\\":[\\\".btn-secondary\\\",\\\".badge-secondary\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}},\\\"tag\\\":[\\\".btn-secondary\\\",\\\".badge-secondary\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font :hover\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}},\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background :hover\\\",\\\"order\\\":\\\"8\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#91989F\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}},\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":\\\".btn-outline-secondary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}},\\\"tag\\\":\\\".btn-outline-secondary\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-outline-secondary:hover\\\",\\\".btn-outline-secondary:active\\\",\\\".btn-outline-secondary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline :hover\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#91989F\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}},\\\"tag\\\":[\\\".btn-outline-secondary:hover\\\",\\\".btn-outline-secondary:active\\\",\\\".btn-outline-secondary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary\\\",\\\".btn-outline-secondary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}},\\\"tag\\\":[\\\".btn-secondary\\\",\\\".btn-outline-secondary\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\",\\\".btn-outline-secondary:hover\\\",\\\".btn-outline-secondary:active\\\",\\\".btn-outline-secondary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border :hover\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#91989F\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}},\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\",\\\".btn-outline-secondary:hover\\\",\\\".btn-outline-secondary:active\\\",\\\".btn-outline-secondary.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":\\\".form-group\\\",\\\"elements\\\":[{\\\"name\\\":\\\"Margin\\\",\\\"title\\\":\\\"Field margin\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"margin\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":\\\".form-group\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":[\\\".form-control\\\",\\\".form-inline>.btn-link\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderRadius\\\",\\\"title\\\":\\\"Field border radius\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"border-radius\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"}}},\\\"tag\\\":[\\\".form-control\\\",\\\".form-inline>.btn-link\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderWidth\\\",\\\"title\\\":\\\"Field border width\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-width\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"0px 0px 1px 0px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"0px 0px 1px 0px\\\"}}},\\\"tag\\\":[\\\".form-control\\\",\\\".form-inline>.btn-link\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Field border color\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"rgba(0,0,0,0.2)\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}},\\\"tag\\\":[\\\".form-control\\\",\\\".form-inline>.btn-link\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Field background color\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}},\\\"tag\\\":[\\\".form-control\\\",\\\".form-inline>.btn-link\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":[\\\".form-control::placeholder\\\",\\\".form-control .placeholder\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Placeholder\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#aaa\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#aaa\\\"}}},\\\"tag\\\":[\\\".form-control::placeholder\\\",\\\".form-control .placeholder\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":[\\\"input[type=checkbox]+.lbl::after\\\",\\\"input[type=radio]+.lbl::after\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Active element color\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A48F77\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#A48F77\\\"}}},\\\"tag\\\":[\\\"input[type=checkbox]+.lbl::after\\\",\\\"input[type=radio]+.lbl::after\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Icons and decor\\\",\\\"tag\\\":\\\"svg.svg-default\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Default\\\",\\\"property\\\":\\\"fill\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#555\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":\\\"svg.svg-default\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Icons and decor\\\",\\\"tag\\\":\\\"svg.svg-primary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Primary\\\",\\\"property\\\":\\\"fill\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#c3b6a5\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#c3b6a5\\\"}}},\\\"tag\\\":\\\"svg.svg-primary\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Icons and decor\\\",\\\"tag\\\":\\\"svg.svg-secondary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Secondary\\\",\\\"property\\\":\\\"fill\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#bbc3cc\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}},\\\"tag\\\":\\\"svg.svg-secondary\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Gallery\\\",\\\"tag\\\":[\\\".gallery-item:not(.masonry-item)\\\",\\\".masonry-item.gallery-item .wrapper\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#ffffff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#232122\\\"}}},\\\"tag\\\":[\\\".gallery-item:not(.masonry-item)\\\",\\\".masonry-item.gallery-item .wrapper\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":[\\\".owl-prev\\\",\\\".owl-next\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Arrows\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":[\\\".owl-prev\\\",\\\".owl-next\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#fff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}},\\\"tag\\\":[\\\".owl-prev\\\",\\\".owl-next\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":[\\\".owl-prev:hover\\\",\\\".owl-next:hover\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Arrows :hover\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":[\\\".owl-prev:hover\\\",\\\".owl-next:hover\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background :hover\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#ded8d0\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#af9f8c\\\"}}},\\\"tag\\\":[\\\".owl-prev:hover\\\",\\\".owl-next:hover\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":\\\".owl-dot>span\\\",\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Paginator\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}},\\\"tag\\\":\\\".owl-dot>span\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":[\\\".owl-dot.active>span\\\",\\\".owl-dot:hover>span\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Paginator :hover\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}},\\\"tag\\\":[\\\".owl-dot.active>span\\\",\\\".owl-dot:hover>span\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":[\\\"[class*=border]\\\",\\\"hr\\\",\\\".separate-list li\\\",\\\".media\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}},\\\"tag\\\":[\\\"[class*=border]\\\",\\\"hr\\\",\\\".separate-list li\\\",\\\".media\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Preloader\\\",\\\"tag\\\":[\\\"#preloader>div\\\",\\\"#preloader>div>*\\\",\\\"#preloader>div::before\\\",\\\"#preloader>div::after\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#DDD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}},\\\"tag\\\":[\\\"#preloader>div\\\",\\\"#preloader>div>*\\\",\\\"#preloader>div::before\\\",\\\"#preloader>div::after\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background color\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#DDD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}},\\\"tag\\\":[\\\"#preloader>div\\\",\\\"#preloader>div>*\\\",\\\"#preloader>div::before\\\",\\\"#preloader>div::after\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":\\\".border-x2\\\",\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border-x2 color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}},\\\"tag\\\":\\\".border-x2\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":\\\".text-primary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Text primary\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}},\\\"tag\\\":\\\".text-primary\\\",\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":[\\\".text-secondary\\\",\\\".breadcrumb-item + .breadcrumb-item::before\\\",\\\".breadcrumb-item.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Text secondary\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.5)\\\"}}},\\\"tag\\\":[\\\".text-secondary\\\",\\\".breadcrumb-item + .breadcrumb-item::before\\\",\\\".breadcrumb-item.active\\\"],\\\"mode\\\":\\\"light\\\",\\\"mediaMode\\\":\\\"default\\\"}]}]}\",\"builderStyle\":\"/* default */\\n.light .cs-element.custom-buttons .wrapper   {\\n\\tfont-family: \'OpenSans\';\\n\\tfont-size: 14px;\\n\\tline-height: 1.5;\\n\\tcolor: #555;\\n}\\n.dark .cs-element.custom-buttons .wrapper   {\\n\\tfont-family: \'OpenSans\';\\n\\tfont-size: 14px;\\n\\tline-height: 1.5;\\n\\tcolor: #ffffff;\\n}\\n.light .cs-element.custom-buttons .wrapper .section-line, .light .cs-element.custom-buttons .wrapper .section-line-container::after {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .section-line, .dark .cs-element.custom-buttons .wrapper .section-line-container::after {\\n\\tborder-color: #888888;\\n}\\n.light .cs-element.custom-buttons .wrapper .bg-wrap, .light .cs-element.custom-buttons .wrapper .bg-default {\\n\\tbackground-color: #fff;\\n}\\n.dark .cs-element.custom-buttons .wrapper .bg-wrap, .dark .cs-element.custom-buttons .wrapper .bg-default {\\n\\tbackground-color: #232122;\\n}\\n.light .cs-element.custom-buttons .wrapper h1 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 100px;\\n\\tfont-weight: 200;\\n\\tfont-style: normal;\\n\\tcolor: #222;\\n}\\n.dark .cs-element.custom-buttons .wrapper h1 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 100px;\\n\\tfont-weight: 200;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper h2 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 50px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #222;\\n}\\n.dark .cs-element.custom-buttons .wrapper h2 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 50px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper h3 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 35px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #444;\\n}\\n.dark .cs-element.custom-buttons .wrapper h3 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 35px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper h4 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 18px;\\n\\tfont-weight: 400;\\n\\tfont-style: normal;\\n\\tcolor: #555;\\n}\\n.dark .cs-element.custom-buttons .wrapper h4 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 18px;\\n\\tfont-weight: 400;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper a:not(.btn) {\\n}\\n.dark .cs-element.custom-buttons .wrapper a:not(.btn) {\\n}\\n.light .cs-element.custom-buttons .wrapper a:not(.btn):hover {\\n\\tcolor: #000000;\\n\\ttext-decoration: underline;\\n}\\n.dark .cs-element.custom-buttons .wrapper a:not(.btn):hover {\\n\\tcolor: #fff;\\n\\ttext-decoration: underline;\\n}\\n.light .cs-element.custom-buttons .wrapper .navbar-nav a {\\n\\tcolor: #777;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.dark .cs-element.custom-buttons .wrapper .navbar-nav a {\\n\\tcolor: #aaa;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.light .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link:hover, .light .cs-element.custom-buttons .wrapper .navbar-nav .nav-item:hover > a.nav-link, .light .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link.active {\\n\\tcolor: #222;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.dark .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link:hover, .dark .cs-element.custom-buttons .wrapper .navbar-nav .nav-item:hover > a.nav-link, .dark .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link.active {\\n\\tcolor: #fff;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.light .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link {\\n\\tcolor: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link {\\n\\tcolor: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .nav-tabs {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .nav-tabs {\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link:hover, .light .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link.active {\\n\\tcolor: #444;\\n\\tborder-color: #444;\\n}\\n.dark .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link:hover, .dark .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link.active {\\n\\tcolor: #FFF;\\n\\tborder-color: #FFF;\\n}\\n.light .cs-element.custom-buttons .wrapper .pagination .page-link {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .pagination .page-link {\\n\\tborder-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .pagination .page-link:hover, .light .cs-element.custom-buttons .wrapper .pagination .page-link.active {\\n\\tborder-color: #D1D7DD;\\n\\tbackground-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .pagination .page-link:hover, .dark .cs-element.custom-buttons .wrapper .pagination .page-link.active {\\n\\tborder-color: #555;\\n\\tbackground-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 2px 2px 2px 2px;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 2px 2px 2px 2px;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary, .light .cs-element.custom-buttons .wrapper .badge-primary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary, .dark .cs-element.custom-buttons .wrapper .badge-primary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-primary:active, .light .cs-element.custom-buttons .wrapper .btn-primary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #998B7A;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-primary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #998B7A;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tcolor: #998B7A;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tcolor: #998B7A;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary, .light .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tborder-color: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tborder-color: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-primary:active, .light .cs-element.custom-buttons .wrapper .btn-primary.active, .light .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tborder-color: #998B7A;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-primary.active, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tborder-color: #998B7A;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary, .light .cs-element.custom-buttons .wrapper .badge-secondary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary, .dark .cs-element.custom-buttons .wrapper .badge-secondary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-secondary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #91989F;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-secondary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tcolor: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tcolor: #888;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tcolor: #91989F;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tcolor: #888;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tborder-color: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tborder-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-secondary.active, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tborder-color: #91989F;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-secondary.active, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tborder-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .form-group {\\n}\\n.dark .cs-element.custom-buttons .wrapper .form-group {\\n}\\n.light .cs-element.custom-buttons .wrapper .form-control, .light .cs-element.custom-buttons .wrapper .form-inline>.btn-link {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 0px 0px 1px 0px;\\n\\tborder-color: rgba(0,0,0,0.2);\\n}\\n.dark .cs-element.custom-buttons .wrapper .form-control, .dark .cs-element.custom-buttons .wrapper .form-inline>.btn-link {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 0px 0px 1px 0px;\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .form-control::placeholder, .light .cs-element.custom-buttons .wrapper .form-control .placeholder {\\n\\tcolor: #aaa;\\n}\\n.dark .cs-element.custom-buttons .wrapper .form-control::placeholder, .dark .cs-element.custom-buttons .wrapper .form-control .placeholder {\\n\\tcolor: #aaa;\\n}\\n.light .cs-element.custom-buttons .wrapper input[type=checkbox]+.lbl::after, .light .cs-element.custom-buttons .wrapper input[type=radio]+.lbl::after {\\n\\tbackground-color: #A48F77;\\n}\\n.dark .cs-element.custom-buttons .wrapper input[type=checkbox]+.lbl::after, .dark .cs-element.custom-buttons .wrapper input[type=radio]+.lbl::after {\\n\\tbackground-color: #A48F77;\\n}\\n.light .cs-element.custom-buttons .wrapper svg.svg-default {\\n\\tfill: #555;\\n}\\n.dark .cs-element.custom-buttons .wrapper svg.svg-default {\\n\\tfill: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper svg.svg-primary {\\n\\tfill: #c3b6a5;\\n}\\n.dark .cs-element.custom-buttons .wrapper svg.svg-primary {\\n\\tfill: #c3b6a5;\\n}\\n.light .cs-element.custom-buttons .wrapper svg.svg-secondary {\\n\\tfill: #bbc3cc;\\n}\\n.dark .cs-element.custom-buttons .wrapper svg.svg-secondary {\\n\\tfill: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .gallery-item:not(.masonry-item), .light .cs-element.custom-buttons .wrapper .masonry-item.gallery-item .wrapper {\\n\\tbackground-color: #ffffff;\\n}\\n.dark .cs-element.custom-buttons .wrapper .gallery-item:not(.masonry-item), .dark .cs-element.custom-buttons .wrapper .masonry-item.gallery-item .wrapper {\\n\\tbackground-color: #232122;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-prev, .light .cs-element.custom-buttons .wrapper .owl-next {\\n\\tborder-color: #444;\\n\\tbackground-color: #fff;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-prev, .dark .cs-element.custom-buttons .wrapper .owl-next {\\n\\tborder-color: #fff;\\n\\tbackground-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-prev:hover, .light .cs-element.custom-buttons .wrapper .owl-next:hover {\\n\\tborder-color: #444;\\n\\tbackground-color: #ded8d0;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-prev:hover, .dark .cs-element.custom-buttons .wrapper .owl-next:hover {\\n\\tborder-color: #fff;\\n\\tbackground-color: #af9f8c;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-dot>span {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-dot>span {\\n\\tborder-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-dot.active>span, .light .cs-element.custom-buttons .wrapper .owl-dot:hover>span {\\n\\tborder-color: #444;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-dot.active>span, .dark .cs-element.custom-buttons .wrapper .owl-dot:hover>span {\\n\\tborder-color: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper [class*=border], .light .cs-element.custom-buttons .wrapper hr, .light .cs-element.custom-buttons .wrapper .separate-list li, .light .cs-element.custom-buttons .wrapper .media {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper [class*=border], .dark .cs-element.custom-buttons .wrapper hr, .dark .cs-element.custom-buttons .wrapper .separate-list li, .dark .cs-element.custom-buttons .wrapper .media {\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n#modal-container .modal-dialog.light-page #prev-preload .choice-element>div, #modal-container .modal-dialog.light-page #prev-preload .choice-element>div>*, #modal-container .modal-dialog.light-page #prev-preload .choice-element>div::before, #modal-container .modal-dialog.light-page #prev-preload .choice-element>div::after {\\n\\tborder-color: #DDD;\\n\\tbackground-color: #DDD;\\n}\\n#modal-container .modal-dialog.dark-page #prev-preload .choice-element>div, #modal-container .modal-dialog.dark-page #prev-preload .choice-element>div>*, #modal-container .modal-dialog.dark-page #prev-preload .choice-element>div::before, #modal-container .modal-dialog.dark-page #prev-preload .choice-element>div::after {\\n\\tborder-color: #888;\\n\\tbackground-color: #888;\\n}\\n.light .cs-element.custom-buttons .wrapper .border-x2 {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .border-x2 {\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .text-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .text-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .text-secondary, .light .cs-element.custom-buttons .wrapper .breadcrumb-item + .breadcrumb-item::before, .light .cs-element.custom-buttons .wrapper .breadcrumb-item.active {\\n\\tcolor: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .text-secondary, .dark .cs-element.custom-buttons .wrapper .breadcrumb-item + .breadcrumb-item::before, .dark .cs-element.custom-buttons .wrapper .breadcrumb-item.active {\\n\\tcolor: rgba(255,255,255,0.5);\\n}\\n\"}', NULL, '2020-01-30 19:06:22');
INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role`, `image`, `shop_description`, `shop_category_id`, `verification_status`, `ethereum_address`, `cover_image`, `message`, `address`, `phone`, `apiToken`, `user_own_site`, `created_at`, `updated_at`) VALUES
(4, 'Nazmul Chy', 'nazmul', 'nazmul@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 2, '/uploads/1574452163781.jpeg', NULL, NULL, 4, '0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae', NULL, NULL, NULL, NULL, '5hl838mgk60rdqrq', '{\"sectionsName\":\"[\\\"header-carousel-4\\\",\\\"desc-text-halfbg-3\\\",\\\"benefits-4col-7\\\"]\",\"pagesStorageObj\":\"[{\\\"_selfDOM\\\":{},\\\"id\\\":0,\\\"sections\\\":{\\\"header-carousel-4\\\":{\\\"sectionPreview\\\":{\\\"name\\\":\\\"header-carousel-4\\\",\\\"groupName\\\":\\\"headers\\\",\\\"overallJs\\\":\\\"\\\",\\\"html\\\":\\\"<header id=\\\\\\\"header-carousel-4\\\\\\\" class=\\\\\\\"section-carousel carousel-dots-left-bottom carousel-nav-right-bottom overall dark\\\\\\\">\\\\n    <div class=\\\\\\\"carousel-single carousel-stretch spr-gallery\\\\\\\">\\\\n        <div class=\\\\\\\"item vw-100 d-flex align-items-center pt-50 pb-50 pt-md-150 pb-md-150\\\\\\\" style=\\\\\\\"background-color: #705896\\\\\\\">\\\\n            <div class=\\\\\\\"container\\\\\\\">\\\\n                <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n                    <div class=\\\\\\\"col-md-6 text-center\\\\\\\">\\\\n                        <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                            <img class=\\\\\\\"mw-100 mb-50 mb-md-0\\\\\\\" alt=\\\\\\\"\\\\\\\" src=\\\\\\\"images/gallery/mockup-imac.png\\\\\\\" width=\\\\\\\"450px\\\\\\\">\\\\n                        </div>\\\\n                    </div>\\\\n                    <div class=\\\\\\\"col-md-6\\\\\\\">\\\\n                        <h2 class=\\\\\\\"mb-30\\\\\\\"><strong>Multipurpose template</strong></h2>\\\\n                        <h4 class=\\\\\\\"text-secondary mb-50\\\\\\\">In our work we try to use only the most convenient and interesting solutions</h4>\\\\n                        <a href=\\\\\\\"#\\\\\\\" class=\\\\\\\"btn btn-lg btn-primary\\\\\\\">Details</a>\\\\n                    </div>\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n        <div class=\\\\\\\"item vw-100 d-flex align-items-center pt-50 pb-50 pt-md-150 pb-md-150\\\\\\\" style=\\\\\\\"background-color: #444\\\\\\\">\\\\n            <div class=\\\\\\\"container\\\\\\\">\\\\n                <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n                    <div class=\\\\\\\"col-md-6 text-center order-md-2\\\\\\\">\\\\n                        <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                            <img class=\\\\\\\"mw-100 mb-50 mb-md-0\\\\\\\" alt=\\\\\\\"\\\\\\\" src=\\\\\\\"images/gallery/mockup-imac.png\\\\\\\" width=\\\\\\\"450px\\\\\\\">\\\\n                        </div>\\\\n                    </div>\\\\n                    <div class=\\\\\\\"col-md-6 order-md-1\\\\\\\">\\\\n                        <h2 class=\\\\\\\"mb-30\\\\\\\"><strong>Multipurpose template</strong></h2>\\\\n                        <h4 class=\\\\\\\"text-secondary mb-50\\\\\\\">In our work we try to use only the most convenient and interesting solutions</h4>\\\\n                        <a href=\\\\\\\"#\\\\\\\" class=\\\\\\\"btn btn-lg btn-dark\\\\\\\">Details</a>\\\\n                    </div>\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n        <div class=\\\\\\\"item vw-100 d-flex align-items-center pt-50 pb-50 pt-md-150 pb-md-150 light\\\\\\\" style=\\\\\\\"background-color: #eeeeee\\\\\\\">\\\\n            <div class=\\\\\\\"container\\\\\\\">\\\\n                <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n                    <div class=\\\\\\\"col-md-4\\\\\\\">\\\\n                        <img alt=\\\\\\\"logo\\\\\\\" class=\\\\\\\"mw-100 mb-50\\\\\\\" src=\\\\\\\"images/gallery/logo-4.png\\\\\\\" width=\\\\\\\"80px\\\\\\\">\\\\n                        <h3 class=\\\\\\\"mb-50\\\\\\\"><strong>Multipurpose template</strong></h3>\\\\n                        <h4 class=\\\\\\\"text-secondary\\\\\\\">In our work we try to use only the most convenient and interesting solutions</h4>\\\\n                    </div>\\\\n                    <div class=\\\\\\\"col-md-8 text-center\\\\\\\">\\\\n                        <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                            <img class=\\\\\\\"mw-100 mt-50 mt-md-0 shadow\\\\\\\" alt=\\\\\\\"\\\\\\\" src=\\\\\\\"images/gallery/mockup-desktop-screen-2.png\\\\\\\" width=\\\\\\\"600px\\\\\\\">\\\\n                        </div>\\\\n                    </div>\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</header>\\\\n\\\",\\\"style\\\":\\\"\\\",\\\"script\\\":\\\"//magnific\\\\n//------------------------------------------------------------------------\\\\n//                    MAGNIFIC POPUP(LIGHTBOX) SETTINGS\\\\n//------------------------------------------------------------------------\\\\n\\\\n$(\'.video-popup\').magnificPopup({\\\\n    type: \'iframe\',\\\\n    disableOn: function () {\\\\n        if (!pAgree || pAgree !== \'1\') {\\\\n            return false;\\\\n        }\\\\n        return true;\\\\n    }\\\\n});\\\\n//magnificend\\\\n\\\\n//------------------------------------------------------------------------\\\\n//\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tOWL CAROUSEL OPTIONS\\\\n//------------------------------------------------------------------------\\\\n\\\\n$(\'.carousel-single\').owlCarousel({\\\\n    loop: false,\\\\n    margin: 0,\\\\n    nav: true,\\\\n    autoplay: true,\\\\n    autoplayHoverPause: true,\\\\n    autoHeight: false,\\\\n    items: 1,\\\\n    dots: true,\\\\n    navText: [\'\',\'\'],\\\\n    rewind: true\\\\n});\\\\n\\\",\\\"preview\\\":\\\"sections/headers/header-carousel-4/header-carousel-4.jpg\\\",\\\"_selfDOM\\\":{}},\\\"name\\\":\\\"header-carousel-4\\\",\\\"_selfDOM\\\":{}},\\\"desc-text-halfbg-3\\\":{\\\"sectionPreview\\\":{\\\"name\\\":\\\"desc-text-halfbg-3\\\",\\\"groupName\\\":\\\"descriptions\\\",\\\"overallJs\\\":\\\"\\\",\\\"html\\\":\\\"<section id=\\\\\\\"desc-text-halfbg-3\\\\\\\" class=\\\\\\\"pt-75 pt-md-150 pb-md-150\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row\\\\\\\">\\\\n            <div class=\\\\\\\"col-md-7\\\\\\\">\\\\n                <h2 class=\\\\\\\"\\\\\\\"><strong>Feature description</strong></h2>\\\\n                <img class=\\\\\\\"mb-30 svg-secondary\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-1.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\">\\\\n                <p class=\\\\\\\"mb-50\\\\\\\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible. In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.\\\\n                </p>\\\\n                <a class=\\\\\\\"btn btn-secondary\\\\\\\" href=\\\\\\\"#\\\\\\\">Details</a>\\\\n            </div>\\\\n            <div class=\\\\\\\"bg-box col-md-6 mt-50 mt-md-0 embed-responsive-4by3\\\\\\\" style=\\\\\\\"background-image: url(images/gallery/bg-1.jpg); background-position: center center; background-size: cover;\\\\\\\">\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n\\\",\\\"style\\\":\\\"\\\",\\\"script\\\":\\\"\\\",\\\"preview\\\":\\\"sections/descriptions/desc-text-halfbg-3/desc-text-halfbg-3.jpg\\\",\\\"_selfDOM\\\":{}},\\\"name\\\":\\\"desc-text-halfbg-3\\\",\\\"_selfDOM\\\":{}},\\\"benefits-4col-7\\\":{\\\"sectionPreview\\\":{\\\"name\\\":\\\"benefits-4col-7\\\",\\\"groupName\\\":\\\"benefits\\\",\\\"overallJs\\\":\\\"\\\",\\\"html\\\":\\\"<section id=\\\\\\\"benefits-4col-7\\\\\\\" class=\\\\\\\"pb-50 pt-100\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row\\\\\\\">\\\\n            <div class=\\\\\\\"col-lg-12\\\\\\\">\\\\n                <h3><strong>Benefits</strong></h3>\\\\n                <img class=\\\\\\\"svg-secondary mb-50\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-1.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\">\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <img class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_elaboration_mail_heart.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\" height=\\\\\\\"48px\\\\\\\" width=\\\\\\\"48px\\\\\\\" >\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <img class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/weather_fog_fullmoon.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\" height=\\\\\\\"48px\\\\\\\" width=\\\\\\\"48px\\\\\\\" >\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <img class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_globe.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\" height=\\\\\\\"48px\\\\\\\" width=\\\\\\\"48px\\\\\\\" >\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <img class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_elaboration_browser_check.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\" height=\\\\\\\"48px\\\\\\\" width=\\\\\\\"48px\\\\\\\" >\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n\\\",\\\"style\\\":\\\"#benefits-4col-7 .bg-wrap {\\\\n    background-color: #F4F5F6;\\\\n}\\\\n\\\\n\\\\n#benefits-4col-7 .bg {\\\\n    background-image: url(\'images/gallery/bg-pattern-3.png\');\\\\n    background-repeat: repeat;\\\\n    background-position: center;\\\\n    background-size: 50px 50px;\\\\n    opacity:0.075;\\\\n}\\\\n\\\",\\\"script\\\":\\\"\\\",\\\"preview\\\":\\\"sections/benefits/benefits-4col-7/benefits-4col-7.jpg\\\",\\\"_selfDOM\\\":{}},\\\"name\\\":\\\"benefits-4col-7\\\",\\\"_selfDOM\\\":{}}},\\\"html\\\":\\\"\\\",\\\"htmlDOM\\\":null,\\\"preloader\\\":\\\"\\\",\\\"load\\\":true,\\\"_title\\\":\\\"index\\\",\\\"_name\\\":\\\"index\\\",\\\"_className\\\":\\\"index\\\",\\\"_metaDes\\\":\\\"\\\",\\\"_metaKey\\\":\\\"\\\",\\\"_metaJs\\\":\\\"\\\"}]\",\"projectData\":\"\\\"\\\\n    <style>/* default */\\\\n.dark .light , .light  , .dark .light  , .light  {\\\\n\\\\tfont-family: \'OpenSans\';\\\\n\\\\tfont-size: 14px;\\\\n\\\\tline-height: 1.5;\\\\n\\\\tcolor: #555;\\\\n}\\\\n.light .dark , .dark  , .light .dark  , .dark  {\\\\n\\\\tfont-family: \'OpenSans\';\\\\n\\\\tfont-size: 14px;\\\\n\\\\tline-height: 1.5;\\\\n\\\\tcolor: #ffffff;\\\\n}\\\\n.light-page {\\\\n\\\\tbackground-color: #fff;\\\\n}\\\\n.dark-page {\\\\n\\\\tbackground-color: #232122;\\\\n}\\\\nsection.light, footer.light, header.light {\\\\n}\\\\nsection.dark, footer.dark, header.dark {\\\\n}\\\\n.dark .section-line.light, .light .section-line, .dark .light .section-line, .section-line.light, .dark .section-line-container.light::after, .light .section-line-container::after, .dark .light .section-line-container::after, .section-line-container.light::after {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .section-line.dark, .dark .section-line, .light .dark .section-line, .section-line.dark, .light .section-line-container.dark::after, .dark .section-line-container::after, .light .dark .section-line-container::after, .section-line-container.dark::after {\\\\n\\\\tborder-color: #888888;\\\\n}\\\\n.dark .bg-wrap.light, .light .bg-wrap, .dark .light .bg-wrap, .bg-wrap.light, .dark .bg-default.light, .light .bg-default, .dark .light .bg-default, .bg-default.light {\\\\n\\\\tbackground-color: #fff;\\\\n}\\\\n.light .bg-wrap.dark, .dark .bg-wrap, .light .dark .bg-wrap, .bg-wrap.dark, .light .bg-default.dark, .dark .bg-default, .light .dark .bg-default, .bg-default.dark {\\\\n\\\\tbackground-color: #232122;\\\\n}\\\\n.dark h1.light, .light h1, .dark .light h1, h1.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 100px;\\\\n\\\\tfont-weight: 200;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #222;\\\\n}\\\\n.light h1.dark, .dark h1, .light .dark h1, h1.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 100px;\\\\n\\\\tfont-weight: 200;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark h2.light, .light h2, .dark .light h2, h2.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 50px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #222;\\\\n}\\\\n.light h2.dark, .dark h2, .light .dark h2, h2.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 50px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark h3.light, .light h3, .dark .light h3, h3.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 35px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #444;\\\\n}\\\\n.light h3.dark, .dark h3, .light .dark h3, h3.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 35px;\\\\n\\\\tfont-weight: 300;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark h4.light, .light h4, .dark .light h4, h4.light {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 18px;\\\\n\\\\tfont-weight: 400;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #555;\\\\n}\\\\n.light h4.dark, .dark h4, .light .dark h4, h4.dark {\\\\n\\\\tfont-family: \'Montserrat\';\\\\n\\\\tfont-size: 18px;\\\\n\\\\tfont-weight: 400;\\\\n\\\\tfont-style: normal;\\\\n\\\\tcolor: #fff;\\\\n}\\\\n.dark a.light:not(.btn), .light a:not(.btn), .dark .light a:not(.btn), a.light:not(.btn) {\\\\n}\\\\n.light a.dark:not(.btn), .dark a:not(.btn), .light .dark a:not(.btn), a.dark:not(.btn) {\\\\n}\\\\n.dark a.light:not(.btn):hover, .light a:not(.btn):hover, .dark .light a:not(.btn):hover, a.light:not(.btn):hover {\\\\n\\\\tcolor: #000000;\\\\n\\\\ttext-decoration: underline;\\\\n}\\\\n.light a.dark:not(.btn):hover, .dark a:not(.btn):hover, .light .dark a:not(.btn):hover, a.dark:not(.btn):hover {\\\\n\\\\tcolor: #fff;\\\\n\\\\ttext-decoration: underline;\\\\n}\\\\n.dark .navbar-nav.light a, .light .navbar-nav a, .dark .light .navbar-nav a, .navbar-nav.light a {\\\\n\\\\tcolor: #777;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.light .navbar-nav.dark a, .dark .navbar-nav a, .light .dark .navbar-nav a, .navbar-nav.dark a {\\\\n\\\\tcolor: #aaa;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.dark .navbar-nav.light a.nav-link:hover, .light .navbar-nav a.nav-link:hover, .dark .light .navbar-nav a.nav-link:hover, .navbar-nav.light a.nav-link:hover, .dark .navbar-nav.light .nav-item:hover > a.nav-link, .light .navbar-nav .nav-item:hover > a.nav-link, .dark .light .navbar-nav .nav-item:hover > a.nav-link, .navbar-nav.light .nav-item:hover > a.nav-link, .dark .navbar-nav.light a.nav-link.active, .light .navbar-nav a.nav-link.active, .dark .light .navbar-nav a.nav-link.active, .navbar-nav.light a.nav-link.active {\\\\n\\\\tcolor: #222;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.light .navbar-nav.dark a.nav-link:hover, .dark .navbar-nav a.nav-link:hover, .light .dark .navbar-nav a.nav-link:hover, .navbar-nav.dark a.nav-link:hover, .light .navbar-nav.dark .nav-item:hover > a.nav-link, .dark .navbar-nav .nav-item:hover > a.nav-link, .light .dark .navbar-nav .nav-item:hover > a.nav-link, .navbar-nav.dark .nav-item:hover > a.nav-link, .light .navbar-nav.dark a.nav-link.active, .dark .navbar-nav a.nav-link.active, .light .dark .navbar-nav a.nav-link.active, .navbar-nav.dark a.nav-link.active {\\\\n\\\\tcolor: #fff;\\\\n\\\\ttext-decoration: none;\\\\n\\\\tbackground-color: rgba(255,255,255,0);\\\\n}\\\\n.dark .nav-tabs.light a.nav-link, .light .nav-tabs a.nav-link, .dark .light .nav-tabs a.nav-link, .nav-tabs.light a.nav-link {\\\\n\\\\tcolor: #A2AAB1;\\\\n}\\\\n.light .nav-tabs.dark a.nav-link, .dark .nav-tabs a.nav-link, .light .dark .nav-tabs a.nav-link, .nav-tabs.dark a.nav-link {\\\\n\\\\tcolor: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .nav-tabs.light, .light .nav-tabs, .dark .light .nav-tabs, .nav-tabs.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .nav-tabs.dark, .dark .nav-tabs, .light .dark .nav-tabs, .nav-tabs.dark {\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .nav-tabs.light a.nav-link:hover, .light .nav-tabs a.nav-link:hover, .dark .light .nav-tabs a.nav-link:hover, .nav-tabs.light a.nav-link:hover, .dark .nav-tabs.light a.nav-link.active, .light .nav-tabs a.nav-link.active, .dark .light .nav-tabs a.nav-link.active, .nav-tabs.light a.nav-link.active {\\\\n\\\\tcolor: #444;\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.light .nav-tabs.dark a.nav-link:hover, .dark .nav-tabs a.nav-link:hover, .light .dark .nav-tabs a.nav-link:hover, .nav-tabs.dark a.nav-link:hover, .light .nav-tabs.dark a.nav-link.active, .dark .nav-tabs a.nav-link.active, .light .dark .nav-tabs a.nav-link.active, .nav-tabs.dark a.nav-link.active {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tborder-color: #FFF;\\\\n}\\\\n.dark .pagination.light .page-link, .light .pagination .page-link, .dark .light .pagination .page-link, .pagination.light .page-link {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .pagination.dark .page-link, .dark .pagination .page-link, .light .dark .pagination .page-link, .pagination.dark .page-link {\\\\n\\\\tborder-color: #555;\\\\n}\\\\n.dark .pagination.light .page-link:hover, .light .pagination .page-link:hover, .dark .light .pagination .page-link:hover, .pagination.light .page-link:hover, .dark .pagination.light .page-link.active, .light .pagination .page-link.active, .dark .light .pagination .page-link.active, .pagination.light .page-link.active {\\\\n\\\\tborder-color: #D1D7DD;\\\\n\\\\tbackground-color: #D1D7DD;\\\\n}\\\\n.light .pagination.dark .page-link:hover, .dark .pagination .page-link:hover, .light .dark .pagination .page-link:hover, .pagination.dark .page-link:hover, .light .pagination.dark .page-link.active, .dark .pagination .page-link.active, .light .dark .pagination .page-link.active, .pagination.dark .page-link.active {\\\\n\\\\tborder-color: #555;\\\\n\\\\tbackground-color: #555;\\\\n}\\\\n.dark .btn.light, .light .btn, .dark .light .btn, .btn.light {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 2px 2px 2px 2px;\\\\n}\\\\n.light .btn.dark, .dark .btn, .light .dark .btn, .btn.dark {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 2px 2px 2px 2px;\\\\n}\\\\n.dark .btn-primary.light, .light .btn-primary, .dark .light .btn-primary, .btn-primary.light, .dark .badge-primary.light, .light .badge-primary, .dark .light .badge-primary, .badge-primary.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #AF9F8C;\\\\n}\\\\n.light .btn-primary.dark, .dark .btn-primary, .light .dark .btn-primary, .btn-primary.dark, .light .badge-primary.dark, .dark .badge-primary, .light .dark .badge-primary, .badge-primary.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #AF9F8C;\\\\n}\\\\n.dark .btn-primary.light:hover, .light .btn-primary:hover, .dark .light .btn-primary:hover, .btn-primary.light:hover, .dark .btn-primary.light:active, .light .btn-primary:active, .dark .light .btn-primary:active, .btn-primary.light:active, .dark .btn-primary.active.light, .light .btn-primary.active, .dark .light .btn-primary.active, .btn-primary.active.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #998B7A;\\\\n}\\\\n.light .btn-primary.dark:hover, .dark .btn-primary:hover, .light .dark .btn-primary:hover, .btn-primary.dark:hover, .light .btn-primary.dark:active, .dark .btn-primary:active, .light .dark .btn-primary:active, .btn-primary.dark:active, .light .btn-primary.active.dark, .dark .btn-primary.active, .light .dark .btn-primary.active, .btn-primary.active.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #998B7A;\\\\n}\\\\n.dark .btn-outline-primary.light, .light .btn-outline-primary, .dark .light .btn-outline-primary, .btn-outline-primary.light {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.light .btn-outline-primary.dark, .dark .btn-outline-primary, .light .dark .btn-outline-primary, .btn-outline-primary.dark {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.dark .btn-outline-primary.light:hover, .light .btn-outline-primary:hover, .dark .light .btn-outline-primary:hover, .btn-outline-primary.light:hover, .dark .btn-outline-primary.light:active, .light .btn-outline-primary:active, .dark .light .btn-outline-primary:active, .btn-outline-primary.light:active, .dark .btn-outline-primary.active.light, .light .btn-outline-primary.active, .dark .light .btn-outline-primary.active, .btn-outline-primary.active.light {\\\\n\\\\tcolor: #998B7A;\\\\n}\\\\n.light .btn-outline-primary.dark:hover, .dark .btn-outline-primary:hover, .light .dark .btn-outline-primary:hover, .btn-outline-primary.dark:hover, .light .btn-outline-primary.dark:active, .dark .btn-outline-primary:active, .light .dark .btn-outline-primary:active, .btn-outline-primary.dark:active, .light .btn-outline-primary.active.dark, .dark .btn-outline-primary.active, .light .dark .btn-outline-primary.active, .btn-outline-primary.active.dark {\\\\n\\\\tcolor: #998B7A;\\\\n}\\\\n.dark .btn-primary.light, .light .btn-primary, .dark .light .btn-primary, .btn-primary.light, .dark .btn-outline-primary.light, .light .btn-outline-primary, .dark .light .btn-outline-primary, .btn-outline-primary.light {\\\\n\\\\tborder-color: #AF9F8C;\\\\n}\\\\n.light .btn-primary.dark, .dark .btn-primary, .light .dark .btn-primary, .btn-primary.dark, .light .btn-outline-primary.dark, .dark .btn-outline-primary, .light .dark .btn-outline-primary, .btn-outline-primary.dark {\\\\n\\\\tborder-color: #AF9F8C;\\\\n}\\\\n.dark .btn-primary.light:hover, .light .btn-primary:hover, .dark .light .btn-primary:hover, .btn-primary.light:hover, .dark .btn-primary.light:active, .light .btn-primary:active, .dark .light .btn-primary:active, .btn-primary.light:active, .dark .btn-primary.active.light, .light .btn-primary.active, .dark .light .btn-primary.active, .btn-primary.active.light, .dark .btn-outline-primary.light:hover, .light .btn-outline-primary:hover, .dark .light .btn-outline-primary:hover, .btn-outline-primary.light:hover, .dark .btn-outline-primary.light:active, .light .btn-outline-primary:active, .dark .light .btn-outline-primary:active, .btn-outline-primary.light:active, .dark .btn-outline-primary.active.light, .light .btn-outline-primary.active, .dark .light .btn-outline-primary.active, .btn-outline-primary.active.light {\\\\n\\\\tborder-color: #998B7A;\\\\n}\\\\n.light .btn-primary.dark:hover, .dark .btn-primary:hover, .light .dark .btn-primary:hover, .btn-primary.dark:hover, .light .btn-primary.dark:active, .dark .btn-primary:active, .light .dark .btn-primary:active, .btn-primary.dark:active, .light .btn-primary.active.dark, .dark .btn-primary.active, .light .dark .btn-primary.active, .btn-primary.active.dark, .light .btn-outline-primary.dark:hover, .dark .btn-outline-primary:hover, .light .dark .btn-outline-primary:hover, .btn-outline-primary.dark:hover, .light .btn-outline-primary.dark:active, .dark .btn-outline-primary:active, .light .dark .btn-outline-primary:active, .btn-outline-primary.dark:active, .light .btn-outline-primary.active.dark, .dark .btn-outline-primary.active, .light .dark .btn-outline-primary.active, .btn-outline-primary.active.dark {\\\\n\\\\tborder-color: #998B7A;\\\\n}\\\\n.dark .btn-secondary.light, .light .btn-secondary, .dark .light .btn-secondary, .btn-secondary.light, .dark .badge-secondary.light, .light .badge-secondary, .dark .light .badge-secondary, .badge-secondary.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #A2AAB1;\\\\n}\\\\n.light .btn-secondary.dark, .dark .btn-secondary, .light .dark .btn-secondary, .btn-secondary.dark, .light .badge-secondary.dark, .dark .badge-secondary, .light .dark .badge-secondary, .badge-secondary.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #444;\\\\n}\\\\n.dark .btn-secondary.light:hover, .light .btn-secondary:hover, .dark .light .btn-secondary:hover, .btn-secondary.light:hover, .dark .btn-secondary.light:active, .light .btn-secondary:active, .dark .light .btn-secondary:active, .btn-secondary.light:active, .dark .btn-secondary.active.light, .light .btn-secondary.active, .dark .light .btn-secondary.active, .btn-secondary.active.light {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #91989F;\\\\n}\\\\n.light .btn-secondary.dark:hover, .dark .btn-secondary:hover, .light .dark .btn-secondary:hover, .btn-secondary.dark:hover, .light .btn-secondary.dark:active, .dark .btn-secondary:active, .light .dark .btn-secondary:active, .btn-secondary.dark:active, .light .btn-secondary.active.dark, .dark .btn-secondary.active, .light .dark .btn-secondary.active, .btn-secondary.active.dark {\\\\n\\\\tcolor: #FFF;\\\\n\\\\tbackground-color: #555;\\\\n}\\\\n.dark .btn-outline-secondary.light, .light .btn-outline-secondary, .dark .light .btn-outline-secondary, .btn-outline-secondary.light {\\\\n\\\\tcolor: #A2AAB1;\\\\n}\\\\n.light .btn-outline-secondary.dark, .dark .btn-outline-secondary, .light .dark .btn-outline-secondary, .btn-outline-secondary.dark {\\\\n\\\\tcolor: #888;\\\\n}\\\\n.dark .btn-outline-secondary.light:hover, .light .btn-outline-secondary:hover, .dark .light .btn-outline-secondary:hover, .btn-outline-secondary.light:hover, .dark .btn-outline-secondary.light:active, .light .btn-outline-secondary:active, .dark .light .btn-outline-secondary:active, .btn-outline-secondary.light:active, .dark .btn-outline-secondary.active.light, .light .btn-outline-secondary.active, .dark .light .btn-outline-secondary.active, .btn-outline-secondary.active.light {\\\\n\\\\tcolor: #91989F;\\\\n}\\\\n.light .btn-outline-secondary.dark:hover, .dark .btn-outline-secondary:hover, .light .dark .btn-outline-secondary:hover, .btn-outline-secondary.dark:hover, .light .btn-outline-secondary.dark:active, .dark .btn-outline-secondary:active, .light .dark .btn-outline-secondary:active, .btn-outline-secondary.dark:active, .light .btn-outline-secondary.active.dark, .dark .btn-outline-secondary.active, .light .dark .btn-outline-secondary.active, .btn-outline-secondary.active.dark {\\\\n\\\\tcolor: #888;\\\\n}\\\\n.dark .btn-secondary.light, .light .btn-secondary, .dark .light .btn-secondary, .btn-secondary.light, .dark .btn-outline-secondary.light, .light .btn-outline-secondary, .dark .light .btn-outline-secondary, .btn-outline-secondary.light {\\\\n\\\\tborder-color: #A2AAB1;\\\\n}\\\\n.light .btn-secondary.dark, .dark .btn-secondary, .light .dark .btn-secondary, .btn-secondary.dark, .light .btn-outline-secondary.dark, .dark .btn-outline-secondary, .light .dark .btn-outline-secondary, .btn-outline-secondary.dark {\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.dark .btn-secondary.light:hover, .light .btn-secondary:hover, .dark .light .btn-secondary:hover, .btn-secondary.light:hover, .dark .btn-secondary.light:active, .light .btn-secondary:active, .dark .light .btn-secondary:active, .btn-secondary.light:active, .dark .btn-secondary.active.light, .light .btn-secondary.active, .dark .light .btn-secondary.active, .btn-secondary.active.light, .dark .btn-outline-secondary.light:hover, .light .btn-outline-secondary:hover, .dark .light .btn-outline-secondary:hover, .btn-outline-secondary.light:hover, .dark .btn-outline-secondary.light:active, .light .btn-outline-secondary:active, .dark .light .btn-outline-secondary:active, .btn-outline-secondary.light:active, .dark .btn-outline-secondary.active.light, .light .btn-outline-secondary.active, .dark .light .btn-outline-secondary.active, .btn-outline-secondary.active.light {\\\\n\\\\tborder-color: #91989F;\\\\n}\\\\n.light .btn-secondary.dark:hover, .dark .btn-secondary:hover, .light .dark .btn-secondary:hover, .btn-secondary.dark:hover, .light .btn-secondary.dark:active, .dark .btn-secondary:active, .light .dark .btn-secondary:active, .btn-secondary.dark:active, .light .btn-secondary.active.dark, .dark .btn-secondary.active, .light .dark .btn-secondary.active, .btn-secondary.active.dark, .light .btn-outline-secondary.dark:hover, .dark .btn-outline-secondary:hover, .light .dark .btn-outline-secondary:hover, .btn-outline-secondary.dark:hover, .light .btn-outline-secondary.dark:active, .dark .btn-outline-secondary:active, .light .dark .btn-outline-secondary:active, .btn-outline-secondary.dark:active, .light .btn-outline-secondary.active.dark, .dark .btn-outline-secondary.active, .light .dark .btn-outline-secondary.active, .btn-outline-secondary.active.dark {\\\\n\\\\tborder-color: #555;\\\\n}\\\\n.dark .form-group.light, .light .form-group, .dark .light .form-group, .form-group.light {\\\\n}\\\\n.light .form-group.dark, .dark .form-group, .light .dark .form-group, .form-group.dark {\\\\n}\\\\n.dark .form-control.light, .light .form-control, .dark .light .form-control, .form-control.light, .dark .form-inline>.btn-link.light, .light .form-inline>.btn-link, .dark .light .form-inline>.btn-link, .form-inline>.btn-link.light {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 0px 0px 1px 0px;\\\\n\\\\tborder-color: rgba(0,0,0,0.2);\\\\n}\\\\n.light .form-control.dark, .dark .form-control, .light .dark .form-control, .form-control.dark, .light .form-inline>.btn-link.dark, .dark .form-inline>.btn-link, .light .dark .form-inline>.btn-link, .form-inline>.btn-link.dark {\\\\n\\\\tborder-radius: 0px 0px 0px 0px;\\\\n\\\\tborder-width: 0px 0px 1px 0px;\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .form-control.light::placeholder, .light .form-control::placeholder, .dark .light .form-control::placeholder, .form-control.light::placeholder, .dark .form-control.light .placeholder, .light .form-control .placeholder, .dark .light .form-control .placeholder, .form-control.light .placeholder {\\\\n\\\\tcolor: #aaa;\\\\n}\\\\n.light .form-control.dark::placeholder, .dark .form-control::placeholder, .light .dark .form-control::placeholder, .form-control.dark::placeholder, .light .form-control.dark .placeholder, .dark .form-control .placeholder, .light .dark .form-control .placeholder, .form-control.dark .placeholder {\\\\n\\\\tcolor: #aaa;\\\\n}\\\\n.dark input[type=checkbox]+.lbl.light::after, .light input[type=checkbox]+.lbl::after, .dark .light input[type=checkbox]+.lbl::after, input[type=checkbox]+.lbl.light::after, .dark input[type=radio]+.lbl.light::after, .light input[type=radio]+.lbl::after, .dark .light input[type=radio]+.lbl::after, input[type=radio]+.lbl.light::after {\\\\n\\\\tbackground-color: #A48F77;\\\\n}\\\\n.light input[type=checkbox]+.lbl.dark::after, .dark input[type=checkbox]+.lbl::after, .light .dark input[type=checkbox]+.lbl::after, input[type=checkbox]+.lbl.dark::after, .light input[type=radio]+.lbl.dark::after, .dark input[type=radio]+.lbl::after, .light .dark input[type=radio]+.lbl::after, input[type=radio]+.lbl.dark::after {\\\\n\\\\tbackground-color: #A48F77;\\\\n}\\\\n.dark svg.svg-default.light, .light svg.svg-default, .dark .light svg.svg-default, svg.svg-default.light {\\\\n\\\\tfill: #555;\\\\n}\\\\n.light svg.svg-default.dark, .dark svg.svg-default, .light .dark svg.svg-default, svg.svg-default.dark {\\\\n\\\\tfill: #fff;\\\\n}\\\\n.dark svg.svg-primary.light, .light svg.svg-primary, .dark .light svg.svg-primary, svg.svg-primary.light {\\\\n\\\\tfill: #c3b6a5;\\\\n}\\\\n.light svg.svg-primary.dark, .dark svg.svg-primary, .light .dark svg.svg-primary, svg.svg-primary.dark {\\\\n\\\\tfill: #c3b6a5;\\\\n}\\\\n.dark svg.svg-secondary.light, .light svg.svg-secondary, .dark .light svg.svg-secondary, svg.svg-secondary.light {\\\\n\\\\tfill: #bbc3cc;\\\\n}\\\\n.light svg.svg-secondary.dark, .dark svg.svg-secondary, .light .dark svg.svg-secondary, svg.svg-secondary.dark {\\\\n\\\\tfill: #555;\\\\n}\\\\n.dark .gallery-item.light:not(.masonry-item), .light .gallery-item:not(.masonry-item), .dark .light .gallery-item:not(.masonry-item), .gallery-item.light:not(.masonry-item), .dark .masonry-item.gallery-item.light .wrapper, .light .masonry-item.gallery-item .wrapper, .dark .light .masonry-item.gallery-item .wrapper, .masonry-item.gallery-item.light .wrapper {\\\\n\\\\tbackground-color: #ffffff;\\\\n}\\\\n.light .gallery-item.dark:not(.masonry-item), .dark .gallery-item:not(.masonry-item), .light .dark .gallery-item:not(.masonry-item), .gallery-item.dark:not(.masonry-item), .light .masonry-item.gallery-item.dark .wrapper, .dark .masonry-item.gallery-item .wrapper, .light .dark .masonry-item.gallery-item .wrapper, .masonry-item.gallery-item.dark .wrapper {\\\\n\\\\tbackground-color: #232122;\\\\n}\\\\n.dark .owl-prev.light, .light .owl-prev, .dark .light .owl-prev, .owl-prev.light, .dark .owl-next.light, .light .owl-next, .dark .light .owl-next, .owl-next.light {\\\\n\\\\tborder-color: #444;\\\\n\\\\tbackground-color: #fff;\\\\n}\\\\n.light .owl-prev.dark, .dark .owl-prev, .light .dark .owl-prev, .owl-prev.dark, .light .owl-next.dark, .dark .owl-next, .light .dark .owl-next, .owl-next.dark {\\\\n\\\\tborder-color: #fff;\\\\n\\\\tbackground-color: #444;\\\\n}\\\\n.dark .owl-prev.light:hover, .light .owl-prev:hover, .dark .light .owl-prev:hover, .owl-prev.light:hover, .dark .owl-next.light:hover, .light .owl-next:hover, .dark .light .owl-next:hover, .owl-next.light:hover {\\\\n\\\\tborder-color: #444;\\\\n\\\\tbackground-color: #ded8d0;\\\\n}\\\\n.light .owl-prev.dark:hover, .dark .owl-prev:hover, .light .dark .owl-prev:hover, .owl-prev.dark:hover, .light .owl-next.dark:hover, .dark .owl-next:hover, .light .dark .owl-next:hover, .owl-next.dark:hover {\\\\n\\\\tborder-color: #fff;\\\\n\\\\tbackground-color: #af9f8c;\\\\n}\\\\n.dark .owl-dot>span.light, .light .owl-dot>span, .dark .light .owl-dot>span, .owl-dot>span.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .owl-dot>span.dark, .dark .owl-dot>span, .light .dark .owl-dot>span, .owl-dot>span.dark {\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.dark .owl-dot.active>span.light, .light .owl-dot.active>span, .dark .light .owl-dot.active>span, .owl-dot.active>span.light, .dark .owl-dot.light:hover>span, .light .owl-dot:hover>span, .dark .light .owl-dot:hover>span, .owl-dot.light:hover>span {\\\\n\\\\tborder-color: #444;\\\\n}\\\\n.light .owl-dot.active>span.dark, .dark .owl-dot.active>span, .light .dark .owl-dot.active>span, .owl-dot.active>span.dark, .light .owl-dot.dark:hover>span, .dark .owl-dot:hover>span, .light .dark .owl-dot:hover>span, .owl-dot.dark:hover>span {\\\\n\\\\tborder-color: #fff;\\\\n}\\\\n.dark [class*=border].light, .light [class*=border], .dark .light [class*=border], [class*=border].light, .dark hr.light, .light hr, .dark .light hr, hr.light, .dark .separate-list.light li, .light .separate-list li, .dark .light .separate-list li, .separate-list.light li, .dark .media.light, .light .media, .dark .light .media, .media.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light [class*=border].dark, .dark [class*=border], .light .dark [class*=border], [class*=border].dark, .light hr.dark, .dark hr, .light .dark hr, hr.dark, .light .separate-list.dark li, .dark .separate-list li, .light .dark .separate-list li, .separate-list.dark li, .light .media.dark, .dark .media, .light .dark .media, .media.dark {\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.light-page #preloader>div, .light-page #preloader>div>*, .light-page #preloader>div::before, .light-page #preloader>div::after {\\\\n\\\\tborder-color: #DDD;\\\\n\\\\tbackground-color: #DDD;\\\\n}\\\\n.dark-page #preloader>div, .dark-page #preloader>div>*, .dark-page #preloader>div::before, .dark-page #preloader>div::after {\\\\n\\\\tborder-color: #888;\\\\n\\\\tbackground-color: #888;\\\\n}\\\\n.dark .border-x2.light, .light .border-x2, .dark .light .border-x2, .border-x2.light {\\\\n\\\\tborder-color: #D1D7DD;\\\\n}\\\\n.light .border-x2.dark, .dark .border-x2, .light .dark .border-x2, .border-x2.dark {\\\\n\\\\tborder-color: rgba(255,255,255,0.2);\\\\n}\\\\n.dark .text-primary.light, .light .text-primary, .dark .light .text-primary, .text-primary.light {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.light .text-primary.dark, .dark .text-primary, .light .dark .text-primary, .text-primary.dark {\\\\n\\\\tcolor: #AF9F8C;\\\\n}\\\\n.dark .text-secondary.light, .light .text-secondary, .dark .light .text-secondary, .text-secondary.light, .dark .breadcrumb-item.light + .breadcrumb-item::before, .light .breadcrumb-item + .breadcrumb-item::before, .dark .light .breadcrumb-item + .breadcrumb-item::before, .breadcrumb-item.light + .breadcrumb-item::before, .dark .breadcrumb-item.active.light, .light .breadcrumb-item.active, .dark .light .breadcrumb-item.active, .breadcrumb-item.active.light {\\\\n\\\\tcolor: #A2AAB1;\\\\n}\\\\n.light .text-secondary.dark, .dark .text-secondary, .light .dark .text-secondary, .text-secondary.dark, .light .breadcrumb-item.dark + .breadcrumb-item::before, .dark .breadcrumb-item + .breadcrumb-item::before, .light .dark .breadcrumb-item + .breadcrumb-item::before, .breadcrumb-item.dark + .breadcrumb-item::before, .light .breadcrumb-item.active.dark, .dark .breadcrumb-item.active, .light .dark .breadcrumb-item.active, .breadcrumb-item.active.dark {\\\\n\\\\tcolor: rgba(255,255,255,0.5);\\\\n}\\\\n/* end default */\\\\n@media all and (max-width: 1279px) {\\\\n\\\\t.dark h1.light, .light h1, .dark .light h1, h1.light {\\\\n\\\\tfont-size: 70px;\\\\n\\\\t}\\\\n\\\\t.light h1.dark, .dark h1, .light .dark h1, h1.dark {\\\\n\\\\tfont-size: 70px;\\\\n\\\\t}\\\\n\\\\t.dark h2.light, .light h2, .dark .light h2, h2.light {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n\\\\t.light h2.dark, .dark h2, .light .dark h2, h2.dark {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n}\\\\n@media all and (max-width: 576px) {\\\\n\\\\t.dark h1.light, .light h1, .dark .light h1, h1.light {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n\\\\t.light h1.dark, .dark h1, .light .dark h1, h1.dark {\\\\n\\\\tfont-size: 40px;\\\\n\\\\t}\\\\n\\\\t.dark h2.light, .light h2, .dark .light h2, h2.light {\\\\n\\\\tfont-size: 30px;\\\\n\\\\t}\\\\n\\\\t.light h2.dark, .dark h2, .light .dark h2, h2.dark {\\\\n\\\\tfont-size: 30px;\\\\n\\\\t}\\\\n\\\\t.dark h3.light, .light h3, .dark .light h3, h3.light {\\\\n\\\\tfont-size: 25px;\\\\n\\\\t}\\\\n\\\\t.light h3.dark, .dark h3, .light .dark h3, h3.dark {\\\\n\\\\tfont-size: 25px;\\\\n\\\\t}\\\\n}\\\\n</style>\\\\n  <ul class=\\\\\\\"index light-page blr-active-page page-mode-project-pages\\\\\\\" data-id=\\\\\\\"0\\\\\\\" data-name=\\\\\\\"index\\\\\\\"><li class=\\\\\\\"section-item\\\\\\\" data-name=\\\\\\\"header-carousel-4\\\\\\\" data-group=\\\\\\\"headers\\\\\\\" data-img=\\\\\\\"sections/headers/header-carousel-4/header-carousel-4.jpg\\\\\\\"><header id=\\\\\\\"header-carousel-4\\\\\\\" class=\\\\\\\"section-carousel carousel-dots-left-bottom carousel-nav-right-bottom overall dark\\\\\\\">\\\\n    <div class=\\\\\\\"carousel-single carousel-stretch spr-gallery owl-loaded owl-carousel owl-theme owl-drag\\\\\\\"><div class=\\\\\\\"owl-dots\\\\\\\"><div class=\\\\\\\"owl-dot\\\\\\\"><span></span></div><div class=\\\\\\\"owl-dot active\\\\\\\"><span></span></div><div class=\\\\\\\"owl-dot\\\\\\\"><span></span></div></div>\\\\n        \\\\n        \\\\n        \\\\n    <div class=\\\\\\\"owl-stage-outer\\\\\\\"><div class=\\\\\\\"owl-stage\\\\\\\" style=\\\\\\\"transform: translate3d(-1181px, 0px, 0px); transition: all 0.25s ease 0s; width: 3543px;\\\\\\\"><div class=\\\\\\\"owl-item\\\\\\\" style=\\\\\\\"width: 1181px;\\\\\\\"><div class=\\\\\\\"item vw-100 d-flex align-items-center pt-50 pb-50 pt-md-150 pb-md-150\\\\\\\" style=\\\\\\\"background-color: #705896\\\\\\\">\\\\n            <div class=\\\\\\\"container\\\\\\\">\\\\n                <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n                    <div class=\\\\\\\"col-md-6 text-center\\\\\\\">\\\\n                        <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                            <img class=\\\\\\\"mw-100 mb-50 mb-md-0\\\\\\\" alt=\\\\\\\"\\\\\\\" src=\\\\\\\"images/gallery/mockup-imac.png\\\\\\\" width=\\\\\\\"450px\\\\\\\">\\\\n                        </div>\\\\n                    </div>\\\\n                    <div class=\\\\\\\"col-md-6\\\\\\\">\\\\n                        <h2 class=\\\\\\\"mb-30\\\\\\\"><strong>Multipurpose template</strong></h2>\\\\n                        <h4 class=\\\\\\\"text-secondary mb-50\\\\\\\">In our work we try to use only the most convenient and interesting solutions</h4>\\\\n                        <a href=\\\\\\\"#\\\\\\\" class=\\\\\\\"btn btn-lg btn-primary\\\\\\\">Details</a>\\\\n                    </div>\\\\n                </div>\\\\n            </div>\\\\n        </div></div><div class=\\\\\\\"owl-item active\\\\\\\" style=\\\\\\\"width: 1181px;\\\\\\\"><div class=\\\\\\\"item vw-100 d-flex align-items-center pt-50 pb-50 pt-md-150 pb-md-150\\\\\\\" style=\\\\\\\"background-color: #444\\\\\\\">\\\\n            <div class=\\\\\\\"container\\\\\\\">\\\\n                <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n                    <div class=\\\\\\\"col-md-6 text-center order-md-2\\\\\\\">\\\\n                        <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                            <img class=\\\\\\\"mw-100 mb-50 mb-md-0\\\\\\\" alt=\\\\\\\"\\\\\\\" src=\\\\\\\"images/gallery/mockup-imac.png\\\\\\\" width=\\\\\\\"450px\\\\\\\">\\\\n                        </div>\\\\n                    </div>\\\\n                    <div class=\\\\\\\"col-md-6 order-md-1\\\\\\\">\\\\n                        <h2 class=\\\\\\\"mb-30\\\\\\\"><strong>Multipurpose template</strong></h2>\\\\n                        <h4 class=\\\\\\\"text-secondary mb-50\\\\\\\">In our work we try to use only the most convenient and interesting solutions</h4>\\\\n                        <a href=\\\\\\\"#\\\\\\\" class=\\\\\\\"btn btn-lg btn-dark\\\\\\\">Details</a>\\\\n                    </div>\\\\n                </div>\\\\n            </div>\\\\n        </div></div><div class=\\\\\\\"owl-item\\\\\\\" style=\\\\\\\"width: 1181px;\\\\\\\"><div class=\\\\\\\"item vw-100 d-flex align-items-center pt-50 pb-50 pt-md-150 pb-md-150 light\\\\\\\" style=\\\\\\\"background-color: #eeeeee\\\\\\\">\\\\n            <div class=\\\\\\\"container\\\\\\\">\\\\n                <div class=\\\\\\\"row align-items-center\\\\\\\">\\\\n                    <div class=\\\\\\\"col-md-4\\\\\\\">\\\\n                        <img alt=\\\\\\\"logo\\\\\\\" class=\\\\\\\"mw-100 mb-50\\\\\\\" src=\\\\\\\"images/gallery/logo-4.png\\\\\\\" width=\\\\\\\"80px\\\\\\\">\\\\n                        <h3 class=\\\\\\\"mb-50\\\\\\\"><strong>Multipurpose template</strong></h3>\\\\n                        <h4 class=\\\\\\\"text-secondary\\\\\\\">In our work we try to use only the most convenient and interesting solutions</h4>\\\\n                    </div>\\\\n                    <div class=\\\\\\\"col-md-8 text-center\\\\\\\">\\\\n                        <div class=\\\\\\\"content-box d-inline-block\\\\\\\">\\\\n                            <img class=\\\\\\\"mw-100 mt-50 mt-md-0 shadow\\\\\\\" alt=\\\\\\\"\\\\\\\" src=\\\\\\\"images/gallery/mockup-desktop-screen-2.png\\\\\\\" width=\\\\\\\"600px\\\\\\\">\\\\n                        </div>\\\\n                    </div>\\\\n                </div>\\\\n            </div>\\\\n        </div></div></div></div><div class=\\\\\\\"owl-nav\\\\\\\"><div class=\\\\\\\"owl-prev\\\\\\\"></div><div class=\\\\\\\"owl-next\\\\\\\"></div></div></div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</header>\\\\n<style></style><script type=\\\\\\\"text/javascript\\\\\\\">\\\\n//delete\\\\nsetTimeout(function(){\\\\n//deleteend\\\\n//magnific\\\\n//------------------------------------------------------------------------\\\\n//                    MAGNIFIC POPUP(LIGHTBOX) SETTINGS\\\\n//------------------------------------------------------------------------\\\\n\\\\n$(\'.video-popup\').magnificPopup({\\\\n    type: \'iframe\',\\\\n    disableOn: function () {\\\\n        if (!pAgree || pAgree !== \'1\') {\\\\n            return false;\\\\n        }\\\\n        return true;\\\\n    }\\\\n});\\\\n//magnificend\\\\n\\\\n//------------------------------------------------------------------------\\\\n//\\\\t\\\\t\\\\t\\\\t\\\\t\\\\tOWL CAROUSEL OPTIONS\\\\n//------------------------------------------------------------------------\\\\n\\\\n$(\'.carousel-single\').owlCarousel({\\\\n    loop: false,\\\\n    margin: 0,\\\\n    nav: true,\\\\n    autoplay: true,\\\\n    autoplayHoverPause: true,\\\\n    autoHeight: false,\\\\n    items: 1,\\\\n    dots: true,\\\\n    navText: [\'\',\'\'],\\\\n    rewind: true\\\\n});\\\\n\\\\n//delete\\\\n}, 150);\\\\n//deleteend</script></li><li class=\\\\\\\"section-item\\\\\\\" data-name=\\\\\\\"desc-text-halfbg-3\\\\\\\" data-group=\\\\\\\"descriptions\\\\\\\" data-img=\\\\\\\"sections/descriptions/desc-text-halfbg-3/desc-text-halfbg-3.jpg\\\\\\\"><section id=\\\\\\\"desc-text-halfbg-3\\\\\\\" class=\\\\\\\"pt-75 pt-md-150 pb-md-150 light\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row\\\\\\\">\\\\n            <div class=\\\\\\\"col-md-7\\\\\\\">\\\\n                <h2 class=\\\\\\\"\\\\\\\"><strong>Feature description</strong></h2>\\\\n                <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"20\\\\\\\" viewBox=\\\\\\\"0 0 40 20\\\\\\\" width=\\\\\\\"40\\\\\\\" class=\\\\\\\"mb-30 svg-secondary\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-1.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\"><path d=\\\\\\\"m0 8h40v4h-40z\\\\\\\" fill-rule=\\\\\\\"evenodd\\\\\\\"></path></svg>\\\\n                <p class=\\\\\\\"mb-50\\\\\\\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible. In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.\\\\n                </p>\\\\n                <a class=\\\\\\\"btn btn-secondary\\\\\\\" href=\\\\\\\"#\\\\\\\">Details</a>\\\\n            </div>\\\\n            <div class=\\\\\\\"bg-box col-md-6 mt-50 mt-md-0 embed-responsive-4by3\\\\\\\" style=\\\\\\\"background-image: url(images/gallery/bg-1.jpg); background-position: center center; background-size: cover;\\\\\\\">\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n<style></style><script type=\\\\\\\"text/javascript\\\\\\\">\\\\n</script></li><li class=\\\\\\\"section-item\\\\\\\" data-name=\\\\\\\"benefits-4col-7\\\\\\\" data-group=\\\\\\\"benefits\\\\\\\" data-img=\\\\\\\"sections/benefits/benefits-4col-7/benefits-4col-7.jpg\\\\\\\"><section id=\\\\\\\"benefits-4col-7\\\\\\\" class=\\\\\\\"pb-50 pt-100 light\\\\\\\">\\\\n    <div class=\\\\\\\"container\\\\\\\">\\\\n        <div class=\\\\\\\"row\\\\\\\">\\\\n            <div class=\\\\\\\"col-lg-12\\\\\\\">\\\\n                <h3><strong>Benefits</strong></h3>\\\\n                <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" height=\\\\\\\"20\\\\\\\" viewBox=\\\\\\\"0 0 40 20\\\\\\\" width=\\\\\\\"40\\\\\\\" class=\\\\\\\"svg-secondary mb-50\\\\\\\" src=\\\\\\\"images/gallery/decor/line-h-1.svg\\\\\\\" alt=\\\\\\\"sep\\\\\\\"><path d=\\\\\\\"m0 8h40v4h-40z\\\\\\\" fill-rule=\\\\\\\"evenodd\\\\\\\"></path></svg>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_elaboration_mail_heart.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m54 0h-44v21.142l-10 4.193v38.665h64v-38.665l-10-4.193zm-2 2v29.716l-20 12.537-20-12.537v-29.716zm-42 28.462-6.835-4.285 6.835-2.866zm-8 31.538v-34.193l30 18.807 30-18.807v34.193zm58.835-35.823-6.835 4.285v-7.151z\\\\\\\"></path><path d=\\\\\\\"m31.529 31.882.471.251.471-.251c.429-.229 10.529-5.698 10.529-12.882 0-3.42-2.579-6-6-6-2.085 0-3.924 1.068-5 2.687-1.076-1.619-2.915-2.687-5-2.687-3.421 0-6 2.58-6 6 0 7.184 10.1 12.653 10.529 12.882zm-4.529-16.882c2.206 0 4 1.794 4 4h2c0-2.206 1.794-4 4-4 2.317 0 4 1.682 4 4 0 5.203-7.086 9.724-9 10.85-1.914-1.126-9-5.647-9-10.85 0-2.318 1.683-4 4-4z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/weather_fog_fullmoon.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m5.383 33.022c-.243.949-.383 1.945-.383 2.978 0 5.794 4.206 10 10 10v-2c-4.71 0-8-3.29-8-8 0-4.962 3.589-9 8-9h2.829l.153-.815c1.546-8.22 9.123-14.185 18.018-14.185 10.477 0 19 7.626 19 17v1h1c3.536 0 6 4.216 6 8 0 3.645-2.355 6-6 6v2c4.71 0 8-3.29 8-8 0-4.493-2.783-9.282-7.024-9.927-.537-10.048-9.74-18.073-20.976-18.073-4.097 0-7.938 1.156-11.156 3.157-2.647-3.251-6.59-5.157-10.844-5.157-7.72 0-14 6.28-14 14 0 2.682.761 5.288 2.201 7.538.85 1.327 1.939 2.509 3.182 3.484zm8.617-23.022c3.591 0 6.929 1.581 9.197 4.291-3.457 2.653-5.989 6.375-7.008 10.709h-1.189c-3.88 0-7.242 2.448-8.9 6.009-.849-.747-1.606-1.601-2.214-2.549-1.234-1.927-1.886-4.161-1.886-6.46 0-6.617 5.383-12 12-12z\\\\\\\"></path><path d=\\\\\\\"m17 44h37v2h-37z\\\\\\\"></path><path d=\\\\\\\"m17 50h37v2h-37z\\\\\\\"></path><path d=\\\\\\\"m17 56h37v2h-37z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_globe.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m58 28c0 13.851-12.149 26-26 26-9.265 0-12.178-3.573-12.2-3.6l-1.6 1.2c.13.174 3.223 4.11 12.8 4.375v6.025h-9v2h9 2 9v-2h-9v-6.027c14.495-.569 27-13.392 27-27.973 0-14.916-13.084-28-28-28v2c13.851 0 26 12.149 26 26z\\\\\\\"></path><path d=\\\\\\\"m32 49c11.58 0 21-9.42 21-21s-9.42-21-21-21-21 9.42-21 21 9.42 21 21 21zm0-40c10.477 0 19 8.523 19 19s-8.523 19-19 19-19-8.523-19-19 8.523-19 19-19z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n            <div class=\\\\\\\"col-lg-3 col-md-6\\\\\\\">\\\\n                <div class=\\\\\\\"content-box padding-x2 shadow mb-50 bg-default\\\\\\\">\\\\n                    <svg xmlns=\\\\\\\"http://www.w3.org/2000/svg\\\\\\\" enable-background=\\\\\\\"new 0 0 64 64\\\\\\\" height=\\\\\\\"48px\\\\\\\" viewBox=\\\\\\\"0 0 64 64\\\\\\\" width=\\\\\\\"48px\\\\\\\" class=\\\\\\\"mb-30 icon svg-default\\\\\\\" src=\\\\\\\"images/gallery/lineaicons/basic_elaboration_browser_check.svg\\\\\\\" alt=\\\\\\\"icon\\\\\\\"><path d=\\\\\\\"m0 58h64v-52h-64zm2-2v-40h60v40zm60-48v6h-60v-6z\\\\\\\"></path><path d=\\\\\\\"m6 10h4v2h-4z\\\\\\\"></path><path d=\\\\\\\"m14 10h4v2h-4z\\\\\\\"></path><path d=\\\\\\\"m22 10h4v2h-4z\\\\\\\"></path><path d=\\\\\\\"m30 40.586-6.293-6.293-1.414 1.561 7 7.146h1.414l13-13.146-1.414-1.488z\\\\\\\"></path></svg>\\\\n                    <h4 class=\\\\\\\"mb-20\\\\\\\"><strong>Benefit description</strong></h4>\\\\n                    <p class=\\\\\\\"mb-0\\\\\\\">In our work we try to use only the most modern, convenient solutions</p>\\\\n                </div>\\\\n            </div>\\\\n        </div>\\\\n    </div>\\\\n    <div class=\\\\\\\"bg-wrap\\\\\\\">\\\\n        <div class=\\\\\\\"bg\\\\\\\"></div>\\\\n    </div>\\\\n</section>\\\\n<style>#benefits-4col-7 .bg-wrap {\\\\n    background-color: #F4F5F6;\\\\n}\\\\n\\\\n\\\\n#benefits-4col-7 .bg {\\\\n    background-image: url(\'images/gallery/bg-pattern-3.png\');\\\\n    background-repeat: repeat;\\\\n    background-position: center;\\\\n    background-size: 50px 50px;\\\\n    opacity:0.075;\\\\n}\\\\n</style><script type=\\\\\\\"text/javascript\\\\\\\">\\\\n</script></li></ul>\\\"\",\"modalContainer\":\"\\\"\\\"\",\"modalFormContainer\":\"\\\"\\\"\",\"forms\":\"{}\",\"video_bg\":\"false\",\"gallery\":\"false\",\"form_section\":\"false\",\"smooth\":\"false\",\"parallax\":\"false\",\"datepicker\":\"false\",\"filefield\":\"false\",\"countup\":\"false\",\"countdown\":\"false\",\"gMaps\":\"[]\",\"plugins\":\"[]\",\"optionsStyle\":\"{\\\"mediaResolution\\\":{\\\"mobile\\\":\\\"max-width: 576px\\\",\\\"tablet\\\":\\\"max-width: 1279px\\\",\\\"desktop\\\":\\\"min-width: 1280px\\\"},\\\"sections\\\":[\\\"section\\\",\\\"footer\\\",\\\"header\\\",\\\"nav\\\",\\\".modal\\\"],\\\"defaultActiveMedia\\\":\\\"default\\\",\\\"defaultActiveMode\\\":\\\"light\\\",\\\"defaultPropertiesForTags\\\":[{\\\"name\\\":\\\"Body\\\",\\\"tag\\\":\\\" \\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'OpenSans\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'OpenSans\'\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"14px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"14px\\\"}}}},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"1.5\\\"},\\\"dark\\\":{\\\"value\\\":\\\"1.5\\\"}}}},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#555\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#ffffff\\\"}}}}]},{\\\"name\\\":\\\"Body\\\",\\\"tag\\\":\\\"body\\\",\\\"elements\\\":[{\\\"name\\\":\\\"Padding\\\",\\\"title\\\":\\\"Padding\\\",\\\"property\\\":\\\"padding\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BackgroundImage\\\",\\\"title\\\":\\\"Background image\\\",\\\"property\\\":\\\"background-image\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BackgroundPosition\\\",\\\"title\\\":\\\"Background position\\\",\\\"property\\\":\\\"background-position\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BackgroundRepeat\\\",\\\"title\\\":\\\"Background repeat\\\",\\\"property\\\":\\\"background-repeat\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BackgroundSize\\\",\\\"title\\\":\\\"Background size\\\",\\\"property\\\":\\\"background-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background color\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#fff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#232122\\\"}}}}]},{\\\"name\\\":\\\"Sections\\\",\\\"tag\\\":[\\\"section\\\",\\\"footer\\\",\\\"header\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"Margin\\\",\\\"title\\\":\\\"Margin\\\",\\\"property\\\":\\\"margin\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Sections\\\",\\\"tag\\\":[\\\".section-line\\\",\\\".section-line-container::after\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Separator color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888888\\\"}}}}]},{\\\"name\\\":\\\"Sections\\\",\\\"tag\\\":[\\\".bg-wrap\\\",\\\".bg-default\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Default background\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#fff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#232122\\\"}}}}]},{\\\"name\\\":\\\"H1\\\",\\\"tag\\\":\\\"h1\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"100px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"100px\\\"}},\\\"tablet\\\":{\\\"light\\\":{\\\"value\\\":\\\"70px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"70px\\\"}},\\\"mobile\\\":{\\\"light\\\":{\\\"value\\\":\\\"40px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"40px\\\"}}}},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"200\\\"},\\\"dark\\\":{\\\"value\\\":\\\"200\\\"}}}},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#222\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"H2\\\",\\\"tag\\\":\\\"h2\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"50px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"50px\\\"}},\\\"tablet\\\":{\\\"light\\\":{\\\"value\\\":\\\"40px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"40px\\\"}},\\\"mobile\\\":{\\\"light\\\":{\\\"value\\\":\\\"30px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"30px\\\"}}}},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"300\\\"},\\\"dark\\\":{\\\"value\\\":\\\"300\\\"}}}},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#222\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"H3\\\",\\\"tag\\\":\\\"h3\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"35px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"35px\\\"}},\\\"mobile\\\":{\\\"light\\\":{\\\"value\\\":\\\"25px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"25px\\\"}}}},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"300\\\"},\\\"dark\\\":{\\\"value\\\":\\\"300\\\"}}}},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"H4\\\",\\\"tag\\\":\\\"h4\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\'Montserrat\'\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"18px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"18px\\\"}}}},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"400\\\"},\\\"dark\\\":{\\\"value\\\":\\\"400\\\"}}}},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"normal\\\"},\\\"dark\\\":{\\\"value\\\":\\\"normal\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#555\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"TextShadow\\\",\\\"title\\\":\\\"Text shadow\\\",\\\"property\\\":\\\"text-shadow\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Link\\\",\\\"tag\\\":\\\"a:not(.btn)\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Link\\\",\\\"tag\\\":\\\"a:not(.btn):hover\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Hover color\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#000000\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Hover text decoration\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"underline\\\"},\\\"dark\\\":{\\\"value\\\":\\\"underline\\\"}}}}]},{\\\"name\\\":\\\"Navigation\\\",\\\"tag\\\":\\\".navbar-nav a\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LineHeight\\\",\\\"title\\\":\\\"Line height\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"line-height\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontStyle\\\",\\\"title\\\":\\\"Font style\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"font-style\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#777\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#aaa\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Decoration\\\",\\\"order\\\":\\\"9\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"none\\\"},\\\"dark\\\":{\\\"value\\\":\\\"none\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"11\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"}}}}]},{\\\"name\\\":\\\"Navigation\\\",\\\"tag\\\":[\\\".navbar-nav a.nav-link:hover\\\",\\\".navbar-nav .nav-item:hover > a.nav-link\\\",\\\".navbar-nav a.nav-link.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Hover font color\\\",\\\"order\\\":\\\"8\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#222\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"TextDecoration\\\",\\\"title\\\":\\\"Hover decoration\\\",\\\"order\\\":\\\"10\\\",\\\"property\\\":\\\"text-decoration\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"none\\\"},\\\"dark\\\":{\\\"value\\\":\\\"none\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Hover background\\\",\\\"order\\\":\\\"12\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0)\\\"}}}}]},{\\\"name\\\":\\\"Tabs\\\",\\\"tag\\\":\\\".nav-tabs a.nav-link\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Tabs\\\",\\\"tag\\\":\\\".nav-tabs\\\",\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}}}]},{\\\"name\\\":\\\"Tabs\\\",\\\"tag\\\":[\\\".nav-tabs a.nav-link:hover\\\",\\\".nav-tabs a.nav-link.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Active font color\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}}},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Active border color\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Active background\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Pagination\\\",\\\"tag\\\":\\\".pagination .page-link\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font color\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Pagination\\\",\\\"tag\\\":[\\\".pagination .page-link:hover\\\",\\\".pagination .page-link.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Active font color\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Active border color\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Active background\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}}}]},{\\\"name\\\":\\\"Buttons\\\",\\\"tag\\\":\\\".btn\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontFamily\\\",\\\"title\\\":\\\"Font family\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"font-family\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontSize\\\",\\\"title\\\":\\\"Font size\\\",\\\"property\\\":\\\"font-size\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"FontWeight\\\",\\\"title\\\":\\\"Font weight\\\",\\\"property\\\":\\\"font-weight\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"LetterSpacing\\\",\\\"title\\\":\\\"Letter spacing\\\",\\\"property\\\":\\\"letter-spacing\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"TextTransform\\\",\\\"title\\\":\\\"Text transform\\\",\\\"property\\\":\\\"text-transform\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}},{\\\"name\\\":\\\"BorderRadius\\\",\\\"title\\\":\\\"Border radius\\\",\\\"property\\\":\\\"border-radius\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"}}}},{\\\"name\\\":\\\"BorderWidth\\\",\\\"title\\\":\\\"Border width\\\",\\\"property\\\":\\\"border-width\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"2px 2px 2px 2px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"2px 2px 2px 2px\\\"}}}}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary\\\",\\\".badge-primary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}}}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font :hover\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background :hover\\\",\\\"order\\\":\\\"8\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#998B7A\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#998B7A\\\"}}}}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":\\\".btn-outline-primary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}}}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-outline-primary:hover\\\",\\\".btn-outline-primary:active\\\",\\\".btn-outline-primary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline :hover\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#998B7A\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#998B7A\\\"}}}}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary\\\",\\\".btn-outline-primary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}}}]},{\\\"name\\\":\\\"Buttons primary\\\",\\\"tag\\\":[\\\".btn-primary:hover\\\",\\\".btn-primary:active\\\",\\\".btn-primary.active\\\",\\\".btn-outline-primary:hover\\\",\\\".btn-outline-primary:active\\\",\\\".btn-outline-primary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border :hover\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#998B7A\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#998B7A\\\"}}}}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary\\\",\\\".badge-secondary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}}}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font :hover\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#FFF\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#FFF\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background :hover\\\",\\\"order\\\":\\\"8\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#91989F\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}}}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":\\\".btn-outline-secondary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}}}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-outline-secondary:hover\\\",\\\".btn-outline-secondary:active\\\",\\\".btn-outline-secondary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Font outline :hover\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#91989F\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}}}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary\\\",\\\".btn-outline-secondary\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}}}]},{\\\"name\\\":\\\"Buttons secondary\\\",\\\"tag\\\":[\\\".btn-secondary:hover\\\",\\\".btn-secondary:active\\\",\\\".btn-secondary.active\\\",\\\".btn-outline-secondary:hover\\\",\\\".btn-outline-secondary:active\\\",\\\".btn-outline-secondary.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border :hover\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#91989F\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}}}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":\\\".form-group\\\",\\\"elements\\\":[{\\\"name\\\":\\\"Margin\\\",\\\"title\\\":\\\"Field margin\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"margin\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":[\\\".form-control\\\",\\\".form-inline>.btn-link\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderRadius\\\",\\\"title\\\":\\\"Field border radius\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"border-radius\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"0px 0px 0px 0px\\\"}}}},{\\\"name\\\":\\\"BorderWidth\\\",\\\"title\\\":\\\"Field border width\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-width\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"0px 0px 1px 0px\\\"},\\\"dark\\\":{\\\"value\\\":\\\"0px 0px 1px 0px\\\"}}}},{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Field border color\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"rgba(0,0,0,0.2)\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Field background color\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"\\\"},\\\"dark\\\":{\\\"value\\\":\\\"\\\"}}}}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":[\\\".form-control::placeholder\\\",\\\".form-control .placeholder\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Placeholder\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#aaa\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#aaa\\\"}}}}]},{\\\"name\\\":\\\"Forms\\\",\\\"tag\\\":[\\\"input[type=checkbox]+.lbl::after\\\",\\\"input[type=radio]+.lbl::after\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Active element color\\\",\\\"order\\\":\\\"7\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A48F77\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#A48F77\\\"}}}}]},{\\\"name\\\":\\\"Icons and decor\\\",\\\"tag\\\":\\\"svg.svg-default\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Default\\\",\\\"property\\\":\\\"fill\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#555\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}}]},{\\\"name\\\":\\\"Icons and decor\\\",\\\"tag\\\":\\\"svg.svg-primary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Primary\\\",\\\"property\\\":\\\"fill\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#c3b6a5\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#c3b6a5\\\"}}}}]},{\\\"name\\\":\\\"Icons and decor\\\",\\\"tag\\\":\\\"svg.svg-secondary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Secondary\\\",\\\"property\\\":\\\"fill\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#bbc3cc\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#555\\\"}}}}]},{\\\"name\\\":\\\"Gallery\\\",\\\"tag\\\":[\\\".gallery-item:not(.masonry-item)\\\",\\\".masonry-item.gallery-item .wrapper\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#ffffff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#232122\\\"}}}}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":[\\\".owl-prev\\\",\\\".owl-next\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Arrows\\\",\\\"order\\\":\\\"3\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background\\\",\\\"order\\\":\\\"5\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#fff\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}}}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":[\\\".owl-prev:hover\\\",\\\".owl-next:hover\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Arrows :hover\\\",\\\"order\\\":\\\"4\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background :hover\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#ded8d0\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#af9f8c\\\"}}}}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":\\\".owl-dot>span\\\",\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Paginator\\\",\\\"order\\\":\\\"1\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#444\\\"}}}}]},{\\\"name\\\":\\\"Carousel\\\",\\\"tag\\\":[\\\".owl-dot.active>span\\\",\\\".owl-dot:hover>span\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Paginator :hover\\\",\\\"order\\\":\\\"2\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#444\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#fff\\\"}}}}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":[\\\"[class*=border]\\\",\\\"hr\\\",\\\".separate-list li\\\",\\\".media\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}}}]},{\\\"name\\\":\\\"Preloader\\\",\\\"tag\\\":[\\\"#preloader>div\\\",\\\"#preloader>div>*\\\",\\\"#preloader>div::before\\\",\\\"#preloader>div::after\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#DDD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}}},{\\\"name\\\":\\\"BackgroundColor\\\",\\\"title\\\":\\\"Background color\\\",\\\"order\\\":\\\"6\\\",\\\"property\\\":\\\"background-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#DDD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#888\\\"}}}}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":\\\".border-x2\\\",\\\"elements\\\":[{\\\"name\\\":\\\"BorderColor\\\",\\\"title\\\":\\\"Border-x2 color\\\",\\\"property\\\":\\\"border-color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#D1D7DD\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.2)\\\"}}}}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":\\\".text-primary\\\",\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Text primary\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#AF9F8C\\\"},\\\"dark\\\":{\\\"value\\\":\\\"#AF9F8C\\\"}}}}]},{\\\"name\\\":\\\"Other\\\",\\\"tag\\\":[\\\".text-secondary\\\",\\\".breadcrumb-item + .breadcrumb-item::before\\\",\\\".breadcrumb-item.active\\\"],\\\"elements\\\":[{\\\"name\\\":\\\"FontColor\\\",\\\"title\\\":\\\"Text secondary\\\",\\\"property\\\":\\\"color\\\",\\\"media\\\":{\\\"default\\\":{\\\"light\\\":{\\\"value\\\":\\\"#A2AAB1\\\"},\\\"dark\\\":{\\\"value\\\":\\\"rgba(255,255,255,0.5)\\\"}}}}]}]}\",\"builderStyle\":\"/* default */\\n.light .cs-element.custom-buttons .wrapper   {\\n\\tfont-family: \'OpenSans\';\\n\\tfont-size: 14px;\\n\\tline-height: 1.5;\\n\\tcolor: #555;\\n}\\n.dark .cs-element.custom-buttons .wrapper   {\\n\\tfont-family: \'OpenSans\';\\n\\tfont-size: 14px;\\n\\tline-height: 1.5;\\n\\tcolor: #ffffff;\\n}\\n.light .cs-element.custom-buttons .wrapper .section-line, .light .cs-element.custom-buttons .wrapper .section-line-container::after {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .section-line, .dark .cs-element.custom-buttons .wrapper .section-line-container::after {\\n\\tborder-color: #888888;\\n}\\n.light .cs-element.custom-buttons .wrapper .bg-wrap, .light .cs-element.custom-buttons .wrapper .bg-default {\\n\\tbackground-color: #fff;\\n}\\n.dark .cs-element.custom-buttons .wrapper .bg-wrap, .dark .cs-element.custom-buttons .wrapper .bg-default {\\n\\tbackground-color: #232122;\\n}\\n.light .cs-element.custom-buttons .wrapper h1 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 100px;\\n\\tfont-weight: 200;\\n\\tfont-style: normal;\\n\\tcolor: #222;\\n}\\n.dark .cs-element.custom-buttons .wrapper h1 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 100px;\\n\\tfont-weight: 200;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper h2 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 50px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #222;\\n}\\n.dark .cs-element.custom-buttons .wrapper h2 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 50px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper h3 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 35px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #444;\\n}\\n.dark .cs-element.custom-buttons .wrapper h3 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 35px;\\n\\tfont-weight: 300;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper h4 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 18px;\\n\\tfont-weight: 400;\\n\\tfont-style: normal;\\n\\tcolor: #555;\\n}\\n.dark .cs-element.custom-buttons .wrapper h4 {\\n\\tfont-family: \'Montserrat\';\\n\\tfont-size: 18px;\\n\\tfont-weight: 400;\\n\\tfont-style: normal;\\n\\tcolor: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper a:not(.btn) {\\n}\\n.dark .cs-element.custom-buttons .wrapper a:not(.btn) {\\n}\\n.light .cs-element.custom-buttons .wrapper a:not(.btn):hover {\\n\\tcolor: #000000;\\n\\ttext-decoration: underline;\\n}\\n.dark .cs-element.custom-buttons .wrapper a:not(.btn):hover {\\n\\tcolor: #fff;\\n\\ttext-decoration: underline;\\n}\\n.light .cs-element.custom-buttons .wrapper .navbar-nav a {\\n\\tcolor: #777;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.dark .cs-element.custom-buttons .wrapper .navbar-nav a {\\n\\tcolor: #aaa;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.light .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link:hover, .light .cs-element.custom-buttons .wrapper .navbar-nav .nav-item:hover > a.nav-link, .light .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link.active {\\n\\tcolor: #222;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.dark .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link:hover, .dark .cs-element.custom-buttons .wrapper .navbar-nav .nav-item:hover > a.nav-link, .dark .cs-element.custom-buttons .wrapper .navbar-nav a.nav-link.active {\\n\\tcolor: #fff;\\n\\ttext-decoration: none;\\n\\tbackground-color: rgba(255,255,255,0);\\n}\\n.light .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link {\\n\\tcolor: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link {\\n\\tcolor: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .nav-tabs {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .nav-tabs {\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link:hover, .light .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link.active {\\n\\tcolor: #444;\\n\\tborder-color: #444;\\n}\\n.dark .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link:hover, .dark .cs-element.custom-buttons .wrapper .nav-tabs a.nav-link.active {\\n\\tcolor: #FFF;\\n\\tborder-color: #FFF;\\n}\\n.light .cs-element.custom-buttons .wrapper .pagination .page-link {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .pagination .page-link {\\n\\tborder-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .pagination .page-link:hover, .light .cs-element.custom-buttons .wrapper .pagination .page-link.active {\\n\\tborder-color: #D1D7DD;\\n\\tbackground-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .pagination .page-link:hover, .dark .cs-element.custom-buttons .wrapper .pagination .page-link.active {\\n\\tborder-color: #555;\\n\\tbackground-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 2px 2px 2px 2px;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 2px 2px 2px 2px;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary, .light .cs-element.custom-buttons .wrapper .badge-primary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary, .dark .cs-element.custom-buttons .wrapper .badge-primary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-primary:active, .light .cs-element.custom-buttons .wrapper .btn-primary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #998B7A;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-primary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #998B7A;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tcolor: #998B7A;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tcolor: #998B7A;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary, .light .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tborder-color: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary {\\n\\tborder-color: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-primary:active, .light .cs-element.custom-buttons .wrapper .btn-primary.active, .light .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tborder-color: #998B7A;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-primary.active, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-primary.active {\\n\\tborder-color: #998B7A;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary, .light .cs-element.custom-buttons .wrapper .badge-secondary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary, .dark .cs-element.custom-buttons .wrapper .badge-secondary {\\n\\tcolor: #FFF;\\n\\tbackground-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-secondary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #91989F;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-secondary.active {\\n\\tcolor: #FFF;\\n\\tbackground-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tcolor: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tcolor: #888;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tcolor: #91989F;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tcolor: #888;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tborder-color: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary {\\n\\tborder-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .btn-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-secondary.active, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .light .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tborder-color: #91989F;\\n}\\n.dark .cs-element.custom-buttons .wrapper .btn-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-secondary.active, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:hover, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary:active, .dark .cs-element.custom-buttons .wrapper .btn-outline-secondary.active {\\n\\tborder-color: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .form-group {\\n}\\n.dark .cs-element.custom-buttons .wrapper .form-group {\\n}\\n.light .cs-element.custom-buttons .wrapper .form-control, .light .cs-element.custom-buttons .wrapper .form-inline>.btn-link {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 0px 0px 1px 0px;\\n\\tborder-color: rgba(0,0,0,0.2);\\n}\\n.dark .cs-element.custom-buttons .wrapper .form-control, .dark .cs-element.custom-buttons .wrapper .form-inline>.btn-link {\\n\\tborder-radius: 0px 0px 0px 0px;\\n\\tborder-width: 0px 0px 1px 0px;\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .form-control::placeholder, .light .cs-element.custom-buttons .wrapper .form-control .placeholder {\\n\\tcolor: #aaa;\\n}\\n.dark .cs-element.custom-buttons .wrapper .form-control::placeholder, .dark .cs-element.custom-buttons .wrapper .form-control .placeholder {\\n\\tcolor: #aaa;\\n}\\n.light .cs-element.custom-buttons .wrapper input[type=checkbox]+.lbl::after, .light .cs-element.custom-buttons .wrapper input[type=radio]+.lbl::after {\\n\\tbackground-color: #A48F77;\\n}\\n.dark .cs-element.custom-buttons .wrapper input[type=checkbox]+.lbl::after, .dark .cs-element.custom-buttons .wrapper input[type=radio]+.lbl::after {\\n\\tbackground-color: #A48F77;\\n}\\n.light .cs-element.custom-buttons .wrapper svg.svg-default {\\n\\tfill: #555;\\n}\\n.dark .cs-element.custom-buttons .wrapper svg.svg-default {\\n\\tfill: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper svg.svg-primary {\\n\\tfill: #c3b6a5;\\n}\\n.dark .cs-element.custom-buttons .wrapper svg.svg-primary {\\n\\tfill: #c3b6a5;\\n}\\n.light .cs-element.custom-buttons .wrapper svg.svg-secondary {\\n\\tfill: #bbc3cc;\\n}\\n.dark .cs-element.custom-buttons .wrapper svg.svg-secondary {\\n\\tfill: #555;\\n}\\n.light .cs-element.custom-buttons .wrapper .gallery-item:not(.masonry-item), .light .cs-element.custom-buttons .wrapper .masonry-item.gallery-item .wrapper {\\n\\tbackground-color: #ffffff;\\n}\\n.dark .cs-element.custom-buttons .wrapper .gallery-item:not(.masonry-item), .dark .cs-element.custom-buttons .wrapper .masonry-item.gallery-item .wrapper {\\n\\tbackground-color: #232122;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-prev, .light .cs-element.custom-buttons .wrapper .owl-next {\\n\\tborder-color: #444;\\n\\tbackground-color: #fff;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-prev, .dark .cs-element.custom-buttons .wrapper .owl-next {\\n\\tborder-color: #fff;\\n\\tbackground-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-prev:hover, .light .cs-element.custom-buttons .wrapper .owl-next:hover {\\n\\tborder-color: #444;\\n\\tbackground-color: #ded8d0;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-prev:hover, .dark .cs-element.custom-buttons .wrapper .owl-next:hover {\\n\\tborder-color: #fff;\\n\\tbackground-color: #af9f8c;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-dot>span {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-dot>span {\\n\\tborder-color: #444;\\n}\\n.light .cs-element.custom-buttons .wrapper .owl-dot.active>span, .light .cs-element.custom-buttons .wrapper .owl-dot:hover>span {\\n\\tborder-color: #444;\\n}\\n.dark .cs-element.custom-buttons .wrapper .owl-dot.active>span, .dark .cs-element.custom-buttons .wrapper .owl-dot:hover>span {\\n\\tborder-color: #fff;\\n}\\n.light .cs-element.custom-buttons .wrapper [class*=border], .light .cs-element.custom-buttons .wrapper hr, .light .cs-element.custom-buttons .wrapper .separate-list li, .light .cs-element.custom-buttons .wrapper .media {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper [class*=border], .dark .cs-element.custom-buttons .wrapper hr, .dark .cs-element.custom-buttons .wrapper .separate-list li, .dark .cs-element.custom-buttons .wrapper .media {\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n#modal-container .modal-dialog.light-page #prev-preload .choice-element>div, #modal-container .modal-dialog.light-page #prev-preload .choice-element>div>*, #modal-container .modal-dialog.light-page #prev-preload .choice-element>div::before, #modal-container .modal-dialog.light-page #prev-preload .choice-element>div::after {\\n\\tborder-color: #DDD;\\n\\tbackground-color: #DDD;\\n}\\n#modal-container .modal-dialog.dark-page #prev-preload .choice-element>div, #modal-container .modal-dialog.dark-page #prev-preload .choice-element>div>*, #modal-container .modal-dialog.dark-page #prev-preload .choice-element>div::before, #modal-container .modal-dialog.dark-page #prev-preload .choice-element>div::after {\\n\\tborder-color: #888;\\n\\tbackground-color: #888;\\n}\\n.light .cs-element.custom-buttons .wrapper .border-x2 {\\n\\tborder-color: #D1D7DD;\\n}\\n.dark .cs-element.custom-buttons .wrapper .border-x2 {\\n\\tborder-color: rgba(255,255,255,0.2);\\n}\\n.light .cs-element.custom-buttons .wrapper .text-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.dark .cs-element.custom-buttons .wrapper .text-primary {\\n\\tcolor: #AF9F8C;\\n}\\n.light .cs-element.custom-buttons .wrapper .text-secondary, .light .cs-element.custom-buttons .wrapper .breadcrumb-item + .breadcrumb-item::before, .light .cs-element.custom-buttons .wrapper .breadcrumb-item.active {\\n\\tcolor: #A2AAB1;\\n}\\n.dark .cs-element.custom-buttons .wrapper .text-secondary, .dark .cs-element.custom-buttons .wrapper .breadcrumb-item + .breadcrumb-item::before, .dark .cs-element.custom-buttons .wrapper .breadcrumb-item.active {\\n\\tcolor: rgba(255,255,255,0.5);\\n}\\n\"}', NULL, '2020-01-30 19:12:46');
INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role`, `image`, `shop_description`, `shop_category_id`, `verification_status`, `ethereum_address`, `cover_image`, `message`, `address`, `phone`, `apiToken`, `user_own_site`, `created_at`, `updated_at`) VALUES
(5, 'Pranto roy', 'pranto', 'pranto@gmail.com', '$2a$10$SJjL8Oj6iblV3/d/win0Q.N2prYPCkR26lTxHUMDZNCTGOaWiNGDe', 2, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-30 09:01:43', '2019-12-01 22:30:19'),
(6, 'D&G', 'd&g', 'shakil@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 1, '/images/shirt_logo2.png', 'High quality Shirts are available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-30 09:02:38', '2019-06-30 09:02:38'),
(7, 'Nader Khan', 'nader', 'nader@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, '5hl8359ok60kxg3b', NULL, '2019-07-01 12:01:05', '2020-01-30 16:12:08'),
(8, 'Nike', 'nike', 'mamun@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 1, '/images/nike_logo.png', 'High quality Pants are available', 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-02 15:19:02', '2019-07-02 15:19:02'),
(9, 'Rush Order Tees', 'rushordertees', 'rush@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 1, '/uploads/1563260715780.png', 'Best place for shirt', 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-16 13:05:26', '2019-07-16 13:05:26'),
(10, 'Puma', 'puma', 'puma@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 1, '/uploads/1563463898190.png', 'All kind shoes ca be found', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 21:31:50', '2019-07-18 21:31:50'),
(11, 'Rajesh Roy', 'rajesh', 'rajesh@gmail.com', '$2y$10$lofoCXaHZjoesL2S65mMRegRfMjiamDjRS4tFmmbiWR7PNWQTlmYK', 2, '/uploads/1563464458239.jpeg', NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-18 21:38:39', '2019-10-09 00:06:43'),
(12, 'Admin', 'admin', 'admin@gmail.com', '$2a$10$EdygjOWBTaZsBI3ZT8zu2elmGtvxqICfaqfvHL3ga6Spu/lr9Gv7a', 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-02 11:53:48'),
(13, 'Kollol2', 'kollol2', 'kollol2@gmail.com', '$2a$10$1qUUONLsaAesLdvQ7xEc8O89EtaR4fb/6BKE/kkkGk3nAs1ln5HJW', 2, '/uploads/1569605901302.jpeg', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-27 18:19:16'),
(14, 'Kamran Ahmed', 'kamran', 's1@gmail.com', '$2a$10$rG6kxlzVLROvBlYRtlm3v.6qHqwhE1PhVBmW1v6zZ.3B92zlvRO0W', 2, NULL, NULL, NULL, 3, NULL, NULL, 'asdasd', NULL, NULL, NULL, NULL, '2019-10-26 18:14:01', '2019-12-03 18:37:40'),
(15, 'Amran Ahmed', 'amran', 's2@gmail.com', '$2a$10$D9W11F0JKtRmE3zdRVXbp.5v8Kjv/rNcvPK91MU3ai8Z9wVCiKqCW', 1, '/uploads/1572092206243.png', 'sdfsd', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-26 18:16:54', '2019-10-26 18:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `verification_forms`
--

CREATE TABLE `verification_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `telegram_username` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `address_for_tokens` varchar(255) DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL,
  `checked_on_date` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `img_passport` varchar(191) DEFAULT NULL,
  `img_national_id_front_side` varchar(191) DEFAULT NULL,
  `img_national_id_back_side` varchar(191) DEFAULT NULL,
  `img_driving_licence` varchar(191) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verification_forms`
--

INSERT INTO `verification_forms` (`id`, `first_name`, `last_name`, `email`, `phone`, `birth_date`, `telegram_username`, `address_line_1`, `address_line_2`, `city`, `state`, `country_id`, `zip_code`, `document_type`, `wallet_id`, `address_for_tokens`, `admin_note`, `checked_on_date`, `user_id`, `img_passport`, `img_national_id_front_side`, `img_national_id_back_side`, `img_driving_licence`, `created_at`, `updated_at`) VALUES
(1, 'Kollol', 'Chackroborty', 'kollol@gmail.com', '01444442423', '1994-10-12', 'dssd', 'adasd', 'asdas', 'sylhet', 'BD', 6, '3100', 'passport', 0, '', NULL, NULL, 3, '/uploads/1570539321028.jpeg', '', '', '', '2019-10-08 18:55:37', '2019-10-08 18:55:37'),
(2, 'Nazmul', 'Chaudory', 'nazmul@gmail.com', '01667848374', '1994-08-18', '', 'kldsfkskf', 'sdfsdfsdf', 'sylhet', 'Bangladesh', 6, '3100', 'national_card', 0, 'kasdkakdkaskdkaskdkaskdkasdjasdjasdjjasj', NULL, NULL, 4, '', '/uploads/1570551099354.png', '/uploads/1570551110076.png', '', '2019-10-08 22:12:12', '2019-10-08 22:12:12'),
(3, 'Rajesh', 'Roy', 'rajesh@gmail.com', '01534234948', '1994-10-05', 'rajesh', 'kkdkdaskdkasd', '', 'Kolkata', 'west bengol', 4, '3403', 'drivering_license', 0, '', NULL, NULL, 11, '', '', '', '/uploads/1570551904953.png', '2019-10-08 22:25:24', '2019-10-08 22:25:24'),
(5, 'Pranto', 'Protim Roy', 'pranto@gmail.com', '9281920293', '2019-10-17', '', 'sadasd', '', 'asd', 'sad', 2, '4564', 'passport', 0, '', NULL, '2019-12-01 22:30:19', 5, '/uploads/1570554399931.png', '', '', '', '2019-10-08 23:06:43', '2019-12-01 22:30:19'),
(6, 'Nader', 'Khan', 'nader@gmail.com', '23423432432', '2019-10-23', '', 'dfsdf', '', 'sdf', 'sdf', 4, '2323', 'passport', 0, '', NULL, '2019-10-27 18:20:08', 7, '', '', '', '', '2019-10-09 12:02:42', '2019-10-27 18:20:08'),
(11, 'asdas', 'asd', 'kamran@gmail.com', '0221232223', '2019-12-25', '', 'sdafdsf', 'sf', 'sdf', 'asfd', 6, '2121', 'drivering_license', 0, '', NULL, '2019-12-03 18:37:40', 14, '', '', '', '/uploads/1575222530306.jpeg', '2019-12-01 23:49:02', '2019-12-03 18:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `vlogs`
--

CREATE TABLE `vlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `text` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `feed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vlogs`
--

INSERT INTO `vlogs` (`id`, `title`, `video`, `text`, `user_id`, `category_id`, `feed_id`, `created_at`, `updated_at`) VALUES
(6, 'New vlog', '/videos/1569242938862.mp4', '<p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"color: rgb(0, 0, 0);\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0);\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p>', 4, 3, 69, '2019-09-23 18:49:42', '2019-09-23 18:49:42'),
(7, 'New Shirt', '/videos/1569243205223.mp4', '<p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><br></p>', 3, 4, 73, '2019-09-23 18:53:36', '2019-09-23 18:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `vlog_tags`
--

CREATE TABLE `vlog_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `vlog_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vlog_tags`
--

INSERT INTO `vlog_tags` (`id`, `tag`, `vlog_id`, `created_at`, `updated_at`) VALUES
(14, 'new', 6, '2019-09-23 18:49:42', '2019-09-23 18:49:42'),
(15, 'new 2019', 6, '2019-09-23 18:49:42', '2019-09-23 18:49:42'),
(16, '2019', 6, '2019-09-23 18:49:42', '2019-09-23 18:49:42'),
(19, 'shirt', 7, '2019-11-21 12:28:07', '2019-11-21 12:28:07'),
(20, 'new', 7, '2019-11-21 12:28:07', '2019-11-21 12:28:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `collages`
--
ALTER TABLE `collages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collages_user_id_foreign` (`user_id`);

--
-- Indexes for table `collage_linked_products`
--
ALTER TABLE `collage_linked_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collage_linked_products_i_foreign` (`i`),
  ADD KEY `collage_id` (`collage_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_feed_id_foreign` (`feed_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_products`
--
ALTER TABLE `custom_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_product_links`
--
ALTER TABLE `custom_product_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_product_links_linked_product_id_foreign` (`linked_product_id`),
  ADD KEY `custom_product_links_custom_product_id_foreign` (`custom_product_id`);

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feeds_lookbook_id_foreign` (`lookbook_id`),
  ADD KEY `feeds_collage_id_foreign` (`collage_id`),
  ADD KEY `feeds_blog_id_foreign` (`blog_id`),
  ADD KEY `feeds_vlog_id_foreign` (`vlog_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_follower_user_id_foreign` (`follower_user_id`),
  ADD KEY `follows_following_user_id_foreign` (`following_user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_feed_id_foreign` (`feed_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_colors_product_id_foreign` (`product_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sizes_product_id_foreign` (`product_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Indexes for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tags_product_id_foreign` (`product_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `status_images`
--
ALTER TABLE `status_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `store_subcategories`
--
ALTER TABLE `store_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_deduct_values`
--
ALTER TABLE `token_deduct_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_dollar_values`
--
ALTER TABLE `token_dollar_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_transactions`
--
ALTER TABLE `token_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `token_transactions_ibfk_2` (`feed_id`);

--
-- Indexes for table `token_values`
--
ALTER TABLE `token_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_ibfk_1` (`shop_category_id`);

--
-- Indexes for table `verification_forms`
--
ALTER TABLE `verification_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verification_forms_user_id_foreign` (`user_id`);

--
-- Indexes for table `vlogs`
--
ALTER TABLE `vlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vlogs_user_id_foreign` (`user_id`),
  ADD KEY `vlogs_category_id_foreign` (`category_id`);

--
-- Indexes for table `vlog_tags`
--
ALTER TABLE `vlog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vlog_tags_vlog_id_foreign` (`vlog_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `collages`
--
ALTER TABLE `collages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `collage_linked_products`
--
ALTER TABLE `collage_linked_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_products`
--
ALTER TABLE `custom_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `custom_product_links`
--
ALTER TABLE `custom_product_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status_images`
--
ALTER TABLE `status_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `store_subcategories`
--
ALTER TABLE `store_subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `token_deduct_values`
--
ALTER TABLE `token_deduct_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `token_dollar_values`
--
ALTER TABLE `token_dollar_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `token_transactions`
--
ALTER TABLE `token_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `token_values`
--
ALTER TABLE `token_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `verification_forms`
--
ALTER TABLE `verification_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vlogs`
--
ALTER TABLE `vlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vlog_tags`
--
ALTER TABLE `vlog_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collages`
--
ALTER TABLE `collages`
  ADD CONSTRAINT `collages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collage_linked_products`
--
ALTER TABLE `collage_linked_products`
  ADD CONSTRAINT `collage_linked_products_i_foreign` FOREIGN KEY (`i`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collage_linked_products_ibfk_1` FOREIGN KEY (`collage_id`) REFERENCES `collages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_feed_id_foreign` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `custom_products`
--
ALTER TABLE `custom_products`
  ADD CONSTRAINT `custom_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_product_links`
--
ALTER TABLE `custom_product_links`
  ADD CONSTRAINT `custom_product_links_custom_product_id_foreign` FOREIGN KEY (`custom_product_id`) REFERENCES `custom_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_product_links_linked_product_id_foreign` FOREIGN KEY (`linked_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feeds`
--
ALTER TABLE `feeds`
  ADD CONSTRAINT `feeds_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feeds_collage_id_foreign` FOREIGN KEY (`collage_id`) REFERENCES `collages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feeds_lookbook_id_foreign` FOREIGN KEY (`lookbook_id`) REFERENCES `custom_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feeds_vlog_id_foreign` FOREIGN KEY (`vlog_id`) REFERENCES `vlogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_follower_user_id_foreign` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_following_user_id_foreign` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_feed_id_foreign` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_colors_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_subcategories`
--
ALTER TABLE `product_subcategories`
  ADD CONSTRAINT `product_subcategories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_subcategories_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `statuses`
--
ALTER TABLE `statuses`
  ADD CONSTRAINT `statuses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status_images`
--
ALTER TABLE `status_images`
  ADD CONSTRAINT `status_images_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store_subcategories`
--
ALTER TABLE `store_subcategories`
  ADD CONSTRAINT `store_subcategories_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `store_subcategories_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `token_transactions`
--
ALTER TABLE `token_transactions`
  ADD CONSTRAINT `token_transactions_ibfk_2` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `token_transactions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`shop_category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `verification_forms`
--
ALTER TABLE `verification_forms`
  ADD CONSTRAINT `verification_forms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vlogs`
--
ALTER TABLE `vlogs`
  ADD CONSTRAINT `vlogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `vlogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vlog_tags`
--
ALTER TABLE `vlog_tags`
  ADD CONSTRAINT `vlog_tags_vlog_id_foreign` FOREIGN KEY (`vlog_id`) REFERENCES `vlogs` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
