-- SELECT 
-- 	name As product_name,
--     unit_price,
--     (unit_price * 1.1) AS new_price
-- FROM products

-- SELECT *, unit_price * quantity AS Total_Price FROM order_items
-- WHERE order_id = 6 AND unit_price * quantity > 30
--     

-- SELECT * from products
-- WHERE quantity_in_stock IN ('49','38','72')

-- between operator used to define ranges
-- SELECT * from customers 
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'

-- SELECT * from customers
-- WHERE address LIKE '%trail%' OR address LIKE '%avenue%' OR  phone LIKE '%9';

-- SELECT * FROM customers
-- WHERE phone LIKE '%9'

-- select * from customers
-- WHERE first_name regexp '^ELKA|^AMBUR'

-- select * from customers
-- WHERE last_name regexp 'b[ru]'

-- select * from orders
-- WHERE shipped_date IS NULL

-- select * from order_items
-- WHERE order_id = 2
-- order by unit_price * quantity DESC

-- select * from customers
-- order by points DESC
-- LIMIT 3

-- SELECT oi.product_id, name, quantity, oi.unit_price FROM order_items as oi
-- JOIN products as p
-- 	ON oi.product_id = p.product_id

-- SELECT order_id, order_date, first_name, last_name, os.name AS Status FROM orders AS o
-- JOIN customers AS c, order_statuses AS os
-- WHERE o.customer_id = c.customer_id and o.status = os.order_status_id


-- SELECT p.payment_id, p.client_id, c.name, c.state, pm.name AS payment_method, p.amount
-- FROM payments AS p
-- JOIN clients AS c
-- 	ON p.client_id = c.client_id
-- JOIN payment_methods AS pm
-- 	ON p.payment_method = pm.payment_method_id

-- SELECT p.product_id, p.name, oi.quantity
-- FROM products AS p
-- LEFT JOIN order_items AS oi
-- 	ON p.product_id = oi.product_id

-- SELECT o.order_date, o.order_id, c.first_name, sh.name, os.name
-- FROM orders AS o 
-- LEFT JOIN customers AS c
-- 	ON o.customer_id = c.customer_id
-- LEFT JOIN shippers as sh
-- 	ON o.shipper_id = sh.shipper_id
-- LEFT JOIN order_statuses as os
-- 	ON o.status = os.order_status_id

-- SELECT p.date, c.name AS clientName, p.amount, pm.name
-- FROM payments AS p
-- JOIN clients AS c
-- 	USING(client_id)
-- LEFT JOIN payment_methods AS pm
-- 	ON p.payment_method = pm.payment_method_id
-- 	

-- SELECT sh.name as shipper, p.name AS product
-- FROM shippers as sh, products as p

-- SELECT sh.name as shipper, p.name AS product
-- FROM shippers as sh
-- CROSS JOIN products as p

-- SELECT 
-- 	customer_id, 
--     first_name, 
--     points,
--     'Bronze' AS type  
-- FROM customers
-- WHERE points < 2000
-- UNION
-- SELECT 
-- 	customer_id, 
--     first_name, 
--     points,
--     'Silver' as type
-- FROM customers
-- WHERE points > 2000 AND points < 3000
-- UNION
-- SELECT 
-- 	customer_id, 
--     first_name, 
--     points,
--     'GOLD' as type
-- FROM customers
-- WHERE points > 3000
-- ORDER BY first_name

-- LEET CODE QS
-- SELECT MAX(Salary) AS SecondHighestSalary 
-- FROM Employee
-- WHERE Salary NOT IN (
--     SELECT MAX(Salary) FROM Employee
-- )
-- LEET CODE NTH RANK SALARY
-- SELECT DISTINCT(salary) from Employee order by salary DESC
-- LIMIT 1 OFFSET N

-- INSERT INTO products(name, quantity_in_stock, unit_price)
-- VALUES ('Lush Crush', 100, 0.5), ('Lush Book', 200, 1), ('Lush 3', 400, 1.5)

-- CREATE TABLE invoices_Archived as
-- SELECT name, address, city, state, phone, invoice_id,payment_total, payment_date FROM clients as c
-- JOIN invoices as i 
-- 	ON c.client_id = i.client_id
-- WHERE payment_date is NOT NULL

-- Update Customers
-- SET points = points + 50
-- WHERE birth_date < '1990-01-01'

-- update orders
-- SET comments = 'GOLD CUSTOMER'
-- WHERE customer_id IN (
-- 		SELECT customer_id From customers
-- 		WHERE points > 3000) 

-- SELECT SUM(invoice_total) as total_sales,
-- SUM(payment_total) as total_payment,
-- (SUM(invoice_total) - SUM(payment_total)) as bal
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
-- union
-- SELECT SUM(invoice_total) as total_sales,
-- SUM(payment_total) as total_payment,
-- (SUM(invoice_total) - SUM(payment_total)) as bal
-- FROM invoices
-- WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
-- UNION
-- SELECT SUM(invoice_total) as total_sales,
-- SUM(payment_total) as total_payment,
-- (SUM(invoice_total) - SUM(payment_total)) as bal
-- FROM invoices
-- WHERE invoice_date > '2019-01-01'

-- SELECT 
-- 	date, 
--     name,
--     SUM(amount) as total_payment
-- FROM payments as p
-- JOIN payment_methods as pm 
-- 	ON p.payment_method = pm.payment_method_id
-- group by date, name
-- ORDER BY date

-- SELECT c.customer_id,state, SUM(quantity * unit_price) as spent
-- from order_items
-- JOIN orders USING (order_id)
-- JOIN customers as c
-- 	ON orders.customer_id = c.customer_id
-- GROUP BY customer_id
-- HAVING state = 'VA' AND spent > 100

-- SELECT pm.name, SUM(amount)
-- FROM payments p
-- JOIN payment_methods pm 
-- 	ON p.payment_method = pm.payment_method_id
-- GROUP BY pm.name with rollup

-- SELECT *
-- FROM employees
-- WHERE salary > (
-- 	SELECT AVG(salary)
--     FROM employees
-- )

-- SELECT * FROM clients
-- where client_id NOT IN(
-- 	SELECT distinct client_id
-- 	FROM invoices)

-- using join
-- select distinct customer_id, first_name, last_name 
-- from customers
-- left join orders USING (customer_id)
-- left join order_items
-- 	ON orders.order_id = order_items.order_id
-- WHERE order_items.product_id = 3

-- using subquery
-- select customer_id,first_name,last_name from customers
-- where customer_id IN (
-- select customer_id from orders
-- WHERE order_id IN (
-- 	SELECT order_id
--     FROM order_items
--     WHERE product_id = 3
-- ))


-- SELECT * from invoices i 
-- WHERE invoice_total > (
-- 	SELECT AVG(invoice_total) FROM invoices 
--     WHERE client_id = i.client_id
-- )

-- SELECT distinct product_id
-- from products p
-- where NOT exists (
-- 	select product_id
--     from order_items
--     where product_id = p.product_id
-- )

-- select distinct client_id, name,
-- (select SUM(invoice_total) from invoices where client_id = c.client_id) as total_sales,
-- (select AVG(invoice_total) from invoices) as average,
-- (SELECT total_sales - average) as difference 
-- from clients c

-- SELECT 
-- 	CONCAT(first_name, ' ', last_name),
--     IFNULL(phone, 'Unknown')
-- From customers

-- SELECT product_id, 
-- (select name from products where product_id = oi.product_id) as name, 
-- COUNT(product_id) as orders,
-- IF(COUNT(product_id) > 1, 'Many Times', 'Once' ) as frequency
-- from order_items oi
-- group by product_id

-- SELECT 
-- 	product_id,
--     name,
--     COUNT(*) as orders,
--     IF(COUNT(*) > 1, 'Many times ', 'once') as freq
-- FROM products
-- JOIN order_items USING (product_id)
-- GROUP BY product_id, name

-- SELECT 
-- 	CONCAT(first_name, ' ' , last_name) as customer,
--     points,
--     CASE
-- 		WHEN points>3000 THEN 'Gold'
--         WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
--         ELSE 'Bronze'
--     END as category
-- FROM customers
-- order by points desc

-- CREATE View clients_balance as
-- SELECT 
-- 	c.client_id,
--     name,
--     (SUM(invoice_total)-SUM(payment_total)) AS balance
-- FROM invoices i
-- JOIN clients c USING(client_id)
-- GROUP BY c.client_id, name

-- DELIMITER $$
-- CREATE PROCEDURE get_invoices_with_balance()
-- BEGIN
-- 	SELECT *, (invoice_total - payment_total) as Balance From invoices
--     WHERE (invoice_total - payment_total) > 0;
-- END $$
--     
-- DELIMITER ;

-- DROP PROCEDURE IF EXISTS get_invoices_by_client
-- DELIMITER $$
-- CREATE PROCEDURE get_invoices_by_client(
-- 	client_id INT
-- )
-- BEGIN
-- 	SELECT * From invoices i
--     WHERE i.client_id = client_id;
-- END $$
--     
-- DELIMITER ;

-- CALL get_invoices_by_client(1)

-- DROP PROCEDURE IF EXISTS get_payments
-- DELIMITER $$
-- CREATE PROCEDURE get_payments(
-- 	client_id int,
--     payment_method_id TINYINT
-- )
-- BEGIN
-- 	SELECT *
--     FROM payments p
--     WHERE p.client_id = IFNULL(client_id, p.client_id) AND 
--     p.payment_method = IFNULL(payment_method_id, p.payment_method);
-- END $$

-- DELIMITER ;

-- DELIMITER $$
-- DROP TRIGGER payment_after_delete;
-- CREATE TRIGGER IF NOT EXISTS payment_after_delete
--     AFTER DELETE ON payments
--     FOR EACH ROW
-- BEGIN
--     UPDATE invoices
--     SET payment_total = payment_total - Old.amount
--     WHERE invoice_id = OLD.invoice_id;
-- END $$

-- DELIMITER ;

-- DELETE FROM payments
-- WHERE invoice_id = 2


explain SELECT customer_id from customers
where points> 1000;

CREATE INDEX idx_points on customers (points)












