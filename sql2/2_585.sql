-- # Write your MySQL query statement below

-- Method 1
with duplicate_2015 as
(select count(tiv_2015), tiv_2015
from insurance
group by tiv_2015
having count(tiv_2015) > 1),

with candidate as
    (select *
    from insurance
    where tiv_2015 IN
        (select count(tiv_2015), tiv_2015
        from insurance
        group by tiv_2015
        having count(tiv_2015) > 1)),

duplicate as
    (select pid, lat, lon
    from insurance
    group by lat, lon
    having count(pid) = 1),

dif_city as
    (select *
    from insurance
    where (lat, lon) IN (select lat, lon from duplicate))
where (lat, lon) 
IN 
(select lat, lon
from insurance
group by lat, lon
having count(pid) = 1))

select round(sum(dif_city.tiv_2016), 2) as tiv_2016
from dif_city
join candidate
on dif_city.pid = candidate.pid;

-- duplicate as
-- (select pid, lat, lon
-- from insurance
-- group by lat, lon
-- having count(pid) = 1),
# Because we group by, only choose count(*) = 1 if possible,
# because this won't lose primary key, that's the reason at
# line 16 we added 'pid'.
# a table with primary key is a sql table;
# a table without a primary key is just data.


-- dif_city as
-- (select *
-- from insurance
-- where (lat, lon) IN (select lat, lon from duplicate))
-- where (lat, lon) 
-- IN 
-- (select lat, lon
-- from insurance
-- group by lat, lon
-- having count(pid) = 1))



-- Method 2 (KEY)
with cnt as
    (select
            tiv_2015,
            count(*)
    from insurance
    group by tiv_2015
    having count(*) > 1),


uni as
    (select lat, lon
    from insurance
    group by lat, lon
    having count(*) = 1)

select round(sum(tiv_2016), 2) as tiv_2016
from insurance
where tiv_2015 IN (select tiv_2015 from cnt)
AND (lat, lon) IN (select lat, lon from uni);


Method 3
with cte as
(select pid, TIV_2015, TIV_2016, count(concat(lat, lon)) over (partition by concat(lat, lon))as cnt1, 
count(TIV_2015) over(partition by tiv_2015) as cnt
from insurance)

select round(sum(TIV_2016), 2) as TIV_2016 
from cte 
where cnt1=1 and cnt!=1;



# NOTES!!!
# SQL number 1: Primary key is EVERYTHING!
# ONLY the Primary key is Unique! (when you do join the tables,
# you MUST use the primary key!)
# when you group by, 

---
| lat  | lon  | count(*) |
| ---- | ---- | -------- |
| 12.4 | 7.7  | 8        |
| 72.5 | 45.3 | 2        |
| 12.5 | 7.8  | 2        |
| 52.7 | 32.9 | 2        |
| 72.8 | 45.5 | 2        |
| 12.8 | 8    | 2        |
| 32.9 | 20.5 | 2        |
| 32.8 | 0.01 | 2        |

| 29  | 625.05   | 300.16   | 32.8 | 20.5 |
---