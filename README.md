# **MySQL: DDL Commands, Constraints, DML Operations, Joins, Unions, and Advanced Features**

## **Project Overview**

This repository demonstrates the use of **Data Definition Language (DDL)** commands, **constraints**, and **Data Manipulation Language (DML)** operations in MySQL. Additionally, it explores advanced MySQL features like **Joins**, **Unions**, **Functions**, **Subqueries**, **Views**, **Stored Procedures**, and **Triggers**.

- **DDL Commands**: Used to define and manage the structure of database objects like tables, schemas, and indexes.  
- **Constraints**: Help enforce data integrity and ensure consistency within the database.  
- **DML Operations**: Focus on manipulating data in tables, including inserting, updating, deleting, and retrieving data.  
- **Joins and Unions**: Combine and retrieve data from multiple tables.  
- **Functions and Subqueries**: Provide reusable logic and complex data retrieval.  
- **Views, Stored Procedures, and Triggers**: Enhance reusability, automation, and efficiency in database operations.  

---

## **Key Features**

### **1. Data Definition Language (DDL) Commands**
- **CREATE**: Defines new database objects (tables, schemas, etc.).  
- **ALTER**: Modifies the structure of existing database objects.  
- **DROP**: Removes database objects.  
- **RENAME**: Changes the name of existing database objects.  
- **TRUNCATE**: Removes all data from a table without deleting its structure.  

### **2. Constraints**
- **NOT NULL**: Ensures that a column cannot have a NULL value.  
- **UNIQUE**: Ensures that all values in a column are unique.  
- **PRIMARY KEY**: Uniquely identifies each record in a table.  
- **FOREIGN KEY**: Establishes and enforces a relationship between columns in different tables.  
- **CHECK**: Ensures that all values in a column meet a specific condition.  
- **DEFAULT**: Sets a default value for a column when no value is specified.  

### **3. Data Manipulation Language (DML) Operations**
- **INSERT**: Adds new rows of data to a table.  
- **UPDATE**: Modifies existing data in a table.  
- **DELETE**: Removes data from a table.  
- **SELECT**: Retrieves data from one or more tables.  
- **MERGE/REPLACE**: Combines data manipulation logic (if supported by the DBMS).  

### **4. Joins**
Joins are used to retrieve data from multiple tables based on a related column.  

- **INNER JOIN**: Retrieves records that have matching values in both tables.  
- **LEFT JOIN (LEFT OUTER JOIN)**: Retrieves all records from the left table and matching records from the right table.  
- **RIGHT JOIN (RIGHT OUTER JOIN)**: Retrieves all records from the right table and matching records from the left table.  
- **FULL JOIN (FULL OUTER JOIN)**: Retrieves all records when there is a match in either table.  
- **CROSS JOIN**: Produces a Cartesian product of both tables, combining all rows.  

### **5. Unions**
Unions combine the results of two or more `SELECT` queries into a single result set.  

- **UNION**: Combines results while removing duplicates.  
- **UNION ALL**: Combines results and includes duplicates.  

### **6. Functions**
Functions in MySQL are reusable blocks of code that perform operations and return a value.  

- **Built-in Functions**: `SUM()`, `AVG()`, `COUNT()`, `NOW()`, `ROUND()`, etc.  
- **User-defined Functions (UDFs)**: Custom functions created by the user using the `CREATE FUNCTION` statement.  


### **7. Subqueries**
Subqueries are nested queries used to perform complex operations.  

- **Single-row Subqueries**: Return a single value.  
- **Multi-row Subqueries**: Return multiple values.  
- **Correlated Subqueries**: Refer to columns in the outer query.  


### **8. Views**
Views are virtual tables created using `SELECT` queries.  

- **CREATE VIEW**: Define a view.  
- **DROP VIEW**: Remove a view.  

### **9. Stored Procedures**
Stored procedures are precompiled SQL statements that can be executed as a single unit.  

- **CREATE PROCEDURE**: Define a procedure.  
- **CALL**: Execute a procedure.  
- **DROP PROCEDURE**: Remove a procedure.  

### **10. Triggers**
Triggers are automatically executed in response to certain events on a table (e.g., `INSERT`, `UPDATE`, `DELETE`).  

- **BEFORE Trigger**: Executes before the specified event.  
- **AFTER Trigger**: Executes after the specified event.  
