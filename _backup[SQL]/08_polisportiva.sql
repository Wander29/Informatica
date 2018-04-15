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
-- Database: `08_polisportiva`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `corso`
--

CREATE TABLE IF NOT EXISTS `corso` (
  `CodCorso` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Descrizione` varchar(30) NOT NULL,
  `Num_lezioni` int(3) NOT NULL,
  `FK_Disciplina` int(3) unsigned NOT NULL,
  `FK_Istruttore` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodCorso`),
  KEY `FK_Disciplina` (`FK_Disciplina`,`FK_Istruttore`),
  KEY `FK_Istruttore` (`FK_Istruttore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `disciplina`
--

CREATE TABLE IF NOT EXISTS `disciplina` (
  `CodDisciplina` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`CodDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `frequenza`
--

CREATE TABLE IF NOT EXISTS `frequenza` (
  `FK_Socio` int(3) unsigned NOT NULL,
  `FK_Corso` int(3) unsigned NOT NULL,
  KEY `FK_Socio` (`FK_Socio`,`FK_Corso`),
  KEY `FK_Corso` (`FK_Corso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `istruttore`
--

CREATE TABLE IF NOT EXISTS `istruttore` (
  `CodIstruttore` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` int(3) NOT NULL,
  `Cognome` int(3) NOT NULL,
  `Età` int(3) NOT NULL,
  `Num_Corsi` int(3) NOT NULL,
  PRIMARY KEY (`CodIstruttore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `socio`
--

CREATE TABLE IF NOT EXISTS `socio` (
  `CodSocio` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Num_Corsi` int(3) NOT NULL,
  PRIMARY KEY (`CodSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `corso`
--
ALTER TABLE `corso`
  ADD CONSTRAINT `corso_ibfk_1` FOREIGN KEY (`FK_Disciplina`) REFERENCES `disciplina` (`CodDisciplina`),
  ADD CONSTRAINT `corso_ibfk_2` FOREIGN KEY (`FK_Istruttore`) REFERENCES `istruttore` (`CodIstruttore`);

--
-- Limiti per la tabella `frequenza`
--
ALTER TABLE `frequenza`
  ADD CONSTRAINT `frequenza_ibfk_1` FOREIGN KEY (`FK_Corso`) REFERENCES `corso` (`CodCorso`),
  ADD CONSTRAINT `frequenza_ibfk_2` FOREIGN KEY (`FK_Socio`) REFERENCES `socio` (`CodSocio`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
