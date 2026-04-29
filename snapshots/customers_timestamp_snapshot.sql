{% snapshot customers_timestamp_snapshot %}
{{config(
    strategy='timestamp',
    unique_key='id',
    updated_at='insert_time',
    invalidate_hard_deletes= True
)}}

select * from {{source('datafeed_shared_schema','customers')}}

{% endsnapshot %}