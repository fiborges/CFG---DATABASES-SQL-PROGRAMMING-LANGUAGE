## 1. SELECT Clause:

### Description: 
  Retrieves specific columns from a table.
### Example:
```sql

SELECT name, age FROM employees;
```

## 2. WHERE Clause:
### Description: 
  Filters records based on a specified condition.
### Example:
```sql

SELECT * FROM products WHERE price < 100;
```
## 3. AND, OR, and NOT Operators:
### Description: 
  Combines multiple conditions in a WHERE clause.
### Example:
```sql

SELECT * FROM orders WHERE status = 'Shipped' AND total_amount > 1000;
```

## 4. IN Operator:
### Description: 
  Filters records where a column matches any value in a specified list.
### Example:
```sql

SELECT * FROM students WHERE grade IN ('A', 'B');
```

## 5. BETWEEN Operator:
### Description: 
  Filters results within a specified range.
### Example:
```sql

SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;
```

## 6. LIKE Operator:
### Description: 
  Searches for a specified pattern in a column.
### Example:
```sql

SELECT * FROM products WHERE product_name LIKE 'Laptop%';
```
## 7. REGEXP Operator:
### Description: 
  Filters records based on a regular expression pattern.
### Example:
```sql

SELECT * FROM contacts WHERE phone_number REGEXP '^[0-9]{3}-[0-9]{4}$';
```
## 8. IS NULL Operator:
### Description: 
  Filters records where a column is NULL.
### Example:
```sql

SELECT * FROM customers WHERE email IS NULL;
```
## 9. ORDER BY Operator:
### Description: 
  Sorts the result set based on one or more columns.
### Example:
```sql

SELECT * FROM products ORDER BY price DESC;

```

## 10. LIMIT Operator:
### Description: 
  Limits the number of rows returned in the result set.
### Example:
```sql

SELECT * FROM orders LIMIT 10;
```
## 11. Inner Joins:
### Description: 
  Retrieves records that have matching values in both tables.
### Example:
```sql

SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;
```

## 12. Joining Across Databases:
### Description: 
  Joins tables from different databases.
### Example:
```sql

SELECT customers.name, orders.order_id
FROM db1.customers
INNER JOIN db2.orders ON customers.customer_id = orders.customer_id;
```
## 13. Self Joins:
### Description: 
  Joins a table with itself.
### Example:
```sql

SELECT e1.name, e2.manager_name
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.employee_id;

```
## 14. Joining Multiple Tables:
### Description: 
  Combines data from three or more tables.
### Example:
```sql

SELECT customers.name, orders.order_id, order_details.product_name
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
INNER JOIN order_details ON orders.order_id = order_details.order_id;
```

## 15. Compound Join Conditions:
### Description: 
  Uses multiple conditions for joining tables.
### Example:
```sql

SELECT *
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
AND employees.salary > 50000;
```
## 16. Implicit Join Syntax:
### Description: 
  Uses commas in the FROM clause for implicit joins.
### Example:
```sql

SELECT customers.name, orders.order_id
FROM customers, orders
WHERE customers.customer_id = orders.customer_id;
```

## 17. Outer Joins:
### Description: 
  Retrieves matching records and non-matching records from one table.
### Example:
```sql

SELECT customers.name, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```
## 18. Outer Join Between Multiple Tables:
### Description: 
  Extends outer joins to multiple tables.
### Example:
```sql

SELECT customers.name, orders.order_id, shipments.shipment_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
LEFT JOIN shipments ON orders.order_id = shipments.order_id;
```
## 19. Self Outer Joins:
### Description: 
  Retrieves all records from a table, including non-matching ones.
### Example:
```sql

SELECT e1.name, e2.manager_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;
```
## 20. USING Clause:
### Description: 
  Simplifies join conditions for columns with the same name.
### Example:
```sql

SELECT customers.name, orders.order_id
FROM customers
INNER JOIN orders USING (customer_id);
```
## 21. Natural Joins:
### Description: 
  Joins tables based on columns with the same name.
### Example:
```sql

SELECT customers.name, orders.order_id
FROM customers
NATURAL JOIN orders;
```

## 22. Cross Joins:
### Description: 
  Generates the Cartesian product of two tables.
### Example:
```sql

SELECT customers.name, products.product_name
FROM customers
CROSS JOIN products;
```

## 23. Unions:
### Description: 
  Combines the result sets of two or more SELECT statements.
### Example:
```sql

SELECT product_name FROM electronics
UNION
SELECT product_name FROM appliances;
```

## 24. Column Attributes:
### Description: 
  Specifies column attributes like alias and data type.
### Example:
```sql

SELECT first_name AS "First", last_name AS "Last"
FROM employees;
```
## 25. Inserting a Single Row:
### Description: 
  Adds a single row of data to a table.
### Example:
```sql

INSERT INTO employees (first_name, last_name, salary)
VALUES ('John', 'Doe', 60000);
```
## 26. Inserting Multiple Rows:
### Description: 
  Adds multiple rows of data to a table.
### Example:
```sql

INSERT INTO employees (first_name, last_name, salary)
VALUES ('Alice', 'Smith', 55000), ('Bob', 'Jones', 60000);

```

## 27. Inserting Hierarchical Rows:
### Description: 
  Adds rows with hierarchical relationships to a table.
### Example:
```sql

INSERT INTO employees (employee_id, name, manager_id)
VALUES (1, 'John', NULL), (2, 'Alice', 1), (3, 'Bob', 1);
```
## 28. Creating a Copy of a Table:
### Description: 
  Creates a new table with the same structure as an existing one.
### Example:
```sql

CREATE TABLE new_employees AS SELECT * FROM employees;
```
## 29. Updating a Single Row:
### Description: 
  Modifies data in a single row.
### Example:
```sql

UPDATE employees SET salary = 65000 WHERE employee_id = 1;
```
## 30. Updating Multiple Rows:
### Description: 
  Modifies data in multiple rows.
### Example:
```sql

UPDATE employees SET department = 'IT' WHERE department = 'HR';
```
## 31. Using Subqueries in Updates:
### Description: 
  Updates rows based on the result of a subquery.
### Example:
```sql

UPDATE employees
SET manager_id = (SELECT employee_id FROM employees WHERE name = 'Manager')
WHERE department = 'Sales';
```
## 32. Deleting Rows:
### Description: 
  Removes one or more rows from a table.
### Example:
```sql

DELETE FROM customers WHERE last_purchase_date < '2022-01-01';
```
## 33. Restoring Course Databases:
### Description: 
  Restores a database to a previous state.
### Example: (Assuming you have a backup file)
```sql

DROP DATABASE course_database;
CREATE DATABASE course_database;
USE course_database;
SOURCE /path/to/backup_file.sql;
```
