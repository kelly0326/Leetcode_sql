# Write your MySQL query statement below
-- Method 1
with cte as
(select employee_id, department_id
from employee
group by employee_id
having count(department_id) = 1

union

select employee_id, department_id
from employee
where primary_flag = 'Y')
select * from cte
order by employee_id;

-- Method 2
with cte as
(select employee_id, department_id
from employee
group by employee_id
having count(department_id) = 1),

cte1 as
(select employee_id, department_id
from employee
where primary_flag = 'Y')

select *
from cte
union
select *
from cte1;