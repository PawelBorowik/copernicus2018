-- Baza danych: System obs³ugi magazynu budowlanego P22--
CREATE DATABASE magazyn_budowlany
GO

USE magazyn_budowlany
GO
-------------------------------------------------------
--Tworzenie tabel
--------------------------------------------------------
CREATE TABLE dbo.BazaMiast
(
	IDBazaMiast char(10)    NOT NULL,
	KodPocztowy	char(10)    NOT NULL,
	Miasto		varchar(50) NOT NULL,
	Gmina		varchar(50) NULL,
	Powiat		varchar(50)	NULL,
	Wojewodztwo varchar(50) NULL,
	);
GO
CREATE TABLE dbo.KategoriaProduktow
(
	IDKategorii	char(10)    NOT NULL,
	NazwaDzia³u varchar(50) NOT NULL,
	);
GO
CREATE TABLE dbo.Kontrahenci
(
	IDKontrahenta	char(10)    NOT NULL,
	Imie				varchar(30) NULL,
	Nazwisko			varchar(50) NULL,
	Firma			varchar(50) NULL,
	Ulica			varchar(50) NULL,
	nr_domu			int			NULL,
	nrmieszkania		char(10)		NULL,
	IDBazaMiast    char(10)		NOT NULL,
	rabat			int			NULL,
	telefon			int			NULL,
	);
GO
CREATE TABLE dbo.Lokalizacja
(
	IDMiejsceSkladowania		char(10)    NOT NULL,
	aleja					char(10)    NOT NULL,
	rzad						int		    NOT NULL,
	polka					int		    NOT NULL,
);
GO
CREATE TABLE dbo.Pracownicy
(
	IDPracownika		char(10)    NOT NULL,
	IDKontrahenta	char(10)    NOT NULL,
);
GO
CREATE TABLE dbo.Produkty
(
	IDProduktu				char(10)    NOT NULL,
	IDKategorii				char(10)    NOT NULL,
	IDDostawcy				char(10)    NULL,
	NazwaProduktu			varchar(50) NULL,
	Ilosc					int			NULL,
	Cena					int			NULL,
	Jednostka_miary			char(10)    NULL,
	IDMiejsceSkladowania    char(10)    NULL,
);
GO
CREATE TABLE dbo.Zamowienie
(
	IDZamowienia			INT			NOT NULL,
	IDKlienta				char(10)    NOT NULL,
	IDProduktu1				char(10)    NOT NULL,
	Datazamowienia			date			NULL,
	Datarealizacji			date			NULL,
	IdMagazyniera			char(10)    NOT NULL,
	Wartosc					int			NULL,
	Ilosc					int			NULL,
);
GO
CREATE TABLE dbo.Reklamacje
(
	IDReklamacji			char(10)    NOT NULL,	
	IDProduktu				char(10)    NOT NULL,
	
	IDReklamujacego			char(10)    NULL,
	NazwaProduktu			varchar(50) NULL,
	Ilosc					int			NULL,
	Datareklamacji		    date	    NULL,
	Jednostka_miary			char(10)    NULL,
	IDMiejsceSkladowania1    char(10)    NULL,
);
GO
CREATE TABLE dbo.Magazyn_Wyprzedazy
(
	IDProduktuWyprzedazy	char(10)    NOT NULL,	
	NazwaProduktu			varchar(50) NULL,
	Ilosc					int			NULL,
	Jednostka_miary			char(10)    NULL,
	IDMiejsceSkladowania1    char(10)    NULL,
);
GO
CREATE TABLE dbo.Szrot
(
	IDSzrot					char(10)    NOT NULL,	
	NazwaProduktu			varchar(50) NULL,
	Ilosc					int			NULL,
	Jednostka_miary			char(10)    NULL,
	IDMiejsceSkladowania1    char(10)    NULL,
);
GO


-- Klucze g³ówne--

ALTER TABLE [dbo].[BazaMiast] WITH CHECK ADD CONSTRAINT [PK_BazaMiast] PRIMARY KEY CLUSTERED ([IDBazaMiast]) 
GO
ALTER TABLE [dbo].[KategoriaProduktow] WITH CHECK ADD CONSTRAINT [PK_KategoriaProduktow] PRIMARY KEY CLUSTERED ([IDKategorii]) 
GO
ALTER TABLE [dbo].[Kontrahenci] WITH CHECK ADD CONSTRAINT [PK_Kontrahenci] PRIMARY KEY CLUSTERED ([IDKontrahenta]) 
GO
ALTER TABLE [dbo].[Lokalizacja] WITH CHECK ADD CONSTRAINT [PK_Lokalizacja] PRIMARY KEY CLUSTERED ([IDMiejsceSkladowania]) 
GO
ALTER TABLE [dbo].[Pracownicy] WITH CHECK ADD CONSTRAINT [PK_Pracownicy] PRIMARY KEY CLUSTERED ([IDPracownika]) 
GO
ALTER TABLE [dbo].[Produkty] WITH CHECK ADD CONSTRAINT [PK_Produkty] PRIMARY KEY CLUSTERED ([IDProduktu]) 
GO
ALTER TABLE [dbo].[Zamowienie] WITH CHECK ADD CONSTRAINT [PK_Zamowienie] PRIMARY KEY CLUSTERED ([IDZamowienia]) 
GO
ALTER TABLE [dbo].[Reklamacje] WITH CHECK ADD CONSTRAINT [PK_Reklamacje] PRIMARY KEY CLUSTERED ([IDReklamacji]) 
GO
ALTER TABLE [dbo].[Magazyn_Wyprzedazy] WITH CHECK ADD CONSTRAINT [PK_Magazyn_Wyprzedazy] PRIMARY KEY CLUSTERED ([IDProduktuWyprzedazy]) 
GO
ALTER TABLE [dbo].[Szrot] WITH CHECK ADD CONSTRAINT [PK_Szrot] PRIMARY KEY CLUSTERED ([IDSzrot]) 
GO

--Klucze obce---

ALTER TABLE [dbo].[Kontrahenci] WITH CHECK ADD CONSTRAINT [FK_Kontrahenci_BazaMiast] FOREIGN KEY([IDBazaMiast])
REFERENCES [dbo].[BazaMiast] ([IDBazaMiast])
GO
ALTER TABLE [dbo].[Pracownicy] WITH CHECK ADD CONSTRAINT [FK_Pracownicy_Kontrahenci] FOREIGN KEY([IDKontrahenta])
REFERENCES [dbo].[Kontrahenci] ([IDKontrahenta])
GO
ALTER TABLE [dbo].[Produkty] WITH CHECK ADD CONSTRAINT [FK_Produkty_KategoriaProduktow] FOREIGN KEY([IDKategorii])
REFERENCES [dbo].[KategoriaProduktow] ([IDKategorii])
GO
ALTER TABLE [dbo].[Produkty] WITH CHECK ADD CONSTRAINT [FK_Produkty_Kontrahenci] FOREIGN KEY([IDDostawcy])
REFERENCES [dbo].[Kontrahenci] ([IDKontrahenta])
GO
ALTER TABLE [dbo].[Zamowienie] WITH CHECK ADD CONSTRAINT [FK_Zamowienie_Produkty] FOREIGN KEY([IDProduktu1])
REFERENCES [dbo].[Produkty] ([IDProduktu])
GO
ALTER TABLE [dbo].[Zamowienie] WITH CHECK ADD CONSTRAINT [FK_Zamowienie_Pracownicy] FOREIGN KEY([IdMagazyniera])
REFERENCES [dbo].[Pracownicy] ([IDPracownika])
GO
ALTER TABLE [dbo].[Zamowienie] WITH CHECK ADD CONSTRAINT [FK_Zamowienie_Kontrahenci] FOREIGN KEY([IDKlienta])
REFERENCES [dbo].[Kontrahenci] ([IDKontrahenta])
GO
ALTER TABLE [dbo].[Produkty] WITH CHECK ADD CONSTRAINT [FK_Produkty_Lokalizacja] FOREIGN KEY([IDMiejsceSkladowania ])
REFERENCES [dbo].[Lokalizacja] ([IDMiejsceSkladowania])
GO
ALTER TABLE [dbo].[Reklamacje] WITH CHECK ADD CONSTRAINT [FK_Reklamacje_Produkty] FOREIGN KEY([IDProduktu])
REFERENCES [dbo].[Produkty] ([IDProduktu])
GO
ALTER TABLE [dbo].[Reklamacje] WITH CHECK ADD CONSTRAINT [FK_Reklamacje_Kontrahenci] FOREIGN KEY([IDReklamujacego])
REFERENCES [dbo].[Kontrahenci] ([IDKontrahenta])
GO
ALTER TABLE [dbo].[Reklamacje] WITH CHECK ADD CONSTRAINT [FK_Reklamacje_Lokalizacja] FOREIGN KEY([IDMiejsceSkladowania1])
REFERENCES [dbo].[Lokalizacja] ([IDMiejsceSkladowania])
GO
ALTER TABLE [dbo].[Magazyn_Wyprzedazy] WITH CHECK ADD CONSTRAINT [FK_Magazyn_Wyprzedazy_Lokalizacja] FOREIGN KEY([IDMiejsceSkladowania1])
REFERENCES [dbo].[Lokalizacja] ([IDMiejsceSkladowania])
GO
ALTER TABLE [dbo].[Szrot] WITH CHECK ADD CONSTRAINT [FK_Szrot_Lokalizacja] FOREIGN KEY([IDMiejsceSkladowania1])
REFERENCES [dbo].[Lokalizacja] ([IDMiejsceSkladowania])
GO


--kontrola poprawnoœci danych CHECK--
ALTER TABLE [dbo].[BazaMiast] WITH CHECK ADD CHECK ([KodPocztowy] like '[0-9][0-9]-[0-9][0-9][0-9]') 
GO
 
 --------------------------PROCEDURY DO MODYFIKACJI DANYCH--------------------------------
 ------------------------------INSERT--DELETE--UPDATE-----------------------------------
 


 -------Procedury w tabeli "Bazamiast"----------
 --INSERT--

 CREATE PROCEDURE dbo.BazaMiast_Wstaw
@Par_IDBazaMiast		char(10), 
@Par_KodPocztowy		char(10),    
@Par_Miasto			varchar(50),
@Par_Gmina			varchar(50), 
@Par_Powiat			varchar(50),	
@Par_Wojewodztwo		varchar(50) 

AS
BEGIN 
INSERT dbo.BazaMiast
(IDBazaMiast, KodPocztowy, Miasto,	Gmina, Powiat, Wojewodztwo)
VALUES
(@Par_IDBazaMiast, @Par_KodPocztowy, @Par_Miasto, @Par_Gmina, @Par_Powiat, @Par_Wojewodztwo) 
END;
GO
-------Procedury w tabeli "Lokalizacja"----------
 --INSERT--
CREATE PROCEDURE dbo.WstawLokalizacja
@Par_IDMiejsceSkladowania char(10),
@Par_aleja char(10),
@Par_rzad char(10),
@Par_polka char(10)

AS
BEGIN 
INSERT dbo.Lokalizacja
(IDMiejsceSkladowania,aleja, rzad,polka )
VALUES
(@Par_IDMiejsceSkladowania,@Par_aleja, @Par_rzad, @Par_polka);
END;
GO



-------Procedury w tabeli "Kategoria produktów"----------
 --INSERT--

CREATE PROCEDURE dbo.WstawKategoriaProduktow
@Par_IDKategorii char(10),
@Par_NazwaDzia³u varchar(50)

AS
BEGIN 
INSERT dbo.KategoriaProduktow
(IDKategorii,NazwaDzia³u )
VALUES
(@Par_IDKategorii,@Par_NazwaDzia³u);
END;
GO
-------Procedury w tabeli "Kontrahenci"----------
 --INSERT--
CREATE PROCEDURE dbo.Kontraheci_Wstaw
@Par_IdKontrahenta char(10),
@Par_Imie char(30),
@Par_Nazwisko char(50),
@Par_Firma char(50),
@Par_Ulica char(50),
@Par_nr_domu int,
@Par_nrmieszkania char(10),
@Par_IDBazaMiast char(10),
@Par_rabat int,
@Par_telefon int

AS
BEGIN 
INSERT dbo.Kontrahenci
(IdKontrahenta, Imie, Nazwisko, Firma, Ulica, nr_domu, nrmieszkania, IDBazaMiast, rabat, telefon )
VALUES
(@Par_IdKontrahenta, @Par_Imie, @Par_Nazwisko, @Par_Firma, @Par_Ulica, @Par_nr_domu,
 @Par_nrmieszkania, @Par_IDBazaMiast, @Par_rabat, @Par_telefon );
END;
GO

 --UPDATE-- w tabeli kontrahenci-
CREATE PROCEDURE dbo.Kontrahenci_Update
@Par_IdKontrahenta char(10),
@Par_Imie char(30),
@Par_Nazwisko char(50),
@Par_Firma char(50),
@Par_Ulica char(50),
@Par_nr_domu int,
@Par_nrmieszkania char(10),
@Par_IDBazaMiast char(10),
@Par_rabat int,
@Par_telefon int

AS
BEGIN
UPDATE dbo.Kontrahenci
SET
IdKontrahenta=@Par_IdKontrahenta,Imie=@Par_Imie, Nazwisko=@Par_Nazwisko, Firma=@Par_Firma, Ulica=@Par_Ulica, 
nr_domu=@Par_nr_domu, nrmieszkania=@Par_nrmieszkania,IDBazaMiast=@Par_IDBazaMiast,rabat =@Par_rabat, 
telefon=@Par_telefon

WHERE IdKontrahenta = @Par_IdKontrahenta;
END;
GO

-----------------------------------------------
-------Procedury w tabeli "Pracownicy"----------
 --INSERT--
CREATE PROCEDURE dbo.WstawPracownicy
@Par_IDPracownika char(10),
@Par_IDKontrahenta char(10)


AS
BEGIN 
INSERT dbo.Pracownicy
(IDPracownika,IDKontrahenta )
VALUES
(@Par_IDPracownika,@Par_IDKontrahenta);
END;
GO
-------Procedury w tabeli "Produkty"----------
 --INSERT--
CREATE PROCEDURE dbo.Produkty_Wstaw
@Par_idProduktu char(10),
@Par_idKategorii char(10),
@Par_idDostawcy char(10),
@Par_NazwaProduktu char(50),
@Par_Ilosc int,
@Par_Cena int,
@Par_Jednostka_miary char(10),
@Par_idMiejsceSkladowania char(10)

AS
BEGIN 
INSERT dbo.Produkty
(idProduktu, idKategorii, idDostawcy, NazwaProduktu, Ilosc, Cena, Jednostka_miary, idMiejsceSkladowania)
VALUES
(@Par_idProduktu, @Par_idKategorii, @Par_idDostawcy, @Par_NazwaProduktu, @Par_Ilosc, @Par_Cena,
 @Par_Jednostka_miary, @Par_idMiejsceSkladowania);
END;
GO
 --UPDATE-- w tabeli "Produkty"-
 CREATE PROCEDURE dbo.Produkty_Update
@Par_idProduktu char(10),
@Par_idKategorii char(10),
@Par_idDostawcy char(10),
@Par_NazwaProduktu char(50),
@Par_Ilosc int,
@Par_Cena int,
@Par_Jednostka_miary char(10),
@Par_idMiejsceSkladowania char(10)

AS
BEGIN
UPDATE dbo.Produkty
SET
idProduktu=@Par_idProduktu, idKategorii=@Par_idKategorii, idDostawcy= @Par_idDostawcy,
NazwaProduktu=@Par_NazwaProduktu, Ilosc=@Par_Ilosc, Cena=@Par_Cena, 
Jednostka_miary=@Par_Jednostka_miary, idMiejsceSkladowania =@Par_idMiejsceSkladowania 

WHERE idProduktu=@Par_idProduktu
END;
GO



-------Procedury w tabeli "Zamówienie"----------
 --INSERT--
CREATE PROCEDURE dbo.Zamówienie_Wstaw
@Par_IDzamowienia int,
@Par_idKlienta char(10),
@Par_IDProduktu1 char(10),
@Par_Datazamowienia date,
@Par_Datarealizacji date,
@Par_IDMagazyniera char(10),
@Par_wartosc int,
@Par_ilosc int


AS
BEGIN 
INSERT dbo.Zamowienie
(IDzamowienia, idKlienta, IDProduktu1, Datazamowienia, Datarealizacji, IDMagazyniera, wartosc, ilosc)
VALUES
(@Par_IDzamowienia, @Par_idKlienta, @Par_IDProduktu1, @Par_Datazamowienia, @Par_Datarealizacji, @Par_IDMagazyniera,
 @Par_wartosc, @Par_ilosc);
END;
GO

---UPDATE-- w tabeli "Produkty"
CREATE PROCEDURE dbo.Zamówienie_Update
@Par_IDzamowienia int,
@Par_idKlienta char(10),
@Par_idProduktu1 char(10),
@Par_Datazamowienia date,
@Par_Datarealizacji date,
@Par_IDMagazyniera char(10),
@Par_wartosc int,
@Par_ilosc int
AS
BEGIN
UPDATE dbo.Zamowienie
SET
IDzamowienia=@Par_IDzamowienia,idKlienta=@Par_idKlienta,idProduktu1=@Par_idProduktu1,Datazamowienia=@Par_Datazamowienia,
Datarealizacji=@Par_Datarealizacji,IDMagazyniera=@Par_IDMagazyniera,wartosc=@Par_wartosc,ilosc=@Par_ilosc
WHERE IDzamowienia=@Par_IDzamowienia
END;
GO


--Wstawianie danych do tabeli "Baza miast"--

EXECUTE dbo.BazaMiast_Wstaw 001, '30-698', 'Kraków', 'Kraków','Kraków', 'Ma³opolskie';
EXECUTE dbo.BazaMiast_Wstaw 002,'40-750', 'Katowice', 'Katowice','Katowice', 'Œl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 003,'43-600', 'Jaworzno', 'Jaworzno','Jaworzno', 'Œl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 004,'50-001', 'Wroc³aw', 'Wroc³aw','Wroc³aw', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 005,'50-003', 'Wroc³aw', 'Wroc³aw','Wroc³aw', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 006,'55-081', 'Mietków', 'Mietków','wroc³awski', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 007,'55-200', 'O³awa', 'O³awa','o³awski', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 008,'56-400', 'Olesnica', 'Olesnica','oleœnicki', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 009,'56-416', 'Twardogóra', 'Twardogóra','oleœnicki', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 010,'56-420', 'Mietków', 'Mietków','wroc³awski', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 011,'56-415', 'Bierutów', 'Bierutów','oleœnicki', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 012,'80-790', 'Bydgoszcz', 'Bydgoszcz','Bydgoszcz', 'Kujawsko-Pomorskie';
EXECUTE dbo.BazaMiast_Wstaw 013,'56-504', 'Dziadowa K³oda', 'Dziadowa K³oda','oleœnicki', 'Dolnoœl¹skie';
EXECUTE dbo.BazaMiast_Wstaw 014,'83-110', 'Tczew', 'Tczew','Tczew', 'Pomorskie';
GO

--Wstawianie danych do tabeli Lokalizacja--

EXECUTE dbo.WstawLokalizacja 'LOK001', 'A',1,0;
EXECUTE dbo.WstawLokalizacja 'LOK002', 'A',1,1;
EXECUTE dbo.WstawLokalizacja 'LOK003', 'A',1,2;
EXECUTE dbo.WstawLokalizacja 'LOK004', 'A',1,3;
EXECUTE dbo.WstawLokalizacja 'LOK025', 'C',3,0;
EXECUTE dbo.WstawLokalizacja 'LOK123', 'D',12,1;
EXECUTE dbo.WstawLokalizacja 'LOK124', 'D',12,2;
EXECUTE dbo.WstawLokalizacja 'LOK125', 'D',12,3;
EXECUTE dbo.WstawLokalizacja 'LOK155', 'H',5,0;
EXECUTE dbo.WstawLokalizacja 'LOK156', 'H',5,1;
EXECUTE dbo.WstawLokalizacja 'LOK170', 'J',4,0;
EXECUTE dbo.WstawLokalizacja 'LOK245', 'M',3,0;
GO

--Wstawianie danych do tabeli "Kategoria produktów"--
EXECUTE dbo.WstawKategoriaProduktow 'DRE', 'Drewno';
EXECUTE dbo.WstawKategoriaProduktow 'NAR', 'Narzêdzia';
EXECUTE dbo.WstawKategoriaProduktow 'OGL', 'Ogólno budowlany';
EXECUTE dbo.WstawKategoriaProduktow 'OGR', 'Artyku³y ogrodowe';
EXECUTE dbo.WstawKategoriaProduktow 'SAN', 'Sanitarno-hydrauliczny';
EXECUTE dbo.WstawKategoriaProduktow 'WYW', 'Wykoñczenia wnêtrz';
GO

--Wstawianie danych do tabeli "Kontahenci"--

EXECUTE dbo.Kontraheci_Wstaw 'K0001', 'Monika', 'Borowik', null, 'Witosa', 13, null, 008, null, 258333444;
EXECUTE dbo.Kontraheci_Wstaw 'K0002', 'Jan', 'Sznurek', 'Sznurex', 'Prosta', 13, null, 004, null, 258356789;
EXECUTE dbo.Kontraheci_Wstaw 'K0003', 'Adam', 'Ma³ysz', null, 'Sejmowa', 10, null, 008, null, 933356789;
EXECUTE dbo.Kontraheci_Wstaw 'K0004', 'Kacper', 'Górny', null, 'Wroc³awska', 3, null, 009, null, 258459658;
EXECUTE dbo.Kontraheci_Wstaw 'K0005', null, null, 'Cegla sp zoo', 'Wysoka', 52, null, 014, null, 227825741;
EXECUTE dbo.Kontraheci_Wstaw 'K0006', 'Jakub', 'Kowalski', null, 'Polna', 3, 9, 010, 10, 255878934;
EXECUTE dbo.Kontraheci_Wstaw 'K0007', 'Macjej', 'Potocki', null, 'Kopernika', 28, null, 010, null, 255889658;
EXECUTE dbo.Kontraheci_Wstaw 'K0008', null, null, 'Drutex', 'Gliniana', 89, null, 002, null, 595989658;
EXECUTE dbo.Kontraheci_Wstaw 'K0009', 'Wiktor', 'Waliszak', 'Kominex', 'G³ówna', 3, null, 006, null, 225259758;
EXECUTE dbo.Kontraheci_Wstaw 'K0010', 'Andrzej', 'Piaseczny', null, 'Wroc³awska', 89, null, 008, 10, null;
EXECUTE dbo.Kontraheci_Wstaw 'K0011',null, null, 'Bosch', 'Krucza', 3, null, 004, null, 247878759;
EXECUTE dbo.Kontraheci_Wstaw 'K0012', 'Piotr', 'Górny', null, 'Wielepolna', 3, null, 005, null, 698569987;
EXECUTE dbo.Kontraheci_Wstaw 'K0013', 'Micha³', 'Lewandowski', '£opatex', 'Krakowska',5, null, 003, null, 151536444;
EXECUTE dbo.Kontraheci_Wstaw 'K0014', null, null, 'Glazureks', 'Krakowska', 3, null, 014, null, 697634658;
EXECUTE dbo.Kontraheci_Wstaw 'K0026', 'Micha³', 'Rdziwi³³', null, 'Wroc³awska', 45, 23, 006, 25, 697858937;
EXECUTE dbo.Kontraheci_Wstaw 'K0027', 'Pawe³', 'Potocki', null, 'Nowowiejska', 4, null, 008, 25, null;
EXECUTE dbo.Kontraheci_Wstaw 'K0030', 'Pawe³', 'Horn', null, 'Boczna', 9, null, 008, 20, null;
EXECUTE dbo.Kontraheci_Wstaw 'K0031', 'Andrzej', 'Kowalski', null, 'Gwarna', 123, 11, 005, null, null;
GO

---Wstawianie danych do tabeli "Pracownicy"--

EXECUTE dbo.WstawPracownicy 'MBOR', 'K0001';
EXECUTE dbo.WstawPracownicy 'AMAL', 'K0002';
GO


--Wstawianie danych do tabeli "Produkty"--
EXECUTE dbo.Produkty_Wstaw 'M0001', 'NAR', 'K0002', 'Deski d³ug 3m', 10, 165, 'sztuk', 'Lok125';
EXECUTE dbo.Produkty_Wstaw 'M0002', 'DRE', 'K0002', 'Deski tarasowe', 30, 1145, 'sztuk', 'Lok125';
EXECUTE dbo.Produkty_Wstaw 'M0006', 'NAR', 'K0013', '£opata', 10, 15, 'sztuk', 'Lok245';
EXECUTE dbo.Produkty_Wstaw 'M0007', 'NAR', 'K0013', 'Szpadel', 200, 65, 'sztuk', 'Lok025';
EXECUTE dbo.Produkty_Wstaw 'M0008', 'NAR', 'K0013', 'Taczka', 30, 145, 'sztuk', 'Lok155';
EXECUTE dbo.Produkty_Wstaw 'M0009', 'NAR', 'K0013', 'Wiadro', 50, 15, 'sztuk', 'Lok245';
EXECUTE dbo.Produkty_Wstaw 'M0010', 'OGL', 'K0009', 'Pustaki', 5000, 5, 'sztuk', 'Lok170';
EXECUTE dbo.Produkty_Wstaw 'M0011', 'OGL', 'K0009', 'Ceg³y', 500, 5, 'sztuk', 'Lok156';
EXECUTE dbo.Produkty_Wstaw 'M0012', 'NAR', 'K0011', 'Wiertarka c22', 10, 12, 'sztuk', 'Lok170';
EXECUTE dbo.Produkty_Wstaw 'M0013', 'OGL', 'K0009', 'Kostka brukowa', 56, 130, 'm2', 'Lok123';
EXECUTE dbo.Produkty_Wstaw 'M0014', 'SAN', 'K0008', 'Rury miedziane 3cale ', 230, 15, 'sztuk', 'Lok123';
EXECUTE dbo.Produkty_Wstaw 'M0015', 'OGL', 'K0005', 'Pustaki', 3000, 7, 'sztuk', 'Lok170';
EXECUTE dbo.Produkty_Wstaw 'M0016', 'WYW', 'K0014', 'Kafelki bia³e 10x10', 45, 31, 'm2', 'Lok004';
EXECUTE dbo.Produkty_Wstaw 'M0017', 'WYW', 'K0014', 'Kafelki zielone 15x15', 39, 45, 'm2', 'Lok003';
GO
--Wstawianie danych do tabeli "Zamowienia--

EXECUTE dbo.Zamówienie_Wstaw 000146, 'K0006', 'M0016', '2017-05-14', '2017-05-19', 'MBOR',456, 9;
EXECUTE dbo.Zamówienie_Wstaw 000147, 'K0031', 'M0012', '2017-05-14', '2017-05-14', 'MBOR',12, 1;
EXECUTE dbo.Zamówienie_Wstaw 000148, 'K0010', 'M0013', '2017-05-17', '2017-05-17', 'AMAL',260, 2;
EXECUTE dbo.Zamówienie_Wstaw 000149, 'K0012', 'M0014', '2017-05-20', '2017-05-20', 'MBOR',45, 3;
EXECUTE dbo.Zamówienie_Wstaw 000150, 'K0007', 'M0013', '2017-05-31', '2017-05-31', 'MBOR',130, 1;
EXECUTE dbo.Zamówienie_Wstaw 000151, 'K0030', 'M0009', '2017-06-01', '2017-06-01', 'AMAL',15, 1;
EXECUTE dbo.Zamówienie_Wstaw 000152, 'K0006', 'M0010', '2017-06-01', '2017-06-12', 'MBOR',100, 20;
EXECUTE dbo.Zamówienie_Wstaw 000153, 'K0026', 'M0001', '2017-06-02', '2017-06-02', 'MBOR',100, 3;
EXECUTE dbo.Zamówienie_Wstaw 000154, 'K0030', 'M0002', '2017-06-10', '2017-06-10', 'MBOR', 90, 6;
EXECUTE dbo.Zamówienie_Wstaw 000155, 'K0007', 'M0006', '2017-06-10', '2017-06-10', 'MBOR',45, 1;
EXECUTE dbo.Zamówienie_Wstaw 000156, 'K0009', 'M0012', '2017-06-12', '2017-06-12', 'MBOR',12, 1;
GO



--Przyk³ad modyfikacjI danych za pomoc¹ funkcji UPDATE w tabeli "Kontrahenci"-- 
EXECUTE dbo.Kontrahenci_Update 'K0031', 'Rafa³', 'Kowal',null,  'Cicha', 123, 11, 003,null,252515444;
GO
--Przyk³ad usuniêcia za pomoc¹ funkcji DELETE kontrahenta z tableli "Kontrahenci"--
--EXECUTE dbo.Kontrahenci_delete 'K0004';
--GO
--Przyk³ad modyfikacjI danych za pomoc¹ funkcji UPDATE w tabeli "Produkty"--
EXECUTE dbo.Produkty_Update 'M0001', 'NAR', 'K0002', 'Deski d³ugoœæ 3m', 15, 115, 'sztuk', 'Lok125';
GO
--Przyk³ad modyfikacjI danych za pomoc¹ funkcji UPDATE w tabeli "Zamowienia"--
EXECUTE dbo.Zamówienie_Update  000146, 'K0006', 'M0016', '2017-05-15', '2017-05-20', 'AMAL',456, 9
GO

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
-- Procedury przechowywane do wyszukiwania danych------------------

--Procedura  wyszukuj¹ca produkt po nazwie

CREATE PROCEDURE dbo.ZnajdzNazweProduktu
@Par_NazwaProduktu varchar(50)
AS BEGIN
SELECT dbo.Produkty.IDProduktu, Produkty.NazwaProduktu AS [Nazwa produktu], dbo.Kontrahenci.Firma, dbo.Lokalizacja.IDMiejsceSkladowania, 
dbo.KategoriaProduktow.NazwaDzia³u AS [Nazwa dzia³u]

 FROM dbo.Produkty
 INNER JOIN dbo.Kontrahenci
 ON dbo.Produkty.IDDostawcy = dbo.Kontrahenci.IDKontrahenta
 INNER JOIN dbo.KategoriaProduktow
 ON dbo.Produkty.IDKategorii = dbo.KategoriaProduktow.IDKategorii
 INNER JOIN dbo.Lokalizacja
 ON dbo.Produkty.IDMiejsceSkladowania= dbo.Lokalizacja.IDMiejsceSkladowania
 WHERE NazwaProduktu LIKE '%'+ @Par_NazwaProduktu + '%'
  
ORDER BY IDProduktu ASC, NazwaProduktu ASC;
END;
GO
--wyszukiwanie po nazwie produktu "Taczka"
EXECUTE dbo.ZnajdzNazweProduktu 'Taczka';
GO 

-----------------------------------------------------------------------------------
--Procedura wyszukuje daty zamówienia z wybranego przedzia³u w tabeli "Zamowienia", 
--oraz wyœwietla informacje z tabel "Kontrahenci","Pracownicy"

CREATE PROCEDURE dbo.datazamówienia
@Par_Datazam_Od date = '2000-01-01',
@Par_Datazam_Do date = '2100-12-31'
AS
BEGIN
SELECT IdKlienta,dbo.Kontrahenci.Imie, dbo.Kontrahenci.Nazwisko, Datazamowienia AS [Data zamówienia], IDProduktu1,
       dbo.Produkty.NazwaProduktu AS [Nazwa Produktu], dbo.Pracownicy.IDPracownika
FROM dbo.Zamowienie
INNER JOIN dbo.Produkty
ON dbo.Zamowienie.IDProduktu1= dbo.Produkty.IDProduktu
INNER JOIN dbo.Kontrahenci
 ON dbo.Zamowienie.IDKlienta = dbo.Kontrahenci.IDKontrahenta
 INNER JOIN dbo.Pracownicy
 ON dbo.Zamowienie.IdMagazyniera= dbo.Pracownicy.IDPracownika
 
WHERE Datazamowienia BETWEEN @Par_Datazam_Od AND @Par_Datazam_Do
ORDER BY IDKlienta,Imie,Nazwisko, Datazamowienia ASC, IDProduktu1, NazwaProduktu,IDPracownika;
END;
GO
--wyszukiwanie po dacie zamówienia
EXECUTE dbo.datazamówienia'2017-05-20','2017-06-01'
GO

--Procedura wyswietlaj¹ca Kontrahentów w zaleznoœci od miasta, z którego pochodz¹, 
--oraz danez w tabeli "BazaMiast", 


CREATE PROCEDURE dbo.MiastoZnajdz
@Par_NazwaMiasta varchar(50)
AS BEGIN
SELECT dbo.Kontrahenci.IDKontrahenta, dbo.Kontrahenci.Imie, dbo.Kontrahenci.Nazwisko, dbo.Kontrahenci.Firma, 
dbo.Kontrahenci.Ulica,dbo.Kontrahenci.nr_domu AS [Nr domu], dbo.Kontrahenci.nrmieszkania AS [Nr mieszkania], Kodpocztowy AS [Kod Pocztowy], 
Miasto, Gmina, Wojewodztwo

 FROM dbo.BazaMiast
 INNER JOIN dbo.Kontrahenci
 ON  dbo.BazaMiast.IDBazaMiast=dbo.Kontrahenci.IDBazaMiast 
 
WHERE Miasto LIKE '%'+ @Par_NazwaMiasta + '%'
  
ORDER BY IDKontrahenta ASC, Miasto ASC;
END;
GO

--wyszukiwanie po kontrahentów po nazwie "Wroc³aw"
EXECUTE MiastoZnajdz 'Wroc³aw';
GO 

-----Wyœwietla iloœæ  poszczególnych produktów (w zadanym zakresie iloœci) 
----w kolejnoœci rosnacej z tabeli "Produkty,
------oraz informacje o firmie dostawcy z tabeli "Kontrahenci" 


 CREATE PROCEDURE dbo.StanyMagazynowe10
@Par_StanMagazynowyOd int = 0,
@Par_StanMagazynowyDo int = 10000
AS BEGIN
SELECT dbo.Produkty.IDProduktu, dbo.Produkty.NazwaProduktu AS [Nazwa Produktu],dbo.Produkty.Ilosc, dbo.Kontrahenci.Firma
FROM dbo.Produkty
INNER JOIN dbo.Kontrahenci
 ON dbo.Produkty.IDDostawcy = dbo.Kontrahenci.IDKontrahenta
WHERE Ilosc BETWEEN @Par_StanMagazynowyOd AND @Par_StanMagazynowyDo
ORDER BY Ilosc ASC ;
END;
GO
--wyszukiwanie produktów w iloœi od 10 do 200
EXECUTE dbo.StanyMagazynowe10 10,200;
GO





