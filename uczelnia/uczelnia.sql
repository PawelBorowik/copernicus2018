-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 09 Lip 2018, 21:24
-- Wersja serwera: 10.1.31-MariaDB
-- Wersja PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `uczelnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupa`
--

CREATE TABLE `grupa` (
  `IdGrupy` int(11) NOT NULL,
  `Starosta` int(11) NOT NULL,
  `NrGrupy` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `RokRozpoczecia` varchar(4) COLLATE utf8_polish_ci NOT NULL,
  `IdOddzialu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `grupa`
--

INSERT INTO `grupa` (`IdGrupy`, `Starosta`, `NrGrupy`, `RokRozpoczecia`, `IdOddzialu`) VALUES
(1, 0, '5DA inf', '2017', 1),
(2, 0, '5DB inf', '2017', 1),
(3, 0, '5DC inf', '2017', 1),
(4, 0, '5DD inf', '2017', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oddziałuczelni`
--

CREATE TABLE `oddziałuczelni` (
  `IdOddziału` int(10) NOT NULL,
  `OddzialMacierzysty` int(10) NOT NULL,
  `Nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Miasto` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Adres` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `KodPocztowy` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `Telefon` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Fax` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `WWW` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Opis` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `KluczeMin` int(10) NOT NULL,
  `KluczeMax` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `oddziałuczelni`
--

INSERT INTO `oddziałuczelni` (`IdOddziału`, `OddzialMacierzysty`, `Nazwa`, `Miasto`, `Adres`, `KodPocztowy`, `Telefon`, `Fax`, `Email`, `WWW`, `Opis`, `KluczeMin`, `KluczeMax`) VALUES
(1, 1, 'WSIZ \"Copernicus\"                      ', 'Wroclaw                         ', 'ul. Inowroclawska 59', '53-648', '+48-71-7950-393     ', '+48-71-7950-399     ', 'dziekanat@wsiz.wroc.pl                            ', 'www.wsiz.wroc.pl                        ', 'Główna siedziba uczelni.  ', 1, 1000000),
(2, 0, 'WSIZ \"Copernicus\" Filia w Legnicy', 'Legnica                         ', 'ul. Chrobrego 12  ', '', '+48-76-7300-234 ', '+48-76-7300-238', 'dziekanat@wsiz.legnica.pl', 'www.wsiz.legnical.pl  ', 'Filia w Legnicy.', 1000001, 2000000),
(3, 0, 'WSIZ \"Copernicus\" Filia w Opolu', 'Opole                           ', 'ul. Armii Krajowej 15', '', '+48-77-7530-101     ', '+48-77-7530-110     ', 'dziekanat@wsiz.opole.pl                           ', 'www.wsiz.opole.pl  ', 'Filia w Opolu. ', 2000001, 3000000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oplata`
--

CREATE TABLE `oplata` (
  `IdOplaty` int(11) NOT NULL,
  `RokPoczatek` int(11) NOT NULL,
  `RokKoniec` int(11) NOT NULL,
  `Kwota` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `DataWplaty` date NOT NULL,
  `Uwagi` text COLLATE utf8_polish_ci NOT NULL,
  `NrIndeksu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `idPracownika` int(11) NOT NULL,
  `Nazwisko` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Imie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `NIP` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `PESEL` varchar(12) COLLATE utf8_polish_ci NOT NULL,
  `Adres` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Miejscowosc` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `KodPocztowy` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `TelStac` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `TelKom` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Tytul` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `Stanowisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `DataZatrudnienia` date NOT NULL,
  `OkresZatrudnienia` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Pensja` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `IdOddzialu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`idPracownika`, `Nazwisko`, `Imie`, `NIP`, `PESEL`, `Adres`, `Miejscowosc`, `KodPocztowy`, `TelStac`, `TelKom`, `Email`, `Tytul`, `Stanowisko`, `DataZatrudnienia`, `OkresZatrudnienia`, `Pensja`, `IdOddzialu`) VALUES
(1, 'Nowakowski                                      ', 'Andrzej                               ', '612-412-54-64', '57121943212', 'ul. Åšwierkowa 6', 'WrocÅ‚aw                       ', '50-987', '+48-71-323-54-6     ', '+48-501-23-23-3     ', 'anowakowski@wsiz.wroc.pl    ', 'Dr', 'wykÅ‚adowca', '0000-00-00', '', '', 2),
(2, 'Kowalski                                 ', 'Jan                            ', '663-654-76-87', '72013142337', 'ul. Strzelecka 15/8', 'Wroc?aw ', '51-230', '+48-71-389-98-2     ', '+48-605-01-89-8     ', 'jkowalski@wsiz.wroc.pl                            ', 'Mgr inÅ¼.', 'asystent', '0000-00-00', '', '', 1),
(3, 'Janicki                                  ', 'Bogdan                         ', '432-543-654-6', '49042343259', 'ul. Pastelowa 58/98 ', 'WrocÅ‚aw                       ', '52-321', '+48-71-328-29-9     ', '+48-602-70-03-5     ', 'bjanicki@wsiz.wroc.pl                             ', 'Prof. dr hab.', 'rektor', '0000-00-00', '', '', 1),
(4, 'Marcinkowski                             ', 'Piotr                          ', '789-098-23-45', '76110309878', 'ul. Lakiernicza 98A/3', 'Wroc?aw                       ', '53-789', '+48-71-380-01-2     ', '+48-503-90-22-1     ', 'pmarcinkowski@wsiz.wroc.pl                        ', 'Mgr inÅ¼.', 'wykÅ‚adowca', '0000-00-00', '', '', 1),
(5, 'Andrzejewski                              ', 'Grzegorz                        ', '980-432-23-12', '52082898152', 'ul. Nobla 8/3 ', 'WrocÅ‚aw                  ', '50-128', '+48-71-780-01-9     ', '+48-603-81-39-2     ', 'gandrzejewski@wsiz.wroc.pl                        ', 'Mgr inÅ¼.', 'asystent', '0000-00-00', '', '', 1),
(6, 'Piotrowski                                  ', 'Bartlomiej                        ', '780-678-66-11', '65102189131', 'ul. Nadrzeczna 16/1 ', 'Legnica                       ', '55-085', '+48-76-720-29-8     ', '+48-604-93-28-1     ', 'bpiotrowski@wsiz.legnica.pl                       ', 'Dr.hab.inÅ¼.', 'wykÅ‚adowca', '0000-00-00', '', '', 3),
(7, 'BogdaÅ„ska                                  ', 'Ewa                              ', '430-543-55-22', '79031487924', 'ul. WrocÅ‚awska 23/37 ', 'Legnica                       ', '', '+48-76-725-13-9     ', '+48-501-98-28-3     ', 'mbogdanska@wsiz.legnica.pl                        ', 'Mgr', 'asystent', '0000-00-00', '', '', 2),
(8, 'Grzegorzewski                             ', 'PaweÅ‚                           ', '250-532-99-90', '76061898778', 'ul. Karkonoska 58 ', 'Wroc?aw                       ', '53-853', '+48-71-383-28-9     ', '+48-605-30-40-5     ', 'pgrzegorzewski@wsiz.legnica.pl                    ', 'Mgr inÅ¼.', 'asystent', '0000-00-00', '', '', 2),
(9, 'zxv', 'cvz', '', '', 'zxv', 'zxv', 'zxv', 'zv', 'zxv', 'zxv', 'Mgr', 'wykÅ‚adowca', '0000-00-00', '', '', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `prowadzacyprzedmiot`
--

CREATE TABLE `prowadzacyprzedmiot` (
  `IdPrzydzialu` int(11) NOT NULL,
  `KodPrzedmiotu` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `IdPracownika` int(11) NOT NULL,
  `IdGrupy` int(11) NOT NULL,
  `RokPoczatek` int(11) NOT NULL,
  `RokKoniec` int(11) NOT NULL,
  `Semestr` int(11) NOT NULL,
  `IdOddzialu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `prowadzacyprzedmiot`
--

INSERT INTO `prowadzacyprzedmiot` (`IdPrzydzialu`, `KodPrzedmiotu`, `IdPracownika`, `IdGrupy`, `RokPoczatek`, `RokKoniec`, `Semestr`, `IdOddzialu`) VALUES
(1, 'INF507W', 3, 1, 2017, 2018, 1, 1),
(2, 'INF507L', 2, 1, 2017, 2018, 1, 1),
(3, 'INF517W', 4, 1, 2017, 2018, 1, 1),
(4, 'INF517L', 5, 1, 2017, 2018, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `KodPrzedmiotu` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `Nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Semestr` int(11) NOT NULL,
  `ECTS` int(11) NOT NULL,
  `FormaZajec` int(11) NOT NULL,
  `Opiekun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przedmiot`
--

INSERT INTO `przedmiot` (`KodPrzedmiotu`, `Nazwa`, `Semestr`, `ECTS`, `FormaZajec`, `Opiekun`) VALUES
('INF407L', 'Bazy danych      ', 4, 3, 10, 1),
('INF407P', 'Bazy danych           ', 4, 0, 1, 1),
('INF407W', 'Bazy danych             ', 4, 4, 2000, 1),
('INF507L', 'Sieciowe bazy danych      ', 5, 3, 2, 1),
('INF507W', 'Sieciowe bazy danych', 5, 4, 10000, 1),
('INF517L', 'Grafika komputerowa    ', 5, 3, 20, 2),
('INF517W', 'Grafika komputerowa      ', 5, 5, 20000, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `student`
--

CREATE TABLE `student` (
  `NrIndeksu` int(11) NOT NULL,
  `Nazwisko` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Imie` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Pesel` text COLLATE utf8mb4_polish_ci NOT NULL,
  `NIP` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Adres` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Miejscowosc` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `KodPocztowy` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Telefon` text COLLATE utf8mb4_polish_ci NOT NULL,
  `Email` text COLLATE utf8mb4_polish_ci NOT NULL,
  `DataZapisania` date NOT NULL,
  `DataWipisania` date NOT NULL,
  `IdGrupy` int(11) NOT NULL,
  `PoprzedniOddzial` int(11) NOT NULL,
  `IdOddzialu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `student`
--

INSERT INTO `student` (`NrIndeksu`, `Nazwisko`, `Imie`, `Pesel`, `NIP`, `Adres`, `Miejscowosc`, `KodPocztowy`, `Telefon`, `Email`, `DataZapisania`, `DataWipisania`, `IdGrupy`, `PoprzedniOddzial`, `IdOddzialu`) VALUES
(1, 'Andrzejewski                            ', 'Marcin                        ', '8312157639 ', '659-907-10-41', 'ul. Miodowa 138/16                                                                                                              ', 'Wrocław                                 ', '53-763', '+48-605-78-89-3     ', 'marcin.andrzejewski@poczta.onet.pl                ', '2015-12-09', '0000-00-00', 1, 1, 1),
(2, 'Bobrowski                               ', 'Michał                        ', '84012279173', '632-388-13-03', 'ul. Okrężna 28                                                                                                                  ', 'Wrocław                                 ', '50-389', '+48-501-23-50-3     ', 'mbobrowski@interia.pl                             ', '2017-03-14', '0000-00-00', 1, 1, 1),
(3, 'Ciechanowski                            ', 'Artur                         ', '83100832153', '651-124-72-28', 'ul.Kościuszki 15                                                                                                                ', 'Trzebnica                               ', '51-839', 'Brak.               ', 'artur_ciechanowski@gazeta.pl                      ', '2017-07-03', '0000-00-00', 2, 1, 1),
(4, 'Drozdowski                              ', 'Tomasz                        ', '83070168971', '691-459-10-35', 'ul.Mieszka I 83/2                                                                                                               ', 'Wrocław                                 ', '52-983', '+48-604-70-35-8     ', 'tomasz_drozd@pf.pl                                ', '2017-06-06', '0000-00-00', 2, 1, 1),
(5, 'Borowski                                ', 'Daniel                        ', '83042121457', '681-298-49-57', 'ul. Latawcowa 34/12                                                                                                             ', 'Wrocław                                 ', '50-023', 'Brak.               ', 'daniel.borek@interia.pl                           ', '2017-08-07', '0000-00-00', 2, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zaliczenie`
--

CREATE TABLE `zaliczenie` (
  `IdZaliczenia` int(11) NOT NULL,
  `DataZaliczenia` datetime NOT NULL,
  `Ocena` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `Uwagi` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `TypZaliczenia` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `idZapisu` int(11) NOT NULL,
  `Termin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zaliczenie`
--

INSERT INTO `zaliczenie` (`IdZaliczenia`, `DataZaliczenia`, `Ocena`, `Uwagi`, `TypZaliczenia`, `idZapisu`, `Termin`) VALUES
(1, '2018-06-29 00:00:00', '2.0', 'Brak.', 'egzamin                         ', 1, 1),
(2, '2018-06-30 00:00:00', '2.0', 'Brak.', 'egzamin                         ', 1, 2),
(3, '2018-06-16 00:00:00', '3.0', 'Brak.', 'egzamin                         ', 1, 3),
(4, '2018-07-04 00:00:00', '5.0', 'Brak.', 'egzamin                        ', 2, 1),
(5, '2018-06-26 00:00:00', '4.0', 'Brak.', 'egzamin                         ', 3, 1),
(6, '2018-07-07 00:00:00', '2.0', 'Brak.', 'zaliczenie ', 4, 1),
(7, '2018-07-10 00:00:00', '3.5', 'Brak.', 'zaliczenie                      ', 4, 2),
(8, '2018-07-10 00:00:00', '5.5', 'Brak.', 'zaliczenie ', 5, 1),
(9, '2018-06-13 00:00:00', '4.5', 'Brak.', 'zaliczenie ', 6, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapisy`
--

CREATE TABLE `zapisy` (
  `IdZapisu` int(11) NOT NULL,
  `IdPrzydzialu` int(11) NOT NULL,
  `NrIndeksu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zapisy`
--

INSERT INTO `zapisy` (`IdZapisu`, `IdPrzydzialu`, `NrIndeksu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 3, 1),
(8, 3, 2),
(9, 3, 3),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `grupa`
--
ALTER TABLE `grupa`
  ADD PRIMARY KEY (`IdGrupy`),
  ADD KEY `IdOddzialu` (`IdOddzialu`);

--
-- Indeksy dla tabeli `oddziałuczelni`
--
ALTER TABLE `oddziałuczelni`
  ADD PRIMARY KEY (`IdOddziału`);

--
-- Indeksy dla tabeli `oplata`
--
ALTER TABLE `oplata`
  ADD PRIMARY KEY (`IdOplaty`),
  ADD KEY `NrIndeksu` (`NrIndeksu`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`idPracownika`),
  ADD KEY `IdOddzialu` (`IdOddzialu`);

--
-- Indeksy dla tabeli `prowadzacyprzedmiot`
--
ALTER TABLE `prowadzacyprzedmiot`
  ADD PRIMARY KEY (`IdPrzydzialu`),
  ADD KEY `IdOddzialu` (`IdOddzialu`),
  ADD KEY `IdGrupy` (`IdGrupy`),
  ADD KEY `IdPracownika` (`IdPracownika`),
  ADD KEY `KodPrzedmiotu` (`KodPrzedmiotu`);

--
-- Indeksy dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`KodPrzedmiotu`),
  ADD KEY `Opiekun` (`Opiekun`);

--
-- Indeksy dla tabeli `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`NrIndeksu`),
  ADD KEY `IdOddzialu` (`IdOddzialu`),
  ADD KEY `IdGrupy` (`IdGrupy`);

--
-- Indeksy dla tabeli `zaliczenie`
--
ALTER TABLE `zaliczenie`
  ADD PRIMARY KEY (`IdZaliczenia`),
  ADD KEY `idZapisu` (`idZapisu`);

--
-- Indeksy dla tabeli `zapisy`
--
ALTER TABLE `zapisy`
  ADD PRIMARY KEY (`IdZapisu`),
  ADD KEY `NrIndeksu` (`NrIndeksu`),
  ADD KEY `IdPrzydzialu` (`IdPrzydzialu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `grupa`
--
ALTER TABLE `grupa`
  MODIFY `IdGrupy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `oddziałuczelni`
--
ALTER TABLE `oddziałuczelni`
  MODIFY `IdOddziału` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `oplata`
--
ALTER TABLE `oplata`
  MODIFY `IdOplaty` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `idPracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `prowadzacyprzedmiot`
--
ALTER TABLE `prowadzacyprzedmiot`
  MODIFY `IdPrzydzialu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `student`
--
ALTER TABLE `student`
  MODIFY `NrIndeksu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `zaliczenie`
--
ALTER TABLE `zaliczenie`
  MODIFY `IdZaliczenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `zapisy`
--
ALTER TABLE `zapisy`
  MODIFY `IdZapisu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `grupa`
--
ALTER TABLE `grupa`
  ADD CONSTRAINT `grupa_ibfk_1` FOREIGN KEY (`IdOddzialu`) REFERENCES `oddziałuczelni` (`IdOddziału`);

--
-- Ograniczenia dla tabeli `oplata`
--
ALTER TABLE `oplata`
  ADD CONSTRAINT `oplata_ibfk_1` FOREIGN KEY (`NrIndeksu`) REFERENCES `student` (`NrIndeksu`);

--
-- Ograniczenia dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `pracownik_ibfk_1` FOREIGN KEY (`IdOddzialu`) REFERENCES `oddziałuczelni` (`IdOddziału`);

--
-- Ograniczenia dla tabeli `prowadzacyprzedmiot`
--
ALTER TABLE `prowadzacyprzedmiot`
  ADD CONSTRAINT `prowadzacyprzedmiot_ibfk_1` FOREIGN KEY (`IdOddzialu`) REFERENCES `oddziałuczelni` (`IdOddziału`),
  ADD CONSTRAINT `prowadzacyprzedmiot_ibfk_2` FOREIGN KEY (`IdGrupy`) REFERENCES `grupa` (`IdGrupy`),
  ADD CONSTRAINT `prowadzacyprzedmiot_ibfk_3` FOREIGN KEY (`IdPracownika`) REFERENCES `pracownik` (`idPracownika`),
  ADD CONSTRAINT `prowadzacyprzedmiot_ibfk_4` FOREIGN KEY (`KodPrzedmiotu`) REFERENCES `przedmiot` (`KodPrzedmiotu`);

--
-- Ograniczenia dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD CONSTRAINT `przedmiot_ibfk_1` FOREIGN KEY (`Opiekun`) REFERENCES `pracownik` (`idPracownika`);

--
-- Ograniczenia dla tabeli `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`IdOddzialu`) REFERENCES `oddziałuczelni` (`IdOddziału`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`IdGrupy`) REFERENCES `grupa` (`IdGrupy`);

--
-- Ograniczenia dla tabeli `zaliczenie`
--
ALTER TABLE `zaliczenie`
  ADD CONSTRAINT `zaliczenie_ibfk_1` FOREIGN KEY (`idZapisu`) REFERENCES `zapisy` (`IdZapisu`);

--
-- Ograniczenia dla tabeli `zapisy`
--
ALTER TABLE `zapisy`
  ADD CONSTRAINT `zapisy_ibfk_1` FOREIGN KEY (`NrIndeksu`) REFERENCES `student` (`NrIndeksu`),
  ADD CONSTRAINT `zapisy_ibfk_2` FOREIGN KEY (`IdPrzydzialu`) REFERENCES `prowadzacyprzedmiot` (`IdPrzydzialu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
