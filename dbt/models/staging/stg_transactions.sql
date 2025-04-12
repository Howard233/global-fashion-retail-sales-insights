{{ config(materialized="view") }}

with transactions as (select * from {{ source("staging", "transactions") }})
-- exclude some columns that are not very helpful
select
    invoice_id,
    line,
    customer_id,
    product_id,
    sizes,
    color,
    unit_rice as unit_price,
    quantity,
    date,
    discount,
    line_total,
    store_id,
    employee_id,
    currency,
    sku,
    transaction_type,
    payment_method,
    invoice_total
from transactions

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var("is_test_run", default=true) %} limit 100 {% endif %}
