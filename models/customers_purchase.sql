select
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from raw.jaffle_shop.customer c
left join raw.jaffle_shop.ordered o on c.c_custkey = o.o_custkey {{ group_by(3) }}
