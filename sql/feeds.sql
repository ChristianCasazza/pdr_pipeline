WITH aggregated_predictions AS (
    SELECT 
        contract, 
        pair,
        source,
        timeframe,
        COUNT(CASE WHEN payout > 0 THEN 1 END) * 100.0 / COUNT(*) AS avg_accuracy,
        AVG(stake) AS avg_stake,
        SUM(stake) AS volume
    FROM pdr_predictions
    GROUP BY contract, pair, source, timeframe
),
aggregated_subscriptions AS (
    SELECT
        pair,
        source,
        timeframe,
        COUNT(*) AS sales,
        SUM(last_price_value) AS sales_revenue
    FROM pdr_subscriptions
    GROUP BY pair, source, timeframe
)
SELECT 
    ap.contract AS addr,
    SPLIT_PART(ap.pair, '/', 1) AS base_token,
    SPLIT_PART(ap.pair, '/', 2) AS quote_token,
    ap.source,
    ap.timeframe,
    ap.avg_accuracy,
    ap.avg_stake,
    ap.volume,
    3.0 AS price,  -- Assuming price is static in your case
    asub.sales,
    asub.sales_revenue
FROM aggregated_predictions ap
LEFT JOIN aggregated_subscriptions asub
    ON ap.pair = asub.pair
    AND ap.source = asub.source
    AND ap.timeframe = asub.timeframe
ORDER BY ap.volume DESC;
