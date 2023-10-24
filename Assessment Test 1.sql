-- 										Assessment Test 1

-- Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.

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
	SUM (amount) > 110
	;
-- How many films begin with the letter J?

SELECT
	title
FROM
	film
WHERE 
	 title  LIKE 'J%'
	 ;
-- What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

SELECT
	customer_id,
	first_name,
	last_name,
	address_id
FROM
	customer
WHERE
	first_name LIKE 'E%'
GROUP BY
	customer_id,
	first_name,
	last_name
HAVING
	address_id < 500
ORDER BY
	customer_id DESC
LIMIT 1
	;
	
	








