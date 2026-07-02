-- #INSERT --
insert into customers (id, first_name, country, score)
values
	(6,'Anna','USA',NULL),
	(7,'Sam',NULL,100)


insert into customers (id, first_name)
values
	(8,'Sara')

select * from customers


/* 
create table persons(
	id int not null,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(15) not null
	constraint pk_persons primary key(id)
)
*/


-- insert data from customers table into person --
insert into persons (id, person_name, birth_date, phone)
select
	id,
	first_name,
	null,
	'Unknow'
from customers

select * from persons


-- #UPDATE --
-- Change the score ofcustomer with id 6 to 0 --
select * from customers

update customers
set score =0
where id=6

/*
select * from customers
where id =6 */


-- Change the score of customer with id 8 to 0 and update the country to UK --
update customers
set score = 0, 
	country='UK'
where id=8

/*
insert into customers (id,first_name,country,score)
values 
	(9,'Andreas','Germany',null),
	(10,'Shara','UK',0) */



-- Update the customers with null score by setting their score to 0 --
update customers
set score=0
where score is null

select * from customers
where score is null