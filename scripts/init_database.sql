/*
    Data Warehouse Schema Initialization Script
    -------------------------------------------
    Description:
        This script creates the DataWarehouse database (if it does not exist)
        and defines three schemas (bronze, silver, gold) for organizing data 
        into different processing stages.

    Schemas:
        - bronze: Raw data storage
        - silver: Cleaned and processed data
        - gold: Aggregated and business-ready data
    WARNING:
        - Ensure you have the correct database selected before running this script.
        - Running this script may create new schemas, which could affect existing 
          data structures if similar schema names already exist.
        - Always take a backup before making structural changes to a database.
*/

-- Create the database if it does not already exist
CREATE DATABASE IF NOT EXISTS DataWarehouse;

-- Switch to the DataWarehouse database
USE DataWarehouse;

-- Create schemas for different data processing stages
CREATE SCHEMA bronze;  -- Raw data storage layer
CREATE SCHEMA silver;  -- Cleaned and processed data layer
CREATE SCHEMA gold;    -- Aggregated and business-ready data layer
