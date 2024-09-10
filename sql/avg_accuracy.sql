SELECT 
    SUM(CASE WHEN payout > 0 THEN 1 ELSE 0 END) / COUNT(*) AS avg_accuracy
FROM pdr_payouts;
