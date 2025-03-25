# Write your MySQL query statement below
with temp as
(select customer_id, min(order_date) as early_order_date, min(customer_pref_delivery_date) as pref_date
from delivery
group by customer_id),

temp1 as
(select customer_id,
       case when early_order_date = pref_date then 'immediate' else 'scheduled' end as immediate_percent
from temp)

select
       round(sum(case when immediate_percent = 'immediate' then 1 else 0 end) / count(distinct customer_id) * 100, 2) as immediate_percentage
from temp1;
