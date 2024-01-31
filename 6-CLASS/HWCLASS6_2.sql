-- HOMEWORK -- stored procedure
-- ADD A NEW CLIENT
USE customers;

DELIMITER //

CREATE PROCEDURE InsertCustomer(IN customer_id INT, IN f_name VARCHAR(55), IN l_name VARCHAR(55))
BEGIN
    INSERT INTO customer_details (customer_id, f_name, l_name)
    VALUES (customer_id, f_name, l_name);
END //

DELIMITER ;


