USE RetailSalesDB;
-- create a visualization that combines information from multiple tables.
CREATE VIEW EmployeeMetrics AS
SELECT e.EmployeeID, e.Name AS EmployeeName, mv.Date,
       CONCAT(IFNULL(MAX(CASE WHEN mv.MetricID = 1 THEN CONCAT('€', mv.Value) END), '')) AS TotalSalesValue,
       CAST(MAX(CASE WHEN mv.MetricID = 2 THEN mv.Value END) AS DECIMAL(10, 0)) AS CustomerEntries,
       CAST(MAX(CASE WHEN mv.MetricID = 3 THEN mv.Value END) AS DECIMAL(10, 0)) AS ReceiptsIssued,
       CAST(MAX(CASE WHEN mv.MetricID = 4 THEN mv.Value END) AS DECIMAL(10, 0)) AS UnitsSold,
       CONCAT(IFNULL(MAX(CASE WHEN mv.MetricID = 5 THEN CONCAT('€', mv.Value) END), '')) AS DailyTarget,
       IFNULL(MAX(CASE WHEN mv.MetricID = 6 THEN mv.Value END), '') AS CrossSaleRatio,
       CONCAT(IFNULL(MAX(CASE WHEN mv.MetricID = 7 THEN mv.Value END), ''), '%') AS ServicePercentage,
       CONCAT(IFNULL(MAX(CASE WHEN mv.MetricID = 8 THEN CONCAT('€', mv.Value) END), '')) AS AverageReceiptValue,
       CONCAT(IFNULL(MAX(CASE WHEN mv.MetricID = 9 THEN mv.Value END), ''), '%') AS TargetAchievementPercentage
FROM Employees e
INNER JOIN MetricValues mv ON e.EmployeeID = mv.EmployeeID
GROUP BY e.EmployeeID, mv.Date;



