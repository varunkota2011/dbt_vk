{{ config(materialized='table', alias='MY_ALIAS_TABLE', 
    schema='my_schema'
    ) }}
with source_data as (
    select 1 as id
    union all
    select null as id
)
select *
from source_data