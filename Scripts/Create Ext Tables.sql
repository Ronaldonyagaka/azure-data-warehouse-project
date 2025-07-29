/* 
====================================================
🔐 Optional: Create a Master Key (for learning only)
Uncomment, run once, then delete this line.
====================================================

-- CREATE MASTER KEY ENCRYPTION BY PASSWORD = '*********'

*/

-- =============================================
-- 🔑 Create Database Scoped Credential (Managed Identity)
-- =============================================

CREATE DATABASE SCOPED CREDENTIAL cred_ron
WITH IDENTITY = 'Managed Identity';


-- =============================================
-- 🌐 Create External Data Sources
-- =============================================

-- Silver Layer Data Source
CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION = 'https://adventureworksdatalake47.dfs.core.windows.net/silver',
    CREDENTIAL = cred_ron
);

-- Gold Layer Data Source
CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION = 'https://adventureworksdatalake47.dfs.core.windows.net/gold',
    CREDENTIAL = cred_ron
);


-- =============================================
-- 🗃️ Define External File Format
-- =============================================

CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);


-- =============================================
-- 📤 Create External Tables in Gold Schema
-- =============================================

-- Sales
CREATE EXTERNAL TABLE gold.External_Sales
WITH (
    LOCATION = 'ExternalSales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.Sales;

-- Products
CREATE EXTERNAL TABLE gold.External_Products
WITH (
    LOCATION = 'ExternalProducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.Products;

-- Product Category
CREATE EXTERNAL TABLE gold.External_Products_Cat
WITH (
    LOCATION = 'ExternalProductsCat',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.ProductCategory;

-- Product Subcategory
CREATE EXTERNAL TABLE gold.External_Products_SubCat
WITH (
    LOCATION = 'ExternalProductsSubCat',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.ProductSubcategory;

-- Customers
CREATE EXTERNAL TABLE gold.External_Customers
WITH (
    LOCATION = 'ExternalCustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.customer;

-- Calendar
CREATE EXTERNAL TABLE gold.External_Calendar
WITH (
    LOCATION = 'ExternalCalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.calendar;

-- Territories
CREATE EXTERNAL TABLE gold.External_Territory
WITH (
    LOCATION = 'ExternalTerritory',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.Territories;

-- Returns
CREATE EXTERNAL TABLE gold.External_Returns
WITH (
    LOCATION = 'ExternalReturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS SELECT * FROM gold.Returns;
