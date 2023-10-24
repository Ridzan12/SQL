-- INNER JOIN, FULL OUTER JOIN, LEFT OUTER JOIN, RIGHT JOIN, UNION.

-- JOIN Payment and Customer table.

SELECT
	first_name, 
	customer.customer_id, 
	amount
FROM
	customer
INNER JOIN
	payment
	ON customer.customer_id = payment.customer_id  
	;

-- FULL OUTER JOIN of address and city table. 

SELECT
	*
FROM
	address
FULL OUTER JOIN
	city
	ON address.city_id = city.city_id
	;

-- FULL OUTER JOIN of customer and payment table.

SELECT
	*
FROM
	customer
FULL OUTER JOIN
	payment
	ON customer.customer_id = payment.customer_id
	;
	
-- LEFT OUTER JOIN what film is empty?

SELECT
	film.film_id,
	title,
	inventory_id
FROM
	film
LEFT OUTER JOIN 
	inventory 
	ON film.film_id = inventory.film_id
WHERE
	inventory.film_id IS null 
	;

-- What are the emails of the customers who live in california?

SELECT
	email,
	district
FROM
	customer
INNER JOIN
	address
	ON customer.address_id = address.address_id
WHERE
	district = 'California'
	;

-- Get a list of all the movies "Nick Wahlberg" 

SELECT
	first_name,
	last_name,
	title
FROM
	actor
JOIN
	film ON actor.actor_id = film.film_id
JOIN
	film_actor ON film.film_id = film_actor.actor_id
WHERE
	first_name = 'Nick' AND last_name = 'Wahlberg'
	;
	
-- 
-- 