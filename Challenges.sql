USE cinema_booking_system;

#Challenge1 - Which films are over 2 hours long?
SELECT * FROM films
WHERE length_min > 120;

#Challenge2 - Which films had the most screenings in October 2017

---------------------------------------------------------
SELECT f.name AS name, COUNT(s.id) AS SC FROM films f
JOIN screenings s ON f.id = s.film_id
GROUP BY f.name
ORDER BY SC DESC;

SELECT f.name AS name, COUNT(s.id) AS showings FROM films f
JOIN screenings s ON f.id = s.film_id
GROUP BY f.name;

SELECT name, MAX(showings) FROM
(SELECT f.name AS name, COUNT(s.id) AS showings FROM films f
JOIN screenings s ON f.id = s.film_id
GROUP BY f.name) new_table;
#GROUP BY name;
---------------------------------------------------------

SELECT f.name, COUNT(s.film_id) AS showings FROM screenings s
JOIN films f ON f.id = s.film_id
GROUP BY film_id
ORDER BY showings DESC
LIMIT 1; # since we only want to display the topmost record

select name, showings from
(select film_id, count(id) as showings from screenings
group by film_id order by showings desc limit 1) b join films f where b.film_id=f.id;

#Challenge3 - How many bookings did the film 'Jigsaw' have in October 2017
SELECT COUNT(id)FROM bookings 
WHERE screening_id IN 
	(SELECT s.id FROM screenings s
	JOIN films f ON s.film_id = f.id
	WHERE f.name = 'Jigsaw');
    
-- Another app
select count(distinct b.id) from screenings s
   join bookings b on s.id = b.screening_id
   where film_id =
     ( select id from films where name = "jigsaw")   ;
     
#Challenge4 - Which 5 customers made the most bookings in October 2017

SELECT customer_id, COUNT(*) AS total FROM bookings
GROUP BY customer_id
ORDER BY total DESC
LIMIT 5;
-- SELECT c.first_name, c.last_name, b.id FROM customers c
-- JOIN bookings b ON c.id = b.customer_id
-- WHERE c.id IN (
-- 	SELECT customer_id AS id, COUNT(*) AS total FROM bookings
-- 	GROUP BY customer_id
-- 	ORDER BY total DESC
-- 	LIMIT 5); Where clause doesn't work well here

SELECT c.id, c.first_name, c.last_name, COUNT(b.id) AS total_bookings FROM customers c
JOIN bookings b ON c.id = b.customer_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY total_bookings DESC
LIMIT 5;

# Challenge5 - Which film was shown in the Chaplin(id = 1) room *most often* in October 2017
SELECT * FROM rooms;

SELECT f.id, f.name, COUNT(r.name) AS no_screenings FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN rooms r ON s.room_id = r.id
WHERE r.name = 'Chaplin'
GROUP BY f.id, f.name
ORDER BY no_screenings DESC
LIMIT 1;
#WHERE s.room_id = 1;

# Challenge6 - How many of the customers made a booking in October 2017 
SELECT * FROM customers;
SELECT * FROM bookings;

SELECT COUNT(customer_id) FROM 
(SELECT customer_id, COUNT(id) FROM bookings
GROUP BY customer_id) temp;

#or use DISTINCT

SELECT COUNT(DISTINCT(customer_id)) FROM bookings;