-- Retrieve all customers and sort the result by the country and then by highest score --
select *
from customers

select *
from customers
order by
	country asc,
	score desc


select *
from customers
order by
	score desc,
	country asc
