# Write your MySQL query statement below
-- Method 1
update salary
set sex = case
            when sex = 'm' then 'f'
            when sex = 'f' then 'm'
        end;

-- Method 2
update salary
set sex =
    case 
    when sex = 'm' then 'f'
    else 'm'
    end;