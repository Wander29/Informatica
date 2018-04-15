-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Gen 28, 2016 alle 13:46
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `viaggievacanze`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `acquisti`
--

CREATE TABLE IF NOT EXISTS `acquisti` (
  `CodAcq` int(4) NOT NULL AUTO_INCREMENT,
  `CodCli` int(4) NOT NULL,
  `CodPac` int(4) NOT NULL,
  `DataAcquisto` date NOT NULL,
  `quantità` int(3) NOT NULL,
  PRIMARY KEY (`CodAcq`),
  KEY `CodCli` (`CodCli`,`CodPac`),
  KEY `CodPac` (`CodPac`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `acquisti`
--

INSERT INTO `acquisti` (`CodAcq`, `CodCli`, `CodPac`, `DataAcquisto`, `quantità`) VALUES
(1, 10, 5, '2014-11-01', 3),
(2, 8, 5, '2014-11-01', 1),
(3, 16, 6, '2014-11-03', 2),
(4, 10, 1, '2014-11-05', 2),
(5, 12, 11, '2014-11-05', 5),
(6, 9, 5, '2014-11-08', 1),
(7, 6, 6, '2014-11-08', 12),
(8, 1, 3, '2014-11-08', 3),
(9, 3, 3, '2014-11-08', 5),
(10, 4, 3, '2014-11-08', 1),
(11, 13, 7, '2014-11-16', 2),
(12, 12, 6, '2014-11-17', 0),
(13, 7, 4, '2014-11-17', 3),
(14, 15, 6, '2014-11-17', 6),
(15, 11, 4, '2014-11-18', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `CodCli` int(4) NOT NULL AUTO_INCREMENT,
  `Cognome` char(30) NOT NULL,
  `Nome` char(20) NOT NULL,
  `Indirizzo` char(25) NOT NULL,
  `cap` char(5) NOT NULL,
  `citta` char(20) NOT NULL,
  `prov` char(2) NOT NULL,
  `telefono1` char(12) NOT NULL,
  `telefono2` char(12) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  PRIMARY KEY (`CodCli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`CodCli`, `Cognome`, `Nome`, `Indirizzo`, `cap`, `citta`, `prov`, `telefono1`, `telefono2`, `email`) VALUES
(1, 'BIANCHINI', 'DARIO', 'VIA LUGNOLA,12', '01100', 'ROMA', 'RM', '0671718976', NULL, NULL),
(2, 'SAVERI', 'SAVERIO', 'VIA PIAN DI FOSSO 3', '02100', 'RIETI', 'RI', '3285634890', '0746528945', NULL),
(3, 'VANONI', 'ORNELLA', 'P.ZZA EUGUBINO 18', '02010', 'RIVODUTRI', 'RI', '0746198309', NULL, 'ORNELLA.VAI@GMAIL.COM'),
(4, 'CASTELLUZZO', 'GIANFRANCO', 'VIA POIANA, 90', '06056', 'MASSA MARTANA', 'PG', '3926578230', NULL, 'GIANGIAN@LIBERO.IT'),
(5, 'ANTINUCCI', 'SPA', 'VIA MENTANA, 67', '05100', 'TERNI', 'TR', '0744216783', '3339072673', 'ANTINUCCISPA@YAHOO.COM'),
(6, 'FEDELI', 'ROSSELLA', 'P.ZZA DELLA PACE 9', '05100', 'TERNI', 'TR', '3290956231', NULL, NULL),
(7, 'FEDELI', 'ALESSANDRO', 'P.ZZA BUOZZI, 89', '05100', 'TERNI', 'TR', '0744189034', NULL, NULL),
(8, 'UGGIONI', 'ALESSIO', 'VIA PRINCE. 8', '06059', 'TODI', 'PG', '3290962845', NULL, 'ALE_UGGIO@LIBERO.IT'),
(9, 'VENON', 'ALESSANDRA', 'VIA ROSSINI, 7', '05100', 'TERNI', 'TR', '0744567809', NULL, NULL),
(10, 'FINISTAURI', 'MATTIA', 'VIA VIGNOLA 65', '05035', 'NARNI', 'TR', '3926543902', NULL, NULL),
(11, 'GIOVANNETTI', 'MAILA', 'P.ZZA DEI CADUTI, 2', '05036', 'NARNI SCALO', 'TR', '34780927641', NULL, 'MAILAGIOVANNETTI@HOTMAIL.COM'),
(12, 'ZAMAN', 'VERUSKA', 'V.LE DEI PINI 18', '05039', 'STRONCONE', 'TR', '074456987', NULL, NULL),
(13, 'VIALI', 'STEFANO', 'VIA ULTIMI 67', '05035', 'NARNI', 'TR', '3489026543', NULL, NULL),
(14, 'VITALI', 'MARIA', 'P.ZZA BUOZZI, 8', '05100', 'TERNI', 'TR', '3285641203', NULL, 'VITALISTORE@GMAIL.COM'),
(15, 'BABBUCCI', 'STORE', 'VIA LEOPARDI, 7', '05100', 'TERNI', 'TR', '0744187342', '3297845321', 'BABBUCCISTORESRL@GMAIL.COM'),
(16, 'TERENZI', 'ANTONELLA', 'VIA PRIMI, 7', '05031', 'ARRONE', 'TR', '074467324', NULL, NULL),
(17, 'LOREDANI', 'ALESSANDRO', 'V.LE NOBILI, 78', '05031', 'ARRONE', 'TR', '3334567832', NULL, NULL),
(18, 'FERRI', 'ANTONIO', 'via Roma', '05100', 'Terni', 'TR', '0744202020', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `destinazione`
--

CREATE TABLE IF NOT EXISTS `destinazione` (
  `CodDest` int(3) NOT NULL AUTO_INCREMENT,
  `Denominazione` char(40) NOT NULL,
  `Moneta` char(30) NOT NULL,
  `Clima` char(30) NOT NULL,
  PRIMARY KEY (`CodDest`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dump dei dati per la tabella `destinazione`
--

INSERT INTO `destinazione` (`CodDest`, `Denominazione`, `Moneta`, `Clima`) VALUES
(1, 'Alghero', 'Euro', 'Mediterraneo'),
(2, 'Amsterdam', 'Euro', 'Continentale Umido'),
(3, 'Sharm El Sheikh', 'Lira egiziana', 'desertico'),
(4, 'Parigi', 'Euro', 'mediterraneo'),
(5, 'Brasile', 'real brasiliano', 'equatoriale'),
(6, 'Londra', 'sterlina inglese', 'mediterraneo'),
(7, 'Berlino', 'euro', 'continentale'),
(8, 'Costiera Amalfitana', 'euro', 'mediterraneo'),
(9, 'Cortina d''Ampezzo', 'euro', 'continentale'),
(10, 'Seychelles', 'rupia delle Seychelles', 'tropicale umido'),
(11, 'Strasburgo', 'euro', 'continentale'),
(12, 'Riccione', 'euro', 'mediterraneo'),
(13, 'Bucarest', 'leu', 'continentale'),
(14, 'Tenerife', 'Euro', 'Tropicale mite'),
(15, 'Vienna', 'Euro', 'continentale'),
(16, 'San Pietroburgo', 'rublo russo', 'continentale umido'),
(17, 'Helsinki', 'euro', 'temperato freddo'),
(18, 'Ibiza', 'euro', 'mediterraneo'),
(19, 'Repubblica delle Maldive', 'Rufiyaa delle Maldive', 'monsonico');

-- --------------------------------------------------------

--
-- Struttura della tabella `pacchetto`
--

CREATE TABLE IF NOT EXISTS `pacchetto` (
  `CodPac` int(4) NOT NULL AUTO_INCREMENT,
  `Descr` text NOT NULL,
  `Modalita` text NOT NULL,
  `Prezzo` decimal(10,2) NOT NULL,
  `CodDest` int(3) NOT NULL,
  `CodTO` char(3) NOT NULL,
  PRIMARY KEY (`CodPac`),
  KEY `CodDest` (`CodDest`),
  KEY `CodTO` (`CodTO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dump dei dati per la tabella `pacchetto`
--

INSERT INTO `pacchetto` (`CodPac`, `Descr`, `Modalita`, `Prezzo`, `CodDest`, `CodTO`) VALUES
(1, 'SoleMareVRT', '7 giorni\r\npensione completa \r\nombrellone fila 2/3 con 2 lettini', '980.00', 1, 'VRT'),
(2, 'Sole-Mare ALT', '7 giorni\r\npensione completa \r\nombrellone fila 2/3 con 2 lettini', '950.00', 1, 'ALT'),
(3, 'Neve a Go-Go', 'Mezza Pensione \r\nHotel 4*\r\n3 notti infrasettimanali (escluse festività)\r\nSkypass incluso', '550.00', 9, 'MYT'),
(4, 'Sole d''Africa STM MP\r\n', 'Mezza pensione\r\nHotel 4* formula roulette\r\n7 giorni - 6 notti\r\nSpiaggia: privata ombrellone e 2 lettini\r\nEscluso bevande \r\nVolo incluso', '490.00', 3, 'STM'),
(5, 'Sole d''Africa STM PC', 'Pensione completa\r\nHotel 4* formula roulette\r\n7 giorni - 6 notti\r\nSpiaggia: privata ombrellone e 2 lettini\r\nEscluso bevande \r\nVolo incluso', '790.00', 3, 'STM'),
(6, 'Sole d''Africa STM BB', 'Bed&Breakfast\r\nHotel 4* formula roulette\r\n7 giorni - 6 notti\r\nSpiaggia: privata ombrellone e 2 lettini\r\nEscluso bevande \r\nVolo incluso', '390.00', 3, 'STM'),
(7, 'Honeymoon FRS AI', 'All Inclusive\r\nHotel 5* superior\r\n15 giorni - 14 notti\r\nSpiaggia: privata ombrellone e 2 lettini\r\nBevande incluse \r\nVolo incluso', '7600.00', 19, 'FRS'),
(8, 'WEEKEND COL MARE', 'Bed & Breakfast\r\nHotel 3*\r\nSistemazione in camera standard\r\nIncluso posto spiaggia\r\n\r\n', '250.00', 12, 'CSP'),
(9, 'WE in-Motion VDD', 'Bed & Breakfast\r\nHotel 3*\r\nSistemazione in camera standard\r\nIncluso posto spiaggia', '350.00', 12, 'VDD'),
(10, 'Easter and Little-Easter in London', 'Bed & Breakfast\r\n4 notti - 3 giorni\r\nvolo e trasferimenti esclusi', '450.00', 6, 'TRS'),
(11, 'Ocean No-Problem VRT', 'All Inclusive\r\n7 notti-6 giorni\r\ncamera superior\r\ntrasferimenti da/per aereoporto\r\nescursioni escluse\r\n', '4550.00', 18, 'VRT'),
(12, 'Tenerife PC', 'Pensione Completa\r\nHotel 5*\r\nCamera Superior\r\nEscluse bevande, trasferimenti e volo', '1700.00', 14, 'STM'),
(13, 'Tenerife AI', 'Pensione Completa\r\nHotel 5*\r\nCamera Superior\r\nEsclusi trasferimenti e volo', '1950.00', 14, 'STM'),
(15, 'prova Trigger ControlloDest', '', '980.00', 1, 'BSC');

--
-- Trigger `pacchetto`
--
DROP TRIGGER IF EXISTS `ControlloQuantitàMaxDestinazioni`;
DELIMITER //
CREATE TRIGGER `ControlloQuantitàMaxDestinazioni` AFTER INSERT ON `pacchetto`
 FOR EACH ROW IF  3 < ( 
	SELECT COUNT(*)
	FROM pacchetto
	WHERE codDest = NEW.codDest ) 
THEN
	DELETE FROM pacchetto
	WHERE CodPac = NEW.CodPac;
END IF
//
DELIMITER ;
DROP TRIGGER IF EXISTS `VariazionePrezzo`;
DELIMITER //
CREATE TRIGGER `VariazionePrezzo` AFTER UPDATE ON `pacchetto`
 FOR EACH ROW /*CREATE TRIGGER  VariazionePrezzo
AFTER UPDATE ON pacchetto*/
/*FOR EACH ROW
BEGIN*/
	IF
		
		NEW.prezzo > OLD.prezzo 
    OR
    	NEW.prezzo > OLD.prezzo*1.3 
	THEN
    	UPDATE pacchetto
		SET importo = OLD.prezzo
		WHERE CodPac = NEW.CodPac;
	END IF
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `touroperator`
--

CREATE TABLE IF NOT EXISTS `touroperator` (
  `CodTO` char(3) NOT NULL,
  `NomeTO` char(30) NOT NULL,
  `TelTO` char(12) NOT NULL,
  `EmailTO` char(30) NOT NULL,
  PRIMARY KEY (`CodTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `touroperator`
--

INSERT INTO `touroperator` (`CodTO`, `NomeTO`, `TelTO`, `EmailTO`) VALUES
('ALT', 'ALPITOUR', '800222222', 'ALPITOUR@GMAIL.COM'),
('BSC', 'BOSCOLO TOURS', '02876432', 'INFO@BOSCOLO.IT'),
('CSP', 'CISALPINA TOURS', '800567834', 'INFO@CISALPINA.IT'),
('EDN', 'EDEN VIAGGI', '800181818', 'EDENVIAGGI@YAHOO.COM'),
('FRS', 'FRANCOROSSO', '800919191', 'FRANCOROSSO@GMAIL.COM'),
('INV', 'INVIAGGI', '0744278976', 'INFO@INVIAGGI.IT'),
('MYT', 'MYTRAVEL', '06349021', 'MYTRAVEL.INFO@LIBERO.IT'),
('STM', 'SETTEMARI', '800676767', 'SETTEMARI@SETTEMARI.IT'),
('SWT', 'SWAN TOUR', '023498764', 'SWAN-TOUR@GMAIL.COM'),
('TRS', 'TURISANDA', '0214567', 'TURISANDA@LIBERO.IT'),
('VDD', 'I VIAGGI DEL DRAGO', '800808080', 'VDD@HOTMAIL.COM'),
('VDT', 'I VIAGGI DEL TURCHESE', '0634987623', 'VIAGGITURCHESE@LIBERO.IT'),
('VRT', 'VERATOUR', '800191919', 'VERATOUR@VERATOUR.IT');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `acquisti`
--
ALTER TABLE `acquisti`
  ADD CONSTRAINT `acquisti_ibfk_1` FOREIGN KEY (`CodPac`) REFERENCES `pacchetto` (`CodPac`),
  ADD CONSTRAINT `acquisti_ibfk_2` FOREIGN KEY (`CodCli`) REFERENCES `cliente` (`CodCli`);

--
-- Limiti per la tabella `pacchetto`
--
ALTER TABLE `pacchetto`
  ADD CONSTRAINT `pacchetto_ibfk_1` FOREIGN KEY (`CodTO`) REFERENCES `touroperator` (`CodTO`),
  ADD CONSTRAINT `pacchetto_ibfk_2` FOREIGN KEY (`CodDest`) REFERENCES `destinazione` (`CodDest`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
