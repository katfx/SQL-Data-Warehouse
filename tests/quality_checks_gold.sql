/*
==============================================================================
Qaulity Checks of the Gold Layer
==============================================================================
Script Purpose:
  This script perfomrs quality checks to validate the integrity, consistency,
  and accuracy of surrogate keys in dimesnion tables;
    - Uniqueness of surrogate keys in dimension tables.
    - Refferential Integrity between fact and dimesion tables
    - Validation of relationships in the data modelfor analytical puporse.

Usage Notes:
  - Run these checks after data loading the silver layer.
  - Investigate and resolve any discrepensies found during the checks.
==============================================================================
*/

--==========================================================
-- Checking: 'gold.dim_customer'
--==========================================================
-- Check for uniqueness of Customer Key in gold.dim_customer
SELECT customer_key, COUNT(*)
FROM gold.dim_customer
GROUP BY customer_key
HAVING COUNT(*) > 1;

--==========================================================
-- Checking: 'gold.dim_product'
--==========================================================
-- Check for uniqueness of Product Key in gold.dim_product
SELECT product_key, COUNT(*) AS duplicate_count
FROM gold.dim_product
GROUP BY product_key
HAVING COUNT(*) > 1;

--==========================================================
-- Checking: 'gold.fact_sales'
--==========================================================
-- Check the data model connectivity between fact and dimension
SELECT * 
FROM gold.fact_sales s
LEFT JOIN gold.dim_customer c
	ON c.customer_key = s.customer_key
LEFT JOIN gold.dim_product p
	ON p.product_key = s.product_key
WHERE c.customer_key IS NULL;
