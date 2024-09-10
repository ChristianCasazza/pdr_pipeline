SELECT
    "user" AS full_addr,
    -- Total stake
    SUM(stake) AS total_stake,
    -- Gross income: sum of positive differences between payout and stake
    SUM(CASE WHEN payout > 0 THEN payout - stake ELSE 0 END) AS gross_income,
    -- Stake loss: sum of stakes where payout was zero
    SUM(CASE WHEN payout = 0 THEN stake ELSE 0 END) AS stake_loss,
    -- Total profit: sum of all payouts minus stake (gross income minus stake loss)
    SUM(payout - stake) AS total_profit,
    -- Net income (same as total profit since tx costs are ignored)
    SUM(payout - stake) AS net_income,
    -- APR (Annual Percentage Rate): total profit divided by total stake, multiplied by 100 for percentage
    SUM(payout - stake) / SUM(stake) AS apr,
    -- Average accuracy: percentage of correct predictions
    SUM(CASE WHEN payout > 0 THEN 1 ELSE 0 END) / COUNT(*) AS avg_accuracy,
    -- Count the number of distinct feeds (contracts) the user participated in
    COUNT(DISTINCT SPLIT_PART(ID, '-', 1)) AS feed_count,
    -- Total number of stakes
    COUNT(ID) AS stake_count
FROM
    pdr_payouts
GROUP BY
    "user";
