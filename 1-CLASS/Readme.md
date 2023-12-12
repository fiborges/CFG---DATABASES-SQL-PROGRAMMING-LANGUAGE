## 1. Create a table:
Let's create a table called Books that contains information about books, such as title, author, and publication year.
```
sql

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
