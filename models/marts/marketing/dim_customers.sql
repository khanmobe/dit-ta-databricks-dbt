with customers as (

     select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as ( 

    select * from {{ ref('stg_jaffle_shop__orders') }}

),
payments as ( 

    select * from {{ ref('fct_orders') }}

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(o.order_id) as number_of_orders,
        sum(amount) as life_time_value

    from orders as o
    left join payments as p using (customer_id)

    group by 1

),

final as (

    select
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce (co.number_of_orders, 0) 
        as number_of_orders,
        co.life_time_value

    from customers as c

    left join customer_orders as co using (customer_id)


)

select * from final