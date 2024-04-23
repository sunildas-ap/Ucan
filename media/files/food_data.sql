-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2023 at 05:17 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add post', 8, 'add_post'),
(30, 'Can change post', 8, 'change_post'),
(31, 'Can delete post', 8, 'delete_post'),
(32, 'Can view post', 8, 'view_post'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add product_ category', 10, 'add_product_category'),
(38, 'Can change product_ category', 10, 'change_product_category'),
(39, 'Can delete product_ category', 10, 'delete_product_category'),
(40, 'Can view product_ category', 10, 'view_product_category'),
(41, 'Can add user_order', 11, 'add_user_order'),
(42, 'Can change user_order', 11, 'change_user_order'),
(43, 'Can delete user_order', 11, 'delete_user_order'),
(44, 'Can view user_order', 11, 'view_user_order'),
(45, 'Can add cart item', 12, 'add_cartitem'),
(46, 'Can change cart item', 12, 'change_cartitem'),
(47, 'Can delete cart item', 12, 'delete_cartitem'),
(48, 'Can view cart item', 12, 'view_cartitem'),
(49, 'Can add shipping', 13, 'add_shipping'),
(50, 'Can change shipping', 13, 'change_shipping'),
(51, 'Can delete shipping', 13, 'delete_shipping'),
(52, 'Can view shipping', 13, 'view_shipping'),
(53, 'Can add booking', 14, 'add_booking'),
(54, 'Can change booking', 14, 'change_booking'),
(55, 'Can delete booking', 14, 'delete_booking'),
(56, 'Can view booking', 14, 'view_booking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$Kg02OVyuVW4IPllgaaO0pq$D+ds/Uj25ziPRnRKOWMwdNudvgH2x9n7/uzp4961hzs=', '2023-10-17 07:07:42.005091', 1, 'admin', '', '', '', 1, 1, '2023-09-22 09:01:02.803713'),
(2, 'pbkdf2_sha256$600000$iZSJE2LtX25hAxMpITYhkb$cbrWK8sLbIC3JJ8vQ9drtkw9gSN0X7K8YFx/5XvO8oo=', '2023-09-11 09:32:32.528140', 0, 'ijass', '', '', '', 0, 1, '2023-09-11 09:32:31.104584'),
(3, 'pbkdf2_sha256$600000$TenyzX5IemwtLlqA34A8al$3saRHIyTfgPuuv2CxiTei3jcAc0O4+wEW/BMcmFMDls=', '2023-09-11 10:14:07.372654', 0, 'jishaa', '', '', '', 0, 1, '2023-09-11 10:14:05.958963'),
(4, 'pbkdf2_sha256$600000$NXWNhWxhJ8o8j8hhmhgqo6$OnNP6DjhxqeGCT5w4Hdxhbd+7DBYGZVCmwTfFiIYdmI=', '2023-09-12 04:09:29.057033', 0, 'jinu', '', '', '', 0, 1, '2023-09-12 04:09:27.383027'),
(5, 'pbkdf2_sha256$600000$gIuIC0u8XYlRumaOKcWSn7$7GyZ+gG41iYiasZluadtpgOV7AG3+AxWoqmx1hFpIos=', '2023-09-12 07:03:07.454958', 0, 'javan', '', '', '', 0, 1, '2023-09-12 06:32:05.131841'),
(6, 'pbkdf2_sha256$390000$uFdcMyILhCIkAeD3CFG1fw$IbI7Sbb7hyh6rmyPo7H5CfPHY7tNj/95EzTvEtMV8B0=', '2023-09-22 10:50:46.240220', 0, 'sunildas', '', '', '', 0, 1, '2023-09-22 10:45:47.536536');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'foodapp', 'booking'),
(12, 'foodapp', 'cartitem'),
(7, 'foodapp', 'category'),
(8, 'foodapp', 'post'),
(9, 'foodapp', 'product'),
(10, 'foodapp', 'product_category'),
(13, 'foodapp', 'shipping'),
(11, 'foodapp', 'user_order'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-09-22 08:55:12.337791'),
(2, 'auth', '0001_initial', '2023-09-22 08:55:13.262789'),
(3, 'admin', '0001_initial', '2023-09-22 08:55:13.505477'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-09-22 08:55:13.521101'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-22 08:55:13.536757'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-09-22 08:55:13.645935'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-09-22 08:55:13.731519'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-09-22 08:55:13.762503'),
(9, 'auth', '0004_alter_user_username_opts', '2023-09-22 08:55:13.778619'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-09-22 08:55:13.860947'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-09-22 08:55:13.860947'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-09-22 08:55:13.876954'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-09-22 08:55:13.912883'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-09-22 08:55:13.946368'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-09-22 08:55:13.994097'),
(16, 'auth', '0011_update_proxy_permissions', '2023-09-22 08:55:14.014378'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-09-22 08:55:14.044029'),
(18, 'foodapp', '0001_initial', '2023-09-22 08:55:14.215327'),
(19, 'foodapp', '0002_prodect_items', '2023-09-22 08:55:14.389769'),
(20, 'foodapp', '0003_remove_post_images_post_img', '2023-09-22 08:55:14.443521'),
(21, 'foodapp', '0004_reservation', '2023-09-22 08:55:14.478329'),
(22, 'foodapp', '0005_product_cartitem', '2023-09-22 08:55:14.679209'),
(23, 'foodapp', '0006_delete_cartitem', '2023-09-22 08:55:14.696229'),
(24, 'foodapp', '0007_cartitem_menuitem_delete_items_delete_prodect_and_more', '2023-09-22 08:55:14.939604'),
(25, 'foodapp', '0008_items_prodect_delete_cartitem_delete_menuitem_and_more', '2023-09-22 08:55:15.144269'),
(26, 'foodapp', '0009_menuitem', '2023-09-22 08:55:15.184133'),
(27, 'foodapp', '0010_delete_menuitem', '2023-09-22 08:55:15.195448'),
(28, 'foodapp', '0011_remove_product_description_remove_product_image_and_more', '2023-09-22 08:55:15.439403'),
(29, 'foodapp', '0012_product_category_remove_items_prodect_and_more', '2023-09-22 08:55:17.866919'),
(30, 'foodapp', '0013_order_user_order_cartitem', '2023-09-22 08:55:18.279505'),
(31, 'foodapp', '0014_rename_order_shipping', '2023-09-22 08:55:18.838380'),
(32, 'foodapp', '0015_booking_delete_reservation', '2023-09-22 08:55:18.906712'),
(33, 'sessions', '0001_initial', '2023-09-22 08:55:18.975625');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('b3i28rfzc594ecb8o08gtwpuyi6qnxmk', '.eJxVjDsOwyAQRO9CHSHAC5iU6X0GtMsnOIlAMnYV5e6xJRdJMc28N_NmHre1-K2nxc-RXZlkl9-OMDxTPUB8YL03Hlpdl5n4ofCTdj61mF630_07KNjLvlYJSKnRymRgxD06ajRZmiwsAcYhWAckDCiHkHIQJAdNzhkr3WB1Zp8vywg3IQ:1qk26g:GUMahbhicbO4BGQq_aQDMQPGDYcXObouaoFibxybR7E', '2023-10-07 12:51:34.349613'),
('dmm899hjuqhlta9quow0qabmsan5bn3p', '.eJxVjDsOgzAQRO-ydWRh4w92mT5nsHb9CSSRkbCpEHcPSDQU08x7MxsEXBq4DQQ4vj_A49pGv9a0-CmCAw63jjB8UzlB_GB5zyzMpS0TsVNhF63sNcf0e17u7WDEOh5rkSQJMRietBzwiIoKdeY6d4Ykxj4YK6nTUliUKYeOeK_IWm247Y3KsP8Bu587Tg:1qseB4:jhwbaAB-2Ep0rQk2_AzmfcOLGQFRq_z-8IypEPnruLM', '2023-10-31 07:07:42.009224'),
('g83zijiuplgeek6bvereztn860bj688f', 'eyJjYXJ0Ijp7IjEiOjF9fQ:1qsgSf:dHGFBCdWdZwwNy5h3EIw9XMbpHiqT67mZk43HSDDmX0', '2023-10-31 09:34:01.410687'),
('uh4okhu31tasiu2koliu96xdsvp52jgu', '.eJxVjEEOgyAQRe8y64YwAhJcdt8zmIEZim2jiejKeHdr4sbtf-_9DRLNC3Tb_oCe1qX0a5W5Hxg6aOG2RUpfGU_AHxrfk0rTuMxDVKeiLlrVa2L5PS_3dlColn-NBtHnRjjo7KLWzIzRB7TMwTROUJJmbAnJWG28sBjjoovWcgo5OdgPKcM7Zg:1qjdkE:JZRRiI4sfwvnmrrl-iEnwHFNqeTz9wbJO87KBs_xxQo', '2023-10-06 10:50:46.249200'),
('x7tl79no5vbnuml5hqheu3dbgu2dpkev', 'eyJjYXJ0Ijp7IjEiOjN9fQ:1r37IL:jfhYHH-Oo0HMMCsUme5KaQpgfuTpEiK3xS0VHyO8vAc', '2023-11-29 04:14:29.063316');

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_booking`
--

CREATE TABLE `foodapp_booking` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `persons` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_booking`
--

INSERT INTO `foodapp_booking` (`id`, `name`, `phone_number`, `email`, `persons`, `reservation_date`, `timestamp`) VALUES
(1, 'jisha', '2244778801', 'ijasmdigitz@gmail.com', 3, '2023-09-15', '2023-09-14 11:19:18.645275'),
(2, 'jisha', '2244778801', 'ijasmdigitz@gmail.com', 3, '2023-09-15', '2023-09-14 11:28:53.725859'),
(3, 'jisha', '2244778801', 'jisha@gmail.com', 3, '2023-09-05', '2023-09-15 04:09:02.913866'),
(4, 'emil', '2244778801', 'jisha@gmail.com', 3, '2023-09-03', '2023-09-15 04:20:43.549521'),
(5, 'emil', '2244778801', 'jisha@gmail.com', 2, '2023-09-24', '2023-09-15 04:47:23.878771'),
(6, 'ajmal', '8111992852', 'jisha@gmail.com', 4, '2023-09-09', '2023-09-15 05:04:59.119366'),
(7, 'abhirami', '9536425121', 'abhirami@gamil.com', 3, '2023-09-14', '2023-09-15 05:14:46.843831'),
(8, 'abhirami', '9536425121', 'abhirami@gamil.com', 3, '2023-09-14', '2023-09-15 05:23:11.703651'),
(9, 'knaya', '1233214560', 'kanya@gmail.com', 4, '2023-09-13', '2023-09-15 05:24:25.466332'),
(10, 'abhirami', '1233214560', 'abhirami@gamil.com', 5, '2023-09-13', '2023-09-15 05:29:00.557794'),
(11, 'manu', '2244778801', 'manu@gamil.com', 3, '2023-09-22', '2023-09-18 05:50:12.618821');

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_cartitem`
--

CREATE TABLE `foodapp_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `total_price` decimal(10,2) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_cartitem`
--

INSERT INTO `foodapp_cartitem` (`id`, `quantity`, `total_price`, `order_id`, `product_id`) VALUES
(1, 1, '79.00', 5, 2),
(2, 1, '29.00', 5, 4),
(3, 1, '79.00', 6, 2),
(4, 1, '29.00', 6, 4),
(5, 1, '69.00', 6, 3),
(6, 1, '79.00', 7, 2),
(7, 1, '29.00', 7, 4),
(8, 1, '69.00', 7, 3),
(9, 1, '79.00', 8, 2),
(10, 1, '29.00', 8, 4),
(11, 1, '69.00', 8, 3),
(12, 1, '79.00', 9, 2),
(13, 1, '29.00', 9, 4),
(14, 1, '69.00', 9, 3),
(15, 1, '79.00', 10, 2),
(16, 1, '29.00', 10, 4),
(17, 1, '69.00', 10, 3),
(18, 1, '79.00', 11, 2),
(19, 1, '29.00', 11, 4),
(20, 1, '69.00', 11, 3),
(21, 1, '79.00', 12, 2),
(22, 1, '29.00', 12, 4),
(23, 1, '69.00', 12, 3),
(24, 1, '79.00', 13, 2),
(25, 1, '29.00', 13, 4),
(26, 1, '69.00', 13, 3),
(27, 1, '79.00', 14, 2),
(28, 1, '29.00', 14, 4),
(29, 1, '69.00', 14, 3),
(30, 1, '79.00', 15, 2),
(31, 1, '29.00', 15, 4),
(32, 1, '69.00', 15, 3),
(33, 1, '79.00', 16, 2),
(34, 1, '29.00', 16, 4),
(35, 1, '69.00', 16, 3),
(36, 1, '79.00', 17, 2),
(37, 1, '29.00', 17, 4),
(38, 1, '69.00', 17, 3),
(39, 1, '79.00', 18, 2),
(40, 1, '29.00', 18, 4),
(41, 1, '69.00', 18, 3),
(42, 1, '79.00', 19, 2),
(43, 1, '29.00', 19, 4),
(44, 1, '69.00', 19, 3),
(45, 2, '158.00', 20, 2),
(46, 3, '87.00', 20, 4),
(47, 1, '59.00', 20, 1),
(48, 1, '69.00', 20, 3),
(49, 2, '158.00', 21, 2),
(50, 3, '87.00', 21, 4),
(51, 1, '69.00', 21, 3),
(52, 2, '158.00', 22, 2),
(53, 3, '87.00', 22, 4),
(54, 1, '69.00', 22, 3),
(55, 2, '158.00', 23, 2),
(56, 3, '87.00', 23, 4),
(57, 1, '69.00', 23, 3),
(58, 2, '158.00', 24, 2),
(59, 3, '87.00', 24, 4),
(60, 1, '69.00', 24, 3),
(61, 2, '158.00', 25, 2),
(62, 3, '87.00', 25, 4),
(63, 1, '69.00', 25, 3),
(64, 2, '158.00', 26, 2),
(65, 3, '87.00', 26, 4),
(66, 1, '69.00', 26, 3),
(67, 2, '158.00', 27, 2),
(68, 3, '87.00', 27, 4),
(69, 1, '69.00', 27, 3),
(70, 2, '158.00', 28, 2),
(71, 3, '87.00', 28, 4),
(72, 1, '69.00', 28, 3),
(73, 2, '158.00', 29, 2),
(74, 3, '87.00', 29, 4),
(75, 1, '69.00', 29, 3),
(76, 2, '158.00', 30, 2),
(77, 3, '87.00', 30, 4),
(78, 1, '69.00', 30, 3),
(79, 2, '158.00', 31, 2),
(80, 3, '87.00', 31, 4),
(81, 1, '69.00', 31, 3),
(82, 1, '59.00', 32, 1),
(83, 1, '79.00', 33, 2),
(84, 1, '59.00', 34, 1),
(85, 1, '59.00', 35, 1),
(86, 1, '59.00', 36, 1),
(87, 1, '59.00', 37, 1),
(88, 1, '59.00', 38, 1),
(89, 1, '79.00', 38, 2),
(90, 1, '69.00', 38, 3),
(91, 1, '29.00', 38, 4),
(92, 1, '59.00', 39, 1),
(93, 1, '79.00', 39, 2),
(94, 1, '69.00', 39, 3),
(95, 1, '29.00', 39, 4),
(96, 1, '59.00', 40, 1),
(97, 1, '79.00', 40, 2),
(98, 1, '59.00', 41, 1),
(99, 1, '59.00', 46, 1),
(100, 1, '59.00', 49, 1),
(101, 1, '59.00', 57, 1),
(102, 1, '29.00', 68, 4),
(103, 1, '59.00', 71, 1),
(104, 1, '59.00', 73, 1),
(105, 2, '118.00', 74, 1),
(106, 1, '59.00', 75, 1),
(107, 1, '59.00', 86, 1),
(108, 1, '59.00', 87, 1),
(109, 1, '59.00', 88, 1),
(110, 1, '69.00', 89, 3),
(111, 1, '59.00', 90, 1),
(112, 1, '79.00', 90, 2),
(113, 1, '69.00', 90, 3),
(114, 1, '29.00', 90, 4),
(115, 1, '59.00', 91, 1),
(116, 1, '69.00', 91, 3);

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_category`
--

CREATE TABLE `foodapp_category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `limit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_category`
--

INSERT INTO `foodapp_category` (`id`, `title`, `slug`, `limit`) VALUES
(1, 'about', '100', '100'),
(2, 'client', '100', '100'),
(3, 'top', '100', '100'),
(4, 'carosel', '100', '100'),
(5, 'offer', '100', '100'),
(6, 'carosel content', '100', '100');

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_post`
--

CREATE TABLE `foodapp_post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `discription` longtext NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_post`
--

INSERT INTO `foodapp_post` (`id`, `title`, `sub_title`, `discription`, `category_id`, `img`) VALUES
(1, 'We Are Feane', 'non', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All', 1, 'uploads/images/about-img_PMR65Tw.png'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'muhammed ijas', 'magna aliqua', 2, 'uploads/images/client2_r2GtOF8.jpg'),
(3, 'muhammed ijas', 'Mike Hamell', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 2, 'uploads/images/client1_hQrcdPk.jpg'),
(6, 'Tasty Thursdays', '20%', 'non', 5, 'uploads/images/o1_kJ0ySHi.jpg'),
(7, 'Pizza Days', '15%', 'non', 5, 'uploads/images/o2_NGlX9o4.jpg'),
(8, 'Fast Food Restaurant', 'Order Now', 'Doloremque, itaque aperiam facilis rerum, commodi, temporibus sapiente ad mollitia laborum quam quisquam esse error unde. Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos nihil ducimus libero ipsam.', 6, ''),
(9, 'Fast Food Restaurant', 'Order Now', 'Doloremque, itaque aperiam facilis rerum, commodi, temporibus sapiente ad mollitia laborum quam quisquam esse error unde. Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos nihil ducimus libero ipsam.', 6, ''),
(10, 'Fast Food Restaurant', 'order now', 'Doloremque, itaque aperiam facilis rerum, commodi, temporibus sapiente ad mollitia laborum quam quisquam esse error unde. Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos nihil ducimus libero ipsam.', 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_product`
--

CREATE TABLE `foodapp_product` (
  `id` bigint(20) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `price` decimal(8,0) NOT NULL,
  `content_type` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `discounted_price` decimal(5,0) NOT NULL,
  `offer_percentage` int(11) NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_product`
--

INSERT INTO `foodapp_product` (`id`, `title`, `price`, `content_type`, `description`, `discounted_price`, `offer_percentage`, `product_image`, `subtitle`, `product_category_id`) VALUES
(1, 'Delicious Pizza', '59', 'pizza', 'Veniam debitis quaerat officiis quasi cupiditate quo, quisquam velit, magnam voluptatem repellendus sed eaque', '20', 30, 'static/images/f1.png', 'Delicious Pizza', 2),
(2, 'Delicious Burger', '79', 'burger', 'Veniam debitis quaerat officiis quasi cupiditate quo, quisquam velit, magnam voluptatem repellendus sed eaque', '20', 35, 'static/images/f2.png', 'Delicious Burger', 2),
(3, 'Delicious Pasta', '69', 'pasta', 'Veniam debitis quaerat officiis quasi cupiditate quo, quisquam velit, magnam voluptatem repellendus sed eaqu', '20', 30, 'static/images/f4.png', 'Delicious Pasta', 2),
(4, 'French fries', '29', 'fries', 'Veniam debitis quaerat officiis quasi cupiditate quo, quisquam velit, magnam voluptatem repellendus sed eaque', '10', 7, 'static/images/f5.png', 'French fries', 2);

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_product_category`
--

CREATE TABLE `foodapp_product_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_product_category`
--

INSERT INTO `foodapp_product_category` (`id`, `name`) VALUES
(2, 'menu');

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_shipping`
--

CREATE TABLE `foodapp_shipping` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `pin_code` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_shipping`
--

INSERT INTO `foodapp_shipping` (`id`, `full_name`, `address`, `city`, `phone`, `pin_code`, `created_at`) VALUES
(1, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '673121', '2023-09-12 09:43:09.236971'),
(2, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '673121', '2023-09-12 09:46:44.521315'),
(3, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '673121', '2023-09-12 09:47:15.813085'),
(4, 'muhammed finas', 'edukki', 'adimaali', '1234567890', '673212', '2023-09-12 10:02:20.893641'),
(5, 'demo', 'ernakulam', 'kochi', '9876543210', '673212', '2023-09-12 10:18:07.401842'),
(6, 'jisha', 'ernakulam', 'kochi', '9656754158', '695028', '2023-09-12 10:23:45.961545'),
(7, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '673212', '2023-09-12 10:27:12.174085'),
(8, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '673121', '2023-09-12 11:15:34.976280'),
(9, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '673121', '2023-09-12 11:17:51.884035'),
(10, 'demo', 'ernakulam', 'kalpetta', '9876543210', '695028', '2023-09-12 11:31:33.633139'),
(11, 'demo', 'wayanad', 'adimaali', '8111992852', '695028', '2023-09-12 11:36:44.816744'),
(12, 'demo', 'wayanad', 'adimaali', '8111992852', '695028', '2023-09-12 11:36:50.182154'),
(13, 'demo', 'wayanad', 'adimaali', '8111992852', '695028', '2023-09-12 11:36:51.393882'),
(14, 'demo', 'wayanad', 'adimaali', '8111992852', '695028', '2023-09-12 11:36:51.945865'),
(15, 'test demo', 'kozikkode', 'kuttiyadi', '1212121212', '67359', '2023-09-13 04:45:08.220902'),
(16, 'test demo', 'kozikkode', 'kuttiyadi', '1212121212', '67359', '2023-09-13 04:45:14.242289'),
(17, 'test demo', 'kozikkode', 'kuttiyadi', '1212121212', '67359', '2023-09-13 04:48:53.832383'),
(18, 'demo', 'ernakulam', 'kochi', '8111992852', '673121', '2023-09-13 04:49:13.444777'),
(19, 'demo', 'ernakulam', 'kochi', '8111992852', '673121', '2023-09-13 04:49:15.273557'),
(20, 'demo', 'ernakulam', 'adimaali', '9876543210', '67359', '2023-09-13 05:05:23.376800'),
(21, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:24:46.244781'),
(22, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:24:50.440067'),
(23, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:35:16.447075'),
(24, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:36:05.478882'),
(25, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:36:08.112793'),
(26, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:36:30.072249'),
(27, 'jisha', 'ernakulam', 'kuttiyadi', '1212121212', '67359', '2023-09-13 05:36:31.511933'),
(28, 'muhammed ijas', 'ernakulam', 'kochi', '1234567890', '673121', '2023-09-13 05:36:47.729265'),
(29, 'demo', 'ernakulam', 'kalpetta', '8111992852', '673212', '2023-09-13 05:45:53.517062'),
(30, 'muhammed ijas', 'wayanad', 'kalpetta', '8111992852', '695028', '2023-09-13 06:01:50.037587'),
(31, 'demo', 'wayanad', 'kalpetta', '1234567890', '673212', '2023-09-13 06:21:00.878122'),
(32, 'manu', 'wayanad', 'kalpetta', '5111992852', '673121', '2023-09-13 09:43:42.004549'),
(33, 'jisha', 'ernakulam', 'kochi', '9656754158', '695028', '2023-09-13 10:13:48.854322'),
(34, 'demo', 'ernakulam', 'kalpetta', '9876543210', '673212', '2023-09-13 10:20:28.965462'),
(35, 'jisha', 'ernakulam', 'kochi', '9656754158', '695028', '2023-09-13 10:30:00.357869'),
(36, 'jisha', 'ernakulam', 'kochi', '9656754158', '695028', '2023-09-13 11:11:41.345435'),
(37, 'jisha', 'ernakulam', 'kuttiyadi', '5111992852', '673212', '2023-09-13 11:12:13.305709'),
(38, 'muhammed ijas', 'ernakulam', 'adimaali', '1212121212', '67359', '2023-09-14 04:32:19.787791'),
(39, 'muhammed ijas', 'ernakulam', 'adimaali', '1212121212', '67359', '2023-09-14 04:32:54.990762'),
(40, 'demo', 'ernakulam', 'kuttiyadi', '5111992852', '673121', '2023-09-14 04:33:32.624937'),
(41, 'muhammed ijas', 'ernakulam', 'kalpetta', '1212121212', '673121', '2023-09-14 05:02:07.780013'),
(42, 'muhammed ijas', 'ernakulam', 'kalpetta', '1212121212', '673121', '2023-09-14 05:02:09.386966'),
(43, 'muhammed ijas', 'ernakulam', 'kalpetta', '1212121212', '673121', '2023-09-14 05:02:10.054434'),
(44, 'muhammed ijas', 'ernakulam', 'kalpetta', '1212121212', '673121', '2023-09-14 05:02:10.247300'),
(45, 'muhammed ijas', 'ernakulam', 'kalpetta', '1212121212', '673121', '2023-09-14 05:02:10.675574'),
(46, 'muhammed ijas', 'ernakulam', 'adimaali', '5111992852', '67359', '2023-09-14 05:20:37.894584'),
(47, 'muhammed ijas', 'ernakulam', 'adimaali', '5111992852', '67359', '2023-09-14 05:20:40.292622'),
(48, 'muhammed ijas', 'ernakulam', 'adimaali', '5111992852', '67359', '2023-09-14 05:20:42.243859'),
(49, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:31.437408'),
(50, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:34.482341'),
(51, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:34.906493'),
(52, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:35.262525'),
(53, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:35.433627'),
(54, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:35.498951'),
(55, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:35.691559'),
(56, 'jishnu', 'wayanad', 'ambalavayal', '1515515115', '6732121', '2023-09-14 06:28:48.505987'),
(57, 'jisha', 'thiruvanthapuram', 'kochi', '5111992852', '67359', '2023-09-14 06:30:29.809304'),
(58, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:49.642858'),
(59, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:51.612594'),
(60, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:52.436514'),
(61, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:52.797717'),
(62, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:55.108771'),
(63, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:55.421047'),
(64, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:55.643658'),
(65, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:55.844322'),
(66, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:56.102823'),
(67, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '695028', '2023-09-14 06:40:56.318086'),
(68, 'demo', 'edukki', 'kochi', '8111992852', '67359', '2023-09-14 06:46:58.888725'),
(69, 'demo', 'edukki', 'kochi', '8111992852', '67359', '2023-09-14 06:47:01.021125'),
(70, 'demo', 'edukki', 'kochi', '8111992852', '67359', '2023-09-14 06:47:20.537437'),
(71, 'test demo', 'kozikkode', 'kochi', '5111992852', '673212', '2023-09-14 06:47:46.462451'),
(72, 'test demo', 'kozikkode', 'kochi', '5111992852', '673212', '2023-09-14 06:47:47.747940'),
(73, 'muhammed ijas', 'ernakulam', 'kalpetta', '8111992852', '67359', '2023-09-14 06:48:38.350377'),
(74, 'muhammed ijas', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 06:58:45.034649'),
(75, 'muhammed ijas', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:00:53.448692'),
(76, 'muhammed ijas', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:00:54.832407'),
(77, 'muhammed ijas', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:00:55.755861'),
(78, 'muhammed ijas', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:00:56.422710'),
(79, 'muhammed ajaz', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:05:10.233066'),
(80, 'muhammed ajaz', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:06:21.314716'),
(81, 'muhammed ajaz', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:06:54.199557'),
(82, 'muhammed ajaz', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:09:34.230373'),
(83, 'neymar', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:12:03.420125'),
(84, 'neymar', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:13:30.023989'),
(85, 'neymar', 'ernakulam', 'ambalavayal', '8111992852', '6732121', '2023-09-14 07:15:37.048584'),
(86, 'muhammed ijas', 'ernakulam', 'ambalavayal', '1212121212', '67359', '2023-09-14 08:38:53.073126'),
(87, 'test demo', 'calicut', 'koduvally', '3207602852', '8111', '2023-09-14 09:03:42.885843'),
(88, 'demo', 'kozikkode', 'kuttiyadi', '8111992852', '673121', '2023-09-14 09:06:55.767582'),
(89, 'demo', 'edukki', 'ambalavayal', '8111992852', '6732121', '2023-09-18 06:04:27.516800'),
(90, 'anjali', 'kannur', 'iritty', '8412236910', '673121', '2023-09-19 05:29:39.402878'),
(91, 'sunildasap@gmail.com', 'angadipuram,perinthalmanna,malappuram', 'perinthalmanna', '9995542503', '631245', '2023-09-22 10:46:24.221651');

-- --------------------------------------------------------

--
-- Table structure for table `foodapp_user_order`
--

CREATE TABLE `foodapp_user_order` (
  `id` bigint(20) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_details_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodapp_user_order`
--

INSERT INTO `foodapp_user_order` (`id`, `subtotal`, `shipping_details_id`, `user_id`) VALUES
(1, '0.00', 1, 5),
(2, '0.00', 2, 5),
(3, '0.00', 3, 5),
(4, '0.00', 4, 5),
(5, '0.00', 5, 5),
(6, '0.00', 6, 5),
(7, '0.00', 7, 5),
(8, '0.00', 8, 5),
(9, '177.00', 9, 5),
(10, '177.00', 10, 5),
(11, '177.00', 11, 5),
(12, '177.00', 12, 5),
(13, '177.00', 13, 5),
(14, '177.00', 14, 5),
(15, '177.00', 15, 5),
(16, '177.00', 16, 5),
(17, '177.00', 17, 5),
(18, '177.00', 18, 5),
(19, '177.00', 19, 5),
(20, '373.00', 20, 5),
(21, '314.00', 21, 5),
(22, '314.00', 22, 5),
(23, '314.00', 23, 5),
(24, '314.00', 24, 5),
(25, '314.00', 25, 5),
(26, '314.00', 26, 5),
(27, '314.00', 27, 5),
(28, '314.00', 28, 5),
(29, '314.00', 29, 5),
(30, '314.00', 30, 5),
(31, '314.00', 31, 5),
(32, '59.00', 32, 5),
(33, '79.00', 33, 5),
(34, '59.00', 34, 1),
(35, '59.00', 35, 1),
(36, '59.00', 36, 1),
(37, '59.00', 37, 1),
(38, '236.00', 38, 1),
(39, '236.00', 39, 1),
(40, '138.00', 40, 1),
(41, '59.00', 41, 1),
(42, '0.00', 42, 1),
(43, '0.00', 43, 1),
(44, '0.00', 44, 1),
(45, '0.00', 45, 1),
(46, '59.00', 46, 1),
(47, '0.00', 47, 1),
(48, '0.00', 48, 1),
(49, '59.00', 49, 1),
(50, '0.00', 50, 1),
(51, '0.00', 51, 1),
(52, '0.00', 52, 1),
(53, '0.00', 53, 1),
(54, '0.00', 54, 1),
(55, '0.00', 55, 1),
(56, '0.00', 56, 1),
(57, '59.00', 57, 1),
(58, '29.00', 68, 1),
(59, '0.00', 69, 1),
(60, '0.00', 70, 1),
(61, '59.00', 71, 1),
(62, '0.00', 72, 1),
(63, '59.00', 73, 1),
(64, '118.00', 74, 1),
(65, '59.00', 75, 1),
(66, '0.00', 76, 1),
(67, '0.00', 77, 1),
(68, '0.00', 78, 1),
(69, '0.00', 79, 1),
(70, '0.00', 80, 1),
(71, '0.00', 81, 1),
(72, '0.00', 82, 1),
(73, '0.00', 83, 1),
(74, '0.00', 84, 1),
(75, '0.00', 85, 1),
(76, '59.00', 86, 1),
(77, '59.00', 87, 1),
(78, '59.00', 88, 1),
(79, '69.00', 89, 1),
(80, '236.00', 90, 1),
(81, '128.00', 91, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `foodapp_booking`
--
ALTER TABLE `foodapp_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodapp_cartitem`
--
ALTER TABLE `foodapp_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodapp_cartitem_product_id_1a58a66d_fk_foodapp_product_id` (`product_id`),
  ADD KEY `foodapp_cartitem_order_id_8f7702b0_fk_foodapp_shipping_id` (`order_id`);

--
-- Indexes for table `foodapp_category`
--
ALTER TABLE `foodapp_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodapp_category_slug_ec9d2dc7` (`slug`);

--
-- Indexes for table `foodapp_post`
--
ALTER TABLE `foodapp_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodapp_post_category_id_e2350b19_fk_foodapp_category_id` (`category_id`);

--
-- Indexes for table `foodapp_product`
--
ALTER TABLE `foodapp_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodapp_product_product_category_id_ee511229_fk_foodapp_p` (`product_category_id`);

--
-- Indexes for table `foodapp_product_category`
--
ALTER TABLE `foodapp_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodapp_shipping`
--
ALTER TABLE `foodapp_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodapp_user_order`
--
ALTER TABLE `foodapp_user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodapp_user_order_user_id_10b51360_fk_auth_user_id` (`user_id`),
  ADD KEY `foodapp_user_order_shipping_details_id_0a3ea3d9_fk_foodapp_s` (`shipping_details_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `foodapp_booking`
--
ALTER TABLE `foodapp_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `foodapp_cartitem`
--
ALTER TABLE `foodapp_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `foodapp_category`
--
ALTER TABLE `foodapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `foodapp_post`
--
ALTER TABLE `foodapp_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `foodapp_product`
--
ALTER TABLE `foodapp_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `foodapp_product_category`
--
ALTER TABLE `foodapp_product_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `foodapp_shipping`
--
ALTER TABLE `foodapp_shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `foodapp_user_order`
--
ALTER TABLE `foodapp_user_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `foodapp_cartitem`
--
ALTER TABLE `foodapp_cartitem`
  ADD CONSTRAINT `foodapp_cartitem_order_id_8f7702b0_fk_foodapp_shipping_id` FOREIGN KEY (`order_id`) REFERENCES `foodapp_shipping` (`id`),
  ADD CONSTRAINT `foodapp_cartitem_product_id_1a58a66d_fk_foodapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `foodapp_product` (`id`);

--
-- Constraints for table `foodapp_post`
--
ALTER TABLE `foodapp_post`
  ADD CONSTRAINT `foodapp_post_category_id_e2350b19_fk_foodapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `foodapp_category` (`id`);

--
-- Constraints for table `foodapp_product`
--
ALTER TABLE `foodapp_product`
  ADD CONSTRAINT `foodapp_product_product_category_id_ee511229_fk_foodapp_p` FOREIGN KEY (`product_category_id`) REFERENCES `foodapp_product_category` (`id`);

--
-- Constraints for table `foodapp_user_order`
--
ALTER TABLE `foodapp_user_order`
  ADD CONSTRAINT `foodapp_user_order_shipping_details_id_0a3ea3d9_fk_foodapp_s` FOREIGN KEY (`shipping_details_id`) REFERENCES `foodapp_shipping` (`id`),
  ADD CONSTRAINT `foodapp_user_order_user_id_10b51360_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
