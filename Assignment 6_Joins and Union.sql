# Create the Database
CREATE DATABASE CountryDB;

# Use the Database
USE CountryDB;

# Create the Country table and Persons table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

# Insert data into the Country table and Persons table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331002651, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'India', 1380004385, 3287263),
(4, 'Australia', 25499884, 7692024),
(5, 'Brazil', 212559417, 8515767),
(6, 'Russia', 145934462, 17098242),
(7, 'China', 1439323776, 9596961),
(8, 'France', 65273511, 551695),
(9, 'Germany', 83783942, 357022),
(10, 'Italy', 60461826, 301340);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 20000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 30000, 4.7, 1, 'USA'),
(3, 'Alice', 'Brown', 10000, 3.8, 1, 'USA'),
(4, 'Bob', 'Taylor', 15000, 4.2, 2, 'Canada'),
(5, 'Chris', 'White', 40000, 5.0, 3, 'India'),
(6, 'Ella', 'Green', 25000, 4.1, 3, 'India'),
(7, 'Daniel', 'Black', 18000, 3.9, 4, 'Australia'),
(8, 'Sophia', 'Gray', 32000, 4.6, 5, 'Brazil'),
(9, 'James', 'Adams', 22000, 4.3, 5, 'Brazil'),
(10, 'Olivia', 'Clark', 28000, 4.8, 6, 'Russia');

#1 INNER JOIN, LEFT JOIN and RIGHT JOIN

-- 1. INNER JOIN
SELECT c.Id, c.Country_name, c.Population AS Country_Population, 
       p.Fname, p.Lname, p.Population AS Person_Population, p.Rating
FROM Country c
INNER JOIN Persons p ON c.Id = p.Country_Id;

-- 2. LEFT JOIN
SELECT c.Id, c.Country_name, c.Population AS Country_Population, 
       p.Fname, p.Lname, p.Population AS Person_Population, p.Rating
FROM Country c
LEFT JOIN Persons p ON c.Id = p.Country_Id;

-- 3. RIGHT JOIN
SELECT c.Id, c.Country_name, c.Population AS Country_Population, 
       p.Fname, p.Lname, p.Population AS Person_Population, p.Rating
FROM Country c
RIGHT JOIN Persons p ON c.Id = p.Country_Id;

#2 List all distinct country names from both the Country and Persons tables.
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

#3 List all country names from both the Country and Persons tables, including duplicates.
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

#4 Round the ratings of all persons to the nearest integer in the Persons table.
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;





