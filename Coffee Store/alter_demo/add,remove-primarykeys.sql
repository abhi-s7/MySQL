-- ALTER TABLE DEMO
CREATE DATABASE alter_demo;
USE alter_demo;

CREATE TABLE addresses(

	id INT,
	house_number INT,
	city VARCHAR(20),
	postcodes VARCHAR(7)
);

CREATE TABLE people(
	id INT,
    first_name VARCHAR(20),
	last_name VARCHAR(20),
    address_id INT 
);

CREATE TABLE pets(
	id INT,
    name VARCHAR(20),
    species VARCHAR(20),
    owner_id INT #which people owns this pet
    
);

SHOW TABLES;

-- Describe a table

DESCRIBE addresses;

/*
-- SQL to add a PRIMARY KEY to a TABLE
ALTER TABLE <tablename>
ADD PRIMARY KEY (columnname);
# two things changes in description 1. key PRI and 2. NULL - NO
# But when DROP PRIMARY KEY Then null stays to NO while Key gets deleted in DESCRIPTION


-- SQL to remove a PRIMARY KEY from a TABLE

ALTER TABLE <tablename>
DROP PRIMARY KEY
*/

ALTER TABLE addresses
ADD PRIMARY KEY(ID);

ALTER TABLE addresses
DROP PRIMARY KEY;


ALTER TABLE people
ADD PRIMARY KEY (id);

DESCRIBE people;