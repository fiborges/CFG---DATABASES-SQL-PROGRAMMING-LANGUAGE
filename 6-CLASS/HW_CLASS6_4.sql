-- HOMEWORK - EVENT
USE customers;

CREATE TABLE IF NOT EXISTS archived_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    orders_customer_id INT,
    order_date DATE
);

DELIMITER //

CREATE EVENT ArchiveOldOrders
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    INSERT INTO archived_orders (order_id, orders_customer_id, order_date)
    SELECT order_id, orders_customer_id, order_date
    FROM orders
    WHERE order_date < CURDATE() - INTERVAL 1 YEAR;

    DELETE FROM orders
    WHERE order_date < CURDATE() - INTERVAL 1 YEAR;
END //

DELIMITER ;

/*
Explanation: The ArchiveOldOrders event runs daily, selecting orders from the orders 
table that are over a year old and inserting them into the archived_orders table. Then, 
these old orders are deleted from the orders table, keeping it focused on more recent data.
*/

