# Write your MySQL query statement below

# Method 1
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


# Method 2
with base as
(select user_id, activity_type, round(sum(activity_duration) / count(user_id), 2) as temp
from useractivity
where user_id IN 
(SELECT distinct user_id
from useractivity
where activity_type = 'paid')
group by user_id, activity_type)

select user_id,
       sum(case when activity_type = 'free_trial' then temp
       else 0
       end) as trial_avg_duration,

       sum(case when activity_type = 'paid' then temp
       else 0
       end) as paid_avg_duration
from base
group by user_id
order by user_id;