# Write your MySQL query statement below
with duplicate_2015 as
(select count(tiv_2015), tiv_2015
from insurance
group by tiv_2015
having count(tiv_2015) > 1),

candidate as
(select *
from insurance
where tiv_2015 IN (select tiv_2015 from duplicate_2015)),


duplicate as
(select lat, lon
from insurance
group by lat, lon
having count(pid) > 1),


dif_city as
(select *
from insurance
-- where (lat, lon) NOT IN (select lat, lon from duplicate))
where (lat, lon) 
NOT IN 
(select lat, lon
from insurance
group by lat, lon
having count(pid) > 1))


select round(sum(dif_city.tiv_2016), 2) as tiv_2016
from dif_city
join candidate
on dif_city.pid = candidate.pid;