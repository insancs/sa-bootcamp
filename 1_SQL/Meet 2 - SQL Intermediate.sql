-- TIMESTAMP
SHOW TIMEZONE;

SELECT NOW();

SELECT TIMEOFDAY();

SELECT CURRENT_DATE, CURRENT_TIME;

SHOW ALL;


-- EXTRACT()
SELECT 
	EXTRACT(YEAR FROM payment_date) AS year, 
	EXTRACT(MONTH FROM payment_date) AS month, 
	EXTRACT(DAY FROM payment_date) AS day
FROM payment;

-- AGE()
SELECT 
	customer_id, 
	AGE(create_date) AS age 
FROM customer; 

-- TO_CHAR()
SELECT 
	customer_id, 
	TO_CHAR(create_date, 'mm-dd-yy') 
FROM customer;

SELECT 
	customer_id, 
	TO_CHAR(create_date, 'day-month-yyyy') 
FROM customer;

--TIMESTAMP CHALLENGE
SELECT 
	TO_CHAR(payment_date, 'yyyy') AS years,
	TO_CHAR(payment_date, 'month') AS months,
	COUNT(DISTINCT payment_id) AS payment_counts
FROM payment
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT 
	TO_CHAR(payment_date, 'day') AS days,
	COUNT(DISTINCT payment_id) AS num_payment
FROM payment
GROUP BY 1
ORDER BY 2 DESC;

SELECT 
	rental_rate,
	replacement_cost,
	ROUND((rental_rate/replacement_cost)*100,2) AS percent_cost
FROM film;

-- STRING FUNCTION
SELECT 
	UPPER(first_name), 
	LOWER(last_name),
	first_name || ' ' || last_name AS full_name
FROM customer;

-- STRING CHALLENGE
SELECT
	LOWER(LEFT(first_name, 1)) || LOWER(last_name) || '@gmail.com' AS custom_email
FROM customer;

SELECT
	first_name,
	last_name,
	SUBSTRING(LOWER(first_name), 1, 1) || LOWER(last_name) || '@gmail.com' AS custom_email
FROM customer;

-- SUBQUERY
SELECT title, rental_rate
FROM film 
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT film_id, title
FROM film
WHERE film_id
IN (SELECT film_id FROM inventory
   	FULL OUTER JOIN rental 
	ON inventory.inventory_id=rental.inventory_id
   	WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')


-- SELF JOIN
SELECT f1.title, f2.title, f1.length, f2.length
FROM film AS f1
INNER JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length != f2.length;

-- CREATE TABLE
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR (50) UNIQUE NOT NULL,
	password VARCHAR (50) NOT NULL,
	email VARCHAR (50) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP NOT NULL,
)

CREATE TABLE job(
	job_id SERIAL NOT NULL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)
