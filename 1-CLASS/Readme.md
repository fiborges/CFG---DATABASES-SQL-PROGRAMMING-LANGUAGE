## 1. Create a table:
Let's create a table called Books that contains information about books, such as title, author, and publication year.

```sql

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    PublicationYear INT
);
```
## 2. Insert data into the table:
Let's add some data to our table.

```sql

INSERT INTO Books (BookID, Title, Author, PublicationYear)
VALUES 
    (1, 'Harry Potter', 'J.K. Rowling', 1997),
    (2, 'The Lord of the Rings', 'J.R.R. Tolkien', 1954),
    (3, 'Pride and Prejudice', 'Jane Austen', 1813);
```
## 3. Query data:
Now, we want to extract specific data using SQL. Let's say we want to find all books published after 1900.

```sql

SELECT * FROM Books
WHERE PublicationYear > 1900;
In this query (SELECT), we are telling the database to show us all columns (*) from the Books table where the publication year is greater than 1900.
```

## 4. Combine data:
We may have another table called Authors that contains additional information about the authors.

```sql

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50),
    Nationality VARCHAR(50)
);

INSERT INTO Authors (AuthorID, AuthorName, Nationality)
VALUES 
    (1, 'J.K. Rowling', 'British'),
    (2, 'J.R.R. Tolkien', 'British'),
    (3, 'Jane Austen', 'British');
```
We can now combine information from both tables using a JOIN statement. For example, to get the author's name for each book:

```sql

SELECT Books.Title, Authors.AuthorName
FROM Books
JOIN Authors ON Books.Author = Authors.AuthorName;
```
Here, we are selecting the book titles and author names from the Books and Authors tables, respectively, combining the rows where the author's name is the same in both tables.


---------------------------------------------------------------
## New Topic
In an RDBMS, data is organized and stored in tables, and these tables are related to each other. Relationships between tables are established through keys, typically primary keys and foreign keys.

### Example: Online Bookstore Database

Consider an online bookstore with two main entities: Books and Authors. We'll create a simple relational database to manage this information.

#### 1. Create Tables:

```sql

-- Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Price DECIMAL(8,2),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50)
);
```
Here, we have two tables: Books and Authors. The Books table has a foreign key (AuthorID) that references the primary key in the Authors table.

#### 2. Insert Data:

```sql

-- Insert authors
INSERT INTO Authors (AuthorID, AuthorName) VALUES 
    (1, 'J.K. Rowling'),
    (2, 'J.R.R. Tolkien'),
    (3, 'Jane Austen');

-- Insert books
INSERT INTO Books (BookID, Title, AuthorID, Price) VALUES
    (101, 'Harry Potter', 1, 29.99),
    (102, 'The Lord of the Rings', 2, 39.99),
    (103, 'Pride and Prejudice', 3, 19.99);
```
### 3. Diagram Representation:
In a diagram, it would look something like this:

```lua

+-----------+        +-----------+
|  Authors  |        |   Books   |
+-----------+        +-----------+
| AuthorID  |        |  BookID   |
| AuthorName|        |  Title    |
+-----------+        | AuthorID  |
                    |  Price    |
                    +-----------+
```
In the diagram, you see the Authors table connected to the Books table through the AuthorID key. This connection represents a relationship between the two tables.

#### 4. Query with Relationships:
You can query the database to get information that involves both tables. For instance, to find the author and price of each book:

```sql

SELECT Books.Title, Authors.AuthorName, Books.Price
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;
```
This query uses the JOIN statement to combine data from both tables based on the AuthorID key, providing a result that includes information from both the Books and Authors tables.
