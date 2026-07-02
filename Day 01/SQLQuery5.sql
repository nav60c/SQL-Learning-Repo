-- Retrieve customers from germany  --
select *
from customers

select 
	first_name,
	country
from customers
where country='Germany'