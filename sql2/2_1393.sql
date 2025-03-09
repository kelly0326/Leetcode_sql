# Write your MySQL query statement below (sell - buy)

# Sql solution
select stock_name, # operation, sum(price),
sum(case when operation = 'buy' then price * (-1)
     else price
end) as capital_gain_loss
from stocks
group by stock_name;

# Pandas solution
import pandas as pd

def capital_gainloss(stocks: pd.DataFrame) -> pd.DataFrame:
    temp = stocks[['stock_name', 'operation', 'price']]
    temp['operation'] = temp['operation'].map({"Buy": -1, "Sell": 1}) # same as sql case when
    temp['capital_gain_loss'] = temp['price']*temp['operation']
    temp2 = temp.groupby('stock_name').sum('capital_gain_loss')
    temp2 = temp2[['capital_gain_loss']]
    temp2 = temp2.reset_index()
    print(temp2)
    return temp2