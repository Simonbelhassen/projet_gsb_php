-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : Dim 27 mars 2022 à 16:59
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `BDD-GSB`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `dateEmprunter` date NOT NULL,
  `dateRestituer` date DEFAULT NULL,
  `vis_matricule` char(10) NOT NULL,
  `idMateriel` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emprunter`
--

INSERT INTO `emprunter` (`dateEmprunter`, `dateRestituer`, `vis_matricule`, `idMateriel`) VALUES
('2021-12-20', '2021-12-22', 'a17', 1),
('2022-03-14', '2022-06-17', 'a17', 2),
('2021-12-27', '2021-12-30', 'a55', 5),
('2021-12-27', '2021-12-30', 'a93', 3),
('2021-11-08', '2021-11-18', 'b16', 5),
('2022-01-20', '2022-03-09', 'b28', 1),
('2021-10-11', '2021-12-15', 'b28', 4),
('2022-01-20', NULL, 'b28', 4),
('2021-11-23', NULL, 'b34', 3),
('2021-12-20', '2021-12-29', 'b4', 4),
('2021-12-25', NULL, 'b4', 4),
('2022-01-20', NULL, 'b4', 4),
('2022-01-20', NULL, 'c14', 5);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `Id` int(30) NOT NULL,
  `Marque` varchar(120) DEFAULT NULL,
  `Dimension` varchar(50) DEFAULT NULL,
  `Modele` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`Id`, `Marque`, `Dimension`, `Modele`) VALUES
(1, 'apple', '13', 'MacBook Air'),
(2, 'apple', '16', 'MacBook Air'),
(3, 'apple', '16', 'MacBook Pro'),
(4, 'apple', '13', 'MacBook Pro'),
(5, 'apple', '11', 'MacBook Pro');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `VIS_MATRICULE` char(10) NOT NULL,
  `VIS_NOM` char(25) DEFAULT NULL,
  `VIS_PRENOM` char(50) DEFAULT NULL,
  `VIS_ADRESSE` char(50) DEFAULT NULL,
  `VIS_CP` char(5) DEFAULT NULL,
  `VIS_VILLE` char(30) DEFAULT NULL,
  `VIS_DATEEMBAUCHE` datetime DEFAULT NULL,
  `SEC_CODE` char(1) DEFAULT NULL,
  `LAB_CODE` char(2) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL,
  `adresseMail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`VIS_MATRICULE`, `VIS_NOM`, `VIS_PRENOM`, `VIS_ADRESSE`, `VIS_CP`, `VIS_VILLE`, `VIS_DATEEMBAUCHE`, `SEC_CODE`, `LAB_CODE`, `mdp`, `adresseMail`) VALUES
('a17', 'Andre', 'David', '3 r Aimon de Chiss', '38100', 'Grenoble', '0000-00-00 00:00:00', '', 'GY', '12334', 'andredavid@gmail.com'),
('a55', 'Bedos', 'Christian', '1 r B', '65000', 'TARBES', '0000-00-00 00:00:00', '', 'GY', '11111', 'bedoschristian@gmail.com'),
('a93', 'Tusseau', 'Louis', '22 r Renou', '86000', 'POITIERS', '0000-00-00 00:00:00', '', 'SW', '12345UG5I', 'tusseaulouis@gmail.com'),
('aaa', 'aaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SDFGHJ', NULL),
('b13', 'Bentot', 'Pascal', '11 av 6 Juin', '67000', 'STRASBOURG', '0000-00-00 00:00:00', '', 'GY', 'qsdfghhj', 'bentotpascal@gmail.com'),
('b16', 'Bioret', 'Luc', '1 r Linne', '35000', 'RENNES', '0000-00-00 00:00:00', '', 'SW', 'AERTY', 'bioretluc@gmail.com'),
('b19', 'Bunisset', 'Francis', '10 r Nicolas Chorier', '85000', 'LA ROCHE SUR YON', '0000-00-00 00:00:00', '', 'GY', 'wxcvbn,', 'bunissetfrancis@gmail.com'),
('b25', 'Bunisset', 'Denise', '1 r Lionne', '49100', 'ANGERS', '0000-00-00 00:00:00', '', 'SW', '123456789098', 'bunissetdenise@gmail.com'),
('b28', 'Cacheux', 'Bernard', '114 r Authie', '34000', 'MONTPELLIER', '0000-00-00 00:00:00', '', 'GY', 'qsdfghjklmù', 'cacheuxbernard@gmail.com'),
('b34', 'Cadic', 'Eric', '123 r Caponi', '41000', 'BLOIS', '0000-00-00 00:00:00', 'P', 'SW', 'mlkjhgf', NULL),
('b4', 'Charoze', 'Catherine', '100 pl G', '33000', 'BORDEAUX', '0000-00-00 00:00:00', '', 'SW', 'poiuytrez', NULL),
('b50', 'Clepkens', 'Christophe', '12 r F', '13000', 'MARSEILLE', '0000-00-00 00:00:00', '', 'SW', 'nbvcxw', NULL),
('b59', 'Cottin', 'Vincenne', '36 sq Capucins', '5000', 'GAP', '0000-00-00 00:00:00', '', 'GY', 'zertyuioiuyt', NULL),
('c14', 'Daburon', 'Fran', '13 r Champs Elys', '6000', 'NICE', '0000-00-00 00:00:00', 'S', 'SW', '123456765432', NULL),
('c3', 'De', 'Philippe', '13 r Charles Peguy', '10000', 'TROYES', '0000-00-00 00:00:00', '', 'SW', '09876567890', NULL),
('c54', 'Debelle', 'Michel', '181 r Caponi', '88000', 'EPINAL', '0000-00-00 00:00:00', '', 'SW', '12345676543212', NULL),
('d13', 'Debelle', 'Jeanne', '134 r Stalingrad', '44000', 'NANTES', '0000-00-00 00:00:00', '', 'SW', '1234543', NULL),
('d51', 'Debroise', 'Michel', '2 av 6 Juin', '70000', 'VESOUL', '0000-00-00 00:00:00', 'E', 'GY', '3432345', NULL),
('e22', 'Desmarquest', 'Nathalie', '14 r F', '54000', 'NANCY', '0000-00-00 00:00:00', '', 'GY', '0987898789', NULL),
('e24', 'Desnost', 'Pierre', '16 r Barral de Montferrat', '55000', 'VERDUN', '0000-00-00 00:00:00', 'E', 'SW', '23432345', NULL),
('e39', 'Dudouit', 'Fr', '18 quai Xavier Jouvin', '75000', 'PARIS', '0000-00-00 00:00:00', '', 'GY', '34543', NULL),
('e49', 'Duncombe', 'Claude', '19 av Alsace Lorraine', '9000', 'FOIX', '0000-00-00 00:00:00', '', 'GY', '23EDE3E', NULL),
('e5', 'Enault-Pascreau', 'C', '25B r Stalingrad', '40000', 'MONT DE MARSAN', '0000-00-00 00:00:00', 'S', 'GY', '3E4R4R4', NULL),
('e52', 'Eynde', 'Val', '3 r Henri Moissan', '76000', 'ROUEN', '0000-00-00 00:00:00', '', 'GY', '5R45TR5TR5', NULL),
('f21', 'Finck', 'Jacques', 'rte Montreuil Bellay', '74000', 'ANNECY', '0000-00-00 00:00:00', '', 'SW', '3EDEDER', NULL),
('f39', 'Fr', 'Fernande', '4 r Jean Giono', '69000', 'LYON', '0000-00-00 00:00:00', '', 'GY', '345RE4', NULL),
('f4', 'Gest', 'Alain', '30 r Authie', '46000', 'FIGEAC', '0000-00-00 00:00:00', '', 'GY', '67878U8', NULL),
('g19', 'Gheysen', 'Galassus', '32 bd Mar Foch', '75000', 'PARIS', '0000-00-00 00:00:00', '', 'SW', '98I9I9', NULL),
('g30', 'Girard', 'Yvon', '31 av 6 Juin', '80000', 'AMIENS', '0000-00-00 00:00:00', 'N', 'GY', 'YTHYHYHY', NULL),
('g53', 'Gombert', 'Luc', '32 r Emile Gueymard', '56000', 'VANNES', '0000-00-00 00:00:00', '', 'GY', 'RTGTRYUIU', NULL),
('g7', 'Guindon', 'Caroline', '40 r Mar Montgomery', '87000', 'LIMOGES', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('h13', 'Guindon', 'Fran', '44 r Picoti', '19000', 'TULLE', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('h30', 'Igigabel', 'Guy', '33 gal Arlequin', '94000', 'CRETEIL', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('h35', 'Jourdren', 'Pierre', '34 av Jean Perrot', '15000', 'AURRILLAC', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('h40', 'Juttard', 'Pierre-Raoul', '34 cours Jean Jaur', '8000', 'SEDAN', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('j45', 'Labour', 'Saout', '38 cours Berriat', '52000', 'CHAUMONT', '0000-00-00 00:00:00', 'N', 'SW', NULL, NULL),
('j50', 'Landr', 'Philippe', '4 av G', '59000', 'LILLE', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('j8', 'Langeard', 'Hugues', '39 av Jean Perrot', '93000', 'BAGNOLET', '0000-00-00 00:00:00', 'P', 'GY', NULL, NULL),
('k4', 'Lanne', 'Bernard', '4 r Bayeux', '30000', 'NIMES', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('k53', 'Le', 'No', '4 av Beauvert', '68000', 'MULHOUSE', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('l14', 'Le', 'Jean', '39 r Raspail', '53000', 'LAVAL', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('l23', 'Leclercq', 'Servane', '11 r Quinconce', '18000', 'BOURGES', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('l46', 'Lecornu', 'Jean-Bernard', '4 bd Mar Foch', '72000', 'LA FERTE BERNARD', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('l56', 'Lecornu', 'Ludovic', '4 r Abel Servien', '25000', 'BESANCON', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('m35', 'Lejard', 'Agn', '4 r Anthoard', '82000', 'MONTAUBAN', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('m45', 'Lesaulnier', 'Pascal', '47 r Thiers', '57000', 'METZ', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('n42', 'Letessier', 'St', '5 chem Capuche', '27000', 'EVREUX', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('n58', 'Loirat', 'Didier', 'Les P', '45000', 'ORLEANS', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('n59', 'Maffezzoli', 'Thibaud', '5 r Chateaubriand', '2000', 'LAON', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('o26', 'Mancini', 'Anne', '5 r D\'Agier', '48000', 'MENDE', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('p32', 'Marcouiller', 'G', '7 pl St Gilles', '91000', 'ISSY LES MOULINEAUX', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('p40', 'Michel', 'Jean-Claude', '5 r Gabriel P', '61000', 'FLERS', '0000-00-00 00:00:00', 'O', 'SW', NULL, NULL),
('p41', 'Montecot', 'Fran', '6 r Paul Val', '17000', 'SAINTES', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('p42', 'Notini', 'Veronique', '5 r Lieut Chabal', '60000', 'BEAUVAIS', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('p49', 'Onfroy', 'Den', '5 r Sidonie Jacolin', '37000', 'TOURS', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('p6', 'Pascreau', 'Charles', '57 bd Mar Foch', '64000', 'PAU', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('p7', 'Pernot', 'Claude-No', '6 r Alexandre 1 de Yougoslavie', '11000', 'NARBONNE', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('p8', 'Perrier', 'Ma', '6 r Aubert Dubayet', '71000', 'CHALON SUR SAONE', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('q17', 'Petit', 'Jean-Louis', '7 r Ernest Renan', '50000', 'SAINT LO', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('r24', 'Piquery', 'Patrick', '9 r Vaucelles', '14000', 'CAEN', '0000-00-00 00:00:00', 'O', 'GY', NULL, NULL),
('r58', 'Quiquandon', 'Jo', '7 r Ernest Renan', '29000', 'QUIMPER', '0000-00-00 00:00:00', '', 'GY', NULL, NULL),
('s10', 'Retailleau', 'Josselin', '88Bis r Saumuroise', '39000', 'DOLE', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('s21', 'Retailleau', 'Pascal', '32 bd Ayrault', '23000', 'MONTLUCON', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('t43', 'Souron', 'Maryse', '7B r Gay Lussac', '21000', 'DIJON', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('t47', 'Tiphagne', 'Patrick', '7B r Gay Lussac', '62000', 'ARRAS', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('t55', 'Tr', 'Alain', '7D chem Barral', '12000', 'RODEZ', '0000-00-00 00:00:00', '', 'SW', NULL, NULL),
('t60', 'Tusseau', 'Josselin', '63 r Bon Repos', '28000', 'CHARTRES', '0000-00-00 00:00:00', '', 'GY', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD PRIMARY KEY (`vis_matricule`,`idMateriel`,`dateEmprunter`) USING BTREE,
  ADD KEY `dateEmprunter` (`dateEmprunter`),
  ADD KEY `idMateriel` (`idMateriel`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`VIS_MATRICULE`),
  ADD KEY `DEPENDRE_FK` (`LAB_CODE`),
  ADD KEY `SEC_CODE` (`SEC_CODE`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`vis_matricule`) REFERENCES `visiteur` (`VIS_MATRICULE`),
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
