-->1.
SELECT CompanyName,ContactName,ContactTitle,Address,City,Country,Phone from Suppliers

SELECT TOP 50 * FROM Customers
--2.
SELECT COUNT(CustomerID) NumCustomers FROM Customers WHERE Fax IS NOT NULL AND Region IS NOT NULL
--3.
SELECT TOP(2) LastName,FirstName,Title,BirthDate FROM Employees ORDER BY BirthDate
--4.
SELECT * FROM Customers WHERE Address like '[0-9]%' and CompanyName like  '__a%'
ORDER BY Country
--5.
SELECT TOP(1) OrderId,Quantity FROM [Order Details] ORDER BY Quantity desc
--6.
SELECT * FROM Customers where NOT EXISTS (SELECT OrderID from Orders where Customers.CustomerID=Orders.CustomerID)