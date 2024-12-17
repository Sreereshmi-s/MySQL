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

-- FUNCTIONS

#1. Add a new column called DOB in Persons table with data type as Date.
ALTER TABLE Persons
ADD DOB DATE;

# Insert values into DOB field in Persons Table
UPDATE Persons SET DOB = '1990-05-15' WHERE Id = 1;
UPDATE Persons SET DOB = '1985-12-20' WHERE Id = 2;
UPDATE Persons SET DOB = '2000-07-10' WHERE Id = 3;
UPDATE Persons SET DOB = '1995-03-25' WHERE Id = 4;
UPDATE Persons SET DOB = '1988-09-08' WHERE Id = 5;
UPDATE Persons SET DOB = '2000-05-15' WHERE Id = 6;
UPDATE Persons SET DOB = '1990-07-08' WHERE Id = 7;
UPDATE Persons SET DOB = '1992-03-25' WHERE Id = 8;
UPDATE Persons SET DOB = '1989-05-15' WHERE Id = 9;
UPDATE Persons SET DOB = '1994-05-25' WHERE Id = 10;

Select * from Persons;

#2. Write a user-defined function to calculate age using DOB.
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN Age;
END //

DELIMITER ;

SELECT *, CalculateAge(DOB) AS Age FROM Persons;

#3. Write a select query to fetch the Age of all persons using the function that has been created.
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

#4. Find the length of each country name in the Country table.
SELECT Id, Country_name, CHAR_LENGTH(Country_name) AS NameLength
FROM Country;

#5. Extract the first three characters of each country's name in the Country table.
SELECT Id, Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;

#6. Convert all country names to uppercase and lowercase in the Country table.
SELECT Id, Country_name, UPPER(Country_name) AS CountryName_Upper, LOWER(Country_name) AS CountryName_Lower
FROM Country;
