```sql unique_items
select 
    full_addr
from predictoors
group by 1
```

```sql predictoors_full
select * 
from predictoors
```

<DataTable data={predictoors_full} />

<Dropdown
    name=selected_item
    data={unique_items}
    value=full_addr
/>

```sql predictoors
select * 
from predictoors
where full_addr = '${inputs.selected_item.value}'
```

<DataTable data={predictoors} />

<BigValue 
  data={predictoors} 
  value=feed_count
  title="Total Feeds"
/>

<BigValue 
  data={predictoors} 
  value=avg_accuracy
  fmt=pct1
  title="Average Accuracy"
/>

<BigValue 
  data={predictoors} 
  value=apr
  fmt=pct1
  title="APR"
/>

<BigValue 
  data={predictoors} 
  value=total_stake
  title="Staked (OCEAN)"
/>

<BigValue 
  data={predictoors} 
  value=gross_income
  title="Gross Income(OCEAN)"
/>

<BigValue 
  data={predictoors} 
  value=stake_loss
  title="Stake Loss (OCEAN)"
/>

