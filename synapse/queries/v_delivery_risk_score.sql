CREATE OR ALTER VIEW v_delivery_risk_score AS
SELECT
    f.event_id,
    da.asset_id,
    dts.traffic_status_name,
    f.waiting_time,
    f.asset_utilization,
    f.user_transaction_amount,
    
    -- Traffic-based score
    CASE 
        WHEN dts.traffic_status_name = 'Heavy' THEN 3
        WHEN dts.traffic_status_name = 'Detour' THEN 2
        ELSE 1
    END AS traffic_score,

    -- Normalized waiting time (0-3 scale)
    CASE
        WHEN f.waiting_time >= 40 THEN 3
        WHEN f.waiting_time >= 35 THEN 2
        ELSE 1
    END AS waiting_time_score,

    -- Inverse utilization score (higher utilization → higher risk)
    CASE
        WHEN f.asset_utilization >= 82 THEN 3
        WHEN f.asset_utilization >= 79 THEN 2
        ELSE 1
    END AS utilization_score,

    -- Revenue protection score (low revenue → higher risk)
    CASE
        WHEN f.user_transaction_amount < 280 THEN 3
        WHEN f.user_transaction_amount < 300 THEN 2
        ELSE 1
    END AS revenue_score,

    -- Final combined risk score
    (
        CASE 
            WHEN dts.traffic_status_name = 'Heavy' THEN 3
            WHEN dts.traffic_status_name = 'Detour' THEN 2
            ELSE 1
        END
        +
        CASE
            WHEN f.waiting_time >= 40 THEN 3
            WHEN f.waiting_time >= 35 THEN 2
            ELSE 1
        END
        +
        CASE
            WHEN f.asset_utilization >= 82 THEN 3
            WHEN f.asset_utilization >= 79 THEN 2
            ELSE 1
        END
        +
        CASE
            WHEN f.user_transaction_amount < 280 THEN 3
            WHEN f.user_transaction_amount < 300 THEN 2
            ELSE 1
        END
    ) AS risk_score
    
FROM fact_logistics_events f
JOIN dim_asset da 
    ON f.asset_key = da.asset_key
JOIN dim_traffic_status dts
    ON f.traffic_status_key = dts.traffic_status_key;
