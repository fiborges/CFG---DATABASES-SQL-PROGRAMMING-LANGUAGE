 -- CREATE DATABASE class_1;
 -- DROP DATABASE IF EXISTS class_1;

USE class_1;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    PublicationYear INT
);

INSERT INTO Books (BookID, Title, Author, PublicationYear)
VALUES 
    (1, 'Harry Potter', 'J.K. Rowling', 1997),
    (2, 'The Lord of the Rings', 'J.R.R. Tolkien', 1954),
    (3, 'Pride and Prejudice', 'Jane Austen', 1813);

SELECT * FROM Books
WHERE PublicationYear > 1900;

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

SELECT Books.Title, Authors.AuthorName
FROM Books
JOIN Authors ON Books.Author = Authors.AuthorName;






