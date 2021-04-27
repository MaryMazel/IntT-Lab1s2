-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 05 2021 г., 21:43
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lb1v9`
--

-- --------------------------------------------------------

--
-- Структура таблицы `computer`
--

CREATE TABLE `computer` (
  `id_computer` int(11) NOT NULL,
  `netname` varchar(250) NOT NULL,
  `motherboard` varchar(250) NOT NULL,
  `ram_capacity` int(11) NOT NULL,
  `hdd_capacity` int(11) NOT NULL,
  `monitor` varchar(250) NOT NULL,
  `vendor` varchar(250) NOT NULL,
  `quarantii` varchar(250) NOT NULL,
  `FID_Processor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `computer`
--

INSERT INTO `computer` (`id_computer`, `netname`, `motherboard`, `ram_capacity`, `hdd_capacity`, `monitor`, `vendor`, `quarantii`, `FID_Processor`) VALUES
(1, 'computer_main', 'Asus Prime B460-Plus', 16, 512, 'Samsung Curved C27F396F', 'Samsung', '1 year', 1),
(2, 'econom_computer', 'ASRock H410M-HVS', 24, 1000, 'Samsung Odyssey G5', 'Samsung', '2 years', 3),
(3, 'first_computer', 'MSI B450 Tomahawk Max', 16, 512, 'Samsung Curved C24F396F', 'Samsung', '1 year', 2),
(4, 'second_computer', 'ASRock B460 Pro4', 24, 1000, 'Samsung Odyssey G7 C32G75TQSI', 'Samsung', '1 year', 4),
(5, 'third_computer', 'Asus Prime B460-Plus', 16, 512, 'Acer KA252Qbmix', 'Acer', 'NO', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `computer_software`
--

CREATE TABLE `computer_software` (
  `FID_Computer` int(11) DEFAULT NULL,
  `FID_Software` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `computer_software`
--

INSERT INTO `computer_software` (`FID_Computer`, `FID_Software`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `processor`
--

CREATE TABLE `processor` (
  `id_processor` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `frequency` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `processor`
--

INSERT INTO `processor` (`id_processor`, `name`, `frequency`) VALUES
(1, 'Intel Core i7-9700', '3 GHz'),
(2, 'AMD Ryzen 5 3600', '3.6GHz'),
(3, 'Intel Core i5-10400F', '2.9GHz'),
(4, 'Intel Core i5-10600KF', '4.1GHz');

-- --------------------------------------------------------

--
-- Структура таблицы `software`
--

CREATE TABLE `software` (
  `id_software` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `software`
--

INSERT INTO `software` (`id_software`, `name`) VALUES
(1, 'MICROSOFT WORLD 2013'),
(2, 'PAINT');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `computer`
--
ALTER TABLE `computer`
  ADD PRIMARY KEY (`id_computer`),
  ADD KEY `processor_fk` (`FID_Processor`);

--
-- Индексы таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD KEY `software_fk` (`FID_Software`),
  ADD KEY `computer_fk` (`FID_Computer`);

--
-- Индексы таблицы `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`id_processor`);

--
-- Индексы таблицы `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id_software`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `computer`
--
ALTER TABLE `computer`
  MODIFY `id_computer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `processor`
--
ALTER TABLE `processor`
  MODIFY `id_processor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `computer`
--
ALTER TABLE `computer`
  ADD CONSTRAINT `processor_fk` FOREIGN KEY (`FID_Processor`) REFERENCES `processor` (`id_processor`);

--
-- Ограничения внешнего ключа таблицы `computer_software`
--
ALTER TABLE `computer_software`
  ADD CONSTRAINT `computer_fk` FOREIGN KEY (`FID_Computer`) REFERENCES `computer` (`id_computer`),
  ADD CONSTRAINT `software_fk` FOREIGN KEY (`FID_Software`) REFERENCES `software` (`id_software`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
