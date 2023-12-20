-- Create the pizza database
CREATE DATABASE PIZZA;

-- Switch to the PARTS database
USE PIZZA;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    UNIQUE (PhoneNumber)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderedItems Table
CREATE TABLE OrderedItems (
    OrderID INT,
    PizzaName VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    PricePerUnit DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (OrderID, PizzaName),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Popular tabela Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Address, PhoneNumber, Email)
VALUES
  (1, 'João', 'Silva', 'Rua A, 123', '123456789', 'joao@email.com'),
  (2, 'Maria', 'Santos', 'Av. B, 456', '987654321', 'maria@email.com'),
  (3, 'Carlos', 'Oliveira', 'Travessa C, 789', '111223344', 'carlos@email.com');

-- Popular tabela Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (101, 1, '2023-12-15', 25.50),
  (102, 2, '2023-12-16', 30.00),
  (103, 3, '2023-12-17', 15.75);

-- Popular a tabela OrderedItems
INSERT INTO OrderedItems (OrderID, PizzaName, Quantity, PricePerUnit)
VALUES
  (101, 'Margherita', 2, 12.75),
  (102, 'Pepperoni', 1, 30.00),
  (103, 'Vegetariana', 3, 5.25);

/*
Customers Table:

CustomerID is a unique identifier for each customer.
FirstName and LastName are the customer's names, and they cannot be NULL.
Address is the customer's address, which cannot be NULL.
PhoneNumber is the customer's phone number, and it cannot be NULL. It is also set as UNIQUE.
Email is the customer's email address, which can be NULL.
Orders Table:

OrderID is a unique identifier for each order.
CustomerID is a foreign key linking to the Customers table.
OrderDate is the date when the order was placed, and it cannot be NULL.
TotalAmount is the total cost of the order, and it cannot be NULL.
OrderedItems Table:

This table holds information about the items included in each order.
OrderID is a foreign key linking to the Orders table.
PizzaName is the name of the pizza ordered, and it cannot be NULL.
Quantity is the quantity of the pizza ordered, and it cannot be NULL.
PricePerUnit is the price per unit of the pizza, and it cannot be NULL.
*/