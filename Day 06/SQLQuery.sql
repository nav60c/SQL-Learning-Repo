-- Remove dashes (-) from phone number --
select
	'123-456-7890',
	replace('123-456-7890','-','') as clean_phone

select 
	'report.txt' as old_filename,
	replace('report.txt','.txt','.csv') as new_filename

-- Calculate the length of each customers first name --
select 
	FirstName,
	len(FirstName) as Len_name
from sales.Customers

-- REtireve the 1st two characters and last 3 characters of each first name --
select 
	FirstName,
	left(trim(FirstName),2) as first_2_char,
	Right(trim(FirstName),3) as last_3_char
from sales.Customers  

-- Retrieve the list of customers first name after removing the first character --
select
	FirstName,
	substring(trim(FirstName),2,len(trim(FirstName))) as first_char_removed
from sales.Customers


--ROUND--
select
	3.5167,
	round(3.5167,2) as round_2,
	round(3.5167,1) as round_1,
	round(3.5167,0) as round_0,
	round(3.5167,-1) as round_negative

select
	7.5167,
	round(7.5167,2) as round_2,
	round(7.5167,1) as round_1,
	round(7.5167,0) as round_0
	-- round(7.5167,-1) as round_negative -- THIS GIVES ERORR-- --
	

--  ABS --
select 
-19,
ABS(-19),
ABS(19)


-- Date & Time --
select 
	OrderDate,
	ShipAddress,
	CreationTime
from sales.Orders


select 
	OrderID,
	CreationTime
from sales.Orders

select 
	OrderID,
	CreationTime,
	'2026-07-06' as HardCoded,
	getdate() TOday
from sales.Orders


-- date, month, year --
select 
	OrderID,
	CreationTime,
	year(CreationTime) Year,
	month(CreationTime) Month,
	day(CreationTime) Day
from sales.Orders


-- DATEPART() --
 select 
	OrderID,
	CreationTime,
	datepart(year,CreationTime) Year_dp,
	datepart(month,CreationTime) Month_dp,
	datepart(day,CreationTime) Day_dp,
	datepart(HOUR,CreationTime) Hour_dp,
	datepart(QUARTER,CreationTime) Quarter_dp,
	datepart(WEEKDAY,CreationTime) WeekDay_dp
from sales.Orders



-- DATENAME() --
 select 
	OrderID,
	CreationTime,
	datepart(year,CreationTime) Year_dp,
	datepart(month,CreationTime) Month_dp,
	datepart(day,CreationTime) Day_dp,
	datepart(HOUR,CreationTime) Hour_dp,

	datename(mm,CreationTime) Month,
	datename(YY,CreationTime) Year,
	datename(D,CreationTime) Day,
	datename(HH,CreationTime) Hour,
	datename(MI,CreationTime) Min
from sales.Orders


--DATETRUNC() --
 select 
	OrderID,
	CreationTime,
	datetrunc (mi,CreationTime) Min_dt,
	datetrunc (HH,CreationTime) hr_dt,
	datetrunc (DAY,CreationTime) Year_dt,
	datetrunc (mm,CreationTime) Month_dt
from sales.Orders


select
	datetrunc(mm,CreationTime) Creation,
	count(*)
from sales.Orders
group by datetrunc(mm,CreationTime)


-- EMONTH() --
select
	OrderID,
	CreationTime,
	eomonth(CreationTime) EndofMonth
from sales.Orders

select
	OrderID,
	CreationTime,
	eomonth(CreationTime) EndofMonth,
	cast(datetrunc(mm,CreationTime)as date)  StartofMonth
from sales.Orders


-- How many orders were placed each year --

select*
from sales.Orders

select
	year(OrderDate),
	count(*) No_Of_Orders
from sales.Orders
group by year(OrderDate)

-- How many orders were placed each month --
select
	Datename(mm,OrderDate) as Month,
	count(*) No_Of_Orders
from sales.Orders
group by Datename(mm,OrderDate)
