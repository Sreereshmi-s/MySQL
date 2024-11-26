# Create the Database
CREATE DATABASE School;

# Use the Database
USE School;

# Create the STUDENT Table
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(2)
);

# Insert Values into the STUDENT Table
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES
(1, 'John Doe', 89, 'A'),
(2, 'Jane Smith', 77, 'B'),
(3, 'Alice Simon', 95, 'A'),
(4, 'Jose John', 69, 'C');

# Select all records from the STUDENT Table
SELECT * FROM STUDENT;

# Add a column named Contact to the STUDENT table
ALTER TABLE STUDENT
ADD COLUMN Contact VARCHAR(50);

# Remove the Grade column from the STUDENT table
ALTER TABLE STUDENT
DROP COLUMN Grade;

# Rename the table to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

# Select all records from the CLASSTEN table
SELECT * FROM CLASSTEN;

# Delete all rows from the CLASSTEN table
TRUNCATE TABLE CLASSTEN;

# Remove the CLASSTEN table from the database
DROP TABLE CLASSTEN;









