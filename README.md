Logistics Operations Data Platform — Azure ELT Project

Azure Synapse Analytics | ADLS Gen2 | Serverless SQL | Managed Identity | ELT Architecture

📌 Overview

This project demonstrates a secure and scalable Azure ELT data platform designed to analyze logistics operations. The solution transforms raw shipment, asset, and event data into high-quality analytical models using a structured Bronze → Silver → Gold approach in Azure Synapse Analytics.

The platform delivers operational insights into delays, traffic patterns, asset performance, revenue exposure, and predictive delivery risk — all powered by SQL-based data engineering.

🏗 Architecture

Azure Data Lake Gen2 for hierarchical storage

Azure Synapse Serverless SQL for ELT processing

Managed Identity + RBAC for secure, credential-free access

Parquet + partitioning for optimized data retrieval

Data Flow:
Raw Files → Bronze → Silver (cleaned, standardized) → Gold (KPIs + Risk Models)

🔧 Technologies Used

Azure Synapse Analytics (Serverless SQL)

Azure Data Lake Storage Gen2

ELT transformation patterns

Parquet file optimization + partitioning

Azure RBAC + Managed Identity security

📊 Key Insights from Gold Layer

All insights are generated through SQL models, not BI tools.

1. Root Causes of Delays

Heavy traffic results in 100% delivery delays.

Mechanical failures and detours also show elevated delay patterns.

2. Asset Performance Under Traffic Conditions

Some trucks show delays even in Clear traffic, indicating internal inefficiencies.

Truck utilization vs. delay trends highlight optimization opportunities.

3. Revenue vs. Risk Exposure

High-revenue vehicles also show higher delay risk → potential SLA impact.

4. Predictive Risk Scoring (0–12)

A SQL model evaluates delivery risk based on:

Traffic severity

Waiting time

Asset utilization

Revenue priority

Scores >10 indicate high likelihood of late delivery.

5. Operational Optimization Opportunities

Recommended ideal utilization range: 70–75%

Route balancing and dynamic traffic-aware scheduling improve performance

🧠 Predictive Model (SQL-Based)

The risk score is computed entirely in SQL using weighted scoring logic — no ML tools required.
This enables fast, scalable analytics within the warehouse layer.

📂 Project Structure
/bronze
/silver
/gold
    v_delay_analysis.sql
    v_asset_performance.sql
    v_revenue_risk.sql
    v_delivery_risk_score.sql

🔒 Security

Synapse workspace connected securely via Managed Identity

ADLS access controlled with Storage Blob Data Contributor

No access keys or secrets used

🚀 Future Enhancements

Automate workflows using Synapse Pipelines

Integrate real-time IoT or telematics data

Expand risk scoring into ML-based ETA predictions

Add anomaly detection for asset health monitoring

👩‍💻 Author

Reethu Karnati
Azure Data Engineering | SQL | Cloud Analytics
