USE cinema_booking_system;
/*
Concatenate - Joining together data from multiple column and returning them into single column.
Syntax: SELECT CONCAT(column1, column2) AS new_column_name FROM table;
*/
SELECT CONCAT (first_name, last_name) AS full_name FROM customers; # but there is no space b/w data

SELECT CONCAT (first_name," ",last_name) AS full_name FROM customers; # Now this concatenate 3 Strings

SELECT CONCAT ("This is ",first_name," ",last_name,"'s email: " ,email) AS customers_email FROM customers; # Now this concatenate 3 Strings
# if not ALIAS name then Column name will be 'CONCAT (first_name, last_name)'

/*
Substring - Extracting only a part of a String
Syntax: SELECT SUBSTRING('String', start_position_of_character, number_of_characters) AS alias_name;
*/

SELECT SUBSTRING('EXAMPLE',3,3) AS SUB;

SELECT SUBSTRING(name,1,3) AS short_name FROM films;
SELECT SUBSTRING(name,5,4) AS short_name FROM films;
# negative index - it starts counting from last character
SELECT SUBSTRING(name,-2,2) AS short_name FROM films; # returns last 2 letters
SELECT SUBSTRING(name,-6,5) AS short_name FROM films; -- -6 means it comes 6 places to start from last then 5 means it shows only 5 charater from the 1st index

/*
Upper n Lower case 
Turns all data in a column to Uppercase or lowercase
Syntax:
SELECT UPPER(column1) AS new_column_name FROM table1;
SELECT LOWER(column1) AS new_column_name FROM table1;

*/
SELECT CONCAT(UPPER(SUBSTRING('abhiShek',1,1) ), LOWER(SUBSTRING('abhiShek',2)) ) AS SA;

/*
Exercise 1

1. Concatenate the film names and length from the films table.

2. Extract the customers email from the 5th character onwards.
 
3. Select the customers first name is lower Case and their last name is upper case for each customer
with a last name of 'Smith'

4. Select the last 3 letters of each film name from the films table.

5. Concatenate the first three letters in the first_name and last_name columns together from the customers table

*/

#1
SELECT CONCAT (name, ":" ,length_min) AS film_info FROM films;

#2
SELECT SUBSTRING(email,5) AS email_short FROM customers;

#3
SELECT LOWER(first_name) AS first_name,UPPER(last_name) AS last_name FROM customers
WHERE last_name = 'Smith';

#4
SELECT SUBSTRING(name,-3) AS sub_name FROM films;

#5
SELECT CONCAT (SUBSTRING(first_name, 1,3) ," ", SUBSTRING(last_name, 1,3)) AS concat_name FROM customers;


# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# DATE TIME Functions

SELECT DATE ('2018-06-05 07:45:32'); # But it only extracts date
SELECT DATE(start_time) FROM screenings;

SELECT * FROM screenings
WHERE DATE(start_time) = '2017-10-03';  # start_time also contains time therefore without using DATE() it won't work

SELECT * FROM screenings
WHERE DATE(start_time) BETWEEN '2017-10-03' AND '2017-10-05'; # WITHOUT DATE() it won't return data of 5th of october becuase 
# 2017-10-05 is actually 2017-10-05 00:00:00 i.e. midnight

/*
MONTH('2017-10-09 18:22:10') --> Returns 10 as Month. 1 - January to 12 - December
YEAR('') - EXTRACTS YEAR
*/

/* Exercise 2
1. Select the film id and start time from the screeninigs table for the date of 20th of October 2017
2. Select all the data from the screenings table for the start time between the 6th and 13th of October 2017
3. Select all the data from the screenings table for October 2017
*/

#1
SELECT film_id, start_time FROM screenings
WHERE DATE(start_time) = '2017-10-20';

#2
SELECT * FROM screenings
WHERE DATE(start_time) BETWEEN '2017-10-06' AND '2017-10-13';

#3
SELECT * FROM screenings
WHERE DATE(start_time) LIKE '2017-10%';

# another way
SELECT * FROM screenings
WHERE MONTH(start_time) = '10'
AND YEAR(start_time) = '2017';