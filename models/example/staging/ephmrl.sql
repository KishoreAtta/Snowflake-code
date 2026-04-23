{{config(materialized='ephemeral')}}
with tb1 as (
    select id as customerid,
    firstname,
    lastname
     from {{source('datafeed_shared_schema','raw_customers')}}
)

select * from tb1