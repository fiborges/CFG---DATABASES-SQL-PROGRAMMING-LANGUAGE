USE JOINS_PRACTICE;

/*
This SQL query is performing a CROSS JOIN between two tables, Table1_fruit_basket and Table2_fruit_basket. 
The purpose of a CROSS JOIN is to generate all possible combinations of rows from both tables without any specific 
matching condition. It produces a Cartesian product of the two tables.

CROSS JOIN Table2_fruit_basket AS t2: Specifies the second table to be used in the CROSS JOIN 
operation and assigns it the alias t2. The CROSS JOIN keyword ensures that all rows from the first 
table (t1) are combined with all rows from the second table (t2), resulting in every possible 
combination.

The result of this query will contain all possible combinations of rows 
from Table1_fruit_basket and Table2_fruit_basket. This can lead to a large 
result set, especially if both tables have many rows.

*/

-- CROSS JOIN - fruit basket
SELECT t1.ID AS t1ID, t1.Fruit AS t1Fruit, t2.ID AS t2ID, t2.Fruit AS t2Fruit
FROM Table1_fruit_basket AS t1
CROSS JOIN Table2_fruit_basket AS t2;

