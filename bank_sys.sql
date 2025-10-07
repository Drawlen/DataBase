-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 07 2025 г., 15:51
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bank_sys`
--

-- --------------------------------------------------------

--
-- Структура таблицы `prixod_operation`
--

CREATE TABLE `prixod_operation` (
  `id` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date_and_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `prixod_operation`
--

INSERT INTO `prixod_operation` (`id`, `id_wallet`, `total`, `date_and_time`) VALUES
(1, 1, '15000.00', '2025-10-01 09:30:00'),
(2, 2, '250.00', '2025-10-02 11:15:00'),
(3, 3, '7000.00', '2025-10-03 10:00:00'),
(4, 4, '1200.00', '2025-10-04 08:45:00'),
(5, 5, '5000.00', '2025-10-05 14:20:00');

-- --------------------------------------------------------

--
-- Структура таблицы `rashod_operation`
--

CREATE TABLE `rashod_operation` (
  `id` int(11) NOT NULL,
  `id_wallet` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date_and_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rashod_operation`
--

INSERT INTO `rashod_operation` (`id`, `id_wallet`, `total`, `date_and_time`) VALUES
(1, 1, '3000.00', '2025-10-06 12:00:00'),
(2, 2, '50.00', '2025-10-07 13:45:00'),
(3, 3, '1500.00', '2025-10-06 09:20:00'),
(4, 4, '800.00', '2025-10-06 10:00:00'),
(5, 5, '1000.00', '2025-10-07 11:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `wallet_currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wallet`
--

INSERT INTO `wallet` (`id`, `id_client`, `wallet_currency`) VALUES
(1, 1, 'RUB'),
(2, 2, 'RUB'),
(3, 3, 'EUR'),
(4, 4, 'RUB'),
(5, 5, 'USD');

-- --------------------------------------------------------

--
-- Структура таблицы `сlients`
--

CREATE TABLE `сlients` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `сlients`
--

INSERT INTO `сlients` (`id`, `full_name`) VALUES
(1, 'Иванов Иван Иванович'),
(2, 'Петров Петр Петрович'),
(3, 'Сидорова Анна Николаевна'),
(4, 'Кузнецов Сергей Владимирович'),
(5, 'Соколова Мария Андреевна');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `prixod_operation`
--
ALTER TABLE `prixod_operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wallet` (`id_wallet`);

--
-- Индексы таблицы `rashod_operation`
--
ALTER TABLE `rashod_operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wallet` (`id_wallet`);

--
-- Индексы таблицы `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Индексы таблицы `сlients`
--
ALTER TABLE `сlients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `prixod_operation`
--
ALTER TABLE `prixod_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `rashod_operation`
--
ALTER TABLE `rashod_operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `сlients`
--
ALTER TABLE `сlients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `prixod_operation`
--
ALTER TABLE `prixod_operation`
  ADD CONSTRAINT `prixod_operation_ibfk_1` FOREIGN KEY (`id_wallet`) REFERENCES `wallet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rashod_operation`
--
ALTER TABLE `rashod_operation`
  ADD CONSTRAINT `rashod_operation_ibfk_1` FOREIGN KEY (`id_wallet`) REFERENCES `wallet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `сlients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
