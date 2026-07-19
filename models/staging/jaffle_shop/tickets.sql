{{
    config(
        materialized='table'
    )
}}

select 1 as ticket_id, 'new' as ticket_status , '2025-01-01' as Updated_Date
union all 
select 2 as ticket_id, 'new' as ticket_status , '2025-01-02' as Updated_Date
union all 
select 3 as ticket_id, 'in-progress' as ticket_status , '2025-01-03' as Updated_Date
union all 
select 4 as ticket_id, 'in-progress' as ticket_status , '2025-01-04' as Updated_Date
union all 
select 5 as ticket_id, 'hold' as ticket_status , '2025-01-05' as Updated_Date