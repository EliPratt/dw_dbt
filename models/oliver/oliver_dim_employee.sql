{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
Employee_ID as Employee_Key,
Employee_ID,
First_Name,
Last_Name,
Hire_Date,
Phone_Number,
Position
FROM {{ source('eli_core5', 'employee') }}