-- Data overview
USE retail_project;
SELECT * 
FROM retail_sales_dataset
LIMIT 10;

-- Sales Overview
SELECT
	COUNT(`Transaction ID`) AS total_transactions,
	COUNT(DISTINCT `Customer ID`) AS total_customers,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
From retail_sales_dataset;

-- Monthly Sales Trend
-- This analysis examines monthly sales performance by calculating monthly revenue, total transactions, and quantity sold.  
-- It helps identify sales trends over time and highlights months with stronger or weaker retail performance.
SELECT 
	DATE_FORMAT(`Date`, '%Y-%m') AS sales_month,
    COUNT(*) AS total_transactions,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS monthly_revenue
FROM retail_sales_dataset
GROUP BY sales_month
ORDER BY sales_month;


-- Product Category Performance
-- This analysis evaluates sales performance across product categories by calculating total revenue, number of transactions, quantity sold, and average order value for each category.
-- It helps identify the best-performing product categories and understand which categories contribute most to overall revenue.
SELECT 
	`Product Category`,
	COUNT(*) AS total_transactions,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_revenue DESC;


-- * Customer Demographics Analysis *
-- This analysis examines customer purchasing behavior by gender. 
-- It calculates total transactions, total customers, quantity sold, total revenue, and average order value for each gender group.
-- The goal is to understand which customer demographic contributes more to sales and whether spending behavior differs between groups.
SELECT 
	`Gender`,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT `Customer ID`) As total_customers,
	SUM(`Quantity`) AS total_quantity_sold,
	ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY `Gender`
ORDER BY total_revenue DESC;


-- * Age Group Analysis *
-- This analysis groups customers into age ranges to examine purchasing behavior across different age segments. 
-- It calculates total transactions, total customers, quantity sold, total revenue, and average order value for each age group.
-- The goal is to identify which age segments contribute the most to revenue and which groups have higher spending behavior.

SELECT 
    CASE
        WHEN `Age` BETWEEN 18 AND 25 THEN '18-25'
        WHEN `Age` BETWEEN 26 AND 35 THEN '26-35'
        WHEN `Age` BETWEEN 36 AND 45 THEN '36-45'
        WHEN `Age` BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY age_group
ORDER BY total_revenue DESC;


-- * Average Order Value by Segment*
-- This analysis examines average order value across customer segments by combining gender and age group. 
-- It helps identify which customer groups spend more per transaction and may be more valuable for targeted marketing strategies.
SELECT 
	`Gender`, 
	CASE 
	WHEN `Age` BETWEEN 18 AND 25 THEN '18-25'
	WHEN `Age` BETWEEN 26 AND 35 THEN '26-35'
	WHEN `Age` BETWEEN 36 AND 45 THEN '36-45'
	WHEN `Age` BETWEEN 46 AND 55 THEN '46-55'
	ELSE '56+'
    END AS age_group,
    COUNT(*) AS total_transactions,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY `Gender`, age_group
ORDER BY average_order_value DESC;


-- * Product Category by Gender *
-- This analysis examines product category performance by gender. 
-- It calculates transactions, quantity sold, total revenue, and average order value for each product category within each gender group.
-- The goal is to identify category preferences and understand which product categories generate the most revenue for male and female customers.
SELECT
    `Gender`,
    `Product Category`,
    COUNT(*) AS total_transactions,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY `Gender`, `Product Category`
ORDER BY `Gender`, total_revenue DESC;


-- * Best-Selling Product Categories *
-- This analysis identifies the best-selling product categories based on total quantity sold. 
-- It helps distinguish between categories that generate the highest revenue and categories that sell the most units.
SELECT
	`Product Category`,
    COUNT(*) AS total_transactions,
	SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_quantity_sold DESC;

-- * Customer Segmentation by Spending Level *
-- This analysis segments customers based on their purchase amount into low, medium, and high spenders. 
-- It helps identify which spending groups contribute the most to total revenue and supports customer targeting strategies.
SELECT
    CASE
        WHEN `Total Amount` < 250 THEN 'Low Spender'
        WHEN `Total Amount` BETWEEN 250 AND 600 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS spending_segment,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY spending_segment
ORDER BY total_revenue DESC;

-- Product Category by Spending Segment
-- This analysis examines product category performance across low, medium, and high spender segments. 
-- It helps identify which product categories generate the most revenue within each customer spending group.
-- The goal is to understand purchasing patterns across customer value segments and support more targeted sales and marketing decisions.

SELECT
    CASE
        WHEN `Total Amount` < 250 THEN 'Low Spender'
        WHEN `Total Amount` BETWEEN 250 AND 600 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS spending_segment,
    `Product Category`,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    SUM(`Quantity`) AS total_quantity_sold,
    ROUND(SUM(`Total Amount`), 2) AS total_revenue,
    ROUND(AVG(`Total Amount`), 2) AS average_order_value
FROM retail_sales_dataset
GROUP BY spending_segment, `Product Category`
ORDER BY 
    FIELD(spending_segment, 'High Spender', 'Medium Spender', 'Low Spender'),
    total_revenue DESC;
    
