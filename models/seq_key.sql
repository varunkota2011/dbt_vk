select 
{{ dbt_utils.generate_surrogate_key(['user_id','order_date']) }} as SK_ID,
user_id, 
order_date, 
count(*) as order_count
from raw.jaffle_shop.orders 
group by 1, 2 ,3