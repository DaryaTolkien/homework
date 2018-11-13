-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 13 2018 г., 20:00
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
  `user` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`idx`, `id_good`, `user`) VALUES
(20, 7, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(22, 1, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(23, 9, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(24, 3, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  `pubdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `title`, `image`, `price`, `pubdate`, `description`) VALUES
(1, 'White Guard', 'Belaya.jpg', 457, '2018-07-05 13:29:50', ' Drawing closely on Bulgakov\'s personal experiences of the horrors of civil war as a young doctor, The White Guard takes place in Kiev, 1918, a time of turmoil and suffocating uncertainty as the Bolsheviks, Socialists and Germans fight for control of the city. It tells the story of the Turbins, a once-wealthy Russian family, as they are forced to come to terms with revolution and a new regime.'),
(2, 'Borodino', 'Borodino.jpg', 245, '2018-07-05 13:30:24', 'A poem by Russian poet Mikhail Lermontov which describes the Battle of Borodino, the turning point of the Napoleon\'s invasion of Russia. It was first published in 1837 in literary magazine Sovremennik on the occasion of the 25th anniversary of the battle. The poem is thought to be based on the narrations of one of the author\'s relatives, several of whom were veterans of the Patriotic War of 1812.'),
(3, 'Idiot', 'Idiot.jpg', 235, '2018-07-05 13:30:41', 'The year is 1995, and email is new. Selin, the daughter of Turkish immigrants, arrives for her freshman year at Harvard. She signs up for classes in subjects she has never heard of, befriends her charismatic and worldly Serbian classmate, Svetlana, and, almost by accident, begins corresponding with Ivan, an older mathematics student from Hungary. Selin may have barely spoken to Ivan, but with each email they exchange, the act of writing seems to take on new and increasingly mysterious meanings.  At the end of the school year, Ivan goes to Budapest for the summer, and Selin heads to the Hungarian countryside, to teach English in a program run by one of Ivan\'s friends. On the way, she spends two weeks visiting Paris with Svetlana. Selin\'s summer in Europe does not resonate with anything she has previously heard about the typical experiences of American college students, or indeed of any other kinds of people. For Selin, this is a journey further inside herself: a coming to grips with the ineffable and exhilarating confusion of first love, and with the growing consciousness that she is doomed to become a writer'),
(4, 'Igrok', 'Igrok.jpg', 497, '2018-07-05 13:31:27', 'This largely autobiographical novel, Dostoevsky was forced to write, not to lose all rights to his previous works after a major defeat in Baden-Baden. The hero of the novel, as the author himself, torn between the passion for the game and a passion for a woman. The cover photo of Fyodor Dostoevsky during his life in Baden-Baden.'),
(5, 'Master and Margarita', 'Master.jpg', 645, '2018-11-10 22:54:46', 'The underground masterpiece of twentieth-century Russian fiction, this classic novel was written during Stalin’s regime and could not be published until many years after its author’s death.  When the devil arrives in 1930s Moscow, consorting with a retinue of odd associates—including a talking black cat, an assassin, and a beautiful naked witch—his antics wreak havoc among the literary elite of the world capital of atheism. Meanwhile, the Master, author of an unpublished novel about Jesus and Pontius Pilate, languishes in despair in a pyschiatric hospital, while his devoted lover, Margarita, decides to sell her soul to save him. As Bulgakov’s dazzlingly exuberant narrative weaves back and forth between Moscow and ancient Jerusalem, studded with scenes ranging from a giddy Satanic ball to the murder of Judas in Gethsemane, Margarita’s enduring love for the Master joins the strands of plot across space and time.'),
(6, 'Morpheus', 'Morfei.jpg', 367, '2018-11-10 22:54:46', 'The whole story is a recollection of the doctor Bomhard about the year 1917. Most of the story Bomgard reads the diary of his late friend, doctor Polyakov, who became a morphinist.'),
(7, 'Petersburg noel', 'Peterburg.jpg', 389, '2018-11-10 22:55:54', 'Petersburg stories-accepted in the philological literature conditional name of the collection of several stories written by N. V. Gogol, United by a common place of action-St. Petersburg 1830-1840-ies. Traditionally it includes the story \"Nevsky Prospekt\", \"Nose\", \"Portrait\", \"the Overcoat\", \"diary of a madman\", sometimes connected to them closely the content of the story \"the Pram\". The writer himself did not use such a term to refer to the cycle of his works devoted to the St. Petersburg theme. Works were written at different times, the story \"Nevsky prospect\" was established in the years 1833-1834, \"Portrait\" — in the years 1833-1834, both first published in 1835, in the collection \"Arabesque\" (represented in the permanent exhibition in the Office of the writer), \"diary of a madman\" written in 1834, also first published in the collection \"Arabesque\" under the heading \"Scraps from a diary of a madman\". The novel \" Nose \"was written in 1832-1833, and was first published in the magazine\" Contemporary\". Pushkin in 1836, after the magazine \"Moscow observer\" refused to print the story, calling it\"bad, vulgar and trivial.\" '),
(8, 'Overcoat', 'Shinel.jpg', 456, '2018-11-10 22:55:54', 'One of the most acknowledged film interpretations of classic short story \"The Overcoat\" (1842) by Nikolai Gogol, describing a fate of a \"small person\".'),
(9, 'Taras and Bulba', 'Taras.jpg', 408, '2018-11-10 22:56:28', '\"So you want to fight me? with your fist, eh?\" \"Any way.\" \"Well, let it be fisticuffs,\" said Taras Bulba, turning up his sleeves. \"I\'ll see what sort of a man you are with your fists.\" And father and son, in lieu of a pleasant greeting after long separation, began to deal each other heavy blows on ribs, back, and chest, now retreating and looking at each other, now attacking afresh.'),
(10, 'Vii', 'Vii.jpg', 398, '2018-11-10 22:56:28', 'The proposed collection includes works in which the mystical beginning dominates; mysterious events keep the reader in suspense, revealing the veil of the other world.  The subjects of the works are very similar and are based on the unexpected intervention of supernatural dark forces in people\'s lives. And the fact that it is unclear what causes fear. Gogol draws stories in folklore, folk demonology: it is the night before Ivan Kupala, the lost soul, the enchanted place, the ancestral curse, the devil, expelled from hell – and processes in its unique manner, sometimes building on a small fairy tale full story.  For a wide range of readers.');

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
  `session` varchar(33) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `session`) VALUES
(1, 'Daria', 'c20ad4d76fe97759aa27a0c99bff6710', 'Дарья', '');

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
(2, 'Игорь', 'Moscow', 2147483647, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(3, 'Pavel', 'Saints-Petersburg', 3467856, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(4, 'Дарья', 'Saints-Petersburg', 1234566, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(5, 'Vitalii', 'Perm', 2343243, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(6, 'Michael', 'Kazan', 5678909, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j'),
(7, 'Oleg', 'Kazan', 5675463, 'r23ed4ge6rrcdvi8kk7ucs2ostsamu4j');

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
  MODIFY `idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users_shop`
--
ALTER TABLE `users_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
