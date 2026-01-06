CREATE EXTERNAL TABLE dim_date
WITH (
    LOCATION    = 'silver/dim_date/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT DISTINCT
    CAST(CONVERT(char(8), Event_Timestamp, 112) AS INT) AS date_key,
    CAST(Event_Timestamp AS DATE)                       AS [date],
    YEAR(Event_Timestamp)                               AS [year],
    MONTH(Event_Timestamp)                              AS [month],
    DAY(Event_Timestamp)                                AS [day],
    DATENAME(WEEKDAY, Event_Timestamp)                  AS weekday_name
FROM bronze_logistics
WHERE Event_Timestamp IS NOT NULL;
GO

-- Test
SELECT TOP 50 * FROM dim_date ORDER BY [date];
GO