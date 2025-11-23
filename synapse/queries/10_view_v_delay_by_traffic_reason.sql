CREATE OR ALTER VIEW v_delay_by_traffic_reason AS
SELECT
    t.traffic_status_name,
    r.delay_reason_name,

    COUNT(*) AS total_events,

    SUM(CASE WHEN f.Logistics_Delay = 1 THEN 1 ELSE 0 END) AS delayed_events,

    CASE 
        WHEN COUNT(*) = 0 THEN 0
        ELSE 1.0 * SUM(CASE WHEN f.Logistics_Delay = 1 THEN 1 ELSE 0 END) / COUNT(*)
    END AS delay_rate,

    AVG(CAST(f.Waiting_Time AS FLOAT))        AS avg_waiting_time,
    AVG(CAST(f.Asset_Utilization AS FLOAT))   AS avg_asset_utilization
FROM fact_logistics_events f
LEFT JOIN dim_traffic_status t
    ON f.traffic_status_key = t.traffic_status_key
LEFT JOIN dim_delay_reason r
    ON f.delay_reason_key = r.delay_reason_key
GROUP BY
    t.traffic_status_name,
    r.delay_reason_name;
GO

-- Test
SELECT * FROM v_delay_by_traffic_reason
ORDER BY traffic_status_name, delay_reason_name;
GO