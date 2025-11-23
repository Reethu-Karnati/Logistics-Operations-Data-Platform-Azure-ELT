CREATE EXTERNAL TABLE dim_delay_reason
WITH (
    LOCATION    = 'silver/dim_delay_reason/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Logistics_Delay_Reason) AS delay_reason_key,
    Logistics_Delay_Reason                               AS delay_reason_name
FROM (
    SELECT DISTINCT Logistics_Delay_Reason
    FROM bronze_logistics
    WHERE Logistics_Delay_Reason IS NOT NULL
) AS d;
GO

-- Test
SELECT * FROM dim_delay_reason ORDER BY delay_reason_key;
GO