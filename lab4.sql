USE firma;
GO

-- 1. Utwórz now¹ bazê danych nazywaj¹c j¹ firma.
CREATE DATABASE firma;

-- 2. Dodaj nowy schemat o nazwie rozliczenia.
CREATE SCHEMA rozliczenia;

-- 3. Do schematu rozliczenia dodaj cztery tabele.
--pracownicy
CREATE TABLE rozliczenia.Pracownicy (
	id_pracownika INT PRIMARY KEY NOT NULL, 
	imie NVARCHAR(50), 
	nazwisko NVARCHAR(50) NOT NULL,
	adres NVARCHAR(50),
	telefon VARCHAR(9)
	);

SELECT *
FROM rozliczenia.Pracownicy;

--godziny
CREATE TABLE rozliczenia.Godziny (
	id_godziny INT PRIMARY KEY NOT NULL, 
	data DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL,
	);

SELECT *
FROM rozliczenia.Godziny;

--pensje 
CREATE TABLE rozliczenia.Pensje (
	id_pensji INT PRIMARY KEY NOT NULL, 
	stanowisko NVARCHAR(50) NOT NULL, 
	kwota FLOAT NOT NULL,
	id_premii INT NOT NULL 
	);

SELECT *
FROM rozliczenia.Pensje;

--premie
CREATE TABLE rozliczenia.Premie (
	id_premii INT PRIMARY KEY NOT NULL, 
	rodzaj NVARCHAR(50) NOT NULL, 
	kwota FLOAT NOT NULL,
	);

SELECT *
FROM rozliczenia.Premie;


--dodanie kluczy obcych ALTER TABLE
ALTER TABLE rozliczenia.Godziny
ADD CONSTRAINT id_pracownika FOREIGN KEY 
(id_pracownika) REFERENCES rozliczenia.Pracownicy(id_pracownika);

ALTER TABLE rozliczenia.Pensje
ADD CONSTRAINT id_premii FOREIGN KEY 
(id_premii) REFERENCES rozliczenia.Premie(id_premii);


--wypelnianie tabel rekordami

--pracownicy
INSERT INTO rozliczenia.Pracownicy VALUES (1, 'Anna', 'Nowak', 'Maki', '659939405');
INSERT INTO rozliczenia.Pracownicy VALUES (2, 'Adam', 'Koj', 'al. Mickiewicza', '867085746');
INSERT INTO rozliczenia.Pracownicy VALUES (3, 'Ewa', 'Koc', 'Zwierzyniecka', '859090038');
INSERT INTO rozliczenia.Pracownicy VALUES (4, 'Mateusz', 'Kowalski', 'Dobczycka', '874640943');
INSERT INTO rozliczenia.Pracownicy VALUES (5, 'Katarzyna', 'Nowak', 'D¹browskiej', '659271723');
INSERT INTO rozliczenia.Pracownicy VALUES (6, 'Jan', 'Adamczyk', 'Prosta', '724005743');
INSERT INTO rozliczenia.Pracownicy VALUES (7, 'Weronika', 'Kula', 'Magnoliowa', '508394726');
INSERT INTO rozliczenia.Pracownicy VALUES (8, 'Natalia', 'Drabek', 'Krótka', '749302920');
INSERT INTO rozliczenia.Pracownicy VALUES (9, 'Wojciech', 'Maj', 'Krótka', '749309200');
INSERT INTO rozliczenia.Pracownicy VALUES (10, 'Stefan', 'Stefan', 'D¹browskiej', '707689200');

--godziny
INSERT INTO rozliczenia.Godziny VALUES (1, '2022-04-01', 8, 1);
INSERT INTO rozliczenia.Godziny VALUES (2, '2022-04-02', 6, 5);
INSERT INTO rozliczenia.Godziny VALUES (3, '2022-04-03', 5, 2);
INSERT INTO rozliczenia.Godziny VALUES (4, '2022-04-04', 8, 7);
INSERT INTO rozliczenia.Godziny VALUES (5, '2022-04-05', 10, 6);
INSERT INTO rozliczenia.Godziny VALUES (6, '2022-04-06', 8, 3);
INSERT INTO rozliczenia.Godziny VALUES (7, '2022-04-07', 6, 8);
INSERT INTO rozliczenia.Godziny VALUES (8, '2022-04-08', 10, 10);
INSERT INTO rozliczenia.Godziny VALUES (9, '2022-04-09', 8, 4);
INSERT INTO rozliczenia.Godziny VALUES (10, '2022-04-10', 7, 9);

--pensje
INSERT INTO rozliczenia.Pensje VALUES (1, 'Ksiêgowy', 7000, 6);
INSERT INTO rozliczenia.Pensje VALUES (2, 'Sta¿ysta', 3000, 2);
INSERT INTO rozliczenia.Pensje VALUES (3, 'Analityk', 8000, 1);
INSERT INTO rozliczenia.Pensje VALUES (4, 'Logistyk', 6000, 3);
INSERT INTO rozliczenia.Pensje VALUES (5, 'Reklama', 5000, 8);
INSERT INTO rozliczenia.Pensje VALUES (6, 'Sprzedawca', 5500, 10);
INSERT INTO rozliczenia.Pensje VALUES (7, 'Marketing', 6500, 7);
INSERT INTO rozliczenia.Pensje VALUES (8, 'IT', 8000, 9);
INSERT INTO rozliczenia.Pensje VALUES (9, 'Administrator', 4500, 4);
INSERT INTO rozliczenia.Pensje VALUES (10, 'IT2', 5000, 5);

--premie
INSERT INTO rozliczenia.Premie VALUES (1, 'Regulaminowa', 200);
INSERT INTO rozliczenia.Premie VALUES (2, 'Uznaniowa', 300);
INSERT INTO rozliczenia.Premie VALUES (3, 'Motywacyjna', 400);
INSERT INTO rozliczenia.Premie VALUES (4, 'Zadaniowa', 200);
INSERT INTO rozliczenia.Premie VALUES (5, 'Prowizyjna', 200);
INSERT INTO rozliczenia.Premie VALUES (6, 'Indywidualna', 200);
INSERT INTO rozliczenia.Premie VALUES (7, 'Zespo³owa', 200);
INSERT INTO rozliczenia.Premie VALUES (8, 'Wynikowa', 200);
INSERT INTO rozliczenia.Premie VALUES (9, 'Frekwencyjna', 200);
INSERT INTO rozliczenia.Premie VALUES (10, 'Regulaminowa', 200);


-- Za pomoc¹ zapytania SQL wyœwietl nazwiska pracowników i ich adresy
SELECT nazwisko, adres
FROM rozliczenia.Pracownicy;

-- Napisz zapytanie, które przekonwertuje datê w tabeli godziny tak, aby wyœwietlana by³a 
-- informacja jaki to dzieñ tygodnia i jaki miesi¹c (funkcja DATEPART x2)
SELECT DATEPART("w", [data]) AS dzien_tygodnia, DATEPART("m", [data]) AS miesiac, data
FROM rozliczenia.Godziny;

-- W tabeli pensje zmieñ nazwê atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie 
-- kwota_netto. Oblicz kwotê netto i zaktualizuj wartoœci w tabeli.
EXEC SP_RENAME 'rozliczenia.pensje.kwota' , 'kwota_brutto', 'COLUMN';

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (kwota_brutto - (kwota_brutto*0.23));

SELECT (kwota_brutto - (kwota_brutto*0.19)) AS kwota_netto, kwota_brutto 
FROM rozliczenia.Pensje;




