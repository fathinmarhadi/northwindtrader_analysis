-- Segment Customers Based on Purchasing Behavior --
SELECT o.customer_id,
       COUNT(DISTINCT o.order_id) AS total_orders,
       ROUND(SUM((od.unit_price*od.quantity) - ((od.unit_price*od.quantity)*od.discount) + o.freight)::numeric) total_sales
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id 
GROUP BY 1
ORDER BY 3 DESC
;

-- Analyze Characteristics of 5 High-Value Customers
SELECT o.customer_id,
       COUNT(DISTINCT o.order_id) total_orders,
       ROUND(SUM((od.unit_price*od.quantity) - ((od.unit_price*od.quantity)*od.discount) + o.freight)::numeric) total_sales,
       ROUND(AVG((od.unit_price*od.quantity) - ((od.unit_price*od.quantity)*od.discount) + o.freight)::numeric) avg_order_value
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;

-- Identify Trends or Patterns in Purchasing Behavior

SELECT 
	ROW_NUMBER () OVER (ORDER BY year, month) AS index,
	year,
 	month,
    monthly_sales
FROM (
    SELECT
	EXTRACT(YEAR FROM o.order_date) AS year,
	EXTRACT(MONTH FROM o.order_date) AS month,
	ROUND(SUM((od.unit_price*od.quantity) - ((od.unit_price*od.quantity)*od.discount) + o.freight)::numeric) monthly_sales
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY 1, 2
ORDER BY 1
) AS monthly_sales_data
ORDER BY 1, 2;

-- Analyze Impact of Customer Segmentation on Sales Performance
WITH customer_sales AS (
SELECT 
	o.customer_id,
    ROUND(SUM((od.unit_price*od.quantity) - ((od.unit_price*od.quantity)*od.discount) + o.freight)::numeric) total_sales
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY 1
),
customer_segments AS (
SELECT 	
	customer_id,
	CASE 
		WHEN total_sales >= 85000 THEN 'High Value'
		WHEN total_sales >= 30000 THEN 'Mid Value'
		ELSE 'Low Value'
	END customer_segment
FROM customer_sales
)

SELECT 
	customer_segment,
	sum(total_sales) total_sales
FROM customer_segments
JOIN customer_sales ON customer_segments.customer_id = customer_sales.customer_id 
GROUP BY 1;