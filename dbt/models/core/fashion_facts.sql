{{ config(materialized="table") }}

with
    customers as (select * from {{ ref("stg_customers") }}),
    discounts as (select * from {{ ref("stg_discounts") }}),
    employees as (select * from {{ ref("stg_employees") }}),
    products as (select * from {{ ref("stg_products") }}),
    stores as (select * from {{ ref("stg_stores") }}),
    transactions as (select * from {{ ref("stg_transactions") }})

select
    t.date as transaction_date,
    extract(year from t.date) as transaction_year,
    extract(month from t.date) as transaction_month,
    t.transaction_type,
    t.payment_method,
    t.invoice_id,
    -- we ignore invoice total because it repeats across all line items within the
    -- same invoice ID
    t.line,
    t.customer_id,
    c.city as customer_city,
    c.country as customer_country,
    c.gender,
    date_diff(
        cast(t.date as date), cast(c.date_of_birth as date), year
    ) as customer_age,
    t.store_id,
    s.city as store_city,
    s.country as store_country,
    s.number_of_employees,
    t.employee_id,
    e.position as employee_position,
    t.product_id,
    p.description_en as description,
    p.category,
    p.sub_category,
    t.sizes,
    t.color,
    p.production_cost,
    t.unit_price as unit_price_before_discount,
    t.quantity,
    t.discount,
    t.line_total,
    t.currency,
    t.sku
from transactions as t
left join customers as c on t.customer_id = c.customer_id
left join stores as s on t.store_id = s.store_id
left join employees as e on t.employee_id = e.employee_id
left join products as p on t.product_id = p.product_id
