/* CREATE THE DATABASE */
CREATE DATABASE shirts_db;
USE shirts_db;

/* Populate table with columns and data */
CREATE TABLE shirts
(
	shirt_id INT NOT NULL AUTO_INCREMENT,
	article VARCHAR(100) NOT NULL,
	colour VARCHAR(100) NOT NULL,
	shirt_size VARCHAR(5) NOT NULL,
	last_worn INT NOT NULL,
	PRIMARY KEY (shirt_id)
);

SHOW COLUMNS FROM shirts;

INSERT INTO shirts(article, colour, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
			 ('t-shirt', 'green', 'S', 200),
			 ('polo shirt', 'black', 'M', 10),
			 ('tank top', 'blue', 'S', 50),
			 ('t-shirt', 'pink', 'S', 0),
			 ('polo shirt', 'red', 'M', 5),
			 ('tank top', 'white', 'S', 200),
			 ('tank top', 'blue', 'M', 15);

SELECT * FROM shirts;
			 
/* Create a new shirt */
INSERT INTO shirts(article, colour, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

SELECT * FROM shirts WHERE shirt_size='M';
SELECT article, colour, shirt_size, last_worn FROM shirts WHERE shirt_size='M';

/* Update polo shirt sizes */
SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

/* Update the shirt last worn 15 days ago */
SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0 WHERE last_worn=15;

/* Update all white shirt sizes */
SELECT * FROM shirts WHERE colour='white' AND article='t-shirt';
UPDATE shirts SET shirt_size='XS', colour='off white' WHERE colour='white';

/* Delete all old shirts */
SELECT * FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE last_worn=200;

/* Delete all tank tops */
SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';

/* Delete all shirts */
DELETE FROM shirts;
DROP TABLE shirts;