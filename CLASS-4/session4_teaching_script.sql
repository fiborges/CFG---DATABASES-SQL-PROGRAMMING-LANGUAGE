-- ------------------------------------------------------------------------
-- Create two fruit baskets tables, practice inner, left and right joins---
-- ------------------------------------------------------------------------
CREATE DATABASE JOINS_PRACTICE;
USE JOINS_PRACTICE;

-- Create table 1
CREATE TABLE Table1_fruit_basket(
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

-- Create table 2
CREATE TABLE Table2_fruit_basket(
	ID INT, Fruit 
   VARCHAR(50)
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


-- 1. INNER JOIN
 -- Returns only the rows where there is a match in
 -- both tables based on the specified condition.







-- 2. LEFT JOIN
 /* Returns all rows from the left table and the matching rows from the right table. 
 If there is no match in the right table, NULL values are returned 
 for columns from the right table based on the specified condition.*/







-- 3. RIGHT JOIN
 /* Returns all rows from the right table and the matching rows from the left table. 
 If there is no match in the left table, NULL values are 
 returned for columns from the left table based on the specified condition.*/





/*  4. CROSS JOIN - fruit basket
 Generates all possible combinations of rows from two or more tables without any specific
 matching condition. */
 
 
 
/* 5. NATURAL JOIN 
 It's useful when the tables have a column with the same name and you want 
 to join them based on that commonality.*/
SELECT t1.id as t1ID,
	    t1.fruit_name as t1Fruit,
       t2.id as t2ID,
       t2.fruit_name as t2Fruit
FROM Table1_fruit_basket AS t1
NATURAL JOIN Table2_fruit_basket AS t2;

-- ------------------------------------------------------------------
-- --- Self Joins - create the table and answer the questions  -------
-- ------------------------------------------------------------------

USE JOINS_PRACTICE;

-- Create a Table
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
(4, 'Marry',2),
(5, 'Joseph',2),
(7, 'Ben',2);



-- 1. I want to know the names of the employees and their managers,
-- but only return employees who have a manager



-- 2. I want to return the name of all employees and their managers,
-- if the employee does not have a manager then return 'Top Manager'






-- -----------------------
-- Union and Union All----
-- -----------------------

-- 1. Return all values from the first and second fruit basket tables, excluding duplicates







-- 2. Return all values from the first and second fruit basket tables, including duplicates








-- 3. Mimic a full outer join in MySQL using the two fruit basket tables
 /*Returns all rows when there is a match in either the left or the right table. 
 If there is no match in one of the tables,  NULL values are returned 
 for columns from the table without a match based on the specified condition.*/




-- --------------
-- Subqueries----
-- --------------
--  a query nested inside another SQL query.

-- 1. Using the Customers database, return the first_name 
-- and last_name where the customers phone number is '555-3344'
USE customers;
