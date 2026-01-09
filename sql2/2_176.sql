# SQL Solution Updated
-- Method 1
SELECT COALESCE(
    (SELECT MAX(salary) FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee)),
    NULL
) AS SecondHighestSalary;

-- Method 2
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);