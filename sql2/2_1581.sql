# Write your MySQL query statement below
with cte as
(select * from transactions t
where amount is not null)

select customer_id, count(customer_id) as count_no_trans
from visits
where visit_id not in (select visit_id from cte)
group by customer_id;