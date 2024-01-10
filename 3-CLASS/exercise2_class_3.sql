USE Bakery;

-- Find all sweet items that start with the letter ‘c’

SELECT * 
FROM Sweet 
WHERE item_name LIKE 'c%';

-- Find all savoury items that cost more than £1, but less than £3

SELECT * 
FROM Savoury 
WHERE price > 1.00 AND price < 3.00;



