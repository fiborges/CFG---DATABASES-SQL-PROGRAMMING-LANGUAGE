# Inner Join
The INNER JOIN is the most typical JOIN, linking columns from two tables based on a related column. It returns rows when there is at least one match in both tables. However, it cannot handle NULL values.

## Syntax:
```sql

SELECT <alias1>.<column_name>, <alias1>.<column_name>, <alias2>.<column_name>
FROM <table_name1> <alias1> INNER JOIN
<table_name2> <alias2>
ON
<alias1>.<column_name> = <alias2>.<column_name>;
```

### Example:
```sql

-- What are our customers’ email addresses?
SELECT
c.name, c.surname, e.email_address
FROM customers c
INNER JOIN
email_address e
ON
c.customer_id = e.email_address_customer_id;
```
# Left Outer Join
The LEFT OUTER JOIN returns all rows from the left table and matching rows from the right table. If there is no match in the right table, it returns NULL values.

## Syntax:
```sql

SELECT <alias1>.<column_name>, <alias1>.<column_name>, <alias2>.<column_name>
FROM <table_name1> <alias1> LEFT JOIN
<table_name2> <alias2>
ON
<alias1>.<column_name> = <alias2>.<column_name>;
```

### Example:
```sql

-- What are our customers’ email addresses, including those that we don’t have an email address for?
SELECT
c.name, c.surname, e.email_address
FROM customers c
LEFT JOIN
email_address e
ON
c.customer_id = e.email_address_customer_id;
```

# Right Outer Join
The RIGHT OUTER JOIN is the opposite of the LEFT OUTER JOIN. It returns all rows from the right table with matching rows from the left table. If there is no match in the left table, it returns NULL values.

## Syntax:
```sql

SELECT <alias1>.<column_name>, <alias1>.<column_name>, <alias2>.<column_name>
FROM <table_name1> <alias1> RIGHT JOIN
<table_name2> <alias2>
ON
<alias1>.<column_name> = <alias2>.<column_name>;
```
### Example:
```sql

-- What are the email addresses we have, including those emails that we don’t have a matching customer for?
SELECT
c.name, c.surname, e.email_address
FROM customers c
RIGHT JOIN
email_address e
ON
c.customer_id = e.email_address_customer_id;
```
# Full Outer Join (Simulated)
The FULL OUTER JOIN combines the results of both LEFT and RIGHT OUTER JOINs, returning rows when conditions are met and NULL values when there is no match. Although MySQL doesn't support FULL OUTER JOIN syntax, you can simulate it by combining LEFT and RIGHT JOINs with UNION.

## Example:
```sql

-- Simulating FULL OUTER JOIN
SELECT <columns>
FROM <table1>
LEFT JOIN <table2> ON <condition>
UNION
SELECT <columns>
FROM <table1>
RIGHT JOIN <table2> ON <condition>;

```

## Fruit Basket Tables exercise
Table Creation and Data Insertion
```sql

-- Create Database
CREATE DATABASE JOINS_PRACTICE;
USE JOINS_PRACTICE;

-- Create Table 1
CREATE TABLE Table1_fruit_basket (
    ID INT, 
    Fruit VARCHAR(50)
);

INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');

-- Create Table 2
CREATE TABLE Table2_fruit_basket (
    ID INT, 
    Fruit VARCHAR(50)
);

INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');
```
## INNER JOIN
```sql

-- INNER JOIN
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
INNER JOIN Table2_fruit_basket AS t2
ON t1.ID = t2.ID;

```
## LEFT JOIN
```sql

-- LEFT JOIN
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
LEFT JOIN Table2_fruit_basket AS t2
ON t1.ID = t2.ID;
```
## RIGHT JOIN
```sql

-- RIGHT JOIN
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
RIGHT JOIN Table2_fruit_basket AS t2
ON t1.ID = t2.ID;
```
## CROSS JOIN
```sql

-- CROSS JOIN - fruit basket
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
CROSS JOIN Table2_fruit_basket AS t2;
```
## NATURAL JOIN
```sql

-- NATURAL JOIN
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
NATURAL JOIN Table2_fruit_basket AS t2;
```
## Self Joins - Employee Table
Employee Table Creation and Data Insertion
```sql

-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(55),
    ManagerID INT
);

-- Insert Sample Data
INSERT INTO Employee
(EmployeeID, Name, ManagerID)
VALUES
(1, 'Mike', 3),
(2, 'David', 3),
(3, 'Roger', NULL),
(4, 'Marry', 2),
(5, 'Joseph', 2),
(7, 'Ben', 2);
```
## Self Joins Examples
### 1. Employees and Their Managers
```sql

-- Employees and Their Managers
SELECT e1.Name AS Employee, e2.Name AS Manager
FROM Employee e1
INNER JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;
```
### 2. Employees and Managers (Handle Employees without Managers)
```sql

-- Employees and Managers (Handle Employees without Managers)
SELECT e1.Name AS Employee, COALESCE(e2.Name, 'Top Manager') AS Manager
FROM Employee e1
LEFT JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;
```
## Union and Union All
Union and Union All Examples
### 1. Union (Excluding Duplicates)
```sql

-- Union (Excluding Duplicates)
SELECT ID, Fruit FROM Table1_fruit_basket
UNION
SELECT ID, Fruit FROM Table2_fruit_basket;
```
### 2. Union All (Including Duplicates)
```sql

-- Union All (Including Duplicates)
SELECT ID, Fruit FROM Table1_fruit_basket
UNION ALL
SELECT ID, Fruit FROM Table2_fruit_basket;
```
### 3. Mimic FULL OUTER JOIN with Union
```sql

-- Mimic FULL OUTER JOIN with Union
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
LEFT JOIN Table2_fruit_basket AS t2 ON t1.ID = t2.ID
UNION
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
RIGHT JOIN Table2_fruit_basket AS t2 ON t1.ID = t2.ID;
```
## Subqueries
### Subqueries Examples
### 1. Find Customers with Phone Number '555-3344'
```sql

-- Find Customers with Phone Number '555-3344'
USE customers;

SELECT first_name, last_name
FROM customers
WHERE phone_number = '555-3344';

```

