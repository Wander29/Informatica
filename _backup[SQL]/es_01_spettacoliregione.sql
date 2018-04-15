-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 20, 2017 alle 09:52
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
-- Database: `es_01_spettacoliregione`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `città`
--

CREATE TABLE `città` (
  `CodCit` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Provincia` varchar(30) NOT NULL,
  `Regione` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `edificio`
--

CREATE TABLE `edificio` (
  `CodEdif` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cinema` tinyint(1) NOT NULL,
  `Teatro` tinyint(1) NOT NULL,
  `FK_Città` int(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `CodSala` varchar(3) NOT NULL,
  `Capienza` int(4) UNSIGNED NOT NULL,
  `FK_Edif` int(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `spettacolo`
--

CREATE TABLE `spettacolo` (
  `CodSpet` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Data` datetime NOT NULL,
  `Autore/regista` varchar(30) NOT NULL,
  `Prezzo` decimal(4,2) UNSIGNED NOT NULL,
  `Genere` varchar(30) NOT NULL,
  `FK_Sala` int(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `città`
--
ALTER TABLE `città`
  ADD PRIMARY KEY (`CodCit`);

--
-- Indici per le tabelle `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`CodEdif`),
  ADD KEY `Cit` (`FK_Città`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`CodSala`),
  ADD KEY `Ed` (`FK_Edif`);

--
-- Indici per le tabelle `spettacolo`
--
ALTER TABLE `spettacolo`
  ADD PRIMARY KEY (`CodSpet`),
  ADD KEY `Sala` (`FK_Sala`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `città`
--
ALTER TABLE `città`
  MODIFY `CodCit` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `edificio`
--
ALTER TABLE `edificio`
  MODIFY `CodEdif` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `spettacolo`
--
ALTER TABLE `spettacolo`
  MODIFY `CodSpet` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
