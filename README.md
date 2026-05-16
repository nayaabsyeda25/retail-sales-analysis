## 🛍️ Retail Sales Analysis

A complete retail sales analytics project using MySQL, Python (Pandas), Excel, and Power BI.  

---

## 📌 Project Overview
This project analyzes transactional data from a UK‑based online retail company that sells unique all‑occasion gifts. The analysis focuses on revenue trends, customer purchasing behavior, product performance, and geographic sales patterns.  

---

## 🎯 Objectives
- Clean and preprocess raw retail data  
- Generate insights on revenue performance, customer spending, product demand, and geographic distribution  
- Identify seasonal sales trends and product returns  
- Build an interactive dashboard for visualization  

---

## 📊 Dataset Details
- Source: Kaggle — E-Commerce Data
- Link: https://www.kaggle.com/datasets/carrie1/ecommerce-data
- Subset Used: 51,348 rows  
- Time Period: Dec 2010 – Jan 2011  
- Columns: InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country  

⚠️ Limitation: Findings are heavily influenced by holiday‑season purchasing behavior and may not represent full‑year sales.  

---

## 🧹 Data Cleaning Summary
- Total records analyzed: 51,348  
- Missing Customer IDs: 18,546 rows (36%) → excluded from customer‑level analysis  
- Invalid prices: 303 rows with UnitPrice = 0 → treated as invalid  
- Returns: 1,021 rows (~2%) excluded from revenue calculations  
- Standardization: Text fields trimmed + uppercase  
- Data type corrections: Converted numeric/date columns to proper types  

---

## 🧠 SQL Concepts Used

### Data Cleaning & Preprocessing
- ALTER TABLE, MODIFY
- UPDATE
- TRIM()
- UPPER()
- STR_TO_DATE()
- NULL handling

### Aggregations & Analysis
- SUM()
- COUNT()
- AVG()
- ROUND()
- GROUP BY
- ORDER BY
- LIMIT

### Filtering & Conditional Logic
- WHERE
- IS NULL / IS NOT NULL
- CASE WHEN

### Date Functions
- DATE_FORMAT()
- STR_TO_DATE()

### Advanced SQL
- Common Table Expressions (CTEs)
- Window Functions
- RANK() OVER()
- Subqueries

### Business Analysis Techniques
- Customer segmentation
- Revenue analysis
- Geographic analysis
- Product performance analysis
- Return analysis

---

## ❓ Business Questions
1. What is the total revenue generated? 
2. How does revenue trend over time (monthly)?
3. Which countries generate the most revenue?
4. UK vs International revenue share?
5. What is the average order value by country?
6. Which product generates the most sales by quantity?
7. Which product generates the most revenue?
8. Who are the top 10 customers by total spend?
9. Which products are returned most frequently?
10. Overall dataset summary (transactions, missing values, returns, invalid prices)

---

## 📈 Key Findings

- 🌍 **Geographic Concentration:** The United Kingdom contributed over 80% of total revenue, highlighting strong dependence on the domestic wholesale market and relatively limited international diversification.  

- 🏆 **Product Leader:** *REGENCY CAKESTAND 3 TIER* was the top-performing item, generating approximately 3.6% of total revenue. However, overall sales remained distributed across a broad product portfolio rather than relying heavily on a single product.  

- 📦 **Diversified Product Portfolio:** Revenue distribution across multiple products reduces the business risk associated with over-dependence on individual items, supporting greater commercial resilience.  

- 📅 **Seasonal Revenue Spike:** December 2010 accounted for approximately 84% of total revenue, reflecting strong holiday-season demand and seasonal purchasing behaviour.  

- 📉 **Post-Holiday Revenue Decline:** Revenue declined sharply during January 2011, underscoring the impact of post-holiday purchasing slowdown and the dataset’s holiday-driven concentration.   

- 👥 **Wholesale Customer Behaviour:** A relatively small group of high-spending customers contributed a significant share of total revenue, consistent with wholesale purchasing patterns.
---

## 📌 Key Metrics
- Total Transactions: 51,348  
- Missing Customer IDs: 36%  
- Product Return Rate: ~2%  
- Invalid Price Records: 303  
- Top Revenue Product: REGENCY CAKESTAND 3 TIER  
- Primary Revenue Market: United Kingdom  

---

## 📂 Project Files
- data_cleaning.sql — SQL cleaning queries  
- business_analysis.sql — Business analysis queries  
- retail_analysis.py — Python/Pandas analysis  
- retail_dashboard.pbix — Power BI dashboard  

---

## 📊 Dashboard Preview
(Add Power BI screenshots here)  

---

## 🧑‍💻 Skills Demonstrated
- Data Cleaning & Preprocessing  
- Exploratory Data Analysis (EDA)  
- SQL Query Optimization  
- Business Insight Generation  
- Data Visualization (Power BI)  
- Dashboard Development  
- Data Quality Assessment  

---

## 🏆 Project Milestones
- ✅ Database rebuild + 51k‑row dataset import  
- ✅ Data cleaning & preprocessing  
- ✅ Business analysis queries completed  
- ✅ Pandas analysis
- ⬜ Excel analysis
- ⬜ Dashboard development

---
