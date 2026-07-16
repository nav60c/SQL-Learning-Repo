-- Find the avg score of the customer --
select
	CustomerID,
	score,
	avg(Score) over() AvgScore
from sales.Customers

select
	CustomerID,
	score,
	avg(Score) over() AvgScore,
	coalesce(score,0) score2,
	avg(coalesce(score,0)) over() AvgScore2 --replacing null with zero --
from sales.Customers 



/* Display the full name of customers in a single feild by 
merging their first and last name and add 10 bonus point to 
each customer's score */

select 
	CustomerID,
	FirstName,
	LastName,
	score,
	FirstName +' ' + LastName as full_name, --X--
	score+10 as Score_With_Bonus --X--
from sales.Customers 

select 
	CustomerID,
	FirstName,
	LastName,
	score,
	FirstName +' ' + coalesce(LastName,' ') as full_name,
	coalesce(score,0)+10 as Score_With_Bonus
from sales.Customers






































