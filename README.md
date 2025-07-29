# Azure Data Lakehouse Project with Synapse, ADF & Power BI
---

````markdown


— This project implements a complete modern data lakehouse architecture on Azure— from raw ingestion to final analytics
leveraging > Data Lake Gen2, Azure Data Factory, Databricks, Synapse Analytics, and Power BI.

> 🧠 Designed to deliver scalable, secure, and insightful analytics by integrating structured ingestion, robust transformation,
and semantic modeling — all layered in a clean medallion architecture.

---

## 🛠️ Tools & Services Used

| Layer        | Tool/Service                       |
|--------------|------------------------------------|
| Storage      | Azure Data Lake Gen2               |
| Ingestion    | Azure Data Factory (ADF)           |
| Processing   | Azure Databricks                   |
| Modeling     | Azure Synapse Serverless SQL Pool  |
| Authentication | Microsoft Entra ID (Managed Identity) |
| Visualization | Power BI                          |

---

## 🧱 Architecture Overview

```
                         ┌─────────────────────┐
                         │   Source Systems    │
                         └────────┬────────────┘
                                  │
                         ┌────────▼─────────┐
                         │ Azure Data Factory│
                         └────────┬─────────┘
                                  ▼
                        ┌──────────────────────┐
                        │ Bronze Layer (Raw)   │
                        └──────────────────────┘
                                  ▼
                        ┌──────────────────────┐
                        │ Silver Layer (Clean) │
                        └──────────────────────┘
                                  ▼
                     ┌───────────────────────────────┐
                     │ Azure Synapse (Serverless SQL)│
                     │   - Gold Views & Modeling     │
                     └────────────┬──────────────────┘
                                  ▼
                     ┌─────────────────────────────┐
                     │ Gold Layer (Final Data)     │
                     │ External Tables via Views   │
                     └────────────┬────────────────┘
                                  ▼
                           ┌────────────────────┐
                           │   Power BI Reports │
                           └────────────────────┘
````

---

## ⚙️ Workflow Summary

### 1. **Ingest Data via Azure Data Factory**

* Created linked services to APIs and the data lake.
* Parameterized pipelines for scalable ingestion.
* Data loaded into the **Bronze** container (raw format).
  
<img width="1288" height="585" alt="image" src="https://github.com/user-attachments/assets/e68744e6-9c05-4a22-a190-e43f84105f5b" />

<img width="1184" height="584" alt="image" src="https://github.com/user-attachments/assets/2d703099-a788-4348-aac5-6dc0b4022e67" />



### 2. **Transform Data in Azure Databricks**

* Read from Bronze.
* Applied business rules and cleaning logic.
* Output structured data into the **Silver** layer.
<img width="1229" height="1034" alt="image" src="https://github.com/user-attachments/assets/f7acc154-7f81-4576-8a30-dff60b24a6b6" />

<img width="1250" height="891" alt="image" src="https://github.com/user-attachments/assets/da26503c-3559-4b60-8159-fd3c43e57ce3" />

<img width="1266" height="1121" alt="image" src="https://github.com/user-attachments/assets/35accd1e-e9fd-4cce-96fe-29d3fbe0867b" />

### 3. **Modeling in Synapse Analytics**

* Created views in the **Gold schema** from **Silver** using `OPENROWSET`.
* Modeled data with clean relationships and business logic.
* Defined **external tables** using those views and wrote them back to the **Gold container** in the lake using `CREATE EXTERNAL TABLE AS SELECT`.
  
<img width="1584" height="1224" alt="image" src="https://github.com/user-attachments/assets/ffbff6f0-f3dc-4e95-869d-6ae5da92a62b" />

<img width="1498" height="1207" alt="image" src="https://github.com/user-attachments/assets/e1de940c-fb61-4e2b-a603-57f3508e378b" />




### 4. **Authentication with Microsoft Entra ID**

* Used a managed identity to access Azure Data Lake securely.
* Assigned necessary IAM roles (Storage Blob Contributor).

### 5. **Power BI Visualization**

* Connected Power BI to **Synapse views** for live reporting.
* Built interactive dashboards from curated **Gold data**.

---

## 🧾 Sample View Definition

```sql
CREATE VIEW gold.customer AS
SELECT *
FROM OPENROWSET(
  BULK 'https://yourdatalake.dfs.core.windows.net/silver/Customer/',
  FORMAT = 'PARQUET'
) AS customer_data;
```

---

## 📤 Writing Gold Views to External Tables

```sql
CREATE EXTERNAL TABLE gold.External_Customers
WITH (
  LOCATION = 'ExternalCustomers',
  DATA_SOURCE = source_gold,
  FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customer;
```

---

## ✨ Why This Matters

This project demonstrates a **modular, enterprise-ready lakehouse** architecture with clear layer separation (Bronze ➝ Silver ➝ Gold), ensuring:

* **Data governance** and **audibility**
* Easy **scaling** of data sources
* Powerful **analytics and self-service BI**
* Secure access using **Managed Identity**

---

## 📌 Next Steps

* Add Delta Lake support for versioned updates
* Implement CI/CD for pipeline deployment
* Integrate data quality checks with Great Expectations or similar tools

---

## 👨‍💻 Author

**Ronald Nyagaka**
Data Engineer| Power BI Engineer| Data Scientist | SQL • Azure • Python • Power BI • Databricks • Synapse • Pyspark
[GitHub](https://github.com/Ronaldonyagaka)

---

## 🏁 License

This project is open-source and free to use under the MIT License.

```
```
