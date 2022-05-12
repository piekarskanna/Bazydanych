-- Database: firma

-- DROP DATABASE IF EXISTS firma;

CREATE DATABASE firma
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- 2. Dodaj schemat o nazwie ksiegowosc.
CREATE SCHEMA ksiegowosc;

-- 3. Do schematu ksiegowosc dodaj cztery tabele.
--pracownicy
CREATE TABLE ksiegowosc.Pracownicy (
	id_pracownika INT PRIMARY KEY NOT NULL, 
	imie VARCHAR(50), 
	nazwisko VARCHAR(50) NOT NULL,
	adres VARCHAR(50),
	telefon VARCHAR(9)
	);
	
SELECT *
FROM ksiegowosc.Pracownicy;
	
--godziny
CREATE TABLE ksiegowosc.Godziny (
	id_godziny INT PRIMARY KEY NOT NULL, 
	data DATE NOT NULL,
	liczba_godzin INT NOT NULL,
	id_pracownika INT NOT NULL
	);
	

SELECT *
FROM ksiegowosc.Godziny;


--pensje 
CREATE TABLE ksiegowosc.Pensje (
	id_pensji INT PRIMARY KEY NOT NULL, 
	stanowisko VARCHAR(50) NOT NULL, 
	kwota FLOAT NOT NULL 
	);

SELECT *
FROM ksiegowosc.Pensje;

--premie
CREATE TABLE ksiegowosc.Premie (
	id_premii INT PRIMARY KEY NOT NULL, 
	rodzaj VARCHAR(50) NOT NULL, 
	kwota FLOAT NOT NULL
	);

SELECT *
FROM ksiegowosc.Premie;

-- wynagrodzenie
CREATE TABLE ksiegowosc.Wynagrodzenie (
	id_wynagrodzenia INT PRIMARY KEY NOT NULL, 
	data DATE NOT NULL,
	id_pracownika INT NOT NULL,
	id_godziny INT NOT NULL,
	id_pensji INT NOT NULL,
	id_premii INT
	);

SELECT *
FROM ksiegowosc.Wynagrodzenie;


--dodanie kluczy obcych ALTER TABLE
ALTER TABLE ksiegowosc.Godziny
ADD CONSTRAINT id_pracownika FOREIGN KEY 
(id_pracownika) REFERENCES ksiegowosc.Pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.Wynagrodzenie
ADD CONSTRAINT id_pracownika FOREIGN KEY 
(id_pracownika) REFERENCES ksiegowosc.Pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.Wynagrodzenie
ADD CONSTRAINT id_godziny FOREIGN KEY 
(id_godziny) REFERENCES ksiegowosc.Godziny(id_godziny);

ALTER TABLE ksiegowosc.Wynagrodzenie
ADD CONSTRAINT id_pensji FOREIGN KEY 
(id_pensji) REFERENCES ksiegowosc.Pensje(id_pensji);

ALTER TABLE ksiegowosc.Wynagrodzenie
ADD CONSTRAINT id_premii FOREIGN KEY 
(id_premii) REFERENCES ksiegowosc.Premie(id_premii);

-- 5.wypelnianie tabel rekordami

--pracownicy
INSERT INTO ksiegowosc.Pracownicy VALUES (1, 'Anna', 'Nowak', 'Maki', '659939405');
INSERT INTO ksiegowosc.Pracownicy VALUES (2, 'Tomasz', 'Nowak', 'Maki', '503839405');
INSERT INTO ksiegowosc.Pracownicy VALUES (3, 'Ewa', 'Koc', 'Zwierzyniecka', '859090038');
INSERT INTO ksiegowosc.Pracownicy VALUES (4, 'Mateusz', 'Kowalski', 'Dobczycka', '874640943');
INSERT INTO ksiegowosc.Pracownicy VALUES (5, 'Katarzyna', 'Nowak', 'Dąbrowskiej', '659271723');
INSERT INTO ksiegowosc.Pracownicy VALUES (6, 'Jan', 'Adamczyk', 'Prosta', '724005743');
INSERT INTO ksiegowosc.Pracownicy VALUES (7, 'Weronika', 'Kula', 'Magnoliowa', '508394726');
INSERT INTO ksiegowosc.Pracownicy VALUES (8, 'Natalia', 'Drabek', 'Krótka', '749302920');
INSERT INTO ksiegowosc.Pracownicy VALUES (9, 'Wojciech', 'Maj', 'Krótka', '749309200');
INSERT INTO ksiegowosc.Pracownicy VALUES (10, 'Stefan', 'Mazur', 'Dąbrowskiej', '707689200');

--godziny
INSERT INTO ksiegowosc.Godziny VALUES (1, '2022-04-01', 80, 1);
INSERT INTO ksiegowosc.Godziny VALUES (2, '2022-04-02', 160, 5);
INSERT INTO ksiegowosc.Godziny VALUES (3, '2022-04-03', 150, 2);
INSERT INTO ksiegowosc.Godziny VALUES (4, '2022-04-04', 180, 7);
INSERT INTO ksiegowosc.Godziny VALUES (5, '2022-04-05', 100, 6);
INSERT INTO ksiegowosc.Godziny VALUES (6, '2022-04-06', 80, 3);
INSERT INTO ksiegowosc.Godziny VALUES (7, '2022-04-07', 165, 8);
INSERT INTO ksiegowosc.Godziny VALUES (8, '2022-04-08', 130, 10);
INSERT INTO ksiegowosc.Godziny VALUES (9, '2022-04-09', 170, 4);
INSERT INTO ksiegowosc.Godziny VALUES (10, '2022-04-10', 70, 9);

--pensje
INSERT INTO ksiegowosc.Pensje VALUES (1, 'Księgowy', 1800);
INSERT INTO ksiegowosc.Pensje VALUES (2, 'Stażysta', 900);
INSERT INTO ksiegowosc.Pensje VALUES (3, 'Asystent', 2900);
INSERT INTO ksiegowosc.Pensje VALUES (4, 'Logistyk', 6000);
INSERT INTO ksiegowosc.Pensje VALUES (5, 'Reklama', 5000);
INSERT INTO ksiegowosc.Pensje VALUES (6, 'Sprzedawca', 5500);
INSERT INTO ksiegowosc.Pensje VALUES (7, 'Marketing', 6500);
INSERT INTO ksiegowosc.Pensje VALUES (8, 'IT', 8000);
INSERT INTO ksiegowosc.Pensje VALUES (9, 'Administrator', 4500);
INSERT INTO ksiegowosc.Pensje VALUES (10, 'IT2', 800);

--premie
INSERT INTO ksiegowosc.Premie VALUES (1, 'Regulaminowa', 200);
INSERT INTO ksiegowosc.Premie VALUES (2, 'Uznaniowa', 300);
INSERT INTO ksiegowosc.Premie VALUES (3, 'Motywacyjna', 400);
INSERT INTO ksiegowosc.Premie VALUES (4, 'Zadaniowa', 200);
INSERT INTO ksiegowosc.Premie VALUES (5, 'Prowizyjna', 200);
INSERT INTO ksiegowosc.Premie VALUES (6, 'Indywidualna', 200);
INSERT INTO ksiegowosc.Premie VALUES (7, 'Zespołowa', 200);
INSERT INTO ksiegowosc.Premie VALUES (8, 'Wynikowa', 200);
INSERT INTO ksiegowosc.Premie VALUES (9, 'Frekwencyjna', 200);
INSERT INTO ksiegowosc.Premie VALUES (10, 'Regulaminowa', 200);

--wynagrodzenie
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (1, '2022-04-01', 2, 2, 1, 8);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (2, '2022-04-01', 1, 2, 2, 1);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (3, '2022-04-02', 4, 6, 3, 9);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (4, '2022-04-02', 3, 4, 4, 2);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (5, '2022-04-03', 6, 5, 6, 3);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (6, '2022-04-03', 5, 6, 6, 4);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (7, '2022-04-04', 10, 7, 8, 5);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (8, '2022-04-04', 7, 8 , 10, 1);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (9, '2022-04-05', 9, 9, 7, 6);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (10, '2022-04-06', 8, 10, 9, 7);


--6f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie. 
SELECT imie, nazwisko, (liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.Pracownicy 
INNER JOIN ksiegowosc.Godziny 
ON Godziny.id_pracownika = Pracownicy.id_pracownika 
WHERE liczba_godzin > 160;


 -------------------- lab7 --------------------
 -- a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski w nawiasie (+48)

 ALTER TABLE ksiegowosc.Pracownicy 
 ALTER COLUMN telefon TYPE VARCHAR(20);

 UPDATE ksiegowosc.Pracownicy 
 SET telefon = '(+48)' || telefon;

 SELECT * 
 FROM ksiegowosc.Pracownicy;


 -- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg wzoru: ‘555-222-333’ 

 UPDATE ksiegowosc.Pracownicy 
 SET telefon = SUBSTRING(telefon, 6, 3) || '-' || SUBSTRING(telefon, 9, 3) || '-' || SUBSTRING(telefon, 12, 3);

 SELECT * 
 FROM ksiegowosc.Pracownicy;

-- powrot do poczatkowgo nr
 UPDATE ksiegowosc.Pracownicy 
 SET telefon = SUBSTRING(telefon, 1, 3) || SUBSTRING(telefon, 5, 3) || SUBSTRING(telefon, 9, 3);

-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter

SELECT id_pracownika, 
	   UPPER(imie) AS imie, 
	   UPPER(nazwisko) AS nazwisko, adres, telefon
FROM ksiegowosc.Pracownicy
ORDER BY LENGTH(nazwisko) DESC
LIMIT 1;

-- d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5

SELECT MD5(imie) AS imie, 
	   MD5(nazwisko) AS nazwisko,
	   MD5(adres) AS adres,
	   MD5(telefon) AS telefon,
	   md5(CAST(kwota AS TEXT))	AS pensja
	   FROM ksiegowosc.Wynagrodzenie

INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika 
INNER JOIN ksiegowosc.Pensje 
ON Wynagrodzenie.id_pensji = Pensje.id_pensji;


-- f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.

SELECT imie, nazwisko, adres, telefon, Pensje.kwota AS pensja, Premie.kwota AS premia 
FROM ksiegowosc.Wynagrodzenie

LEFT JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika
LEFT JOIN ksiegowosc.Pensje 
ON Wynagrodzenie.id_pensji = Pensje.id_pensji
LEFT JOIN ksiegowosc.Premie 
ON Wynagrodzenie.id_premii = Premie.id_premii;

-- g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
-- Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie 
-- wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł

-- modyfikacja daty tak, aby odzielona była kropkami wg wzoru: '7.08.2017'
 ALTER TABLE ksiegowosc.Godziny
 ALTER COLUMN data TYPE VARCHAR(20);

 UPDATE ksiegowosc.Godziny 
 SET data = SUBSTRING(data, 1, 4) || '.' || SUBSTRING(data, 6, 2) || '.' || SUBSTRING(data, 9, 2);

--  modyfikacja daty tak, aby odzielona była myślnikami wg wzoru: '7-08-2017'
UPDATE ksiegowosc.Godziny 
 SET data = SUBSTRING(data, 1, 4) || '-' || SUBSTRING(data, 6, 2) || '-' || SUBSTRING(data, 9, 2);

 SELECT *
 FROM ksiegowosc.Godziny;

SELECT CONCAT( 'Pracownik ', imie, ' ', nazwisko, 
			  ', w dniu ', CAST(Wynagrodzenie.data AS date),
			  ' otrzymał pensję całkowitą na kwotę ', CAST((premie.kwota  + pensje.kwota + ((godziny.liczba_godzin - 160) * 20)) AS VARCHAR(15)), 
			  ' zł, gdzie wynagrodzenie zasadnicze wynosiło: ', CAST(pensje.kwota AS VARCHAR(15)),
			  ' zł, premia: ', CAST(Premie.kwota AS VARCHAR(15)),
			  'zł, nadgodziny: ', CAST(((godziny.liczba_godzin - 160) * 20) AS VARCHAR(15)), ' zł') AS Raport
FROM ksiegowosc.wynagrodzenie
INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika
INNER JOIN ksiegowosc.Premie 
ON Wynagrodzenie.id_premii = Premie.id_premii
INNER JOIN ksiegowosc.Pensje 
ON Wynagrodzenie.id_pensji = Pensje.id_pensji
INNER JOIN ksiegowosc.Godziny 
ON Wynagrodzenie.id_godziny = Godziny.id_godziny
ORDER BY Premie.kwota, Pensje.kwota;


	
