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

10. LIMIT Operator:
Description: Limits the number of rows returned in the result set.
Example:
sql
Copy code
SELECT * FROM orders LIMIT 10;
Estes são resumos mais breves para cada comando e operador SQL mencionado. Espero que isso atenda às suas expectativas.
