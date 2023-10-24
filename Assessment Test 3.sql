-- Create student table. 

CREATE TABLE
	student
	(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR (100),
	last_name VARCHAR (100),
	homeroom_numbers VARCHAR (50),
	phone VARCHAR (50) UNIQUE NOT NULL,
	email VARCHAR (100) UNIQUE NOT NULL,
	graduation_year TIMESTAMP
	)
	;

-- fill student rows.

INSERT INTO
	student
	(
	first_name,
	last_name,
	homeroom_numbers,
	phone,
	email,
	graduation_year
	)
VALUES
	(
	'Ridzan',
	'Pahmi',
	'22',
	'081350274595',
	'rpznznz23@gmail.com',
	CURRENT_TIMESTAMP
	)
	;
	
SELECT
	*
FROM
	student
	
-- Create teacher Table.

CREATE TABLE
	teacher
	(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR (200),
	last_name VARCHAR (200),
	homeroom_number VARCHAR (50),
	departement VARCHAR (100),
	email VARCHAR(100) UNIQUE NOT NULL,
	phone VARCHAR (50) UNIQUE NOT NULL
	)
	;
	
-- Fill teacher rows.

INSERT INTO 
	teacher
	(
	first_name,
	last_name,
	homeroom_number,
	departement,
	email,
	phone
	)
VALUES
	(
	'Bambang',
	'Supriadi',
	'212',
	'Biology',
	'bambang@gmail.com',
	'087289729281'
	)
	;
	
SELECT
	*
FROM
	teacher
	
-- 
-- 