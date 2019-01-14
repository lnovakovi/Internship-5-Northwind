CREATE TABLE Titles
(ID INT IDENTITY(1,1) PRIMARY KEY,
Title NVARCHAR(30))

INSERT INTO Titles
(Title)
VALUES('Direktor'),('Potpredsjednik'),('Investicijski suradnik'),(N'Investicijski analitičar')

SELECT * FROM Titles

CREATE TABLE Users
(ID INT IDENTITY(1,1) PRIMARY KEY,
FirstName NVARCHAR(20),
LastName NVARCHAR(20),
OIB NVARCHAR(20), 
PhoneNumber NVARCHAR(20),
Address NVARCHAR(40),
City NVARCHAR (20),
Country NVARCHAR(25),
PostalCode NVARCHAR(10))

INSERT INTO Users (FirstName,LastName,OIB,PhoneNumber,Address,City,Country,PostalCode) VALUES
('Lora',N'Novaković','36798002514','0915347890','Put Grande','Biograd na Moru','Hrvatska','23210'),
('Dino',N'Gašparović','33478409158','0956897341',N'ul. Ivana Devića',N'Sukošan','Hrvatska','23206'),
('Patricia',N'Zalović','55090123459','0917604451',N'ul. Ive Tijardovića','Split','Hrvatska','21000'),
('Martin',N'Bulić','98710234500','0995432178','Put Kotlara','Zadar','Hrvatska','23000')

SELECT * FROM Users

CREATE TABLE Transactions
(ID INT IDENTITY(1,1) PRIMARY KEY,
DateOfTransactions date,
Status bit)

SELECT * FROM Transactions

ALTER TABLE Transactions ADD Description nvarchar(20)

CREATE TABLE Employee
(ID INT IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(15),
LastName nvarchar(20),
Title INT FOREIGN KEY REFERENCES Titles(ID),
Email nvarchar(20)
)

SELECT * FROM Employee
ALTER TABLE Employee ADD NoteForEmployees nvarchar(40)
ALTER TABLE Users ADD UNIQUE(OIB)

INSERT INTO Employee VALUES
('Jure',N'Jurić',(select id from Titles where Title ='Direktor'),'jure.juric@gmail.com','New one'),
('Luka', N'Lukić',(select id from Titles where Title = 'Potpredsjednik'),'Llukic@hotmail.com','Check overtime work'),
('Ana',N'Anić',(select id from Titles where Title = 'Investicijski suradnik'),'aAnic7@gmail.com','Often late for work')

SELECT * FROM Employee

INSERT INTO Transactions VALUES
('20190110',0,'Play station 4'),
('20181215',1,'Christmas gift'),
('20180715',1,'Train ticket')

SELECT * FROM Transactions

UPDATE Transactions 
SET Status = 1 where ID = 1

UPDATE Employee
SET FirstName = 'Lora', LastName = N'Novaković' where ID=1

DELETE from Employee where FirstName = 'Lora' 

SELECT * from Employee where FirstName like N'[a-g]%'