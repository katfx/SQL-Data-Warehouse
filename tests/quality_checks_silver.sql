/*
==================================================================================
Quality Checks
==================================================================================
Script Purpose:
	This script performs various quality checks for data consistency, accuracy, and 
  standardization across the 'silver' schema. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid data ranges and orders.
    - Data consistency between related fields.

Usage Notes:
  - Run these checks after data loading the silver schema.
  - Investigate and resolve any discrepancies found during the checks
==================================================================================
*/


-- ==================================================
-- Checking: silver.crm_cust_info
-- ==================================================
-- check for null or duplicates in primary key
SELECT  cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

--  check for unwanted spaces
SELECT  cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

--  Data consisntencty anad normalization
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info;


-- ==================================================
-- Checking: silver.crm_prd_info
-- ==================================================
-- check for null or duplicates in primary key
SELECT  prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- check for unwanted spaces
SELECT  prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- check for negative values
SELECT  prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Data consisntencty anad normalization
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;

-- check for invalid date orders (start date > end date)
SELECT *
FROM silver.crm_prd_info
WHERE prd_start_dt > prd_end_dt;

-- ==================================================
-- Checking: silver.crm_sales_details
-- ==================================================
-- check for invalid date orders (order date > shipping/due date)
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
	OR sls_order_dt >  sls_cust_id;

-- Check Data Consistency: Sales = Quality * Price
SELECT DISTINCT
	sls_sales,
	sls_quantity,
	sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
	OR sls_sales IS NULL
	OR sls_quantity IS NULL
	OR sls_price IS NULL
	OR sls_sales <= 0
	OR sls_quantity <= 0
	OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;



-- ==================================================
-- Checking: silver.erp_cust_az12
-- ==================================================
-- identify out of range dates
-- Expactation: birthdates between 1924-01-01 and current
SELECT DISTINCT bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
	OR bdate > GETDATE();

-- Data consisntencty anad normalization
SELECT DISTINCT gen
FROM silver.erp_loc_a101;


-- ==================================================
-- Checking: silver.erp_loc_a101
-- ==================================================
-- Data consisntencty anad normalization
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry;


-- ==================================================
-- Checking: silver.erp_px_cat_g1v2
-- ==================================================
-- Check for unwanted spaces
SELECT *
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
	OR subcat != TRIM(subcat)
	OR maintenance != TRIM(maintenance);


-- Data consisntencty anad normalization
SELECT DISTINCT maintenance
FROM silver.erp_px_cat_g1v2;
