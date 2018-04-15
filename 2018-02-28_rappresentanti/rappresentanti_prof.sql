-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mag 14, 2015 alle 17:01
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rappresentanti`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CodCli` int(5) NOT NULL AUTO_INCREMENT,
  `RagioneSociale` char(40) NOT NULL,
  `Indirizzo` char(30) NOT NULL,
  `Tel` char(12) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `PIVA` char(11) DEFAULT NULL,
  `CodFisc` char(16) DEFAULT NULL,
  `CodRap` int(4) NOT NULL,
  PRIMARY KEY (`CodCli`),
  KEY `CodRap` (`CodRap`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`CodCli`, `RagioneSociale`, `Indirizzo`, `Tel`, `email`, `PIVA`, `CodFisc`, `CodRap`) VALUES
(2, 'F.LLI COVICCHIO SPA', 'VIA MARTIRI, 7', '0742-818181', 'covicchiospa@libero.it', '00986545876', NULL, 3),
(3, 'ALTAMANTE CARLO', 'P.ZZA LIBERTA, 1', '02-415634', 'altamanteline@gmail.com', NULL, 'LTNCRL67B01F205D', 9),
(4, 'BIMBIPIU STORE', 'VIA CORREI, 18', '346-7878788', 'BIMBIPIU@GMAIL.COM', '00345281744', NULL, 7),
(5, 'TERLIZZI SRL', 'VIA FORTI, 14/A', '0742.4545455', 'terlizzibimbi@libero.it', '00657054123', NULL, 3),
(6, 'BRADAMANTE STORE', 'VIA CERQUETTI, 15', '0763-187623', 'BRADSTORE.L@YAHOO.COM', '00098767098', NULL, 10),
(7, 'CERQUETTI SPA', 'VIA FIUGGI, 67', NULL, 'cerquettistore.spa@hotmail.com', '09675412854', NULL, 1),
(8, 'FERRETTI PAOLO', 'VIA COPERNICO, 10', '0763-7787234', NULL, '00981287345', NULL, 10),
(9, 'L''ALTALENA', 'VIA PONTE LE CAVE 12', '0744-445678', 'ALTALENA_90@VIRGILIO.IT', '00785209542', NULL, 6),
(10, 'DESDEMONA RICCI', 'VIA MAGENTA, 9', '0744-121213', 'RICCI_DESD@HOTMAIL.COM', NULL, 'RCCDSM82G48L117S', 6),
(11, 'TIRICARICO SRL', 'VIA DELLO STADIO, 89/C', '338-9096345', 'TIRICARICO@LIBERO.IT', '01276349284', NULL, 5),
(12, 'BARBARA ROSSI SNC', 'VIA POLIMENA, 78', '333-3908345', 'ROSSIBARBARA@LIBERO.IT', NULL, 'RSSBBR78F68F205M', 9),
(13, 'SEMERARO SRL', 'VIA POGGIO DEL SOLE, 17', '347-1354643', 'SEMERARO@GMAIL.COM', '09812546739', NULL, 2),
(14, 'PIPPI CALZECORTE', 'P.ZZA DEL MULINO', NULL, 'PIPPI_PIPPI@HOTMAIL.COM', '00187302946', NULL, 8),
(15, 'STELLA CADENTE', 'ZONA IND.LE SABBIONI 40A', '0742-173456', 'STELLA_LINE@VIRGILIO.IT', NULL, 'MNCSTL78E65L117Q', 3),
(16, 'NANNI GIULI', 'VIA BOSCOLO, 6', '347-84732943', 'GIULI_DOLCESONNO@YAHOO.IT', NULL, 'NNNGLI85L117D', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `fattura`
--

CREATE TABLE IF NOT EXISTS `fattura` (
  `NumFatt` int(5) NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Importo` decimal(10,2) NOT NULL,
  `CodCli` int(5) NOT NULL,
  PRIMARY KEY (`NumFatt`),
  KEY `CodCli` (`CodCli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dump dei dati per la tabella `fattura`
--

INSERT INTO `fattura` (`NumFatt`, `Data`, `Importo`, `CodCli`) VALUES
(1, '2014-01-03', '1346.12', 7),
(2, '2014-01-02', '123.98', 2),
(3, '2014-01-03', '67.45', 8),
(4, '2014-01-05', '777.00', 12),
(5, '2014-01-05', '98.00', 13),
(6, '2014-01-05', '567.65', 11),
(7, '2014-01-07', '875.35', 16),
(8, '2014-01-07', '1876.00', 6),
(9, '2014-01-07', '645.00', 9),
(10, '2014-01-07', '65.89', 10),
(11, '2014-01-15', '2542.77', 7),
(12, '2014-01-15', '432.25', 14),
(13, '2014-01-15', '875.92', 15),
(14, '2014-01-15', '64.81', 4),
(15, '2014-01-21', '598.00', 6),
(16, '2014-01-21', '45.00', 12),
(17, '2014-01-21', '643.18', 5),
(18, '2014-01-31', '543.92', 16),
(19, '2014-01-31', '43.81', 9),
(20, '2014-01-31', '478.00', 3),
(21, '2014-01-31', '29.00', 12),
(22, '2014-01-31', '872.63', 8),
(23, '2014-02-15', '634.73', 10),
(24, '2014-02-15', '43.18', 16),
(25, '2014-02-15', '783.73', 9),
(26, '2014-02-15', '54.00', 14),
(27, '2014-02-15', '87.00', 8),
(28, '2014-02-28', '1874.00', 12),
(29, '2012-02-28', '498.00', 4),
(30, '2014-02-28', '676.00', 2),
(31, '2014-02-28', '654.00', 3);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `rapp:q01`
--
CREATE TABLE IF NOT EXISTS `rapp:q01` (
`RAPPR` int(11)
,`Cognome` char(30)
,`RagioneSociale` char(40)
,`Indirizzo` char(30)
,`Tel` char(12)
,`email` char(30)
,`PIVA` char(11)
,`CodFisc` char(16)
);
-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `rapp:q02`
--
CREATE TABLE IF NOT EXISTS `rapp:q02` (
`NUMCLIENTI` bigint(21)
,`RAPPRESENTANTE` varchar(30)
);
-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `rapp:q03`
--
CREATE TABLE IF NOT EXISTS `rapp:q03` (
`Cognome` char(30)
,`Nome` char(20)
);
-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `rapp:q04`
--
CREATE TABLE IF NOT EXISTS `rapp:q04` (
`NumFatt` int(5)
,`Data` date
,`Importo` decimal(10,2)
,`CodCli` int(5)
);
-- --------------------------------------------------------

--
-- Struttura della tabella `rappresentante`
--

CREATE TABLE IF NOT EXISTS `rappresentante` (
  `CodRap` int(11) NOT NULL AUTO_INCREMENT,
  `Cognome` char(30) NOT NULL,
  `Nome` char(20) NOT NULL,
  `PIva` char(11) DEFAULT NULL,
  `CodFisc` char(16) DEFAULT NULL,
  `Tel` char(12) DEFAULT NULL,
  `Email` char(30) DEFAULT NULL,
  `zona` int(4) NOT NULL,
  PRIMARY KEY (`CodRap`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `rappresentante`
--

INSERT INTO `rappresentante` (`CodRap`, `Cognome`, `Nome`, `PIva`, `CodFisc`, `Tel`, `Email`, `zona`) VALUES
(1, 'GIUSTI', 'FABIO', '00761524398', NULL, '333-3942654', 'giusti.fabio@virgilio.it', 6),
(2, 'BETTOLLE', 'GIADA', NULL, 'BTLGDA77A42L117A', NULL, 'giadabetty@gmail.com', 2),
(3, 'D''ALTERIO', 'FRANCO', '00012345678', NULL, '0742-576453', NULL, 3),
(4, 'FURBINI', 'DANTE', '00198765423', NULL, '392-7654321', 'furbini.d@hotmail.com', 1),
(5, 'MALIPIERO', 'STEFANIA', '00098734524', NULL, NULL, 'stefy.mali@gmail.com', 3),
(6, 'BETTI', 'LORENZO', NULL, 'BTTLRN54C21L117Q', '348-7171711', 'FornitureBetti@libero.it', 5),
(7, 'TOSCA', 'LAURA', '00032459876', NULL, '392-7878798', NULL, 1),
(8, 'ACANFORA', 'GIANNI', '01234567890', NULL, NULL, 'gianni.rappr@yahoo.com', 5),
(9, 'OLIVETTI', 'OLIVIA', NULL, 'LVTLVO89D51F205X', '349-0123456', 'olivettimail@gmail.com', 7),
(10, 'FERRETTI', 'PAOLO', '00981287345', NULL, '0763-7787234', NULL, 5);

-- --------------------------------------------------------

--
-- Struttura per la vista `rapp:q01`
--
DROP TABLE IF EXISTS `rapp:q01`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rapp:q01` AS select `rappresentante`.`CodRap` AS `RAPPR`,`rappresentante`.`Cognome` AS `Cognome`,`cliente`.`RagioneSociale` AS `RagioneSociale`,`cliente`.`Indirizzo` AS `Indirizzo`,`cliente`.`Tel` AS `Tel`,`cliente`.`email` AS `email`,`cliente`.`PIVA` AS `PIVA`,`cliente`.`CodFisc` AS `CodFisc` from (`cliente` join `rappresentante`) where ((`cliente`.`CodRap` = `rappresentante`.`CodRap`) and (`rappresentante`.`Cognome` = 'D\'Alterio'));

-- --------------------------------------------------------

--
-- Struttura per la vista `rapp:q02`
--
DROP TABLE IF EXISTS `rapp:q02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rapp:q02` AS select count(0) AS `NUMCLIENTI`,`rappresentante`.`Cognome` AS `RAPPRESENTANTE` from (`cliente` join `rappresentante`) where ((`cliente`.`CodRap` = `rappresentante`.`CodRap`) and (`rappresentante`.`Cognome` = 'D\'Alterio'));

-- --------------------------------------------------------

--
-- Struttura per la vista `rapp:q03`
--
DROP TABLE IF EXISTS `rapp:q03`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rapp:q03` AS select `rappresentante`.`Cognome` AS `Cognome`,`rappresentante`.`Nome` AS `Nome` from (`cliente` join `rappresentante`) where ((`cliente`.`CodRap` = `rappresentante`.`CodRap`) and (`cliente`.`RagioneSociale` = 'Barbara Rossi Snc'));

-- --------------------------------------------------------

--
-- Struttura per la vista `rapp:q04`
--
DROP TABLE IF EXISTS `rapp:q04`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rapp:q04` AS select `fattura`.`NumFatt` AS `NumFatt`,`fattura`.`Data` AS `Data`,`fattura`.`Importo` AS `Importo`,`fattura`.`CodCli` AS `CodCli` from `fattura` where (`fattura`.`CodCli` = 16) order by `fattura`.`Data`;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`CodRap`) REFERENCES `rappresentante` (`CodRap`);

--
-- Limiti per la tabella `fattura`
--
ALTER TABLE `fattura`
  ADD CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`CodCli`) REFERENCES `cliente` (`CodCli`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
