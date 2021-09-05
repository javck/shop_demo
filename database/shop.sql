-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-09-05 09:51:28
-- 伺服器版本： 10.4.13-MariaDB
-- PHP 版本： 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `shop`
--

-- --------------------------------------------------------

--
-- 資料表結構 `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `desc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `categories`
--

INSERT INTO `categories` (`id`, `title`, `pic`, `sort`, `enabled`, `desc`, `created_at`, `updated_at`) VALUES
(1, '名錶', 'categories/81+d6eSA0eL._UL1500_.jpg', 0, 1, NULL, '2021-09-05 06:35:00', '2021-09-05 06:35:00');

-- --------------------------------------------------------

--
-- 資料表結構 `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', '名稱', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', '電子郵件', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', '密碼', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', '創建於', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', '頭像', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', '角色', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', '名稱', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', '名稱', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', '創建於', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', '顯示名稱', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', '角色', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'title', 'text', '標題', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'pic', 'media_picker', '圖片', 1, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0},\"show_as_images\":true}', 3),
(25, 4, 'sort', 'number', '排序', 1, 1, 1, 1, 1, 1, '{}', 6),
(26, 4, 'enabled', 'checkbox', '是否啟用', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u555f\\u7528\",\"off\":\"\\u95dc\\u9589\",\"checked\":true}', 5),
(27, 4, 'desc', 'rich_text_box', '詳細資料', 0, 0, 1, 1, 1, 1, '{}', 4),
(28, 4, 'created_at', 'timestamp', '創建於', 0, 1, 1, 1, 0, 1, '{}', 7),
(29, 4, 'updated_at', 'timestamp', '更新於', 0, 0, 0, 0, 0, 0, '{}', 8),
(30, 5, 'id', 'text', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(31, 5, 'title', 'text', '標題', 1, 1, 1, 1, 1, 1, '{}', 4),
(32, 5, 'category_id', 'text', '分類 ID', 1, 1, 1, 1, 1, 1, '{}', 2),
(33, 5, 'price', 'number', '現價', 1, 1, 1, 1, 1, 1, '{\"min\":0}', 5),
(34, 5, 'pic', 'media_picker', '圖片', 0, 1, 1, 1, 1, 1, '{\"max\":10,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0},\"show_as_images\":true}', 7),
(35, 5, 'origin_price', 'number', '原價', 0, 1, 1, 1, 1, 1, '{\"min\":0}', 6),
(36, 5, 'enabled', 'checkbox', '是否啟用', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u555f\\u7528\",\"off\":\"\\u95dc\\u9589\",\"checked\":true}', 8),
(37, 5, 'sort', 'number', '排序', 1, 1, 1, 1, 1, 1, '{}', 9),
(38, 5, 'desc', 'rich_text_box', '商品說明', 0, 0, 1, 1, 1, 1, '{}', 10),
(39, 5, 'created_at', 'timestamp', '創建於', 0, 1, 1, 1, 0, 1, '{}', 11),
(40, 5, 'updated_at', 'timestamp', '更新於', 0, 0, 0, 0, 0, 0, '{}', 12),
(41, 5, 'item_belongsto_category_relationship', 'relationship', '分類', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', '用戶', '用戶', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(2, 'menus', 'menus', '側邊欄', '側邊欄', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(3, 'roles', 'roles', '角色', '角色', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(4, 'categories', 'categories', '分類', '分類集', 'voyager-window-list', 'App\\Models\\Category', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"sort\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-09-05 06:30:22', '2021-09-05 06:30:22'),
(5, 'items', 'items', '商品', '商品集', 'voyager-controller', 'App\\Models\\Item', NULL, NULL, NULL, 1, 1, '{\"order_column\":\"sort\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-05 06:33:47', '2021-09-05 06:38:43');

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_price` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sort` int(11) NOT NULL DEFAULT 0,
  `desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `items`
--

INSERT INTO `items` (`id`, `title`, `category_id`, `price`, `pic`, `origin_price`, `enabled`, `sort`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'sed', 1, 2087, '[\"items/card1.png\"]', 2296, 1, 1, '<p>Sed quia quia quidem quis delectus velit. Eveniet omnis ut pariatur aut.</p>', '2021-09-05 06:50:00', '2021-09-05 07:01:37'),
(2, 'ab', 1, 7433, '[\"items/81+d6eSA0eL._UL1500_.jpg\"]', 8176, 1, 1, '<p>Sapiente et quia quibusdam debitis consequuntur voluptates et. Numquam optio iusto tempore explicabo tenetur ut. Consequatur aliquam hic ipsum sequi ullam.</p>', '2021-09-05 06:50:00', '2021-09-05 07:01:53'),
(3, 'veritatis', 1, 539, '[\"items/popular1.png\"]', 593, 1, 1, '<p>Repellendus dicta est ipsum earum. Voluptatibus esse consequatur quia. Pariatur et doloremque qui necessitatibus.</p>', '2021-09-05 06:50:00', '2021-09-05 07:01:45'),
(4, 'commodi', 1, 2450, '[\"items/popular2.png\"]', 2695, 1, 1, '<p>Error quibusdam repudiandae fugiat doloremque at laborum repellat. Ipsum ut expedita neque assumenda eos deserunt autem. Sit qui vel aut delectus. Est et velit quos iure.</p>', '2021-09-05 06:50:00', '2021-09-05 07:02:00'),
(5, 'quo', 1, 6989, '[\"items/popular6.png\"]', 7688, 1, 1, '<p>Voluptatibus consequatur est quibusdam voluptatem. Dolore ut dolores tempore expedita rerum est enim aut. Velit possimus mollitia ut blanditiis ipsam.</p>', '2021-09-05 06:50:00', '2021-09-05 07:02:08'),
(6, 'atque', 1, 5352, '[\"items/popular4.png\"]', 5887, 1, 1, '<p>Ut nihil esse quam blanditiis. Laudantium sed voluptatem sunt nihil nesciunt. Veritatis quis saepe voluptatem esse numquam consequatur doloribus. Tempora doloribus porro commodi blanditiis eum quaerat enim. Est consectetur amet sit doloribus non.</p>', '2021-09-05 06:50:00', '2021-09-05 07:02:18'),
(7, 'laboriosam', 1, 5761, 'https://via.placeholder.com/640x480.png/0011dd?text=dolor', 6337, 1, 0, 'Earum iure vero tempore optio quos molestias consequatur. Modi ipsa nostrum aperiam hic vel neque. Distinctio repellat nulla mollitia a aut omnis.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(8, 'officia', 1, 8757, 'https://via.placeholder.com/640x480.png/00eeee?text=pariatur', 9633, 1, 0, 'Atque quos vitae quia et. Quas vero dolorum a dolorem et. Omnis et harum non est inventore illo id optio. Omnis voluptas dolorem consequatur sunt inventore soluta eos.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(9, 'sapiente', 1, 8414, 'https://via.placeholder.com/640x480.png/005577?text=earum', 9255, 1, 0, 'Illum consectetur fugiat officiis et cupiditate. Tenetur atque tempore numquam. Doloremque et perspiciatis ut repudiandae.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(10, 'est', 1, 1376, 'https://via.placeholder.com/640x480.png/00bb00?text=modi', 1514, 1, 0, 'Non iste ut iure reprehenderit. Quidem eum ullam voluptatem totam perspiciatis dolorem sed. Illo iste est voluptatem alias modi laudantium accusamus necessitatibus. Non quia voluptatem unde maxime laudantium laborum dolorem.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(11, 'molestiae', 1, 6800, 'https://via.placeholder.com/640x480.png/00dd22?text=beatae', 7480, 1, 0, 'Quas rerum repellat fuga aut vel in laudantium. Modi perspiciatis in ipsam explicabo. Velit quasi quos qui.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(12, 'nam', 1, 5130, 'https://via.placeholder.com/640x480.png/007722?text=et', 5643, 1, 0, 'Quia animi nihil reiciendis excepturi ut. Dolores veniam quibusdam quia quaerat. Sed quaerat ut adipisci aut.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(13, 'autem', 1, 2917, 'https://via.placeholder.com/640x480.png/00ddee?text=optio', 3209, 1, 0, 'Iure earum illum rem debitis temporibus. Qui minus ut dolor aut unde similique. Perspiciatis repellendus expedita est molestiae vel aut. Aliquam et incidunt aspernatur saepe.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(14, 'modi', 1, 733, 'https://via.placeholder.com/640x480.png/0055cc?text=sit', 806, 1, 0, 'Veniam enim dolorem nesciunt iste. Ut eum vero quam eum. Aut est quisquam error omnis et officia sunt rerum. Est neque quos vitae neque et reiciendis et.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(15, 'id', 1, 1571, 'https://via.placeholder.com/640x480.png/001199?text=quidem', 1728, 1, 0, 'Vel laboriosam iusto quos. Suscipit enim commodi ut. Voluptas alias excepturi tenetur atque atque quibusdam laboriosam.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(16, 'quos', 1, 1439, 'https://via.placeholder.com/640x480.png/0077cc?text=dolor', 1583, 1, 0, 'Perspiciatis nisi incidunt porro eos numquam vero in iusto. Nesciunt harum doloremque voluptatem est sunt. Omnis quia molestiae est et laborum.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(17, 'nihil', 1, 6858, 'https://via.placeholder.com/640x480.png/000099?text=quae', 7544, 1, 0, 'Facilis sit assumenda ratione deserunt et vitae. Sunt autem debitis unde eligendi dignissimos. Ipsam esse iure ipsum inventore. Vitae dolorum beatae et.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(18, 'quos', 1, 5223, 'https://via.placeholder.com/640x480.png/002211?text=qui', 5745, 1, 0, 'Voluptas laboriosam labore eum praesentium. Qui cum earum cupiditate perferendis aut. Ea cupiditate eligendi voluptate et quasi.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(19, 'quisquam', 1, 5447, 'https://via.placeholder.com/640x480.png/00ccdd?text=alias', 5992, 1, 0, 'Non earum iste id quas. Ratione cumque cumque consectetur impedit. Quod ullam laboriosam ut nobis esse perferendis voluptate.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(20, 'dolor', 1, 1746, 'https://via.placeholder.com/640x480.png/00eecc?text=maiores', 1921, 1, 0, 'Rerum optio magni soluta et. Provident molestiae magni modi quo quia temporibus eveniet. Velit iusto ut laboriosam asperiores voluptate.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(21, 'eum', 1, 5858, 'https://via.placeholder.com/640x480.png/00ddff?text=consectetur', 6444, 1, 0, 'Ut tempora velit quos et nesciunt sit. Non molestiae ducimus assumenda omnis aspernatur autem nulla. Soluta ullam rem suscipit aut. Numquam dolorem eum illum aspernatur nemo.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(22, 'qui', 1, 1507, 'https://via.placeholder.com/640x480.png/0033ee?text=voluptatem', 1658, 1, 0, 'Nulla molestias non deleniti expedita. Eum saepe veniam illum reiciendis corporis dolorum et. Recusandae debitis voluptatibus laborum. Voluptatem a vero laborum.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(23, 'rerum', 1, 1258, 'https://via.placeholder.com/640x480.png/007766?text=quis', 1384, 1, 0, 'Eius magnam tempora est dignissimos fuga quia quia blanditiis. Aliquid et sit et possimus.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(24, 'molestiae', 1, 6579, 'https://via.placeholder.com/640x480.png/006655?text=minima', 7237, 1, 0, 'Odio velit nam animi sed quibusdam praesentium enim commodi. Et ipsum eligendi in error et numquam et. Non porro delectus sed eum. Neque tenetur quod odio accusamus dolorem ut asperiores sit.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(25, 'minima', 1, 7324, 'https://via.placeholder.com/640x480.png/0033cc?text=inventore', 8056, 1, 0, 'Aliquid dolorem qui hic quisquam modi. Quod expedita voluptas quis molestias cumque. Itaque earum ipsam sed consequatur eos sed molestiae.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(26, 'voluptatibus', 1, 7626, 'https://via.placeholder.com/640x480.png/0099bb?text=officia', 8389, 1, 0, 'Assumenda sed ab fuga dolorem qui molestias blanditiis natus. Totam enim unde velit maxime. Et quasi ut eaque quasi eos reprehenderit.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(27, 'nam', 1, 4582, 'https://via.placeholder.com/640x480.png/005599?text=id', 5040, 1, 0, 'Quia ut in officiis error repudiandae. Incidunt provident sapiente est esse sit inventore. Sit rerum aut voluptas omnis. Amet error mollitia totam in nihil sit incidunt.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(28, 'et', 1, 5120, 'https://via.placeholder.com/640x480.png/000033?text=sit', 5632, 1, 0, 'Magni fugiat rerum incidunt est sit. Sint qui consequuntur ut perspiciatis id est est. Error placeat enim blanditiis commodi laboriosam ex dolorem aut.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(29, 'et', 1, 5307, 'https://via.placeholder.com/640x480.png/008833?text=fugit', 5838, 1, 0, 'Accusantium facere et voluptatem ut commodi natus corrupti. Delectus aut in voluptatem maxime quia. Eius enim corporis assumenda sed sequi sapiente.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(30, 'natus', 1, 1497, 'https://via.placeholder.com/640x480.png/00cc88?text=omnis', 1647, 1, 0, 'Commodi molestiae corporis impedit ea similique qui et illo. Quam consequuntur ut fuga. Ut doloremque numquam ducimus. Eos eaque dicta quidem quas voluptatem consequatur.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(31, 'qui', 1, 8287, 'https://via.placeholder.com/640x480.png/00dd55?text=ex', 9116, 1, 0, 'Aperiam aut eligendi dicta aliquid sapiente. Tempora quia impedit et explicabo. Dolorem quia assumenda similique magni ipsam. Quia voluptatem eaque aliquam et.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(32, 'exercitationem', 1, 8578, 'https://via.placeholder.com/640x480.png/00bb00?text=est', 9436, 1, 0, 'Enim sed corporis maxime deserunt blanditiis ex neque libero. Enim hic voluptas magnam odio ut quidem.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(33, 'fuga', 1, 516, 'https://via.placeholder.com/640x480.png/000000?text=id', 568, 1, 0, 'Minima nisi dolor doloremque dolorem sit. Quos architecto ut voluptatum est. Sit nihil nobis fugit aut non tempora qui porro. Enim rem earum adipisci in dicta unde non.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(34, 'ex', 1, 7164, 'https://via.placeholder.com/640x480.png/00ccbb?text=earum', 7880, 1, 0, 'Labore impedit consectetur libero occaecati. Distinctio asperiores tenetur natus cumque rerum. Enim soluta dolorum praesentium.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(35, 'eligendi', 1, 6127, 'https://via.placeholder.com/640x480.png/0033dd?text=consequatur', 6740, 1, 0, 'Ut ut est rerum expedita consectetur dolores molestias. Explicabo et quaerat ducimus atque placeat natus voluptates explicabo. Architecto nihil excepturi consequatur tempore molestiae. Numquam possimus totam culpa at optio natus quaerat molestiae.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(36, 'enim', 1, 8888, 'https://via.placeholder.com/640x480.png/005577?text=velit', 9777, 1, 0, 'Non voluptatum voluptate odio quia sit fuga. Itaque similique fugit illum. Molestiae rerum ut nihil consequatur. Ipsum porro labore repellendus corrupti.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(37, 'occaecati', 1, 4327, 'https://via.placeholder.com/640x480.png/006655?text=id', 4760, 1, 0, 'Et nihil mollitia et voluptatem necessitatibus. Similique et facere dolorem officiis accusantium. Cum eligendi natus est delectus deserunt porro nobis. Cupiditate dolores occaecati iusto. Error sed voluptas illo laudantium harum.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(38, 'beatae', 1, 4967, 'https://via.placeholder.com/640x480.png/00ee11?text=voluptatem', 5464, 1, 0, 'Ullam et aspernatur et suscipit ipsum quia corrupti molestiae. Omnis quibusdam occaecati at qui omnis. Doloribus id incidunt est distinctio. Culpa consectetur voluptas quis cupiditate aut corporis.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(39, 'est', 1, 2155, 'https://via.placeholder.com/640x480.png/00ccff?text=enim', 2371, 1, 0, 'Voluptatem dolorem natus necessitatibus maiores ut. Est cumque quis impedit voluptatem ea pariatur aliquam odit. Iure ea quis ipsam est ipsum iusto. Quos rerum ut adipisci accusantium eos.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(40, 'officiis', 1, 4922, 'https://via.placeholder.com/640x480.png/0022ff?text=architecto', 5414, 1, 0, 'Quia voluptatem beatae vel architecto dolore fugit placeat. Dignissimos minima debitis ratione dolor repellat impedit. Molestias placeat repudiandae culpa qui aut. Quis cupiditate exercitationem tempora numquam.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(41, 'maxime', 1, 749, 'https://via.placeholder.com/640x480.png/008822?text=tenetur', 824, 1, 0, 'Et dolorem voluptatem veritatis facere aperiam quas maxime. Nemo magnam atque provident aliquid. Laboriosam occaecati laborum itaque voluptas. Numquam temporibus officia nobis sed. Dolores sint est explicabo repellat ducimus autem beatae.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(42, 'similique', 1, 7140, 'https://via.placeholder.com/640x480.png/002211?text=voluptatem', 7854, 1, 0, 'Veniam aut rerum molestiae dolorem laboriosam voluptates harum. Libero esse sunt harum distinctio accusantium. Iusto quibusdam omnis voluptatem et eius eum. Error cumque officia ipsa.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(43, 'ea', 1, 4812, 'https://via.placeholder.com/640x480.png/00aa44?text=non', 5293, 1, 0, 'Dolorem iste nam laudantium perspiciatis suscipit atque quia. Porro sunt labore quam quia. Pariatur neque voluptas eos aut vero nihil ea magnam.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(44, 'neque', 1, 885, 'https://via.placeholder.com/640x480.png/00ff44?text=ratione', 974, 1, 0, 'Nisi saepe asperiores cum minima fuga quis voluptatem. Perferendis est vel incidunt velit. Exercitationem neque atque et architecto. At et expedita ab neque.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(45, 'et', 1, 5230, 'https://via.placeholder.com/640x480.png/009911?text=corrupti', 5753, 1, 0, 'Illum perferendis excepturi blanditiis modi error iure. At ut voluptates et est tenetur. Consequatur assumenda recusandae autem et autem dolorem.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(46, 'tenetur', 1, 6965, 'https://via.placeholder.com/640x480.png/00bb44?text=nemo', 7662, 1, 0, 'Sed qui enim soluta cumque voluptas ab vel deserunt. Ullam quas repellat est sapiente officiis est culpa. Voluptates et sapiente cum esse ex numquam.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(47, 'omnis', 1, 5437, 'https://via.placeholder.com/640x480.png/0077cc?text=cupiditate', 5981, 1, 0, 'Cum ut sint est reiciendis nihil esse. Harum recusandae deleniti eaque sit et. Velit odio aspernatur modi quisquam.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(48, 'rerum', 1, 8720, 'https://via.placeholder.com/640x480.png/003399?text=perspiciatis', 9592, 1, 0, 'Iure quis temporibus dolorem expedita sint consequatur porro. Aliquam rerum vero libero dolore distinctio architecto ut. Atque in et excepturi.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(49, 'error', 1, 658, 'https://via.placeholder.com/640x480.png/00aa55?text=sit', 724, 1, 0, 'Cum quod vero odio harum suscipit adipisci ea voluptates. Et voluptas autem quas quia qui autem nobis. Quas voluptas iure aliquid aut reprehenderit.', '2021-09-05 06:50:14', '2021-09-05 06:50:14'),
(50, 'cupiditate', 1, 6408, 'https://via.placeholder.com/640x480.png/0033ee?text=occaecati', 7049, 1, 0, 'Omnis iste accusamus voluptatem saepe dolorum ex. Assumenda aut molestiae vel enim soluta velit animi. Voluptatem nemo modi sequi voluptas ad corporis.', '2021-09-05 06:50:14', '2021-09-05 06:50:14');

-- --------------------------------------------------------

--
-- 資料表結構 `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-09-05 05:49:15', '2021-09-05 05:49:15');

-- --------------------------------------------------------

--
-- 資料表結構 `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, '控制面板', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.dashboard', NULL),
(2, 1, '媒體', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.media.index', NULL),
(3, 1, '用戶', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.users.index', NULL),
(4, 1, '角色', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.roles.index', NULL),
(5, 1, '工具', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-09-05 05:49:15', '2021-09-05 05:49:15', NULL, NULL),
(6, 1, '側邊欄管理', '', '_self', 'voyager-list', NULL, 5, 10, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.menus.index', NULL),
(7, 1, '資料庫', '', '_self', 'voyager-data', NULL, 5, 11, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.database.index', NULL),
(8, 1, '指南針', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.bread.index', NULL),
(10, 1, '設定', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-09-05 05:49:15', '2021-09-05 05:49:15', 'voyager.settings.index', NULL),
(11, 1, '分類集', '', '_self', 'voyager-window-list', NULL, NULL, 15, '2021-09-05 06:30:22', '2021-09-05 06:30:22', 'voyager.categories.index', NULL),
(12, 1, '商品集', '', '_self', 'voyager-controller', NULL, NULL, 16, '2021-09-05 06:33:47', '2021-09-05 06:33:47', 'voyager.items.index', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2021_09_05_140611_create_categories_table', 2),
(27, '2021_09_05_141059_create_items_table', 3);

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(2, 'browse_bread', NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(3, 'browse_database', NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(4, 'browse_media', NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(5, 'browse_compass', NULL, '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(6, 'browse_menus', 'menus', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(7, 'read_menus', 'menus', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(8, 'edit_menus', 'menus', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(9, 'add_menus', 'menus', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(10, 'delete_menus', 'menus', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(11, 'browse_roles', 'roles', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(12, 'read_roles', 'roles', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(13, 'edit_roles', 'roles', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(14, 'add_roles', 'roles', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(15, 'delete_roles', 'roles', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(16, 'browse_users', 'users', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(17, 'read_users', 'users', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(18, 'edit_users', 'users', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(19, 'add_users', 'users', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(20, 'delete_users', 'users', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(21, 'browse_settings', 'settings', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(22, 'read_settings', 'settings', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(23, 'edit_settings', 'settings', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(24, 'add_settings', 'settings', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(25, 'delete_settings', 'settings', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(26, 'browse_categories', 'categories', '2021-09-05 06:30:22', '2021-09-05 06:30:22'),
(27, 'read_categories', 'categories', '2021-09-05 06:30:22', '2021-09-05 06:30:22'),
(28, 'edit_categories', 'categories', '2021-09-05 06:30:22', '2021-09-05 06:30:22'),
(29, 'add_categories', 'categories', '2021-09-05 06:30:22', '2021-09-05 06:30:22'),
(30, 'delete_categories', 'categories', '2021-09-05 06:30:22', '2021-09-05 06:30:22'),
(31, 'browse_items', 'items', '2021-09-05 06:33:47', '2021-09-05 06:33:47'),
(32, 'read_items', 'items', '2021-09-05 06:33:47', '2021-09-05 06:33:47'),
(33, 'edit_items', 'items', '2021-09-05 06:33:47', '2021-09-05 06:33:47'),
(34, 'add_items', 'items', '2021-09-05 06:33:47', '2021-09-05 06:33:47'),
(35, 'delete_items', 'items', '2021-09-05 06:33:47', '2021-09-05 06:33:47');

-- --------------------------------------------------------

--
-- 資料表結構 `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '管理員', '2021-09-05 05:49:15', '2021-09-05 05:49:15'),
(2, 'user', '普通用戶', '2021-09-05 05:49:15', '2021-09-05 05:49:15');

-- --------------------------------------------------------

--
-- 資料表結構 `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', '網站標題', '網站標題', '', 'text', 1, 'Site'),
(2, 'site.description', '網站描述', '網站描述', '', 'text', 2, 'Site'),
(3, 'site.logo', '網站 Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', '後台背景圖像', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin 標題', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', '後台描述', '歡迎使用 Voyager - 不可錯過的 Laravel 後台管理框架', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', '後台圖標', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID （於後台控制面板使用）', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- 資料表結構 `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$t/yn4zeF6RhkfJzt4EJZBuWbUpKbrrzdDnxv5iwewV3XwuKu.Idra', '0dfPRsMEpUXD3QxHTpKbDbcGFl11tLLMuONQowRSm8etzhSu4giDL0lepTh1', NULL, '2021-09-05 05:49:53', '2021-09-05 05:49:53');

-- --------------------------------------------------------

--
-- 資料表結構 `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- 資料表索引 `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- 資料表索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- 資料表索引 `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- 資料表索引 `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- 資料表索引 `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- 資料表索引 `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- 資料表索引 `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- 資料表索引 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- 資料表索引 `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- 資料表索引 `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- 資料表索引 `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- 資料表的限制式 `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- 資料表的限制式 `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- 資料表的限制式 `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
