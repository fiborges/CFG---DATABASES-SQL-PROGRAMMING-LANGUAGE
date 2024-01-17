USE JOINS_PRACTICE;

/*
This SQL query is performing a RIGHT JOIN between two tables, Table1_fruit_basket and Table2_fruit_basket, 
based on the common column ID. The purpose of a RIGHT JOIN is to return all rows from the right table 
(t2 in this case) and the matching rows from the left table (t1). If there is no match in the left table, 
the result will still include the row from the right table with NULL values for columns from the left table.

SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit: Specifies the columns to be 
selected in the result set. The AS keyword is used to alias the column names for better readability.

FROM Table1_fruit_basket AS t1: Specifies the first table to be used in the RIGHT JOIN operation 
and assigns it the alias t1.

RIGHT JOIN Table2_fruit_basket AS t2: Specifies the second table to be used in 
the RIGHT JOIN operation and assigns it the alias t2. The RIGHT JOIN keyword ensures 
that all rows from the right table (t2) are included in the result, along with matching 
rows from the left table (t1).

ON t1.ID = t2.ID: Defines the condition for the JOIN. It specifies 
that the JOIN should be based on the equality of the ID column in both tables.

The result of this query will include all rows from Table2_fruit_basket and 
matching rows from Table1_fruit_basket based on the ID values. If there is no match in 
the left table, the columns from Table1_fruit_basket will have NULL values in the result set.

*/
-- RIGHT JOIN
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
RIGHT JOIN Table2_fruit_basket AS t2
ON t1.ID = t2.ID;

