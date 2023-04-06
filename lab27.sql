-- Lab | SQL Join (Part I)
-- In this lab, you will be using the Sakila database of movie rentals.
USE sakila;
-- Instructions
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT 
    category.name as category, 
    COUNT(*) as films
FROM category
JOIN film_category
    ON category.category_id = film_category.category_id
GROUP BY category
ORDER BY films DESC;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT 
    staff.first_name, 
    staff.last_name, 
    SUM(payment.amount) as total_amount
FROM staff
JOIN payment
    ON staff.staff_id = payment.staff_id
WHERE payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff.staff_id
ORDER BY total_amount DESC;

-- Which actor has appeared in the most films?
SELECT 
    actor.first_name, 
    actor.last_name, 
    COUNT(*) as films
FROM actor
JOIN film_actor
    ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY films DESC;


-- Most active customer (the customer that has rented the most number of films)
SELECT 
    customer.first_name as customer_first_name, 
    customer.last_name as customer_last_name, 
    COUNT(*) as films_rented
FROM customer
JOIN rental
    ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY films_rented DESC;


-- Display the first and last names, as well as the address, of each staff member.
SELECT 
    staff.first_name as staff_f_name, 
    staff.last_name as staff_l_name, 
    address.address as staff_address
FROM staff
JOIN address
    ON staff.address_id = address.address_id;


-- List each film and the number of actors who are listed for that film.
SELECT 
    film.title, 
    COUNT(*) as number_of_actors
FROM film
JOIN film_actor
    ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY number_of_actors DESC;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT 
    customer.first_name as customer_f_name, 
    customer.last_name as customer_l_name, 
    SUM(payment.amount) as total_paid
FROM customer
JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer_l_name ASC;


-- List number of films per category.
SELECT 
    category.name as category, 
    COUNT(*) as number_of_films
FROM category
JOIN film_category
    ON category.category_id = film_category.category_id
GROUP BY category
ORDER BY number_of_films DESC;

