-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2019 at 04:07 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ip_camera`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_tbl`
--

CREATE TABLE `app_tbl` (
  `id` int(11) NOT NULL,
  `app_id` varchar(64) NOT NULL,
  `app_name` varchar(64) NOT NULL,
  `app_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_tbl`
--

INSERT INTO `app_tbl` (`id`, `app_id`, `app_name`, `app_user_id`, `created`) VALUES
(1, '001', 'Test camera', 1, '2019-05-25 14:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-05-25 10:14:24.631982'),
(2, 'auth', '0001_initial', '2019-05-25 10:14:24.821531'),
(3, 'admin', '0001_initial', '2019-05-25 10:14:25.336206'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-05-25 10:14:25.515726'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-05-25 10:14:25.532680'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-05-25 10:14:25.651320'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-05-25 10:14:25.709748'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-05-25 10:14:25.775536'),
(9, 'auth', '0004_alter_user_username_opts', '2019-05-25 10:14:25.789504'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-05-25 10:14:25.842084'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-05-25 10:14:25.848039'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-05-25 10:14:25.864995'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-05-25 10:14:25.928560'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-05-25 10:14:25.996903'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-05-25 10:14:26.063304'),
(16, 'auth', '0011_update_proxy_permissions', '2019-05-25 10:14:26.084247'),
(17, 'hello', '0001_initial', '2019-05-25 10:14:26.118160');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`, `created`, `last_login`) VALUES
('0gym6o4nso0y7sbvx5e2igz479up9kvk', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-07-21 10:32:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('5zzke6ahz115igt4zasv2c1ghvkgapvm', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-18 18:01:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('8pmcjs6sn4njpajjk6vjzs2invvmj6tx', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-30 13:41:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('hd3yxu81qpisqk15661o528zxgly12jd', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-20 13:51:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('peqvg35332wwyjgn9qg0ellu9eavpxor', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-08 13:30:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('pzxd611qtuwckv4dwgipn706c1mmxh27', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-20 14:20:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('qrwemuwuaztct6377zl52t5w3q93r7yh', 'OTA5OGE2NDkxYmVhNDE1YTM4NTZmZDY1MDNhODdmMmM1M2FhZGNiMzp7InB3ZCI6IjEyMyIsIjAiOiJzaGVoYW4iLCJlbWFpbCI6InNoZWhhbiJ9', '2019-06-16 18:13:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('vimdzgso2h8v5esak4eeqvj3nlkwnxd7', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-30 15:15:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('w9dca9pczn80ux10a67mvmngauyw45wj', 'MDZmYTI4NzRhNGQ2YWQ1MTA3NDA4NzU0ZjZjZjFjMTVhNWJhMjM4Njp7fQ==', '2019-06-21 14:26:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('zw7nld7fv921em5zhoe8y68r6f52c9j2', 'M2E2ZmIzMTNlZmEyMGQyNzk3ZmZiYmJkN2YxMGI5NmM2MDI3ZTUzZDp7ImVtYWlsIjoic2hlaGFuIn0=', '2019-06-19 14:14:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `image_data`
--

CREATE TABLE `image_data` (
  `image_id` int(11) NOT NULL,
  `app_id` varchar(256) NOT NULL,
  `image_name` varchar(50) NOT NULL,
  `image_capture` datetime NOT NULL,
  `image_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_path` varchar(128) NOT NULL,
  `faces` tinyint(1) NOT NULL DEFAULT '0',
  `img_state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image_data`
--

INSERT INTO `image_data` (`image_id`, `app_id`, `image_name`, `image_capture`, `image_created`, `image_path`, `faces`, `img_state`) VALUES
(55, '001', 'photo_2019-05-18_19-01.jpg', '2019-06-05 19:01:00', '2019-05-27 00:07:51', './hello/static/images/camera/read/', 1, 2),
(56, '001', 'photo_2019-05-18_19-55.jpg', '2019-05-18 19:55:00', '2019-05-27 00:07:52', './hello/static/images/camera/read/', 0, 1),
(63, '001', 'photo_2019-06-9_19-06.jpg', '2019-06-09 19:06:00', '2019-06-09 19:06:35', './hello/static/images/camera/read/', 0, 1),
(64, '001', 'photo_2019-06-9_19-10.jpg', '2019-06-09 19:10:00', '2019-06-09 19:10:58', './hello/static/images/camera/read/', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `phone_battery_tbl`
--

CREATE TABLE `phone_battery_tbl` (
  `id` int(11) NOT NULL,
  `camera_id` int(11) NOT NULL,
  `battery_level` int(11) NOT NULL,
  `data_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `app_id` varchar(20) NOT NULL DEFAULT '001',
  `ip_address` varchar(40) NOT NULL DEFAULT '192.168.1.1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phone_battery_tbl`
--

INSERT INTO `phone_battery_tbl` (`id`, `camera_id`, `battery_level`, `data_create`, `app_id`, `ip_address`) VALUES
(1, 1, 40, '2019-06-03 22:18:42', '001', '192.168.1.1:8080'),
(2, 2, 50, '2019-06-03 22:18:53', '001', '192.168.1.1:8080'),
(3, 1, 60, '2019-06-03 22:19:02', '001', '192.168.1.1:8080'),
(4, 1, 10, '2019-06-05 20:20:36', '001', '192.168.1.1:8080'),
(5, 10, 54, '2019-06-05 20:29:26', '001', '192.168.1.2'),
(6, 10, 54, '2019-06-05 20:30:24', '001', '192.168.1.2'),
(7, 8, 60, '2019-06-05 21:51:08', '001', '192.168.1.6'),
(8, 8, 65, '2019-06-05 21:56:07', '001', '192.168.1.6'),
(9, 8, 72, '2019-06-05 22:01:07', '001', '192.168.1.6'),
(10, 8, 71, '2019-06-05 22:06:07', '001', '192.168.1.6'),
(11, 8, 70, '2019-06-05 22:11:09', '001', '192.168.1.6'),
(12, 8, 69, '2019-06-05 22:16:10', '001', '192.168.1.6'),
(13, 8, 68, '2019-06-05 22:21:15', '001', '192.168.1.6'),
(14, 8, 36, '2019-06-05 23:24:53', '001', '192.168.1.6'),
(15, 8, 39, '2019-06-05 23:29:54', '001', '192.168.1.6'),
(16, 8, 42, '2019-06-05 23:34:53', '001', '192.168.1.6'),
(17, 8, 45, '2019-06-05 23:39:53', '001', '192.168.1.6'),
(18, 8, 48, '2019-06-05 23:44:54', '001', '192.168.1.6'),
(19, 8, 52, '2019-06-05 23:49:53', '001', '192.168.1.6'),
(20, 8, 55, '2019-06-05 23:54:55', '001', '192.168.1.6'),
(21, 10, 62, '2019-06-06 19:33:29', '001', '192.168.1.4'),
(22, 10, 62, '2019-06-06 19:49:15', '001', '192.168.1.4'),
(23, 8, 31, '2019-06-06 20:09:17', '001', '192.168.1.5'),
(24, 8, 30, '2019-06-06 20:14:18', '001', '192.168.1.5'),
(25, 8, 30, '2019-06-06 20:19:17', '001', '192.168.1.5'),
(26, 8, 30, '2019-06-06 20:24:18', '001', '192.168.1.5'),
(27, 8, 30, '2019-06-06 20:29:18', '001', '192.168.1.5'),
(28, 8, 29, '2019-06-06 20:34:18', '001', '192.168.1.5'),
(29, 8, 29, '2019-06-06 20:39:18', '001', '192.168.1.5'),
(30, 8, 29, '2019-06-06 20:44:18', '001', '192.168.1.5'),
(31, 8, 30, '2019-06-06 21:40:08', '001', '192.168.1.5'),
(32, 8, 30, '2019-06-06 21:45:08', '001', '192.168.1.5'),
(33, 8, 26, '2019-06-06 21:50:08', '001', '192.168.1.5'),
(34, 8, 26, '2019-06-06 21:55:08', '001', '192.168.1.5'),
(35, 8, 26, '2019-06-06 22:00:08', '001', '192.168.1.5'),
(36, 8, 25, '2019-06-06 22:05:09', '001', '192.168.1.5'),
(37, 8, 25, '2019-06-06 22:10:09', '001', '192.168.1.5'),
(38, 8, 25, '2019-06-06 22:15:09', '001', '192.168.1.5'),
(39, 8, 25, '2019-06-06 22:20:09', '001', '192.168.1.5'),
(40, 8, 25, '2019-06-06 22:25:09', '001', '192.168.1.5'),
(41, 8, 24, '2019-06-06 22:30:09', '001', '192.168.1.5'),
(42, 10, 79, '2019-06-07 19:56:33', '001', '192.168.1.3'),
(43, 10, 79, '2019-06-07 19:57:29', '001', '192.168.1.3'),
(44, 10, 75, '2019-06-07 22:11:28', '001', '192.168.1.3'),
(45, 10, 75, '2019-06-07 22:14:02', '001', '192.168.1.3'),
(46, 10, 77, '2019-06-07 22:19:02', '001', '192.168.1.3'),
(47, 10, 78, '2019-06-07 22:24:02', '001', '192.168.1.3'),
(48, 10, 80, '2019-06-07 22:29:02', '001', '192.168.1.3'),
(49, 10, 82, '2019-06-07 22:34:02', '001', '192.168.1.3'),
(50, 10, 84, '2019-06-07 22:39:02', '001', '192.168.1.3'),
(51, 10, 84, '2019-06-07 22:44:03', '001', '192.168.1.3'),
(52, 8, 38, '2019-06-08 21:22:21', '001', '192.168.1.8'),
(53, 8, 38, '2019-06-08 21:27:21', '001', '192.168.1.8'),
(54, 8, 37, '2019-06-08 21:32:21', '001', '192.168.1.8'),
(55, 8, 37, '2019-06-08 21:42:21', '001', '192.168.1.8'),
(56, 8, 37, '2019-06-08 21:47:22', '001', '192.168.1.8'),
(57, 8, 36, '2019-06-08 21:52:22', '001', '192.168.1.8'),
(58, 8, 36, '2019-06-08 21:57:22', '001', '192.168.1.8'),
(59, 8, 36, '2019-06-08 22:02:22', '001', '192.168.1.8'),
(60, 8, 36, '2019-06-08 22:07:22', '001', '192.168.1.8'),
(61, 8, 35, '2019-06-08 22:12:22', '001', '192.168.1.8'),
(62, 8, 35, '2019-06-08 22:17:22', '001', '192.168.1.8'),
(63, 8, 35, '2019-06-08 22:22:23', '001', '192.168.1.8'),
(64, 8, 35, '2019-06-08 22:27:22', '001', '192.168.1.8'),
(65, 8, 34, '2019-06-08 22:32:23', '001', '192.168.1.8'),
(66, 8, 34, '2019-06-08 22:37:23', '001', '192.168.1.8'),
(67, 8, 34, '2019-06-08 22:42:23', '001', '192.168.1.8'),
(68, 8, 34, '2019-06-08 22:47:23', '001', '192.168.1.8'),
(69, 8, 33, '2019-06-08 22:52:24', '001', '192.168.1.8'),
(70, 8, 33, '2019-06-08 22:57:24', '001', '192.168.1.8'),
(71, 1, 20, '2019-06-16 18:48:39', '001', '100'),
(72, 1, 109, '2019-06-16 19:10:29', '001', '100'),
(73, 1, 109, '2019-06-16 19:10:39', '001', '100'),
(74, 1, 109, '2019-06-16 19:10:49', '001', '100'),
(75, 1, 109, '2019-06-16 19:10:50', '001', '100'),
(76, 1, 109, '2019-06-16 19:11:00', '001', '100'),
(77, 1, 109, '2019-06-16 19:11:10', '001', '100'),
(78, 1, 109, '2019-06-16 19:11:20', '001', '100'),
(79, 1, 95, '2019-06-16 19:12:31', '001', '100'),
(80, 1, 102, '2019-06-16 19:12:41', '001', '100'),
(81, 1, 109, '2019-06-16 19:15:21', '001', '100'),
(82, 1, 109, '2019-06-16 19:15:31', '001', '100'),
(83, 1, 109, '2019-06-16 19:15:41', '001', '100'),
(84, 1, 109, '2019-06-16 19:15:51', '001', '100'),
(85, 1, 109, '2019-06-16 19:17:35', '001', '100'),
(86, 1, 102, '2019-06-16 19:19:40', '001', '100'),
(87, 1, 104, '2019-06-16 19:20:40', '001', '100'),
(88, 1, 104, '2019-06-16 19:21:41', '001', '100'),
(89, 1, 96, '2019-06-16 19:22:41', '001', '100'),
(90, 1, 103, '2019-06-16 19:23:41', '001', '100'),
(91, 1, 95, '2019-06-16 19:24:41', '001', '100'),
(92, 1, 97, '2019-06-16 19:25:41', '001', '100'),
(93, 1, 97, '2019-06-16 19:26:41', '001', '100'),
(94, 1, 97, '2019-06-16 19:27:41', '001', '100'),
(95, 1, 103, '2019-06-16 19:28:41', '001', '100'),
(96, 1, 103, '2019-06-16 19:29:41', '001', '100'),
(97, 1, 103, '2019-06-16 19:30:42', '001', '100'),
(98, 1, 103, '2019-06-16 19:31:42', '001', '100'),
(99, 1, 103, '2019-06-16 19:32:42', '001', '100'),
(100, 1, 103, '2019-06-16 19:33:42', '001', '100'),
(101, 1, 96, '2019-06-16 19:34:42', '001', '100'),
(102, 1, 103, '2019-06-16 19:35:42', '001', '100'),
(103, 1, 103, '2019-06-16 19:36:42', '001', '100'),
(104, 1, 96, '2019-06-16 19:37:42', '001', '100'),
(105, 1, 103, '2019-06-16 19:38:42', '001', '100'),
(106, 1, 103, '2019-06-16 19:39:42', '001', '100'),
(107, 1, 91, '2019-06-16 19:40:43', '001', '100'),
(108, 1, 90, '2019-06-16 19:41:43', '001', '100'),
(109, 1, 89, '2019-06-16 19:42:43', '001', '100'),
(110, 1, 79, '2019-06-16 19:43:43', '001', '100'),
(111, 1, 87, '2019-06-16 19:44:43', '001', '100'),
(112, 1, 85, '2019-06-16 19:45:43', '001', '100'),
(113, 1, 89, '2019-06-16 19:46:43', '001', '100'),
(114, 1, 89, '2019-06-16 19:47:43', '001', '100'),
(115, 1, 88, '2019-06-16 19:48:43', '001', '100'),
(116, 1, 89, '2019-06-16 19:49:44', '001', '100'),
(117, 1, 80, '2019-06-16 19:50:44', '001', '100'),
(118, 1, 89, '2019-06-16 19:51:44', '001', '100'),
(119, 1, 88, '2019-06-16 19:52:44', '001', '100'),
(120, 1, 86, '2019-06-16 19:53:44', '001', '100'),
(121, 1, 78, '2019-06-16 19:54:45', '001', '100'),
(122, 1, 87, '2019-06-16 19:55:45', '001', '100'),
(123, 1, 87, '2019-06-16 19:56:45', '001', '100'),
(124, 1, 87, '2019-06-16 19:57:45', '001', '100'),
(125, 1, 87, '2019-06-16 19:58:45', '001', '100'),
(126, 1, 86, '2019-06-16 19:59:45', '001', '100'),
(127, 1, 86, '2019-06-16 20:00:46', '001', '100'),
(128, 1, 75, '2019-06-16 20:01:46', '001', '100'),
(129, 1, 85, '2019-06-16 20:02:46', '001', '100'),
(130, 1, 85, '2019-06-16 20:03:46', '001', '100'),
(131, 1, 83, '2019-06-16 20:04:46', '001', '100'),
(132, 1, 74, '2019-06-16 20:05:46', '001', '100'),
(133, 1, 85, '2019-06-16 20:06:46', '001', '100'),
(134, 1, 84, '2019-06-16 20:07:47', '001', '100'),
(135, 1, 73, '2019-06-16 20:08:47', '001', '100'),
(136, 1, 84, '2019-06-16 20:09:47', '001', '100'),
(137, 1, 84, '2019-06-16 20:10:47', '001', '100'),
(138, 1, 84, '2019-06-16 20:11:47', '001', '100'),
(139, 1, 71, '2019-06-16 20:12:47', '001', '100');

-- --------------------------------------------------------

--
-- Table structure for table `recognize_image`
--

CREATE TABLE `recognize_image` (
  `rec_id` int(11) NOT NULL,
  `img_id` int(11) NOT NULL,
  `rec_name` varchar(64) NOT NULL,
  `name_update` varchar(64) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recognize_image`
--

INSERT INTO `recognize_image` (`rec_id`, `img_id`, `rec_name`, `name_update`, `update_time`) VALUES
(13, 55, 'adrian', '2019-05-27 20:08:52', '2019-05-27 00:07:51'),
(14, 56, 'new', NULL, '2019-05-27 20:32:19'),
(15, 64, 'adrian', NULL, '2019-06-09 19:10:58');

-- --------------------------------------------------------

--
-- Table structure for table `state_tbl`
--

CREATE TABLE `state_tbl` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(20) NOT NULL,
  `state_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_tbl`
--

INSERT INTO `state_tbl` (`state_id`, `state_name`, `state_created`) VALUES
(0, 'MOTION', '2019-05-25 21:36:10'),
(1, 'UNKNOWN', '2019-05-25 21:36:40'),
(2, 'DETECTED', '2019-05-25 21:36:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `user_name`, `created`, `is_deleted`) VALUES
(1, 'shehan', '123', 'shehan', '2019-05-21 19:50:48', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_tbl`
--
ALTER TABLE `app_tbl`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `django_session_c25c2c28` (`expire_date`);

--
-- Indexes for table `image_data`
--
ALTER TABLE `image_data`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `phone_battery_tbl`
--
ALTER TABLE `phone_battery_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recognize_image`
--
ALTER TABLE `recognize_image`
  ADD PRIMARY KEY (`rec_id`);

--
-- Indexes for table `state_tbl`
--
ALTER TABLE `state_tbl`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_tbl`
--
ALTER TABLE `app_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `image_data`
--
ALTER TABLE `image_data`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `phone_battery_tbl`
--
ALTER TABLE `phone_battery_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `recognize_image`
--
ALTER TABLE `recognize_image`
  MODIFY `rec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
