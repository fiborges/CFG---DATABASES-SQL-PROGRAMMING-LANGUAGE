# SQL Functions
## Introduction
SQL (Structured Query Language) functions are pre-defined operations that can be applied to the data stored in a database. These functions perform specific tasks and return results based on the input parameters. They are crucial for data manipulation, transformation, and analysis within the database management system.

## Types of Functions
### 1. Scalar Functions
Scalar functions operate on a single value and return a single value. They can be used in various SQL statements such as SELECT, WHERE, and ORDER BY.

#### Example:
```sql

-- Using CONCAT to concatenate two strings
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;
```
### 2. Aggregate Functions
Aggregate functions perform a calculation on a set of values and return a single value. They are often used with GROUP BY clauses to perform calculations on groups of rows.

#### Example:
```sql

-- Calculating the average salary for each department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```
### 3. Window Functions
Window functions perform calculations across a specified range of rows related to the current row. They are commonly used for analytical and reporting purposes.

#### Example:
```sql

-- Calculating the running total of sales within each department
SELECT department, date, sales,
       SUM(sales) OVER (PARTITION BY department ORDER BY date) AS running_total
FROM sales_data;
```
### 4. String Functions
String functions manipulate character data, such as concatenation, substring extraction, and case manipulation.

#### Example:
```sql

-- Extracting the first three characters of a product name
SELECT product_name, LEFT(product_name, 3) AS short_name
FROM products;
```

## How to Use Functions
### Syntax:

The general syntax for using SQL functions is as follows:

```sql

SELECT function_name(parameters) FROM table_name;
```
### Parameters:

Functions take parameters as input, which can be literals, column names, or expressions.

### Aliases:

It's common to use aliases to give a meaningful name to the result of a function.

```sql

SELECT AVG(salary) AS average_salary FROM employees;
```
#### Examples
##### Scalar Function Example:
```sql

-- Using the UPPER function to convert names to uppercase
SELECT UPPER(first_name) AS uppercase_name
FROM employees;
```
##### Aggregate Function Example:
```sql

-- Calculating the total revenue for a product category
SELECT category, SUM(revenue) AS total_revenue
FROM sales
GROUP BY category;
```
##### Window Function Example:
```sql

-- Calculating the percentage of total sales for each product
SELECT product, sales, 
       sales / SUM(sales) OVER () * 100 AS percentage_of_total_sales
FROM products;
```
##### String Function Example:
```sql

-- Concatenating first and last names with a space in between
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;
```
## PRATICE NUMBER 1 EXAMPLE:

```sql

-- Create the database
CREATE DATABASE IF NOT EXISTS test_database;

-- Use the database
USE test_database;

-- Create the employee_data table
CREATE TABLE IF NOT EXISTS employee_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);
 -- Insert sample data
INSERT INTO employee_data (first_name, last_name, salary, hire_date)
VALUES
    ('John', 'Doe', 50000.00, '2022-01-01'),
    ('Jane', 'Smith', 60000.00, '2022-02-15'),
    ('Bob', 'Johnson', 55000.00, '2022-03-10'),
    ('Alice', 'Williams', 70000.00, '2022-04-20');
```
Now, you can use the queries to practice the REPLACE, POW, and ADDDATE functions on this employee_data table.

### Example queries:

### REPLACE String Function:

```sql

-- Replace 'Doe' with 'Johnson' in the last names
SELECT first_name, REPLACE(last_name, 'Doe', 'Johnson') AS modified_last_name
FROM employee_data;
```
### POW Numeric Function:

```sql

-- Calculate the square of the salaries
SELECT first_name, POW(salary, 2) AS squared_salary
FROM employee_data;
```
### ADDDATE Date Function:

```sql

-- Add 30 days to the hire dates
SELECT first_name, ADDDATE(hire_date, 30) AS modified_hire_date
FROM employee_data;
```
# Transactions in SQL
## Introduction
A transaction in SQL is a sequence of one or more SQL statements that are executed as a single unit of work. Transactions provide a way to ensure the integrity and consistency of the database by allowing a series of operations to be treated as a single, indivisible unit. The primary goal of transactions is to guarantee that the database remains in a consistent state, even in the presence of errors, failures, or concurrent access by multiple users.

## Properties of Transactions
Transactions in SQL adhere to the principles of ACID, which stands for:

### Atomicity: 
       Transactions are atomic, meaning that they are treated as a single, indivisible unit of work. Either all the operations within the transaction are executed successfully, or none of them are.

### Consistency: 
       A transaction brings the database from one consistent state to another. The integrity constraints of the database should be maintained before and after the transaction.

### Isolation: 
       Each transaction is executed in isolation from other transactions. Changes made by one transaction are not visible to other transactions until the changes are committed.

### Durability: 
       Once a transaction is committed, its effects are permanent and will survive subsequent system failures. The changes become a permanent part of the database.

## Transaction Commands
In SQL, transactions are managed using the following commands:

### BEGIN TRANSACTION: 
       Starts a new transaction.

### COMMIT: 
       Marks the successful end of a transaction. All changes made during the transaction are made permanent.

### ROLLBACK: 
       Undoes the changes made during the current transaction and rolls back to the previous state. It is used to handle errors or unexpected situations.

## Transaction Example
Consider a banking scenario where a user transfers money from one account to another. This operation involves two updates: deducting money from one account and adding it to another.

```sql

-- Begin the transaction
BEGIN TRANSACTION;

-- Deduct money from Account A
UPDATE accounts SET balance = balance - 100 WHERE account_number = 'A123';

-- Add money to Account B
UPDATE accounts SET balance = balance + 100 WHERE account_number = 'B456';

-- Commit the transaction
COMMIT;
```
If any of the updates fail (due to an error or any other reason), the entire transaction will be rolled back, ensuring that the database remains in a consistent state.

## Transaction Control in Stored Procedures
Transactions are often used within stored procedures to encapsulate a series of SQL statements as a single unit of work. The BEGIN TRANSACTION, COMMIT, and ROLLBACK commands can be used within stored procedures to control transactions.

```sql

-- Example stored procedure with transaction control
CREATE PROCEDURE TransferMoney(from_account VARCHAR(10), to_account VARCHAR(10), amount DECIMAL(10,2))
BEGIN
    BEGIN TRANSACTION;

    UPDATE accounts SET balance = balance - amount WHERE account_number = from_account;
    UPDATE accounts SET balance = balance + amount WHERE account_number = to_account;

    IF (some_condition) THEN
        COMMIT; -- Commit the transaction if all updates are successful
    ELSE
        ROLLBACK; -- Rollback the transaction if there is an error or condition is not met
    END IF;
END;

```
# TASK 2
Let's create an example SQL transaction that imitates a transfer of £50 between two accounts. In this scenario, we'll have two tables: accounts and transactions.

### Assuming the accounts table structure is as follows:

```sql

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_number VARCHAR(10) UNIQUE,
    balance DECIMAL(10, 2)
);
```
And the transactions table structure to keep track of the transactions:

```sql

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    from_account_number VARCHAR(10),
    to_account_number VARCHAR(10),
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
Now, let's write a SQL transaction statement:

```sql

-- Begin the transaction
START TRANSACTION;

-- Set the account numbers
SET @from_account_number = 'A123';
SET @to_account_number = 'B456';
SET @transfer_amount = 50.00;

-- Check if the balance of the first account is greater than £50
SELECT balance INTO @from_account_balance FROM accounts WHERE account_number = @from_account_number FOR UPDATE;

IF @from_account_balance >= @transfer_amount THEN
    -- Deduct £50 from the first account
    UPDATE accounts SET balance = balance - @transfer_amount WHERE account_number = @from_account_number;

    -- Add £50 to the second account
    UPDATE accounts SET balance = balance + @transfer_amount WHERE account_number = @to_account_number;

    -- Record the transaction
    INSERT INTO transactions (from_account_number, to_account_number, amount) VALUES (@from_account_number, @to_account_number, @transfer_amount);

    -- Commit the transaction
    COMMIT;
    
    -- Display success message
    SELECT 'Transaction completed successfully.' AS result;

ELSE
    -- Rollback the transaction if the balance is insufficient
    ROLLBACK;
    
    -- Display error message
    SELECT 'Insufficient funds in the first account.' AS result;
END IF;
```

## Explanation:

We use START TRANSACTION to begin the transaction.
The FOR UPDATE clause is used in the SELECT statement to lock the row, ensuring that no other transaction can modify it until the current transaction is committed or rolled back.
If the balance in the first account is sufficient, we deduct £50 from the first account, add £50 to the second account, record the transaction, and commit the transaction.
If the balance is insufficient, we rollback the transaction and display an error message.

This example demonstrates a simple yet realistic SQL transaction for a fund transfer between two accounts.


# Table Locking in SQL
## Introduction
Table locking is a crucial aspect of SQL transaction management that allows users to control access to a table during certain operations. It involves acquiring a lock on a table, which prevents other sessions or users from making changes to the same table for a specific period. This practice is essential for maintaining data integrity and ensuring that operations are performed without interference.

## Read Lock
The session holding a READ lock can only read data from the table but cannot write to it.
Multiple sessions can acquire READ locks on the same table simultaneously.
Other sessions are prevented from writing data to the table until the READ lock is released. Any write operations from other sessions will be queued until the READ lock is released.
If a session is terminated, whether normally or unexpectedly, MySQL automatically releases all locks held by that session.

### Syntax
```sql

-- Acquiring a READ lock
LOCK TABLE <table_name> READ;

-- Perform read operations on the table

-- Releasing the READ lock

 UNLOCK TABLES;
```

### Example
Consider a scenario where births are being registered in a database with two tables: Parent and Child. We want to insert a new row into the Child table while ensuring that every child row refers to a valid parent row in the Parent table. To maintain consistency, we acquire a READ lock on the Parent table before performing the update on the Child table.

```sql
+
-- Acquiring a READ lock on 'Parent' table
LOCK TABLE Parent READ;

-- Perform update on 'Child' table
-- (Ensure that every child row refers to a parent row in 'Parent')

-- Releasing the READ lock
UNLOCK TABLES;
```
## Write Lock

A WRITE lock is an exclusive lock that gives the session holding the lock full write access to the table.
Other sessions are completely restricted from reading or writing to the table until the WRITE lock is released.

### Syntax
```sql

-- Acquiring a WRITE lock
LOCK TABLE <table_name> WRITE;

-- Perform write operations on the table

-- Releasing the WRITE lock
UNLOCK TABLES;
```
### Example
Continuing with the example of the Parent and Child tables, if we need to add a new record to the Child table and ensure that no other session writes new data into the same table simultaneously, we acquire a WRITE lock on the Child table.

```sql

-- Acquiring a WRITE lock on 'Child' table
LOCK TABLE Child WRITE;

-- Perform write operations on 'Child' table
-- (Add a new record)

-- Releasing the WRITE lock
UNLOCK TABLES;

```
### Combined Read and Write Locks
In some cases, both READ and WRITE locks may be needed simultaneously, and the syntax for acquiring them is as follows:

```sql

-- Acquiring both READ and WRITE locks
LOCK TABLES Parent READ, Child WRITE;

-- Perform necessary operations

-- Releasing both locks
UNLOCK TABLES;
```
## Summary

Table locking is a fundamental practice in SQL transaction management, ensuring the integrity of data during updates or maintenance. Acquiring READ and WRITE locks allows users to control access to tables, preventing unwanted interference from other sessions. These locks help maintain referential integrity, minimize data errors, and ensure the success of transactions within a database.

