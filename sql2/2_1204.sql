# Write your MySQL query statement below
with cte1 as
(select person_id, person_name, weight, turn
from queue
order by turn),

cte2 as
(select person_id, person_name, turn, sum(weight) over (order by turn) as total
from cte1)

select person_name
from cte2
where total <= 1000
order by total desc
limit 1;