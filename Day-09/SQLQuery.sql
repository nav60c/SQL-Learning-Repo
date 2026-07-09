select *
from sales.Customers

select 
	CustomerID,
	Score,
	avg(Score) over() AvgScore,
	avg(coalesce(score,0)) over() AvgScore2
from sales.Customers


-- Sort the customers from lower to hightest score with NULLS appearing last --
select
	CustomerID,
	Score
from sales.Customers

select
	CustomerID,
	Score
from sales.Customers
order by Score asc -- Nulls is on top --

select
	CustomerID,
	Score,
	coalesce(Score,99999999) M1,
	case when Score IS NULL THEN 1 ELSE 0 END flag_M2
from sales.Customers
order by coalesce(Score,99999999)


select
	CustomerID,
	Score
from sales.Customers
order by CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score


-- Find the sales price for each order by dividing sales by quantity --
select
	OrderID,
	Sales,
	Quantity
from sales.Orders

select
	OrderID,
	Sales,
	Quantity,
	Sales/Quantity  --Error--
from sales.Orders

select
	OrderID,
	Sales,
	Quantity,
	Sales/NULLIF(Quantity,0) as price 
from sales.Orders


-- Identify the cusotmers who have no score --
select * 
from sales.Customers
where Score is null

-- Show the list of all details for customers who have not placed any orders --
select 
	c.*,
	o.OrderID
from sales.Customers c
left join sales.Orders o
on c.CustomerID=o.CustomerID

select 
	c.*,
	o.OrderID
from sales.Customers c
left join sales.Orders o
on c.CustomerID=o.CustomerID
where o.CustomerID is null

