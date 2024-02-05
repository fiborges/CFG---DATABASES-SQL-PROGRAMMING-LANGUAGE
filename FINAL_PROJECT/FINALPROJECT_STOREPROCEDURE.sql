USE RetailSalesDB;

USE RetailSalesDB;

DELIMITER $$

CREATE PROCEDURE UpdateMetricValues(IN target_date DATE)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur_employee INT;
    DECLARE metric_value DECIMAL(10, 2);
    DECLARE total_sales DECIMAL(10, 2);
    DECLARE total_customers INT;
    DECLARE total_receipts INT;
    DECLARE total_units_sold INT;
    DECLARE daily_target DECIMAL(10, 2);
    DECLARE cur_cursor CURSOR FOR SELECT EmployeeID FROM Employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_cursor;

    read_loop: LOOP
        FETCH cur_cursor INTO cur_employee;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- TotalSalesValue
        SELECT COALESCE(SUM(ValueInEuros), 0) INTO total_sales
        FROM SalesByEmployee
        WHERE EmployeeID = cur_employee AND Date = target_date;
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 1, total_sales, target_date)
        ON DUPLICATE KEY UPDATE Value = total_sales;

        -- CustomerEntries
        SELECT COALESCE(SUM(CustomersServed), 0) INTO total_customers
        FROM DailyCustomers
        WHERE EmployeeID = cur_employee AND Date = target_date;
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 2, total_customers, target_date)
        ON DUPLICATE KEY UPDATE Value = total_customers;

        -- ReceiptsIssued
        SELECT COALESCE(SUM(ReceiptsIssued), 0) INTO total_receipts
        FROM DailyReceipts
        WHERE EmployeeID = cur_employee AND Date = target_date;
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 3, total_receipts, target_date)
        ON DUPLICATE KEY UPDATE Value = total_receipts;

        -- UnitsSold
        SELECT COALESCE(SUM(UnitsSold), 0) INTO total_units_sold
        FROM UnitsSold
        WHERE EmployeeID = cur_employee AND Date = target_date;
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 4, total_units_sold, target_date)
        ON DUPLICATE KEY UPDATE Value = total_units_sold;

        -- DailyTarget
        SELECT COALESCE(DailyObjective, 0) INTO daily_target
        FROM DailyObjectives
        WHERE EmployeeID = cur_employee AND Date = target_date;
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 5, daily_target, target_date)
        ON DUPLICATE KEY UPDATE Value = daily_target;

        -- CrossSaleRatio
        SET metric_value = IF(total_receipts = 0, 0, total_units_sold / total_receipts);
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 6, metric_value, target_date)
        ON DUPLICATE KEY UPDATE Value = metric_value;

        -- ServicePercentage
        SET metric_value = IF(total_customers = 0, 0, total_receipts / total_customers * 100);
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 7, metric_value, target_date)
        ON DUPLICATE KEY UPDATE Value = metric_value;

        -- AverageReceiptValue
        SET metric_value = IF(total_receipts = 0, 0, total_sales / total_receipts);
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 8, metric_value, target_date)
        ON DUPLICATE KEY UPDATE Value = metric_value;

        -- TargetAchievementPercentage
        SET metric_value = IF(daily_target = 0, 0, total_sales / daily_target * 100);
        INSERT INTO MetricValues (EmployeeID, MetricID, Value, Date)
        VALUES (cur_employee, 9, metric_value, target_date)
        ON DUPLICATE KEY UPDATE Value = metric_value;

    END LOOP read_loop;

    CLOSE cur_cursor;
END$$

DELIMITER ;



-- DEBUG
-- SET SQL_SAFE_UPDATES = 0;

-- DELETE FROM MetricValues WHERE Date = '2013-12-01';










