{{ config(materialized="view") }}

with stores as (select * from {{ source("staging", "stores") }})
-- exclude some columns that are not very helpful
select store_id, country, city, number_of_employees
from stores

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var("is_test_run", default=true) %} limit 100 {% endif %}
