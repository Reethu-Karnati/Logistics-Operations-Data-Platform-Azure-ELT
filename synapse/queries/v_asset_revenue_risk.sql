CREATE OR ALTER VIEW v_asset_revenue_risk AS
SELECT
    da.asset_id,
    COUNT(*) AS total_trips,
    AVG(f.user_transaction_amount) AS avg_revenue_per_trip,
    SUM(f.user_transaction_amount) AS total_revenue,
    SUM(CASE WHEN f.logistics_delay = 1 THEN 1 ELSE 0 END) * 1.0 
        / NULLIF(COUNT(*), 0) AS delay_rate,
    AVG(f.waiting_time) AS avg_waiting_time,
    AVG(f.asset_utilization) AS avg_asset_utilization
FROM fact_logistics_events f
JOIN dim_asset da
    ON f.asset_key = da.asset_key
GROUP BY da.asset_id;
