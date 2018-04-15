-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2018 alle 12:59
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `[2018-02-28]rappresentanti`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CodCliente` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `FK_rappr` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodCliente`),
  KEY `FK_rappr` (`FK_rappr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `fattura`
--

CREATE TABLE IF NOT EXISTS `fattura` (
  `CodFattura` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `importo` decimal(6,2) NOT NULL,
  `data` date NOT NULL,
  `FK_cliente` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodFattura`),
  KEY `FK_cliente` (`FK_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `rappresentante`
--

CREATE TABLE IF NOT EXISTS `rappresentante` (
  `CodRappr` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `p.iva` varchar(11) NOT NULL,
  PRIMARY KEY (`CodRappr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`FK_rappr`) REFERENCES `rappresentante` (`CodRappr`),
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `fattura` (`FK_cliente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
