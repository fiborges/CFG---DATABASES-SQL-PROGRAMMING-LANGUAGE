/* ---------------------
   ------- VIEWS -------
   ---------------------  */

--  PART 1 
/* 
CREATE OR REPLACE VIEW view_name - Indicates that you are creating a view and giving it a name.
AS 						 - This keyword is used to introduce the SELECT statement that defines the view.
SELECT column1,2,3..  - Specify the columns you want to include
FROM base_table       - Table from which you are selecting data.
WHERE condition       - Optionally, you can include a WHERE clause to filter the data
WITH CHECK OPTION;    - ensures that any data modifications made through the view 
             (e.g., INSERT, UPDATE) will adhere to the specified condition in the view's WHERE clause.*/

/* 1. Using the shop dabase and Sales1 table, create a view called 'vw_salesmen'
 selecting only the sales person and sales amount columns */
 USE shop;



-- 2. Use the view to find out the maximum sales mount for each sales person, 
-- where the sale was over £70. 




-- PART 2 

-- 1. Create a new database called 'practice' 



/* 2. Create a table in the 'practice' database called 'staff' that contains information about staff, their names, 
departments, salary figures */

CREATE TABLE staff (
  employeeID INT NOT NULL,
  firstname VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  jobtitle VARCHAR(45) NOT NULL,
  managerID INT NOT NULL,
  department VARCHAR(45) NULL,
  salary INT NULL DEFAULT 0,
  dateofbirth DATE NULL DEFAULT '1900-01-01',
  CONSTRAINT pk_staff PRIMARY KEY (employeeID));

INSERT INTO 
staff (employeeID, firstName, lastName, jobtitle, managerID, department, salary, dateofbirth) 
VALUES
(1245, 'Julie', 'Smith', 'DBA', '3333', 'Database Administrators', 50000, '1985-10-20'),
(4578, 'Jame', 'Blogs', 'DBA', '3333', 'Database Administrators', 52000, '1970-10-22');

/* 3. Create a new view called 'vw_staff_common' using the staff tabe, that includes
 all columns apart from salary and date of birth and a filter to only show staff with a job title 
 that contains 'DB' */



-- 4. Insert the below value into the original staff table through the 'vw_staff_common' view
-- (8888,'Mike', 'Davies', 'Developer', 2323, 'Database Administrators');



-- 5. Query the view and the original table to see if the new data is visible
SELECT * FROM staff;
SELECT * FROM vw_staff_common;


/* 6. Create another view that is the same as the previous but call it 'vw_staff_common2' and include the
WITH CHECK OPTION and the end of the query */



/* 7. Try and insert the below values into the original staff table through the 'vw_staff_common2' view 
(5555, 'Thomas', 'Fisher', 'Developer', 8989, 'Database Administrators')*/



/* 8. Try and insert the below values into the original staff table through the 'vw_staff_common2' view 
(5555, 'Thomas', 'Fisher', 'DB Developer', 8989, 'Database Administrators')*/


-- 9. Query the view and the original table to see if the new data is visible
SELECT * FROM staff;
SELECT * FROM vw_staff_common2;

/* -----------------------
   -- STORED PROCEDURES --
   -----------------------  */
   
-- PART 1

/* Create a simple greetings stored procedure to get the gist of procs syntax and structure. 
- Call the procedure 'Greetings', with two input parameters 'GreetingsWord' VARCHAR(100) and FirstName VARCHAR(100)
- We want to return a concatenate of our greetings word and first name, with a space in between. 
- HINT: declare a variable of what we want to output, set it and then call that variable!

Remember we need to use the below syntax structure:

use <db name>							- what database do we want to use
DELIMITER //  							- change our delimiter	
CREATE PROCEDURE <proc_name>()	- create the procedure using our input parameters
BEGIN	
	DECLARE <variable name> <variable type>; - set of instructions
	<proc_logic>	
END //
DELIMITER ; */



-- CALL <proc_name>();
 /*Call the stored procedure using the below input parameters
 1. Greetings Word = Bonjour, Name = Dave
 2. Greetings Word = Hola, Name = Dora
 3. Greetings Word = Terve, Name = Elena */
 

 

-- PART 2

/* Write a stored procedure that accepts parameters and inserts values into a table in the bakery db. 
- Call the procedure 'InsertValue', which will insert data into our sweet table in the bakery db
- There are three input parameters 'id' INT, sweetItem VARCHAR(100), price FLOAT
- HINT: we need to state 'IN' before each parameter is defined when we create the stored procedure, 
  this tells the db that the parameter will be passed by the calling user into the procedure. 
*/



-- Use the new procedure to insert the below data into the sweet table
-- (11, 'cherry_cake', 5)


/* ----------------------------
   -- USER DEFINED FUNCTIONS --
   ----------------------------  */

/*
 Using the bank DB write a stored function that accepts customer account's balance as a parameter
 and is assessing whether he/she is eligible for a credit. 
- Call the function 'is_eligible' with 1 input parameter 'balace' INT
- Return a VARCHAR(20), using a declared variable called customer_status within the function
- Use the below logic to determine eligibility:
	- balance > 100 then 'Yes'
	- balance between 50 and 100 then 'Maybe'
   - balance <50 then 'No'

Remember we need to use the below syntax structure
DELIMITER // 
CREATE FUNCTION <func_name>(param TYPE)
RETURNS <data type>
DETERMINISTIC       -- returns the same results if given the same input values. 
                    If the function's result can vary for the same input, you would omit this keyword 
                    e.g when getting random numbers or getting the current time stamp.
BEGIN	
	DECLARE <variable>;
	<func_logic>	

RETURN(<result>)
END //
DELIMITER ;
*/

/* Use the is_eligible function on the accounts table to show which accounts are eligible, return their name, surname, 
balance and the result of the is_eligible function. */



/* ------------------
   ---- TRIGGERS ----
   ------------------ */

/* Using the sweet table in the bakery database create a trigger that will activate before the INSERT statement on inserted values
- Call the trigger 'sweetItem_Before_Insert'
- Before insert on the table for each row set the item name equal to NEW.item_name with the below logic - this capitalises the 
first letter, and uses lower case for all other letters
CONCAT(UPPER(SUBSTRING(NEW.item_name,1,1)), LOWER(SUBSTRING(NEW.item_name FROM 2)))

Use the base syntax below: 

DELIMITER //
CREATE TRIGGER <trigger_name>
<trigger_time> <trigger_event>   ---trigger time = BEFORE or AFTER  trigger_event = INSERT, UPDATE, or DELETE
ON <table_name> 
FOR EACH ROW
BEGIN
 SET <ruleset>

END //
DELIMITER ;
*/
USE bakery;


-- Insert the below data into the sweet table 
-- (123, 'apple PiE', 1.2),
-- (456, 'caramel slice', 0.9),
-- (789, 'YUM YUM', 0.65)

-- The OLD keyword gets a value from the rows that is being updated or deleted 
-- BEFORE UPDATE trigger to enforce a price change policy
DELIMITER //
CREATE TRIGGER enforce_price_change_policy
BEFORE UPDATE ON sweet
FOR EACH ROW
BEGIN
    -- If the price is being decreased, set it to the old price
    IF NEW.price < OLD.price THEN SET NEW.price = OLD.price;
    END IF;
    /* 
    IF NEW.price < OLD.price THEN SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'Price decrease is not allowed';
    END IF;*/
END;
//
DELIMITER ;

UPDATE sweet SET price = 0.53 WHERE item_name = 'croissant'; -- wont change price
UPDATE sweet SET price = 1.60 WHERE  item_name = 'croissant'; -- changes price

DROP TRIGGER enforce_price_change_policy;

/* ----------------
   ---- EVENTS ----
   ---------------- */
   
/* 1. Create a one off event called 'one_time_event'
- Log the event in a table called 'monitoring events' in the practice db using the below code to create the table
- The event will log timestamp values into the Last_Update column
- Schedule the event for 1 minute after the event has been created
*/

-- Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;

-- Create the table to store the event
USE practice;

CREATE TABLE monitoring_events
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));

/*
Use the base syntax below to create an event:

DELIMITER //
CREATE EVENT <event_name>
   ON SCHEDULE <time_stamp>			-- example: ON SCHEDULE AT NOW() + INTERVAL 7 SECOND
DO BEGIN 
	<event_body>;
END //
DELIMITER ;

*/

-- Check the monitoring_events table in 1 minute to check the event has succesfully completed




/* 2. Write a recurring event called 'recurring_time_event'
- Log the event in a table called 'monitoring_events_version2 events' in the practice db using the below code to create the table
- The event will log timestamp values into the Last_Update column
- Schedule the event to run every 2 seconds after the event has been created
- ON SCHEDULE EVERY 2 MINUTE
*/

CREATE TABLE monitoring_events_version2
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));




-- Check the monitoring_events_version2 table to check the event is succesfully running 




-- Drop the monitoring_events_version2 table and the recurring_time_event, otherwise this event will keep on running!
DROP TABLE monitoring_events_version2;
DROP EVENT recurring_event;