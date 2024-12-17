# **MySQL: DDL Commands, Constraints, DML Operations, Joins, and Unions**

## **Project Overview**

This repository demonstrates the use of **Data Definition Language (DDL)** commands, **constraints**, and **Data Manipulation Language (DML)** operations in MySQL. Additionally, it explores **Joins** and **Unions** for retrieving and combining data across multiple tables.

- **DDL Commands**: `CREATE`, `ALTER`, `DROP`, `RENAME`, and `TRUNCATE` are used to define and manage the structure of database objects like tables, schemas, and indexes.  
- **Constraints**: Help enforce data integrity and ensure consistency within the database.  
- **DML Operations**: Focus on manipulating data in tables, including inserting, updating, deleting, and retrieving data.  
- **Joins**: Combine data from multiple tables based on related columns.  
- **Unions**: Combine the results of two or more `SELECT` queries into a single result set.

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
