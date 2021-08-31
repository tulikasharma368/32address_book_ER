CREATE DATABASE address_book_er;

use address_book_er;


CREATE TABLE person(
	person_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(150) NOT NULL,
	gender CHAR(6)
	);


INSERT INTO person (name, address, gender) VALUES
	('Rachel', 'Taxes', 'Female'),
	('Ross', 'New York', 'Male'),
	('Chandler', 'Manhatten', 'Male'),
	('Monica', 'New York', 'Female'),
	('Phoebe', 'California', 'Female'),
	('Joey', 'Florida', 'Male');
SELECT * FROM person;


CREATE TABLE contact_num(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	person_id INTEGER,
	phone_number VARCHAR(20)
	);

INSERT INTO contact_num(person_id, phone_number) VALUES
	('1','9999999999'),
	('2','9999999998'),
	('3','9999999979'),
	('4','9777999979'),
	('5','9999988888'),
	('6','9669999979'),
	('1','9953636979'),
	('2','9111999979'),
	('5','9444999979');
SELECT * FROM contact_num;
	

CREATE TABLE relation(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	person_id INTEGER,
	type VARCHAR(10) NOT NULL
	);


INSERT INTO relation(person_id, type) VALUES
	('1', 'Friend'),
	('2', 'Family'),
	('3', 'Business'),
	('3', 'Family'),
	('4', 'Collegue'),
	('4', 'Friend'),
	('5', 'Friend'),
	('6', 'Friend'),
	('6', 'Family');
SELECT * FROM relation;


SELECT person.name, contact_num.phone_number 
FROM person INNER JOIN contact_num 
ON contact_num.person_id = person.person_id;

SELECT * FROM person WHERE address = 'New York';
SELECT address, Count(*) FROM person WHERE address = 'Manhatten';
SELECT * FROM person p WHERE address = 'New York' ORDER BY p.name;

SELECT type, COUNT(name) 
FROM person p join relation r 
ON p.person_id = r.person_id group by type;