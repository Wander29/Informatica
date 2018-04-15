-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Ott 16, 2017 alle 12:31
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `03_campionatosportivo[11-10-17]`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `concorrente`
--

CREATE TABLE IF NOT EXISTS `concorrente` (
  `Codice` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Cognome` varchar(30) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Nazionalità` varchar(30) NOT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dump dei dati per la tabella `concorrente`
--

INSERT INTO `concorrente` (`Codice`, `Cognome`, `Nome`, `Nazionalità`) VALUES
(1, 'Rossi', 'Gatto', 'Italia'),
(2, 'Micio', 'Mario', 'Germania'),
(3, 'Michael', 'Sturaben', 'Uzbekistan');

-- --------------------------------------------------------

--
-- Struttura della tabella `gara`
--

CREATE TABLE IF NOT EXISTS `gara` (
  `CodGara` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(30) NOT NULL,
  `Località` varchar(20) NOT NULL,
  `Data` date NOT NULL,
  PRIMARY KEY (`CodGara`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `gara`
--

INSERT INTO `gara` (`CodGara`, `Descrizione`, `Località`, `Data`) VALUES
(1, 'Motegi', 'Giappone', '2017-09-17'),
(2, 'Monza', 'Italia', '2017-10-01');

-- --------------------------------------------------------

--
-- Struttura della tabella `risultato`
--

CREATE TABLE IF NOT EXISTS `risultato` (
  `CodRis` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Punti` int(3) unsigned DEFAULT NULL,
  `Posizione` int(3) unsigned DEFAULT NULL,
  `FK_Conc` int(3) unsigned NOT NULL,
  `FK_Gara` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodRis`),
  KEY `FK_Conc` (`FK_Conc`),
  KEY `FK_Gara` (`FK_Gara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `risultato`
--
ALTER TABLE `risultato`
  ADD CONSTRAINT `risultato_ibfk_1` FOREIGN KEY (`FK_Gara`) REFERENCES `gara` (`CodGara`),
  ADD CONSTRAINT `risultato_ibfk_2` FOREIGN KEY (`FK_Conc`) REFERENCES `concorrente` (`Codice`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
