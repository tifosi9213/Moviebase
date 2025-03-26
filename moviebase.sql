-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 26. Mrz 2025 um 18:20
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `moviebase`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logindaten`
--

CREATE TABLE `logindaten` (
  `userid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `logindaten`
--

INSERT INTO `logindaten` (`userid`, `email`, `password`, `created`) VALUES
(13, 'rocco.nardone@student.ipso.ch', 'scrypt:32768:8:1$YGzjACIK9xU2QtOW$90538443cd0741403648d9a5e70cc4531183ac530d9f6a8b99daa42be79c50db2f98f8458cd0d259c7f28b377c0be77362aa7c74056649abb6b2083882d9f195', '2025-03-26 12:52:21'),
(14, 'rocco.nardone@student.ipso.de', 'scrypt:32768:8:1$hmNPdisZ7fe0wc32$024936b4162d9e0257e1f997bf2999c4896141ad3cd7da44f51870a74765919bc8ce23a76c7aa7508200b399423c2fe8ee175e330c677ea7ff2c7f928b7afbb2', '2025-03-26 12:59:59');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `genre`, `description`, `rating`, `created`) VALUES
(1, 'Karate Kid', '1984', 'Action', 'Daniel Larusso zieht mit seiner Mutter von New Jersey nach Kalifornien. Daniel freundet sich mit dem Hausmeister der Wohnanlage, Mr. Miyagi, einem freundlichen, aber auch rätselhaften Asiaten, an. An seiner neuen Schule lernt Daniel die Cheerleaderin Ali kennen. Doch ihr Ex-Freund Johnny gefällt diese Freundschaft gar nicht. Fortan drangsaliert er Daniel, wo er nur kann. Er ist Daniel deutlich übe', 5, '2025-03-18 14:58:10'),
(2, 'Rocky', '1976', 'Drama', 'Rocky Balbao, ein kleines Licht am Boxerhimmel, erhält plötzlich die einmalige Chance, gegen den Schwergewichtsweltmeister, Apollo Creed, in den Ring zu treten, wo er schließlich versucht, seine Selbstachtung zu bewahren und über die volle Distanz zu gehen.', 5, '2025-03-18 14:58:10'),
(3, 'Rambo', '1982', 'Action', 'Rambo ist ein Action- und Kriegsfilm, der von einem vom Krieg traumatisierten Menschen erzählt. Der Protagonist, John Rambo, ist ein Green Beret, der aus einem Kriegsgefangenenlager der Nordvietnamesen flüchten konnte. Nach seiner Rückkehr in die USA will er seine Kampfgefährten finden, doch er findet niemanden mehr. Entweder sind sie noch im Dschungel umgekommen oder zu Hause gestorben.', 3, '2025-03-18 14:58:10'),
(15, 'Iron Man', '2008', 'Science Fiction-Film', 'Superhelden-Film von Jon Favreau mit Robert Downey Jr. und Terrence Howard. Nicht jeder Held braucht Superkräfte – nur den Kopf eines futuristischen Erfinders und das Geld eines Multimilliardärs. Robert Downey Jr. gibt den Iron Man alias Tony Stark im ersten Teil der Comic-Verfilmung von Jon Favreau.', 8, '2025-03-25 16:19:57'),
(16, 'The Dark Knight Rises', '2012', 'Thriller', 'Superhelden-Film von Christopher Nolan mit Christian Bale und Tom Hardy. Mit The Dark Knight Rises führt Christopher Nolan seine düstere Batman-Trilogie zu einem Abschluss, indem sich Batman Christian Bale dem Terroristen Bane stellen muss.\r\n', 5, '2025-03-25 16:21:26'),
(17, 'Avatar - Aufbruch nach Pandora', '2009', 'Science Fiction-Film', 'Science Fiction-Film von James Cameron mit Sam Worthington und Zoe Saldana. Mit Avatar revolutionierte James Cameron das 3D-Kino. Auf dem Planeten Pandora soll Sam Worthington getarnt als Ureinwohner-Alien spionieren. Doch er verliebt sich in den vermeintlichen Feind.', 6, '2025-03-25 16:22:25'),
(18, 'Top Gun Maverick', '2022', 'Action', 'Für Top Gun: Maverick setzt sich Tom Cruise nach über 30 Jahren erneut in seinen Kampfjet. Als Legende der Lüfte will er sich seinen Platz am Himmel auch von jungen Nachrückern nicht streitig machen lassen.', 7, '2025-03-25 16:24:39');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `logindaten`
--
ALTER TABLE `logindaten`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indizes für die Tabelle `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `logindaten`
--
ALTER TABLE `logindaten`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
