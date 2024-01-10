USE Bakery;

-- Find all savoury items that have either pork or beef filling:
SELECT * 
FROM Savoury 
WHERE main_ingredient IN ('pork', 'beef');

-- Find all sweet items that cost 50 cents or cheaper

SELECT * 
FROM Sweet 
WHERE price <= 0.50;

-- Find all sweet items and their price, except for cannoli

SELECT item_name, price 
FROM Sweet 
WHERE item_name <> 'cannoli';


