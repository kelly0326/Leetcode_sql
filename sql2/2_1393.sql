# Write your MySQL query statement below (sell - buy)

# Sql solution
select stock_name, # operation, sum(price),
sum(case when operation = 'buy' then price * (-1)
     else price
end) as capital_gain_loss
from stocks
group by stock_name;

# Pandas solution
