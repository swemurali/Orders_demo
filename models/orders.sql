{{ config(
    materialized='table',
    
) }}
with source as (

    select *
    from DBT_CLOUD_HANI.RAW_HANI_SCHEMA.ORDERS

),

final as (

    select 
        customer_name,
        place,
        count(order_id) as total_orders,
        sum(amount) as total_amount
    from source
    group by customer_name, place

)

select * from final