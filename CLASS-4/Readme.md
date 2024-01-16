# Inner Join
The INNER JOIN is the most typical JOIN, linking columns from two tables based on a related column. It returns rows when there is at least one match in both tables. However, it cannot handle NULL values.

## Syntax:
```sql

SELECT <alias1>.<column_name>, <alias1>.<column_name>, <alias2>.<column_name>
FROM <table_name1> <alias1> INNER JOIN
<table_name2> <alias2>
ON
<alias1>.<column_name> = <alias2>.<column_name>;
```

### Example:
```sql

-- What are our customers’ email addresses?
SELECT
c.name, c.surname, e.email_address
FROM customers c
INNER JOIN
email_address e
ON
c.customer_id = e.email_address_customer_id;
```
# Left Outer Join
The LEFT OUTER JOIN returns all rows from the left table and matching rows from the right table. If there is no match in the right table, it returns NULL values.

## Syntax:
```sql

SELECT <alias1>.<column_name>, <alias1>.<column_name>, <alias2>.<column_name>
FROM <table_name1> <alias1> LEFT JOIN
<table_name2> <alias2>
ON
<alias1>.<column_name> = <alias2>.<column_name>;
```

### Example:
```sql

-- What are our customers’ email addresses, including those that we don’t have an email address for?
SELECT
c.name, c.surname, e.email_address
FROM customers c
LEFT JOIN
email_address e
ON
c.customer_id = e.email_address_customer_id;
```

# Right Outer Join
The RIGHT OUTER JOIN is the opposite of the LEFT OUTER JOIN. It returns all rows from the right table with matching rows from the left table. If there is no match in the left table, it returns NULL values.

## Syntax:
```sql

SELECT <alias1>.<column_name>, <alias1>.<column_name>, <alias2>.<column_name>
FROM <table_name1> <alias1> RIGHT JOIN
<table_name2> <alias2>
ON
<alias1>.<column_name> = <alias2>.<column_name>;
```
### Example:
```sql

-- What are the email addresses we have, including those emails that we don’t have a matching customer for?
SELECT
c.name, c.surname, e.email_address
FROM customers c
RIGHT JOIN
email_address e
ON
c.customer_id = e.email_address_customer_id;
```
# Full Outer Join (Simulated)
The FULL OUTER JOIN combines the results of both LEFT and RIGHT OUTER JOINs, returning rows when conditions are met and NULL values when there is no match. Although MySQL doesn't support FULL OUTER JOIN syntax, you can simulate it by combining LEFT and RIGHT JOINs with UNION.

## Example:
```sql

-- Simulating FULL OUTER JOIN
SELECT <columns>
FROM <table1>
LEFT JOIN <table2> ON <condition>
UNION
SELECT <columns>
FROM <table1>
RIGHT JOIN <table2> ON <condition>;

```

