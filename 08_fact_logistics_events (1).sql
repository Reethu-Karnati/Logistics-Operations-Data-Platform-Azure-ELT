CREATE EXTERNAL TABLE fact_logistics_events
WITH (
    LOCATION    = 'silver/fact_logistics_events/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    ROW_NUMBER() OVER (
        ORDER BY b.Event_Timestamp, b.Asset_ID
    )                                       AS event_id,

    d.date_key,
    a.asset_key,
    s.shipment_status_key,
    t.traffic_status_key,
    r.delay_reason_key,

    b.Event_Timestamp,
    b.Latitude,
    b.Longitude,
    b.Inventory_Level,
    b.Temperature,
    b.Humidity,
    b.Waiting_Time,
    b.User_Transaction_Amount,
    b.User_Purchase_Frequency,
    b.Asset_Utilization,
    b.Demand_Forecast,
    b.Logistics_Delay
FROM bronze_logistics b
LEFT JOIN dim_date d
    ON CAST(b.Event_Timestamp AS DATE) = d.[date]
LEFT JOIN dim_asset a
    ON b.Asset_ID = a.asset_id
LEFT JOIN dim_shipment_status s
    ON b.Shipment_Status = s.shipment_status_name
LEFT JOIN dim_traffic_status t
    ON b.Traffic_Status = t.traffic_status_name
LEFT JOIN dim_delay_reason r
    ON b.Logistics_Delay_Reason = r.delay_reason_name;
GO

--Test 
SELECT TOP 50 * FROM fact_logistics_events;
GO