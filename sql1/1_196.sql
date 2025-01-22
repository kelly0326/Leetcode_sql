# Write your MySQL query statement below (196)
WITH CTE AS (
    SELECT MIN(id) AS min_id
    FROM Person
    GROUP BY email
)
DELETE FROM Person
WHERE id NOT IN (SELECT min_id FROM CTE);