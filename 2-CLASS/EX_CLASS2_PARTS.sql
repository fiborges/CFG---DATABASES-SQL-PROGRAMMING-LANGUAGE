USE PARTS;
/*
result 1
--return all unique parts
SELECT DISTINCT PNAME
FROM PART;
*/

-- return all unique parts + ID
/*
-- result 2
SELECT P_ID, PNAME
FROM PART
GROUP BY P_ID, PNAME;
*/
-- return all projects from london - RESULT 3

SELECT *
FROM PROJECT
WHERE CITY = 'LONDON';







