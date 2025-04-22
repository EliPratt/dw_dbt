{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT
    customerid as customer_key,
    customerid,
    customerfname,
    customerlname,
    customerbday,
    customerphone
FROM {{ source('finalproject_orders', 'CUSTOMER') }}