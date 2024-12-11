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
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67800000, 243610),
(4, 'India', 1380000000, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83100000, 357022),
(7, 'France', 67000000, 551695),
(8, 'China', 1440000000, 9596961),
(9, 'Japan', 126000000, 377975),
(10, 'Brazil', 213000000, 8515767);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 500000, 4.2, 1, 'USA'),
(2, 'Jane', 'Smith', 300000, 3.8, 2, 'Canada'),
(3, 'Emily', 'Johnson', 200000, 4.6, 3, 'UK'),
(4, 'Rahul', 'Sharma', 1500000, 4.1, 4, 'India'),
(5, 'Liam', 'Brown', 450000, 3.9, 5, 'Australia'),
(6, 'Sophia', 'Wilson', 700000, 5.0, 6, 'Germany'),
(7, 'Oliver', 'Martinez', 900000, 4.4, 7, 'France'),
(8, 'Ava', 'Davis', 350000, 4.0, 8, 'China'),
(9, 'William', 'Garcia', 1200000, 3.7, 9, 'Japan'),
(10, 'Isabella', 'Miller', 800000, 4.8, 10, 'Brazil');

-- Queries
#1 List the distinct country names from the Persons table.
SELECT DISTINCT Country_name FROM Persons;

#2 Select first names and last names from the Persons table with aliases.
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

#3 Find all persons with a rating greater than 4.0.
SELECT * FROM Persons WHERE Rating > 4.0;

#4 Find countries with a population greater than 10 lakhs. 
SELECT * FROM Country WHERE Population > 1000000;

#5 Find persons who are from 'USA' or have a rating greater than 4.5.
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

#6 Find all persons where the country name is NULL.
SELECT * FROM Persons WHERE Country_name IS NULL;

#7 Find all persons from the countries 'USA', 'Canada', and 'UK'.
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

#8 Find all persons not from the countries 'India' and 'Australia'.
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

#9 Find all countries with a population between 5 lakhs and 20 lakhs.
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

#10 Find all countries whose names do not start with 'C'.
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';

