# Database Normalization in Simple Terms with Practical Examples:

## What is Database Normalization?

### Definition: 
  Database normalization is a technique for organizing non-structured data into structured data by arranging tables and columns in a way that reduces redundancy, simplifies data complexity, and enhances data integrity.
### Purpose: 
  To eliminate redundant or useless data, reduce data complexity, ensure relationships between tables, and logically store data dependencies.


## Why is Database Normalization Needed?

### Need: 
  Without normalization, databases can be slow, inaccurate, and inefficient due to frequent insertions, updates, and deletions.
### Example: 
  In an Employee Table, if an employee is associated with multiple departments, updating the city for that employee requires modifying all instances, leading to inconsistency.

### Real-Life Example of Non-Normalized Data:

### Example: 
  Employee Table

```markdown
| Employee ID | Employee Name | City      | Department    |
|-------------|---------------|-----------|---------------|
| 101         | Amit          | Kolhapur  | OBIEE, COGNOS |
| 102         | Divya         | Indore    | COGNOS        |
| 103         | Yodhini       | Hydrabad  | SIEBEL        |
| 104         | Amit          | Kolhapur  | ETL           |

```
### Issues:

#### Update Anomaly: 
  Updating the city for one employee requires modifying all instances.
#### Insertion Anomaly: 
  Inserting a new employee without a department leads to inserting null values.
#### Deletion Anomaly: 
  Deleting a record with a unique department removes all associated records.


## How Database Normalization Solves Issues:

### Objective: 
  Normalize the database to address issues and ensure data is organized logically.
### Key Points:
Arrange data into logical groups.
Minimize duplicate data.
Organize data for efficient modification.
Enable quick and efficient data access and manipulation.

## Database Normalization Forms:

### Forms: 
  There are four normalization forms:

#### First Normal Form (1NF):

##### Requirement: 
  Data must not contain repeating groups.
##### Example: 
  Splitting the Employee Table into two tables to remove repeating groups.

#### Second Normal Form (2NF):

##### Requirements: 
  Must be in 1NF, and there should be no partial dependency on the primary key.
##### Example: 
  Splitting a table into two tables based on a concatenated primary key.

#### Third Normal Form (3NF):

##### Requirements: 
  Must be in 2NF, and there should be no transitive functional dependency.
##### Example: 
  Splitting a table with transitive dependency into two tables.

#### Boyce-Codd Normal Form (BCNF):

##### Purpose: 
  Handles anomalies not addressed in 3NF, particularly when dealing with multiple candidate keys.
##### Example: 
  Ensures no dependencies between attributes belonging to candidate keys.
##### Advantages: 
  Removal of data duplication, enhanced data integrity.


## Examples:

### 1. First Normal Form (1NF):

```markdown

| ISBN      | Title            |
|-----------|------------------|
| 123456789 | "Database 101"   |
| 987654321 | "SQL Mastery"    |
| 111223344 | "Data Modeling"  |

| ISBN      | Author  |
|-----------|---------|
| 123456789 | John    |
| 123456789 | Smith   |
| 987654321 | Jane    |
| 111223344 | John    |
| 111223344 | Alice   |
```

### 2. Second Normal Form (2NF):

```markdown

| ProductID | ProductName   | Category      |
|-----------|---------------|---------------|
| 101       | Laptop        | Electronics   |
| 102       | Smartphone    | Electronics   |
| 103       | Desk Chair    | Furniture     |

| OrderID   | ProductID | Quantity | Price   |
|-----------|-----------|----------|---------|
| 1         | 101       | 2        | 800     |
| 2         | 102       | 3        | 300     |
| 3         | 103       | 1        | 150     |
```

### 3. Third Normal Form (3NF):

```markdown

| EmployeeID | Department  | ManagerID |
|------------|-------------|-----------|
| 101        | IT          | 201       |
| 201        | HR          | 301       |
| 301        | Marketing   | NULL      |

| ManagerID | ManagerName |
|-----------|-------------|
| 201       | John        |
| 301       | Alice       |
```
### 4. Boyce-Codd Normal Form (BCNF):

```markdown

| StudentID | CourseID | InstructorID |
|-----------|----------|--------------|
| 101       | Math101  | 201          |
| 201       | Chem101  | 302          |
| 301       | Phys101  | 201          |

| InstructorID | InstructorName |
|--------------|-----------------|
| 201          | Dr. Smith       |
| 302          | Prof. Johnson   |
```
```markdown
| Concept                    | Description                                                               |
|----------------------------|---------------------------------------------------------------------------|
| **First Normal Form (1NF)** | Ensures each column contains atomic (indivisible) values, eliminating repeating groups. 
This means breaking down complex data into simpler, indivisible parts. For instance, a column should not contain a list of values, but rather a single value. |

| **Second Normal Form (2NF)** | Eliminates partial dependencies by ensuring non-key attributes depend on the entire primary key. 
In other words, every non-prime attribute must be fully functionally dependent on the entire primary key. 
For example, if a table has a composite primary key, each non-key attribute should depend on the entire composite key. |

| **Third Normal Form (3NF)** | Eliminates transitive dependencies by separating non-prime attributes that depend on other non-prime attributes. 
This involves breaking down tables to ensure that attributes do not depend on other non-prime attributes. For instance, if A depends on B, and B depends on C, then A should not depend on C. |

| **Boyce-Codd Normal Form (BCNF)** | Takes 3NF further by addressing dependencies between attributes belonging to candidate keys. 
In BCNF, there are no non-trivial dependencies between attributes of a table on any candidate key. This enhances data integrity by preventing certain types of anomalies. |


```




