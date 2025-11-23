CREATE EXTERNAL TABLE dim_traffic_status
WITH (
    LOCATION    = 'silver/dim_traffic_status/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Traffic_Status) AS traffic_status_key,
    Traffic_Status                              AS traffic_status_name
FROM (
    SELECT DISTINCT Traffic_Status
    FROM bronze_logistics
    WHERE Traffic_Status IS NOT NULL
) AS t;
GO

-- Test
SELECT * FROM dim_traffic_status ORDER BY traffic_status_key;
GO