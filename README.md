# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository!
This project demonstrates a comprehensive data warehouse and analytics solutions, from building a modern data warehouse to generating actionable insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling reporting and informed decision-making.

#### Specifications
- **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality:** Cleanse and resolve data quality issues prior to analysis.
- **Integration:** Combine both sources into a singl, user-friendly data model esigned for analytical queries.
- **Scope:** Focus on the latest dataset only, historization of data is not required.
- **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### Bl: Analytics & Reporting (Data Analytics)

### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

### Data Architecture
The data architecture for this project follows the Medallion Architecture Bronze, Silver, and Gold layers:
<img width="1284" height="753" alt="DWH Architecture drawio" src="https://github.com/user-attachments/assets/a6a94bfc-69f2-416d-a749-e8b8f9f1cf9e" />

1. **Bronze Layer**: Stores raw data as-is in from the source systems. Data is ingested from CSV files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare for analysis.
3. **Bronze Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.
