-- Names of employees and their managers (excluding employees without managers):

USE JOINS_PRACTICE;

SELECT E.Name AS EmployeeName, M.Name AS ManagerName
FROM Employee E
JOIN Employee M ON E.ManagerID = M.EmployeeID
WHERE E.ManagerID IS NOT NULL;
