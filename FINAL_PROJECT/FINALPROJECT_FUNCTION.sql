USE RetailSalesDB;

DELIMITER $$

CREATE FUNCTION CheckSalesPerformance(employee_id INT, start_date DATE, end_date DATE) RETURNS VARCHAR(50)
BEGIN
    DECLARE total_sales DECIMAL(10,2);
    DECLARE total_objective DECIMAL(10,2);
    DECLARE performance_ratio DECIMAL(10,2);
    DECLARE performance_output VARCHAR(50);

    -- Calculate total sales for the period
    SELECT COALESCE(SUM(Value), 0) INTO total_sales
    FROM MetricValues
    WHERE EmployeeID = employee_id AND MetricID = 1 AND Date BETWEEN start_date AND end_date;

    -- Calculate the total target for the period
    SELECT COALESCE(SUM(Value), 0) INTO total_objective
    FROM MetricValues
    WHERE EmployeeID = employee_id AND MetricID = 5 AND Date BETWEEN start_date AND end_date;

    -- Avoid division by zero
    IF total_objective = 0 THEN
        RETURN 'Objective Not Defined';
    END IF;

    -- Calculate the performance ratio
    SET performance_ratio = (total_sales / total_objective) * 100;

    -- Define the output based on performance
    IF performance_ratio >= 100 THEN
        SET performance_output = CONCAT('On Target - ', FORMAT(performance_ratio, 2), '%');
    ELSE
        SET performance_output = CONCAT('Underperforming - ', FORMAT(performance_ratio, 2), '%');
    END IF;

    RETURN performance_output;
END$$

DELIMITER ;




