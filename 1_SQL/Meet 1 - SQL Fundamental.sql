select * -- mengambil semua data
from actor;

SELECT first_name, last_name, email -- mengambil nama dan email dari tabel customer
FROM customer;

SELECT DISTINCT 
FROM film;

SELECT COUNT(DISTINCT(amount))
FROM payment;

SELECT title, description  FROM film
WHERE rental_rate > 4
AND replacement_cost >= 19.99 AND rating = 'R';

SELECT email FROM customer 
WHERE first_name = 'Nancy';

SELECT email FROM customer 
WHERE email LIKE 'Nancy%';  -- LIKE sensitive

SELECT email FROM customer 
WHERE email ILIKE 'nancy%';  -- ILIKE insensitive

SELECT title, description
FROM film
WHERE title ILIKE 'outlaw%';

SELECT address, phone
FROM address
WHERE address ILIKE '%ipoh Drive%';

SELECT address_id 
FROM customer 
WHERE CAST (address_id AS VARCHAR(8)) -- mengubah menjadi string
LIKE '_4%'; --LIKE hanya untuk string

SELECT store_id, first_name, last_name
FROM customer
ORDER BY store_id ASC, first_name DESC;

SELECT store_id, first_name, last_name 
FROM customer 
ORDER BY store_id ASC, first_name, last_name DESC;

SELECT * 
FROM payment 
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

-- menampilkan mulai dari index 2
SELECT * from payment
WHERE amount != 0.00
ORDER BY rental_id DESC
LIMIT 1 OFFSET 2;

SELECT customer_id, payment_id, payment_date
FROM payment
ORDER BY payment_date
LIMIT 10;

SELECT title, length
FROM film
ORDER BY length
LIMIT 5;

SELECT COUNT(length)
FROM film
WHERE length <= 50;

-- BETWEEN (inclusive)
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

-- IN CLAUSE
SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie', 'Sam');


-- CHALLENGE
SELECT COUNT(DISTINCT(payment_id)) AS jumlah_transaksi 
FROM payment
WHERE amount > 5.00;

SELECT COUNT(actor) AS jumlah_nama
FROM actor
WHERE first_name ILIKE 'P%';

SELECT COUNT(DISTINCT(district)) AS distrik_unik 
FROM address;

-- GROUP BY
SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY 1 -- berdasarkan kolom ke 1
ORDER BY 2 DESC
LIMIT 10;

-- CHALLENGE
SELECT staff_id, COUNT(payment_id) AS jumlah_transaksi
FROM payment
GROUP BY staff_id
ORDER BY 2;

SELECT rating, ROUND(AVG(replacement_cost), 2) AS avg_rating 
FROM film
GROUP BY 1
ORDER BY 2 DESC;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY 1
ORDER BY 2 DESC;

-- HAVING Clause
SELECT customer_id, ROUND(AVG(amount), 2) AS avg_amount
FROM payment
GROUP BY 1
HAVING AVG(amount) > 4
ORDER BY 2 DESC;

-- HAVING challenge
SELECT customer_id, COUNT(*)
FROM payment
GROUP BY 1
HAVING COUNT(*) >= 40;

SELECT customer_id, SUM(amount) AS total_spend
FROM payment
WHERE staff_id = 2
GROUP BY 1
HAVING SUM(amount) > 100
ORDER BY 2 DESC;

-- In Class Exercise
SELECT customer_id, SUM(amount) AS total_spend
FROM payment
WHERE staff_id = 2
GROUP BY 1
HAVING SUM(amount) > 110
ORDER BY 2 DESC;

SELECT COUNT(*) jumlah_title
FROM film
WHERE title ILIKE 'J%';

SELECT * FROM customer;

SELECT first_name, last_name, customer_id
FROM customer
WHERE first_name ILIKE 'E%' AND address_id < 500
ORDER BY 3 DESC
LIMIT 1;

-- INNER JOIN
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 10;

--OUTER JOIN
SELECT * FROM payment p
FULL OUTER JOIN customer c
ON p.customer_id = c.customer_id
LIMIT 10;

-- LEFT OUTER JOIN
SELECT * FROM payment p
LEFT OUTER JOIN customer c
ON p.customer_id = c.customer_id
LIMIT 10;

-- RIGHT OUTER JOIN
SELECT * FROM payment p
RIGHT OUTER JOIN customer c
ON p.customer_id = c.customer_id
LIMIT 10;

-- JOIN Challenge
SELECT c.first_name, a.district, c.email
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
WHERE a.district = 'California';

-- Film with actor Nick Wahlberg
SELECT f.title, ac.first_name, ac.last_name
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor ac
ON fa.actor_id = ac.actor_id
WHERE ac.first_name = 'Nick' AND ac.last_name = 'Wahlberg';
