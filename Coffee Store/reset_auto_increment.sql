CREATE DATABASE test;
USE test;

CREATE TABLE cust (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10)
);

INSERT INTO cust (name)
VALUES ('ABHISHEK'), ('samerth'),('biswa');

DELETE FROM cust
WHERE name = 'samerth';

SELECT * FROM cust;

-- SET  @num := 0;
-- UPDATE cust SET id = @num := (@num+1);
ALTER TABLE cust AUTO_INCREMENT = 1;

-- ALTER TABLE cust MODIFY COLUMN id  BIGINT NOT NULL;
-- ALTER TABLE cust MODIFY COLUMN id  BIGINT AUTO_INCREMENT NOT NULL;

INSERT INTO cust (name)
VALUES ('NEW');
SELECT * FROM cust;
