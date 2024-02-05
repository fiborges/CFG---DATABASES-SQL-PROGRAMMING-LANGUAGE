USE RetailSalesDB;

DELIMITER $$

CREATE TRIGGER UpdateEmployeeMetrics
AFTER INSERT ON MetricValues FOR EACH ROW
BEGIN
    UPDATE EmployeeMetrics em
    SET em.TargetStatus = (
        SELECT 
            CASE 
                WHEN subquery.AvgPercentage >= 100 THEN CONCAT('Achieved Target (', FORMAT(subquery.AvgPercentage, 2), '%)')
                ELSE CONCAT('Did Not Achieve Target (', FORMAT(subquery.AvgPercentage, 2), '%)')
            END
        FROM (
            SELECT
                mv.EmployeeID,
                AVG(CASE WHEN mv.MetricID = 9 THEN mv.Value END) AS AvgPercentage
            FROM MetricValues mv
            WHERE mv.Date BETWEEN '2023-01-01' AND '2023-12-31'
            GROUP BY mv.EmployeeID
        ) subquery
        WHERE em.EmployeeID = subquery.EmployeeID
    )
    WHERE em.EmployeeID = NEW.EmployeeID;
END$$

DELIMITER ;
