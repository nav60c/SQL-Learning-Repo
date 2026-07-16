/* 
Generate a report showing the toatal sales for each category:
- High: If sales higher than 50.
- Medium: If sales b/w 20 & 50.
- Low: If sales equal or lower than 20.
Sort the result from lowest to highest      
*/
select 
	OrderID,
	Sales
from sales.Orders

select 
	OrderID,
	Sales,
	CASE
		WHEN Sales>50 THEN 'High'
		WHEN Sales>20 THEN 'Meduim'
		Else 'Low'
	END Category
from sales.Orders

----

select 
	category,
	sum(Sales) as TotalSales
from (
		select 
	      OrderID,
	      Sales,
	      CASE
		    WHEN Sales>50 THEN 'High'
		    WHEN Sales>20 THEN 'Meduim'
		    Else 'Low'
	      END Category
       from sales.Orders
)t
group by Category


-- Return employees details with gender display as full text -- 
select 
	EmployeeID,
	FirstName,
	LastName,
	Gender,
	CASE
		WHEN Gender='M' THEN 'Male'
		WHEN Gender='F'THEN 'Female'
		ELSE 'N/A'
	END GenderFullText
from sales.Employees


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
	END CountryAbrr
from sales.Customers