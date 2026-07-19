select
    c_custkey, c_mktsegment, {{ rename_segments("c_mktsegment") }} mkt_segment_adjusted
from raw.jaffle_shop.customer
