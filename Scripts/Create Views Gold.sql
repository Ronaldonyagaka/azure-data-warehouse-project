-- =============================================
-- Create Gold Views from Silver Layer Parquet Files
-- Data Source: Azure Data Lake (Silver Layer)
-- =============================================

-- Calendar View
CREATE VIEW gold.calendar AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Calender/',
    FORMAT = 'PARQUET'
) AS CalendarQuery;


-- Customer View
CREATE VIEW gold.customer AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Customer/',
    FORMAT = 'PARQUET'
) AS CustomerQuery;


-- Product Category View
CREATE VIEW gold.ProductCategory AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_ProductCategory/',
    FORMAT = 'PARQUET'
) AS CategoryQuery;


-- Product Subcategory View
CREATE VIEW gold.ProductSubcategory AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_ProductSubcategory/',
    FORMAT = 'PARQUET'
) AS SubCategoryQuery;


-- Products View
CREATE VIEW gold.Products AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
) AS ProductsQuery;


-- Returns View
CREATE VIEW gold.Returns AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) AS ReturnsQuery;


-- Sales View
CREATE VIEW gold.Sales AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
) AS SalesQuery;


-- Territories View
CREATE VIEW gold.Territories AS
SELECT *
FROM OPENROWSET(
    BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Territories/',
    FORMAT = 'PARQUET'
) AS TerritoriesQuery;
