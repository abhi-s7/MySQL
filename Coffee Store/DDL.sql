CREATE DATABASE coffee_store;
SHOW DATABASES;

USE coffee_store;

CREATE TABLE products(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);

CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
gender ENUM('M','F'),
phone_number VARCHAR(11) #INT seems to be a number but it isn't actually a number in usual sence therefore use varchar
);
/*
To specify Primary key - Just write PRIMARY KEY after datatype of column but
to specify Foreign key

First create the columns as usual then
FOREIGN KEY(<name of key to make it foreign key>) REFERENCES <name of table to reference it> ( <name of column in reference table to connect the foreign key>)
*/
CREATE TABLE orders(
id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
customer_id INT,
order_time DATETIME,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (customer_id) REFERENCES customers(id)
);

SHOW TABLES;

-- Modifying a table in a database
ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);
# DROP COLUMN coffee_origin -- to delete a column

-- Delete tables from a database

CREATE TABLE test (
id INT PRIMARY KEY,
name VARCHAR(30)
);

TRUNCATE TABLE test; # this will delete the table and re create it so that all the data is being deleted
DROP TABLE test;

