-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 13 2018 г., 11:58
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
-- База данных: `online_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`name`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `idx` int(11) NOT NULL,
  `id_good` int(11) NOT NULL,
  `user` text COLLATE utf8_bin NOT NULL,
  `colvo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`idx`, `id_good`, `user`, `colvo`) VALUES
(33, 3, '72v589ls96dpfnh7qt49a9v6e5cn8pi2', NULL),
(34, 4, '72v589ls96dpfnh7qt49a9v6e5cn8pi2', NULL),
(35, 2, '72v589ls96dpfnh7qt49a9v6e5cn8pi2', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `url` varchar(155) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  `pubdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `views` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `url`, `title`, `image`, `price`, `pubdate`, `views`) VALUES
(1, '/art1/', 'Куртка летняя', 'kurtka.jpg', 10990, '2018-07-05 13:29:50', 3),
(2, '/art2/', 'Куртка зимняя', 'kurtka2.jpg', 17243, '2018-07-05 13:30:24', 7),
(3, '/art3/', 'Куртка осенняя', 'kurtka3.jpg', 12345, '2018-07-05 13:30:41', 2),
(4, '/art4/', 'Куртка весенняя', 'kurtka4.jpg', 11482, '2018-07-05 13:31:27', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `auhtor` varchar(150) COLLATE utf8_bin NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `auhtor`, `text`, `date`) VALUES
(6, 'Татьяна', 'Очень быстрое выполнение заказа, в Иркутск доставили за три дня. Доставка бесплатная, если сумма заказа более 5 тыс. Плюс с первым же заказом отправили дисконтную карту. От магазина только приятные впечатления.', '2018-07-09 19:38:30'),
(7, 'Максим', 'Там действительно немало бестолковых вещей, есть и откровенно некачественные и даже жуткого дизайна, но их процент невысокий. Покупать там одежду в начале продаж за полную стоимость не вижу смысла. У этих вещей крайне низкая себестоимость - порядка 10-15% от розничной первоначальной цены. Поэтому приходу на распродажи и покупаю вещи за 50% и менее от цены.', '2018-07-09 19:39:01'),
(8, 'Олеся', 'Небольшие замечания: После размещения через пару часов после заказа перезвонил сам для подтверждения доставки, так как мне не звонили. Но, может, просто не успели позвонить. Сразу предупредил, что оплачу картой, мне подтвердили такую возможность, но, при оплате картой деньги сначала ушли, через несколько минут вернулись, шайтан-коробка у курьера выдала какую-то ошибку. Эти несколько минут он созванивался и выяснял в своей организации, поступили ли деньги. В результате пришлось оплатить наличными. Не очень удобно, так как наличных могло просто не оказаться, но, собственно, это, скорей, маленькое недоразумение.', '2018-07-09 19:39:41'),
(9, 'Глеб', 'Проверенный магазин, уже очень давно пользуюсь его услугами.', '2018-07-09 20:44:39');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `url` varchar(155) COLLATE utf8_bin NOT NULL,
  `title` varchar(150) COLLATE utf8_bin NOT NULL,
  `parent` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `url`, `title`, `parent`) VALUES
(1, '/', 'Главная', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_shop`
--

CREATE TABLE `users_shop` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `adres` text COLLATE utf8_bin NOT NULL,
  `tel` int(11) NOT NULL,
  `users` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users_shop`
--

INSERT INTO `users_shop` (`id`, `name`, `adres`, `tel`, `users`) VALUES
(3, 'Дарья', 'Самойлова 37', 2147483647, '72v589ls96dpfnh7qt49a9v6e5cn8pi2'),
(4, 'Дарья', 'Самойлова 37', 2147483647, '72v589ls96dpfnh7qt49a9v6e5cn8pi2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`name`);

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
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
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
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users_shop`
--
ALTER TABLE `users_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
