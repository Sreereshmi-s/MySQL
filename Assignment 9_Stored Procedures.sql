# Create the Database
CREATE DATABASE worker_db;

# Use the Database
USE worker_db;

# Create table 'Worker' and Insert values
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'John', 'Doe', 50000, '2023-01-15', 'HR'),
(2, 'Jane', 'Smith', 60000, '2022-03-10', 'Finance'),
(3, 'Robert', 'Brown', 70000, '2021-06-20', 'IT'),
(4, 'Emily', 'Davis', 55000, '2020-09-12', 'HR'),
(5, 'Michael', 'Wilson', 80000, '2019-02-18', 'Finance'),
(6, 'Sarah', 'Moore', 62000, '2022-08-08', 'Marketing'),
(7, 'David', 'Taylor', 75000, '2021-04-04', 'IT'),
(8, 'Laura', 'Anderson', 68000, '2020-11-22', 'Marketing'),
(9, 'James', 'Thomas', 72000, '2018-07-14', 'Finance'),
(10, 'Sophia', 'Martin', 59000, '2017-05-30', 'HR');

#1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.

DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //
DELIMITER ;

#insert using delimiter
CALL AddWorker(11, 'Alice', 'Cooper', 65000, '2023-05-01', 'Sales');

# 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.
DELIMITER //
CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

-- Call the procedure and store the result in a variable:
CALL GetWorkerSalary(1, @salary);

-- View the retrieved salary
SELECT @salary AS WorkerSalary;


# 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 
DELIMITER //
CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //
DELIMITER ;

--  update the department of a worker with a specific id
CALL UpdateWorkerDepartment(1, 'Operations');

-- view the updated item
SELECT * FROM Worker WHERE Worker_Id = 1;


# 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.
DELIMITER //
CREATE PROCEDURE CountWorkersInDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END //
DELIMITER ;

-- Call the procedure 
CALL CountWorkersInDepartment('HR', @workerCount);

-- retrieved count:
SELECT @workerCount AS WorkerCount;


#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER //
CREATE PROCEDURE AverageSalaryInDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(15, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END //
DELIMITER ;

-- Call the procedure 
CALL AverageSalaryInDepartment('HR', @avgSalary);

--  retrieved average salary:
SELECT @avgSalary AS AverageSalary;





