{{ config(materialized="view") }}

with employees as (select * from {{ source("staging", "employees") }})
-- exclude some columns that are not very helpful
select employee_id, store_id, position
from employees

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- {% if var("is_test_run", default=true) %} limit 100 {% endif %}
