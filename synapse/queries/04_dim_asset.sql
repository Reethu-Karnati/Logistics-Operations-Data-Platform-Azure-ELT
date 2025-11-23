CREATE EXTERNAL TABLE dim_asset
WITH (
    LOCATION    = 'silver/dim_asset/',
    DATA_SOURCE = ds_logistics_datalake,
    FILE_FORMAT = parquet_format
)
AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Asset_ID) AS asset_key,
    Asset_ID                              AS asset_id
FROM (
    SELECT DISTINCT Asset_ID
    FROM bronze_logistics
    WHERE Asset_ID IS NOT NULL
) AS a;
GO

-- Test
SELECT * FROM dim_asset ORDER BY asset_key;
GO