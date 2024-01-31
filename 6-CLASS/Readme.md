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

