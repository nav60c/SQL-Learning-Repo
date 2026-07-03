-- Retrieve alll customers from germnay --
select * 
from customers
where country='Germany'


-- Retrieve all customers who are not from Germany --
select *
from customers
where country!='Germany'

select *
from customers
where country<>'Germany'


-- Retrieve all customers with a score greater than 500 --
select *
from customers
where score>500


-- Retrieve all customers with score of 500 or more --
select *
from customers
where score>=500


-- Retrieve all customers with score less than 500 --
select *
from customers
where score<500


-- Retrieve all customers with score 500 or less --
select *
from customers
where score<=500
            

-- Retrieve all cusotmers who are from the usa and have a score greater than 500 --
select * 
from customers
where country='USA' and score>500


-- Retrieve all cusotmers who are either from the usa or have a score greater than 500 --
select *
from customers
where country='USA' or score>500


-- Retrieve all cusotmers with a score not less than 500 --
select *
from customers
where score >=500

select *
from customers
where not score<500


-- Retrieve all cusotmers whose score falls in the range between 100 and 500 --
select *
from customers
where score between 100 and 500

select *
from customers
where score>=100 and score<=500


-- Retrieve all cusotmers from either Germany or USA--
select *
from customers
where country = 'Germany' or country='USA'

select *
from customers
where country in ('Germany' ,'USA') 


-- Find all cusotmers whose frist name start with M --
select *
from customers
where first_name like 'M%'

-- Find all cusotmers whose frist name end with n --
select *
from customers
where first_name like '%n'

-- Find all cusotmers whose first name contains r --
select *
from customers
where first_name like '%r%'


-- Find all cusotmers whose first name has r in the 3rd postion --
select *
from customers
where first_name like '__r%'

