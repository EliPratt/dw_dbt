{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    c.cust_key,
    d.date_key,
    e.Employee_Key,
    p.Product_Key,
    s.Store_Key,
    ol.quantity,
    ol.unit_price,
    (ol.unit_price * ol.quantity) AS dollars_sold
FROM {{ source('eli_core5', 'orderline') }} ol
INNER JOIN {{ source('eli_core5', 'orders') }} o ON o.order_id = ol.order_id
INNER JOIN {{ ref('oliver_dim_customer') }} c ON c.customer_id = o.customer_id
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.date_day = o.order_date
INNER JOIN {{ ref('oliver_dim_employee') }} e ON e.employee_id = o.employee_id
INNER JOIN {{ ref('oliver_dim_product') }} p ON p.product_id = ol.product_id
INNER JOIN {{ ref('oliver_dim_store') }} s ON s.store_id = o.store_id
