-- 								AGG Functions (AVG, COUNT, MAX, MIN, SUM)																	

-- What the minimum replacement cost?

SELECT MIN
	(replacement_cost)
FROM
	film
	;
	
-- What the maximum and minimum of replacement cost?

SELECT 
	MAX (replacement_cost), 
	MIN (replacement_cost),
	ROUND (AVG(replacement_cost),2)
FROM
	film
	;

-- Summarize the replacement cost

SELECT
	ROUND(SUM(replacement_cost),0)
FROM
	film
	;

--															 GROUP BY

-- Find the top 10 customer that making the most payment!

SELECT
	customer_id,
	SUM(amount)
FROM
	payment
GROUP BY 
	customer_id
ORDER BY
	SUM (amount) DESC
LIMIT 10
	;
	
-- 

SELECT
	staff_id,
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	staff_id,
	customer_id
ORDER BY
	customer_id, staff_id 
	;
	
-- Find the most payment time!

SELECT
	DATE (payment_date),
	SUM (amount)
FROM
	payment
GROUP BY
	DATE (payment_date) 
ORDER BY
	SUM (amount) DESC
	;

-- Between staff id 1 and 2 which staff handled the most payments?

SELECT
	staff_id,
	COUNT (customer_id)
FROM
	payment
GROUP BY
	staff_id
ORDER BY
	COUNT (customer_id) DESC
	;
	
-- What is the average replacement cost per MPAA rating?

SELECT
	rating,
	ROUND(AVG(replacement_cost),2)
FROM
	film
GROUP BY 
	rating
ORDER BY
	AVG (replacement_cost) DESC
	;
	
-- What are the customer id's of the top 5 customers by total spend?

SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id 
ORDER BY
	SUM (amount) DESC
LIMIT 5
	;
	
-- 																HAVING

-- Between store id 1 and 2, which store id that have more than 274 customer?

SELECT
	store_id,
	COUNT (customer_id)
FROM 
	customer
GROUP BY
	store_id
HAVING
	COUNT (customer_id) > 274
	;
	
-- We will assign paltinum loyal customers that have had 40 or more transaction payments.
-- What customer id's eligible for platinum status?

SELECT
	customer_id AS PLATINUM,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	customer_id
HAVING 
	COUNT (payment_id) >= 40
ORDER BY
	COUNT (payment_id) DESC
	;
	
-- What are the customer id of customers who have spent more than $100 in payment transactions with our staff_id member 2?

SELECT
	customer_id,
	staff_id,
	SUM (amount)
FROM
	payment
WHERE
	staff_id = 2
GROUP BY 
	customer_id,
	staff_id
HAVING
	SUM (amount) >100
ORDER BY
	staff_id DESC
	;

-- 
-- 