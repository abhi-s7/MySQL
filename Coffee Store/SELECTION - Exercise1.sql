USE coffee_store;
-- Exercise 1
#1
DESCRIBE customers;
SELECT  first_name, phone_number FROM customers
WHERE gender = 'F'
AND last_name = 'Bluth';

#2
DESCRIBE products;
SELECT name FROM products
WHERE price >= 3.00 
OR coffee_origin = 'Sri Lanka';

#3
SELECT * FROM customers
WHERE gender = 'M'
AND phone_number IS NULL;