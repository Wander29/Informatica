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
-- Database: `[2018-01-01]provescuola`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `CodClasse` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Aula` varchar(3) NOT NULL,
  PRIMARY KEY (`CodClasse`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`CodClasse`, `Nome`, `Aula`) VALUES
(1, '5AIA', '17'),
(2, '4AIA', '18'),
(3, '3AIA', '25'),
(4, '5ACM', '22'),
(5, '5AEC', '10');

-- --------------------------------------------------------

--
-- Struttura della tabella `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `CodDocente` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  PRIMARY KEY (`CodDocente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `docente`
--

INSERT INTO `docente` (`CodDocente`, `Nome`, `Cognome`) VALUES
(1, 'Chiara', 'Diomedi'),
(2, 'Laura', 'Cerri'),
(3, 'Sara', 'Frittella'),
(4, 'Beatrice', 'Priante'),
(5, 'Mario', 'Gigli');

-- --------------------------------------------------------

--
-- Struttura della tabella `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `CodMateria` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`CodMateria`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dump dei dati per la tabella `materia`
--

INSERT INTO `materia` (`CodMateria`, `Nome`) VALUES
(1, 'Informatica'),
(2, 'Matematica'),
(3, 'Storia'),
(4, 'Italiano'),
(5, 'Elettronica');

-- --------------------------------------------------------

--
-- Struttura della tabella `prova`
--

CREATE TABLE IF NOT EXISTS `prova` (
  `CodProva` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL,
  `Data` date NOT NULL,
  `FK_Classe` int(3) unsigned NOT NULL,
  `FK_Materia` int(3) unsigned NOT NULL,
  `FK_Docente` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodProva`),
  KEY `FK_Classe` (`FK_Classe`),
  KEY `FK_Materia` (`FK_Materia`),
  KEY `FK_Docente` (`FK_Docente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `prova`
--

INSERT INTO `prova` (`CodProva`, `Tipo`, `Data`, `FK_Classe`, `FK_Materia`, `FK_Docente`) VALUES
(1, 'Integrali', '2017-12-13', 1, 2, 2),
(2, 'Tema Storico', '2017-12-04', 4, 4, 1),
(3, '', '2017-11-29', 2, 1, 4),
(4, '', '2017-12-08', 1, 1, 4),
(5, '', '2017-12-01', 5, 5, 5),
(6, '', '2017-12-02', 3, 1, 5),
(7, '', '2017-12-11', 3, 1, 3),
(8, '', '2017-12-10', 1, 3, 1),
(9, '', '2017-12-04', 4, 3, 1),
(10, '', '2017-12-23', 2, 2, 2),
(11, '', '2017-12-25', 3, 3, 5),
(12, '', '2017-12-20', 5, 2, 2),
(13, '', '2017-12-07', 3, 3, 1),
(14, 'Telecomunicazioni', '2017-12-03', 1, 5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `studente`
--

CREATE TABLE IF NOT EXISTS `studente` (
  `CodStudente` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `FK_Classe` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodStudente`),
  KEY `FK_Classe` (`FK_Classe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `studente`
--

INSERT INTO `studente` (`CodStudente`, `Nome`, `Cognome`, `FK_Classe`) VALUES
(1, 'Luca', 'Moroni', 1),
(2, 'Paolo', 'Romano', 1),
(3, 'Tizio', 'Terzo', 2),
(4, 'Gatto', 'Micio', 2),
(5, 'Michael', 'Mari', 4),
(6, 'Marco', 'Dominici', 4),
(7, 'Marco', 'Riccardi', 5),
(8, 'Caio', 'Pazzo', 5),
(9, 'Francesco', 'Bianchini', 3),
(10, 'Kappa', 'Maiuscola', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `unisci_docenteclasse`
--

CREATE TABLE IF NOT EXISTS `unisci_docenteclasse` (
  `FK_Classe` int(3) unsigned NOT NULL,
  `FK_Docente` int(3) unsigned NOT NULL,
  KEY `FK_Classe` (`FK_Classe`),
  KEY `FK_Docente` (`FK_Docente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `unisci_docenteclasse`
--

INSERT INTO `unisci_docenteclasse` (`FK_Classe`, `FK_Docente`) VALUES
(1, 1),
(4, 1),
(5, 2),
(1, 2),
(1, 4),
(2, 4),
(3, 5),
(5, 5),
(1, 4),
(1, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `unisci_docentemateria`
--

CREATE TABLE IF NOT EXISTS `unisci_docentemateria` (
  `FK_Docente` int(3) unsigned NOT NULL,
  `FK_Materia` int(3) unsigned NOT NULL,
  KEY `FK_Docente` (`FK_Docente`),
  KEY `FK_Materia` (`FK_Materia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `unisci_docentemateria`
--

INSERT INTO `unisci_docentemateria` (`FK_Docente`, `FK_Materia`) VALUES
(1, 3),
(1, 4),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(5, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `unisci_materiaclasse`
--

CREATE TABLE IF NOT EXISTS `unisci_materiaclasse` (
  `FK_Materia` int(3) unsigned NOT NULL,
  `FK_Classe` int(3) unsigned NOT NULL,
  KEY `FK_Materia` (`FK_Materia`),
  KEY `FK_Classe` (`FK_Classe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `unisci_materiaclasse`
--

INSERT INTO `unisci_materiaclasse` (`FK_Materia`, `FK_Classe`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `unisci_studenteprova`
--

CREATE TABLE IF NOT EXISTS `unisci_studenteprova` (
  `FK_Studente` int(3) unsigned NOT NULL,
  `FK_Prova` int(3) unsigned NOT NULL,
  `Voto` int(2) unsigned NOT NULL,
  KEY `FK_Studente` (`FK_Studente`),
  KEY `FK_Prova` (`FK_Prova`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `unisci_studenteprova`
--

INSERT INTO `unisci_studenteprova` (`FK_Studente`, `FK_Prova`, `Voto`) VALUES
(1, 1, 10),
(2, 1, 8),
(3, 2, 8),
(4, 2, 7),
(5, 3, 3),
(6, 3, 8),
(7, 4, 3),
(8, 4, 9),
(9, 5, 10),
(10, 5, 10),
(6, 6, 10),
(0, 0, 0),
(1, 3, 10),
(1, 4, 7),
(1, 7, 9),
(2, 4, 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
