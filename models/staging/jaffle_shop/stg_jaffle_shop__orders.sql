select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{source('jaffle_shop','jaffle_shop_orders')}}
--bronze.dbt_demo.jaffle_shop_orders