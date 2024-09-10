
---
title: Predictoors Overview
description: Summary of key metrics for users who have made predictions on the platform.
---

# Predictoors Overview

## Key Metrics

```total_predictoors_query
SELECT * FROM total_predictoors;
```

```avg_accuracy_query
SELECT * FROM avg_accuracy;
```

```gross_income_query
SELECT * FROM gross_income;
```

```total_stake_query
SELECT * FROM total_stake;
```

<BigValue 
  data={total_predictoors_query} 
  value=num_predictoors
  title="Total Predictoors"
/>

<BigValue 
  data={avg_accuracy_query} 
  value=avg_accuracy
  fmt=pct1
  title="Average Accuracy"
/>

<BigValue 
  data={total_stake_query} 
  value=total_stake
  fmt=usd0
  title="Total Stake"
/>

<BigValue 
  data={gross_income_query} 
  value=gross_income
  fmt=usd0
  title="Gross Income"
/>
