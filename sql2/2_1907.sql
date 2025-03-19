# Write your MySQL query statement below
with data as
(select case 
            when income < 20000 then 'Low Salary'
            when income > 50000 then 'High Salary'
            else 'Average Salary'
            end as category,
        count(account_id) as accounts_count
from accounts
group by category),

frame as
(select 'Low Salary' as category
union
select 'Average Salary' as category
union
select 'High Salary' as category)

select frame.category, ifnull(accounts_count, 0) as accounts_count # isnull() --- for Python
from frame
left join data
on frame.category = data.category;