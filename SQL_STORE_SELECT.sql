USE sql_store;

/*SELECT *
FROM products
WHERE
	unit_price >
	(SELECT unit_price
    FROM products
    WHERE name REGEXP '^Lettuce')*/
/*SELECT *
FROM products
WHERE product_id NOT IN (
	SELECT DISTINCT product_id 
    FROM order_items
)*/
/*SELECT 
	customer_id,
    first_name,
    last_name
FROM customers
WHERE customer_id IN (
	SELECT customer_id
	FROM orders
	WHERE order_id IN (
		SELECT order_id
		FROM order_items
		WHERE product_id = 3
	)
)*/
/*SELECT DISTINCT customer_id, first_name, last_name
FROM customers c
JOIN orders o USING(customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3*/

/*-- Find the products that have never been ordered
SELECT *
FROM products p
WHERE NOT EXISTS (
	SELECT product_id
    FROM order_items
    WHERE product_id = p.product_id
)*/

/*SELECT *
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM NOW())*/

/*SELECT 
	CONCAT(first_name, ' ', last_name) AS customer,
    COALESCE(phone, 'UnKnown')
FROM customers*/

/*SELECT 
	p.product_id,
    p.name,
    COUNT(*) AS orders,
    IF (COUNT(*) > 1, 'Many times', 'Once')
FROM products p
JOIN order_items USING (product_id)
GROUP BY product_id, name*/

/*SELECT 
	CONCAT(first_name, ' ', last_name) AS customer, 
    points,FLOOR(points/1000),
    CASE 
		WHEN FLOOR(points/1000) >= 3 THEN 'Gold'
        WHEN FLOOR(points/1000) = 2 THEN 'Silver'
        ELSE 'Bronze'
	END AS category
FROM customers
ORDER BY points DESC*/

