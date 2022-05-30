CREATE DATABASE [Procedure]
USE [Procedure]

CREATE TABLE Books(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) CHECK (LE([Name])>=2) NOT NULL,
    AuthorId int FOREIGN KEY REFERENCES Authors(Id),
	[PageCount] smallint CHECK([PageCount]>=10) NOT NULL,

)

CREATE TABLE Authors(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR (30) NOT NULL,
    Surname NVARCHAR (30),
)

CREATE VIEW vw_View AS
SELECT * FROM(
	SELECT b.Id , b.Name, b.PageCount, a.Name+' '+a.Surname AS AuthorFullName FROM Books AS b
	JOIN Authors AS a
	ON b.AuthorId=a.Id
) AS [First]

