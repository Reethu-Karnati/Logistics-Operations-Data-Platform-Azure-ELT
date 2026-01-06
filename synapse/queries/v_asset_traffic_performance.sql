CREATE OR ALTER VIEW v_asset_traffic_performance AS
SELECT
    da.asset_id,
    dts.traffic_status_name,
    COUNT(*) AS total_trips,
    SUM(CASE WHEN f.logistics_delay = 1 THEN 1 ELSE 0 END) * 1.0
        / NULLIF(COUNT(*), 0) AS delay_rate,
    AVG(f.waiting_time) AS avg_waiting_time,
    AVG(f.asset_utilization) AS avg_asset_utilization,
    AVG(f.user_transaction_amount) AS avg_revenue_per_trip
FROM fact_logistics_events AS f
JOIN dim_asset AS da
    ON f.asset_key = da.asset_key
JOIN dim_traffic_status AS dts
    ON f.traffic_status_key = dts.traffic_status_key
GROUP BY
    da.asset_id,
    dts.traffic_status_name;
