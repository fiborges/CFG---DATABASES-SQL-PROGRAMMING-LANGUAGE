# Logical Operators
## Comparison Operators
Comparison operators are used to compare the values of operands and produce a logical value (True or False).

```markdown

| Operator | Meaning          | Example   | Result |
|----------|------------------|-----------|--------|
| <        | Less than        | 10 < 3    | False  |
| >        | Greater than     | 10 > 3    | True   |
| <=       | Less than or equal to | 10 <= 3 | False  |
| >=       | Greater than or equal to | 10 >= 3 | True |
| =        | Equal to         | 10 = 3    | False  |
| != or <> | Not equal to     | 10 != 3 or 10 <> 3 | True |

```
## Boolean Operators
Boolean operators are used to combine or exclude keywords in a database search.

```markdown

| Operator | Meaning                                         |
|----------|-------------------------------------------------|
| AND      | Requires both conditions to be in each result row |
| OR       | Either condition (or both) will be in the returned result row |
| IS NOT*  | Negates the condition like the 'not equals' operator, but only used for NULL |

```
### Syntax Example:

```sql

SELECT p.name, p.surname 
FROM person AS p
WHERE p.name = 'Mary' AND p.age > 25;
```

## Logical Operators - Additional
### Between Operator
The BETWEEN operator selects values within a given range.

```markdown

| Operator | Meaning                                      |
|----------|----------------------------------------------|
| BETWEEN  | Selects values within a given range           |

```
#### Syntax Example:

```sql

SELECT c.name, c.surname 
FROM customers c
WHERE c.orders BETWEEN 1 AND 5;

```
### Like Operator
The LIKE operator is used to search for a specific pattern in a column value, with the help of wildcards % and _.

```markdown

| Like Operator | Description |
|---------------|-------------|
| LIKE 'm%'     | Any word/value that starts with 'm' |
| LIKE '%m'     | Any word/value that ends with 'm' |
| LIKE '%or%'   | Any word/value that contains "or" in any position |
| LIKE '_m%'    | Any word/value that has 'm' in the second position |
| LIKE 'm__%'   | Any word/value that starts with 'm' and is at least 3 characters long |
| LIKE 'm%t'    | Any word/value that starts with 'm' and ends with 't' |

```
### Syntax Example:

```sql

SELECT c.name, c.surname 
FROM customers AS c 
WHERE c.name LIKE 'M%';
```

### IN Operator
The IN operator allows specifying multiple values in a WHERE clause.

```markdown

| Operator | Meaning                                              |
|----------|------------------------------------------------------|
| IN       | Allows you to specify multiple values in a WHERE clause |
```

#### Syntax Example:

```sql

SELECT c.name, c.surname 
FROM customers c
WHERE c.name IN ('Mary', 'Julie', 'Katie', 'Jo');

```
### IS Operator
The IS operator, similar to 'equals,' is used for values that might be NULL.

```markdown

| Operator | Meaning                              |
|----------|--------------------------------------|
| IS       | Special operator, used for NULL values |

```
#### Syntax Example:

```sql

SELECT p.surname, p.email_address 
FROM person p
WHERE p.email_address IS NULL;

```
# Aggregation and Order
We not only want to extract data but also organize, understand, interpret, and analyze it. To achieve this, we use the ORDER BY and GROUP BY statements.

## ORDER BY
The ORDER BY clause is used with the SELECT statement to arrange retrieved data in sorted order.

### Syntax Example:

```sql

SELECT p.surname, p.name 
FROM person p 
ORDER BY p.surname;
```
Who are all the customers in our contacts ordered by surname?

## Set Functions
Set functions are 'helper' functions that allow us to ask more interesting, complex questions when querying a database. These functions compute a new value from passed-in column values. Examples of core set functions include COUNT, MAX, MIN, SUM, AVG, and GROUP_CONCAT.

```markdown

| Function | Effect                                                   | 
|----------|----------------------------------------------------------| 
| COUNT    | Count of all column values specified (includes NULL values if * is used) | 
| MAX      | Maximum value of the column (does not include NULL values) | 
| MIN      | Minimum value of the column (does not include NULL values) | 
| SUM      | Sum of all values of the column (does not include NULL values, only numeric column) | 
| AVG      | Average of all values of the column (does not include NULL values, only numeric column) | 
| GROUP_CONCAT | Transforms values from a group of rows into a delimited string |
```

### Syntax Example (SUM):

```sql

SELECT SUM(c.orders) 
FROM customer c;
```
What is the total number of all orders placed by our customers?

### Syntax Example (COUNT with DISTINCT):

```sql

SELECT COUNT(DISTINCT c.name) 
FROM customers c;
```
What is the count of unique first names among our customers' contacts?

## GROUP BY
GROUP BY is a SQL command used to group rows that have the same values. It allows multiple columns with a set function and breaks the result set into subsets, running a set function against each subset.

### Syntax Example:

```sql

SELECT COUNT(DISTINCT c.name), c.name 
FROM customers AS c 
GROUP BY c.name;
```
What is the count of unique first names among our customers' contacts?

## HAVING
The HAVING clause filters records based on summarised GROUP BY results. It is used with aggregate functions.

#### Syntax Example:

```sql

SELECT COUNT(DISTINCT c.name), c.name 
FROM customers AS c 
GROUP BY c.name 
HAVING COUNT(DISTINCT c.name) >= 3;
```
What is the count of unique first names among our customers' contacts that appear at least 3 times?







