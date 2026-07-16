-- Show all orderd that were placed during the month of feb --
select * from sales.Orders

select  *
from sales.Orders
where MONTH(OrderDate)=2


-- Format --
select
	OrderID,
	CreationTime,
	format(CreationTime,'MM-dd-yyyy') USA_Format,
	format(CreationTime,'dd-MM-yyyy') Euro_Format,

	format(CreationTime,'dd') dd,
	format(CreationTime,'ddd') dd,
    format(CreationTime,'dddd') dd,

	format(CreationTime,'MM') MM,
	format(CreationTime,'MMM') MMM,
    format(CreationTime,'MMMM') MMMM,

	format(CreationTime,'yy') YY,
	format(CreationTime,'yyy') YYY,
    format(CreationTime,'yyyy') YYYY
from sales.Orders


/* Show creationTime using the following fomrat 
 Day Wed Jan Q1 2025 12:25:56 PM
*/
select 
	OrderDate,
	CreationTime,
	'Day ' + format(CreationTime,'ddd MMM') + 
	' Q'+Datename(quarter,CreationTime) +
	' ' + format(CreationTime,'yyyy hh:mm:ss tt')
	as CustomeFormat
from sales.Orders


-- Aggreation --
select 
	format(OrderDate,'MMM yy'),
	count(*)
from sales.Orders
group by format(OrderDate,'MMM yy')


-- Cast --
select
cast('123'as int) as [string to int],
cast(123 as varchar) as [int to string],
cast('07-07-2026' as date) as [string to date],
CreationTime,
cast(CreationTime as date) as [datetime to to]
from sales.Orders
 

--- Dateadd --
select
	OrderID,
	OrderDate,
	dateadd(year,2,OrderDate) as Two_Year_Later,
	dateadd(month,3,OrderDate) as Three_months_Later,
	dateadd(day,-10,OrderDate) as Ten_Days_before
from sales.Orders

 
-- Datediff --
-- Calculate the age of employesss --
select * from sales.Employees
select
	EmployeeID,
	FirstName,
	datediff(year,BirthDate,getdate()) as Age
from sales.Employees

-- Find the averge shipping duration in days for each month --
select
	month(OrderDate),
	avg(datediff(day,orderdate,shipdate)) as avg_shipping
from sales.Orders
group by month(OrderDate)


-- Find the number of days between each order and the previous order --
select
	OrderID,
	OrderDate current_order_date,
	lag(OrderDate) over (order by orderDate) previous_order_date,
	datediff(day,lag(OrderDate) over (order by orderDate),OrderDate) as NoOfdays
from sales.Orders



-- isdate --
select 
	isdate('123'),
	isdate('2026-07-07'),
	isdate('2026'),
	isdate('07')


select
	-- cast(OrderDate as date) OrderDate,
	OrderDate,
	isdate(OrderDate)
from
(
select '2026-07-07' as OrderDate union
select '2026-07-08' union
select '2026-07'
)t


select
	OrderDate,
	isdate(OrderDate),
	case when isdate(OrderDate)=1 then cast(OrderDate as date)
	end newOrderDate
from
(
select '2026-07-07' as OrderDate union
select '2026-07-08' union
select '2026-07'
)t
where isdate(OrderDate)=0

----

select
	OrderDate,
	isdate(OrderDate),
	case when isdate(OrderDate)=1 then cast(OrderDate as date)
		else '9999-09-09' ---- 
	end newOrderDate
from
(
select '2026-07-07' as OrderDate union
select '2026-07-08' union
select '2026-07'
)t





