select
    id as customer_id,
    first_name,
    last_name

from {{source('jaffle_shop','jaffle_shop_customers')}}
--bronze.dbt_demo.jaffle_shop_customers