-- Retrieve all data from customers and orders in two different results --
select *
from customers

select *
from orders

-- Get all cusotmers along with their orders, but only for customers who have placed an order --
select *
from customers
inner join orders 
on id=customer_id


select
	id,
	first_name,
	order_id,
	sales
from customers
inner join orders 
on id=customer_id


select
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
from customers
inner join orders 
on id=customer_id



select
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
inner join orders as o
on id=customer_id














































































































































































































































































































-- Retrieve all data from customers and orders in two different results --
