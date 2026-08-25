-- 1. Total Revenue
SELECT SUM(total_price) AS total_revenue
FROM pizza_sales_db.pizza_sales;

-- 2. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_db.pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales_db.pizza_sales;

-- 4. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales_db.pizza_sales;

-- 5. Average Pizzas Per Order
SELECT cast(cast(SUM(quantity) as decimal(10,2)) / cast(COUNT(DISTINCT order_id) as decimal(10,2)) as decimal(10,2)) AS avg_pizzas_per_order
FROM pizza_sales_db.pizza_sales;

-- 6. Daily Trend for Total Orders
SELECT DAYNAME(order_date) AS day_of_week, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_db.pizza_sales
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- 7. Hourly Trend for Total Orders
SELECT HOUR(order_time) AS order_hour, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_db.pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

-- 8. Percentage of Sales by Pizza Category
SELECT pizza_category,
       SUM(total_price) AS category_revenue,
       ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales_db.pizza_sales), 2) AS pct_of_sales
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_category
ORDER BY category_revenue DESC;

-- 9. Percentage of Sales by Pizza Size
SELECT pizza_size,
       SUM(total_price) AS size_revenue,
       ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales_db.pizza_sales), 2) AS pct_of_sales
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_size
ORDER BY size_revenue DESC;

-- 10. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_category
ORDER BY total_pizzas_sold DESC;

-- 11. Top 5 Best Sellers by Revenue, Quantity, Orders
SELECT pizza_name, SUM(total_price) AS revenue
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

-- 12. Bottom 5 Best Sellers by Revenue, Quantity, Orders

SELECT pizza_name, SUM(total_price) AS revenue
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_name
ORDER BY revenue ASC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_db.pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;

select current_user();
