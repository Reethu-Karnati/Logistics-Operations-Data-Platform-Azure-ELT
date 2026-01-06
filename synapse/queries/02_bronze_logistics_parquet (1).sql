
CREATE EXTERNAL TABLE bronze_logistics
WITH (
    LOCATION    = 'bronze/logistics_events/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    TRY_CONVERT(datetime2, Timestamp)            AS Event_Timestamp,
    Asset_ID,
    Latitude,
    Longitude,
    Inventory_Level,
    Shipment_Status,
    Temperature,
    Humidity,
    Traffic_Status,
    Waiting_Time,
    User_Transaction_Amount,
    User_Purchase_Frequency,
    Logistics_Delay_Reason,
    Asset_Utilization,
    Demand_Forecast,
    CAST(Logistics_Delay AS bit)                 AS Logistics_Delay
FROM ext_raw_logistics;
GO

-- Test
SELECT TOP 50 * FROM bronze_logistics;
GO
