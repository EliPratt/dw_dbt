{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT
    employeeid AS employee_key,
    employeeid,
    employeefname,
    employeelname,
    employeebday
FROM {{ source('finalproject_orders', 'EMPLOYEE') }}