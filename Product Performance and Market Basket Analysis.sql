-- Which products are the top sellers, and which ones are underperforming?
WITH product_sales AS (
SELECT 
	p.product_name,
    ROUND(SUM((od.unit_price*od.quantity) - ((od.unit_price*od.quantity)*od.discount) + o.freight)::numeric) total_sales
FROM orders o
LEFT JOIN order_details od ON o.order_id = od.order_id 
LEFT JOIN products p ON od.product_id = p.product_id
GROUP BY 1
),
product_rank AS (
SELECT
	product_name,
	ROW_NUMBER() OVER (ORDER BY total_sales DESC) rank,
	ROW_NUMBER() OVER (ORDER BY total_sales) bottom
FROM product_sales
)
SELECT	
	product_name,
	rank
FROM product_rank
WHERE rank <= 5 OR bottom <= 5
ORDER BY rank;

-- Are there any correlations between certain product categories?
WITH OrderProducts AS (
SELECT 
	o.order_id,
	p.category_id
FROM order_details o
JOIN products p ON o.product_id = p.product_id
)
SELECT 
	c1.category_name AS category1,
    c2.category_name AS category2,
    COUNT(*) AS frequency
FROM OrderProducts op1
JOIN OrderProducts op2 ON op1.order_id = op2.order_id AND op1.category_id != op2.category_id
JOIN categories c1 ON op1.category_id = c1.category_id
JOIN categories c2 ON op2.category_id = c2.category_id
GROUP BY 1, 2
    
 -- What are the most common product combinations purchased together?
WITH orderProduct AS (
SELECT 
	od.order_id,
	p.product_name 
FROM order_details od
JOIN products p ON od.product_id = p.product_id 
)
SELECT
	op1.product_name product1,
	op2.product_name product2,
	count(*) frequency
FROM orderProduct op1
JOIN orderProduct op2 ON op1.order_id = op2.order_id AND op1.product_name < op2.product_name
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10;
