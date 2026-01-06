SELECT TOP 20 *
FROM v_delivery_risk_score
ORDER BY risk_score DESC, waiting_time DESC;
