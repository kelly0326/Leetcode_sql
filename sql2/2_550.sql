# Write your MySQL query statement below
with first as (
select player_id, min(event_date) as login
from activity
group by player_id)

select round(count(activity.player_id) / (select count(distinct player_id) from activity), 2) as fraction
from first
right join activity
on first.player_id = activity.player_id
where datediff(event_date, login) = 1;