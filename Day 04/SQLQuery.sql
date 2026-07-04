-- Get all customers along with their orders, including those without ordes --
select * from customers
select * from orders

select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
left join orders as o
on c.id=o.customer_id



-- Get all customers along with their orders including orders without matching cusotmers --
select * from customers
select * from orders

select 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
from customers as c
right join orders as o
on c.id=o.customer_id


-- Get all customers along with their orders, including orders without matching customers (using left join only) --
select * from customers
select * from orders


select *
from orders 
left join customers
on id=customer_id

select *
from orders as o 
left join customers as c
on c.id=o.customer_id


-- Get al cusotmers and all orders, even if there's no match --
select * from customers
select * from orders

select *
from customers
full join orders
on id = customer_id

-- Get all customers who haven't placed any order --
select * from customers
select * from orders

select *
from customers
left join orders
on id = customer_id
where customer_id is null

select *
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is null

-- Get all orders without matching customers --
select * from customers
select * from orders

select *
from customers
right join orders
on id = customer_id
where id is null


select * 
from orders  as o
left join customers as c
on c.id = o.customer_id
where c.id is null 


-- Find customers without orders and orders without cusotmers --
select * from customers
select * from orders

select *
from customers
full join orders
on id = customer_id
where id is null or
	  customer_id is null



select *
from customers as c
full join orders as o
on c.id = o.customer_id
where c.id is null or
	  o.customer_id is null


-- Get all customers along with their orders, but only for customers who have placed an order ( withour uisng inner join) --
select * from customers
select * from orders

select *
from customers as c
inner join orders as o
on c.id = o.customer_id
 
select *
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id is not null


-- Genreate all possible combination of cusotmers and orders --

select *
from customers
cross join orders


/* Using salesDB, retrieve a list of all orders, along with the related cutomer, product, and employee details 

For each order display: 
 - OrderID
 - Customers name
 - Product name
 - Sales amount
 - Product price
 - Salespersons name

 */

-- use salesDB --

select *
from sales.orders

select 
	o.OrderID,
	o.Sales
from sales.orders as o


select *from sales.Customers
select *from sales.Employees
select *from sales.Orders
select *from sales.OrdersArchive
select *from sales.Products


select 
	o.OrderID,
	o.Sales,
	c.FirstName as CustomerFristName,
	c.LastName as CustomerLastName,
	p.Product as ProductName,
	p.Price ,
	e.FirstName as EmployeeFirstName,
	e.LastName as EmployeeLastName
from sales.orders as o
left join sales.Customers as c
on o.CustomerID = c.CustomerID
left join sales.Products as p
on o.ProductID = p.ProductID
left join sales.Employees as e
on o.SalesPersonID = e.EmployeeID 

