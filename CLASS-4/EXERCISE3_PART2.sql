USE JOINS_PRACTICE;

-- Return all values from the first and second fruit basket tables, including duplicates:

SELECT ID, Fruit
FROM Table1_fruit_basket
UNION ALL
SELECT ID, Fruit
FROM Table2_fruit_basket;

-- This query uses UNION ALL to combine the results of both tables, including all rows, 
-- including duplicates