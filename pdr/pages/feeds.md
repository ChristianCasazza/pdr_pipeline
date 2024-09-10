```sql unique_items
select 
    base_token
from feeds
group by 1
```

```sql feeds_full
select * 
from feeds
```

<DataTable data={feeds_full} />

<Dropdown
    name=selected_item
    data={unique_items}
    value=base_token
/>

```sql feeds
select * 
from feeds
where base_token = '${inputs.selected_item.value}'
```

<DataTable data={feeds} />
