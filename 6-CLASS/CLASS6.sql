-- Views
-- PART 1: Create a View in the 'shop' Database

-- To create a view named 'vw_salesmen' that selects only the 'sales person' and 'sales amount' columns from the 'Sales1' table in the 'shop' database, you can use the following SQL command:

USE shop;

CREATE OR REPLACE VIEW vw_salesmen AS
SELECT sales_person, sales_amount
FROM Sales1;

-- PART 2: Find the Maximum Sales Amount for Each Salesperson

-- To use the 'vw_salesmen' view to find the maximum sales amount for each salesperson where the sale was over £70, you can execute the following SQL query:

SELECT sales_person, MAX(sales_amount) AS max_sales_amount
FROM vw_salesmen
WHERE sales_amount > 70
GROUP BY sales_person;

-- Creating a New Database and Table
-- PART 2: Create a New Database Called 'practice'

-- To create a new database named 'practice,' you can use the following SQL command:

CREATE DATABASE practice;

-- PART 3: Create a Table in the 'practice' Database

-- To create a table named 'staff' in the 'practice' database, you can use the following SQL command:

USE practice;

CREATE TABLE staff (
  employeeID INT NOT NULL,
  firstname VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  jobtitle VARCHAR(45) NOT NULL,
  managerID INT NOT NULL,
  department VARCHAR(45) NULL,
  salary INT NULL DEFAULT 0,
  dateofbirth DATE NULL DEFAULT '1900-01-01',
  CONSTRAINT pk_staff PRIMARY KEY (employeeID)
);
-- PART 3: Create a View in the 'practice' Database

-- To create a view named 'vw_staff_common' using the 'staff' table in the 'practice' database, which includes all columns except 'salary' and 'date of birth' and filters to only show staff with a job title containing 'DB,' you can use the following SQL command:

CREATE OR REPLACE VIEW vw_staff_common AS
SELECT employeeID, firstname, lastname, jobtitle, managerID, department
FROM staff
WHERE jobtitle LIKE '%DB%';

-- PART 4: Insert Data Using the View

-- To insert data into the original 'staff' table through the 'vw_staff_common' view, you can use the following SQL command:

INSERT INTO vw_staff_common (employeeID, firstname, lastname, jobtitle, managerID, department)
VALUES (8888, 'Mike', 'Davies', 'Developer', 2323, 'Database Administrators');

-- PART 6: Create Another View with CHECK OPTION

-- To create another view named 'vw_staff_common2' with the 'WITH CHECK OPTION' at the end of the query, you can use the following SQL command:

CREATE OR REPLACE VIEW vw_staff_common2 AS
SELECT employeeID, firstname, lastname, jobtitle, managerID, department
FROM staff
WHERE jobtitle LIKE '%DB%'
WITH CHECK OPTION;

-- PART 7: Insert Data Using the View with CHECK OPTION

-- To try inserting data into the original 'staff' table through the 'vw_staff_common2' view, you can use the following SQL command:

INSERT INTO vw_staff_common2 (employeeID, firstname, lastname, jobtitle, managerID, department)
VALUES (5555, 'Thomas', 'Fisher', 'Developer', 8989, 'Database Administrators');

-- PART 8: Try Inserting Data with a Different Job Title

-- To try inserting data with a different job title into the original 'staff' table through the 'vw_staff_common2' view, you can use the following SQL command. This should fail because the view has the 'WITH CHECK OPTION' and restricts data based on job title:

INSERT INTO vw_staff_common2 (employeeID, firstname, lastname, jobtitle, managerID, department)
VALUES (5555, 'Thomas', 'Fisher', 'DB Developer', 8989, 'Database Administrators');

-- Stored Procedures
-- PART 1: Create a Simple Greetings Stored Procedure

-- To create a simple greetings stored procedure called 'Greetings' with two input parameters 'GreetingsWord' (VARCHAR(100)) and 'FirstName' (VARCHAR(100)), which returns a concatenated greeting, you can use the following SQL command:

DELIMITER //
CREATE PROCEDURE Greetings(IN GreetingsWord VARCHAR(100), IN FirstName VARCHAR(100))
BEGIN
    DECLARE GreetingMessage VARCHAR(200);
    SET GreetingMessage = CONCAT(GreetingsWord, ' ', FirstName);
    SELECT GreetingMessage;
END //
DELIMITER ;

-- To call the 'Greetings' procedure with different input parameters, you can use the following SQL commands:

-- Call the procedure with different parameters
CALL Greetings('Bonjour', 'Dave');
CALL Greetings('Hola', 'Dora');
CALL Greetings('Terve', 'Elena');

-- PART 2: Write a Stored Procedure to Insert Data

-- To write a stored procedure called 'InsertValue' that accepts three input parameters 'id' (INT), 'sweetItem' (VARCHAR(100)), and 'price' (FLOAT) and inserts data into the 'sweet' table in the 'bakery' database, you can use the following SQL command:

DELIMITER //
CREATE PROCEDURE InsertValue(IN id INT, IN sweetItem VARCHAR(100), IN price FLOAT)
BEGIN
    INSERT INTO bakery.sweet (sweet_id, item_name, price)
    VALUES (id, sweetItem, price);
END //
DELIMITER ;

-- To use the 'InsertValue' procedure to insert data into the 'sweet' table, you can use the following SQL command:

-- Insert data into the sweet table using the procedure
CALL InsertValue(11, 'cherry_cake', 5);
Stored Functions
Using the 'bank' Database:

-- To create a stored function named 'is_eligible' that accepts one input parameter 'balance' (INT) and assesses whether a customer is eligible for credit based on the balance, you can use the following SQL command:

DELIMITER //
CREATE FUNCTION is_eligible(IN balance INT)
RETURNS VARCHAR(20)
BEGIN
    DECLARE customer_status VARCHAR(20);
    
    IF balance > 100 THEN
        SET customer_status = 'Yes';
    ELSEIF balance BETWEEN 50 AND 100 THEN
        SET customer_status = 'Maybe';
    ELSE
        SET customer_status = 'No';
    END IF;
    
    RETURN customer_status;
END //
DELIMITER ;

-- To use the 'is_eligible' function on the 'accounts' table to show which accounts are eligible, you can use the following SQL query:

-- Use the is_eligible function on the accounts table
SELECT customer_name, account_balance, is_eligible(account_balance) AS eligibility
FROM accounts;
Triggers
Using the 'bakery' Database:

-- To create a trigger named 'sweetItem_Before_Insert' that activates before the INSERT statement on inserted values in the 'sweet' table, you can use the following SQL command:

DELIMITER //
CREATE TRIGGER sweetItem_Before_Insert
BEFORE INSERT ON sweet
FOR EACH ROW
BEGIN
    SET NEW.item_name = CONCAT(UPPER(SUBSTRING(NEW.item_name, 1, 1)), LOWER(SUBSTRING(NEW.item_name FROM 2)));
END;
//
DELIMITER ;

-- To insert data into the 'sweet' table and observe the trigger in action, you can use the following SQL commands:

-- Insert data into the sweet table
INSERT INTO sweet (sweet_id, item_name, price) VALUES (123, 'apple PiE', 1.2);
INSERT INTO sweet (sweet_id, item_name, price) VALUES (456, 'caramel slice', 0.9);
INSERT INTO sweet (sweet_id, item_name, price) VALUES (789, 'YUM YUM', 0.65);

-- Creating and Managing Events

-- To create a one-time event called 'one_time_event' that logs timestamp values into a table named 'monitoring events' in the 'practice' database, you can use the following SQL command:

-- Create a one-time event
CREATE EVENT one_time_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
    INSERT INTO practice.monitoring_events (Last_Update) VALUES (NOW());
END;

-- To check if the 'one_time_event' has successfully completed, you can query the 'monitoring events' table after waiting for one minute.

-- To create a recurring event called 'recurring_time_event' that logs timestamp values into a table named 'monitoring events_version2' in the 'practice' database and runs every 2 seconds, you can use the following SQL command:

-- Create a recurring event
CREATE EVENT recurring_time_event
ON SCHEDULE EVERY 2 SECOND
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    INSERT INTO practice.monitoring_events_version2 (Last_Update) VALUES (NOW());
END;

-- To check if the 'recurring_time_event' is successfully running, you can query the 'monitoring events_version2' table.
-- Remember to drop the 'monitoring events_version2' table and the 'recurring_time_event' event if you want to stop the recurring event from running:

DROP TABLE practice.monitoring_events_version2;
DROP EVENT recurring_time_event;
