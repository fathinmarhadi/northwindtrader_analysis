-- What are the geographical regions with the highest and lowest sales?
SELECT 
	c.country,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY 1
ORDER BY 2 DESC;

-- Are there any emerging markets where Northwind Traders can expand their operations?
SELECT 
    c.country,
    COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY 1
ORDER BY 2 ASC;

-- How does the performance of sales representatives vary across different regions?
 SELECT 
    e.employee_id,
    e.employee_name AS sales_representative,
    c.country,
    COUNT(o.order_id) AS order_count
FROM orders o
JOIN employees e ON o.employee_id = e.employee_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY 1,2,3
ORDER BY e.employee_id, order_count DESC;
   
-- Are there any cultural or demographic factors influencing purchasing behavior in specific regions?
 SELECT 
    c.country,
    cat.category_name,
    COUNT(od.order_id) AS order_count
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON od.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY 1, 2
ORDER BY 1, 3 DESC;


