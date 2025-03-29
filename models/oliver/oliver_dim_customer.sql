{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
Customer_ID as Cust_Key,
Customer_ID,
First_Name,
Last_Name,
Email,
Phone_Number,
State
FROM {{ source('eli_core5', 'customer') }}