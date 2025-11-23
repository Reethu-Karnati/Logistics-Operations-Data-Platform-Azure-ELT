CREATE EXTERNAL TABLE dim_shipment_status
WITH (
    LOCATION    = 'silver/dim_shipment_status/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Shipment_Status) AS shipment_status_key,
    Shipment_Status                              AS shipment_status_name
FROM (
    SELECT DISTINCT Shipment_Status
    FROM bronze_logistics
    WHERE Shipment_Status IS NOT NULL
) AS s;
GO

-- Test
SELECT * FROM dim_shipment_status ORDER BY shipment_status_key;
GO