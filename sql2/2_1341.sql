# Write your MySQL query statement below
with best_user as
(select m.user_id, name, count(created_at) as temp
from movierating m
join users u
on m.user_id = u.user_id
group by user_id
order by temp desc, name
limit 1),

best_movie as
(select title, sum(rating) / count(rating) as temp
from movies m
join movierating mr
on m.movie_id = mr.movie_id
where year(created_at) = '2020' and month(created_at) = 2
group by m.movie_id
order by temp desc, title
limit 1)

select name as results from best_user
union all
select title from best_movie;