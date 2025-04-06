# Write your MySQL query statement below
with base as
(select *
from UserActivity
where user_id IN
(select user_id
from useractivity
where activity_type = 'paid'
group by user_id, activity_type)),

base1 as
(select user_id,
    round(sum(case when activity_type = 'free_trial' then activity_duration else 0 end) / count(user_id), 2) as trial_avg_duration,
    round(sum(case when activity_type = 'paid' then activity_duration else 0 end) / count(user_id), 2) as paid_avg_duration 
from base
group by user_id, activity_type)

select user_id, 
	   sum(trial_avg_duration) as trial_avg_duration, sum(paid_avg_duration) as paid_avg_duration
from base1
group by user_id
order by user_id;