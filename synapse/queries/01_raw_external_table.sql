CREATE EXTERNAL TABLE ext_raw_logistics
(
    Timestamp               NVARCHAR(50),
    Asset_ID                NVARCHAR(50),
    Latitude                FLOAT,
    Longitude               FLOAT,
    Inventory_Level         INT,
    Shipment_Status         NVARCHAR(50),
    Temperature             FLOAT,
    Humidity                FLOAT,
    Traffic_Status          NVARCHAR(50),
    Waiting_Time            INT,
    User_Transaction_Amount INT,
    User_Purchase_Frequency INT,
    Logistics_Delay_Reason  NVARCHAR(100),
    Asset_Utilization       FLOAT,
    Demand_Forecast         INT,
    Logistics_Delay         INT
)
WITH (
    LOCATION    = 'raw/smart_logistics_dataset.csv',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = csv_format
);
GO

-- Test
SELECT TOP 50 * FROM ext_raw_logistics;
GO