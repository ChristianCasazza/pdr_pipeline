SELECT
    SUM(CASE WHEN payout > 0 THEN payout - stake ELSE 0 END) AS gross_income
FROM
    pdr_payouts 
