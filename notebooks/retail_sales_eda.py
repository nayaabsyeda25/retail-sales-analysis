#  ==========================================================
# Retail Sales Analysis using Pandas
#
# Objective:
# Perform exploratory data analysis (EDA)
# on retail transaction data to identify:
#
# • Revenue trends
# • Customer behaviour
# • Product performance
# • Order patterns
# • Return patterns
#
# Tools:
# Python | Pandas | NumPy
# ==========================================================


# ==========================================================
# 1. IMPORT LIBRARIES
# ==========================================================

import pandas as pd
import numpy as np


# ==========================================================
# 2. LOAD DATASET
# ==========================================================

df = pd.read_csv(
    r"C:\Users\Hp\Downloads\retail_data.csv",
    encoding="cp1252",
    sep=";"
)

print(df.head())

# Observation:
# Dataset loaded successfully.
# Contains transaction-level retail sales data.


# ==========================================================
# 3. DATASET OVERVIEW
# ==========================================================

print("Shape:")
print(df.shape)

print("\nData Types:")
print(df.dtypes)

print("\nColumns:")
print(df.columns)

# Observation:
# Dataset contains:
# 51,348 rows
# 9 columns


# ==========================================================
# 4. MISSING VALUES ANALYSIS
# ==========================================================

df['CustomerID'] = (
    df['CustomerID']
    .replace(
        0,
        np.nan
    )
)

print(
df.isna().sum()
)

missing_percentage = (
(
df.isna().sum()
/
len(df)
)
*
100
).round(
2
)

print(
missing_percentage
)

# Observation:
# CustomerID:
# ~36% missing

# Missing IDs may represent:
# • Guest purchases
# • Incomplete records

# Description:
# Minimal missing values


# ==========================================================
# 5. CONVERT DATATYPES
# ==========================================================

df[
'InvoiceDate'
] = pd.to_datetime(
df[
'InvoiceDate'
]
)

print(
df.dtypes
)

# Observation:
# InvoiceDate converted
# from string → datetime


# ==========================================================
# 6. FEATURE ENGINEERING
# ==========================================================

df[
'Revenue'
] = (
df[
'Quantity'
]
*
df[
'UnitPrice'
]
)

print(
df.head()
)

# Observation:
# Revenue =
# Quantity × UnitPrice


# ==========================================================
# 7. FILTER VALID PURCHASES
# ==========================================================

purchase_df = df[
(
df[
'TransactionType'
]
==
'Purchase'
)
&
(
df[
'Quantity'
]
>
0
)
&
(
df[
'UnitPrice'
]
>
0
)
].copy()

# Observation:
# Returns excluded
# Invalid transactions excluded


# ==========================================================
# REVENUE ANALYSIS
# ==========================================================

total_revenue = (
purchase_df[
'Revenue'
]
.sum()
)

print(
"Total Revenue:",
total_revenue
)

# Output:
# ~£973,233


# ----------------------------------------------------------
# Revenue by Country
# ----------------------------------------------------------

revenue_country = (

purchase_df.groupby(
'Country'
)[
'Revenue'
]
.sum()
.sort_values(
ascending=False
)

)

print(
revenue_country.head(
10
)
)

# Observation:
# United Kingdom generated
# highest revenue


# ----------------------------------------------------------
# UK vs International Revenue
# ----------------------------------------------------------

purchase_df[
'Region'
] = purchase_df[
'Country'
].apply(
lambda x:
'UK'
if x
==
'UNITED KINGDOM'
else
'International'
)

region_revenue = (

purchase_df.groupby(
'Region'
)[
'Revenue'
]
.sum()

)

print(
region_revenue
)

# Observation:
# UK dominates sales


# ----------------------------------------------------------
# Monthly Revenue
# ----------------------------------------------------------

monthly_revenue = (

purchase_df.groupby(
purchase_df[
'InvoiceDate'
]
.dt.month
)[
'Revenue'
]
.sum()

)

print(
monthly_revenue
)

# Output:

# January:
# £149,487

# December:
# £823,746

# Observation:
# December:
# highest revenue

# January:
# post-holiday decline


# ==========================================================
# PRODUCT ANALYSIS
# ==========================================================

top_products_revenue = (

purchase_df.groupby(
'Description'
)[
'Revenue'
]
.sum()
.sort_values(
ascending=False
)
.head(
10
)

)

print(
top_products_revenue
)

# Observation:

# Top Product:
# REGENCY CAKESTAND 3 TIER

# Revenue:
# ~£31,444


# ----------------------------------------------------------
# Top Products by Quantity
# ----------------------------------------------------------

top_products_quantity = (

purchase_df.groupby(
'Description'
)[
'Quantity'
]
.sum()
.sort_values(
ascending=False
)
.head(
10
)

)

print(
top_products_quantity
)

# Observation:

# Highest quantity:

# WORLD WAR 2 GLIDERS
# ASSTD DESIGNS


# ==========================================================
# CUSTOMER ANALYSIS
# ==========================================================

unique_customers = (

purchase_df[
'CustomerID'
]
.nunique()

)

print(
unique_customers
)

# Output:
# 990


# ----------------------------------------------------------
# Top Customers
# ----------------------------------------------------------

top_customers = (

purchase_df.groupby(
'CustomerID'
)[
'Revenue'
]
.sum()
.sort_values(
ascending=False
)
.head(
10
)

)

print(
top_customers
)

# Observation:

# Top customer:
# ~£27,834


# ----------------------------------------------------------
# Average Revenue Per Customer
# ----------------------------------------------------------

customer_totals = (

purchase_df.groupby(
'CustomerID'
)[
'Revenue'
]
.sum()

)

avg_customer_revenue = (
customer_totals.mean()
)

print(
avg_customer_revenue
)

# Output:
# £704.49


# ==========================================================
# ORDER ANALYSIS
# ==========================================================

unique_orders = (

purchase_df[
'InvoiceNo'
]
.nunique()

)

print(
unique_orders
)

# Output:
# 1,902


# ----------------------------------------------------------
# Average Order Value
# ----------------------------------------------------------

invoice_totals = (

purchase_df.groupby(
'InvoiceNo'
)[
'Revenue'
]
.sum()

)

avg_order_value = (
invoice_totals.mean()
)

print(
avg_order_value
)

# Output:
# £511.68


# ==========================================================
# RETURNS ANALYSIS
# ==========================================================

returns_df = df[
df[
'TransactionType'
]
==
'Return'
]

total_returns = len(
returns_df
)

return_rate = (
(
total_returns
/
len(
df
)
)
*
100
)

print(
round(
return_rate,
2
)
)

# Output:
# ~2%


# ----------------------------------------------------------
# Top Returned Products
# ----------------------------------------------------------

top_returns = (

returns_df.groupby(
'Description'
)[
'Quantity'
]
.count()
.sort_values(
ascending=False
)
.head(
10
)

)

print(
top_returns
)

# Observation:

# Frequently returned products
# may require investigation


# ==========================================================
# PROJECT LIMITATIONS
# ==========================================================

"""
1.
Dataset covers short period
(Dec 2010–Jan 2011)

2.
Missing CustomerIDs reduce
customer-level accuracy

3.
Returns excluded
from revenue calculations

4.
Results specific
to this dataset
"""


# ==========================================================
# FINAL SUMMARY
# ==========================================================

print("""

========================================
KEY FINDINGS
========================================

Total Revenue:
£973,233

Top Market:
United Kingdom

Peak Month:
December 2010
£823,746

Slowest Month:
January 2011
£149,487

Top Product (Revenue):
REGENCY CAKESTAND 3 TIER
£31,444

Top Product (Quantity):
WORLD WAR 2 GLIDERS
ASSTD DESIGNS

Unique Customers:
990

Unique Orders:
1,902

Average Order Value:
£511.68

Average Revenue Per Customer:
£704.49

Top Customer Revenue:
£27,834

Return Rate:
~2%

========================================
BUSINESS INSIGHTS
========================================

• Revenue heavily concentrated
during holiday season

• UK dominates sales,
creating concentration risk

• High-value customers drive
large share of revenue

• Low return rate suggests
healthy product-market fit

• Revenue distributed across
multiple products

========================================

""")