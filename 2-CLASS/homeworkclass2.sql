
-- Switch to the PARTS database
USE PARTS;

/*
-- result 1
-- find the name and weight of each red part
SELECT PNAME, WEIGHT
FROM PART
WHERE COLOUR = 'RED';
*/

-- find all unique supplier(s) name from London
SELECT DISTINCT SNAME
FROM SUPPLIER
WHERE CITY = 'LONDON';


