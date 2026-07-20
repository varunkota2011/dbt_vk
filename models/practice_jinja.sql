{#
{% for i in range(10) %}

select {{ i }} as  number {% if not loop.last %}  union all {% endif %}

{% endfor %}
========================================================================================
{%  set my_string ='Hello World!'  %}
{{ my_string }}
========================================================================================
{% set my_string = 'wow world!' %}
{% set my_2_string = 'dbt project!' %}
{% set my_3_number = 100 %}

{{ my_string }} {{ my_2_string }} success {{ my_3_number }} percentage
========================================================================================
{% set my_friends =['a', 'b', 'c','d'] %}
{{ my_friends[0] }}
{{ my_friends[1] }}
{{ my_friends[2] }}
{{ my_friends[3] }}
========================================================================================
{% set my_friends =['a', 'b', 'c','d'] %}
{{ my_friends[0] }}
{{ my_friends[1] }}
{{ my_friends[2] }}
{{ my_friends[3] }}
========================================================================================
{% set my_friends = ["a", "b", "c", "d"] %}
{% for friend in my_friends %} 
my favourite friend is {{ friend }} {% endfor %}
========================================================================================
{% set temperature = 45 %}
{% if temperature < 65 %}
time for a cofee!
{% else %}
time for Fruit Juice!
{% endif %}
========================================================================================
#}

{#
========================================================================================
with
    payments as (select * from {{ ref("stg_payments") }}),

    final as (
        select
            order_id,

            sum(
                case when payment_method = 'bank_transfer' then amount else 0 end
            ) as bank_transfer_amount,
            sum(
                case when payment_method = 'credit_card' then amount else 0 end
            ) as credit_card_amount,
            sum(
                case when payment_method = 'coupon' then amount else 0 end
            ) as coupon_amount,
            sum(
                case when payment_method = 'gift_card' then amount else 0 end
            ) as gift_card_amount

        from payments

        group by 1
    )

select * from final
========================================================================================
#}

with payments as (
   select * from {{ ref('stg_payments') }}
),
 
final as (
   select
       order_id,
       {%- set payment_methods = ['bank_transfer','credit_card','coupon','gift_card'] -%}

       {% for payment_method in payment_methods %}
 
       sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) 
            as {{ payment_method }}_amount,
          
       {% endfor %}
   from payments
   group by 1
   order by 1
)
 
select * from final


