-- sql Basics assignment

/*1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints*/

USE student;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
age INT UNIQUE,
email VARCHAR (100),
salary FLOAT DEFAULT 30000);

/* 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.

Answer ---  Constraints in a database are rules that are applied to data to ensure its accuracy, consistency, and reliability, 
essentially safeguarding data integrity by preventing invalid or inconsistent data from being entered or modified. 
They define limitations and requirements that data must meet, upholding the quality of information within the database 
by enforcing specific business rules and relationships between different tables.*/

/* 3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.

Answer --- Appling the NOT NULL constraint to a column to ensure that every record in that column contains a valid value, 
preventing empty or missing data. A primary key, by definition, cannot contain NULL values, as this would violate the 
uniqueness requirement of a primary key. */

/* 4.  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.

Ans --- To add or remove constraints on an existing table in SQL, you use the ALTER TABLE statement. 
To add a constraint 
	ALTER TABLE students ADD CONSTRAINT unique_email UNIQUE (email);
    
To remove a constraint,
	    ALTER TABLE students DROP CONSTRAINT unique_email;
 */

/* 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.

Ans --- Attempting to insert, update, or delete data that violates constraints in a database will result in the operation 
being rejected, preventing data inconsistency and maintaining data integrity. An error message, like 
"Integrity constraint violation: FK_ORDERS_CUSTOMERS" might occur, indicating a foreign key issue. */


-- 6. You created a products table without constraints as follows:
CREATE TABLE products (
	product_id INT,
	product_name VARCHAR(50),
	price DECIMAL(10, 2));
    
-- Now, you realise that?
-- The product_id should be a primary keyQ
-- The price should have a default value of 50.00

ALTER TABLE products
ADD PRIMARY KEY (product_id),
ALTER COLUMN price SET DEFAULT 50.00;

/* 7. You have two tables: 1)students 2)classies
Write a query to fetch the student_name and class_name for each student using an INNER JOIN.*/
-- Answer
SELECT Student_name, Class_name
FROM Students s INNER JOIN Classes c
ON s.Class_id = c.Class_id;

/* 8. Consider the following three tables: 1)Orders 2)Customers 3)Products
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order 
Hint: (use INNER JOIN and LEFT JOIN).*/
-- Answer
SELECT o.order_id, c.customer_name, p.product_name
FROM Products p
LEFT JOIN Orders o
ON p.order_id = o.order_id
LEFT JOIN Customers c
ON o.customer_id = c.customer_id;

/* 9. Given the following tables: 1)Sales 2)Products
Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function */
-- Answer
SELECT p.Product_name, 
SUM(s.Amount) AS total_sales_amount
FROM Sales s
INNER JOIN Products p
ON s.Product_id = p.Product_id
GROUP BY p.Product_name;

/* 10. You are given three tables: 1)Orders 2)Customer 3)Order_Details
Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.*/

SELECT O.Order_id, C.Customer_name, OD.Quantity
FROM Orders O
INNER JOIN Customers C
ON O.Customer_id = C.Customer_id
INNER JOIN Order_Details OD
ON O.Order_id = OD.Order_id;


-- SQL COMMANDS

/* 1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences */
-- Answer
/*
Primary Key:
- Uniquely identifies each row in a table.
- Cannot be NULL.
- Example: customer.customer_id

Foreign Key:
- Column in one table that refers to the primary key of another table.
- Can be NULL and allows linking between tables.
- Example: customer.store_id references store.store_id

Difference:
- Primary key maintains entity integrity; foreign key maintains referential integrity.
- Primary key is unique and non-null; foreign key can repeat values and can be null.
*/

/* 2. List all details of actors*/
SELECT * FROM actor;

/* 3. List all customer information from DB. */
SELECT * FROM Customer;

/* 4. List different countries */
SELECT distinct Country 
FROM Country;

/* 5. Display all active customers */
SELECT CONCAT(First_name, " ",Last_name) AS Active_Customers
FROM Customer
WHERE active >= 1;

/* 6. List of all rental IDs for customer with ID 1. */
SELECT Rental_id, Customer_id, Rental_date 
FROM Rental
WHERE Customer_id LIKE 1;

/* 7. Display all the films whose rental duration is greater than 5.*/
SELECT Film_id, Title, Release_year, Rental_Duration 
FROM Film
WHERE Rental_Duration > 5;

/* 8.  List the total number of films whose replacement cost is greater than $15 and less than $20. */
SELECT COUNT(*) AS total_films
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

/* 9. Display the count of unique first names of actors. */
SELECT COUNT(DISTINCT First_name) AS Unique_names
FROM Actor;

/* 10 Display the first 10 records from the customer table. */
SELECT * FROM Customer
LIMIT 10;

/* 11.  Display the first 3 records from the customer table whose first name starts with ‘b’. */
SELECT * FROM Customer
WHERE First_name LIKE 'B%'
LIMIT 3;

/* 12. Display the names of the first 5 movies which are rated as ‘G’. */
SELECT Film_id, Title, Rating
FROM Film
WHERE Rating LIKE 'G'
LIMIT 5; 

/* 13. Find all customers whose first name starts with "a". */
SELECT Customer_id, First_name 
FROM Customer
WHERE First_name LIKE 'A%';

/* 14.  Find all customers whose first name ends with "a". */
SELECT Customer_id, First_name 
FROM Customer
WHERE First_name LIKE '%A';

/* 15. Display the list of first 4 cities which start and end with ‘a’. */
SELECT City_id, City, Country_id
FROM City
WHERE City LIKE 'A%'AND City LIKE '%A'
LIMIT 4;

/* 16. Find all customers whose first name have "NI" in any position. */
SELECT Customer_id, First_name 
FROM Customer
WHERE First_name LIKE '%NI%';

/* 17. Find all customers whose first name have "r" in the second position. */
SELECT customer_id, first_name
FROM customer
WHERE first_name LIKE '_r%';

/* 18. Find all customers whose first name starts with "a" and are at least 5 characters in length. */
SELECT customer_id, first_name
FROM customer
WHERE first_name LIKE 'A%'
AND LENGTH(First_name) >= 5;

/* 19. Find all customers whose first name starts with "a" and ends with "o". */
SELECT customer_id, first_name
FROM customer
WHERE first_name LIKE 'A%'
AND first_name LIKE '%O';

/* 20. Get the films with pg and pg-13 rating using IN operator. */
SELECT Film_id, Title, Rating 
FROM Film
WHERE Rating IN ('Pg', 'Pg-13');

/* 21. Get the films with length between 50 to 100 using between operator. */
SELECT  Film_id, Title, Description, Rating 
FROM Film  
WHERE length BETWEEN 50 AND 100;

/* 22. Get the top 50 actors using limit operator. */
SELECT * 
FROM Actor
ORDER BY Actor_id
LIMIT 50;

/* 23. Get the distinct film ids from inventory table. */
SELECT DISTINCT(Film_id)
FROM Inventory
ORDER BY Film_id ASC;

-- FUNCTIONS--
-- Basic Aggregate Functions:

/* 1. Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function.*/
SELECT COUNT(*) AS total_rentals
FROM Rental;

/* 2. Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.*/
SELECT Film_id, Title, ROUND(AVG(Rental_Duration)) AS Rented_Days
FROM Film
GROUP BY Film_id, Title;

/* 3. Display the first name and last name of customers in uppercase.
Hint: Use the UPPER () function. */
SELECT Customer_id, 
UPPER(First_name) AS First_name, 
UPPER(Last_name) AS Last_name
FROM Customer;

/* 4. Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function */
SELECT Rental_id,  
MONTH(Rental_date) AS Rental_Month  
FROM Rental;  

-- GROUP BY:

/* 5. Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY.*/
SELECT Customer_id,  
COUNT(Rental_id) AS Rental_count  
FROM Rental  
GROUP BY Customer_id  
ORDER BY Rental_count DESC;  

/* 6. Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY. */
SELECT s.Store_id, 
SUM(p.Amount) AS Total_Revenue
FROM Payment p
JOIN Staff ST 
ON p.Staff_id = st.Staff_id
JOIN Store s 
ON ST.Store_id = s.Store_id
GROUP BY s.Store_id;

/* 7. Determine the total number of rentals for each category of movies.
Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.*/
SELECT c.name AS category_name, 
COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id
JOIN film f 
ON fc.film_id = f.film_id
JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;

/* 8. Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY.*/
SELECT l.name AS language_name, 
ROUND(AVG(f.rental_rate), 2) AS avg_rental_rate
FROM film f
JOIN language l 
ON f.language_id = l.language_id
GROUP BY l.name
ORDER BY avg_rental_rate DESC;

-- Joins---

/* 9. Display the title of the movie, customer s first name, and last name who rented it.
Hint: Use JOIN between the film, inventory, rental, and customer tables.*/
SELECT f.title AS movie_title, 
       c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id
ORDER BY f.title, c.first_name;

/* 10. Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.*/
SELECT a.First_name, a.Last_name
FROM Actor a
JOIN Film_Actor fa ON a.Actor_id = fa.Actor_id
JOIN Film f ON fa.Film_id = f.Film_id
WHERE f.Title LIKE 'Gone with the Wind';

/* 11. Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY. */
SELECT C.First_name, C.Last_name,
SUM(P.Amount) as Total_Amount_Spent
FROM Customer C
JOIN Payment P ON C.Customer_id = P.Customer_id
JOIN Rental R ON R.Rental_id = P.Rental_id
GROUP BY C.Customer_id, C.First_name, C.Last_name
ORDER BY Total_Amount_Spent DESC;

/* 12. List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY. */
SELECT c.first_name, c.last_name, ci.city, f.title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
ORDER BY c.last_name, c.first_name, f.title;

-- Advanced Joins and GROUP BY ----

/* 13. Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results. */
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;

/* 14. Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY. */
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2
ORDER BY c.last_name, c.first_name;

-- Windows Function ---

/* 1. Rank the customers based on the total amount they've spent on rentals. */
SELECT c.customer_id, c.first_name, c.last_name, 
SUM(p.amount) AS total_amount_spent,
RANK() OVER (ORDER BY SUM(p.amount) DESC) AS Ranks_
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount_spent DESC;

/* 2. Calculate the cumulative revenue generated by each film over time. */
SELECT f.title, p.payment_date, 
SUM(p.amount) AS daily_revenue,
SUM(SUM(p.amount)) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title, p.payment_date
ORDER BY f.title, p.payment_date;

/* 3. Determine the average rental duration for each film, considering films with similar lengths. */
SELECT 
    CASE 
        WHEN f.length BETWEEN 0 AND 60 THEN '0-60 mins'
        WHEN f.length BETWEEN 61 AND 120 THEN '61-120 mins'
        WHEN f.length BETWEEN 121 AND 180 THEN '121-180 mins'
        ELSE '180+ mins'
    END AS length_category,
    f.title,
    AVG(f.rental_duration) AS avg_rental_duration
FROM film f
GROUP BY length_category, f.title
ORDER BY length_category, avg_rental_duration DESC;

/* 4.  Identify the top 3 films in each category based on their rental counts. */
SELECT category_name, title, rental_count, Rank_
FROM (
    SELECT c.name AS category_name, 
           f.title, 
           COUNT(r.rental_id) AS rental_count,
           RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS Rank_
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name, f.title
) ranked_films
WHERE Rank_ <= 3
ORDER BY category_name, Rank_;

/* 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals
across all customers. */
WITH customer_rentals AS (
    SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
average_rentals AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM customer_rentals
)
SELECT cr.customer_id, cr.first_name, cr.last_name, cr.total_rentals, 
       ar.avg_rentals, 
       (cr.total_rentals - ar.avg_rentals) AS difference_from_avg
FROM customer_rentals cr, average_rentals ar
ORDER BY difference_from_avg DESC;

/* 6. Find the monthly revenue trend for the entire rental store over time. */
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month_year,
SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY month_year
ORDER BY month_year;

/* 7.  Identify the customers whose total spending on rentals falls within the top 20% of all customers. */
WITH customer_spending AS (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
ranked_customers AS (
    SELECT *,
		PERCENT_RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
    FROM customer_spending
)
SELECT customer_id, first_name, last_name, total_spent
FROM ranked_customers
WHERE spending_rank <= 0.2
ORDER BY total_spent DESC;

/* 8. Calculate the running total of rentals per category, ordered by rental count. */
 WITH category_rentals AS (
    SELECT c.name AS category_name, COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name
)
SELECT category_name, rental_count,
       SUM(rental_count) OVER (ORDER BY rental_count DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM category_rentals
ORDER BY rental_count DESC;

/* 9. Find the films that have been rented less than the average rental count for their respective categories. */
WITH film_rentals AS (
    SELECT f.film_id, f.title, c.name AS category_name, COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.film_id, f.title, c.name
),
category_avg AS (
    SELECT category_name, AVG(rental_count) AS avg_rentals
    FROM film_rentals
    GROUP BY category_name
)
SELECT fr.film_id, fr.title, fr.category_name, fr.rental_count, ca.avg_rentals
FROM film_rentals fr
JOIN category_avg ca ON fr.category_name = ca.category_name
WHERE fr.rental_count < ca.avg_rentals
ORDER BY fr.category_name, fr.rental_count ASC;

/* 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month. */
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%m') AS month_year,
    SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY month_year
ORDER BY total_revenue DESC
LIMIT 5;












