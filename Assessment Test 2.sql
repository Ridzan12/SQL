-- Assessment Test 2

-- How can you retrieve all the information from the cd.facilities table?

SELECT
	*
FROM
	cd.facilities
	;
-- How would you retrieve a list of only facility names and costs?

SELECT
	name AS facilities,
	membercost AS cost
FROM
	cd.facilities
	;
	
-- How can you produce a list of facilities that charge a fee to members?

SELECT
	*
FROM
	cd.facilities
WHERE
	membercost != 0
	;

-- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost?  

SELECT
	facid, 
	name AS facilities, 
	membercost,
	monthlymaintenance 
FROM
	cd.facilities
WHERE
	membercost > 0 
	AND membercost < (monthlymaintenance/50)
	;

-- How can you produce a list of all facilities with the word 'Tennis' in their name?

SELECT
	*
FROM
	cd.facilities
WHERE
	name LIKE '%Tennis%'
	;
	
-- 	How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

SELECT
	*
FROM
	cd.facilities
WHERE
	name LIKE '%2%'
	;

-- How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question. 

SELECT
	memid,
	surname,
	firstname,
	joindate
FROM
	cd.members
WHERE
	joindate
	BETWEEN '2012-09-01' AND '2012-09-30'
	;

-- How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.

SELECT
	DISTINCT (surname)
FROM
	cd.members
ORDER BY
	surname ASC
LIMIT 10
	;	

-- You'd like to get the signup date of your last member. How can you retrieve this information? 

SELECT
	MAX (joindate)
FROM
	cd.members
	;
-- Produce a count of the number of facilities that have a cost to guests of 10 or more.

SELECT
	COUNT(guestcost)
FROM
	cd.facilities
WHERE
	guestcost >= 10
	;

-- Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.

SELECT
	facid,
	SUM (slots) AS total_slots
FROM
	cd.bookings
WHERE
	starttime >= '2012-09-01' AND starttime<= '2012-10-01'
GROUP BY
	facid
ORDER BY
	SUM (slots)
	;
	
-- Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.

SELECT
	facid,
	SUM (slots) AS total_slots
FROM
	cd.bookings
GROUP BY
	facid
HAVING
	SUM (slots) > 1000
ORDER BY 
	facid
	;

-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time. 

SELECT
	starttime AS start_time,
	name
FROM
	cd.bookings
LEFT JOIN
	cd.facilities
	ON cd.facilities.facid = cd.bookings.facid
WHERE
	starttime >= '2012-09-21' AND starttime <= '2012-09-22'
	AND name Like '%Tennis Court%'
ORDER BY 
	starttime ASC
	;
	
-- 

SELECT
	firstname ||' '|| surname,
	starttime
FROM
	cd.bookings
INNER JOIN
	cd.members
	ON cd.members.memid = cd.bookings.memid
WHERE
	firstname = 'David' AND surname = 'Farrell'



	
