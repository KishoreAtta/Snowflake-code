With customers as(
   select customerid,
    firstname,
    lastname
    from {{ref('ephmrl')}}
),
orders as(
   select orderid,
    user_id as customerid,
    order_date
    from {{ref('orders')}}

),
Employees as(
    select employee_id as employeeid,email,customer_id as customerid from {{ref('emp_seed')}}
),
customer_orders as(
    select customerid,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(orderid) as number_of_orders
    from orders 
    group by 1
),
final as(
    select
    customers.customerid as customerid,
    customers.firstname as firstname,
    customers.lastname as lastname,
    Employees.employeeid as Employee,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders,0) as number_of_orders
    from customers
    left join customer_orders using (customerid)
    left join Employees using (customerid)
)

select * from final