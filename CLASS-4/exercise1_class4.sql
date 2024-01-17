-- Create Database
CREATE DATABASE JOINS_PRACTICE;
USE JOINS_PRACTICE;

-- Create Table 1
CREATE TABLE Table1_fruit_basket (
    ID INT, 
    Fruit VARCHAR(50)
);

INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');

-- Create Table 2
CREATE TABLE Table2_fruit_basket (
    ID INT, 
    Fruit VARCHAR(50)
);

INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');