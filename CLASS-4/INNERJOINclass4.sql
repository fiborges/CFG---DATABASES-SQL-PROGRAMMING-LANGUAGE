/*
this SQL query is performing an INNER JOIN between two tables, Table1_fruit_basket and Table2_fruit_basket, 
based on the common column ID. 

The purpose of an INNER JOIN is to retrieve only the rows that have matching values in 
both tables.

SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit: Specifies the columns to be selected
 in the result set. The AS keyword is used to alias the column names for better readability.

FROM Table1_fruit_basket AS t1: Specifies the first table to be used in the JOIN operation and assigns it the alias t1.

INNER JOIN Table2_fruit_basket AS t2: Specifies the second table to be used in the JOIN operation and assigns 
it the alias t2. The INNER JOIN keyword ensures that only matching rows are included in the result set.

ON t1.ID = t2.ID: Defines the condition for the JOIN. It specifies that the JOIN should be based on the 
equality of the ID column in both tables.

The result of this query will be a combined result set that includes rows from both tables where the ID values match. 
The columns t1ID and t1Fruit represent the columns from the first table (Table1_fruit_basket), and t2ID and t2Fruit 
represent the columns from the second table (Table2_fruit_basket). Only rows with matching ID values in both tables 
will be included in the result.
*/

-- INNER JOIN
USE JOINS_PRACTICE;

SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
INNER JOIN Table2_fruit_basket AS t2
ON t1.ID = t2.ID;

