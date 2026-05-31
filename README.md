# 🛍️ Retail Sales Analysis

An end-to-end retail analytics project using MySQL, Python (Pandas) and Power BI to analyze transactional sales data from a UK-based online retailer.

The project covers the complete analytics workflow — from data cleaning and preprocessing to business analysis, exploratory data analysis (EDA) and interactive dashboard development. The analysis focuses on revenue trends, customer behaviour, product performance, returns, and geographic sales distribution to generate actionable business insights.

---

## 📌 Project Objectives

This project aims to:
- Clean and preprocess raw transactional retail data
- Analyze revenue performance and seasonal trends
- Identify high-value customers and purchasing behaviour
- Evaluate product demand and return patterns
- Compare domestic (UK) vs international market performance
- Visualise key business insights through an interactive Power BI dashboard

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **MySQL** | Data cleaning, preprocessing and business analysis |
| **Python (Pandas, NumPy)** | Exploratory Data Analysis (EDA) |
| **Power BI** | Interactive dashboard and data visualisation |
| **GitHub** | Version control and project documentation |

---

## 📊 Dataset Details

- **Source:** UCI Machine Learning Repository (Online Retail Dataset)
- **Kaggle Link:** https://www.kaggle.com/datasets/carrie1/ecommerce-data
- **Subset Used:** 51,348 rows
- **Time Period:** Dec 2010 – Jan 2011
- **Columns:** InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country

> ⚠️ **Limitation:** Findings are heavily influenced by holiday-season purchasing behaviour and may not represent full-year sales patterns.

---

## 🧹 Data Cleaning Summary

| Issue | Action Taken |
|---|---|
| Missing Customer IDs | 18,546 rows (36%) → excluded from customer-level analysis |
| Invalid prices | 303 rows with UnitPrice = 0 → treated as invalid |
| Returns | 1,021 rows (~2%) → flagged and excluded from revenue calculations |
| Blank descriptions | 145 rows → converted to NULL |
| Text standardisation | All text fields trimmed and converted to uppercase |
| Data type corrections | Numeric and date columns converted to proper types |
| Transaction classification | Purchases vs returns flagged using TransactionType column |

---

## 🧠 SQL Techniques Applied

**Data Preparation:**
- Data type conversion
- Missing value handling
- Text standardisation
- Transaction classification

**Revenue & Sales Analysis:**
- Revenue calculations
- Monthly sales trends
- Geographic revenue comparison
- Average order value

**Customer & Product Analysis:**
- Customer spending analysis
- Product performance analysis
- Return analysis
- Segmentation

**Advanced SQL Techniques:**
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions (RANK())
- CASE Statements
- Subqueries
- Date Functions

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

🌍 **Geographic Concentration:** The United Kingdom contributed over 80% of total revenue, highlighting strong dependence on the domestic wholesale market and relatively limited international diversification.

🏆 **Product Leader:** REGENCY CAKESTAND 3 TIER was the top-performing item, generating approximately 3.6% of total revenue. Overall sales remained distributed across a broad product portfolio rather than relying heavily on a single product.

📦 **Diversified Product Portfolio:** Revenue distribution across multiple products reduces business risk associated with over-dependence on individual items, supporting greater commercial resilience.

📅 **Seasonal Revenue Spike:** December 2010 accounted for approximately 84% of total revenue, reflecting strong holiday-season demand and seasonal purchasing behaviour.

📉 **Post-Holiday Revenue Decline:** Revenue declined sharply during January 2011, underscoring the impact of post-holiday purchasing slowdown and the dataset's holiday-driven concentration.

👥 **Wholesale Customer Behaviour:** A relatively small group of high-spending customers contributed a significant share of total revenue, consistent with wholesale purchasing patterns where a few buyers place large, recurring orders.

---

## 📌 Key Metrics

| Metric | Value |
|---|---|
| Total Transactions | 51,348 |
| Missing Customer IDs | 36% |
| Product Return Rate | ~2% |
| Invalid Price Records | 303 |
| Top Revenue Product | REGENCY CAKESTAND 3 TIER |
| Primary Revenue Market | United Kingdom |

---

## 📊 Dashboard Preview

<img width="950" height="480" alt="Screenshot 2026-05-30 044548" src="https://github.com/user-attachments/assets/0f1e4495-e036-4601-bd1a-5d5ad0036f3b" />


---

## 📂 Project Files

| File | Description |
|---|---|
| `data_cleaning.sql` | SQL cleaning queries |
| `business_analysis.sql` | Business analysis queries |
| `retail_analysis.py` | Python/Pandas EDA |
| `retail_dashboard.pbix` | Power BI interactive dashboard |

---

## 🧑‍💻 Skills Demonstrated

- ✅ Data Cleaning & Preprocessing
- ✅ Missing Values Analysis
- ✅ Exploratory Data Analysis (EDA)
- ✅ Advanced SQL (CTEs, Window Functions, Ranking Functions)
- ✅ Business Insight Generation
- ✅ Python (Pandas) for Data Analysis
- ✅ Data Visualisation & Dashboard Development (Power BI)

---

## 🏆 Project Milestones

- ✅ Database rebuild + 51k-row dataset import
- ✅ Data cleaning & preprocessing
- ✅ Business analysis queries completed
- ✅ Pandas EDA completed
- ✅ Power BI interactive dashboard completed

