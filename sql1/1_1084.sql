select product_id, product_name
from product
where product_id NOT IN
(select product_id
from sales
where sale_date NOT between '2019-01-01' and '2019-03-31')

AND product_id IN
(select product_id
from sales
where sale_date between '2019-01-01' and '2019-03-31');