# 🛍️ Retail Sales Analysis

An end-to-end retail analytics project using **MySQL, Python (Pandas), Excel, and Power BI** to analyze transactional sales data from a UK-based online retailer.

The project covers the complete analytics workflow — from **data cleaning and preprocessing** to **business analysis, exploratory data analysis (EDA), and dashboard development**. The analysis focuses on revenue trends, customer behaviour, product performance, returns, and geographic sales distribution to generate actionable business insights.

---

## 📌 Project Objectives

This project aims to:

- Clean and preprocess raw transactional retail data
- Analyze revenue performance and seasonal trends
- Identify high-value customers and purchasing behaviour
- Evaluate product demand and return patterns
- Compare domestic (UK) vs international market performance
- Build interactive dashboards to communicate findings

---

## 🛠️ Tools Used

- **MySQL** → Data cleaning, preprocessing, business analysis
- **Python (Pandas, NumPy)** → Exploratory Data Analysis (EDA)
- **Excel** → Additional analysis & validation
- **Power BI** → Dashboard development & visualization
- **GitHub** → Version control & project documentation

---

## 📊 Dataset Information

**Source:** Kaggle — E-Commerce Data  
**Dataset Link:**  
https://www.kaggle.com/datasets/carrie1/ecommerce-data

### Dataset Overview
- Records analyzed: **51,348**
- Time period: **Dec 2010 – Jan 2011**
- Business type:
  UK-based online retailer selling unique all-occasion gifts

### Key Columns
- InvoiceNo
- StockCode
- Description
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country

⚠️ **Limitation:**
The dataset primarily covers holiday-season transactions, meaning findings may overrepresent seasonal purchasing behaviour and may not reflect full-year trends.

---

## 🧹 Data Cleaning & Preprocessing

Data quality improvements performed before analysis:

### Missing Values
- Missing Customer IDs:
  **18,546 rows (~36%)**
- Excluded from customer-level analysis
- Retained where appropriate for revenue analysis

### Invalid Records
- Invalid prices:
  **303 rows**
  (`UnitPrice = 0`)
- Treated as invalid

### Transaction Classification
Transactions categorized into:

- Purchase
- Return

Returns:

**1,021 transactions (~2%)**

excluded from revenue calculations.

### Standardization
Applied:

- Text trimming
- Uppercase conversion
- Datatype conversion
- Missing value handling
- Date conversion

---

## 🧠 SQL Techniques Applied

SQL was used for cleaning, transformation, and business analysis.

### Data Preparation
- Data type conversion
- Missing value handling
- Text standardization
- Transaction classification

### Revenue & Sales Analysis
- Revenue calculations
- Monthly sales trends
- Geographic revenue comparison
- Average order value analysis

### Customer & Product Analysis
- Customer spending analysis
- Product performance analysis
- Return analysis
- Segmentation

### Advanced SQL Techniques
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions (`RANK()`)
- CASE Statements
- Subqueries
- Date Functions

---

## ❓ Business Questions Explored

1. What is the total revenue generated?
2. How does revenue trend over time?
3. Which countries generate the highest revenue?
4. How does UK revenue compare to international markets?
5. What is average order value by country?
6. Which products generate highest sales volume?
7. Which products generate highest revenue?
8. Who are the highest-value customers?
9. Which products are returned most frequently?
10. What are overall data quality metrics?

---

## 📈 Key Findings

### 🌍 Geographic Concentration

The **United Kingdom generated over 80% of total revenue**, indicating strong dependence on domestic wholesale customers and limited international diversification.

---

### 📅 Strong Seasonal Demand

Approximately **84% of revenue occurred during December 2010**, reflecting significant holiday-season purchasing behaviour.

Revenue declined sharply in January, suggesting post-holiday slowdown.

---

### 🏆 Top Revenue Product

**REGENCY CAKESTAND 3 TIER**

generated approximately:

**£31k+ revenue**

making it the highest-performing product.

---

### 👥 Customer Concentration

A relatively small group of customers contributed disproportionately to revenue, consistent with wholesale purchasing behaviour.

---

### 📦 Diversified Product Portfolio

Revenue distribution remained spread across multiple products, reducing dependency on individual items.

---

### 🔁 Low Return Rate

Product return rate remained approximately:

**2%**

suggesting healthy product-market fit.

---

## 📌 Key Metrics

| Metric | Value |
|-------|-------|
| Total Transactions | 51,348 |
| Total Revenue | ~£973k |
| Missing Customer IDs | 36% |
| Return Rate | ~2% |
| Top Revenue Product | REGENCY CAKESTAND 3 TIER |
| Peak Revenue Month | December 2010 |
| Unique Customers | 990 |
| Unique Orders | 1,902 |
| Average Order Value | £511.68 |

---

## 📂 Repository Structure

```text
Retail-Sales-Analysis/

├── SQL/
│ ├── data_cleaning.sql
│ └── business_analysis.sql
│
├── Python/
│ └── retail_analysis.py
│
├── Dashboard/
│ └── retail_dashboard.pbix
│
├── Images/
│ └── dashboard_screenshots
│
└── README.md

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
