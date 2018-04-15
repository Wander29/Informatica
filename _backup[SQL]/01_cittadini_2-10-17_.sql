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
-- Database: `01_cittadini[2-10-17]`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CodiceCliente` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `RagioneSociale` varchar(80) NOT NULL,
  `Indirizzo` varchar(100) NOT NULL,
  `NumTelefono` varchar(12) NOT NULL,
  `PartitaIVA` varchar(25) NOT NULL,
  `CodiceAgente` int(3) NOT NULL,
  `Fido` decimal(4,2) DEFAULT NULL,
  `CodLocalità` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodiceCliente`),
  KEY `CodLocalità` (`CodLocalità`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `località`
--

CREATE TABLE IF NOT EXISTS `località` (
  `Codice` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `CAP` varchar(5) NOT NULL,
  `Nome` varchar(40) NOT NULL,
  `SiglaProvincia` varchar(2) NOT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`CodLocalità`) REFERENCES `località` (`Codice`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
