# Write your MySQL query statement below
with first as
(select s.product_id, min(year) as first_year
from sales s
left join product p
on s.product_id = p.product_id
group by s.product_id)

select s.product_id, year as first_year, s.quantity, price
from sales s
join first
on s.product_id  = first.product_id and year = first.first_year;