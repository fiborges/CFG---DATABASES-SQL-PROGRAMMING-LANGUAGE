USE SHOP;

-- Find ALL sales records that took place in the London store, not in December, but sales concluded by Bill or Frank for the amount higher than £50

SELECT 
    *
FROM
    SALES1
WHERE
    Store = 'London' AND Month <> 'December'
        AND (SalesPerson = 'Bill'
        OR SalesPerson = 'Frank')
        AND SalesAmount > 50

-- Find out how many sales took place each week (in no particular order)

SELECT 
    Week, COUNT(*) AS NumberOfSales
FROM
    SALES1
GROUP BY Week

-- Find out how many sales took place each week AND present data by week in descending and then in ascending order
-- Descending Order
SELECT 
    Week, COUNT(*) AS NumberOfSales
FROM
    SALES1
GROUP BY Week
ORDER BY Week DESC

-- Ascending Order
SELECT 
    Week, COUNT(*) AS NumberOfSales
FROM
    SALES1
GROUP BY Week
ORDER BY Week ASC

-- Find out how many sales were recorded each week on different days of the week
SELECT 
    Week, Day, COUNT(*) AS NumberOfSales
FROM
    SALES1
GROUP BY Week , Day

-- We need to change salesperson's name Inga to Annette
UPDATE SALES1 
SET 
    SalesPerson = 'Annette'
WHERE
    SalesPerson = 'Inga'

-- Find out how many sales did Annette do:

SELECT 
    COUNT(*) AS NumberOfSalesByAnnette
FROM
    SALES1
WHERE
    SalesPerson = 'Annette'

-- Find the total sales amount by each person by day

SELECT 
    SalesPerson, Day, SUM(SalesAmount) AS TotalSalesAmount
FROM
    SALES1
GROUP BY SalesPerson , Day

-- How much (sum) each person sold for the given period

SELECT 
    SalesPerson, SUM(SalesAmount) AS TotalSalesAmount
FROM
    SALES1
GROUP BY SalesPerson

-- How much (sum) each person sold for the given period, including the number of sales per person, their average, lowest and highest sale amounts:
SELECT 
    SalesPerson,
    COUNT(*) AS NumberOfSales,
    AVG(SalesAmount) AS AverageSaleAmount,
    MIN(SalesAmount) AS LowestSaleAmount,
    MAX(SalesAmount) AS HighestSaleAmount,
    SUM(SalesAmount) AS TotalSalesAmount
FROM
    SALES1
GROUP BY SalesPerson

-- Find the total monetary sales amount achieved by each store:
SELECT 
    Store, SUM(SalesAmount) AS TotalSalesAmount
FROM
    SALES1
GROUP BY Store

-- Find the number of sales by each person if they did less than 3 sales for the past period
SELECT 
    SalesPerson, COUNT(*) AS NumberOfSales
FROM
    SALES1
GROUP BY SalesPerson
HAVING COUNT(*) < 3

-- Find the total amount of sales by month where combined total is less than £100
SELECT 
    Month, SUM(SalesAmount) AS TotalSalesAmount
FROM
    SALES1
GROUP BY Month
HAVING SUM(SalesAmount) < 100








