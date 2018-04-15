-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2017 alle 13:47
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `autovetture_venturi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `alimentazione`
--

CREATE TABLE IF NOT EXISTS `alimentazione` (
  `CodAlimentazione` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`CodAlimentazione`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `alimentazione`
--

INSERT INTO `alimentazione` (`CodAlimentazione`, `Tipo`) VALUES
(1, ''),
(2, 'Benzina'),
(3, 'Diesel'),
(4, 'GPL'),
(5, 'Metano'),
(6, 'Elettrico');

-- --------------------------------------------------------

--
-- Struttura della tabella `autoveicolo`
--

CREATE TABLE IF NOT EXISTS `autoveicolo` (
  `CodAuto` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `DataProduzione` date NOT NULL,
  `NumTelaio` varchar(30) NOT NULL,
  `PrezzoAcquisto` decimal(6,2) unsigned NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `FK_Alimentazione` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodAuto`),
  KEY `FK_Alimentazione` (`FK_Alimentazione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `proprietario`
--

CREATE TABLE IF NOT EXISTS `proprietario` (
  `Cod_Proprietario` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  PRIMARY KEY (`Cod_Proprietario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `unisci_auto_proprietario`
--

CREATE TABLE IF NOT EXISTS `unisci_auto_proprietario` (
  `FK_Auto` int(3) unsigned NOT NULL,
  `FK_Proprietario` int(3) unsigned NOT NULL,
  KEY `FK_Proprietario` (`FK_Proprietario`),
  KEY `FK_Auto` (`FK_Auto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `autoveicolo`
--
ALTER TABLE `autoveicolo`
  ADD CONSTRAINT `autoveicolo_ibfk_1` FOREIGN KEY (`FK_Alimentazione`) REFERENCES `alimentazione` (`CodAlimentazione`);

--
-- Limiti per la tabella `unisci_auto_proprietario`
--
ALTER TABLE `unisci_auto_proprietario`
  ADD CONSTRAINT `unisci_auto_proprietario_ibfk_1` FOREIGN KEY (`FK_Auto`) REFERENCES `autoveicolo` (`CodAuto`),
  ADD CONSTRAINT `unisci_auto_proprietario_ibfk_2` FOREIGN KEY (`FK_Proprietario`) REFERENCES `proprietario` (`Cod_Proprietario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
