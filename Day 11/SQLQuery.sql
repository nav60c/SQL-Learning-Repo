--Retrieve customers details with abbrevaited country code --
select distinct country
from sales.Customers

select 
	CustomerID,
	FirstName,
	LastName,
	Country,
	CASE
		WHEN Country='Germany' THEN 'DE'
		WHEN Country='USA' THEN 'US'
		ELSE 'N/A'
	END CountryAbrr,

	CASE Country -- Special case --
		WHEN 'Germany' THEN 'DE'
		WHEN 'USA' THEN 'US'
		ELSE 'N/A'
	END CountryAbrr2
from sales.Customers


/*
Find the avg score of customers and treat nulls as 0.
Additionally provide details such as customerID and LastName
*/

select 
	CustomerID,
	LastName,
	Score,
	CASE
		WHEN Score is null then 0
		else Score
	END ScoreClean,
	AVG(CASE
		 WHEN Score is null then 0
		 else Score
	END ) over () AvgCustomerClean,
	avg(score) over() avgcustomer
from sales.Customers



-- Count how many times each customer has made an order with sales greater than 30 --
select 
	OrderID,
	CustomerID,
	Sales,
	case
		when sales>30 then 1
		else 0
	end salesFlag
from sales.Orders
order by CustomerID

select 
	CustomerID,
	sum(case
		when sales>30 then 1
		else 0
	end) TotalOrders   
from sales.Orders
group by CustomerID




