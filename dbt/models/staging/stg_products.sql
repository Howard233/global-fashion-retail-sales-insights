{{ config(materialized="view") }}

with products as (select * from {{ source("staging", "products") }})
-- exclude some columns that are not very helpful
select product_id, category, sub_category, description_en, color, sizes, production_cost
from products

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- {% if var("is_test_run", default=true) %} limit 100 {% endif %}
