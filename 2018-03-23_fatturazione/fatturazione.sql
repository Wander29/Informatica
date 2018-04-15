-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mag 14, 2015 alle 17:03
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fatturazione`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `articolo`
--

CREATE TABLE IF NOT EXISTS `articolo` (
  `ID_articolo` int(3) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(50) NOT NULL,
  `prezzoUnit` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_articolo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dump dei dati per la tabella `articolo`
--

INSERT INTO `articolo` (`ID_articolo`, `descrizione`, `prezzoUnit`) VALUES
(1, 'HDD 10GB', '89.00'),
(2, 'HDD 20GB', '101.00'),
(3, 'HDD 40GB', '120.00'),
(4, 'HDD 60GB', '140.00'),
(5, 'FDD 2,5"', '47.50'),
(6, 'CDROM usb 50x', '156.67'),
(7, 'HDD usb 20GB', '210.00'),
(8, 'Masterizzatore USB', '312.00'),
(9, 'Masterizzatore IDE', '65.00'),
(10, 'tastiera ita 102 wireless', '101.00'),
(11, 'mouse track wireless', '87.00'),
(12, 'USR WLAN card PCMCIA', '167.00'),
(13, 'USB pen 512 MB', '9.00'),
(14, 'DDRAM DIMM 512MB 133', '189.00'),
(15, 'Monitor LCD 21" TFT', '895.00'),
(16, 'Scheda VGA 1 GB no ram', '324.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CodCli` int(5) NOT NULL AUTO_INCREMENT,
  `RagioneSociale` char(40) NOT NULL,
  `Indirizzo` char(30) NOT NULL,
  `città` varchar(30) NOT NULL,
  `Tel` char(12) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `PIVA` char(11) DEFAULT NULL,
  `CodFisc` char(16) DEFAULT NULL,
  PRIMARY KEY (`CodCli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`CodCli`, `RagioneSociale`, `Indirizzo`, `città`, `Tel`, `email`, `PIVA`, `CodFisc`) VALUES
(1, 'la casa del PC', 'via mazzini 3', 'milano', NULL, NULL, '01769807654', NULL),
(2, 'nobis', 'via verdi 121', 'torino', NULL, NULL, '08702040523', NULL),
(3, 'computer compound', 'via colombo 98', 'genova', NULL, NULL, '07654131313', NULL),
(4, 'computer compound', 'via benelli 45', 'como', NULL, NULL, '09876102012', NULL),
(5, 'nobis', 'via cortini 33', 'milano', NULL, NULL, '09501034612', NULL),
(6, 'il computer', 'p.zza grande 1', 'bologna', NULL, NULL, '01980263013', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `fattura`
--

CREATE TABLE IF NOT EXISTS `fattura` (
  `Numero` int(5) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `CodCli` int(5) NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `CodCli_2` (`CodCli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dump dei dati per la tabella `fattura`
--

INSERT INTO `fattura` (`Numero`, `Data`, `CodCli`) VALUES
(1, '2014-07-12', 1),
(2, '2014-08-01', 2),
(3, '2013-12-20', 1),
(4, '2014-05-29', 1),
(5, '2014-11-03', 2),
(6, '2013-02-21', 3),
(7, '2013-04-22', 3),
(8, '2014-01-28', 5),
(9, '2014-06-22', 5),
(10, '2014-04-09', 5),
(11, '2012-11-11', 5),
(12, '2013-04-02', 5),
(13, '2014-09-05', 5),
(14, '2014-10-01', 1),
(15, '2014-10-10', 2),
(16, '2014-10-15', 6),
(17, '2014-10-16', 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `uniscifatart`
--

CREATE TABLE IF NOT EXISTS `uniscifatart` (
  `quantità` int(3) NOT NULL,
  `id_articolo` int(3) NOT NULL,
  `id_fattura` int(5) NOT NULL,
  PRIMARY KEY (`id_articolo`,`id_fattura`),
  KEY `id_fattura` (`id_fattura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `uniscifatart`
--

INSERT INTO `uniscifatart` (`quantità`, `id_articolo`, `id_fattura`) VALUES
(6, 1, 2),
(9, 1, 7),
(1, 1, 8),
(1, 1, 13),
(1, 2, 1),
(6, 2, 2),
(1, 2, 4),
(1, 2, 9),
(1, 2, 11),
(1, 2, 13),
(5, 3, 1),
(1, 3, 4),
(23, 3, 12),
(5, 3, 16),
(2, 4, 1),
(10, 4, 10),
(3, 4, 16),
(1, 12, 2),
(10, 12, 6),
(10, 13, 3),
(2, 14, 1),
(25, 14, 3),
(3, 14, 15),
(1, 15, 5),
(2, 15, 14),
(14, 16, 1),
(2, 16, 5);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `fattura`
--
ALTER TABLE `fattura`
  ADD CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`CodCli`) REFERENCES `cliente` (`CodCli`);

--
-- Limiti per la tabella `uniscifatart`
--
ALTER TABLE `uniscifatart`
  ADD CONSTRAINT `uniscifatart_ibfk_1` FOREIGN KEY (`id_fattura`) REFERENCES `fattura` (`Numero`),
  ADD CONSTRAINT `uniscifatart_ibfk_2` FOREIGN KEY (`id_articolo`) REFERENCES `articolo` (`ID_articolo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
