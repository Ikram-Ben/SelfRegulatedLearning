-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 24 juin 2020 à 15:33
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `srl_tool`
--

-- --------------------------------------------------------

--
-- Structure de la table `accomplir_objectif`
--

DROP TABLE IF EXISTS `accomplir_objectif`;
CREATE TABLE IF NOT EXISTS `accomplir_objectif` (
  `Objectif_idObjectifs` int(11) NOT NULL,
  `Strategie_idStrategie` int(11) NOT NULL,
  PRIMARY KEY (`Objectif_idObjectifs`,`Strategie_idStrategie`),
  KEY `fk_Objectif_has_Strategie_Strategie1_idx` (`Strategie_idStrategie`),
  KEY `fk_Objectif_has_Strategie_Objectif1_idx` (`Objectif_idObjectifs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

DROP TABLE IF EXISTS `apprenant`;
CREATE TABLE IF NOT EXISTS `apprenant` (
  `idApprenant` int(11) NOT NULL AUTO_INCREMENT,
  `nomApprenant` varchar(45) NOT NULL,
  `prenomApprenant` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mot_de_passe` varchar(12) NOT NULL,
  PRIMARY KEY (`idApprenant`,`nomApprenant`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apprenant`
--

INSERT INTO `apprenant` (`idApprenant`, `nomApprenant`, `prenomApprenant`, `email`, `mot_de_passe`) VALUES
(1, 'ikram', 'ben', 'ikram@gmail.com', 'jkbfv'),
(8, 'nawel', 'tahri', 'nawel@gmail.com', 'ljncd');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `idCours` int(11) NOT NULL AUTO_INCREMENT,
  `nomCours` varchar(45) NOT NULL,
  `descriptionCours` varchar(45) DEFAULT NULL,
  `Apprenant_idApprenant` int(11) NOT NULL,
  `Apprenant_nomApprenant` varchar(45) NOT NULL,
  PRIMARY KEY (`idCours`,`Apprenant_idApprenant`,`Apprenant_nomApprenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

DROP TABLE IF EXISTS `indicateur`;
CREATE TABLE IF NOT EXISTS `indicateur` (
  `idIndicateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `valeurIndicateur` float NOT NULL,
  `Strategie_idStrategie` int(11) NOT NULL,
  `Resultat_idResultat` int(11) NOT NULL,
  PRIMARY KEY (`idIndicateur`,`Resultat_idResultat`),
  KEY `fk_Indicateur_Resultat1_idx` (`Resultat_idResultat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `objectif`
--

DROP TABLE IF EXISTS `objectif`;
CREATE TABLE IF NOT EXISTS `objectif` (
  `idObjectifs` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `Apprenant_idApprenant` int(11) NOT NULL,
  PRIMARY KEY (`idObjectifs`),
  KEY `fk_Objectif_Apprenant_idx` (`Apprenant_idApprenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `resultat`
--

DROP TABLE IF EXISTS `resultat`;
CREATE TABLE IF NOT EXISTS `resultat` (
  `idResultat` int(11) NOT NULL AUTO_INCREMENT,
  `valeurResultat` float NOT NULL,
  `valeurNormale` float NOT NULL,
  `Strategie_idStrategie` int(11) NOT NULL,
  `Strategie_Indicateur_idIndicateur` int(11) NOT NULL,
  `Cours_idCours` int(11) NOT NULL,
  `Cours_Apprenant_idApprenant` int(11) NOT NULL,
  `Cours_Apprenant_nomApprenant` varchar(45) NOT NULL,
  PRIMARY KEY (`idResultat`,`Strategie_idStrategie`,`Strategie_Indicateur_idIndicateur`,`Cours_idCours`,`Cours_Apprenant_idApprenant`,`Cours_Apprenant_nomApprenant`),
  KEY `fk_Resultat_Strategie1_idx` (`Strategie_idStrategie`,`Strategie_Indicateur_idIndicateur`),
  KEY `fk_Resultat_Cours1_idx` (`Cours_idCours`,`Cours_Apprenant_idApprenant`,`Cours_Apprenant_nomApprenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `strategie`
--

DROP TABLE IF EXISTS `strategie`;
CREATE TABLE IF NOT EXISTS `strategie` (
  `idStrategie` int(11) NOT NULL AUTO_INCREMENT,
  `nomStrategie` varchar(45) NOT NULL,
  `descriptionStrategie` varchar(200) NOT NULL,
  `Indicateur_idIndicateur` int(11) NOT NULL,
  PRIMARY KEY (`idStrategie`,`Indicateur_idIndicateur`),
  KEY `fk_Strategie_Indicateur1_idx` (`Indicateur_idIndicateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
CREATE TABLE IF NOT EXISTS `suivre` (
  `Apprenant_idApprenant` int(11) NOT NULL,
  `Cours_idCours` int(11) NOT NULL,
  `idMooc` varchar(45) NOT NULL,
  `nomMooc` varchar(45) NOT NULL,
  PRIMARY KEY (`Apprenant_idApprenant`,`Cours_idCours`),
  KEY `fk_Apprenant_has_Cours_Cours1_idx` (`Cours_idCours`),
  KEY `fk_Apprenant_has_Cours_Apprenant1_idx` (`Apprenant_idApprenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `trace`
--

DROP TABLE IF EXISTS `trace`;
CREATE TABLE IF NOT EXISTS `trace` (
  `idTrace` int(11) NOT NULL AUTO_INCREMENT,
  `nomTrace` varchar(45) NOT NULL,
  `valeurTrace` float DEFAULT NULL,
  `Apprenant_idApprenant` int(11) NOT NULL,
  `Indicateur_idIndicateur` int(11) NOT NULL,
  PRIMARY KEY (`idTrace`),
  KEY `fk_Trace_Apprenant1_idx` (`Apprenant_idApprenant`),
  KEY `fk_Trace_Indicateur1_idx` (`Indicateur_idIndicateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accomplir_objectif`
--
ALTER TABLE `accomplir_objectif`
  ADD CONSTRAINT `fk_Objectif_has_Strategie_Objectif1` FOREIGN KEY (`Objectif_idObjectifs`) REFERENCES `objectif` (`idObjectifs`),
  ADD CONSTRAINT `fk_Objectif_has_Strategie_Strategie1` FOREIGN KEY (`Strategie_idStrategie`) REFERENCES `strategie` (`idStrategie`);

--
-- Contraintes pour la table `indicateur`
--
ALTER TABLE `indicateur`
  ADD CONSTRAINT `fk_Indicateur_Resultat1` FOREIGN KEY (`Resultat_idResultat`) REFERENCES `resultat` (`idResultat`);

--
-- Contraintes pour la table `objectif`
--
ALTER TABLE `objectif`
  ADD CONSTRAINT `fk_Objectif_Apprenant` FOREIGN KEY (`Apprenant_idApprenant`) REFERENCES `apprenant` (`idApprenant`);

--
-- Contraintes pour la table `resultat`
--
ALTER TABLE `resultat`
  ADD CONSTRAINT `fk_Resultat_Cours1` FOREIGN KEY (`Cours_idCours`,`Cours_Apprenant_idApprenant`,`Cours_Apprenant_nomApprenant`) REFERENCES `cours` (`idCours`, `Apprenant_idApprenant`, `Apprenant_nomApprenant`),
  ADD CONSTRAINT `fk_Resultat_Strategie1` FOREIGN KEY (`Strategie_idStrategie`,`Strategie_Indicateur_idIndicateur`) REFERENCES `strategie` (`idStrategie`, `Indicateur_idIndicateur`);

--
-- Contraintes pour la table `strategie`
--
ALTER TABLE `strategie`
  ADD CONSTRAINT `fk_Strategie_Indicateur1` FOREIGN KEY (`Indicateur_idIndicateur`) REFERENCES `indicateur` (`idIndicateur`);

--
-- Contraintes pour la table `suivre`
--
ALTER TABLE `suivre`
  ADD CONSTRAINT `fk_Apprenant_has_Cours_Apprenant1` FOREIGN KEY (`Apprenant_idApprenant`) REFERENCES `apprenant` (`idApprenant`),
  ADD CONSTRAINT `fk_Apprenant_has_Cours_Cours1` FOREIGN KEY (`Cours_idCours`) REFERENCES `cours` (`idCours`);

--
-- Contraintes pour la table `trace`
--
ALTER TABLE `trace`
  ADD CONSTRAINT `fk_Trace_Apprenant1` FOREIGN KEY (`Apprenant_idApprenant`) REFERENCES `apprenant` (`idApprenant`),
  ADD CONSTRAINT `fk_Trace_Indicateur1` FOREIGN KEY (`Indicateur_idIndicateur`) REFERENCES `indicateur` (`idIndicateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;