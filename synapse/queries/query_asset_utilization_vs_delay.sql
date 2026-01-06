SELECT 
    asset_id,
    total_trips,
    avg_revenue_per_trip,
    total_revenue,
    delay_rate,
    avg_waiting_time,
    avg_asset_utilization
FROM v_asset_revenue_risk
ORDER BY avg_asset_utilization DESC, delay_rate DESC;
