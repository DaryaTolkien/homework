-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 30 2018 г., 18:57
-- Версия сервера: 5.6.38
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(23) COLLATE utf8_bin NOT NULL,
  `password` varchar(23) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'totaladmin', 'qwerty2311');

-- --------------------------------------------------------

--
-- Структура таблицы `archiv`
--

CREATE TABLE `archiv` (
  `id_good` int(11) NOT NULL,
  `name` varchar(23) COLLATE utf8_bin NOT NULL,
  `address` varchar(23) COLLATE utf8_bin NOT NULL,
  `tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `idx` int(11) NOT NULL,
  `id_good` int(11) NOT NULL,
  `user` text COLLATE utf8_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`idx`, `id_good`, `user`, `count`, `pubdate`, `active`) VALUES
(47, 1, 'ei5iifvcv1eo733po38a27o8g8o4jekg', 1, '2018-11-21 13:43:48', 2),
(48, 8, 'ei5iifvcv1eo733po38a27o8g8o4jekg', 1, '2018-11-21 13:43:49', 2),
(49, 3, 'ei5iifvcv1eo733po38a27o8g8o4jekg', 4, '2018-11-21 13:43:50', 2),
(50, 12, 'l77pkdcg56tb6k61vcgbeme1v5u5lf35', 4, '2018-11-21 17:53:14', 2),
(52, 1, 'l77pkdcg56tb6k61vcgbeme1v5u5lf35', 1, '2018-11-21 17:56:44', 2),
(55, 5, 'l77pkdcg56tb6k61vcgbeme1v5u5lf35', 1, '2018-11-21 18:14:31', 2),
(56, 6, '845kuen2tv2qlu47rp5ioogim9ehpilm', 2, '2018-11-21 18:29:03', 2),
(57, 2, '845kuen2tv2qlu47rp5ioogim9ehpilm', 1, '2018-11-21 18:29:06', 1),
(58, 5, '845kuen2tv2qlu47rp5ioogim9ehpilm', 2, '2018-11-21 18:29:08', 1),
(59, 12, '845kuen2tv2qlu47rp5ioogim9ehpilm', 1, '2018-11-21 18:29:11', 1),
(60, 5, 'ncbagur5etod8ufcbhb5orn0em88he6v', 6, '2018-11-21 18:40:47', 2),
(63, 1, 'ncbagur5etod8ufcbhb5orn0em88he6v', 3, '2018-11-23 17:02:25', 2),
(70, 7, 'ncbagur5etod8ufcbhb5orn0em88he6v', 1, '2018-11-23 18:23:15', 2),
(71, 8, 'ncbagur5etod8ufcbhb5orn0em88he6v', 1, '2018-11-23 18:25:10', 1),
(72, 3, 'ncbagur5etod8ufcbhb5orn0em88he6v', 2, '2018-11-23 18:25:15', 1),
(226, 1, '8vfvpa8rj6pp7dddiee38d5vlfvph8sq', 6, '2018-11-28 23:34:41', 1),
(227, 5, '8vfvpa8rj6pp7dddiee38d5vlfvph8sq', 1, '2018-11-28 23:34:42', 1),
(228, 6, '8vfvpa8rj6pp7dddiee38d5vlfvph8sq', 1, '2018-11-28 23:34:43', 1),
(229, 5, '3fseccsq70j1osvlnvfvpvqh4e8f3ch2', 6, '2018-11-30 12:56:58', 1),
(230, 1, '2k82vjsk4r4gmfr5ft5hs2nm18l6uujj', 1, '2018-11-30 18:22:24', 1),
(231, 5, '2k82vjsk4r4gmfr5ft5hs2nm18l6uujj', 1, '2018-11-30 18:22:25', 1),
(232, 6, '2k82vjsk4r4gmfr5ft5hs2nm18l6uujj', 1, '2018-11-30 18:22:25', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `auhtor` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `title`, `auhtor`, `image`, `price`, `description`) VALUES
(1, 'White Guard', 1, 'Belaya.jpg', 457, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(2, 'Borodino', 2, 'Borodino.jpg', 245, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(3, 'Idiot', 3, 'Idiot.jpg', 235, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(4, 'Igrok', 3, 'Igrok.jpg', 497, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(5, 'Master and Margarita', 1, 'Master.jpg', 645, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(6, 'Morpheus', 1, 'Morfei.jpg', 367, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(7, 'Petersburg noel', 4, 'Peterburg.jpg', 389, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(8, 'Overcoat', 4, 'Shinel.jpg', 456, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(9, 'Taras and Bulba', 4, 'Taras.jpg', 408, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(10, 'Vii', 4, 'Vii.jpg', 398, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(11, 'Hero of our time', 2, 'heroes_our.jpg', 648, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,'),
(12, 'Mtsyri', 2, 'Mtsiri.jpg', 344, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog_author`
--

CREATE TABLE `catalog_author` (
  `id_auhtor` int(11) NOT NULL,
  `surname` varchar(23) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `catalog_author`
--

INSERT INTO `catalog_author` (`id_auhtor`, `surname`) VALUES
(1, ' Bulgakov Mikhail'),
(2, 'Lermontov Mikhail '),
(3, 'Dostaevsky Feodor'),
(4, 'Gogol Nikolay ');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8_bin NOT NULL,
  `url` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`) VALUES
(1, 'Home', '/'),
(2, 'Basket', '/basket/'),
(3, 'My Account', '/login/');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(23) COLLATE utf8_bin NOT NULL,
  `password` varchar(232) COLLATE utf8_bin NOT NULL,
  `name` varchar(11) COLLATE utf8_bin NOT NULL,
  `img` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `adres` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `session` varchar(33) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `img`, `tel`, `adres`, `session`) VALUES
(31, 'Test', 'c4ca4238a0b923820dcc509a6f75849b', 'test', '20181130-5640_20181130-3603_lR2OCOG9P4M.jpg', 2343243, 'Moscow', ''),
(32, 'Miha', 'c0bc70725dd349bea4905542b94af350', 'Misha', '20181130-4006_IMG_9385.jpg', 6784894, 'Novosibirsk', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_shop`
--

CREATE TABLE `users_shop` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `address` text COLLATE utf8_bin NOT NULL,
  `tel` int(11) NOT NULL,
  `users` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users_shop`
--

INSERT INTO `users_shop` (`id`, `name`, `address`, `tel`, `users`) VALUES
(3, 'Pavel', 'Saints-Petersburg', 3467856, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(5, 'Vitalii', 'Perm', 2343243, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(6, 'Michael', 'Kazan', 5678909, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(7, 'Oleg', 'Kazan', 5675463, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(8, 'ivan', 'Saints-Petersburg', 56756556, 'r21er5ltbqqaj0uv3t0i3bjn5es3a45h'),
(9, 'Rai', 'Kazan', 456456, 'r21er5ltbqqaj0uv3t0i3bjn5es3a45h'),
(10, 'lolita', 'Moscow', 5478888, 'v79u03ah7lkm9aniah3m2f215m7huleq'),
(11, 'Igor', 'Kazan', 4555655, 'ei5iifvcv1eo733po38a27o8g8o4jekg'),
(12, 'Vitalyi', 'Saints-Petersburg', 456443335, 'l77pkdcg56tb6k61vcgbeme1v5u5lf35'),
(13, 'Irina', 'Ekaterinburg', 34543638, '845kuen2tv2qlu47rp5ioogim9ehpilm'),
(14, 'Slava', 'New-York', 4565464, 'ncbagur5etod8ufcbhb5orn0em88he6v'),
(15, 'IgorPituh', 'Novosib', 65675757, '8vfvpa8rj6pp7dddiee38d5vlfvph8sq'),
(16, 'test', 'Spb', 2343243, '3fseccsq70j1osvlnvfvpvqh4e8f3ch2'),
(17, 'Lol', 'Ekaterinburg', 3245476, '2k82vjsk4r4gmfr5ft5hs2nm18l6uujj');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`idx`);

--
-- Индексы таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalog_author`
--
ALTER TABLE `catalog_author`
  ADD PRIMARY KEY (`id_auhtor`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_shop`
--
ALTER TABLE `users_shop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `users_shop`
--
ALTER TABLE `users_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
