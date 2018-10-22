-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 22 oct. 2018 à 13:15
-- Version du serveur :  10.1.35-MariaDB
-- Version de PHP :  7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `api`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `auteur_id` int(11) NOT NULL,
  `auteur_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`auteur_id`, `auteur_name`) VALUES
(1, 'Letti Durnall'),
(2, 'Amalita Statham'),
(3, 'Muire Gingles'),
(4, 'Broderick McPeake'),
(5, 'Ileane Leall'),
(6, 'Finlay Jasik'),
(7, 'Marquita Conrard'),
(8, 'Dalis Gery'),
(9, 'Kyle Pollard'),
(10, 'Yvonne Blunsum'),
(11, 'Avie Archell'),
(12, 'Bonita Mendoza'),
(13, 'Max Naire'),
(14, 'Ewell Cords'),
(15, 'Jerrie Harber'),
(16, 'Claudetta Derrington'),
(17, 'Tabbatha Kingescot'),
(18, 'Bryan Brind'),
(19, 'Farrand MacMaster'),
(20, 'Flossie Prophet'),
(21, 'Alyss Sword'),
(22, 'Brewer Ragsdall'),
(23, 'Emelyne Gooderidge'),
(24, 'Karina Stilly'),
(25, 'Jaime Danis'),
(26, 'Neddy Cottisford'),
(27, 'Madge O\'Corhane'),
(28, 'Monro Tackley'),
(29, 'Jeddy Portinari'),
(30, 'Kimmie Canby'),
(31, 'Gunar Brounsell'),
(32, 'Wendy Wreford'),
(33, 'Forest Kesley'),
(34, 'Mariam Sheardown'),
(35, 'Kathlin Veldman'),
(36, 'Sawyer Elkin'),
(37, 'Shane Breache'),
(38, 'Tristam Hosby'),
(39, 'Caryl Snowdon'),
(40, 'Mendie Gaskin'),
(41, 'Leontyne Christall'),
(42, 'Ailey Skeffington'),
(43, 'Auberon Ebdin'),
(44, 'Jonathan Tigner'),
(45, 'Clive Coggill'),
(46, 'Kyle Gerhartz'),
(47, 'Casey Hare'),
(48, 'Nicoline De Gregorio'),
(49, 'Tori De la Zenne'),
(50, 'Valene Chiene'),
(51, 'Tamara Mapledoram'),
(52, 'Sven Garrattley'),
(53, 'Terry Albro'),
(54, 'Ethyl Beel'),
(55, 'Roby Lyles'),
(56, 'Marsh Gowry'),
(57, 'Viviyan Greenwell'),
(58, 'Cesaro Stealy'),
(59, 'Alix Bumby'),
(60, 'Jasun Dorkens'),
(61, 'Jessa Oggers'),
(62, 'Virgil Elphinston'),
(63, 'Ursula Mattevi'),
(64, 'Edithe Liversidge'),
(65, 'Consolata Curwood'),
(66, 'Davis Gravie'),
(67, 'Culver Trappe'),
(68, 'Fania Carass'),
(69, 'Tanny Prue'),
(70, 'Danny Duns'),
(71, 'Suki Jerrolt'),
(72, 'Magnum Canfield'),
(73, 'Rand McDermott-Row'),
(74, 'Gideon Harteley'),
(75, 'Tailor Abramson'),
(76, 'Arly McAw'),
(77, 'Fawnia Creamer'),
(78, 'Kori Kupker'),
(79, 'Nickie Brandts'),
(80, 'Ursa Mulvaney'),
(81, 'Eran Rickaert'),
(82, 'Renelle Fluger'),
(83, 'Hodge Worster'),
(84, 'Lucia Brazenor'),
(85, 'Javier Postle'),
(86, 'Vincenz Sollime'),
(87, 'Broddie Thoms'),
(88, 'Dacy Jerrom'),
(89, 'Aggie Jermyn'),
(90, 'Gerek Salt'),
(91, 'Cherri Marzelle'),
(92, 'Katya Beniesh'),
(93, 'Bogart Dellenbroker'),
(94, 'Chrotoem Bolin'),
(95, 'Barrie Abreheart'),
(96, 'Caritta Kuhl'),
(97, 'Ralph Patinkin'),
(98, 'Allissa Martell'),
(99, 'Lionel Smeal'),
(100, 'Beau Glasner');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `message_content` varchar(1000) NOT NULL,
  `auteur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `event_ht_list`
--

CREATE TABLE `event_ht_list` (
  `Eht_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `hashtag`
--

CREATE TABLE `hashtag` (
  `hashtag_id` int(11) NOT NULL,
  `hashtag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hashtag`
--

INSERT INTO `hashtag` (`hashtag_id`, `hashtag_name`) VALUES
(1, '#in'),
(2, '#justo'),
(3, '#ut'),
(4, '#an'),
(5, '#non'),
(6, '#nec'),
(7, '#vel'),
(8, '#mollis'),
(9, '#at'),
(10, '#mattis');

-- --------------------------------------------------------

--
-- Structure de la table `ht_list`
--

CREATE TABLE `ht_list` (
  `message_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ht_list`
--

INSERT INTO `ht_list` (`message_id`, `hashtag_id`) VALUES
(1, 3),
(1, 10),
(2, 2),
(2, 2),
(3, 2),
(3, 8),
(4, 1),
(4, 8),
(5, 5),
(5, 8),
(5, 8),
(6, 2),
(6, 2),
(6, 2),
(6, 5),
(6, 7),
(6, 9),
(7, 3),
(7, 3),
(7, 10),
(7, 10),
(8, 6),
(8, 7),
(9, 4),
(9, 9),
(10, 5),
(11, 1),
(11, 1),
(11, 3),
(11, 10),
(12, 2),
(12, 3),
(12, 6),
(13, 2),
(13, 5),
(13, 6),
(13, 7),
(13, 10),
(13, 10),
(14, 4),
(15, 1),
(15, 3),
(15, 5),
(15, 10),
(16, 4),
(16, 5),
(16, 9),
(17, 7),
(18, 1),
(18, 3),
(18, 7),
(18, 10),
(19, 6),
(19, 6),
(20, 7),
(21, 5),
(21, 5),
(21, 5),
(21, 6),
(22, 5),
(22, 5),
(22, 9),
(23, 1),
(23, 2),
(23, 2),
(23, 9),
(24, 3),
(24, 6),
(24, 7),
(25, 5),
(25, 6),
(25, 9),
(25, 10),
(27, 1),
(27, 2),
(27, 5),
(28, 1),
(29, 5),
(29, 6),
(29, 6),
(29, 8),
(30, 1),
(30, 2),
(30, 2),
(30, 2),
(30, 10),
(31, 4),
(32, 1),
(32, 5),
(32, 6),
(32, 8),
(33, 1),
(33, 10),
(34, 6),
(34, 7),
(34, 8),
(35, 1),
(36, 1),
(37, 8),
(37, 9),
(38, 6),
(38, 7),
(39, 5),
(39, 7),
(39, 10),
(40, 6),
(40, 8),
(40, 10),
(41, 5),
(41, 7),
(41, 10),
(42, 4),
(42, 4),
(42, 5),
(43, 4),
(43, 8),
(43, 8),
(44, 5),
(44, 8),
(44, 8),
(44, 9),
(44, 10),
(45, 2),
(45, 9),
(45, 10),
(46, 5),
(47, 2),
(47, 5),
(47, 8),
(49, 9),
(50, 2),
(51, 1),
(51, 4),
(51, 8),
(51, 10);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `auteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`message_id`, `message_content`, `date`, `auteur_id`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pellentesque, libero non cursus molestie, lacus lorem fringilla quam, a varius. ', '2018-08-02 01:23:53', 15),
(2, 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', '2016-01-23 00:51:42', 1),
(3, 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor', '2018-06-12 07:26:44', 98),
(4, 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', '2018-01-25 18:51:08', 83),
(5, 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', '2018-07-15 04:17:19', 44),
(6, 'Dolor sit amet, consectetur adipiscing elit. Etiam mollis, odio in malesuada mattis, urna augue congue urna, at pulvinar. ', '2017-11-13 02:30:35', 97),
(7, 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', '2016-03-15 14:03:02', 38),
(8, 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit', '2016-09-09 08:46:05', 68),
(9, 'est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse', '2016-11-27 03:38:06', 5),
(10, 'varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', '2016-06-13 15:26:49', 18),
(11, 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', '2017-10-29 22:57:22', 98),
(12, 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', '2016-01-11 09:04:51', 51),
(13, 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', '2017-02-22 22:28:17', 20),
(14, 'eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante', '2018-09-16 13:34:23', 27),
(15, 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', '2018-04-14 05:39:54', 36),
(16, 'semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla', '2017-04-06 18:37:10', 49),
(17, 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum', '2016-03-07 11:22:34', 59),
(18, 'pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse', '2018-05-20 13:17:17', 82),
(19, 'sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', '2016-12-27 12:48:47', 26),
(20, 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec', '2016-09-16 19:10:22', 68),
(21, 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio', '2016-12-14 07:07:17', 20),
(22, 'augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum', '2018-07-18 02:28:32', 65),
(23, 'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at', '2018-06-15 21:57:36', 45),
(24, 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', '2017-06-03 23:33:09', 71),
(25, 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', '2016-05-30 12:31:58', 74),
(26, 'ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in', '2018-06-24 10:45:24', 20),
(27, 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', '2016-07-31 06:45:21', 92),
(28, 'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', '2018-07-28 05:00:32', 25),
(29, 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', '2018-07-28 05:00:32', 85),
(30, 'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac', '2017-07-17 20:52:44', 84),
(31, 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus', '2018-05-02 04:14:31', 51),
(32, 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat', '2017-11-10 19:50:04', 93),
(33, 'sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu', '2016-04-10 11:28:08', 65),
(34, 'ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper', '2016-09-16 06:30:41', 9),
(35, 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', '2016-01-28 05:06:18', 70),
(36, 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at', '2016-12-11 13:22:17', 70),
(37, 'lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim', '2018-05-02 14:54:27', 11),
(38, 'ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst', '2017-01-25 04:44:12', 39),
(39, 'mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in', '2016-11-02 22:09:16', 79),
(40, 'tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero', '2016-03-04 03:40:25', 34),
(41, 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', '2018-07-22 06:27:28', 57),
(42, 'sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor', '2017-11-11 14:55:07', 91),
(43, 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh', '2016-12-11 03:32:07', 77),
(44, 'non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem', '2017-12-22 14:41:04', 88),
(45, 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue', '2018-07-22 21:57:28', 51),
(46, 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem', '2018-08-13 03:15:27', 65),
(47, 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi', '2017-06-05 16:27:54', 49),
(48, 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante', '2018-10-07 01:04:34', 97),
(49, 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut', '2017-03-29 09:18:56', 15),
(50, 'neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et', '2017-10-18 17:24:43', 21),
(51, 'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus', '2017-04-23 08:05:43', 17);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`auteur_id`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `message_event_id` (`message_content`(255));

--
-- Index pour la table `event_ht_list`
--
ALTER TABLE `event_ht_list`
  ADD PRIMARY KEY (`Eht_id`),
  ADD KEY `event_id` (`event_id`,`hashtag_id`),
  ADD KEY `event_ht_list_ibfk_2` (`hashtag_id`);

--
-- Index pour la table `hashtag`
--
ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`hashtag_id`);

--
-- Index pour la table `ht_list`
--
ALTER TABLE `ht_list`
  ADD KEY `message_id` (`message_id`,`hashtag_id`),
  ADD KEY `hashtag_id` (`hashtag_id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `auteur_id_2` (`auteur_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `auteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT pour la table `event_ht_list`
--
ALTER TABLE `event_ht_list`
  MODIFY `Eht_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `hashtag`
--
ALTER TABLE `hashtag`
  MODIFY `hashtag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `event_ht_list`
--
ALTER TABLE `event_ht_list`
  ADD CONSTRAINT `event_ht_list_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `event_ht_list_ibfk_2` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtag` (`hashtag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ht_list`
--
ALTER TABLE `ht_list`
  ADD CONSTRAINT `ht_list_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`),
  ADD CONSTRAINT `ht_list_ibfk_2` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtag` (`hashtag_id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_auteur` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`auteur_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
