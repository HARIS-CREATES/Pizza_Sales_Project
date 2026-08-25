-- 1. Start completely fresh
DROP TABLE IF EXISTS pizza_sales_db.pizza_sales;

CREATE TABLE pizza_sales_db.pizza_sales (
  pizza_id INT,
  order_id INT,
  pizza_name_id TEXT,
  quantity INT,
  order_date TEXT,
  order_time TEXT,
  unit_price DOUBLE,
  total_price DOUBLE,
  pizza_size TEXT,
  pizza_category TEXT,
  pizza_ingredients TEXT,
  pizza_name TEXT
);

-- 2. Import the clean file (use whichever filename it's actually saved as)
LOAD DATA LOCAL INFILE 'C:/Users/haris/Desktop/DATA ANALYTICS/PROJECTS/Pizza_Sales_Project/pizza_sales.csv'
INTO TABLE pizza_sales_db.pizza_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW WARNINGS;
SELECT COUNT(*) FROM pizza_sales_db.pizza_sales;

-- 3. Fix the date/time columns
ALTER TABLE pizza_sales_db.pizza_sales
ADD COLUMN order_date_fixed DATE,
ADD COLUMN order_time_fixed TIME;

SET SQL_SAFE_UPDATES = 0;

UPDATE pizza_sales_db.pizza_sales
SET order_date_fixed = STR_TO_DATE(order_date, '%d/%m/%Y'),
    order_time_fixed = STR_TO_DATE(order_time, '%H:%i:%s');

SELECT COUNT(*) FROM pizza_sales_db.pizza_sales WHERE order_date_fixed IS NULL;

ALTER TABLE pizza_sales_db.pizza_sales
DROP COLUMN order_date,
DROP COLUMN order_time;

ALTER TABLE pizza_sales_db.pizza_sales
RENAME COLUMN order_date_fixed TO order_date;
ALTER TABLE pizza_sales_db.pizza_sales
RENAME COLUMN order_time_fixed TO order_time;

-- 4. Final checks
SELECT COUNT(*) FROM pizza_sales_db.pizza_sales;
SELECT COUNT(*) FROM pizza_sales_db.pizza_sales WHERE pizza_id IS NULL OR order_id IS NULL;
SELECT pizza_id, COUNT(*) FROM pizza_sales_db.pizza_sales GROUP BY pizza_id HAVING COUNT(*) > 1;

