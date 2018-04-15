-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Ott 16, 2017 alle 12:32
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `02_museo[09-10-17]`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `artista`
--

CREATE TABLE IF NOT EXISTS `artista` (
  `CodiceArtista` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `NomeArtista` varchar(30) NOT NULL,
  `CognomeArtista` varchar(30) NOT NULL,
  `DataNascita` date NOT NULL,
  `DataMorte` date DEFAULT NULL,
  PRIMARY KEY (`CodiceArtista`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `città`
--

CREATE TABLE IF NOT EXISTS `città` (
  `CodiceCittà` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(40) NOT NULL,
  `Nazione` varchar(20) NOT NULL,
  PRIMARY KEY (`CodiceCittà`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `museo`
--

CREATE TABLE IF NOT EXISTS `museo` (
  `CodiceMuseo` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `NomeMuseo` varchar(40) NOT NULL,
  `CodCittà` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodiceMuseo`),
  KEY `CodCittà` (`CodCittà`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `opera`
--

CREATE TABLE IF NOT EXISTS `opera` (
  `NumeroCatalogo` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(40) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Anno` year(4) NOT NULL COMMENT 'a.C --> using ''-''',
  `CodMus` int(3) unsigned NOT NULL,
  `CodArt` int(3) unsigned NOT NULL,
  PRIMARY KEY (`NumeroCatalogo`),
  KEY `CodMus` (`CodMus`,`CodArt`),
  KEY `opera_ibfk_2` (`CodArt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `museo`
--
ALTER TABLE `museo`
  ADD CONSTRAINT `museo_ibfk_1` FOREIGN KEY (`CodCittà`) REFERENCES `città` (`CodiceCittà`);

--
-- Limiti per la tabella `opera`
--
ALTER TABLE `opera`
  ADD CONSTRAINT `opera_ibfk_1` FOREIGN KEY (`CodMus`) REFERENCES `museo` (`CodiceMuseo`),
  ADD CONSTRAINT `opera_ibfk_2` FOREIGN KEY (`CodArt`) REFERENCES `artista` (`CodiceArtista`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
