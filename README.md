Logistics Operations Data Platform – Azure ELT

This project demonstrates how to build an end-to-end Azure ELT Data Engineering Platform for logistics operations using Azure Synapse Analytics, ADLS Gen2, and Medallion Architecture (Raw–Bronze–Silver–Gold).

🚀 Project Goals & Insights

This platform answers advanced logistics questions such as:

1️⃣ What operational factors contribute most to logistics delays?
2️⃣ How do traffic patterns impact delivery performance across assets?
3️⃣ How efficiently are logistics assets being utilized across time?
4️⃣ How accurate is the demand forecast versus actual activity?
5️⃣ What is the financial impact of delays on customer transactions?
6️⃣ What environmental or operational patterns indicate high delay risk?

These insights help optimize routing, resource allocation, operational efficiency, and demand planning.

🧱 Architecture (Medallion Layers)
Azure Data Lake Gen2 → Synapse → ELT → Power BI


Raw: Original CSV uploaded to ADLS

Bronze: Clean, typed parquet data

Silver: Fact + Dimension model

Gold: KPI tables for Power BI dashboards

Technologies used:

Azure Synapse Analytics (Serverless SQL + Pipelines)

Azure Data Lake Storage Gen2

Azure Active Directory (Managed Identity)

Power BI

Medallion Architecture

📄 Dataset Description

Dataset contains real-world logistics features such as:

Timestamp, Asset_ID, Latitude, Longitude

Traffic_Status, Shipment_Status, Waiting_Time

Inventory_Level, Temperature, Humidity

User_Transaction_Amount, User_Purchase_Frequency

Asset_Utilization, Demand_Forecast

Logistics_Delay, Logistics_Delay_Reason

Dataset file stored in:

👉 dataset/smart_logistics_dataset.csv

🛠️ Project Status

✔ Step 1: Project Planning
✔ Step 2: Azure Resource Group
✔ Step 3: ADLS Gen2 Storage Account
✔ Step 4: Medallion Folder Structure
✔ Step 5: Upload Raw Data
✔ Step 6: Create Azure Synapse Workspace
⬜ Step 7: Linked Service (ADLS → Synapse)
⬜ Step 8: Bronze Transformation
⬜ Step 9: Silver Fact & Dimensions
⬜ Step 10: Gold Layer KPIs
⬜ Step 11: Power BI Dashboard Development
⬜ Step 12: Architecture Diagram

👨‍💻 Author

Reethu Karnati
Azure | AWS | Data Engineering | Analytics
