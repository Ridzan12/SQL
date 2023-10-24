-- 												SELECT, FROM, DISTINCT.

-- We want to send out a promotional email to our existing customers. 

SELECT 
	first_name,
	last_name,
	email
FROM 
	customer
	;
	
-- What ratings film do we have available?

SELECT DISTINCT
	rating
FROM 
	film
	;




-- 												 COUNT, WHERE, AND, OR.
-- Count unique value of amount column

SELECT COUNT
	(DISTINCT amount
	)
FROM 
	payment
	;
	
-- Find information about Jared.

SELECT 
	*
FROM 
	customer
WHERE 
	first_name = 'Jared' 
	AND email = 'jared.ely@sakilacustomer.org'
	;

-- Logical Operator <, >, <=, >=, (<>, !=).

SELECT 
	title,
	rental_rate,
	replacement_cost,
	rating
FROM
	film
WHERE rental_rate > 4
	AND replacement_cost >= 19.99
	AND rating = 'R'
	;

-- How many films that have NC-17 and G rating?

SELECT COUNT
	(*)
FROM 
	film
WHERE rating = 'NC-17'
	OR rating = 'G'
	;
	
-- How many movies that not include PG-13 ratings?

SELECT COUNT
	(*)
FROM film
WHERE rating != 'PG-13'
	;

-- What is the email for the customer with thhe name Nancy Thomas?

SELECT
	first_name,
	last_name,
	email
FROM 
	customer
WHERE 
	first_name = 'Nancy' 
	AND last_name = 'Thomas'
	;
	
-- Could you give them the description for the movie "Outlaw Hanky"?

SELECT
	title,
	description
FROM 
	film
WHERE 
	title = 'Outlaw Hanky'
	;
	
-- Can you get the phone number for the customer who lives at 256 Ipoh Drive?

SELECT
	address,
	phone
FROM
	address
WHERE
	address = '259 Ipoh Drive'
	;



-- 													ORDER BY, ASC, DESC.

-- Order by the most expensive rental rate!

SELECT
	title,
	rental_rate
FROM
	film
ORDER BY
	rental_rate DESC
	;
	
-- Order By store id and name.

SELECT
	store_id,
	first_name,
	last_name
FROM
	customer
ORDER BY
	store_id ASC, first_name ASC
	;

-- 											LIMIT
-- Find the top 10 most recent transaction with the highest amount!

SELECT
	*
FROM
	payment
ORDER BY 
	payment_date DESC,
	amount DESC
LIMIT 10
	;

-- What are the customer id's of the first 10 customers who created a payment?

SELECT
	customer_id,
	payment_date
FROM
	payment
ORDER BY
	payment_date ASC
LIMIT 10
	;
	
-- What are the titles of the 5 shortest (in length of runtime) movies?

SELECT
	title,
	length
FROM 
	film
ORDER BY 
	length ASC
LIMIT 5
	;

-- How many movies that customer can watch any movie that is 50 minutes or less in runtime?

SELECT COUNT
	(length)
FROM 
	film
WHERE
	length <= 50 
	;
	
-- 										BETWEEN, IN, LIKE, ILIKE

-- Find the history of payment of february 2007!

SELECT 
	*
FROM
	payment
WHERE
	payment_date
BETWEEN
	'2007-02-01' AND '2007-03-01'
ORDER BY 
	payment_date ASC
	;
	
-- Choose 3 different amount!

SELECT COUNT
	(*)
FROM
	payment
WHERE
	amount 
	NOT IN (0.99, 1.98, 1.99)
	;

-- Find the customer Called Linda, Jamie, and Danielle!

SELECT
	*
FROM
	customer
WHERE 
	first_name IN ('Linda', 'Jamie', 'Danielle')
	;

-- How many people have a name that start with first name 'S' and last name 'M'?

SELECT 
	*
FROM
	customer
WHERE 
	first_name ILike 's%' AND last_name LIKE 'M%'
	;

-- Word with 'ha' inside their name.

SELECT
	*
FROM 
	customer
WHERE
	first_name ILIKE '_ha%'
	;
-- 										General Challenge

-- How many payment Transactions were greater than $5.00?

SELECT COUNT
	(amount)
FROM 
	payment
WHERE amount > 5
	;
-- How many actors have a first name that starts with the letter P?

SELECT COUNT
	(first_name)
FROM
	actor
WHERE 
	first_name LIKE 'P%'
	;
	
-- How many unique districts are our customers from?

SELECT COUNT
	(DISTINCT district)
FROM 
	address
	;

-- Retrieve the list of names for those distinct districts from the previous question.

SELECT DISTINCT
	district
FROM
	address
	;
	
-- How many films havee a rating of R and a replacement cost between $5 and $15?

SELECT COUNT
	(*)
FROM
	film
WHERE 
	rating = 'R' 
	AND 
	replacement_cost BETWEEN 5 AND 15
	;
	
-- How many films have the word Truman somewhere in the title?

SELECT COUNT
	(title)
FROM 
	film
WHERE 
	title LIKE '%Truman%'
	;
	







	
	
	
	
	
	
	
	