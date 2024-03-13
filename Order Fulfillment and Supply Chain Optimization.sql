-- How efficient is the order fulfillment process, and are there any bottlenecks?
SELECT AVG(shipped_date - order_date) AS avg_fulfillment_time,
       MAX(shipped_date - order_date) AS max_fulfillment_time
FROM orders;

-- What is the average order processing time, and how does it vary across different products?
SELECT p.product_name,
       AVG(o.shipped_date - o.order_date) AS avg_processing_time
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY 1;

-- Can we identify suppliers with the best performance in terms of delivery times and product quality?
SELECT s.company_name,
       AVG(o.shipped_date - o.order_date) AS avg_delivery_time
FROM orders o
JOIN shippers s ON o.shipper_id = s.shipper_id
GROUP BY 1
ORDER BY 2;
