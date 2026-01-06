-- External data source pointing to your ADLS Gen2 container
CREATE EXTERNAL DATA SOURCE ds_logistics_datalake
WITH (
    LOCATION = 'https://stlogisticsdatalake.dfs.core.windows.net/logistics-data'
);
GO

-- CSV file format for raw data
CREATE EXTERNAL FILE FORMAT csv_format
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2
    )
);
GO

-- Parquet file format for Bronze/Silver layers
CREATE EXTERNAL FILE FORMAT parquet_format
WITH (
    FORMAT_TYPE = PARQUET
);
GO