# Write your MySQL query statement below
-- Method 1
select name
from customer
where id not in

(select id
from customer
where referee_id = 2);

-- Method 2
select name
from customer
where referee_id != 2 or referee_id is null;
