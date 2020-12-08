/*
-- ADD REMOVE FOREIGN KEYS
# SYNTAX - ADD

ALTER TABLE <tablename>
ADD CONSTRAINT <constraintname>
FOREIGN KEY(<columnname>) REFERENCES <tablename>(<columnname>);

# here references tablename must be the name of table to whom we want to set this foreign key
# NOTE: the column we are referencing here must be PRIMARY KEY
# After effects : key - MUL
# SYNTAX - REMOVE
ALTER TABLE <tablename>
REMOVE FOREIGN KEY <constraintname>;
*/

ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY(address_id) REFERENCES addresses(id);

ALTER TABLE addresses
ADD PRIMARY KEY (id);

DESCRIBE addresses;
DESCRIBE people;

ALTER TABLE people
DROP FOREIGN KEY FK_PeopleAddress;