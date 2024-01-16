/*CUSTOMER DATABASE*/
CREATE DATABASE customers;
USE customers;
 -- Design and create a relational normalised database called customers.
 -- CUSTOMER_DETAILS id,fname,lname
 CREATE TABLE customer_details(
	customer_id INT NOT NULL PRIMARY KEY ,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL
 );
 -- ADDRESS id,building#,city,street,post_code,country,address_customer_id
 CREATE TABLE address(
	address_id INT NOT NULL PRIMARY KEY,
    building_number INT NOT NULL,
    city VARCHAR(50),
    street VARCHAR(50),
    post_code VARCHAR(30),
    country VARCHAR(30),
    address_customer_id INT NOT NULL
 );
 -- EMAIL_ADDRESS id,email_address,email_customer_id
  CREATE TABLE _email_address(
	email_address_id INT NOT NULL PRIMARY KEY,
    email_address VARCHAR(50),
    email_customer_id INT NOT NULL
 );
 -- PHONE_NUMBER id,phone_number_customer_id, number
   CREATE TABLE phone_numbers(
	phone_number_id INT NOT NULL PRIMARY KEY,
    phone_number VARCHAR(50),
    phone_number_customer_id INT NOT NULL
 );
 -- ORDERS order_id, order_date,orders_customer_id
   CREATE TABLE orders(
	orders_id INT NOT NULL PRIMARY KEY,
    order_date VARCHAR(50),
    orders_customer_id INT NOT NULL
 );
 -- Set reasonable primary keys to the tables. 
 /*Set NOT NULL constraints on the columns that you think must have values.*/
 -- Add some data to the tables in the customers database
INSERT INTO customer_details
(customer_id, f_name, l_name) 
VALUES 
(1, 'Jon', 'Flanders'),
(2, 'Sam', 'Smith');
-- SELECT * FROM address;

INSERT INTO address 
(address_id, building_number, street, city, post_code, country,address_customer_id) 
VALUES 
(1, '20', 'Birch Alley', 'London', 'SE24 0AB', 'UK',1),
(2, '17', 'Oak Street', 'London', 'SE25 0XY', NULL,2);

INSERT INTO _email_address 
(email_address_id, email_customer_id, email_address)
VALUES 
(1, 2, 'ssmith@mail.com'),
(2, 1, 'jon@mail.com');
 
 INSERT INTO phone_numbers 
 (phone_number_id, phone_number_customer_id, phone_number) 
 VALUES 
 (1, 1, '555-1212'),
 (2, 2, '555-3344');
 
 INSERT INTO orders 
 (orders_id, orders_customer_id, order_date) 
 VALUES 
 (1, 1, '2019-08-20'),
 (2, 2, '2019-03-15');
 -- SELECT * FROM orders;
 /* Alter tables email_address and phone_numbers in the customers database by
 -- adding Foreign keys that reference Primary keys from relevant tables */
 --  ALTER ;
 ALTER TABLE _email_address
 ADD CONSTRAINT 
 fk_email_address
 FOREIGN KEY
 (email_customer_id)
 REFERENCES 
 customer_details
 (customer_id);
 
  ALTER TABLE phone_numbers
 ADD CONSTRAINT 
 fk_phone_numbers
 FOREIGN KEY
 (phone_number_customer_id)
 REFERENCES 
 customer_details
 (customer_id);
 
 -- DROP TABLE orders;
 