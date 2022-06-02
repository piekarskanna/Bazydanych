
-- 1. Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki 
--    pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej 
--    TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.

USE AdventureWorks2017;
GO

-- definicja wyra¿enia tablicowego o nazwie Dane_CTE
WITH Dane_CTE (BusinessEntityID, Title, FirstName, MiddleName, LastName, Rate)
AS
(
SELECT person.BusinessEntityID, person.Title, person.FirstName, person.MiddleName, person.LastName, rate.Rate
FROM Person.Person person
INNER JOIN HumanResources.EmployeePayHistory rate
ON rate.BusinessEntityID=person.BusinessEntityID
)

-- kwerenda odwo³uj¹ca siê do Dane_CTE
SELECT * 
INTO #TempEmployeeInfo 
FROM Dane_CTE;				

SELECT * 
FROM #TempEmployeeInfo
ORDER BY BusinessEntityID;

DROP TABLE #TempEmployeeInfo;


-- 2. Uzyskaj informacje na temat przychodów ze sprzeda¿y wed³ug firmy i kontaktu (za pomoc¹ 
--    CTE i bazy AdventureWorksLT).


USE AdventureWorksLT2019;
GO

-- definicja wyra¿enia tablicowego o nazwie Przychody_CTE
WITH Przychody_CTE (CompanyContact, Revenue)
AS 
(
SELECT Customer.CompanyName + ' (' + Customer .FirstName + ' ' + Customer .LastName + ') ' AS CompanyContact,
	   SOH.TotalDue AS Revenue 
FROM SalesLT.Customer Customer 
INNER JOIN SalesLT.SalesOrderHeader SOH
ON Customer.CustomerID = SOH.CustomerID )

-- kwerenda odwo³uj¹ca siê do Przychody_CTE
SELECT * 
FROM Przychody_CTE 
ORDER BY CompanyContact;


-- 3. Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów.
-- Wykorzystaj CTE i bazê AdventureWorksLT.

-- definicja wyra¿enia tablicowego o nazwie Sprzedaz_CTE
WITH Sprzedaz_CTE (Category, SalesValue)
AS
(
SELECT Category.Name AS Category, 
       ROUND(SUM (UnitPrice * OrderQty), 2) AS SalesValue 
FROM SalesLT.ProductCategory Category
INNER JOIN SalesLT.Product Product
ON  Category.ProductCategoryID = Product.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail SOD
ON  SOD.ProductID = Product.ProductID 
GROUP BY Category.Name
)

-- kwerenda odwo³uj¹ca siê do Sprzedaz_CTE
SELECT Category, SalesValue 
FROM Sprzedaz_CTE;
