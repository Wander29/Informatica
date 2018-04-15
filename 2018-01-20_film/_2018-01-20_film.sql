-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Gen 21, 2018 alle 20:45
-- Versione del server: 5.7.17
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `[2018-01-20]film`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attori`
--

CREATE TABLE `attori` (
  `CodAttore` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `AnnoNascita` year(4) NOT NULL,
  `Nazionalita` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `attori`
--

INSERT INTO `attori` (`CodAttore`, `Nome`, `AnnoNascita`, `Nazionalita`) VALUES
(1, 'Luigi Silvestri', 1960, 'Italia'),
(2, 'Marco Riccardi', 1999, 'Italia'),
(3, 'Marie', 1980, 'Francia');

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `CodFilm` int(3) UNSIGNED NOT NULL,
  `Titolo` varchar(100) NOT NULL,
  `AnnoProduzione` year(4) NOT NULL,
  `Nazionalita` varchar(30) NOT NULL,
  `Regista` varchar(30) NOT NULL,
  `Genere` varchar(30) NOT NULL,
  `Durata (min)` int(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`CodFilm`, `Titolo`, `AnnoProduzione`, `Nazionalita`, `Regista`, `Genere`, `Durata (min)`) VALUES
(1, 'La francia è mia', 1982, 'Giappone', 'Okkai', 'Drammatico', 0),
(2, 'Che bello', 1970, 'Francia', 'Micio', 'Sport', 0),
(3, 'Casablanca', 1940, 'Italia', 'Micio', 'Drammatico', 0),
(4, 'Casablanca', 2000, 'USA', 'Wayne', 'Dramma', 115);

-- --------------------------------------------------------

--
-- Struttura della tabella `proiezione`
--

CREATE TABLE `proiezione` (
  `CodProiezione` int(3) UNSIGNED NOT NULL,
  `FK_Film` int(3) UNSIGNED NOT NULL,
  `FK_Sala` int(3) UNSIGNED NOT NULL,
  `Incasso` decimal(5,2) NOT NULL,
  `DataProiezione` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `proiezione`
--

INSERT INTO `proiezione` (`CodProiezione`, `FK_Film`, `FK_Sala`, `Incasso`, `DataProiezione`) VALUES
(1, 1, 1, '10.00', '2018-01-07'),
(2, 3, 2, '15.00', '2018-01-24');

-- --------------------------------------------------------

--
-- Struttura della tabella `recita`
--

CREATE TABLE `recita` (
  `FK_Film` int(3) UNSIGNED NOT NULL,
  `FK_Attore` int(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `recita`
--

INSERT INTO `recita` (`FK_Film`, `FK_Attore`) VALUES
(3, 1),
(2, 1),
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `CodSala` int(3) UNSIGNED NOT NULL,
  `Posti` int(4) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Citta` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sala`
--

INSERT INTO `sala` (`CodSala`, `Posti`, `Nome`, `Citta`) VALUES
(1, 34, 'S', 'Terni'),
(2, 122, 'Tr', 'Perugia');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attori`
--
ALTER TABLE `attori`
  ADD PRIMARY KEY (`CodAttore`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`CodFilm`);

--
-- Indici per le tabelle `proiezione`
--
ALTER TABLE `proiezione`
  ADD PRIMARY KEY (`CodProiezione`),
  ADD KEY `FK_Film` (`FK_Film`),
  ADD KEY `FK_Sala` (`FK_Sala`);

--
-- Indici per le tabelle `recita`
--
ALTER TABLE `recita`
  ADD KEY `FK_Film` (`FK_Film`),
  ADD KEY `FK_Attore` (`FK_Attore`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`CodSala`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attori`
--
ALTER TABLE `attori`
  MODIFY `CodAttore` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `CodFilm` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `proiezione`
--
ALTER TABLE `proiezione`
  MODIFY `CodProiezione` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `sala`
--
ALTER TABLE `sala`
  MODIFY `CodSala` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
