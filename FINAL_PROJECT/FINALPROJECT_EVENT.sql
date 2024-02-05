
-- SHOW EVENTS;

USE RetailSalesDB;

DELIMITER $$

-- Event Creation
CREATE EVENT DailyMetricsUpdate
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    -- Update metrics for the current date
    CALL UpdateMetricValues(CURRENT_DATE());
    
    -- Generate a report with the results
    INSERT INTO MetricReports (EmployeeName, ReportDate, ReportContent)
    SELECT e.Name,
           CURRENT_DATE(), 
           CASE 
               WHEN (SELECT Value FROM MetricValues WHERE MetricID = 9 AND Date = CURRENT_DATE() AND EmployeeID = e.EmployeeID) >= (SELECT Value FROM DailyObjectives WHERE Date = CURRENT_DATE() AND EmployeeID = e.EmployeeID) THEN 'Achieved Target'
               ELSE CONCAT('Did Not Achieve Target (', 
                        (SELECT CONCAT(FORMAT((SELECT Value FROM MetricValues WHERE MetricID = 9 AND Date = CURRENT_DATE() AND EmployeeID = e.EmployeeID) / (SELECT Value FROM DailyObjectives WHERE Date = CURRENT_DATE() AND EmployeeID = e.EmployeeID) * 100, 2), '%'))
                   )
           END AS ReportContent
    FROM Employees e;
END $$

DELIMITER ;



