-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Gen 15, 2018 alle 13:00
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `[2018-01-01]casaeditrice`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `abbonamento`
--

CREATE TABLE IF NOT EXISTS `abbonamento` (
  `CodAbbonamento` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `FK_Rivista` int(3) unsigned NOT NULL,
  `FK_Abbonato` int(3) unsigned NOT NULL,
  `DataSottoscrizione` date NOT NULL,
  PRIMARY KEY (`CodAbbonamento`),
  KEY `FK_Rivista` (`FK_Rivista`),
  KEY `FK_Abbonato` (`FK_Abbonato`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `abbonamento`
--

INSERT INTO `abbonamento` (`CodAbbonamento`, `FK_Rivista`, `FK_Abbonato`, `DataSottoscrizione`) VALUES
(1, 1, 1, '2017-01-10'),
(2, 5, 6, '2017-02-12'),
(3, 4, 2, '2017-06-11'),
(4, 2, 3, '2017-03-21'),
(5, 3, 5, '2017-12-11'),
(6, 5, 4, '2017-01-21'),
(7, 2, 2, '2017-07-13');

-- --------------------------------------------------------

--
-- Struttura della tabella `abbonato`
--

CREATE TABLE IF NOT EXISTS `abbonato` (
  `CodAbbonato` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `CittaResidenza` varchar(30) NOT NULL,
  PRIMARY KEY (`CodAbbonato`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `abbonato`
--

INSERT INTO `abbonato` (`CodAbbonato`, `Nome`, `Cognome`, `CittaResidenza`) VALUES
(1, 'Marco', 'Riccardi', 'Terni'),
(2, 'Luca', 'Proietti', 'Perugia'),
(3, 'Giovanni', 'Terzi', 'Milano'),
(4, 'Mario', 'Gigli', 'Torino'),
(5, 'Gioia', 'Pezzi', 'Parma'),
(6, 'Gatto', 'Micio', 'Terni');

-- --------------------------------------------------------

--
-- Struttura della tabella `periodicita`
--

CREATE TABLE IF NOT EXISTS `periodicita` (
  `CodPeriod` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`CodPeriod`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `periodicita`
--

INSERT INTO `periodicita` (`CodPeriod`, `Tipo`) VALUES
(1, 'Quotidiano'),
(2, 'Settimanale'),
(3, 'Mensile'),
(4, 'Bimestrale'),
(5, 'Trimestrale'),
(6, 'Semestrale'),
(7, 'Annuale');

-- --------------------------------------------------------

--
-- Struttura della tabella `rivista`
--

CREATE TABLE IF NOT EXISTS `rivista` (
  `CodRivista` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(30) NOT NULL,
  `Prezzo` decimal(5,2) unsigned NOT NULL,
  `FK_Periodicita` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodRivista`),
  KEY `FK_Periodicita` (`FK_Periodicita`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `rivista`
--

INSERT INTO `rivista` (`CodRivista`, `Titolo`, `Prezzo`, `FK_Periodicita`) VALUES
(1, 'Focus', '3.00', 3),
(2, 'Quattroruote', '5.00', 4),
(3, 'Gazzetta', '1.00', 1),
(4, 'Corriere', '1.00', 1),
(5, 'Micio', '66.00', 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
