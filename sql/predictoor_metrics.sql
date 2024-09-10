SELECT
    "user",
    SUM(payout - stake) AS net_profit,
    SUM(CASE WHEN payout > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS avg_accuracy,
    SUM(stake) AS total_stake
FROM pdr_payouts
GROUP BY "user"
ORDER BY net_profit DESC;
