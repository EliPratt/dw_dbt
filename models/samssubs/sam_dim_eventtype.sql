{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT
    eventname AS eventtype_key,
    eventname
FROM {{ source('finalproject_webtraffic', 'EVENTTYPE') }}