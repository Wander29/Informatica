-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 23, 2017 alle 22:32
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
-- Database: `05_magazzino`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `articolo`
--

CREATE TABLE `articolo` (
  `CodArticolo` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Tipologia` varchar(30) NOT NULL,
  `Descrizione` varchar(100) NOT NULL,
  `Prezzo` decimal(5,2) NOT NULL,
  `Sconto` decimal(5,2) NOT NULL,
  `Scorta` tinyint(1) NOT NULL,
  `FK_Fornitore` int(3) UNSIGNED NOT NULL,
  `FK_Cliente` int(3) UNSIGNED NOT NULL,
  `FK_Reparto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `articolo`
--

INSERT INTO `articolo` (`CodArticolo`, `Nome`, `Tipologia`, `Descrizione`, `Prezzo`, `Sconto`, `Scorta`, `FK_Fornitore`, `FK_Cliente`, `FK_Reparto`) VALUES
(1, 'Gnomo', 'decorazione', 'gnometto molto carino, con 3 orecchie', '15.20', '2.54', 0, 1, 2, 'Giardino'),
(2, 'Delitto e Castigo', 'libro', 'narrativa russa', '12.20', '1.21', 1, 1, 1, 'Libri');

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `CodCliente` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`CodCliente`, `Nome`, `Cognome`) VALUES
(1, 'Marco', 'Riccardi'),
(2, 'Luca', 'Quondam');

-- --------------------------------------------------------

--
-- Struttura della tabella `fornitore`
--

CREATE TABLE `fornitore` (
  `CodFornitore` int(3) UNSIGNED NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `NumTelefono` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `fornitore`
--

INSERT INTO `fornitore` (`CodFornitore`, `Nome`, `NumTelefono`) VALUES
(1, 'Patrizio Pietrangelo', '3351251428');

-- --------------------------------------------------------

--
-- Struttura della tabella `reparto`
--

CREATE TABLE `reparto` (
  `NomeReparto` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `reparto`
--

INSERT INTO `reparto` (`NomeReparto`) VALUES
('Giardino'),
('Libri');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `articolo`
--
ALTER TABLE `articolo`
  ADD PRIMARY KEY (`CodArticolo`),
  ADD KEY `FK_Fornitore` (`FK_Fornitore`),
  ADD KEY `FK_Cliente` (`FK_Cliente`),
  ADD KEY `FK_Reparto` (`FK_Reparto`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CodCliente`);

--
-- Indici per le tabelle `fornitore`
--
ALTER TABLE `fornitore`
  ADD PRIMARY KEY (`CodFornitore`);

--
-- Indici per le tabelle `reparto`
--
ALTER TABLE `reparto`
  ADD PRIMARY KEY (`NomeReparto`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `articolo`
--
ALTER TABLE `articolo`
  MODIFY `CodArticolo` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CodCliente` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `fornitore`
--
ALTER TABLE `fornitore`
  MODIFY `CodFornitore` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `articolo`
--
ALTER TABLE `articolo`
  ADD CONSTRAINT `articolo_ibfk_1` FOREIGN KEY (`FK_Fornitore`) REFERENCES `fornitore` (`CodFornitore`),
  ADD CONSTRAINT `articolo_ibfk_2` FOREIGN KEY (`FK_Cliente`) REFERENCES `cliente` (`CodCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
