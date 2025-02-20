# Write your MySQL query statement below
with store1 as
(select product_id, 'store1' as store, store1 as price
from products
where store1 is not null),

store2 as
(select product_id, 'store2' as store, store2 as price
from products
where store2 is not null),

store3 as
(select product_id, 'store3' as store, store3 as price
from products
where store3 is not null)

select * from store1
union
select * from store2
union
select * from store3;
