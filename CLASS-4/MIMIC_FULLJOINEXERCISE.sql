USE JOINS_PRACTICE;
/*
MySQL doesn't have a built-in FULL OUTER JOIN syntax like some other database systems, 
but you can achieve the same result using a combination of LEFT JOIN and RIGHT JOIN with 
UNION. Here's how you can mimic a full outer join in MySQL:

*/ 
-- Mimic a full outer join in MySQL
SELECT COALESCE(Table1_fruit_basket.ID, Table2_fruit_basket.ID) AS ID,
       Table1_fruit_basket.Fruit AS Fruit1,
       Table2_fruit_basket.Fruit AS Fruit2
FROM Table1_fruit_basket
LEFT JOIN Table2_fruit_basket ON Table1_fruit_basket.ID = Table2_fruit_basket.ID

UNION

SELECT COALESCE(Table1_fruit_basket.ID, Table2_fruit_basket.ID) AS ID,
       Table1_fruit_basket.Fruit AS Fruit1,
       Table2_fruit_basket.Fruit AS Fruit2
FROM Table2_fruit_basket
LEFT JOIN Table1_fruit_basket ON Table2_fruit_basket.ID = Table1_fruit_basket.ID;

/*
This query first performs a LEFT JOIN on Table1_fruit_basket and Table2_fruit_basket 
and then a RIGHT JOIN on the same tables. The COALESCE function is used to handle NULL 
values and select the non-NULL ID from either table. The UNION operator combines the 
results of both queries, effectively mimicking a full outer join.

COALESCE(Table1_fruit_basket.ID, Table2_fruit_basket.ID) is used to select the non-NULL 
ID from either table. If there is a match, it selects the ID from Table1_fruit_basket, 
otherwise from Table2_fruit_basket.

The UNION operator is used to combine the results of the two SELECT statements. 
It removes duplicate rows, so each unique combination of ID, Fruit1, and Fruit2 is 
returned.





*/