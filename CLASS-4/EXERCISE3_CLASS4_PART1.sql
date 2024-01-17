USE JOINS_PRACTICE;

-- Return all values from the first and second fruit basket tables, excluding duplicates:

SELECT ID, Fruit
FROM Table1_fruit_basket
UNION
SELECT ID, Fruit
FROM Table2_fruit_basket;

-- -- This query uses UNION to combine the results of both tables, 
-- and it automatically removes duplicate rows.