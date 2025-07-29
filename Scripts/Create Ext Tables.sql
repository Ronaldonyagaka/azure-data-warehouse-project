/* Uncomment this code to create master key, run it then delete it, it should not appear anywhere in the script
this is for learning purposes */

--CREATE MASTER KEY ENCRYPTION BY  PASSWORD = '*********'

CREATE DATABASE SCOPED CREDENTIAL cred_ron
WITH
    IDENTITY = 'Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH
  (

    LOCATION = 'https://adventureworksdatalake47.dfs.core.windows.net/silver',
    CREDENTIAL = cred_ron
  )


CREATE EXTERNAL DATA SOURCE source_gold
WITH
  (

    LOCATION = 'https://adventureworksdatalake47.dfs.core.windows.net/gold',
    CREDENTIAL = cred_ron
  )

CREATE EXTERNAL FILE FORMAT format_parquet
WITH 
(
FORMAT_TYPE = PARQUET,
DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'

)


CREATE EXTERNAL TABLE gold.External_Sales
WITH
(
LOCATION = 'ExternalSales',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.Sales

CREATE EXTERNAL TABLE gold.External_Products
WITH
(
LOCATION = 'ExternalProducts',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.Products

CREATE EXTERNAL TABLE gold.External_Products_Cat
WITH
(
LOCATION = 'ExternalProductsCat',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.ProductCategory

CREATE EXTERNAL TABLE gold.External_Products_SubCat
WITH
(
LOCATION = 'ExternalProductsSubCat',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.ProductSubcategory


CREATE EXTERNAL TABLE gold.External_Customers
WITH
(
LOCATION = 'ExternalCustomers',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.customer

CREATE EXTERNAL TABLE gold.External_Calendar
WITH
(
LOCATION = 'ExternalCalendar',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.calendar


CREATE EXTERNAL TABLE gold.External_Territory
WITH
(
LOCATION = 'ExternalTerritory',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.Territories

CREATE EXTERNAL TABLE gold.External_Returns
WITH
(
LOCATION = 'ExternalReturns',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
) 
AS
SELECT * FROM gold.Returns




















