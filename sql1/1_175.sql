# Write your MySQL query statement below
select firstName, LastName, city, state
from person
left join address
on person.personId = address.personId;