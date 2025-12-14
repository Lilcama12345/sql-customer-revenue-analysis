1. 

SELECT 
    c.ID_Customer,
    c."Nama Customer",
    COUNT(t.ID_Transaction) AS total_transaksi,
    SUM(t.Grand_Total) AS total_revenue,
    AVG(t.Grand_Total) AS avg_order_value
FROM customer c
JOIN transactions t 
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.ID_Customer, c."Nama Customer"
ORDER BY total_revenue DESC;

2.

SELECT 
    CASE 
        WHEN COUNT(t.ID_Transaction) > 1 THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS customer_type,
    COUNT(DISTINCT c.ID_Customer) AS total_customer
FROM customer c
JOIN transactions t 
    ON c.ID_Customer = t.ID_Customer
GROUP BY customer_type;

3. 

SELECT 
    c.Kota,
    SUM(t.Grand_Total) AS total_revenue,
    COUNT(DISTINCT c.ID_Customer) AS total_customer
FROM customer c
JOIN transactions t 
    ON c.ID_Customer = t.ID_Customer
GROUP BY c.Kota
ORDER BY total_revenue DESC;

4. 

SELECT 
    s.Status,
    COUNT(*) AS total_transaksi,
    SUM(t.Grand_Total) AS total_revenue
FROM status s
JOIN transactions t 
    ON s.ID_Transaction = t.ID_Transaction
GROUP BY s.Status;

5. 

SELECT 
    p.Payment,
    COUNT(*) AS total_transaksi,
    SUM(t.Grand_Total) AS total_revenue
FROM payment p
JOIN transactions t 
    ON p.ID_Transaction = t.ID_Transaction
GROUP BY p.Payment
ORDER BY total_revenue DESC;

