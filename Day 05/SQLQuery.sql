select
	FirstName,
	LastName
from sales.Customers
UNION
select 
	FirstName,
	LastName
from sales.Employees


-- Rule:II --
select
	FirstName,
	LastName
	--CustomerID--
from sales.Customers
UNION
select 
	FirstName,
	LastName
from sales.Employees


-- Rule:III --
select
    CustomerID,
	-- FirstName,--
	LastName
from sales.Customers
UNION
select 
    EmployeeID,
	-- FirstName,--
	LastName
from sales.Employees

-- Rule:IV --
select
	LastName, --varchar--
    CustomerID
from sales.Customers
UNION
select 
    EmployeeID,--int--
	LastName
from sales.Employees

-- Rule:V --
select
    CustomerID as ID,--name of the result--
	LastName as L_name 
from sales.Customers
UNION
select 
    EmployeeID,
	LastName as l_Name -- X --
from sales.Employees



-- Rule:VI --
select
    FirstName,
	LastName
from sales.Customers
UNION
select 
    LastName,
	FirstName --wrong order --
from sales.Employees


-- Combine the data from employees and customers into one table --
select *
from sales.Customers
select *
from sales.Employees

select 
	FirstName,
	LastName
from sales.Customers 
union 
select 
	FirstName,
	LastName
from sales.Employees




-- Combine the data from employees and customers into one table, including duplicates --
select * from sales.Customers
select * from sales.Employees

select 
	FirstName,
	LastName
from sales.Customers 
union all
select 
	FirstName,
	LastName
from sales.Employees

-- Find the employees who are not cusotmers at the same time --
select * from sales.Customers
select * from sales.Employees

select 
	FirstName,
	LastName
from sales.Employees 
except
select 
	FirstName,	
	LastName
from sales.Customers

select 
	FirstName,
	LastName
from sales.Customers --wrong order, wrong output --
except 
select 
	FirstName,
	LastName
from sales.Employees


-- Find the employess, who are  also customers --
select 
	FirstName,
	LastName
from sales.Employees 
intersect
select 
	FirstName,
	LastName
from sales.Customers 

/* Orders are stored iin separate tables (order and OrderArchive) 
combine all into one report wihtout duplicates */

select * from sales.Orders
select * from sales.OrdersArchive

select 
'Orders' As SourceTable
	  ,[OrderID]
	  ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from sales.Orders
union
select
'OrdersArchive' As SourceTable
	  ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
from sales.OrdersArchive
order by OrderID



-- Concatenate the first name and country into one column --
select 
	first_name,
	country,
    concat (first_name,' ',country) as name_country
from customers


-- Convert the first name to lowercase --
select 
	first_name,
	country,
    concat (first_name,' ',country) as name_country,
	lower (first_name) as low_name
from customers


-- Convert the first name to uppercase --
select 
	first_name,
	country,
    concat (first_name,' ',country) as name_country,
	lower (first_name) as low_name,
	upper (first_name) as up_name
from customers

-- Find customers whose first name contains leading or trailing spaces --
select
	first_name
from customers
where first_name!=trim(first_name) -- M1 --

select
	first_name,
	len (first_name) len_name -- M2 --
from customers

select
	first_name,
	len (first_name) len_name,
	len(trim (first_name)) len_trim_name, -- M3 --
	len (first_name) - len(trim (first_name)) flag
from customers
