# Create the Database
CREATE DATABASE CompanyDB;

# Use the Database
USE CompanyDB;

# Create the Managers Table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Last_Update DATETIME DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);

# Insert 10 Rows
INSERT INTO Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES 
(1, 'Benjamin', 'Adams', '1991-03-11', 33, 'M', 'IT', 26000.00),
(2, 'Ethan', 'Clark', '1982-04-15', 42, 'M', 'Finance', 31000.00),
(3, 'Noah', 'Green', '1986-01-29', 38, 'M', 'IT', 37000.00),
(4, 'Amelia', 'Carter', '1984-07-02', 40, 'F', 'Sales', 24000.00),
(5, 'Michael', 'Johnson', '1988-03-03', 35, 'M', 'Operations', 29000.00),
(6, 'Aaliya', 'Khan', '1995-12-12', 28, 'F', 'IT', 27000.00),
(7, 'Mia', 'Baker', '1989-09-09', 35, 'F', 'Marketing', 28000.00),
(8, 'Sophia', 'Martinez', '1996-06-30', 27, 'F', 'Marketing', 20000.00),
(9, 'Lucas', 'Phillips', '1995-11-23', 29, 'M', 'IT', 32000.00),
(10, 'Maria', 'Garcia', '1993-01-01', 31, 'F', 'HR', 22000.00);

SELECT * 
FROM Managers;

# Retrieve the Name and Date of Birth of the Manager with Manager_Id = 1
SELECT First_Name, Last_Name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

# Display the Annual Income of All Managers
SELECT First_Name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;

# Display Records of All Managers Except 'Aaliya'
SELECT * 
FROM Managers 
WHERE First_Name != 'Aaliya';

# Display Details of Managers Whose Department is IT and Earns More Than 25000 Per Month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

# Display Details of Managers Whose Salary is Between 10000 and 35000
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;

