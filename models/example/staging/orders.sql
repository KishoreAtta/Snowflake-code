with tb2 as (
    select id as orderid,
    user_id,
    order_date
     from {{source('datafeed_shared_schema','orders')}}
)

select * from tb2