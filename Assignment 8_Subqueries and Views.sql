-- Subqueries and Views
# Create the Database
CREATE DATABASE PersonsDB;

# Use the Database
USE PersonsDB;

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

#1. Find the number of persons in each country. 
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

#2. Find the number of persons in each country sorted from high to low.
SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0.
SELECT Country_name, ROUND(AVG(Rating), 2) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING ROUND(AVG(Rating), 2) > 3.0;

#4. Find the countries with the same rating as the USA.
SELECT Country_name
FROM Persons
WHERE Country_name != 'USA'
AND Rating = (SELECT AVG(Rating) 
			 FROM Persons 
			 WHERE Country_name = 'USA');

#5. Select all countries whose population is greater than the average population of all nations.
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

-- Create the 'Product' database and table 'Customer'
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

-- Insert Data into Customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue', 'San Francisco', 'California', '94102', 'USA'),
(3, 'Emily', 'Davis', 'emily.davis@example.com', '1122334455', '789 Pine Road', 'New York City', 'New York', '10001', 'USA'),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '2233445566', '321 Maple Street', 'Seattle', 'Washington', '98101', 'USA'),
(5, 'Sarah', 'Wilson', 'sarah.wilson@example.com', '3344556677', '654 Cedar Lane', 'Austin', 'Texas', '73301', 'USA'),
(6, 'David', 'Taylor', 'david.taylor@example.com', '4455667788', '987 Birch Blvd', 'Chicago', 'Illinois', '60601', 'USA'),
(7, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '5566778899', '246 Aspen Drive', 'Miami', 'Florida', '33101', 'USA'),
(8, 'James', 'Anderson', 'james.anderson@example.com', '6677889900', '135 Willow Way', 'Dallas', 'Texas', '75201', 'USA'),
(9, 'Olivia', 'Hernandez', 'olivia.hernandez@example.com', '7788990011', '369 Spruce Place', 'Orlando', 'Florida', '32801', 'USA'),
(10, 'William', 'Clark', 'william.clark@example.com', '8899001122', '987 Palm Court', 'Boston', 'Massachusetts', '02108', 'USA');

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

-- SELECT Operation for the customer_info view
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, 
       Email, 
       Phone_no, 
       State
FROM Customer;

SELECT * FROM Customer_details;

SET SQL_SAFE_UPDATES = 0;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer
SET Phone_no = '1234567890'
WHERE State = 'California';

SELECT * FROM Customer_details WHERE State = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *
FROM Customer_details
ORDER BY State ASC;
