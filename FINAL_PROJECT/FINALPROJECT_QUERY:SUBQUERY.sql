USE RetailSalesDB;

SELECT 
    e.Name AS EmployeeName,
    CASE 
        WHEN subquery.AvgPercentage >= 100 THEN CONCAT('Achieved Target (', FORMAT(subquery.AvgPercentage, 2), '%)')
        ELSE CONCAT('Did Not Achieve Target (', FORMAT(subquery.AvgPercentage, 2), '%)')
    END AS TargetStatus
FROM Employees e
LEFT JOIN (
    SELECT
        mv.EmployeeID,
        AVG(CASE WHEN mv.MetricID = 9 THEN mv.Value END) AS AvgPercentage
    FROM MetricValues mv
    WHERE mv.Date BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY mv.EmployeeID
) subquery ON e.EmployeeID = subquery.EmployeeID;





