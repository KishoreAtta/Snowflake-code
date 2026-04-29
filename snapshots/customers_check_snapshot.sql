{% snapshot customers_check_snapshot %}
{{config(
    strategy='check',
    unique_key='id',
    check_cols =['company','location'],
    invalidate_hard_deletes= True
)}}

select * from {{source('datafeed_shared_schema','customers')}}

{% endsnapshot %}