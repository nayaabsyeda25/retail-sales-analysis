-- ================================================
-- Project: Retail Sales Analysis
-- File: Data Cleaning
-- Author: Nayaab
-- Date: May 2026
-- ================================================

-- ================================================
-- STEP 1: CONVERT DATA TYPES
-- (All columns imported as VARCHAR to avoid errors)
-- ================================================

ALTER TABLE retail_data MODIFY Quantity INT;
ALTER TABLE retail_data MODIFY UnitPrice DECIMAL(10,2);
ALTER TABLE retail_data MODIFY CustomerID INT NULL;
ALTER TABLE retail_data MODIFY Country VARCHAR(50);

-- Convert InvoiceDate format
ALTER TABLE retail_data ADD COLUMN InvoiceDate_clean DATETIME;
UPDATE retail_data 
SET InvoiceDate_clean = STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i');
ALTER TABLE retail_data DROP COLUMN InvoiceDate;
ALTER TABLE retail_data RENAME COLUMN InvoiceDate_clean TO InvoiceDate;

-- ================================================
-- STEP 2: HANDLE MISSING VALUES
-- ================================================

-- Convert empty CustomerID to NULL
UPDATE retail_data 
SET CustomerID = NULL 
WHERE CustomerID = '' OR CustomerID = 'NA';

-- Convert UnitPrice = 0 to NULL (invalid prices)
UPDATE retail_data 
SET UnitPrice = NULL 
WHERE UnitPrice = 0;

-- ================================================
-- STEP 3: TRIM WHITESPACE
-- ================================================

UPDATE retail_data SET Description = TRIM(Description);
UPDATE retail_data SET Country = TRIM(Country);
UPDATE retail_data SET StockCode = TRIM(StockCode);
UPDATE retail_data SET InvoiceNo = TRIM(InvoiceNo);

-- ================================================
-- STEP 4: STANDARDIZE TEXT
-- ================================================

UPDATE retail_data SET Description = UPPER(Description);
UPDATE retail_data SET Country = UPPER(Country);

-- ================================================
-- STEP 5: FLAG RETURNS AND PURCHASES
-- ================================================

ALTER TABLE retail_data ADD COLUMN transaction_type VARCHAR(20);

UPDATE retail_data 
SET transaction_type = 'Return' 
WHERE Quantity < 0 OR UnitPrice < 0;

UPDATE retail_data 
SET transaction_type = 'Purchase' 
WHERE transaction_type IS NULL;

-- ================================================
-- STEP 6: VERIFY CLEANING RESULTS
-- ================================================

SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(CustomerID) AS null_customers,
    COUNT(*) - COUNT(UnitPrice) AS null_unitprice,
    COUNT(*) - COUNT(Description) AS null_description
FROM retail_data;

SELECT transaction_type, COUNT(*) AS count
FROM retail_data
GROUP BY transaction_type;