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
