USE sql_invoicing;

/*SELECT *
FROM clients
WHERE client_id NOT IN (
	SELECT DISTINCT client_id
	FROM invoices
)*/
/*SELECT 
	client_id,
	COUNT(*)
FROM invoices
GROUP BY client_id
HAVING COUNT(*) >= 2*/
/*SELECT *
FROM invoices i
WHERE invoice_total >  (
	SELECT	AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
)*/

/*SELECT 
	invoice_id,
    invoice_total,
    (SELECT AVG(invoice_total) 
		FROM invoices) AS invoice_average,
        invoice_total - (SELECT invoice_average) AS difference
FROM invoices
GROUP BY invoice_id*/

/*SELECT 
	client_id,
    name,
    
    (SELECT SUM(invoice_total)
		FROM invoices
        WHERE client_id = c.client_id
        -- GROUP BY client_id
		-- HAVING c.client_id = client_id
	) AS total_sales,
    
    (SELECT AVG(invoice_total)
        FROM invoices) AS average,
    
    (SELECT total_sales) - (SELECT average) AS difference
FROM clients c*/

/*CREATE VIEW sale_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(i.invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name*/

CREATE VIEW clients_balance AS
SELECT 
	i.client_id,
    c.name,
    SUM(i.invoice_total - i.payment_total) AS balance
FROM invoices i
JOIN clients c USING (client_id)
GROUP BY i.client_id
ORDER BY balance DESC