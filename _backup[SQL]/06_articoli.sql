-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Gen 15, 2018 alle 12:45
-- Versione del server: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `06_articoli`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `argomento`
--

CREATE TABLE IF NOT EXISTS `argomento` (
  `CodArgomento` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(30) NOT NULL,
  PRIMARY KEY (`CodArgomento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dump dei dati per la tabella `argomento`
--

INSERT INTO `argomento` (`CodArgomento`, `Descrizione`) VALUES
(1, 'Attualità'),
(2, 'Sociologia'),
(3, 'Arte'),
(4, 'Tecnologia'),
(5, 'Scienza'),
(6, 'Curiosità'),
(7, 'Geografia'),
(8, 'Motori'),
(9, 'Novità'),
(10, 'Svago'),
(11, 'Automobilismo'),
(12, 'Motociclismo'),
(13, 'Lingua'),
(14, 'Cronaca Nera'),
(15, 'Cronaca Rosa'),
(16, 'Cultura'),
(17, 'Ambiente'),
(18, 'Storia');

-- --------------------------------------------------------

--
-- Struttura della tabella `articolo`
--

CREATE TABLE IF NOT EXISTS `articolo` (
  `ID_articolo` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `titolo` char(50) NOT NULL,
  `sottotitolo` char(50) DEFAULT NULL,
  `testo` text NOT NULL,
  `data` date DEFAULT NULL,
  `numero_righe` int(4) unsigned DEFAULT '0',
  `id_argomento` int(3) unsigned NOT NULL DEFAULT '0',
  `id_rivista` int(3) unsigned NOT NULL,
  PRIMARY KEY (`ID_articolo`),
  KEY `articolo_ibfk_1` (`id_argomento`),
  KEY `id_rivista` (`id_rivista`),
  KEY `id_argomento` (`id_argomento`),
  KEY `id_rivista_2` (`id_rivista`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `articolo`
--

INSERT INTO `articolo` (`ID_articolo`, `titolo`, `sottotitolo`, `testo`, `data`, `numero_righe`, `id_argomento`, `id_rivista`) VALUES
(1, 'Il mantello dell''invisibilità fai-da-te', 'Scienziati americani dell''Università di Rochester', 'Il mantello di Harry Potter non lo supera nessuno anche se gli scienziati ci provano da anni. Adesso però una nuova invenzione potrebbe trasformare la fantasia in realtà: il fisico John Howell dell’Università di Rochester (USA) e il suo studente Joseph Choi hanno infatti inventato un metodo che permette di rendere invisibili gli oggetti grazie a un sistema ottico che consiste in quattro comuni lenti.\r\n\r\nCome funziona. Le lenti sono posizionate una dietro l’altra, a una certa distanza prestabilita. Quando si inserisce un oggetto tra le lenti e si guarda attraverso di esse, l''oggetto in questione... scompare.\r\n\r\nQuesto accade perché le lenti sono collocate in modo tale da deviare la luce e fanno sì che l’onda elettromagnetica non colpisca l’oggetto posto nel "dispositivo". (etc...)', '2014-01-15', 17, 5, 1),
(2, 'Una misteriosa pallina marziana', NULL, 'Il rover della NASA Curiosity ha fotografato una piccola roccia dalla forma perfettamente sferica. Non si tratta di qualcosa di artificiale, ma di una concrezione rocciosa che ha avuto origine durante la formazione di rocce sedimentarie quando, in un lontano passato, l’acqua su Marte era abbondante. (etc...)', '2014-01-10', 0, 5, 1),
(3, 'Il robot morbido e indistruttibile', 'Messo a punto dai ricercatori di Harvard il robot', 'Si piega ma non si spezza: resiste al fuoco, al ghiaccio, all’acqua e non si rompe nemmeno se un’auto gli passa sopra. È il robot a struttura morbida sviluppato dai ricercatori di Harvard e presentato sull’ultimo numero del Journal of Soft Robotics.\r\n\r\nLa macchina funziona in piena autonomia, senza bisogno di cavi per l’alimentazione o il controllo: può alzarsi, abbassarsi e camminare trasportando sul dorso processori e batterie.\r\n\r\nSenza paura. A differenza dei robot convenzionali non soffre nemmeno il freddo estremo o il calore della fiamma viva. La macchina, che al momento non ha ancora un nome, è stata sottoposta dai ricercatori alle prove più dure: è stata fatta camminare sul fuoco, sotto una tempesa invernale del New England ed è stata anche schiacciata da un’automobile senza riportare alcun danno. (etc...)\r\n\r\n ', '2014-01-17', 23, 4, 1),
(4, 'Desert breath: la spirale nel deserto e altre stra', 'Una spirale grande come 10 campi da calcio, un pen', 'Sarà la forma a doppia spirale, sarà la superficie di quasi 100.000 metri quadrati - più o meno quella di 10 campi da calcio - sarà il fatto che sorge nel cuore dell’Egitto, ma questa grande struttura eretta lungo le rive del Mar Rosso ha un che di esoterico.\r\n\r\nChe sia in qualche modo collegata alle piramidi e ai loro misteri ancora irrisolti? Che siano le antiche tracce del contatto tra uomini e civiltà extraterrestri?\r\n\r\nMistero svelato\r\nNiente di tutto questo: Desert Breath è un’installazione realizzata nel 1997 da tre artisti, Danae Stratou, Alexandra Stratou and Stella Constantinides, che, come si legge nel loro sito, hanno voluto celebrare in questo modo il deserto come “stato e paesaggio mentale”.  E che recentemente è ritornata in auge perché ripresa e visibile su Google Maps.\r\n\r\nCastellone di sabbia\r\nCerto è che vista dall’alto grazie a Google Maps fa davvero impressione. Siamo a El Gouni, non lontano dalla rinomata località turistica di Hurgada, in Egitto. Costruita con coni verticali e buche complementari di forma conica, Desert Breath è stata realizzata interamente in sabbia. E infatti si sta pian piano sbriciolando a causa dell’azione erosiva dei venti del deserto. I coni si abbassano, le buche si riempiono e l’opera, secondo i suoi autori, sarebbe uno strumento per misurare lo scorrere del tempo. (etc...)', '2014-02-26', 0, 6, 2),
(5, 'Le storie intorno al fuoco che ci resero uomini', 'Per la prima volta uno studio fa luce sul ruolo de', 'La scoperta del fuoco, un milione di anni fa (circa), permise ai nostri antenati di cuocere i cibi, scaldarsi e tenere lontani i predatori, ma non solo. Le fiamme accese allungarono le giornate, offrendo un luogo di ritrovo e un''occasione in più per chiacchierare e tessere relazioni sociali.\r\n\r\n \r\n\r\nIntorno a quei falò si rafforzarono le tradizioni culturali, si sviluppò l''immaginazione e si imparò a fare gruppo, come sottolinea un nuovo studio sul ruolo del fuoco nell''evoluzione umana compiuto dall''Università dello Utah e pubblicato su Proceedings of the National Academy of Sciences.\r\n\r\n \r\n\r\nRaccontaci una storia. Molte ricerche hanno evidenziato i cambiamenti introdotti dal fuoco nell''alimentazione e nell''anatomia umana, ma nessuno, finora, si era soffermato sul fatto che le fiamme, rischiarando e riscaldando, regalarono ai nostri antenati preziose ore di socialità in più. «C''è qualcosa nelle fiamme al buio che lega, distende, eccita le persone. La notte intorno al fuoco è da sempre un momento per legare, intrattenere, scambiarsi informazioni sociali e condividere emozioni» spiega Polly Wiessner, a capo dello studio.\r\n\r\n \r\n\r\nEsempi viventi. Il controllo del fuoco da parte dell''Homo erectus si può far risalire a circa 1 milione di anni fa, mentre un suo uso regolare è attestato a partire da circa 400 mila anni fa. Per studiare il ruolo sociale di questo momento della giornata, i ricercatori hanno analizzato i racconti intorno al fuoco dei !Kung (il punto esclamativo indica un suono simile a un clic da emettere quando si pronuncia il loro nome), una popolazione di cacciatori raccoglitori che vive - lontano da ogni forma di tecnologia - nel Deserto del Kalahari, tra Namibia e Botswana.\r\n\r\n \r\n\r\nChiacchiere serali. Per i !Kung i raduni intorno ai falò funzionano come una sorta di "social network". Wiessner e colleghi hanno monitorato le conversazioni intorno al fuoco di tutti i gruppi superiori ai 5 elementi, e fino a 15 persone, che hanno ascoltato. Dalle registrazioni è emerso che questi racconti serali vertono su caccia, battaglie per il cibo, matrimoni e tradizioni prematrimoniali, omicidi, incendi, nascite, persone smarrite, interazioni con altri gruppi, inseguimenti da parte degli animali, tradimenti e litigi tra marito e moglie.\r\n\r\n \r\n\r\nArgomenti diversi. I ricercatori hanno registrato anche campioni di conversazioni diurne: di giorno si parla più spesso di pettegolezzi e lamentele sociali (il 34% dei discorsi); di questioni economiche, come che cosa cacciare per cena (31% delle conversazioni); di racconti divertenti (16%) e, più di rado, di storie (6%). Di notte, l''81 % delle conversazioni verte su storie, e solo il 7% dei racconti è costituito da gossip e lamentele; si parla poco anche di soldi o di come mantenersi (appena il 4% dei discorsi).\r\n\r\n \r\n\r\nandare oltre. «Le conversazioni diurne hanno molto a che fare con le attività economiche - il lavoro, la distribuzione delle risorse, la raccolta di cibo - e con le questioni di controllo sociale, come critiche e lamentele» spiega Wiessner.\r\n\r\n \r\n\r\n«Di notte, ci si lascia andare, ci si rilassa e si cerca di divertirsi. Se ci sono stati conflitti durante il giorno, li si supera e si prova a legare. Le conversazioni notturne sono per lo più storie, o racconti su persone non presenti o che fanno parte di network pià ampi, racconti sul mondo degli spiriti e su come questo influenzi il mondo umano. Di notte si canta e si balla, un''altra prassi che crea legami».\r\n\r\n \r\n\r\nPrerogativa umana. Le conversazioni intorno al fuoco, hanno osservato i ricercatori, contribuiscono a combinare matrimoni, creare un sistema sociale più equo, in cui si condivida il cibo e ci si aiuti a vicenda nei periodi più duri.\r\n\r\n \r\n\r\nDi notte si balla e si cade in trance, si comunica con le anime dei defunti e si pregano gli avi per la salute di chi è malato. Si usa l''immaginazione e si allenano le capacità cognitive. Tutte caratteristiche uniche del genere umano, che ci hanno permesso di colonizzare il pianeta e «formare comunità anche lontane fisicamente, ma vicine con la mente, comunità virtuali».\r\n\r\n \r\n\r\nE oggi? Lo studio si interroga infine - senza dare risposta - sul ruolo della luce elettrica, e per esteso dei device mobili da cui mai ci separiamo, sulle nostre attuali relazioni sociali. Luce, tablet e cellulari portano il lavoro nelle ore serali: il tempo delle relazioni diventa potenziale tempo lavorativo. Mettendo a rischio la nostra capacità di tessere reti e liberare l''immaginazione.', '2014-02-26', 58, 18, 5),
(6, 'L''auto con i sedili in pelle. Di pomodoro', NULL, 'Scocca in alluminio, cerchi in lega, fari allo xeno e interni…. in pomodoro. Sì, avete letto bene. Sedili e tappetini della vostra prossima automobile potrebbero essere realizzati con un materiale di origine vegetale ottenuto dagli scarti della lavorazione del pomodoro.\r\n\r\nLa strana coppia. Lo ha annunciato qualche giorno fa Ford, che ha recentemente stretto un accordo con il gigante del ketchup H.J. Heinz per la realizzazione di questo curioso progetto. Obiettivo delle due aziende è quello di utilizzare bucce, torsoli, foglie e rami dei pomodori per la realizzazione di una ecoplastica da impiegare negli interni delle auto.\r\n\r\nLa ricerca è ancora in fase embrionale e le sfide tecnologiche da superare non sono da poco. Prima tra tutte quella di trasformare le fibre vegetali dei pomodori in qualcosa di sufficientemente robusto e compatto da poter essere impiegato a livello industriale.', '2014-03-21', 0, 8, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `autore`
--

CREATE TABLE IF NOT EXISTS `autore` (
  `CodAutore` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Nazionalità` varchar(15) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  `Premi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CodAutore`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `autore`
--

INSERT INTO `autore` (`CodAutore`, `Nome`, `Cognome`, `Nazionalità`, `DataNascita`, `Premi`) VALUES
(1, 'Mario', 'Rossi', 'Italia', '1962-01-14', NULL),
(2, 'Carlo', 'Bianchi', 'Italia', '1970-09-07', NULL),
(3, 'Stephen ', 'James Lee', 'Inghilterra', '1980-02-24', 'National Book Award'),
(4, 'Filippo', 'Franceschini', 'Italia', NULL, 'Premio Bagutta'),
(5, 'Carlotta', 'Menichini', 'Italia', '1981-02-21', 'Premio Strega 2014 Premio Bancarella 2012'),
(6, 'Walter', 'Casagrande', 'Italia', '1952-12-05', NULL),
(7, 'Stefania', 'Rossi', 'Italia', '1972-06-04', 'Giornalisti nell''erba'),
(8, 'Giuliana', 'Fettuccia', 'Italia', '1953-10-03', 'Il Premiolino 2012'),
(9, 'Antonio', 'D''Incecco', 'San Marino', NULL, NULL),
(10, 'Giovanni', 'Finestrari', 'Italia', '1990-12-08', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `firma`
--

CREATE TABLE IF NOT EXISTS `firma` (
  `CodFirma` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `FK_Articolo` int(3) unsigned NOT NULL,
  `FK_Autore` int(3) unsigned NOT NULL,
  PRIMARY KEY (`CodFirma`),
  KEY `FK_Articolo` (`FK_Articolo`,`FK_Autore`),
  KEY `FK_Autore` (`FK_Autore`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `firma`
--

INSERT INTO `firma` (`CodFirma`, `FK_Articolo`, `FK_Autore`) VALUES
(2, 1, 7),
(1, 1, 9),
(3, 2, 3),
(4, 3, 2),
(5, 3, 3),
(8, 4, 3),
(6, 4, 4),
(7, 5, 10),
(10, 6, 2),
(9, 6, 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `rivista`
--

CREATE TABLE IF NOT EXISTS `rivista` (
  `CodRivista` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `NomeRiv` varchar(50) NOT NULL,
  `Anno` year(4) NOT NULL,
  PRIMARY KEY (`CodRivista`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dump dei dati per la tabella `rivista`
--

INSERT INTO `rivista` (`CodRivista`, `NomeRiv`, `Anno`) VALUES
(1, 'Focus', 2012),
(2, 'Focus', 2013),
(3, 'Geo', 2012),
(4, 'Geo', 2013),
(5, 'AutoOggi', 2012),
(6, 'AutoOggi', 2013);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `articolo`
--
ALTER TABLE `articolo`
  ADD CONSTRAINT `articolo_ibfk_1` FOREIGN KEY (`id_argomento`) REFERENCES `argomento` (`CodArgomento`),
  ADD CONSTRAINT `articolo_ibfk_2` FOREIGN KEY (`id_rivista`) REFERENCES `rivista` (`CodRivista`);

--
-- Limiti per la tabella `firma`
--
ALTER TABLE `firma`
  ADD CONSTRAINT `firma_ibfk_2` FOREIGN KEY (`FK_Autore`) REFERENCES `autore` (`CodAutore`),
  ADD CONSTRAINT `firma_ibfk_3` FOREIGN KEY (`FK_Articolo`) REFERENCES `articolo` (`ID_articolo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
