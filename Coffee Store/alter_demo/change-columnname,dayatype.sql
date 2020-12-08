USE alter_demo;

/*
-- To change Column Name:

ALTER TABLE <tablename> CHANGE `old_column_name` `new_column_name` <datatype>;

NOTE:: use back tick not single quotes
*/

ALTER TABLE pets CHANGE `species` `animal_type` VARCHAR(20);

SELECT * FROM pets;

/*
-- To change a columns data type

ALTER TABLE <tablename> MODIFY <columnname><datatype>;
If there is data present and its type is character and we wish to change it to INT then MYSQL won't allow this action.
as it is not compatible with the already had datatype
*/

ALTER TABLE addresses MODIFY house_number VARCHAR(11);
DESCRIBE addresses;