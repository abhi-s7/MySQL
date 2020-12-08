# Aggregate Functions


USE cinema_booking_system;

# COUNT
SELECT * FROM customers;
SELECT COUNT(*) FROM customers;
SELECT COUNT(first_name) FROM customers; # since it have many null values

SELECT COUNT(*) FROM customers WHERE last_name = 'smith';
SELECT COUNT(*) FROM customers WHERE first_name IS NULL;

# SUM
/*
Syntax: SUM(<columnname>)
SUM only works with numeric therefore SUM(*) will give error*/

SELECT SUM(no_seats) FROM rooms
WHERE id > 1;

# MAX
SELECT MAX(length_min) FROM films;
# MIN
SELECT MIN(length_min) FROM films;
/*
But in this statement: SELECT name, MAX(length_min) FROM films;
SQL is trying to return list of name along with MAX which only shows one row therefore it gives an error. This is achieved using GROUP BY clause.
*/
UPDATE films 
SET length_min = 157
WHERE name = 'Blade Runner 2049' ;

SELECT * FROM films;

SELECT name, MAX(length_min) AS max_length FROM films;

# Average
SELECT AVG(length_min) FROM films
WHERE length_min > 120;

# GROUP BY
SELECT customer_id, COUNT(id) FROM bookings # writing only this will give error
GROUP BY customer_id;

SELECT customer_id,screening_id, COUNT(id) FROM bookings # writing only this will give error
GROUP BY customer_id, screening_id;
/*
:: Any column which is specified with COUNT and not being aggregated should be specified inside GROUP BY clause other wise it will give error
*/
select * from films;
SELECT f.name, s.start_time, c.first_name, c.last_name, COUNT(b.id) FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN bookings b ON s.id = b.screening_id
JOIN customers c ON b.customer_id = c.id
GROUP BY f.name, s.start_time, c.first_name, c.last_name
;
# HAVING Clause is like a WHERE clause for GROUP BY. WHERE clause won't work with GROUP BY

-- Exercise 1
# 1. How many bookings did customer id 10 make in October 2017
SELECT * FROM screenings;
SELECT * FROM films;

-- SELECT b.id, b.screening_id, b.customer_id, s.start_time FROM bookings b
SELECT COUNT(b.id) FROM bookings b # doesn't work with COUNT(b.*)
JOIN screenings s ON b.screening_id = s.id
WHERE b.customer_id = 10
AND s.start_time LIKE '2017-10%';

# since all the data in database is of October 2017 therefore directly use
# SELECT COUNT(*) FROM bookings WHERE customer_id = 10;

# 2. Count th number of screenings fro Blade Runner 2049 in October 2017
SELECT COUNT(*) FROM screenings s
JOIN films f ON s.film_id = f.id
WHERE f.name = 'Blade Runner 2049'
AND s.start_time LIKE '2017-10%';


# 3. Count the number of unique customers who made a booking for October 2017
SELECT * FROM films;
# Use DISTINCT for getting Unique values

SELECT COUNT(DISTINCT(b.customer_id)) FROM bookings b
JOIN screenings s ON b.screening_id = s.id
WHERE s.start_time LIKE '2017-10%';

-- EXERCISE 2

# 1. Select the customer id and count the number of reserved seats grouped by customer for October 2017
SELECT b.customer_id, COUNT(r.id) FROM bookings b
JOIN reserved_seats r ON b.id = r.booking_id
GROUP BY b.customer_id;


# 2. Select the film name and count the number of screenings for each flm that is over 2 hours long.
SELECT f.name,f.length_min, COUNT(s.id) FROM films f
JOIN screenings s ON f.id = s.film_id
# GROUP BY f.name,f.length_min
GROUP BY f.name # But this is also working
HAVING f.length_min > 120;
# for specifying columns in HAVING we should also specify in GROUP BY
