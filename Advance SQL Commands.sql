-- TIMESTAMP andd EXTRACT

-- What month this payment started?

SELECT DISTINCT
	EXTRACT (MONTH FROM payment_date)
FROM
	payment
	;

-- How long this transaction occured based on present time?

SELECT
	AGE (payment_date)
FROM
	payment
ORDER BY
	payment_id DESC
	;

-- Set the payment date into  day-month-year. 

SELECT 
	TO_CHAR (payment_date,'DD MONTHYYYY')
FROM
	payment
ORDER BY
	payment_date DESC
	;

-- During which month the payment occur?

SELECT DISTINCT
	TO_CHAR (payment_date, 'Month') 
FROM 
	payment
	;

-- How many payments occured on a Monday?

SELECT
    COUNT(payment_date) AS Monday_Payments
FROM
    payment
WHERE
    EXTRACT(DOW FROM payment_date) = 1;
	;

-- Mathematical,String Functions and Operation.

-- What the percentage of rental rate vs replacement cost?

SELECT
	ROUND(SUM (rental_rate)/SUM(replacement_cost)*100,0) AS percent_cost
FROM 
	film
 	;

-- STRING function and operators.

-- Concat the customer first name and last name.

SELECT
	first_name ||' '|| last_name AS full_name
FROM
	customer
	;
	
-- create an email based on customer full name.

SELECT
	LOWER (LEFT (first_name,2)) ||'.'|| LOWER (last_name) || '@gmail.com'
FROM
	customer
	;

-- Subquery and EXISTS 

-- What movie that higher than the average of rental rate? (rental rate average is 2.99)

SELECT
	title, rental_rate
FROM
	film
WHERE
	rental_rate 
	>(
SELECT
	AVG (rental_rate)
FROM
	film
	)
	;

-- Find what movie that returned on may 29

SELECT
	title,
	film_id
FROM
	film 
WHERE 
	film_id IN 
	(
SELECT
	film_id
FROM
	rental
JOIN
	inventory 
	ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'
	)
	;
	
-- Find the customer name that make transaction greater than 11.

SELECT
	first_name || ' ' || last_name
FROM
	customer AS a 
WHERE EXISTS
	(
SELECT 
	*
FROM 
	payment AS c
WHERE
	c.customer_id = a.customer_id AND amount > 11
	)
	;
	
-- Find all the film that have the same length.

SELECT
	f1.title, f2.title, f1.length
FROM
	film AS f1
JOIN 
	film AS f2 
	ON f1.film_id != f2.film_id
	AND f1.length = f2.length
	;
	
-- 
-- 