/* Create book store database */
DROP DATABASE IF EXISTS book_store_db;
CREATE DATABASE book_store_db;
USE book_store_db;

/* Create books table and insert data */
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100) NOT NULL,
		author_fname VARCHAR(100) NOT NULL,
		author_lname VARCHAR(100) NOT NULL,
		released_year INT NOT NULL,
		stock_quantity INT,
		pages INT NOT NULL,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
			 ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
			 ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
			 ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
			 ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
			 ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
			 ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
			 ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
			 ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
			 ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
			 ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
			 ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
			 ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
			 ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
			 ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
			 ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

/* Check using the correct database and table */
SELECT database();
SHOW COLUMNS FROM books;
SELECT * FROM books;

/* Output the normal and reversed version of the authors last name */ 
SELECT author_lname AS "forwards", REVERSE(author_lname) AS "backwards" FROM books; 

/* Output the first and last name in uppercase */
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) as "Full_name_in_caps" FROM books;

/* Create a blurb for the title, the title with the year it was released */
SELECT CONCAT(title, ' was released in ', released_year) AS "blurb" FROM books;

/* Output the character count of the book title with the title */
SELECT title, CHAR_LENGTH(title) as "character_count" FROM books;

/* Output a short version of the title, with the authors first and last name and the quantity in stock */
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS "short_title", CONCAT(author_lname, ',', author_fname) AS "author", CONCAT(stock_quantity, ' in stock') as "quantity";

/* Add 3 new books */
INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
			 ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
			 ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

/* Select all story collections */
SELECT title FROM books WHERE title LIKE '%stories%';

/* Find the longest book */
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

/* Get a summary of the 3 most recent books */
SELECT CONCAT(title, ' - ', released_year) as summary FROM books ORDER BY released_year DESC LIMIT 3;

/* Find all books with an authors last name that contains a space */
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

/* Find the 3 books with lowest stock */
SELECT title , released_year, stock_quantity FROM books ORDER BY stock_quantity ASC, released_year DESC LIMIT 3;

/* Get books list based on author and book title */
SELECT title, author_lname FROM books ORDER BY 2, 1;

/* Print the number of books in the database */
SELECT COUNT(*) as total_books FROM books;

/* Print out the number of books released in each year */
SELECT released_year, COUNT(*) AS book_count FROM books GROUP BY released_year ORDER BY released_year;

/* Print total number of books in stock */
SELECT SUM(stock_quantity) AS stock_count FROM books;

/* Find average released year for each author */
SELECT CONCAT(author_fname, ' ', author_lname) AS author, ROUND(AVG(released_year)) AS book_avg_released_year FROM books GROUP BY author_fname, author_lname;

/* Find the full name of the author who wrote the longest book */
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

/* Find the book count for each year along with the average amount of pages per year */
SELECT released_year AS year, COUNT(*) AS num_of_books, AVG(pages) AS avg_pages FROM books GROUP BY released_year ORDER BY released_year;

/* Select all that were not released in 2017 */
SELECT title, released_year FROM books WHERE released_year != 2017;

/* Get all books that don't start with the letter W */ 
SELECT title FROM books WHERE title NOT LIKE 'W%';

/* Select all books released after the year 2000 */
SELECT * FROM books WHERE released_year > 2000;

/* Getting the books between 2004 and 2015 */
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

/* Select all books written by Carver, Lahiri or Smith */
SELECT title, author_lname FROM books WHERE author_lname IN('Carver', 'Lahiri', 'Smith');

/* Select all books that are not within even released years that are after the year 2000 */
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;

/* Add a stock column that contains stars to identify how much stock we have per book */
SELECT title, stock_quantity, 
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
		WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
		WHEN stock_quantity BETWEEN 101 AND 200 THEN '***'
		WHEN stock_quantity BETWEEN 201 AND 500 THEN '****'
		ELSE '*****'
	END AS stock
FROM books;

/* Select all books written before 1980 */
SELECT title, released_year FROM books WHERE released_year < 1980;

/* Select all books written by Eggers or Chabon */
SELECT title, author_lname FROM books WHERE author_lname='Eggers' OR author_lname='Chabon';
SELECT title, author_lname FROM books WHERE author_lname IN('Eggers', 'Chabon');

/* Select all books written by Lahiri, published after 2000 */
SELECT title, author_lname, released_year FROM books WHERE author_lname='Lahiri' AND released_year > 2000;

/* Select all books with page counts between 100 and 200 pages */
SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;

/* Select all books where author_lname starts with a 'C' or an 'S' */
SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' OR 'S%';

/* Create a case statement for title and author last name */
SELECT title, author_lname, 
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title IN('A Heartbreaking Work of Staggering Genius', 'Just Kids') THEN 'Memoir'
		ELSE 'Novel'
	END AS type
FROM books;

/* Count the amount of books per author */
SELECT title, author_lname,
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
		ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books GROUP BY author_lname, author_fname ORDER BY author_lname;