-- 1. Utwórz nową bazę danych nazywając ją firma.
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
INSERT INTO ksiegowosc.Wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji) VALUES (1, '2022-04-01', 2, 2, 1);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (2, '2022-04-01', 1, 2, 2, 1);
INSERT INTO ksiegowosc.Wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji) VALUES (3, '2022-04-02', 4, 6, 3);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (4, '2022-04-02', 3, 4, 4, 2);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (5, '2022-04-03', 6, 5, 6, 3);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (6, '2022-04-03', 5, 6, 6, 4);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (7, '2022-04-04', 10, 7, 8, 5);
INSERT INTO ksiegowosc.Wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji) VALUES (8, '2022-04-04', 7, 8 , 10);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (9, '2022-04-05', 9, 9, 7, 6);
INSERT INTO ksiegowosc.Wynagrodzenie VALUES (10, '2022-04-06', 8, 10, 9, 7);

-- 6. Wykonaj następujące zapytania: 

-- a) Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko
FROM ksiegowosc.Pracownicy;

-- 6b) Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT id_pracownika 
FROM ksiegowosc.Wynagrodzenie 
WHERE id_pensji IN (SELECT id_pensji 
					FROM ksiegowosc.Pensje 
					WHERE kwota > 1000);

-- 6c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.
SELECT id_pracownika
FROM ksiegowosc.Wynagrodzenie
WHERE id_premii IS NULL AND id_pensji IN (SELECT id_pensji 
										 FROM ksiegowosc.Pensje
										 WHERE kwota > 2000);

-- 6d)Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
SELECT *
FROM ksiegowosc.Pracownicy
WHERE imie LIKE 'J%';

-- 6e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT *
FROM ksiegowosc.Pracownicy
WHERE (nazwisko LIKE '%N%' OR nazwisko LIKE '%n%') AND imie LIKE '%a';

--6f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie. 
SELECT imie, nazwisko, (liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.Pracownicy 
INNER JOIN ksiegowosc.Godziny 
ON Godziny.id_pracownika = Pracownicy.id_pracownika 
WHERE liczba_godzin > 160;

--6g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN
SELECT imie, nazwisko, kwota 
FROM ksiegowosc.Wynagrodzenie
INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika 
INNER JOIN ksiegowosc.Pensje 
ON Wynagrodzenie.id_pensji = Pensje.id_pensji 
WHERE kwota > 1500 AND kwota < 3000;

--6h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT imie, nazwisko, liczba_godzin, id_premii 
FROM ksiegowosc.Wynagrodzenie 
INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika 
INNER JOIN ksiegowosc.Godziny 
ON Wynagrodzenie.id_godziny = Godziny.id_godziny  
WHERE liczba_godzin > 160 AND id_premii IS NULL;

--6i--Uszereguj pracowników według pensji.
SELECT Pracownicy.id_pracownika, Pracownicy.imie, Pracownicy.nazwisko, Pensje.kwota
FROM ksiegowosc.Wynagrodzenie
INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika
INNER JOIN ksiegowosc.Pensje
ON Wynagrodzenie.id_pensji = Pensje.id_pensji
ORDER BY kwota;

--6j) Uszereguj pracowników według pensji i premii malejąco.
SELECT Pracownicy.id_pracownika, Pracownicy.imie, Pracownicy.nazwisko, Pensje.kwota AS pensje, Premie.kwota AS premie
FROM ksiegowosc.Wynagrodzenie
INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika
INNER JOIN ksiegowosc.Pensje
ON Wynagrodzenie.id_pensji = Pensje.id_pensji
INNER JOIN ksiegowosc.Premie
ON Wynagrodzenie.id_premii = Premie.id_premii
ORDER BY Pensje.kwota DESC,
		 Premie.kwota DESC;
		 
--6k--Zlicz i pogrupuj pracowników według pola ‘stanowisko’
SELECT stanowisko, COUNT(Pensje.stanowisko) AS zliczone_stanowiska 
FROM ksiegowosc.Wynagrodzenie 
INNER JOIN ksiegowosc.Pracownicy 
ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika
INNER JOIN ksiegowosc.Pensje 
ON Wynagrodzenie.id_pensji = Pensje.id_pensji
GROUP BY pensje.stanowisko;

-- 6l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT AVG(kwota) AS średnia, MIN(kwota) AS min, MAX(kwota) AS max
FROM ksiegowosc.Pensje
WHERE pensje.Stanowisko = 'Sprzedawca';

--6m) Policz sumę wszystkich wynagrodzeń.
SELECT SUM(kwota) AS suma
FROM ksiegowosc.Pensje;

--6f) Policz sumę wynagrodzeń w ramach danego stanowiska.
 SELECT stanowisko, SUM(kwota) AS suma, COUNT(stanowisko) AS stanowiska 
 FROM ksiegowosc.Pensje 
 GROUP BY stanowisko;

--6g) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
 SELECT stanowisko, COUNT(Premie.id_premii) AS premie 
 FROM ksiegowosc.Wynagrodzenie
 INNER JOIN ksiegowosc.Premie 
 ON Wynagrodzenie.id_premii = Premie.id_premii
 INNER JOIN ksiegowosc.Pensje ON Wynagrodzenie.id_pensji = Pensje.id_pensji 
 GROUP BY stanowisko;

--6h) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.
 DELETE pracownicy 
 FROM ksiegowosc.Wynagrodzenie
 INNER JOIN ksiegowosc.Pracownicy 
 ON Wynagrodzenie.id_pracownika = Pracownicy.id_pracownika
 INNER JOIN ksiegowosc.Pensje 
 ON Wynagrodzenie.id_pensji = Pensje.id_pensji  
 WHERE kwota < 1200;









	
