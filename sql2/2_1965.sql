# Write your MySQL query statement below
with salary as
(select employee_id
from employees
where employee_id NOT IN
(select employee_id from salaries)),

name as
(select employee_id 
from salaries
where employee_id NOT IN (select employee_id from employees))

select * from name
union
select * from salary
order by employee_id;

# The ORDER BY employee_id clause applies to the final result of the entire query, not to any specific subquery or #individual part of the union. In SQL, when you use UNION or UNION ALL, the ORDER BY clause must be placed at the end of #the query to sort the combined result set. It cannot be included in the middle of a UNION query or within individual #subqueries.