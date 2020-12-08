# Sub queries
USE cinema_booking_system;
# Non - Correlated Sub queries - where subquery can be run independently
# ::After WHERE
SELECT * FROM screenings;

SELECT id, start_time FROM screenings WHERE film_id IN
	(SELECT id FROM films # this is subquery
	WHERE length_min > 120);
# film_id in screenings table is FK to id in films table
SELECT id FROM films
	WHERE length_min > 120;

/*
The above output gives the result of id, start_time From screenings Where the film id is in (sub query)
i.e. 1,3,8,11
*/

# 2
SELECT * FROM customers;
SELECT * FROM bookings;

SELECT first_name, last_name, email FROM customers
WHERE id IN 
	(SELECT customer_id FROM bookings
	WHERE screening_id = 1);
# this is possible because id field in customers table is the FK in with name customer_id in bookings table
# Therefore link b/w two is possible
    
# ::After FROM
SELECT * FROM reserved_seats;
-- grouping the number of seats reserved by a customer
SELECT booking_id, COUNT(seat_id) FROM reserved_seats
GROUP BY booking_id;

-- But now we want to display MAX of COUNT of seats reserved

SELECT AVG(no_seats), MAX(no_seats) FROM # no_seats is alias name
(SELECT booking_id, COUNT(seat_id) AS no_seats FROM reserved_seats
GROUP BY booking_id) derieved_name;

-- Since After FROM it requires a table and with the subquery it returns a table
-- known as derieved table - it is not permanent table in db
-- NOTE:: Whenever derieved table is creted we must refer it with some name and it can be any name

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Correlated Subqueries
/*
- The inner query can't run independently of the outer query.
- The inner query runs for every row in the outer query, i.e. inner query runs multiple times
*/
SELECT screening_id, customer_id
FROM bookings ORDER BY screening_id;

SELECT * FROM reserved_seats;

SELECT screening_id, customer_id,
(SELECT COUNT(seat_id)
FROM reserved_seats WHERE booking_id = b.id) AS no_seats
FROM bookings b
ORDER BY screening_id;
-- here we are referring to outer query for data and b.id is outer and thus inner query is useless without outer query thus is dependent
-- for every row in outer query i.e. for screening_id and customer_id combination
--  the inner query is running where it is matching booking id and counting the seats

# Exercise

# 1. Select the film name and length for all films with a length greater than the average film length
SELECT name, length_min FROM films
WHERE length_min > 
(SELECT AVG(length_min) FROM films);

# 2. Select the maximum number and the munimum number of screnings for a particular film
SELECT * FROM screenings;
SELECT MAX(id), MIN(id) FROM (SELECT COUNT(id) AS id, film_id FROM screenings GROUP BY film_id) s;

SELECT COUNT(id) AS id, film_id FROM screenings GROUP BY film_id;

# 3. Select each film name and the number of screenings for that film.
SELECT * FROM films;
SELECT * FROM screenings;
SELECT name, (SELECT COUNT(id) FROM screenings WHERE film_id = f.id)  # GROUP BY film_id HAVING film_id = f.id
FROM films f;
