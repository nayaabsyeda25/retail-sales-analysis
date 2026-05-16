-- ================================================
-- REVENUE PERFORMANCE
-- ================================================

-- Q1: What is the total revenue generated?
SELECT ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM retail_data
WHERE TransactionType = 'Purchase'
AND Quantity > 0 
AND UnitPrice IS NOT NULL;

-- Insight: Total valid sales revenue reached approximately £973k.
-- Revenue is highly concentrated in December 2010 , accounting for 845 of the total sales, indicating strong holiday seaaon demand 
-- and dataset skew towards the festival period.

-- ================================================

-- Q2: How does revenue trend over time (monthly)?
SELECT 
    DATE_FORMAT(InvoiceDate, '%b-%Y') AS month,
    MIN(InvoiceDate) AS sort_date,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM retail_data
WHERE TransactionType = 'Purchase'
AND Quantity > 0 
AND UnitPrice IS NOT NULL
GROUP BY month
ORDER BY sort_date;

-- Insight: December 2010 was the peak revenue month at £823k, followed by a sharp decline in January 2011 to £149k.
-- This pattern reflects typical post-holiday consumer behavior and confirms the seasonal naturem of the business. 

-- ================================================
-- GEOGRAPHIC ANALYSIS
-- ================================================

-- Q3: Which countries generate the most revenue? (Using CTE + Window Function)
WITH country_revenue AS (
    SELECT 
        Country,
        ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
    FROM retail_data
    WHERE TransactionType = 'Purchase'
    AND Quantity > 0 
    AND UnitPrice IS NOT NULL
    GROUP BY Country
),
ranked_countries AS (
    SELECT 
        Country,
        revenue,
        RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
    FROM country_revenue
)
SELECT * FROM ranked_countries
WHERE revenue_rank <= 10;

-- Insight: The United Kingdom dominates revenue generation,
-- contributing over 80% of total sales. This heavy reliance on
-- domestic customers represents both a strength and a concentration risk
-- for the business.

-- ================================================

-- Q4: UK vs International revenue share?
WITH total_revenue AS (
    SELECT SUM(Quantity * UnitPrice) AS grand_total
    FROM retail_data
    WHERE TransactionType = 'Purchase'
    AND Quantity > 0 
    AND UnitPrice IS NOT NULL
)
SELECT
    CASE 
        WHEN Country = 'UNITED KINGDOM' THEN 'UK' 
        ELSE 'International' 
    END AS region, 
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue,
    ROUND(SUM(Quantity * UnitPrice) * 100 / 
        (SELECT grand_total FROM total_revenue), 2) AS percentage
FROM retail_data 
WHERE TransactionType = 'Purchase'
AND Quantity > 0 
AND UnitPrice IS NOT NULL
GROUP BY region;

-- Insight: International markets collectively contribute less than 20%
-- of total revenue despite spanning multiple countries.
-- This indicates a significant growth opportunity through international
-- market expansion and targeted marketing strategies.

-- ================================================

-- Q5: What is the average order value by country?
WITH order_value AS (
    SELECT 
        Country,
        InvoiceNo,
        SUM(Quantity * UnitPrice) AS order_total
    FROM retail_data
    WHERE TransactionType = 'Purchase'
    AND Quantity > 0 
    AND UnitPrice IS NOT NULL
    GROUP BY Country, InvoiceNo
)
SELECT 
    Country,
    COUNT(InvoiceNo) AS total_orders,
    ROUND(AVG(order_total), 2) AS avg_order_value
FROM order_value
GROUP BY Country
ORDER BY avg_order_value DESC;

-- Insight: Certain international markets demonstrate higher average
-- order values than the UK, suggesting bulk purchasing behaviour
-- consistent with wholesale customers placing large, consolidated orders.

-- ================================================
-- PRODUCT ANALYSIS
-- ================================================

-- Q6: Which products generate the most sales by quantity?
WITH product_sales AS (
    SELECT 
        Description,
        SUM(Quantity) AS total_sold
    FROM retail_data
    WHERE TransactionType = 'Purchase'
    AND Quantity > 0 
    AND Description IS NOT NULL
    GROUP BY Description
),
ranked_products AS (
    SELECT 
        Description,
        total_sold,
        RANK() OVER (ORDER BY total_sold DESC) AS sales_rank
    FROM product_sales
)
SELECT * FROM ranked_products
WHERE sales_rank <= 10;

-- Insight: Top selling products are primarily gift and homeware items,
-- consistent with the company's positioning as a unique gifts retailer.

-- ================================================

-- Q7: Which products generate the most revenue?
WITH product_revenue AS (
    SELECT 
        Description,
        ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
    FROM retail_data
    WHERE TransactionType = 'Purchase'
    AND Quantity > 0 
    AND UnitPrice IS NOT NULL
    AND Description IS NOT NULL
    GROUP BY Description
),
ranked_products AS (
    SELECT 
        Description,
        revenue,
        RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
    FROM product_revenue
)
SELECT * FROM ranked_products
WHERE revenue_rank <= 10;

-- Insight: "REGENCY CAKESTAND 3 TIER" is the top revenue generating
-- product, contributing approximately 3.6% of total revenue.
-- Revenue is well diversified, reducing concentration risk.

-- ================================================
-- CUSTOMER ANALYSIS
-- ================================================

-- Q8: Who are the top 10 customers by total spend? (Using CTE)
WITH customer_spend AS (
    SELECT 
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS total_orders,
        ROUND(SUM(Quantity * UnitPrice), 2) AS total_spend
    FROM retail_data
    WHERE TransactionType = 'Purchase'
    AND Quantity > 0 
    AND UnitPrice IS NOT NULL
    AND CustomerID IS NOT NULL
    GROUP BY CustomerID
),
ranked_customers AS (
    SELECT 
        CustomerID,
        total_orders,
        total_spend,
        RANK() OVER (ORDER BY total_spend DESC) AS spend_rank
    FROM customer_spend
)
SELECT * FROM ranked_customers
WHERE spend_rank <= 10;

-- Insight: Top customers contribute significantly to total revenue,
-- reflecting the wholesale nature of the business where a small
-- number of customers place large, high-value orders.

-- ================================================
-- RETURNS ANALYSIS
-- ================================================

-- Q9: Which products are returned most frequently?
WITH return_counts AS (
    SELECT 
        Description,
        COUNT(*) AS return_count
    FROM retail_data 
    WHERE TransactionType = 'Return'
    AND Description IS NOT NULL
    GROUP BY Description
),
ranked_returns AS (
    SELECT 
        Description,
        return_count,
        RANK() OVER (ORDER BY return_count DESC) AS return_rank
    FROM return_counts
)
SELECT * FROM ranked_returns
WHERE return_rank <= 10;

-- Insight: Identifying frequently returned products helps the business
-- investigate quality issues or mismatched customer expectations,
-- reducing return rates and improving satisfaction.

-- ================================================
-- SUMMARY METRICS
-- ================================================

-- Q10: Overall dataset summary
SELECT 
    COUNT(*) AS total_transactions,
    COUNT(*) - COUNT(CustomerID) AS missing_customer_ids,
    ROUND((COUNT(*) - COUNT(CustomerID)) * 100.0 / COUNT(*), 2) AS missing_customer_pct,
    SUM(CASE WHEN TransactionType = 'Return' THEN 1 ELSE 0 END) AS total_returns,
    ROUND(SUM(CASE WHEN TransactionType = 'Return' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_pct,
    COUNT(*) - COUNT(UnitPrice) AS invalid_prices
FROM retail_data;

-- Insight: High-level data quality summary showing missing values,
-- return rates and invalid records identified during cleaning.
