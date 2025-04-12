{{ config(materialized="view") }}

with discounts as (select * from {{ source("staging", "discounts") }})
-- exclude some columns that are not very helpful
select start_date, end_date, discount, category, sub_category
from discounts

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- {% if var("is_test_run", default=true) %} limit 100 {% endif %}
