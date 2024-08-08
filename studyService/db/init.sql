-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 27 2024 г., 22:36
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `courses`
--
CREATE DATABASE IF NOT EXISTS `courses` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `courses`;

-- --------------------------------------------------------

--
-- Структура таблицы `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `image_path` varchar(255) DEFAULT '/default/course-default.png',
  `translit` varchar(255) NOT NULL,
  `primarytagid` int(11) DEFAULT NULL,
  `secondarytagid` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `course`
--

INSERT INTO `course` (`id`, `name`, `price`, `userid`, `createdAt`, `updatedAt`, `image_path`, `translit`, `primarytagid`, `secondarytagid`, `published`) VALUES
(37, ' Angular. Основы', NULL, 7, '2023-09-22 10:39:01.859929', '2024-05-27 23:24:43.108081', '/course_37/Angular.png', '_angular__osnovy', 5, 1, 1),
(38, ' Angular. Продвинутый уровень', NULL, 7, '2023-09-22 10:39:09.614272', '2024-05-27 23:24:39.535701', '/default/course-default.png', '_angular__prodvinutyi_uroven ', 5, 1, 0),
(39, 'NestJS. Продвинутый уровень', NULL, 7, '2023-09-22 10:39:16.178533', '2024-05-27 23:24:35.199509', '/default/course-default.png', 'nestjs__prodvinutyi_uroven ', 5, NULL, 0),
(56, 'NestJS. Основы', NULL, 7, '2023-11-17 11:05:16.171769', '2023-11-17 11:28:45.000000', '/course_56/nestjs_logo_icon_169927.png', 'nestjs__osnovy', NULL, NULL, 1),
(57, 'Высшая математика', NULL, 4, '2023-11-17 11:34:38.047250', '2024-05-27 23:22:39.000000', '/course_57/55,604 Math Banner Images, Stock Photos & Vectors _ Shutterstock.jpeg', 'vysshaya_matematika', NULL, NULL, 1),
(58, 'Основы PHP', NULL, 4, '2023-11-17 11:42:50.537492', '2023-11-17 11:51:17.000000', '/course_58/pngwing.com.png', 'osnovy_php', NULL, NULL, 1),
(59, 'PRO Go. Основы программирования', NULL, 4, '2023-11-17 11:56:38.284913', '2023-12-10 18:39:47.000000', '/course_59/golang.sh-600x600.png', 'pro_go__osnovy_programmirovaniya', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `coursedesc`
--

CREATE TABLE `coursedesc` (
  `id` int(11) NOT NULL,
  `learn` text NOT NULL,
  `req` text NOT NULL,
  `about` mediumtext NOT NULL,
  `audience` text NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `course` int(11) DEFAULT NULL,
  `shortabout` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `coursedesc`
--

INSERT INTO `coursedesc` (`id`, `learn`, `req`, `about`, `audience`, `createdAt`, `updatedAt`, `course`, `shortabout`) VALUES
(22, 'Архитектуре Angular\nРоутингу\nВеб-хукам Angular\nОтправке http запросов\nДеление компонентов на Smart и Presentational\nВзаимодействие компонентов между собой', 'Базовые знания html,css\nЖелание учиться и развиваться', '{\"time\":1700205875035,\"blocks\":[{\"id\":\"rzCdqFqA7l\",\"type\":\"paragraph\",\"data\":{\"text\":\"В ходе прохождения курса мы изучим основы Angular, как он взаимодействует с внешними сервисами и разработаем свой первый проект для портфолио\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}', 'Начинающие веб программисты и студенты технических специальностей', '2023-11-17 10:14:52.983818', '2023-11-17 10:24:35.000000', 37, 'В данном курсе мы познакомимся с основами Angular.'),
(24, 'Основам разработки серверных приложений\nREST архитектуре\nВзаимодействию API с базами данных', 'Базовые знания в алгоритмизации\nБазовые знания в любом языке программирования\nБазовые знания в работе с базами данных', '{\"time\":1700209725635,\"blocks\":[{\"id\":\"k01_OBdy77\",\"type\":\"paragraph\",\"data\":{\"text\":\"В этом курсе мы создадим API для проекта Medium используя NestJS, Typescript, Typeorm и PostgreSQL. Это курс полностью сфокусирован на глубокое погружение в создание реального приложения используя NestJS. Мы начнем с пустой папки и шаг за шагом мы реализуем реальное приложение. Вы изучите как структурировать ваше приложение, писать переиспользуемые и понятные модули и сервисы, разделять ваш код на небольшие кусочки. Мы будем писать вместе легко поддерживаемый код, чтобы сделать его чистым и избежать ненужной сложности.\",\"alignment\":\"left\"}},{\"id\":\"FrHr4szhzO\",\"type\":\"paragraph\",\"data\":{\"text\":\"В каждом уроке вы найдете исходный код видео, поэтому вы легко можете следить за прогрессом приложения и получить работающий проект на любом шаге.\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}', 'Начинающие разработчики и студенты технических специальностей', '2023-11-17 11:05:30.670484', '2023-11-17 11:28:45.000000', 56, 'Рассмотрим основы разработки на современном nodejs фреймворке nestjs'),
(25, 'Степенные функции\nПоказательная функция\nЛогарифмическая функция\nПервообразная и интеграл', 'Математика первых 11 классов', '{\"time\":1716841359551,\"blocks\":[{\"id\":\"1wCwrw0sDi\",\"type\":\"paragraph\",\"data\":{\"text\":\"При прохождении данного курса вы изучите основные темы изучаемые в институте классе по курсам алгебры и геометрии\",\"alignment\":\"left\"}}],\"version\":\"2.28.2\"}', 'Учащиеся начальных курсов технических вузов', '2023-11-17 11:36:56.849446', '2024-05-27 23:22:39.000000', 57, 'Курс математики студентов вузов'),
(26, 'Решать задачи в PHP\nПонимать, что требуется бизнесу от начинающего программиста\nРаботать с синтаксисом PHP\nСоблюдать стандарты кодирования\nИспользовать условные конструкции\nИспользовать циклы\nСоздавать скрипты на PHP\nСоздавать, читать и обрабатывать файлы', 'Базовые знания в любом языке программирования\nБазовые знания алгоритмов', '{\"time\":1700210989433,\"blocks\":[{\"id\":\"CeA4hvTtFn\",\"type\":\"paragraph\",\"data\":{\"text\":\"<mark style=\\\"background-color: rgb(255, 255, 255);\\\"></mark>Курс сосредоточен на PHP7.4 Этот курс позволит вам понять потенциал PHP как языка программирования в WEB-разработке. Основное внимание уделяется практической применимости в бизнес-процессах, подкрепленное реальными бизнес-примерами.\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}', 'Этот курс идеально подходит для тех, кто только начинает свой путь в программировании и не имеет предыдущего опыта с PHP. Важнее всего - ваше желание научиться. Вне зависимости от вашего образования, вы можете освоить навыки, необходимые для создания качественных веб-приложений.\nКурс рассчитан на людей которые будут работать в backend разработке, и делать качественный продукт.', '2023-11-17 11:45:39.043436', '2023-11-17 11:49:49.000000', 58, 'Курс по основам языка программирования PHP'),
(27, 'Писать код\nРешать алгоритмические задачи', 'Для усвоения материала не нужны никакие дополнительные знания. ', '{\"time\":1702222787642,\"blocks\":[{\"id\":\"CmzZPQy4Jo\",\"type\":\"paragraph\",\"data\":{\"text\":\"Программа курса на базовом уровне освещает практические основы программирования. В ходе обучения предстоит решить множество небольших задач, охватывающих основные базовые конструкции языка<span>&nbsp;</span>Go.\",\"alignment\":\"left\"}},{\"id\":\"myme1ogmDu\",\"type\":\"paragraph\",\"data\":{\"text\":\"70% курса – это практика, в качестве домашних заданий. Она поможет натренировать умение читать код, анализировать готовые программы, а также писать программный код самостоятельно. Если возникнут какие-то трудности, вопросы – команда курса всегда готова помочь, нужно только написать свой вопрос в комментариях к задаче.&nbsp;\",\"alignment\":\"left\"}},{\"id\":\"M6VUupt1bx\",\"type\":\"paragraph\",\"data\":{\"text\":\"Курс разбит на 6 модулей, каждый из них содержит теоретические и практические материалы.\",\"alignment\":\"left\"}},{\"id\":\"_dYzF3T1hf\",\"type\":\"paragraph\",\"data\":{\"text\":\"Всем удачного обучения!\",\"alignment\":\"left\"}}],\"version\":\"2.28.2\"}', 'Для тех кто хочет научится программировать', '2023-11-17 12:00:26.029502', '2023-12-10 18:39:47.000000', 59, 'Курс посвящен базовым понятиям программирования: типы данных, операторы, переменные, условия, циклы, массивы и функции. Он является вводным и подойдет слушателям с небольшим опытом или вообще без опыта программирования. Обучение будет проходить на языке программирования Go.');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `timestamp`, `name`) VALUES
(1, 1681153276328, 'FirstUser1681153276328');

-- --------------------------------------------------------

--
-- Структура таблицы `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `courseid` int(11) DEFAULT NULL,
  `module_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `module`
--

INSERT INTO `module` (`id`, `name`, `about`, `createdAt`, `updatedAt`, `courseid`, `module_order`) VALUES
(53, 'Начало работы', NULL, '2023-11-17 10:21:51.605226', '2024-04-16 00:56:23.000000', 37, 1),
(54, 'Архитектура Angular', NULL, '2023-11-17 10:45:44.174490', '2024-04-16 00:56:23.000000', 37, 2),
(55, 'Начало работы', NULL, '2023-11-17 11:22:45.712938', '2023-11-17 11:22:45.712938', 56, 1),
(56, 'Архитектура приложения', NULL, '2023-11-17 11:23:55.792432', '2023-11-17 11:23:55.792432', 56, 2),
(57, 'Модуль авторизации', NULL, '2023-11-17 11:24:06.584536', '2023-11-17 11:24:06.584536', 56, 3),
(59, 'Уравнения с неравенствами и параметрами', NULL, '2023-11-17 11:41:42.876132', '2023-11-17 11:41:42.876132', 57, 1),
(60, 'Основы синтаксиса', NULL, '2023-11-17 11:45:52.146897', '2023-12-14 18:31:41.000000', 58, 2),
(61, 'Типы данных и переменные', NULL, '2023-11-17 11:46:00.890950', '2023-12-14 18:31:41.000000', 58, 3),
(62, 'Константы и операторы', NULL, '2023-11-17 11:46:08.623885', '2023-12-14 18:31:41.000000', 58, 4),
(63, 'Функции', NULL, '2023-11-17 11:46:14.268459', '2023-12-14 18:31:41.000000', 58, 5),
(65, 'Общая информация о курсе', NULL, '2023-11-17 12:00:40.701755', '2023-12-17 21:20:50.000000', 59, 1),
(70, 'Основы', NULL, '2023-12-14 18:31:38.000203', '2023-12-14 18:31:41.000000', 58, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `primarytag`
--

CREATE TABLE `primarytag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `translation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `primarytag`
--

INSERT INTO `primarytag` (`id`, `name`, `translation`) VALUES
(1, 'Бизнес', 'business'),
(3, 'Школа', 'school'),
(4, 'Дизайн', 'design'),
(5, 'Разработка', 'development'),
(6, 'Маркетинг', 'marketing'),
(7, 'Музыка', 'music'),
(8, 'Здоровье', 'health'),
(9, 'Финансы', 'finance'),
(10, 'ИТ', 'it'),
(11, 'Психология', 'psychology');

-- --------------------------------------------------------

--
-- Структура таблицы `secondarytag`
--

CREATE TABLE `secondarytag` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `primarytag` int(11) DEFAULT NULL,
  `translation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `secondarytag`
--

INSERT INTO `secondarytag` (`id`, `name`, `primarytag`, `translation`) VALUES
(1, 'Веб-разработка', 5, 'web-development'),
(2, 'No-code и Low-code разработка', 5, 'no-code-low-code-development'),
(3, 'Тестирование', 5, 'testing'),
(4, 'Бизнес-аналитика', 10, 'business-analytics'),
(5, 'Системная аналитика', 10, 'system-analytics'),
(6, 'Языки программирования', 5, 'programming-languages'),
(7, 'Документация', 10, 'documents'),
(8, 'Десктоп разработка', 5, 'desktop-development'),
(9, 'Мобильная разработка', 5, 'mobile-development');

-- --------------------------------------------------------

--
-- Структура таблицы `study`
--

CREATE TABLE `study` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_content` int(11) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `userid` int(11) DEFAULT NULL,
  `type_content` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `moduleid` int(11) DEFAULT NULL,
  `id_kinescope_folder` varchar(255) DEFAULT NULL,
  `study_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `study`
--

INSERT INTO `study` (`id`, `name`, `id_content`, `createdAt`, `updatedAt`, `userid`, `type_content`, `courseid`, `moduleid`, `id_kinescope_folder`, `study_order`) VALUES
(126, 'Введение в Angular', 38, '2023-11-17 10:20:32.156552', '2023-11-17 10:21:55.000000', 7, 1, 37, 53, 'fd346f9b-8697-4d4c-ae6b-26ce3e583e76', 1),
(128, 'Установка Angular CLI', 39, '2023-11-17 10:25:15.829311', '2023-11-17 10:27:16.000000', 7, 1, 37, 53, 'ff0efc86-2933-4397-a5b4-ca1e93f29791', 1),
(130, 'Компоненты', 40, '2023-11-17 10:45:55.428141', '2023-11-17 10:49:04.000000', 7, 1, 37, 54, 'ac5b71bd-38d1-4f4f-bcad-60fcf2bdd61c', 1),
(131, 'Модули', 41, '2023-11-17 10:46:06.472547', '2023-11-17 10:51:46.000000', 7, 1, 37, 54, 'f69a8bcb-02a2-4e78-b1f1-a863b546edec', 1),
(132, 'Введение в Nest', 42, '2023-11-17 10:53:04.227024', '2023-11-17 11:24:49.000000', 7, 1, 56, 55, '64463022-6932-4efb-bed6-2d82db9e80c7', 1),
(133, 'Установка Nest', 43, '2023-11-17 10:53:12.156701', '2023-11-17 11:25:29.000000', 7, 1, 56, 55, '305c5b06-d2d3-4847-89f4-5b02e6e43893', 1),
(134, 'Подключение базы данных', 44, '2023-11-17 10:53:25.053808', '2023-11-17 11:25:55.000000', 7, 1, 56, 56, '4fd70178-eb9a-4eb2-96e9-8131140d0d51', 1),
(135, 'Уравнения с неравенствами', 60, '2023-11-17 11:41:17.151345', '2023-12-17 21:17:42.000000', 4, 1, 57, 59, '8753be74-cf39-4e3f-97a1-b2f17a0ee493', 1),
(136, 'Уравнения с параметрами', 15, '2023-11-17 11:41:21.035859', '2023-12-17 21:18:39.000000', 4, 2, 57, 59, 'e46bd567-f66b-4b61-96df-da8a627ac8f0', 1),
(137, 'Типы переменных', 45, '2023-11-17 11:47:36.403870', '2023-11-17 11:50:12.000000', 4, 1, 58, 61, '70718fde-1cb6-4940-bd4a-cb736da98115', 1),
(138, 'Что такое PHP?', 61, '2023-11-17 11:55:41.208274', '2023-12-17 21:20:07.000000', 4, 1, 58, 70, '767034a2-ab41-4a99-9a51-f29dd35368c3', 1),
(139, 'Введение', 46, '2023-11-17 12:00:59.062283', '2023-11-17 12:01:30.000000', 4, 1, 59, 65, '4d1bc470-b76e-4e9b-a591-c4504100e9b7', 1),
(144, 'Видео', 12, '2023-12-17 15:28:41.082289', '2023-12-17 15:29:26.000000', 7, 2, 37, 54, '9ea3ed6e-e889-4f57-99d0-5188540789e8', 1),
(145, 'Видео 2', 13, '2023-12-17 18:49:49.417584', '2023-12-17 18:50:23.000000', 7, 2, 37, 54, '138974bf-8511-4d64-801a-cbca2abe021e', 1),
(147, 'Тест', 57, '2023-12-17 20:25:48.837120', '2023-12-17 20:27:37.000000', 4, 1, 58, 70, '20726c61-a093-4310-af1f-cfc6832062c9', 1),
(149, 'Тест', 59, '2023-12-17 20:41:58.515176', '2023-12-17 20:43:17.000000', 7, 1, 37, 53, '2bb88491-f351-4f3a-9fd8-6812f6e1d839', 1),
(150, 'Видео', NULL, '2024-01-18 13:40:48.559808', '2024-01-18 13:46:18.000000', 4, 2, NULL, NULL, '40ca0f61-faa4-4422-ab93-8fc7d0434e7f', 1),
(153, 'Занятие', 64, '2024-04-16 01:03:32.222912', '2024-04-16 01:04:27.000000', 7, 1, 37, 53, 'dbd4c4a2-913f-4392-a770-04f8e60e53c1', 1),
(154, 'Занятие демо', NULL, '2024-05-27 23:10:40.756368', '2024-05-27 23:12:45.000000', 7, 1, NULL, NULL, 'b7fdd78d-0a58-4c43-b82a-f3404e9df43f', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `text`
--

CREATE TABLE `text` (
  `id` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `text`
--

INSERT INTO `text` (`id`, `createdAt`, `updatedAt`, `content`) VALUES
(36, '2023-09-16 19:33:10.829959', '2023-11-03 10:37:14.000000', '{\"time\":1698997034029,\"blocks\":[{\"id\":\"oABls30LkZ\",\"type\":\"header\",\"data\":{\"text\":\"Вводное занятие\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"kNNfo5irJ2\",\"type\":\"paragraph\",\"data\":{\"text\":\"Всем привет меня зовут...\",\"alignment\":\"left\"}},{\"id\":\"bU6sFOgE2q\",\"type\":\"paragraph\",\"data\":{\"text\":\"Я буду вашим преподавателем на данном курсе\",\"alignment\":\"left\"}},{\"id\":\"Y1AyG4sd6J\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"http://localhost:3000/studies/109/images/айзен.jpg\"},\"caption\":\"\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}},{\"id\":\"8Yg56eqBPU\",\"type\":\"paragraph\",\"data\":{\"text\":\"&nbsp; &nbsp;Тест\",\"alignment\":\"left\"}},{\"id\":\"WnKlfg5MZV\",\"type\":\"paragraph\",\"data\":{\"text\":\"тестирование\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}'),
(37, '2023-10-30 23:51:04.232228', '2023-10-30 23:51:04.232228', '{\"time\":1698699064218,\"blocks\":[{\"id\":\"UXVAqnQZxC\",\"type\":\"paragraph\",\"data\":{\"text\":\"Занятие номер один\",\"alignment\":\"center\"}},{\"id\":\"-tEwGRpObl\",\"type\":\"list\",\"data\":{\"style\":\"ordered\",\"items\":[]}}],\"version\":\"2.27.0\"}'),
(38, '2023-11-17 10:21:36.210879', '2023-11-17 10:28:22.000000', '{\"time\":1700206102454,\"blocks\":[{\"id\":\"yl-0-xUBgT\",\"type\":\"header\",\"data\":{\"text\":\"Введение в Angular\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"bbScSZxqyK\",\"type\":\"paragraph\",\"data\":{\"text\":\"Angular представляет фреймворк от компании Google для создания клиентских приложений. Прежде всего он нацелен на разработку SPA-решений (Single Page Application), то есть одностраничных приложений. В этом плане Angular является наследником другого фреймворка AngularJS. В то же время Angular это не новая версия AngularJS, а принципиально новый фреймворк.\",\"alignment\":\"left\"}},{\"id\":\"KPF86pZ9Qf\",\"type\":\"paragraph\",\"data\":{\"text\":\"Angular предоставляет такую функциональность, как двустороннее связывание, позволяющее динамически изменять данные в одном месте интерфейса при изменении данных модели в другом, шаблоны, маршрутизация и так далее.\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}'),
(39, '2023-11-17 10:26:41.149155', '2023-11-17 10:28:58.000000', '{\"time\":1700206138205,\"blocks\":[{\"id\":\"RuXzz0jap7\",\"type\":\"header\",\"data\":{\"text\":\"Установка Angular CLI\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"uyr1llgCFf\",\"type\":\"paragraph\",\"data\":{\"text\":\"Для компиляции приложения мы будем использовать инфрастуктуру Angular CLI. Angular CLI упрощает создание приложения, его компиляцию. Angular CLI распространяется как пакет npm, поэтому для его использования его необходимо сначала установить. Для установки Angular CLI откроем консоль/командную строку и выполним в ней следующую команду:\",\"alignment\":\"left\"}},{\"id\":\"qi_vxodj3Q\",\"type\":\"paragraph\",\"data\":{\"text\":\"<b><font style=\\\"color: rgb(0, 112, 255);\\\">npm install -g @angular/cli</font></b>\",\"alignment\":\"left\"}},{\"id\":\"ZafDO8NEfN\",\"type\":\"paragraph\",\"data\":{\"text\":\"Данная команда установит пакет<span>&nbsp;</span>@angular/cli<span>&nbsp;</span>в качестве глобального модуля, поэтому в последующем при создании новый проектов Angular его не потребуется устанавливать заново.\",\"alignment\":\"left\"}},{\"id\":\"PdPghFJg7T\",\"type\":\"paragraph\",\"data\":{\"text\":\"Ту же команду можно использовать для обновления Angluar CLI при выходе новой версии фреймворка. Проверить версию CLI можно в командной строке/консоли с помощью команды:\",\"alignment\":\"left\"}},{\"id\":\"3ySdbSBxBI\",\"type\":\"paragraph\",\"data\":{\"text\":\"<b><font style=\\\"color: rgb(0, 112, 255);\\\">ng version</font></b>\",\"alignment\":\"left\"}},{\"id\":\"0eO_COeEjn\",\"type\":\"paragraph\",\"data\":{\"text\":\"При работе на Windows и выполнении команд в PowerShell вместо командной строки стоит учитывать, что по умолчанию выполнение скриптов в PowerShell отключено. Чтобы разрешить выполнение скриптов PowerShell (что требуется для npm), необходимо выполнить следующую команду:\",\"alignment\":\"left\"}},{\"id\":\"iqb6fFDqHi\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\"><b>Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned</b></font>\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}'),
(40, '2023-11-17 10:48:48.600765', '2023-11-17 10:48:48.600765', '{\"time\":1700207328576,\"blocks\":[{\"id\":\"Bjf6zirTPD\",\"type\":\"header\",\"data\":{\"text\":\"Создание компонента Angular\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"oHs_BAbnCu\",\"type\":\"paragraph\",\"data\":{\"text\":\"Компоненты представляют основные строительные блоки приложения Angular. Каждое приложение Angular имеет как минимум один компонент. Поэтому создадим в папке<span>&nbsp;</span><span class=\\\"b\\\" style=\\\"font-weight: bold;\\\">src/app</span><span>&nbsp;</span>новый файл, который назовем<span>&nbsp;</span><span class=\\\"b\\\" style=\\\"font-weight: bold;\\\">app.component.ts</span><span>&nbsp;</span>и в котором определим следующий код компонента:\",\"alignment\":\"left\"}},{\"id\":\"5RIlY7dDIO\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">import { Component } from \'@angular/core\'</font>;\",\"alignment\":\"left\"}},{\"id\":\"NCMWIM0BwX\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">@Component({</font>\",\"alignment\":\"left\"}},{\"id\":\"s-Wxmym6yo\",\"type\":\"paragraph\",\"data\":{\"text\":\"    <font style=\\\"color: rgb(0, 112, 255);\\\">selector: \'my-app\',</font>\",\"alignment\":\"left\"}},{\"id\":\"4ZlMClMe17\",\"type\":\"paragraph\",\"data\":{\"text\":\"    <font style=\\\"color: rgb(0, 112, 255);\\\">template: `&lt;label&gt;Введите имя:&lt;/label&gt;</font>\",\"alignment\":\"left\"}},{\"id\":\"mPe-Pkp9Qn\",\"type\":\"paragraph\",\"data\":{\"text\":\"                 <font style=\\\"color: rgb(0, 112, 255);\\\">&lt;input [(ngModel)]=\\\"name\\\" placeholder=\\\"name\\\"&gt;</font>\",\"alignment\":\"left\"}},{\"id\":\"4AXanJDeoa\",\"type\":\"paragraph\",\"data\":{\"text\":\"                 <font style=\\\"color: rgb(0, 112, 255);\\\">&lt;h1&gt;Добро пожаловать {{name}}!&lt;/h1&gt;`</font>\",\"alignment\":\"left\"}},{\"id\":\"_35WK2qkfs\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">})</font>\",\"alignment\":\"left\"}},{\"id\":\"xtTA8HwnMW\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">export class AppComponent {</font> \",\"alignment\":\"left\"}},{\"id\":\"TPJBOUa7Vb\",\"type\":\"paragraph\",\"data\":{\"text\":\"    <font style=\\\"color: rgb(0, 112, 255);\\\">name= \'\';</font>\",\"alignment\":\"left\"}},{\"id\":\"xxdANlqSmv\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">}</font>\",\"alignment\":\"left\"}},{\"id\":\"QGntXBlPQW\",\"type\":\"paragraph\",\"data\":{\"text\":\"В начале файла определяется директива<span>&nbsp;</span><span class=\\\"b\\\" style=\\\"font-weight: bold;\\\">import</span>, которая импортирует функциональность модуля<span>&nbsp;</span>angular/core, предоставляя доступ к функции декоратора<span>&nbsp;</span>@Component.\",\"alignment\":\"left\"}},{\"id\":\"9wdQwEiI1f\",\"type\":\"paragraph\",\"data\":{\"text\":\"Далее собственно идет функция-декоратор<span>&nbsp;</span>@Component, которая ассоциирует метаданные с классом компонента AppComponent. В этой функции, во-первых, определяется параметр<span>&nbsp;</span>selector<span>&nbsp;</span>или селектор css для HTML-элемента, который будет представлять компонент. Во-вторых, здесь определяется параметр<span>&nbsp;</span>template<span>&nbsp;</span>или шаблон, который указывает, как надо визуализировать компонент. В этом шаблоне задана двусторонняя привязка с помощью выражений<span>&nbsp;</span>[(ngModel)]=\\\"name\\\"<span>&nbsp;</span>и<span>&nbsp;</span>{{name}}<span>&nbsp;</span>к некоторой модели name.\",\"alignment\":\"left\"}},{\"id\":\"tzsEYkBZAd\",\"type\":\"paragraph\",\"data\":{\"text\":\"И в конце собственно экспортируется класс компонента AppComponent, в котором как раз определяется переменная name - в данном случае это пустая строка.\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}'),
(41, '2023-11-17 10:51:46.726902', '2023-11-17 10:51:46.726902', '{\"time\":1700207506704,\"blocks\":[{\"id\":\"UBuCnwDgWq\",\"type\":\"header\",\"data\":{\"text\":\"Создание модуля Angular\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"lou0O8N1pl\",\"type\":\"paragraph\",\"data\":{\"text\":\"Приложение Angular состоит из модулей. Модульная структура позволяет легко подгружать и задействовать только те модули, которые непосредственно необходимы. И каждое приложение имеет как минимум один корневой модуль. Поэтому создадим в папке&nbsp;src/app&nbsp;новый файл, который назовем&nbsp;app.module.ts&nbsp;со следующим содержимым:\",\"alignment\":\"left\"}},{\"id\":\"-dYvS8TO_4\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">import { NgModule }      from \'@angular/core\';</font>\",\"alignment\":\"left\"}},{\"id\":\"Ge_dzDx6xg\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">import { BrowserModule } from \'@angular/platform-browser\';</font>\",\"alignment\":\"left\"}},{\"id\":\"0El8J2hM8-\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">import { FormsModule }   from \'@angular/forms\';</font>\",\"alignment\":\"left\"}},{\"id\":\"WP7ke90Tg2\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">import { AppComponent }   from \'./app.component\';</font>\",\"alignment\":\"left\"}},{\"id\":\"f_QHybBboy\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">@NgModule({</font>\",\"alignment\":\"left\"}},{\"id\":\"scUST7ht43\",\"type\":\"paragraph\",\"data\":{\"text\":\"    <font style=\\\"color: rgb(0, 112, 255);\\\">imports:      [ BrowserModule, FormsModule ],</font>\",\"alignment\":\"left\"}},{\"id\":\"kGtghxGNzC\",\"type\":\"paragraph\",\"data\":{\"text\":\"    <font style=\\\"color: rgb(0, 112, 255);\\\">declarations: [ AppComponent ],</font>\",\"alignment\":\"left\"}},{\"id\":\"pZqiTYpXD4\",\"type\":\"paragraph\",\"data\":{\"text\":\"    <font style=\\\"color: rgb(0, 112, 255);\\\">bootstrap:    [ AppComponent ]</font>\",\"alignment\":\"left\"}},{\"id\":\"O57h1L87vL\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">})</font>\",\"alignment\":\"left\"}},{\"id\":\"bg6eG7N_vv\",\"type\":\"paragraph\",\"data\":{\"text\":\"<font style=\\\"color: rgb(0, 112, 255);\\\">export class AppModule { }</font>\",\"alignment\":\"left\"}},{\"id\":\"p_21z533J4\",\"type\":\"paragraph\",\"data\":{\"text\":\"Этот модуль, который в данном случае называется AppModule, будет входной точкой в приложение.\",\"alignment\":\"left\"}},{\"id\":\"p79Uy9DUcO\",\"type\":\"paragraph\",\"data\":{\"text\":\"С помощью директив<span>&nbsp;</span><span class=\\\"b\\\" style=\\\"font-weight: bold;\\\">import</span><span>&nbsp;</span>здесь импортируется ряд нужных нам модулей. Прежде всего, это модуль NgModule. Для работы с браузером также требуется модуль BrowserModule. Так как наш компонент использует элемент input или элемент формы, то также подключаем модуль FormsModule. И далее импортируется созданный ранее компонент.\",\"alignment\":\"left\"}}],\"version\":\"2.27.0\"}'),
(42, '2023-11-17 11:24:49.584620', '2023-11-17 11:24:49.584620', '{\"time\":1700209489574,\"blocks\":[{\"id\":\"Szb6S96KLY\",\"type\":\"header\",\"data\":{\"text\":\"Введение в NestJS\",\"level\":2,\"alignment\":\"center\"}}],\"version\":\"2.27.0\"}'),
(43, '2023-11-17 11:25:29.234963', '2023-11-17 11:25:29.234963', '{\"time\":1700209529214,\"blocks\":[{\"id\":\"i_QzCIRUJP\",\"type\":\"header\",\"data\":{\"text\":\"Установка NestJS\",\"level\":2,\"alignment\":\"center\"}}],\"version\":\"2.27.0\"}'),
(44, '2023-11-17 11:25:55.023638', '2023-11-17 11:25:55.023638', '{\"time\":1700209555015,\"blocks\":[{\"id\":\"O_QsiR1NlW\",\"type\":\"header\",\"data\":{\"text\":\"Подключение к БД\",\"level\":2,\"alignment\":\"center\"}}],\"version\":\"2.27.0\"}'),
(45, '2023-11-17 11:48:01.551131', '2023-11-17 11:48:01.551131', '{\"time\":1700210881542,\"blocks\":[{\"id\":\"TBAY2jCNUx\",\"type\":\"header\",\"data\":{\"text\":\"Типы переменных\",\"level\":2,\"alignment\":\"center\"}}],\"version\":\"2.27.0\"}'),
(46, '2023-11-17 12:01:14.098934', '2023-12-06 20:25:43.000000', '{\"time\":1701883543761,\"blocks\":[{\"id\":\"nGiGYA0Iil\",\"type\":\"header\",\"data\":{\"text\":\"Введение\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"GgnH0Psqvw\",\"type\":\"paragraph\",\"data\":{\"text\":\"Текст\",\"alignment\":\"center\"}}],\"version\":\"2.28.2\"}'),
(56, '2023-12-17 20:16:47.215999', '2023-12-17 20:16:55.000000', '{\"time\":1702833415727,\"blocks\":[{\"id\":\"vzqjzCIDgH\",\"type\":\"header\",\"data\":{\"text\":\"Тестовое занятие\",\"level\":2,\"alignment\":\"center\"}}],\"version\":\"2.28.2\"}'),
(57, '2023-12-17 20:26:59.174167', '2023-12-17 20:26:59.174167', '{\"time\":1702834019158,\"blocks\":[{\"id\":\"q5P7wWLm8S\",\"type\":\"header\",\"data\":{\"text\":\"Заголовок\",\"level\":1,\"alignment\":\"center\"}},{\"id\":\"gA9oVQlAfb\",\"type\":\"paragraph\",\"data\":{\"text\":\"Тестовое занятие\",\"alignment\":\"left\"}},{\"id\":\"FqLwCzmExL\",\"type\":\"list\",\"data\":{\"style\":\"ordered\",\"items\":[\"первый пункт\",\"второй пункт\",\"третий пункт\"]}},{\"id\":\"ertTXJQOD0\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"1\",\"2\"],[\"3\",\"4\"]]}}],\"version\":\"2.28.2\"}'),
(58, '2023-12-17 20:38:09.057551', '2023-12-17 20:38:09.057551', '{\"time\":1702834689040,\"blocks\":[{\"id\":\"cL709VjJ8Q\",\"type\":\"header\",\"data\":{\"text\":\"Тестовое занятие\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"dkK8InlyHB\",\"type\":\"list\",\"data\":{\"style\":\"ordered\",\"items\":[\"первый\",\"второй\"]}},{\"id\":\"IOIycZLfUq\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"1\",\"2\"],[\"3\",\"4\"]]}}],\"version\":\"2.28.2\"}'),
(59, '2023-12-17 20:42:51.257593', '2023-12-17 20:42:51.257593', '{\"time\":1702834971245,\"blocks\":[{\"id\":\"EQZ_S1k_zt\",\"type\":\"header\",\"data\":{\"text\":\"Заголовок\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"Nj-afj5xGI\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"1\",\"2\"],[\"3\",\"4\"]]}},{\"id\":\"FcjWWfsBkb\",\"type\":\"list\",\"data\":{\"style\":\"ordered\",\"items\":[\"первый\",\"второй\",\"третий\"]}},{\"id\":\"8PWE9SL-UE\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"http://localhost:3000/studies/149/images/Arisu.jpg\"},\"caption\":\"подпись\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}}],\"version\":\"2.28.2\"}'),
(60, '2023-12-17 21:17:42.424192', '2023-12-17 21:17:42.424192', '{\"time\":1702837062390,\"blocks\":[{\"id\":\"fhdnJr6Fmx\",\"type\":\"header\",\"data\":{\"text\":\"Уравнение с неравенствами\",\"level\":2,\"alignment\":\"center\"}}],\"version\":\"2.28.2\"}'),
(61, '2023-12-17 21:20:07.551178', '2023-12-17 21:20:07.551178', '{\"time\":1702837207527,\"blocks\":[{\"id\":\"-JJ60GPsmw\",\"type\":\"paragraph\",\"data\":{\"text\":\"Действительно, <mark style=\\\"background-color: rgb(236, 120, 120);\\\">что же это?</mark>\",\"alignment\":\"left\"}}],\"version\":\"2.28.2\"}'),
(62, '2024-04-16 00:53:24.842807', '2024-04-16 00:53:24.842807', '{\"time\":1713218004827,\"blocks\":[{\"id\":\"S7Y0BuEYhI\",\"type\":\"paragraph\",\"data\":{\"text\":\"Заголовок\",\"alignment\":\"center\"}},{\"id\":\"d0yxEnrVGc\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"1\",\"2\"],[\"3\",\"4\"]]}},{\"id\":\"M_RLKXB4Ft\",\"type\":\"list\",\"data\":{\"style\":\"ordered\",\"items\":[\"один\",\"два\",\"три\"]}}],\"version\":\"2.28.2\"}'),
(63, '2024-04-16 00:59:10.236409', '2024-04-16 00:59:10.236409', '{\"time\":1713218350203,\"blocks\":[{\"id\":\"8bi2bBnrJd\",\"type\":\"header\",\"data\":{\"text\":\"Занятие 1\",\"level\":2,\"alignment\":\"center\"}},{\"id\":\"yFGAUHA5y-\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"1\",\"2\"],[\"2\",\"4\"],[\"5\",\"6\"]]}},{\"id\":\"UBXXpoTivq\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"http://localhost:3000/studies/152/images/Tal.jpg\"},\"caption\":\"\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}}],\"version\":\"2.28.2\"}'),
(64, '2024-04-16 01:04:09.609015', '2024-04-16 01:04:09.609015', '{\"time\":1713218649579,\"blocks\":[{\"id\":\"rPWnVscrgQ\",\"type\":\"paragraph\",\"data\":{\"text\":\"Заголовок\",\"alignment\":\"center\"}},{\"id\":\"SFoOQqVgXI\",\"type\":\"table\",\"data\":{\"withHeadings\":false,\"content\":[[\"1\",\"2\"],[\"3\",\"4\"],[\"5\",\"6\"]]}},{\"id\":\"wPFidO1VUM\",\"type\":\"image\",\"data\":{\"file\":{\"url\":\"http://localhost:3000/studies/153/images/Tal.jpg\"},\"caption\":\"\",\"withBorder\":false,\"stretched\":false,\"withBackground\":false}}],\"version\":\"2.28.2\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `secondname` varchar(255) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `about` text DEFAULT NULL,
  `pfp_path` varchar(255) NOT NULL DEFAULT '/default/default.jpg',
  `role` varchar(255) NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `mail`, `password`, `name`, `secondname`, `createdAt`, `updatedAt`, `about`, `pfp_path`, `role`) VALUES
(4, '12345@mail.ru', '$2b$10$NNYpy7bmsUZQMt1t4OT50OLK1vGf8ZB.LyNVIOl/xKOHh4HeBtwkW', 'Иван', 'Иванович', '2023-04-12 16:14:47.215170', '2024-05-25 20:36:37.973532', '', '/12345@mail.ru/Mike_Mentzer.png', 'teacher'),
(7, 'type@mail.ru', '$2b$10$.GVFnZ4SXRllOr1pfZkwVepLohBsvchvE8YM7mMjb9ft6a4Vow88y', 'Максим', 'Головин', '2023-09-22 10:37:11.152656', '2024-05-25 20:36:45.667962', '', '/type@mail.ru/PatrickJane.JPG', 'teacher'),
(17, 'test@mail.ru', '$2b$10$ayAlMxwrU2Dxtf8mLxyjousaE0wIA9szF1TjAFPBMljnse55WzyiC', 'Тест', 'Тестов', '2024-05-08 15:47:38.146350', '2024-05-08 15:47:38.146350', NULL, '/default/default.jpg', 'student'),
(18, 'teacher@mail.ru', '$2b$10$n5epI8K4jRSuD959s53AROnlo3NFnXbxZMAtxlLwLJGE7yZYhOUba', 'Тест', 'Учитель', '2024-05-08 15:48:42.212829', '2024-05-08 15:48:42.212829', NULL, '/default/default.jpg', 'teacher'),
(19, 'student@mail.ru', '$2b$10$6U1Dxw9jHzWc6e5ZsY7P3ew5ESZ9cjpe1OJeX7t0TlEMpd0wraMty', 'Максим', 'Головин', '2024-05-25 20:37:15.611528', '2024-05-25 20:37:15.611528', NULL, '/default/default.jpg', 'student'),
(36, 'golovin12345@mail.com', 'secret_pass', 'Максим', 'Головин', '2024-07-23 20:20:09.085962', '2024-07-23 20:20:09.085962', NULL, '/default/default.jpg', 'student');

-- --------------------------------------------------------

--
-- Структура таблицы `user_signed_courses_course`
--

CREATE TABLE `user_signed_courses_course` (
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_signed_courses_course`
--

INSERT INTO `user_signed_courses_course` (`userId`, `courseId`) VALUES
(17, 37),
(17, 38),
(19, 37),
(19, 38),
(19, 56);

-- --------------------------------------------------------

--
-- Структура таблицы `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `id_video` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `video`
--

INSERT INTO `video` (`id`, `createdAt`, `updatedAt`, `id_video`) VALUES
(8, '2023-09-20 15:20:33.653484', '2023-10-05 14:04:07.000000', '543a3aad-fba4-46e4-b889-9295c2b59a2a'),
(9, '2023-09-23 21:49:57.867255', '2023-11-03 10:34:34.000000', '4794ab46-18b3-4eab-bbd3-d025a74f0db6'),
(10, '2023-09-30 18:09:39.227685', '2023-09-30 18:09:39.227685', '7272d6f8-e280-492c-b05a-3dbcf2ced231'),
(11, '2023-12-10 00:33:45.450937', '2023-12-10 00:34:33.000000', '7e346cbe-c9b9-4102-8746-214c3ca13e91'),
(12, '2023-12-17 15:29:02.900001', '2023-12-17 15:29:02.900001', 'f60cf04c-0557-4f26-a707-b9de1d41ccb6'),
(13, '2023-12-17 18:50:03.426792', '2023-12-17 18:50:03.426792', '664a9efd-e97c-47d5-bda1-83b540b50323'),
(14, '2023-12-17 21:18:23.569712', '2023-12-17 21:18:23.569712', 'f7d621f5-32ca-414a-b11d-fec2ebd93951'),
(15, '2023-12-17 21:18:39.746014', '2023-12-17 21:18:39.746014', 'fdf7e12e-860b-42ac-88e9-749c86282532');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_599209cbbb8dac3325804fe2fe1` (`userid`),
  ADD KEY `FK_8335b3a87a0dda758cdeed9c3fb` (`primarytagid`),
  ADD KEY `FK_f6e6f720703835733e5e8bdce01` (`secondarytagid`);

--
-- Индексы таблицы `coursedesc`
--
ALTER TABLE `coursedesc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `REL_c39c06a4c8b435712ce1b675bd` (`course`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_fa8c3a35d59d5272312ac6ae0f3` (`courseid`);

--
-- Индексы таблицы `primarytag`
--
ALTER TABLE `primarytag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `secondarytag`
--
ALTER TABLE `secondarytag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_9a37f82b65d06ba68673b066703` (`primarytag`);

--
-- Индексы таблицы `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1a7cf27443085ed55ecca50ef58` (`courseid`),
  ADD KEY `FK_ae91f6344398fa63aca7d988755` (`moduleid`),
  ADD KEY `FK_4714fe0b0915a6e93dddc2f6285` (`userid`);

--
-- Индексы таблицы `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_signed_courses_course`
--
ALTER TABLE `user_signed_courses_course`
  ADD PRIMARY KEY (`userId`,`courseId`),
  ADD KEY `IDX_74dd6dfcc73fa75c6e3eacd42a` (`userId`),
  ADD KEY `IDX_d525a78c039cacc39dbe4eca57` (`courseId`);

--
-- Индексы таблицы `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `coursedesc`
--
ALTER TABLE `coursedesc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `primarytag`
--
ALTER TABLE `primarytag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `secondarytag`
--
ALTER TABLE `secondarytag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `study`
--
ALTER TABLE `study`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT для таблицы `text`
--
ALTER TABLE `text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `FK_599209cbbb8dac3325804fe2fe1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_8335b3a87a0dda758cdeed9c3fb` FOREIGN KEY (`primarytagid`) REFERENCES `primarytag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f6e6f720703835733e5e8bdce01` FOREIGN KEY (`secondarytagid`) REFERENCES `secondarytag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `coursedesc`
--
ALTER TABLE `coursedesc`
  ADD CONSTRAINT `FK_c39c06a4c8b435712ce1b675bde` FOREIGN KEY (`course`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `FK_fa8c3a35d59d5272312ac6ae0f3` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `secondarytag`
--
ALTER TABLE `secondarytag`
  ADD CONSTRAINT `FK_9a37f82b65d06ba68673b066703` FOREIGN KEY (`primarytag`) REFERENCES `primarytag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `FK_1a7cf27443085ed55ecca50ef58` FOREIGN KEY (`courseid`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_4714fe0b0915a6e93dddc2f6285` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ae91f6344398fa63aca7d988755` FOREIGN KEY (`moduleid`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `user_signed_courses_course`
--
ALTER TABLE `user_signed_courses_course`
  ADD CONSTRAINT `FK_74dd6dfcc73fa75c6e3eacd42af` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_d525a78c039cacc39dbe4eca57a` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;