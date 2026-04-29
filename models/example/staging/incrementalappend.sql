{{config(materialized="incremental", 
incremental_strategy="append", 
pre_hook="truncate table {{this}}"
)}}
select * from {{source('datafeed_shared_schema','orders')}}
