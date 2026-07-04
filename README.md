# Retail Sales Analysis - SQL Project

## Overview

This project analyzes retail sales data using SQL to explore sales performance, customer behavior, product category performance, and customer spending segments.

The goal of this project is to generate business insights from transactional retail data using SQL queries.

## Dataset

The dataset contains retail transaction records with the following fields:

- Transaction ID
- Date
- Customer ID
- Gender
- Age
- Product Category
- Quantity
- Price per Unit
- Total Amount

Dataset source: Kaggle Retail Sales Dataset

## Tools Used

- SQL
- MySQL
- MySQL Workbench

## Analysis Performed

1. Data Overview
2. Sales Overview
3. Revenue Calculation Check
4. Missing Values Check
5. Monthly Sales Trend
6. Product Category Performance
7. Customer Demographics by Gender
8. Age Group Analysis
9. Average Order Value by Customer Segment
10. Product Category Performance by Gender
11. Best-Selling Product Categories
12. Customer Segmentation by Spending Level
13. Product Category by Spending Segment

## Key Insights

- Electronics generated the highest total revenue among product categories.
- Clothing had the highest quantity sold and the highest number of transactions.
- Female customers generated slightly higher total revenue than male customers.
- The 46-55 age group generated the highest total revenue.
- The Female 26-35 segment had the highest average order value.
- High spenders generated the majority of total revenue despite having fewer transactions.
- Among high spenders, Electronics was the top revenue-generating category.

## Detailed Insights

### Monthly Sales Trend

May 2023 generated the highest monthly revenue, with 53,150 in total sales. October and December also showed strong sales performance.

September 2023 had the lowest revenue among complete months, indicating a weaker sales period. January 2024 was excluded from the main trend interpretation because it contained only two transactions and did not represent a full month.

### Product Category Performance

Electronics generated the highest total revenue, with 156,905 in sales, making it the top-performing category by revenue.

Clothing had the highest number of transactions and the highest quantity sold, showing strong purchase frequency.

Although Beauty had the lowest total revenue, it had the highest average order value, indicating that Beauty purchases were more valuable on average.

### Customer Demographics by Gender

Female customers generated slightly higher total revenue than male customers, with 232,840 compared to 223,160.

The average order value was almost the same for both gender groups, which shows that the revenue difference was mainly due to a higher number of purchases rather than higher spending per transaction.

### Age Group Analysis

The 46-55 age group generated the highest total revenue, with 100,690 in sales. This group also had the highest number of transactions and quantity sold.

The 18-25 age group had the highest average order value, despite having fewer transactions. This suggests stronger spending per purchase among younger customers.

The 56+ age group generated the lowest total revenue and had the lowest average order value.

### Average Order Value by Customer Segment

The Female 26-35 segment had the highest average order value and also generated the highest total revenue among all customer segments.

Male customers aged 18-25 also showed a high average order value, suggesting strong spending behavior among younger male customers.

The Female 56+ segment had the lowest average order value.

### Product Category Performance by Gender

Female customers generated the highest revenue in the Clothing category, followed by Electronics and Beauty.

Male customers generated the highest revenue in the Electronics category. Although Beauty had lower total revenue among male customers, it had the highest average order value for this group.

### Best-Selling Product Categories

Clothing was the best-selling product category based on quantity sold, with 894 units sold. It also had the highest number of transactions.

Electronics ranked second by quantity sold but generated the highest total revenue, indicating stronger revenue contribution per sale.

Beauty had the lowest quantity sold and total revenue among the three categories.

### Customer Segmentation by Spending Level

High spenders generated the majority of total revenue, despite having fewer transactions than low spenders.

Low spenders had the highest number of transactions, but their total revenue contribution was the lowest. This shows that transaction volume alone does not necessarily lead to higher revenue.

This segmentation can support targeted marketing strategies, such as loyalty programs for high spenders and upselling campaigns for low and medium spenders.

### Product Category by Spending Segment

Among high spenders, Electronics generated the highest revenue, followed closely by Clothing and Beauty.

For medium and low spenders, Clothing generated the highest revenue and had the highest number of transactions.

Overall, Electronics appears to be the strongest category among high spenders, while Clothing performs better in transaction volume among medium and low spenders.

## Business Recommendations

- Focus marketing campaigns on high-value customer segments.
- Promote Electronics products to high spenders due to their strong revenue contribution.
- Use Clothing promotions to drive transaction volume among low and medium spenders.
- Target Female 26-35 customers with premium offers due to their high average order value.
- Investigate weaker sales months and plan seasonal campaigns to improve revenue consistency.

## Project Files

- `retail_sales_analysis.sql`: SQL queries used for analysis
- `data/`: Dataset file
