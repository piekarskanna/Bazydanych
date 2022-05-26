
USE AdventureWorks2017;
GO

-- 1. Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako 
--	  argument wejœciowy liczbê n. Generowanie ci¹gu Fibonacciego musi zostaæ 
--	  zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.

CREATE FUNCTION Fib(
	@n INT
	)
RETURNS @Fibo 
TABLE(Fibo INT)
AS
BEGIN
	DECLARE @FibX INT = 0;
	DECLARE @FibY INT = 1;
	DECLARE @i INT = 0;
	DECLARE @a INT;
	INSERT INTO @Fibo VALUES (@FibX), (@FibY)
	WHILE (@i <= @n - 3)
	BEGIN
		INSERT INTO @Fibo VALUES (@FibX + @FibY)
		SET @a = @FibY
		SET @FibY = @FibX + @FibY
		SET @FibX = @a
		SET @i += 1
	END

	RETURN
END;

DROP FUNCTION Fib;

 CREATE OR ALTER PROCEDURE Fibonacci(
 @n INT
 )
 AS
 BEGIN
	SELECT * FROM AdventureWorks2017.dbo.Fib(@n)
 END;

EXEC AdventureWorks2017.dbo.Fibonacci 40;

DROP PROCEDURE Fibonacci;


-- 2. Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko 
--    tak, aby by³o napisane du¿ymi literami. 
	
SELECT BusinessEntityID, LastName 
FROM Person.Person
ORDER BY BusinessEntityID DESC;

SELECT * FROM Person.BusinessEntity;

CREATE TRIGGER LastNameUpper
ON Person.Person
AFTER INSERT
AS
BEGIN
	UPDATE Person.Person
	SET LastName=UPPER(LastName) 
	WHERE Person.BusinessEntityID=(SELECT TOP 1 BusinessEntityID 
									FROM Person.Person 
									ORDER BY BusinessEntityID DESC)
END;

INSERT INTO Person.Person(BusinessEntityID,PersonType,FirstName,LastName)
VALUES (20778,'IN','Jan','Kowalski');

INSERT INTO Person.BusinessEntity (rowguid)
VALUES ('0C7D8F81-D7B1-4CF0-9C0A-4CD8B6B50789');

DELETE FROM Person.Person WHERE BusinessEntityID=20778;

-- 3. Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi 
--    zmiana wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%



SELECT * 
FROM Sales.SalesTaxRate;

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
FOR INSERT, UPDATE
AS
BEGIN
	IF (SELECT TOP 1 TaxRate FROM inserted ORDER BY TaxRate)>30
	RAISERROR ('Warning: taxrate is over 30',11,1);
			--END IF;
END;

UPDATE Sales.SalesTaxRate SET TaxRate=30.75 WHERE SalesTaxRateID=19;


