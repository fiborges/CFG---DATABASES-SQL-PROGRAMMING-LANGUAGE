-- Homework function

USE customers;

DELIMITER //

CREATE FUNCTION GetFullName(customer_id INT) RETURNS VARCHAR(110)
BEGIN
    DECLARE full_name VARCHAR(110);
    SELECT CONCAT(f_name, ' ', l_name) INTO full_name
    FROM customer_details
    WHERE customer_details.customer_id = customer_id;
    RETURN full_name;
END //

DELIMITER ;



