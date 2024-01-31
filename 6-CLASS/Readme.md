# SQL Views

## Overview

In SQL, a **view** is commonly known as a virtual table. It is a powerful feature that allows you to create a virtual snapshot or representation of a table or multiple tables based on the result set of a SQL statement. Views do not store any data themselves but serve as a convenient way to simplify complex queries and enhance data security.

### Key Points

- A view is based on a SELECT statement and is stored as an object in the database.
- The tables referenced in views are known as base tables.
- Views provide a layer of abstraction, and users accessing them do not have direct access to the underlying database tables.
- Nested views can be created, allowing one view to be based on another view, creating a hierarchy.

## Creating a View

To create a view, you can use the following syntax:

```sql
CREATE VIEW <view_name> AS
SELECT [(column list)]
FROM <table_name>
-- Add any query elements here, such as joins, filters, etc.

```
## Example
Let's create a view named my_view that retrieves data from tables T1, T2, and T3:

```sql

CREATE VIEW my_view AS
SELECT column1, column2
FROM T1
INNER JOIN T2 ON T1.id = T2.id
LEFT JOIN T3 ON T2.id = T3.id;
```

## Advantages of Views
### Simplified queries: 
  Views allow you to summarize data from various tables and contain complex logic, making queries more straightforward.
### Data security: 
  You can restrict access to data by using the SELECT statement with a WHERE clause within views.

## Restrictions
While views are powerful, there are some restrictions to consider:

A view is not updatable if it contains aggregate functions, DISTINCT, GROUP BY, HAVING, UNION, or certain types of joins.
Subqueries in the select list or WHERE clause may restrict updatability.
Views referring to literal values or having multiple references to the same column of a base table can be non-updatable.

## WITH CHECK OPTION
To maintain the consistency of views, you can use the WITH CHECK OPTION clause when creating a view. It prevents modifying rows in a way that would remove them from the view's result set.

### Example
Suppose we have a view that reveals partial data of a table. To ensure consistency, we can create it with WITH CHECK OPTION:

```sql

CREATE VIEW partial_data AS
SELECT column1, column2
FROM my_table
WHERE some_condition
WITH CHECK OPTION;
```
# TASK 1

Within your database, create a table named Staff to store information about staff members, including their names, departments, and salary figures. Here's an example SQL query to create the table:
```sql

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
```
### Insert Data
Insert some sample data into the Staff table using INSERT statements. You can manually add staff members or use dummy data for practice.

### Create a View (Without Salary)
Create a view named StaffInfo based on the Staff table. This view should exclude the Salary column. Here's how to create the view:
```sql

CREATE VIEW StaffInfo AS
SELECT StaffID, FirstName, LastName, Department
FROM Staff;
```
### Insert Data through the View
Attempt to insert new data into the StaffInfo view. You should be able to insert data into the underlying Staff table through this view.

### Create Another View (With CHECK OPTION)
Create another view named StaffWithCheck based on the Staff table. This time, add the WITH CHECK OPTION clause to ensure data consistency. Here's how to create the view:
```sql

CREATE VIEW StaffWithCheck AS
SELECT StaffID, FirstName, LastName, Department, Salary
FROM Staff
WITH CHECK OPTION;
```
### Insert Data through the Check View
Attempt to insert new data into the StaffWithCheck view. Ensure that you insert data consistent with the view's filter conditions.

# Working with Stored Procedures and Stored Functions
## Stored Procedures
### What is a Stored Procedure?
A stored procedure is a subroutine available to applications that access a relational database system.
It contains one or more SQL statements stored in the database.
Typically used for Data Validation and Access Control Methods.
Often referred to as a "sproc" or procedure.
Parameters are used to pass values from the calling program.

### Advantages of Stored Procedures
Helps in code reusability by creating a procedure for a specific task and reusing it when needed, reducing overhead.
Avoids unnecessary network traffic by executing code directly on the database.
Encapsulates business logic, making code more maintainable.
Delegates access rights and enhances security.
Protects against SQL Injection attacks.

### Creating a Stored Procedure
```sql

DELIMITER //
CREATE PROCEDURE <proc_name>()
BEGIN
    DECLARE <variable>;
    -- Procedure logic
END//
DELIMITER ;
```
### Calling a Stored Procedure
To execute a stored procedure, use the CALL keyword:

```sql

CALL <proc_name>();
```
## Stored Functions
### What is a Stored Function?
A stored function is an executable database object with SQL procedural code.
Often called a User Defined Function (UDF) or just a function.
Cannot modify the database using INSERT, UPDATE, or DELETE statements.
Used in SQL queries similar to built-in functions.
Returns a single value (scalar function).

### Creating a Stored Function
```sql

DELIMITER //
CREATE FUNCTION <func_name>(param TYPE)
RETURNS TYPE
BEGIN
    DECLARE <variable>;
    -- Function logic
    RETURN (<result>);
END//
DELIMITER ;
```

## Differences Between Procedure and Function
### Stored Procedure:

Returns many values.
Supports input and output parameters.
Cannot be used directly in SELECT statements.
Can call functions.
May not return a value.
Used for reading and modifying data (e.g., INSERT, UPDATE, DELETE, SELECT).
Manages transactions.

### Stored Function:

Returns only one value.
Uses only input parameters.
Can be used in SELECT statements.
Cannot call procedures.
Must return a value.
Used for reading data (e.g., SELECT).
Does not manage transactions.


# TASK 2

## Write a Stored Function to Assess Credit Eligibility
In this task, we will write a stored function in the bank database that accepts a customer's account balance as a parameter and assesses whether the customer is eligible for a credit. Let's assume that a customer is eligible for credit if their account balance is greater than or equal to a certain threshold.

```sql

DELIMITER //
CREATE FUNCTION AssessCreditEligibility(balance DECIMAL(10, 2)) RETURNS VARCHAR(50)
BEGIN
    DECLARE eligibility_status VARCHAR(50);
    
    IF balance >= 1000.00 THEN
        SET eligibility_status = 'Eligible for Credit';
    ELSE
        SET eligibility_status = 'Not Eligible for Credit';
    END IF;
    
    RETURN eligibility_status;
END//
DELIMITER ;
```
### Explanation:

We define a stored function named AssessCreditEligibility that accepts a balance parameter of type DECIMAL(10, 2) (assuming the balance is stored as a decimal with two decimal places).
Inside the function, we declare a variable eligibility_status to store the eligibility status message.
We use an IF statement to check if the balance is greater than or equal to 1000.00 (you can adjust this threshold as needed). If it is, we set eligibility_status to 'Eligible for Credit'; otherwise, it's set to 'Not Eligible for Credit'.
Finally, we return the eligibility_status as the result of the function.

## Create a Simple Greetings Stored Procedure
In this task, we will create a simple stored procedure to display a greeting message.

```sql

DELIMITER //
CREATE PROCEDURE GreetCustomer(IN customer_name VARCHAR(50))
BEGIN
    SELECT CONCAT('Hello, ', customer_name, '! Welcome to our bank.') AS Greeting;
END//
DELIMITER ;
```
### Explanation:

We define a stored procedure named GreetCustomer that accepts an IN parameter called customer_name of type VARCHAR(50).
Inside the procedure, we use a SELECT statement to construct a greeting message by concatenating 'Hello, ' with the customer_name parameter and 'Welcome to our bank.'.
The result is displayed as 'Greeting'.

## Write a Stored Procedure to Insert Values into a Table
In this task, we will write a stored procedure that accepts parameters and inserts values into a table in the bakery database.

Assuming you have a table named BakeryOrders with columns OrderID, CustomerName, and OrderAmount, here's a stored procedure to insert values into that table:

```sql

DELIMITER //
CREATE PROCEDURE InsertBakeryOrder(IN order_id INT, IN customer_name VARCHAR(50), IN order_amount DECIMAL(10, 2))
BEGIN
    INSERT INTO BakeryOrders (OrderID, CustomerName, OrderAmount)
    VALUES (order_id, customer_name, order_amount);
END//
DELIMITER ;
```
### Explanation:

We define a stored procedure named InsertBakeryOrder that accepts three IN parameters: order_id (INT), customer_name (VARCHAR), and order_amount (DECIMAL).
Inside the procedure, we use an INSERT INTO statement to insert the provided values into the BakeryOrders table.

# Triggers and Events in Database Management
## Triggers
A trigger is a powerful feature in a database management system that allows you to automate actions when specific database events, such as INSERT, UPDATE, or DELETE operations, occur. Triggers are essential for maintaining data integrity, enforcing business rules, and keeping track of changes in the database.

### Key Concepts:
#### Trigger Execution: 
  Triggers are automatically executed (or fired) in response to predefined database events. These events include INSERT, UPDATE, DELETE, and more.

#### FOR EACH ROW: 
  Triggers are created with the FOR EACH ROW clause, which specifies that the trigger operates on a row-level basis. This means that the trigger can access and manipulate data for each affected row individually.

#### OLD and NEW Keywords: 
  Within a trigger, you can use the OLD keyword to access values from rows that are being updated or deleted, and the NEW keyword to access values from the row that is being inserted or updated. These keywords are useful for comparing old and new data and making decisions based on the changes.

### Common Use Cases:
#### Data Validation: 
  Triggers can enforce data validation rules, ensuring that only valid data is allowed into the database.

#### Audit Trails: 
  Triggers can be used to maintain audit tables, recording every change made to specific tables for tracking purposes.

#### Referential Integrity: 
  Triggers can enforce referential integrity constraints by preventing actions that would violate foreign key relationships.

## Events
Events are another mechanism for automating tasks in a database management system. Unlike triggers, events are time-based and can execute a block of code at a specified time or according to a recurring schedule. They are commonly used for performing maintenance tasks and other actions that are not directly tied to specific data changes.

### Key Concepts:
#### Event Scheduler: 
  Events are executed automatically by the event scheduler in the database system. The event scheduler is responsible for triggering events based on predefined schedules.

#### One-Time or Recurring: 
  An event can be defined as a one-time event, which executes a specific action once, or as a recurring event, which repeats the action at regular intervals.

### Common Use Cases:
#### Scheduled Backups: 
  Events can be set up to perform automated database backups at specific times, ensuring data reliability.

#### Data Archiving: 
  You can use events to archive old data by moving it to a historical storage location, keeping the primary database optimized.

#### Database Maintenance: 
  Events can trigger routine maintenance tasks such as optimizing database tables, cleaning up temporary data, or updating statistics.
