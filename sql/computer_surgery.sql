/* Create the Database */
DROP DATABASE IF EXISTS computer_surgery_db;
CREATE DATABASE IF NOT EXISTS computer_surgery_db;
USE computer_surgery_db;

/* Clear tables if exists */
DROP TABLE IF EXISTS customer_login;
DROP TABLE IF EXISTS staff_login;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS customer_order;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS customers;

DROP TABLE IF EXISTS copy_of_customer_login;
DROP TABLE IF EXISTS copy_of_staff_login;
DROP TABLE IF EXISTS copy_of_order_details;
DROP TABLE IF EXISTS copy_of_customer_order;
DROP TABLE IF EXISTS copy_of_staff;
DROP TABLE IF EXISTS copy_of_services;
DROP TABLE IF EXISTS copy_of_customers;

/* Create Customers table and insert values */
CREATE TABLE customers
(
  email_address VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  house_no_name VARCHAR(255) NOT NULL,
  city VARCHAR(100) NOT NULL,
  postcode VARCHAR(10) NOT NULL,
  PRIMARY KEY (email_address)
);

INSERT INTO customers(email_address, first_name, last_name, house_no_name, city, postcode) 
VALUES ('raelynn.tyler@outlook.com', 'Raelynn', 'Tyler', '88 Main Street', 'PAISLEY', 'PA86 8XF'),
       ('brynlee.murphy@yahoo.co.uk',	'Brynlee', 'Murphy',	'6 Grove Road',	'BOURNEMOUTH', 'BH53 4KO'),
       ('roger.raymond@gmail.com', 'Roger', 'Raymond',	'95 Mill Lane', 'HARROW',	'HA2 2AR'),
       ('adrian.strong@yahoo.co.uk', 'Adrian', 'Strong',	'10 Highfield Road', 'BRADFORD', 'BD85 1OW'),
       ('reese.gamble@mail.com', 'Reese', 'Gamble', '36 Queens Road', 'ROCHESTER',	'ME16 2QG'),
       ('carly.jones@outlook.com', 'Carly', 'Jones',	'3 Windsor Road',	'HEMEL HEMPSTEAD', 'HP76 3AM'),
       ('janet.miles@gmail.com', 'Janet', 'Miles',	'11 School Lane', 'NEWPORT', 'NP3 9GD'),
       ('magdalena.jensen@gmail.com',	'Magdalena', 'Jensen', '72 North Road', 'SOUTH EAST LONDON', 'SE26 3XI'),
       ('jane.mckay@yahoo.co.uk',	'Jane', 'Mckay', '570 The Crescent',	'SOUTHALL',	'UB20 7DY'),
       ('carolyn.morrow@outlook.com',	'Carolyn', 'Morrow', '4 Queen Street', 'COLCHESTER', 'CO55 9RH'),
       ('marisol.bolton@mail.com',	'Marisol', 'Bolton',	'87 Grove Road', 'DUDLEY', 'DY11 9UL'),
       ('jaslyn.blanchard@gmail.com',	'Jaslyn', 'Blanchard', '26 Green Lane', 'TWICKENHAM', 'TW23 8CA'),
       ('zaniyah.richards@yahoo.co.uk',	'Zaniyah', 'Richards',	'29 King Street',	'COVENTRY',	'CV90 0EC'),
       ('nolan.davenport@outlook.com', 'Nolan', 'Davenport',	'914 New Street', 'SOUTH EAST LONDON', 'SE68 0CU'),
       ('hunter.hardy@yahoo.co.uk',	'Hunter', 'Hardy',	'68 The Avenue', 'OLDHAM', 'OL33 2ZG'),
       ('lucia.sellers@mail.com',	'Lucia', 'Sellers',	'39 Main Street', 'BRISTOL', 'BS24 8WY'),
       ('uriel.duncan@outlook.com',	'Uriel', 'Duncan',	'23 Queens Road',	'LANCASTER', 'LA36 7MB'),
       ('sterling.moses@gmail.com',	'Sterling', 'Moses', '838 North Road', 'CARLISLE', 'CA14 8FN'),
       ('mollie.alvarez@gmail.com', 'Mollie', 'Alvarez', '83 Highfield Road',	'HEMEL HEMPSTEAD', 'HP32 2MB'),
       ('cloe.russell@mail.com', 'Cloe', 'Russell', '98 New Street',	'DUDLEY',	'DY5 0BJ'); 

/* Create Services table and insert values */
CREATE TABLE services
(
  name_of_service VARCHAR(255) NOT NULL,
  service_description VARCHAR(1000) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (name_of_service)
);

INSERT INTO services(name_of_service, service_description, price)
VALUES ('Hardware Upgrades', 'Includes replacing existing hardware that requires an upgrade. Price depends on the hardware, price specified in the minimum value.', 100),
       ('Hardware Faults', 'This includes repairs of hardware. Price is per hour.',	60),
       ('Software', 'Includes different software available for purchase. For example: antivirus software, Microsoft Office products, etc. 80
Network Installation, Includes installing new PCs and networks into office spaces. Starting at a minimum cost of the listed price, this increases per PC by £50.', 300),
       ('Broadband/Internet Services', 'Includes setting up the broadband for the price listed and then an ongoing £50 monthly fee for regular broadband services + support.', 350),
       ('Technical Training',	'Ranges from basic to advanced at the start of the price listed per hour. E.g. simple things like setting up a PC operating system, how to use particular software, to advanced items like a full in depth security or web development course.	20
Data Backup & Recovery. Backing up server side data daily and storing it on one of our servers, this service is the price listed at a monthly basis to allow recovery of data and continuous backups.',	35),
       ('Antivirus Monitoring',	'Providing antivirus network monitoring services to prevent any threats for entering clients networks. This involves the price listed per month.',	60),
       ('Network Maintenance', 'Providing regularly software and operating system updates to keep the network fully secure. The price listed is required monthly.', 15),
       ('Virus or Spyware Removal',	'Starting at the price listed, consists of removal of viruses from 1 to many devices. Price will increase based on amount of devices.', 50),
       ('Build your own PC', 'Online service that allows you to pick parts we have in our store, we will then put it together and provide you with the required operating system of your choice + software. Price starts at the number listed and increases based on parts and software selected.', 30),
       ('Cloud Storage', 'A monthly charge for the price listed, allowing cloud storage of up to 5GBs of data. Price increases if needing additional storage.', 25),
      ('Website Design Services', 'Starting at the price listed, this may increase depending on the requirements. Includes the design and development of the website and hosting it online. Hosting cost is included for the first three years, after that it will require an additional charge of £10 per month. A support package is optional.', 1350);

/* Create Staff table and insert values */
CREATE TABLE staff
(
  email_address VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (email_address)
);

INSERT INTO staff(email_address, first_name, last_name)
VALUES ('evangeline.gillespie@lcs-computers.co.uk',	'Evangeline', 'Gillespie'),
       ('wesley.strickland@lcs-computers.co.uk', 'Wesley', 'Strickland'),
       ('saige.lee@lcs-computers.co.uk', 'Saige', 'Lee'),
       ('joe.ferguson@lcs-computers.co.uk', 'Joe', 'Ferguson'),
       ('davis.swanson@lcs-computers.co.uk', 'Davis', 'Swanson'),
       ('jair.thornton@lcs-computers.co.uk', 'Jair', 'Thornton'),
       ('bentley.jenkins@lcs-computers.co.uk', 'Bentley',	'Jenkins'),
       ('bruno.cochran@lcs-computers.co.uk', 'Bruno',	'Cochran'),
       ('seth.holt@lcs-computers.co.uk', 'Seth', 'Holt'),
       ('chasity.williamson@lcs-computers.co.uk', 'Chasity', 'Williamson'),
       ('holly.shaw@lcs-computers.co.uk', 'Holly', 'Shaw'),
       ('nina.avery@lcs-computers.co.uk', 'Nina', 'Avery'),
       ('ariana.shaffer@lcs-computers.co.uk', 'Ariana', 'Shaffer'),
       ('virginia.schroeder@lcs-computers.co.uk', 'Virginia', 'Schroeder'),
       ('maryjane.kidd@lcs-computers.co.uk', 'Maryjane', 'Kidd'),
       ('xiomara.hunter@lcs-computers.co.uk', 'Xiomara', 'Hunter'),
       ('roderick.gates@lcs-computers.co.uk', 'Roderick', 'Gates'),
       ('byron.haas@lcs-computers.co.uk',	'Byron', 'Haas'),
       ('nadia.davidson@lcs-computers.co.uk', 'Nadia', 'Davidson'),
       ('jaylee.suarez@lcs-computers.co.uk', 'Jaylee', 'Suarez');

/* Create Customer Order table and insert values */
CREATE TABLE customer_order
(
  customer_email VARCHAR(255) NOT NULL,
  date_time DATETIME NOT NULL,
  staff_email VARCHAR(255),
  PRIMARY KEY (customer_email, date_time)
);

INSERT INTO customer_order(customer_email, date_time, staff_email)
VALUES ('raelynn.tyler@outlook.com', '2018-11-16 11:20:00', 'evangeline.gillespie@lcs-computers.co.uk'),
       ('brynlee.murphy@yahoo.co.uk', '2018-09-22 02:21:00', 'wesley.strickland@lcs-computers.co.uk'),
       ('roger.raymond@gmail.com', '2018-11-20 19:14:00', 'saige.lee@lcs-computers.co.uk'),
       ('adrian.strong@yahoo.co.uk', '2018-09-10 20:46:00', 'joe.ferguson@lcs-computers.co.uk'),
       ('reese.gamble@mail.com', '2018-05-01 16:21:00', 'davis.swanson@lcs-computers.co.uk'),
       ('carly.jones@outlook.com', '2019-09-25 05:41:00', 'jair.thornton@lcs-computers.co.uk'),
       ('janet.miles@gmail.com', '2018-09-17 13:47:00', 'bentley.jenkins@lcs-computers.co.uk'),
       ('magdalena.jensen@gmail.com', '2019-06-21 12:52:00', 'bruno.cochran@lcs-computers.co.uk'),
       ('jane.mckay@yahoo.co.uk', '2018-01-30 18:05:00', 'seth.holt@lcs-computers.co.uk'),
       ('carolyn.morrow@outlook.com', '2018-02-04 14:17:00', 'chasity.williamson@lcs-computers.co.uk'),
       ('marisol.bolton@mail.com', '2019-04-15 12:28:00', 'holly.shaw@lcs-computers.co.uk'),
       ('jaslyn.blanchard@gmail.com', '2019-02-24 15:49:00', 'nina.avery@lcs-computers.co.uk'),
       ('zaniyah.richards@yahoo.co.uk', '2018-11-24 10:01:00', 'ariana.shaffer@lcs-computers.co.uk'),
       ('nolan.davenport@outlook.com', '2018-02-23 06:41:00', 'virginia.schroeder@lcs-computers.co.uk'),
       ('hunter.hardy@yahoo.co.uk',	'2018-04-14 01:02:00', 'maryjane.kidd@lcs-computers.co.uk'),
       ('lucia.sellers@mail.com', '2018-10-18 00:39:00', 'xiomara.hunter@lcs-computers.co.uk'),
       ('uriel.duncan@outlook.com',	'2018-10-17 00:51:00', 'roderick.gates@lcs-computers.co.uk'),
       ('sterling.moses@gmail.com',	'2018-04-29 07:21:00', 'byron.haas@lcs-computers.co.uk'),
       ('mollie.alvarez@gmail.com',	'2018-08-24 16:43:00', 'nadia.davidson@lcs-computers.co.uk'),
       ('cloe.russell@mail.com', '2019-06-02 19:51:00', 'jaylee.suarez@lcs-computers.co.uk');

/* Create Order Details table and insert values */
CREATE TABLE order_details
(
  customer_email VARCHAR(255) NOT NULL,
  order_date_time DATETIME NOT NULL,
  services_name VARCHAR(255) NOT NULL,
  service_ordered_price INT NOT NULL,
  discount INT DEFAULT 0,
  quantity INT NOT NULL,
  PRIMARY KEY (customer_email, order_date_time, services_name)
);

INSERT INTO order_details(customer_email, order_date_time, services_name, service_ordered_price, quantity)
VALUES ('raelynn.tyler@outlook.com', '2018-11-16 11:20:00', 'Cloud Storage', 300, 12),
       ('brynlee.murphy@yahoo.co.uk', '2018-09-22 02:21:00', 'Virus or Spyware Removal', 600, 12),
       ('roger.raymond@gmail.com', '2018-11-20 19:14:00', 'Network Maintenance', 45, 3),
       ('adrian.strong@yahoo.co.uk', '2018-09-10 20:46:00', 'Antivirus Monitoring', 1080, 18),
       ('reese.gamble@mail.com', '2018-05-01 16:21:00', 'Technical Training', 360, 180),
       ('carly.jones@outlook.com', '2019-09-25 05:41:00', 'Hardware Upgrades', 480, 5),
       ('janet.miles@gmail.com', '2018-09-17 13:47:00', 'Network Installation', 8700, 168),
       ('magdalena.jensen@gmail.com', '2019-06-21 12:52:00', 'Website Design Services', 2760, 1),
       ('jane.mckay@yahoo.co.uk', '2018-01-30 18:05:00', 'Hardware Faults', 360, 6),
       ('carolyn.morrow@outlook.com', '2018-02-04 14:17:00', 'Hardware Upgrades', 300, 2),
       ('marisol.bolton@mail.com', '2019-04-15 12:28:00', 'Software', 160, 2),
       ('jaslyn.blanchard@gmail.com', '2019-02-24 15:49:00', 'Network Installation', 1500, 24),
       ('zaniyah.richards@yahoo.co.uk', '2018-11-24 10:01:00', 'Broadband/Internet Services', 2150, 36),
       ('nolan.davenport@outlook.com', '2018-02-23 06:41:00', 'Technical Training', 80, 4),
       ('hunter.hardy@yahoo.co.uk',	'2018-04-14 01:02:00', 'Data Backup & Recovery', 840, 24),
       ('lucia.sellers@mail.com', '2018-10-18 00:39:00', 'Network Maintenance', 120, 8),
       ('uriel.duncan@outlook.com',	'2018-10-17 00:51:00', 'Virus or Spyware Removal', 3200, 64),
       ('sterling.moses@gmail.com',	'2018-04-29 07:21:00', 'Build your own PC', 1330, 6),
       ('mollie.alvarez@gmail.com',	'2018-08-24 16:43:00', 'Cloud Storage', 75, 3),
       ('cloe.russell@mail.com', '2019-06-02 19:51:00', 'Website Design Services', 6350, 1);

/* Add discounts to certain orders */
UPDATE order_details SET discount=5 WHERE service_ordered_price > 3000;
UPDATE order_details SET discount=10 WHERE services_name='Network Installation' AND service_ordered_price > 4000;
UPDATE order_details SET discount=20 WHERE services_name='Website Design Services' AND service_ordered_price > 6000;

/* Create customer login table and insert values */
CREATE TABLE customer_login
(
  email_address VARCHAR(255) NOT NULL,
  user_password VARCHAR(40) NOT NULL,
  permission_type VARCHAR(255) NOT NULL DEFAULT "customer",
  PRIMARY KEY (email_address),
  CONSTRAINT cl_email FOREIGN KEY (email_address) REFERENCES customers(email_address) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO customer_login(email_address, user_password, permission_type)
VALUES ('raelynn.tyler@outlook.com', MD5('E!CRfn2tY&V4'), 'customer'),
       ('brynlee.murphy@yahoo.co.uk', MD5('2daNS4!?BHT~'), 'customer'),
       ('roger.raymond@gmail.com', MD5('Ls$LVXDvW8C8'), 'customer'),
       ('adrian.strong@yahoo.co.uk', MD5('Z2+M2L!5AYtT'), 'customer'),
       ('reese.gamble@mail.com', MD5('?&GZ7tjMvLu8'), 'customer'),
       ('carly.jones@outlook.com', MD5('Ev7~+5>3QnxT'), 'customer'),
       ('janet.miles@gmail.com', MD5('sLEuD9%HQtyr'), 'customer'),
       ('magdalena.jensen@gmail.com', MD5('jb28trzme@$K'), 'customer'),
       ('jane.mckay@yahoo.co.uk', MD5('m7>59WV3g#~d'), 'customer'),
       ('carolyn.morrow@outlook.com', MD5('8J7BGSeqShk#'), 'customer'),
       ('marisol.bolton@mail.com', MD5('c@v#nDxdY7A?'), 'customer'),
       ('jaslyn.blanchard@gmail.com', MD5('%vtb!DrKf!3U'), 'customer'),
       ('zaniyah.richards@yahoo.co.uk', MD5('z9h?evHjuUpk'), 'customer'),
       ('nolan.davenport@outlook.com', MD5('J%@@a8#YB2KC'), 'customer'),
       ('hunter.hardy@yahoo.co.uk', MD5('Gv3&dVnCxRH2'), 'customer'),
       ('lucia.sellers@mail.com', MD5('2N+dD2QyPk28'), 'customer'),
       ('uriel.duncan@outlook.com', MD5('GJ~4!6utF7LG'), 'customer'),
       ('sterling.moses@gmail.com', MD5('zV&F8+UE$>Kd'), 'customer'),
       ('mollie.alvarez@gmail.com', MD5('V^2DPrgHQ!F&'), 'customer'),
       ('cloe.russell@mail.com', MD5('qY86Z@@APGK>'), 'customer');

/* Create staff login table and insert values */
CREATE TABLE staff_login
(
  email_address VARCHAR(255) NOT NULL,
  user_password VARCHAR(40) NOT NULL,
  permission_type VARCHAR(255) NOT NULL DEFAULT "admin",
  PRIMARY KEY (email_address),
  CONSTRAINT sl_email FOREIGN KEY (email_address) REFERENCES staff(email_address) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO staff_login(email_address, user_password, permission_type)
VALUES ('evangeline.gillespie@lcs-computers.co.uk', MD5('q?#MyW%7wSD!'), 'admin'),
       ('wesley.strickland@lcs-computers.co.uk', MD5('BQp5XdnD>%YY'), 'admin'),
       ('saige.lee@lcs-computers.co.uk', MD5('8!k+72LZ~d#t'), 'admin');

/* Alter customer order table and add foreign keys and primary keys */
ALTER TABLE customer_order
  ADD CONSTRAINT co_cust_email FOREIGN KEY (customer_email) REFERENCES customers(email_address) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT co_staff_email FOREIGN KEY (staff_email) REFERENCES staff(email_address) ON DELETE SET NULL ON UPDATE CASCADE;

/* Update customer order records, assigning new staff members to customer orders */
UPDATE customer_order 
  SET staff_email='evangeline.gillespie@lcs-computers.co.uk' 
  WHERE staff_email='xiomara.hunter@lcs-computers.co.uk';

UPDATE customer_order 
  SET staff_email='wesley.strickland@lcs-computers.co.uk' 
  WHERE staff_email='davis.swanson@lcs-computers.co.uk';

UPDATE customer_order 
  SET staff_email='saige.lee@lcs-computers.co.uk' 
  WHERE staff_email='seth.holt@lcs-computers.co.uk';

/* Remove staff members that have left the company */
DELETE FROM staff WHERE email_address="xiomara.hunter@lcs-computers.co.uk";
DELETE FROM staff WHERE email_address="davis.swanson@lcs-computers.co.uk";
DELETE FROM staff WHERE email_address="seth.holt@lcs-computers.co.uk";

/* Create a copy of all tables */
CREATE TABLE IF NOT EXISTS copy_of_customer_login LIKE customer_login; 
INSERT INTO copy_of_customer_login SELECT * FROM customer_login;

CREATE TABLE IF NOT EXISTS copy_of_staff_login LIKE staff_login; 
INSERT INTO copy_of_staff_login SELECT * FROM staff_login;

CREATE TABLE IF NOT EXISTS copy_of_order_details LIKE order_details; 
INSERT INTO copy_of_order_details SELECT * FROM order_details;

CREATE TABLE IF NOT EXISTS copy_of_customer_order LIKE customer_order; 
INSERT INTO copy_of_customer_order SELECT * FROM customer_order;

CREATE TABLE IF NOT EXISTS copy_of_staff LIKE staff; 
INSERT INTO copy_of_staff SELECT * FROM staff;

CREATE TABLE IF NOT EXISTS copy_of_services LIKE services; 
INSERT INTO copy_of_services SELECT name_of_service, service_description, price FROM services;

CREATE TABLE IF NOT EXISTS copy_of_customers LIKE customers;
INSERT INTO copy_of_customers SELECT * FROM customers;

/* Stored Procedure for helping to prevent SQL Injection */
DROP PROCEDURE IF EXISTS Run_Query;

DELIMITER //
CREATE PROCEDURE Run_Query(IN query_num INT)
BEGIN
  /* Query 1: The manager of LCS wishes to know the details of customers who have placed a service request (order) & */
  /* Query 3: The manager wishes to know all the customers and details of their orders. */
  IF (query_num = 1 OR query_num = 3) THEN
    SELECT od.customer_email, c.first_name, c.last_name, c.house_no_name, c.city, c.postcode, od.order_date_time, od.services_name, od.service_ordered_price, od.discount, od.quantity
    FROM order_details as od 
      RIGHT JOIN customers as c ON od.customer_email = c.email_address;

  /* Query 2: The manager also wishes to know all staff members, and any orders they might have allocated. */
  ELSEIF (query_num = 2) THEN
    SELECT s.email_address as staff_email, s.first_name, s.last_name, od.services_name, od.service_ordered_price, co.date_time
    FROM staff as s 
      LEFT JOIN customer_order as co ON s.email_address = co.staff_email
      LEFT JOIN order_details as od ON od.order_date_time = co.date_time;

  /* No valid query index provided */
  ELSE
    SELECT 'Invalid query index' as error_message;
  
  END IF;
END //
DELIMITER ;

/* Call the procedure - Input 1, 2 or 3 */
CALL Run_Query(1);
CALL Run_Query(2);
CALL Run_Query(3);
CALL Run_Query(4); /* Displays error message */