-- In this lab, you will be working with the Sakila database on movie rentals.
USE sakila;

-- 1. List the number of films per category.
-- tables: film_category, category
-- col: category_id
SELECT c.name AS category_name, COUNT(fc.film_id) AS number_films
FROM category c
JOIN film_category fc
USING (category_id)
GROUP BY category_name;

-- 2. Retrieve the store ID, city, and country for each store.
-- tables: store, address, city, country
-- col: store-address:address_id; address-city:city_id, city-country:country_id
SELECT store_id, city, country
FROM store s
JOIN address a
USING(address_id)
JOIN city ci
ON a.city_id=ci.city_id
JOIN country co
ON ci.country_id=co.country_id;

-- 3. Calculate the total revenue generated by each store in dollars.
-- tables: store, staff, payment
-- col: store-staff: address_id; staff-payment: staff_id
SELECT store_id, SUM(amount) AS total_revenue
FROM store s
JOIN customer cu
USING(store_id)
JOIN payment p
ON cu.customer_id=p.customer_id
GROUP BY s.store_id
ORDER BY total_revenue DESC;


-- 4. Determine the average running time of films for each category.
-- tables: category, film_category, film
-- col: category-film_category: category_id; film_category-film: film_id
SELECT c.name as category_name, AVG(length) AS average_time
FROM category c
JOIN film_category fc
USING (category_id)
JOIN film f
ON fc.film_id=f.film_id
GROUP BY category_name
ORDER BY average_time DESC;