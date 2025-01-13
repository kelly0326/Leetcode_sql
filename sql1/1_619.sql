# Write your MySQL query statement below

# method 1
with num_cte as (
    select num, count(*) as num_count
    from mynumbers
    group by num
)
select max(num) as num 
from num_cte
where num_count = 1;


# method 2
with count_cte as (
select num, count(num)
from mynumbers
group by num
having count(*) = 1
)
select max(num) as num from count_cte;