# Write your MySQL query statement below

# Method 1: self join
select e1.employee_id, e1.name, count(e2.employee_id) as reports_count, round(avg(e2.age)) as average_age
from employees e1
join employees e2
on e1.employee_id = e2.reports_to
group by e1.employee_id
order by e1.employee_id;


# Method 2: with()
with report as 
(select reports_to,count(reports_to) as reports_count, round(avg(age)) as average_age
from employees
group by reports_to)

select employee_id, name, reports_count, average_age
from employees
join report
on employees.employee_id = report.reports_to
order by employee_id;