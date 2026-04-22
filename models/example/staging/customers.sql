WITH tb1 as(select company,location,id,firstname,lastname from {{source('datafeed_shared_schema','raw_customers')}})
select * from tb1