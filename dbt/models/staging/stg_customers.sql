{{ config(materialized="view") }}

with customers as (select * from {{ source("staging", "customers") }})
-- exclude some columns that are not very helpful
select customer_id, city, country, gender, date_of_birth, job_title
from customers

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- {% if var("is_test_run", default=true) %} limit 100 {% endif %}
