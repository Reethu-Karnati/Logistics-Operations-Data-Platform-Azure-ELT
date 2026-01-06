SELECT TOP 20 *
FROM v_asset_traffic_performance
ORDER BY delay_rate DESC, avg_waiting_time DESC;
