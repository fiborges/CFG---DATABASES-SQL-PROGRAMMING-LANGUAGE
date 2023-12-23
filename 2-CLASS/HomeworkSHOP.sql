-- Create the SHOP database
CREATE DATABASE SHOP;

-- Switch to the SHOP database
USE SHOP;

-- Create the SALES1 table
CREATE TABLE SALES1 (
    Store VARCHAR(50),
    Week INT,
    Day VARCHAR(50),
    SalesPerson VARCHAR(255),
    SalesAmount DECIMAL(10, 2),
    Month VARCHAR(50)
);

-- Populate SALES1 table
INSERT INTO SALES1 (Store, Week, Day, SalesPerson, SalesAmount, Month) VALUES
('London', 2, 'Monday', 'Frank', 56.25, 'May'),
('London', 5, 'Tuesday', 'Frank', 74.32, 'Sep'),
('London', 5, 'Monday', 'Bill', 98.42, 'Sep'),
('London', 5, 'Saturday', 'Bill', 73.90, 'Dec'),
('London', 1, 'Tuesday', 'Josie', 44.27, 'Sep'),
('Dusseldorf', 4, 'Monday', 'Manfred', 77.00, 'Jul'),
('Dusseldorf', 3, 'Tuesday', 'Inga', 9.99, 'Jun'),
('Dusseldorf', 4, 'Wednesday', 'Manfred', 86.81, 'Jul'),
('London', 6, 'Friday', 'Josie', 74.02, 'Oct'),
('Dusseldorf', 1, 'Saturday', 'Manfred', 43.11, 'Apr');
