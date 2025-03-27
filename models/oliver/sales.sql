
  {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


SELECT
c.first_name as customer_first_name,
c.last_name as customer_last_name,
d.date_day,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
fs.dollars_sold
FROM {{ ref('fact_sales') }} fs

LEFT JOIN {{ ref('oliver_dim_date') }} d
    ON d.date_key = fs.date_key

LEFT JOIN {{ ref('oliver_dim_employee') }} e
    ON e.Employee_Key = fs.Employee_Key

LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON c.cust_key = fs.cust_key
