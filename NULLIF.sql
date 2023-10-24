-- NULLIF

-- create product table

CREATE TABLE
	product
	(
	brand VARCHAR (50),
	seller VARCHAR (50)
	)
	;
INSERT INTO 
	product
	(brand, seller)
VALUES
	('iphone xr', 'ibox'),
	('iphone 16', 'ibox'),
	('iphone 20', 'imalang')
	;

SELECT
	*
FROM
	product
	
-- Find the ratio between seller and delete imalang rows.

SELECT 
	(
	SUM(CASE WHEN seller = 'ibox' THEN 1 ELSE 0 END)/
	SUM(CASE WHEN seller = 'imalang' THEN 1 ELSE 0 END)
	) seller_ratio
FROM
	product
	;

DELETE FROM
	product
WHERE
	seller = 'imalang'
	;
	
SELECT
	*
FROM
	product

-- make the missing values into NULL  

SELECT 
	(
	SUM (CASE WHEN seller = 'ibox' THEN 1 ELSE 0 END)/
	NULLIF (SUM(CASE WHEN seller = 'imalang' THEN 1 ELSE 0 END),0)
	) seller_ratio
FROM
	product
	;


	
	
	
	
	
	