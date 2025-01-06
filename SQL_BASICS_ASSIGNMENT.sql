-- 1. Create a table called employees with the following structure
 emp_id (integer, should not be NULL and should be a primary key)
 emp_name (text, should not be NULL)
 age (integer, should have a check constraint to ensure the age is at least 18)
 email (text, should be unique for each employee)
 salary (decimal, with a default value of 30,000).
 Write the SQL query to create the above table with all constraints.

-- Ans:

CREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL DEFAULT 30000
);

-- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide 
examples of common types of constraints.

-- Ans:

-- Constraints in a database are rules applied to the data to ensure accuracy and reliability. They help maintain data integrity by enforcing specific conditions on the data in a database. Here’s a detailed look at their purpose and some common types:

-- Purpose of Constraints
-- I. Data Integrity: Constraints ensure that data entered into the database is accurate and reliable. They prevent invalid data from being stored.

-- II. Consistency: By enforcing rules, constraints ensure that data across multiple tables remains consistent.

-- III. Reduction of Redundancy: Constraints help eliminate duplicate data, thereby reducing data redundancy.

-- IV. Ease of Maintenance: Enforcing constraints makes it easier to maintain the database and reduces the need for manual data checks and corrections.

-- Common Types of Constraints

-- I. Primary Key Constraint: Ensures that each row in a table is unique and not null. It uniquely identifies each record in the table.

-- Example:

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);

-- II. Foreign Key Constraint: Ensures that the value in a column matches the value in another table’s primary key column, establishing a link between the two tables.
-- Example:

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- III. Unique Constraint: Ensures that all values in a column are unique across the table, preventing duplicate entries.

-- Example:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE,
    Name VARCHAR(100)
);

-- IV. Not Null Constraint: Ensures that a column cannot have a null value.
-- Example:

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL
);

-- V. Check Constraint: Ensures that all values in a column satisfy a specific condition.
-- Example:

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    CHECK (Price > 0)
);

-- VI. Default Constraint: Provides a default value for a column when no value is specified.
-- Example:

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    Balance DECIMAL(10, 2) DEFAULT 0.00
);


-- VII. Example of Combining Constraints:

-- we can combine multiple constraints to ensure thorough data integrity:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Constraints play a crucial role in maintaining the quality and integrity of the data stored in a database, making them essential for any database management system.


-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

-- Ans: 

-- Applying the NOT NULL Constraint
-- The NOT NULL constraint is used to ensure that a column cannot have a null value. Here are some reasons why you might apply this constraint:

-- Data Integrity: Enforcing NOT NULL ensures that important fields always contain data. For example, in a customer database, you might want to ensure that every customer has an email address.

-- Mandatory Fields: Certain fields may be required for the application to function correctly. For example, in an orders table, you would want to ensure that the order_date field is never empty.

-- Consistency: Ensuring that a field is never null helps maintain consistent data. For example, in a product table, you might enforce that the product_name is never null.

-- Avoiding Errors: Having null values in certain fields can lead to errors or unexpected behavior in applications that process the data.

-- Primary Key and NULL Values
-- A primary key is used to uniquely identify each row in a table. It has two important properties:

-- Uniqueness: Each value in the primary key column must be unique across the table.

-- Non-nullability: A primary key column cannot contain null values.

-- Justification:

-- Uniqueness: The primary key must be able to uniquely identify each record in the table. If a primary key column were allowed to contain null values, it would violate the principle of uniqueness because NULL is not a value that can be used for comparison.

-- Non-nullability: A primary key must have a value for each record to ensure that each record can be identified. Allowing null values would mean that some records do not have a unique identifier, which would defeat the purpose of having a primary key.

-- Example:

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);


-- In this example:

-- EmployeeID is the primary key and cannot contain null values, ensuring each employee can be uniquely identified.

-- Name is a mandatory field and cannot be null, ensuring every employee has a name.

-- Email is unique, but it is not required to have a value.

-- By enforcing these constraints, we ensure that the data in the table is accurate, reliable, and useful for identifying records.

-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an 
-- example for both adding and removing a constraint.

-- Ans:

-- Adding Constraints to an Existing Table
-- To add constraints to an existing table, you can use the ALTER TABLE statement. Here are the steps and examples for adding different types of constraints:

-- I. Add a NOT NULL Constraint:

ALTER TABLE Employees
MODIFY COLUMN Name VARCHAR(100) NOT NULL;

-- II. Add a UNIQUE Constraint:

ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (Email);

-- III. Add a Primary Key Constraint:

-- ALTER TABLE Employees
ADD CONSTRAINT pk_employee_id PRIMARY KEY (EmployeeID);

-- IV. Add a Foreign Key Constraint:

ALTER TABLE Enrollments
ADD CONSTRAINT fk_student_id FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

-- V. Add a Check Constraint:

ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

-- VI. Add a Default Constraint:

ALTER TABLE Accounts
ALTER COLUMN Balance SET DEFAULT 0.00;

-- VII. Adding a UNIQUE Constraint:

-- This command adds a unique constraint to the Email column in the Employees table, ensuring that no two employees can have the same email address.

ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (Email);


-- Removing Constraints from an Existing Table

-- To remove constraints from an existing table, we also use the ALTER TABLE statement. Here are the steps and examples for removing different types of constraints:

-- I. Remove a NOT NULL Constraint:

ALTER TABLE Employees
MODIFY COLUMN Name VARCHAR(100) NULL;

-- II. Remove a UNIQUE Constraint:

ALTER TABLE Employees
DROP CONSTRAINT unique_email;

-- III. Remove a Primary Key Constraint:

ALTER TABLE Employees
DROP CONSTRAINT pk_employee_id;

-- IV. Remove a Foreign Key Constraint:

ALTER TABLE Enrollments
DROP CONSTRAINT fk_student_id;

-- V. Remove a Check Constraint:

ALTER TABLE Products
DROP CONSTRAINT chk_price;

-- VI. Remove a Default Constraint:

ALTER TABLE Accounts
ALTER COLUMN Balance DROP DEFAULT;

-- VII. Removing a UNIQUE Constraint:

-- This command removes the unique constraint from the Email column in the Employees table, allowing duplicate email addresses.

ALTER TABLE Employees
DROP CONSTRAINT unique_email;

-- Constraints are essential for maintaining data integrity, and using the ALTER TABLE statement allows you to modify your existing tables to enforce or remove these rules as needed.

-- 5.  Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. 
-- Provide an example of an error message that might occur when violating a constraint.

-- Ans:

-- When attempting to insert, update, or delete data in a database in a way that violates constraints, the database management system (DBMS) will prevent the operation from completing. 
-- Constraints are rules enforced by the DBMS to maintain data integrity and consistency. 
-- Violating these constraints can result in the following consequences:

-- Consequences:

-- I. Data Integrity Violation:

-- Violating constraints can lead to inconsistent or invalid data in the database. For example, inserting a value that doesn’t meet the requirement of a constraint (like a foreign key constraint) can cause the database to contain orphaned or incorrect data.

-- II. Transaction Rollback:

-- In many cases, the database will automatically roll back the operation. This means that any changes made during the transaction will be undone to ensure the database remains in a valid state.

-- III. Error Messages:

-- The DBMS will typically return an error message to indicate the type of violation (e.g., foreign key, primary key, check constraint, etc.).

-- IV. Potential Application Failures:

-- If a constraint violation occurs in an application, the application may experience errors, fail to process requests, or show incorrect data. The user or developer needs to handle these errors appropriately.

-- V. Violation of Referential Integrity:

-- A foreign key violation might result in broken relationships between tables. For example, attempting to delete a record in a parent table that has corresponding entries in a child table will violate the referential integrity.

-- VI. Loss of Data Consistency:

-- The database might no longer reflect the true, correct, and intended relationships between data. This can affect downstream processes and analyses.

-- Example of Violating a Constraint:
-- Scenario:

-- Imagine there's a table "Employees" with the following structure:

-- employee_id (Primary Key)
-- name
-- department_id (Foreign Key referencing Departments table)

-- The "Departments" table has:

-- department_id (Primary Key)
-- department_name

-- Example of Constraint Violation:

-- a. Foreign Key Violation:

-- If we try to insert an employee with a department_id that does not exist in the Departments table, it will violate the foreign key constraint.
-- Example:

INSERT INTO Employees (employee_id, name, department_id)
VALUES (1, 'John Doe', 99);  -- Assume department_id 99 does not exist in Departments table

-- Possible Error Message:

-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`company`.`employees`, CONSTRAINT `fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`))

-- b. Primary Key Violation: 

-- If we try to insert a row with a duplicate value for employee_id in the Employees table.
-- Example:

INSERT INTO Employees (employee_id, name, department_id)
VALUES (1, 'Jane Doe', 2);  -- Assuming employee_id 1 already exists.

-- Possible Error Message:

-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- c. Check Constraint Violation: 

-- If you have a check constraint on age ensuring it must be at least 18:
-- Example:

INSERT INTO Employees (employee_id, name, age)
VALUES (2, 'Jane Smith', 15);

-- Possible Error Message:

-- ERROR 3819 (HY000): Check constraint failed 'employees'

-- In each case, the violation prevents the operation and ensures the integrity of the database.

 -- 6. You created a products table without constraints as follows:
 CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(50),
 price DECIMAL(10, 2));

 -- Now, you realise that
 -- The product_id should be a primary key
 -- The price should have a default value of 50.00
-- Ans:

ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

-- 7. You have two tables:
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN

SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes ON students.class_id = classes.class_id;

 -- 8. Consider the following three tables:
-- Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are 
-- listed even if they are not associated with an order 
-- Hint: (use INNER JOIN and LEFT JOIN)

SELECT 
    o.order_id, 
    c.customer_name, 
    p.product_name
FROM 
    products p
LEFT JOIN 
    orders o ON p.order_id = o.order_id
LEFT JOIN 
    customers c ON o.customer_id = c.customer_id;

-- 9. Given the following tables:
-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

SELECT p.product_name, SUM(s.amount) AS total_sales
FROM Sales s
INNER JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 10. You are given three tables:
 -- Write a query to display the order_id, customer_name, and the quantity of products ordered by each 
-- customer using an INNER JOIN between all three tables.

SELECT 
    o.order_id, 
    c.customer_name, 
    SUM(od.quantity) AS total_quantity
FROM 
    Orders o
INNER JOIN 
    Customers c ON o.customer_id = c.customer_id
INNER JOIN 
    Order_Details od ON o.order_id = od.order_id
GROUP BY 
    o.order_id, 
    c.customer_name;

-- (--------------------------------------- SQL Commands ------------------------------------------------------------------------------------)

--  1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

-- Primary Key: actor_id (actor table), customer_id (customer table), film_id (film table), etc.
-- Foreign Keys:
-- rental.customer_id -> customer.customer_id
-- rental.inventory_id -> inventory.inventory_id
-- inventory.film_id -> film.film_id

-- Differences between Primary & Foreign Key:

-- Primary Key: A primary key uniquely identifies each record in a table. It does not allow NULL values.
-- Foreign Key: A foreign key links a column in one table to a primary key in another table, ensuring referential integrity.

-- 2. List all details of actors
SELECT * FROM actor;

-- 3. List all customer information from DB
SELECT * FROM customer;

-- 4. List different countries
SELECT DISTINCT country FROM country;

-- 5. Display all active customers
SELECT * FROM customer WHERE active = 1;

-- 6. List all rental IDs for customer with ID 1
SELECT rental_id FROM rental WHERE customer_id = 1;

-- 7. Display all films whose rental duration is greater than 5
SELECT * FROM film WHERE rental_duration > 5;

-- 8. List the total number of films whose replacement cost is greater than $15 and less than $20
SELECT COUNT(*) AS total_films 
FROM film 
WHERE replacement_cost > 15 AND replacement_cost < 20;

-- 9. Display the count of unique first names of actors
SELECT COUNT(DISTINCT first_name) AS unique_first_names 
FROM actor;

-- 10. Display the first 10 records from the customer table
SELECT * FROM customer LIMIT 10;

-- 11. Display the first 3 records from the customer table whose first name starts with 'b'
SELECT * FROM customer WHERE first_name LIKE 'b%' LIMIT 3;

-- 12. Display the names of the first 5 movies rated as 'G'
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

-- 13. Find all customers whose first name starts with 'a'
SELECT * FROM customer WHERE first_name LIKE 'a%';

-- 14. Find all customers whose first name ends with 'a'
SELECT * FROM customer WHERE first_name LIKE '%a';

-- 15. Display the list of first 4 cities which start and end with 'a'
SELECT city FROM city WHERE city LIKE 'a%a' LIMIT 4;

-- 16. Find all customers whose first name has 'NI' in any position
SELECT * FROM customer WHERE first_name LIKE '%NI%';

-- 17. Find all customers whose first name has 'r' in the second position
SELECT * FROM customer WHERE first_name LIKE '_r%';

-- 18. Find all customers whose first name starts with 'a' and is at least 5 characters long
SELECT * FROM customer WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- 19. Find all customers whose first name starts with 'a' and ends with 'o'
SELECT * FROM customer WHERE first_name LIKE 'a%o';

-- 20. Get films with PG and PG-13 ratings using IN operator
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

-- 21. Get films with length between 50 to 100 using BETWEEN operator
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- 22. Get the top 50 actors using LIMIT operator
SELECT * FROM actor LIMIT 50;

-- 23. Get the distinct film IDs from inventory table
SELECT DISTINCT film_id FROM inventory;


-- (----------------------------------------------------------FUNCTION--------------------------------------------------------------------)

-- Functions

-- Basic Aggregate Functions

-- Question 1: Retrieve the total number of rentals made in the Sakila database.
-- Hint: Use the COUNT() function.

SELECT COUNT(*) AS total_rentals
FROM rental;


-- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
-- Hint: Utilize the AVG() function.

SELECT AVG(JULIANDAY(return_date) - JULIANDAY(rental_date)) AS avg_rental_duration
FROM rental
WHERE return_date IS NOT NULL;



-- String Functions
-- Question 3: Display the first name and last name of customers in uppercase.
--  Hint: Use the UPPER () function.

SELECT 
    UPPER(first_name) AS first_name_upper, 
    UPPER(last_name) AS last_name_upper
FROM customer;



-- Question 4: Extract the month from the rental date and display it alongside the rental ID.
-- Hint: Employ the MONTH() function.

SELECT 
    rental_id, 
    strftime('%m', rental_date) AS rental_month
FROM rental;


-- GROUP BY
-- Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
--  Hint: Use COUNT () in conjunction with GROUP BY.

SELECT 
    customer_id, 
    COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;


-- Question 6: Find the total revenue generated by each store.
-- Hint: Combine SUM() and GROUP BY.

SELECT 
    store_id, 
    SUM(payment.amount) AS total_revenue
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
GROUP BY store_id;


-- Question 7: Determine the total number of rentals for each category of movies.
-- Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.

SELECT 
    category.name AS category_name, 
    COUNT(rental.rental_id) AS total_rentals
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.category_id, category.name;


-- Question 8: Find the average rental rate of movies in each language.
-- Hint: JOIN film and language tables, then use AVG () and GROUP BY.

SELECT 
    language.name AS language_name, 
    AVG(film.rental_rate) AS avg_rental_rate
FROM film
JOIN language ON film.language_id = language.language_id
GROUP BY language.language_id, language.name;


-- (---------------------------------------JOIN---------------------------------------------------------------------------------------------)

-- Question 9: Display the title of the movie, customer's first name, and last name who rented it.
-- Hint: Use JOIN between the film, inventory, rental, and customer tables.

SELECT 
    film.title, 
    customer.first_name, 
    customer.last_name
FROM 
    rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN customer ON rental.customer_id = customer.customer_id;

------------------------------------------------------------------------------------

-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
--   Hint: Use JOIN between the film actor, film, and actor tables.


SELECT 
    actor.first_name, 
    actor.last_name
FROM 
    film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE 
    film.title = 'Gone with the Wind';

-------------------------------------------------------------------------------------

-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals.
--  Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.

SELECT 
    customer.first_name, 
    customer.last_name, 
    SUM(payment.amount) AS total_spent
FROM 
    customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id, customer.first_name, customer.last_name;

-------------------------------------------------------------------------------------

-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').
--  Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

SELECT 
    customer.first_name, 
    customer.last_name, 
    film.title
FROM 
    customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE 
    city.city = 'London'
GROUP BY 
    customer.customer_id, film.title;



-- (--------------------------------------------------Advanced Joins and GROUP BY:------------------------------------------------------------)

-- Question 13: Display the top 5 rented movies along with the number of times they've been rented.
--  Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.


SELECT 
    film.title, 
    COUNT(rental.rental_id) AS rental_count
FROM 
    rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY 
    film.film_id, film.title
ORDER BY 
    rental_count DESC
LIMIT 5;

----------------------------------------------------------------------------------------

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
--  Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

SELECT 
    customer.first_name, 
    customer.last_name
FROM 
    customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
WHERE 
    inventory.store_id IN (1, 2)
GROUP BY 
    customer.customer_id, customer.first_name, customer.last_name
HAVING 
    COUNT(DISTINCT inventory.store_id) = 2;

-- (--------------------------------------------------Windows Function:------------------------------------------------------------------)

-- 1. Rank the customers based on the total amount they've spent on rentals.

SELECT 
    customer.first_name, 
    customer.last_name, 
    SUM(payment.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(payment.amount) DESC) AS rank
FROM 
    customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY 
    customer.customer_id, customer.first_name, customer.last_name;



-- 2. Calculate the cumulative revenue generated by each film over time.

SELECT 
    film.title, 
    payment.payment_date, 
    SUM(payment.amount) OVER (PARTITION BY film.film_id ORDER BY payment.payment_date) AS cumulative_revenue
FROM 
    film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id;



-- 3. Determine the average rental duration for each film.

SELECT 
    film.title, 
    AVG(JULIANDAY(rental.return_date) - JULIANDAY(rental.rental_date)) AS avg_rental_duration
FROM 
    film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY 
    film.film_id, film.title;



-- 4. Identify the top 3 films in each category based on their rental counts.

SELECT 
    category.name AS category_name, 
    film.title, 
    COUNT(rental.rental_id) AS rental_count,
    RANK() OVER (PARTITION BY category.category_id ORDER BY COUNT(rental.rental_id) DESC) AS rank
FROM 
    film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY 
    category.category_id, film.film_id, category.name, film.title
HAVING 
    rank <= 3;



-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH customer_rentals AS (
    SELECT 
        customer.customer_id, 
        COUNT(rental.rental_id) AS total_rentals
    FROM 
        customer
    JOIN rental ON customer.customer_id = rental.customer_id
    GROUP BY 
        customer.customer_id
),
average_rentals AS (
    SELECT 
        AVG(total_rentals) AS avg_rentals
    FROM 
        customer_rentals
)
SELECT 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name, 
    cr.total_rentals, 
    cr.total_rentals - ar.avg_rentals AS rental_difference
FROM 
    customer
JOIN customer_rentals cr ON customer.customer_id = cr.customer_id
CROSS JOIN average_rentals ar;



-- 6. Find the monthly revenue trend for the entire rental store over time.

SELECT 
    strftime('%Y-%m', payment.payment_date) AS month, 
    SUM(payment.amount) AS total_revenue
FROM payment
GROUP BY strftime('%Y-%m', payment.payment_date)
ORDER BY month;



-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

WITH customer_spending AS (
    SELECT 
        customer_id, 
        SUM(payment.amount) AS total_spent
    FROM payment
    GROUP BY customer_id
),
threshold AS (
    SELECT 
        MIN(total_spent) AS top_20_threshold
    FROM (
        SELECT 
            total_spent, 
            NTILE(5) OVER (ORDER BY total_spent DESC) AS quintile
        FROM customer_spending
    ) AS ranked_customers
    WHERE quintile = 1
)
SELECT 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name, 
    cs.total_spent
FROM customer
JOIN customer_spending cs ON customer.customer_id = cs.customer_id
JOIN threshold t ON cs.total_spent >= t.top_20_threshold
ORDER BY cs.total_spent DESC;



-- 8. Calculate the running total of rentals per category, ordered by rental count.

WITH category_rentals AS (
    SELECT 
        category.name AS category_name, 
        COUNT(rental.rental_id) AS rental_count
    FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film ON inventory.film_id = film.film_id
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    GROUP BY category.category_id, category.name
)
SELECT 
    category_name, 
    rental_count, 
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM category_rentals
ORDER BY rental_count DESC;



-- 9. Find the films that have been rented less than the average rental count for their respective categories.

WITH category_avg_rentals AS (
    SELECT 
        category.category_id, 
        category.name AS category_name, 
        AVG(rental_count) AS avg_rentals
    FROM (
        SELECT 
            film.film_id, 
            category.category_id, 
            COUNT(rental.rental_id) AS rental_count
        FROM rental
        JOIN inventory ON rental.inventory_id = inventory.inventory_id
        JOIN film ON inventory.film_id = film.film_id
        JOIN film_category ON film.film_id = film_category.film_id
        JOIN category ON film_category.category_id = category.category_id
        GROUP BY film.film_id, category.category_id
    ) AS film_rentals
    JOIN category ON film_rentals.category_id = category.category_id
    GROUP BY category.category_id, category.name
)
SELECT 
    film.title, 
    category.name AS category_name, 
    COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY film.film_id, category.category_id, film.title, category.name
HAVING COUNT(rental.rental_id) < (
    SELECT avg_rentals
    FROM category_avg_rentals
    WHERE category_avg_rentals.category_id = category.category_id
);



-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT 
    strftime('%Y-%m', payment.payment_date) AS month, 
    SUM(payment.amount) AS total_revenue
FROM payment
GROUP BY strftime('%Y-%m', payment.payment_date)
ORDER BY total_revenue DESC
LIMIT 5;

-- (----------------------------------Normalisation & CTE----------------------------------------------------------------------------)


-- Normalisation & CTE

-- 1. First Normal Form (1NF):
--  a. Identify a table in the Sakila database that violates 1NF. Explain how you
--  would normalize it to achieve 1NF.

-- Violation of 1NF:
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    address VARCHAR(50),
    address2 VARCHAR(50),
    district VARCHAR(50),
    city_id INT,
    postal_code VARCHAR(10),
    phone VARCHAR(50) -- Multiple phone numbers stored as comma-separated values
);

-- Normalization to 1NF:

CREATE TABLE phone_numbers (
    phone_id INT PRIMARY KEY,
    address_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- 2. Second Normal Form (2NF):
--  a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
--  If it violates 2NF, explain the steps to normalize it.

-- Violation of 2NF:

CREATE TABLE film (
    film_id INT PRIMARY KEY,
    title VARCHAR(50),
    store_id INT,
    store_name VARCHAR(50) -- Partially dependent on store_id
);

-- Normalization to 2NF:

CREATE TABLE store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
);

CREATE TABLE film (
    film_id INT PRIMARY KEY,
    title VARCHAR(50),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- 3. Third Normal Form (3NF):
--  a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
--  present and outline the steps to normalize the table to 3NF.

-- Violation of 3NF:
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    customer_name VARCHAR(50) -- Transitively dependent on customer_id
);

-- Normalization to 3NF:

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 4. Normalization Process:
--  a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 
--  unnormalized form up to at least 2NF.

-- Unnormalized Form:

CREATE TABLE CustomerOrders (
    customer_id INT,
    customer_name VARCHAR(50),
    orders VARCHAR(255) -- Orders stored as a comma-separated list
);

-- 1NF: Remove repeating groups:

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- 5. CTE Basics:
--  a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and 
--    film_actor tables.

WITH ActorFilmCountCTE AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, 
        a.first_name, 
        a.last_name
)
SELECT 
    first_name,
    last_name,
    film_count
FROM 
    ActorFilmCountCTE
ORDER BY 
    film_count DESC;

-- 6. CTE with Joins:
-- a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate

WITH FilmLanguageCTE AS (
    SELECT 
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)
SELECT 
    film_title, 
    language_name, 
    rental_rate
FROM 
    FilmLanguageCTE;

-- 7.CTE for Aggregation:
--  a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment 
-- tables.

WITH CustomerRevenueCTE AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM 
        customer c
    JOIN 
        payment p ON c.customer_id = p.customer_id
    GROUP BY 
        c.customer_id, 
        c.first_name, 
        c.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_revenue
FROM 
    CustomerRevenueCTE;

-- 8. CTE with Window Functions:
 -- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
 
 WITH FilmDurationRankCTE AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM 
        film
)
SELECT 
    film_id,
    title,
    rental_duration,
    duration_rank
FROM 
    FilmDurationRankCTE;
    
    
-- 9.CTE and Filtering:
--  a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve 
--  additional customer details.

WITH CustomerRentalsCTE AS (
    SELECT 
        customer_id,
        COUNT(*) AS rental_count
    FROM 
        rental
    GROUP BY 
        customer_id
    HAVING 
        COUNT(*) > 2
)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    cr.rental_count
FROM 
    CustomerRentalsCTE cr
JOIN 
    customer c ON cr.customer_id = c.customer_id;

-- 10.CTE for Date Calculations:
-- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.

WITH MonthlyRentalsCTE AS (
    SELECT 
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
        COUNT(*) AS total_rentals
    FROM 
        rental
    GROUP BY 
        DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT 
    rental_month,
    total_rentals
FROM 
    MonthlyRentalsCTE
ORDER BY 
    rental_month;

-- 11.CTE and Self-Join:
-- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.

WITH ActorPairsCTE AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE 
        fa1.actor_id < fa2.actor_id
)
SELECT 
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    ap.film_id
FROM 
    ActorPairsCTE ap
JOIN 
    actor a1 ON ap.actor1_id = a1.actor_id
JOIN 
    actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY 
    ap.film_id, 
    actor1_first_name, 
    actor2_first_name;

-- 12.CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to 
-- column.

WITH RecursiveStaffCTE AS (
    SELECT 
        staff_id,
        first_name,
        last_name,
        reports_to
    FROM 
        staff
    WHERE 
        reports_to = 1 -- Replace 1 with the specific manager's staff_id

    UNION ALL

    SELECT 
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM 
        staff s
    INNER JOIN 
        RecursiveStaffCTE r ON s.reports_to = r.staff_id
)
SELECT 
    staff_id,
    first_name,
    last_name,
    reports_to
FROM 
    RecursiveStaffCTE
ORDER BY 
    reports_to, 
    staff_id;







