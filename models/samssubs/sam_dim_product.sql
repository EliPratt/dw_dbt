{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT
    productid AS product_key,
    productid,
    producttype,
    productname,
    productcalories
FROM {{ source('finalproject_orders', 'PRODUCT') }}