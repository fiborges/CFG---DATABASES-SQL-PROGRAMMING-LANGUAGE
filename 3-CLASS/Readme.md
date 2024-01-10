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
