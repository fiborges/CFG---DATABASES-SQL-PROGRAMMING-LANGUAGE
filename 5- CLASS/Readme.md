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
