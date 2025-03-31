# Write your MySQL query statement below
with table1 as
(select requester_id as id, count(accepter_id) as num
from requestaccepted
group by requester_id),

table2 as
(select accepter_id as id, count(requester_id) as num
from requestaccepted
group by accepter_id),

table3 as
(select *
from table1
UNION ALL 
select *
from table2)

select id, sum(num) as num
from table3
group by id
order by num desc
limit 1;

# table3
---
| id | num |
| -- | --- |
| 1  | 2   |
| 2  | 1   |
| 3  | 1   |
| 2  | 1   |
| 3  | 2   |
| 4  | 1   |
---