/*
------------------------------------------------------------
Script Title: Data Load Script for Bronze Layer
Purpose: This script performs the following tasks:
         1. Enables local file loading.
         2. Truncates and loads data into the 'bronze' schema tables.
         3. Measures the time taken for each table load.
         4. Calculates the total load duration.
         5. Verifies row counts after loading.
------------------------------------------------------------
*/

-- Enable local file loading
SET GLOBAL local_infile = 1;

-- Declare start time for total execution
SET @total_start_time = NOW();

-- Truncate and Load crm_cust_info
SET @start_time = NOW();
TRUNCATE TABLE bronze.crm_cust_info;
LOAD DATA LOCAL INFILE '/Users/Shivam/Downloads/sql-data-warehouse-project/datasets/source_crm/cust_info.csv' 
INTO TABLE bronze.crm_cust_info
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS;
SET @end_time = NOW();
SELECT CONCAT('crm_cust_info Load Duration: ', TIMESTAMPDIFF(SECOND, @start_time, @end_time), ' seconds') AS Load_Duration;

-- Truncate and Load crm_prd_info
SET @start_time = NOW();
TRUNCATE TABLE bronze.crm_prd_info;
LOAD DATA LOCAL INFILE '/Users/Shivam/Downloads/sql-data-warehouse-project/datasets/source_crm/prd_info.csv' 
INTO TABLE bronze.crm_prd_info
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS;
SET @end_time = NOW();
SELECT CONCAT('crm_prd_info Load Duration: ', TIMESTAMPDIFF(SECOND, @start_time, @end_time), ' seconds') AS Load_Duration;

-- Truncate and Load crm_sales_details
SET @start_time = NOW();
TRUNCATE TABLE bronze.crm_sales_details;
LOAD DATA LOCAL INFILE '/Users/Shivam/Downloads/sql-data-warehouse-project/datasets/source_crm/sales_details.csv' 
INTO TABLE bronze.crm_sales_details
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS;
SET @end_time = NOW();
SELECT CONCAT('crm_sales_details Load Duration: ', TIMESTAMPDIFF(SECOND, @start_time, @end_time), ' seconds') AS Load_Duration;

-- Truncate and Load erp_loc_a101
SET @start_time = NOW();
TRUNCATE TABLE bronze.erp_loc_a101;
LOAD DATA LOCAL INFILE '/Users/Shivam/Downloads/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv' 
INTO TABLE bronze.erp_loc_a101
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS;
SET @end_time = NOW();
SELECT CONCAT('erp_loc_a101 Load Duration: ', TIMESTAMPDIFF(SECOND, @start_time, @end_time), ' seconds') AS Load_Duration;

-- Truncate and Load erp_cust_az12
SET @start_time = NOW();
TRUNCATE TABLE bronze.erp_cust_az12;
LOAD DATA LOCAL INFILE '/Users/Shivam/Downloads/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv' 
INTO TABLE bronze.erp_cust_az12
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS;
SET @end_time = NOW();
SELECT CONCAT('erp_cust_az12 Load Duration: ', TIMESTAMPDIFF(SECOND, @start_time, @end_time), ' seconds') AS Load_Duration;

-- Truncate and Load erp_px_cat_g1v2
SET @start_time = NOW();
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
LOAD DATA LOCAL INFILE '/Users/Shivam/Downloads/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv' 
INTO TABLE bronze.erp_px_cat_g1v2
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS;
SET @end_time = NOW();
SELECT CONCAT('erp_px_cat_g1v2 Load Duration: ', TIMESTAMPDIFF(SECOND, @start_time, @end_time), ' seconds') AS Load_Duration;

-- Total Load Time
SET @total_end_time = NOW();
SELECT CONCAT('>> Total Load Duration: ', TIMESTAMPDIFF(SECOND, @total_start_time, @total_end_time), ' seconds') AS Total_Load_Duration;

-- Verify row counts
SELECT 'crm_cust_info' AS TableName, COUNT(*) FROM bronze.crm_cust_info
UNION ALL
SELECT 'crm_prd_info', COUNT(*) FROM bronze.crm_prd_info
UNION ALL
SELECT 'crm_sales_details', COUNT(*) FROM bronze.crm_sales_details
UNION ALL
SELECT 'erp_loc_a101', COUNT(*) FROM bronze.erp_loc_a101
UNION ALL
SELECT 'erp_cust_az12', COUNT(*) FROM bronze.erp_cust_az12
UNION ALL
SELECT 'erp_px_cat_g1v2', COUNT(*) FROM bronze.erp_px_cat_g1v2;
