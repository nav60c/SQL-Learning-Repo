select *
from customers

 
--#GROUP BY--
-- Find the total score and total number of customers for each country --


select 
    country,
	sum(score) as total_score,
	count(id) as total_customers
from customers
group by country 



--#HAVING--
--Find the average score for each country considering only coustomers with a score not equal to 0 and return only those countires with an average score greater than 430 --


select
	country,
	avg(score) as avg_score
from customers
where score!=0 
group by country
having avg(score)>430


--#DISTINCT--
--Return unqiue list of all counties--


select distinct country
from customers 

--#TOP--
-- Retrive only 3 customers --
select top 3 *
from customers

-- Retrive the top 3 customers with the highest score --
select top 3*
from customers
order by score desc 

-- Retrive the lowest 2 customers with the score --
select top 2*
from customers
order by score asc 

-- Get the two most recent orders --
select top 2*
from orders
order by order_date desc 



