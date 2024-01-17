USE PARTS;

-- 1 -  Find the name and status of each supplier who supplies project J2:
/*
SELECT S.SNAME AS SupplierName, S.STATUS AS SupplierStatus
FROM SUPPLIER S
JOIN SUPPLY SU ON S.S_ID = SU.S_ID
WHERE SU.J_ID = 'J2';
*/

-- 2. Find the name and city of each project supplied by a London-based supplier:
/*
SELECT P.JNAME AS ProjectName, P.CITY AS ProjectCity
FROM PROJECT P
JOIN SUPPLY SU ON P.J_ID = SU.J_ID
JOIN SUPPLIER S ON SU.S_ID = S.S_ID
WHERE S.CITY = 'LONDON';

*/

-- 3. Find the name and city of each project NOT supplied by a London-based supplier:
/*
SELECT P.JNAME AS ProjectName, P.CITY AS ProjectCity
FROM PROJECT P
WHERE P.J_ID NOT IN (
    SELECT DISTINCT SU.J_ID
    FROM SUPPLY SU
    JOIN SUPPLIER S ON SU.S_ID = S.S_ID
    WHERE S.CITY = 'LONDON'
);
*/

-- 4. Find the supplier name, part name, and project name for each case WHERE a 
-- supplier supplies a project with a part, BUT ALSO the supplier city, project city, AND part city are the same

SELECT S.SNAME AS SupplierName, P.PNAME AS PartName, PR.JNAME AS ProjectName
FROM SUPPLY SU
JOIN SUPPLIER S ON SU.S_ID = S.S_ID
JOIN PART P ON SU.P_ID = P.P_ID
JOIN PROJECT PR ON SU.J_ID = PR.J_ID
WHERE S.CITY = P.CITY AND P.CITY = PR.CITY;




