USE alter_demo;
-- ADD A UNIQUE CONSTRAINT TO A COLUMN
/*
# add
ALTER TABLE <tablename>
ADD CONSTRAINT <constraintname> UNIQUE (<columnname>);

# remove 
ALTER TABLE <tablename>
DROP INDEX <constraintname>;
*/
# add
ALTER TABLE pets
ADD CONSTRAINT u_species UNIQUE (species);
# this adds UNI to key in DESCRIBE

SELECT * FROM pets;
DESCRIBE pets;

# remove 
ALTER TABLE pets
DROP INDEX u_species;

