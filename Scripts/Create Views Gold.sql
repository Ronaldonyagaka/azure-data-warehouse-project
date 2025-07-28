CREATE VIEW gold.calendar
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Calender/',
        FORMAT = 'PARQUET'
    ) AS CalendarQuery


CREATE VIEW gold.customer
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Customer/',
        FORMAT = 'PARQUET'
    ) AS CustomerQuery


CREATE VIEW gold.ProductCategory
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_ProductCategory/',
        FORMAT = 'PARQUET'
    ) AS CategoryQuery


CREATE VIEW gold.ProductSubcategory
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_ProductSubcategory/',
        FORMAT = 'PARQUET'
    ) AS SubCategoryQuery


CREATE VIEW gold.Products
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
    ) AS ProductsQuery


CREATE VIEW gold.Returns
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Returns/',
        FORMAT = 'PARQUET'
    ) AS ReturnsQuery


CREATE VIEW gold.Sales
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Sales/',
        FORMAT = 'PARQUET'
    ) AS SalesQuery


CREATE VIEW gold.Territories
AS
SELECT 
    *
FROM
    OPENROWSET(
        BULK 'https://adventureworksdatalake47.dfs.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'PARQUET'
    ) AS TerritoriesQuery





