# Write your MySQL query statement below

-- solution 1
select name from employee
where id in
(select managerId
from employee
group by managerId
having count(managerId) >=5);


-- solution 2
with manager as
(select managerId, count(managerId)
from employee
group by managerId
having count(managerId) >=5)

select name
from employee
join manager
on employee.id = manager.managerId;
