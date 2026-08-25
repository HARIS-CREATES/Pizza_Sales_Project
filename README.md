# Pizza Sales Analysis — SQL + Power BI

End-to-end data analysis project: cleaned and modeled 48,620 rows of pizza order data in MySQL, then built an interactive Power BI dashboard with 5 KPIs and 7 visualizations.

## Overview

This project analyzes a year of pizza sales transactions to answer key business questions: which days and hours drive the most orders, which pizzas are top and bottom performers, and how sales break down by category and size.

## Tools

- **MySQL** — data cleaning, transformation, and analysis (SQL)
- **Power BI Desktop** — interactive dashboard and DAX measures
- **Data source**: raw Excel export, 48,620 order line items

## Data Cleaning

During import, the raw CSV export from Excel silently dropped 1,307 rows — fields in the `pizza_ingredients` column contained unescaped commas that broke row parsing. I diagnosed this by cross-checking the imported row count against the source file, isolated the cause via `SHOW WARNINGS`, and resolved it by re-exporting the CSV with proper field quoting. Final dataset: 48,620 rows, 0 nulls, 0 duplicates.

Also standardized `order_date` and `order_time` from inconsistent text formats into proper `DATE`/`TIME` types using `STR_TO_DATE`.

## KPIs

| Metric | Value |
|---|---|
| Total Revenue | $817,860.05 |
| Total Orders | 21,350 |
| Total Pizzas Sold | 49,574 |
| Average Order Value | $38.31 |
| Average Pizzas per Order | 2.32 |

## Dashboard

- Daily & hourly order trend
- % of sales by pizza category and size
- Total pizzas sold by category
- Top 5 and bottom 5 best-selling pizzas by revenue, quantity, and orders

## Files

- `import_pizza_sales.sql` — data import and cleaning script
- `kpi_queries.sql` — KPI and chart-support SQL queries
- `pizza_sales.pbix` — Power BI dashboard file
- `pizza_sales_clean.csv` — cleaned dataset

## Key Insights

- Friday and Saturday are the busiest days for orders
- Peak ordering hours are lunch (12–1pm) and dinner (5–7pm)
- Classic and Chicken category pizzas drive the largest share of both revenue and volume
