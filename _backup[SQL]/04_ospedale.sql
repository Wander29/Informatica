-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Ott 18, 2017 alle 12:02
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `04_ospedale`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `chirurgo`
--

CREATE TABLE IF NOT EXISTS `chirurgo` (
  `CodChirurgo` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Cognome` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Specializzazione` varchar(30) NOT NULL,
  PRIMARY KEY (`CodChirurgo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `chirurgo`
--

INSERT INTO `chirurgo` (`CodChirurgo`, `Cognome`, `Nome`, `Specializzazione`) VALUES
(1, 'Aramdoro', 'Paolo', 'plastica'),
(2, 'Kawal', 'Subeedaar', 'vascolare');

-- --------------------------------------------------------

--
-- Struttura della tabella `intervento`
--

CREATE TABLE IF NOT EXISTS `intervento` (
  `DataOperazione` date NOT NULL,
  `OraOperazione` time NOT NULL,
  `SalaOperatoria` int(3) NOT NULL,
  `FK_Paziente` int(3) unsigned NOT NULL,
  `FK_Chirurgo` int(3) unsigned NOT NULL,
  KEY `FK_Intervento` (`FK_Paziente`,`FK_Chirurgo`),
  KEY `FK_Chirurgo` (`FK_Chirurgo`),
  KEY `FK_Paziente` (`FK_Paziente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `paziente`
--

CREATE TABLE IF NOT EXISTS `paziente` (
  `CodPaziente` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Cognome` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Indirizzo` varchar(50) NOT NULL,
  `NumTelefono` varchar(12) NOT NULL,
  PRIMARY KEY (`CodPaziente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ricovero`
--

CREATE TABLE IF NOT EXISTS `ricovero` (
  `InizioRicovero` datetime NOT NULL,
  `FineRicovero` datetime NOT NULL,
  `FK_Paziente` int(3) unsigned NOT NULL,
  `FK_Stanza` int(3) unsigned NOT NULL,
  PRIMARY KEY (`FK_Stanza`),
  KEY `FK_Stanza` (`FK_Stanza`),
  KEY `FK_Paziente` (`FK_Paziente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `stanza`
--

CREATE TABLE IF NOT EXISTS `stanza` (
  `CodStanza` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Telefono` tinyint(1) NOT NULL,
  `Televisore` tinyint(1) NOT NULL,
  `AriaCond` tinyint(1) NOT NULL,
  PRIMARY KEY (`CodStanza`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `stanza`
--

INSERT INTO `stanza` (`CodStanza`, `Telefono`, `Televisore`, `AriaCond`) VALUES
(1, 1, 1, 0),
(2, 0, 0, 1);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `intervento`
--
ALTER TABLE `intervento`
  ADD CONSTRAINT `intervento_ibfk_1` FOREIGN KEY (`FK_Chirurgo`) REFERENCES `chirurgo` (`CodChirurgo`);

--
-- Limiti per la tabella `paziente`
--
ALTER TABLE `paziente`
  ADD CONSTRAINT `paziente_ibfk_1` FOREIGN KEY (`CodPaziente`) REFERENCES `intervento` (`FK_Paziente`);

--
-- Limiti per la tabella `ricovero`
--
ALTER TABLE `ricovero`
  ADD CONSTRAINT `ricovero_ibfk_2` FOREIGN KEY (`FK_Paziente`) REFERENCES `paziente` (`CodPaziente`),
  ADD CONSTRAINT `ricovero_ibfk_1` FOREIGN KEY (`FK_Stanza`) REFERENCES `stanza` (`CodStanza`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
