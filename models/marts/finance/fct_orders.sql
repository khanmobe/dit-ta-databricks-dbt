Select order_id,
user_id as customer_id,
amount
from 
{{ ref('stg_stripe__payments') }}
--bronze.dbt_demo.stg_stripe__payments