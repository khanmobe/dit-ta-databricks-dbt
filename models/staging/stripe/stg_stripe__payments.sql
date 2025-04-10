select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    user_id,
    created as created_at
from {{ source('stripe', 'stripe_payments') }}
--select * from bronze.dbt_demo.stripe_payments