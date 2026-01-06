CREATE OR ALTER VIEW v_asset_performance AS
SELECT
    a.asset_id,

    COUNT(*) AS total_events,

    SUM(CASE WHEN f.Logistics_Delay = 1 THEN 1 ELSE 0 END) AS delayed_events,

    CASE 
        WHEN COUNT(*) = 0 THEN 0
        ELSE 1.0 * SUM(CASE WHEN f.Logistics_Delay = 1 THEN 1 ELSE 0 END) / COUNT(*)
    END AS delay_rate,

    AVG(CAST(f.Waiting_Time AS FLOAT))              AS avg_waiting_time,
    AVG(CAST(f.Asset_Utilization AS FLOAT))         AS avg_asset_utilization,
    AVG(CAST(f.User_Transaction_Amount AS FLOAT))   AS avg_transaction_amount,
    AVG(CAST(f.User_Purchase_Frequency AS FLOAT))   AS avg_purchase_frequency
FROM fact_logistics_events f
LEFT JOIN dim_asset a
    ON f.asset_key = a.asset_key
GROUP BY
    a.asset_id;
GO

-- Test
SELECT * FROM v_asset_performance ORDER BY delay_rate DESC;
GO