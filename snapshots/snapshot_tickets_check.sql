{% snapshot snapshot_tickets_check %}

    {{
        config(
            target_schema="dbt_snapshots_SCD_TYPE_2",
            strategy="check",
            unique_key="ticket_id",
            check_cols=["ticket_status"],
            invalidate_hard_deletes=True,
        )
    }}
    select *
    from {{ ref("tickets") }}

{% endsnapshot %}
