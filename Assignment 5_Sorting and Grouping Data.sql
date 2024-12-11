# Create the Database
CREATE DATABASE Country1DB;

# Use the Database
USE Country1DB;

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

-- SQL Queries
#1 Print the first three characters of Country_name from the Country table.
SELECT LEFT(Country_name, 3) AS First_Three_Chars FROM Country;

#2 Concatenate first name and last name from Persons table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

#3 Count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries FROM Persons;

#4 Print the maximum population from the Country table.
SELECT MAX(Population) AS Max_Population FROM Country;

#5 Print the minimum population from Persons table.
SELECT MIN(Population) AS Min_Population FROM Persons;

#6 Insert 2 new rows to the Persons table making the Lname NULL.
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) 
VALUES (11, 'Mark', NULL, 5000, 3.5, 7, 'China'),
       (12, 'Emma', NULL, 7000, 4.0, 7, 'China');
       
-- Count Lname from Persons table.
SELECT COUNT(Lname) AS Count_Non_Null_Lname FROM Persons;

#7 Find the number of rows in the Persons table.
SELECT COUNT(*) AS Total_Rows FROM Persons;

#8 Show the population of the Country table for the first 3 rows. (Use LIMIT)
SELECT Population FROM Country LIMIT 3;

#9 Print 3 random rows of countries. (Use rand() function and LIMIT)
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

#10 List all persons ordered by their rating in descending order.
SELECT * FROM Persons ORDER BY Rating DESC;

#11 Find the total population for each country in the Persons table.
SELECT Country_name, SUM(Population) AS Total_Population 
FROM Persons 
GROUP BY Country_name;

#12 Find countries in the Persons table with a total population greater than 50,000.
SELECT Country_name 
FROM Persons 
GROUP BY Country_name 
HAVING SUM(Population) > 50000;

#13 List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating 
FROM Persons 
GROUP BY Country_name 
HAVING COUNT(*) > 2 
ORDER BY Avg_Rating ASC;

