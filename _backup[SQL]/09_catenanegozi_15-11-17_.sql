-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2017 alle 12:34
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `09_catenanegozi[15-11-17]`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `articoli`
--

CREATE TABLE IF NOT EXISTS `articoli` (
  `Codice_Articoli` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Prezzo` decimal(5,2) NOT NULL,
  `Quantita` int(3) DEFAULT NULL,
  `Nome_Articoli` varchar(30) NOT NULL,
  `FK_Categorie` int(3) unsigned NOT NULL,
  PRIMARY KEY (`Codice_Articoli`),
  KEY `FK_Categorie` (`FK_Categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `Codice_Categoria` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome_Categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`Codice_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `centro_vendita`
--

CREATE TABLE IF NOT EXISTS `centro_vendita` (
  `Codice_Centro` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `RagioneSociale` varchar(10) NOT NULL,
  `Indirizzo` varchar(30) NOT NULL,
  `Nome_Centro` varchar(30) NOT NULL,
  PRIMARY KEY (`Codice_Centro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ordini`
--

CREATE TABLE IF NOT EXISTS `ordini` (
  `Codice_Ordine` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Data_Ordine` date NOT NULL,
  `FK_Centro` int(3) unsigned NOT NULL,
  PRIMARY KEY (`Codice_Ordine`),
  KEY `FK_Centro` (`FK_Centro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `ord_art`
--

CREATE TABLE IF NOT EXISTS `ord_art` (
  `Codice_Ordinazione` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Quantita_Venduta` int(3) DEFAULT NULL,
  `FK_Articoli` int(3) unsigned NOT NULL,
  `FK_Ordine` int(3) unsigned NOT NULL,
  PRIMARY KEY (`Codice_Ordinazione`),
  KEY `FK_Articoli` (`FK_Articoli`,`FK_Ordine`),
  KEY `FK_Ordine` (`FK_Ordine`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `articoli`
--
ALTER TABLE `articoli`
  ADD CONSTRAINT `articoli_ibfk_2` FOREIGN KEY (`FK_Categorie`) REFERENCES `categorie` (`Codice_Categoria`);

--
-- Limiti per la tabella `ordini`
--
ALTER TABLE `ordini`
  ADD CONSTRAINT `ordini_ibfk_1` FOREIGN KEY (`FK_Centro`) REFERENCES `centro_vendita` (`Codice_Centro`);

--
-- Limiti per la tabella `ord_art`
--
ALTER TABLE `ord_art`
  ADD CONSTRAINT `ord_art_ibfk_2` FOREIGN KEY (`FK_Articoli`) REFERENCES `articoli` (`Codice_Articoli`),
  ADD CONSTRAINT `ord_art_ibfk_1` FOREIGN KEY (`FK_Ordine`) REFERENCES `ordini` (`Codice_Ordine`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
