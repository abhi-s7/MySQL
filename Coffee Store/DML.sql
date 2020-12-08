-- Inserting into tables
USE coffee_store;

-- DELETE FROM products;
-- SHOW TABLES;

-- SELECT * FROM products;

#syntax
/*
INSERT INTO <tablename> (<column1>, <column2>, <column3>)
VALUES ('value1','value2','value3');

for character values - ''
for numeric values - no single quotes
*/

ALTER TABLE products AUTO_INCREMENT = 1;
INSERT INTO products(name, price, coffee_origin)
VALUES ('Espresso', 2.50, 'Brazil');

INSERT INTO products(name, price, coffee_origin)
VALUES ('Macchiato', 3.00, 'Brazil'),('Cappuccino',3.50,'Costa Rica'),
('Latte',3.50,'Indonedia'),('Americano',3.00,'Brazil'),
('Flat White',3.50,'Indonesia'),('Filter',3.00,'India');

SELECT * FROM products;

-- Updating data that is already inserted into tables
/*
Syntax
	UPDATE <tablename>
	SET<columnname> = 'Value'
	WHERE <columnname> = 'Value';
    
    By default in work bench we are only allowed to use the primary key column in the 
    WHERE statement because it set safe updates automatically
    To change that use:
    
    SET SQL_SAFE_UPDATES = 0; # deactivating safe update
    
*/
SET SQL_SAFE_UPDATES = 0; # deactivating safe update

UPDATE products
SET coffee_origin = 'Sri Lanka'
WHERE id = 7;

# Multiple column update
UPDATE products
SET price = 3.25, coffee_origin = 'Ehiopia'
WHERE name = 'Americano';

# Update Multiple Rows
UPDATE products
SET coffee_origin = 'Columbia'
WHERE coffee_origin = 'Brazil';

# Delete 
DELETE FROM products
WHERE coffee_origin = 'Sri Lanka';

# Delete all records at once
-- DELETE FROM products;
SELECT * FROM products;

# NOTE:: on deleting and adding again the id doesn't sets to 0 
# it will continue from last added records
# for e.g. if id = 30 and then deleted whole records then again add any data. id will be 31 this time

ALTER TABLE products AUTO_INCREMENT = 1;
DESCRIBE products;