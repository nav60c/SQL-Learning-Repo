-- Find the total score for each country --
select *
from customers

select
	country,
	sum(score) as total_score
from customers
group by country