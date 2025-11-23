CREATE OR ALTER VIEW v_daily_delay_metrics AS
SELECT
    d.[date],
    d.[year],
    d.[month],
    d.[day],
    d.weekday_name,

    COUNT(*) AS total_events,

    SUM(CASE WHEN f.Logistics_Delay = 1 THEN 1 ELSE 0 END) AS delayed_events,

    CASE 
        WHEN COUNT(*) = 0 THEN 0
        ELSE 1.0 * SUM(CASE WHEN f.Logistics_Delay = 1 THEN 1 ELSE 0 END) / COUNT(*)
    END AS delay_rate,

    AVG(CAST(f.Waiting_Time AS FLOAT))        AS avg_waiting_time,
    AVG(CAST(f.Asset_Utilization AS FLOAT))   AS avg_asset_utilization
FROM fact_logistics_events f
JOIN dim_date d
    ON f.date_key = d.date_key
GROUP BY
    d.[date],
    d.[year],
    d.[month],
    d.[day],
    d.weekday_name;
GO

-- Test
SELECT TOP 50 * FROM v_daily_delay_metrics ORDER BY [date];
GO