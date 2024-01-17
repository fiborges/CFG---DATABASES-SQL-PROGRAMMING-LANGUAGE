-- Names of all employees and their managers (with 'Top Manager' for employees 
-- without managers):

USE JOINS_PRACTICE;

SELECT E.Name AS EmployeeName, COALESCE(M.Name, 'Top Manager') AS ManagerName
FROM Employee E
LEFT JOIN Employee M ON E.ManagerID = M.EmployeeID;

/*
This query uses a LEFT JOIN to include all employees, even those without managers. 
The COALESCE function is used to display 'Top Manager' for employees without a manager.
*/
