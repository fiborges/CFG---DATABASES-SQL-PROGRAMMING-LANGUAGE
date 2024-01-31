-- HOMEWORK Trigger -- BeforeInsertOrder

-- This trigger will be activated before the insertion of a new order into the 
-- orders table to verify if the orders_customer_id is associated with an existing customer.

DELIMITER //

CREATE TRIGGER BeforeInsertOrder
BEFORE INSERT ON orders FOR EACH ROW
BEGIN
    DECLARE customer_exists INT;
    SELECT COUNT(*) INTO customer_exists FROM customer_details WHERE customer_id = NEW.orders_customer_id;
    IF customer_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
    END IF;
END //

DELIMITER ;

-- INSERT INTO orders (orders_id, orders_customer_id, order_date) VALUES (3, 1, '2024-01-31');
-- INSERT INTO orders (orders_id, orders_customer_id, order_date) VALUES (4, 4, '2024-01-31');




-- Explanation: The BeforeInsertOrder trigger checks if there is a corresponding 
-- customer for the orders_customer_id of the new order. If there is no matching customer, 
-- the trigger prevents the insertion of the order and returns an error message.

