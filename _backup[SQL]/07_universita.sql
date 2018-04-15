-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2017 alle 12:35
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `07_universita`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `corso`
--

CREATE TABLE IF NOT EXISTS `corso` (
  `CodCorso` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Anno` varchar(7) NOT NULL,
  PRIMARY KEY (`CodCorso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `esame`
--

CREATE TABLE IF NOT EXISTS `esame` (
  `CodEsame` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Crediti` int(2) NOT NULL,
  `Voto` int(2) unsigned NOT NULL,
  `FK_Corso` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodEsame`),
  KEY `FK_Corso` (`FK_Corso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `studente`
--

CREATE TABLE IF NOT EXISTS `studente` (
  `CodMatricola` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Cognome` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Residenza` varchar(50) NOT NULL,
  `DataNascita` date NOT NULL,
  PRIMARY KEY (`CodMatricola`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `uniscistudenticorso`
--

CREATE TABLE IF NOT EXISTS `uniscistudenticorso` (
  `FK_Studente` int(3) unsigned NOT NULL,
  `FK_Corso` int(3) unsigned NOT NULL,
  KEY `FK_Studente` (`FK_Studente`,`FK_Corso`),
  KEY `FK_Corso` (`FK_Corso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `uniscistudentiesame`
--

CREATE TABLE IF NOT EXISTS `uniscistudentiesame` (
  `FK_Studente` int(3) unsigned NOT NULL,
  `FK_Esame` int(3) unsigned NOT NULL,
  KEY `FK_Studente` (`FK_Studente`,`FK_Esame`),
  KEY `FK_Esame` (`FK_Esame`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `esame`
--
ALTER TABLE `esame`
  ADD CONSTRAINT `esame_ibfk_1` FOREIGN KEY (`FK_Corso`) REFERENCES `corso` (`CodCorso`);

--
-- Limiti per la tabella `uniscistudenticorso`
--
ALTER TABLE `uniscistudenticorso`
  ADD CONSTRAINT `uniscistudenticorso_ibfk_1` FOREIGN KEY (`FK_Studente`) REFERENCES `studente` (`CodMatricola`),
  ADD CONSTRAINT `uniscistudenticorso_ibfk_2` FOREIGN KEY (`FK_Corso`) REFERENCES `corso` (`CodCorso`);

--
-- Limiti per la tabella `uniscistudentiesame`
--
ALTER TABLE `uniscistudentiesame`
  ADD CONSTRAINT `uniscistudentiesame_ibfk_1` FOREIGN KEY (`FK_Studente`) REFERENCES `studente` (`CodMatricola`),
  ADD CONSTRAINT `uniscistudentiesame_ibfk_2` FOREIGN KEY (`FK_Esame`) REFERENCES `esame` (`CodEsame`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
