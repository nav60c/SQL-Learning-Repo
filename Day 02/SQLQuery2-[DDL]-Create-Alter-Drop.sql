-- #CREATE --
-- Create a new table called person with columns: id, person_name, birth_date, and phone --
create table person(
	id int not null,
	person_name varchar(50) not null,
	birth_date date,
	phone varchar(15) not null,
	constraint pk_person primary key (id)
)

-- #ALTER --
-- Add a new column called email to the person table --
Alter table person
	add email varchar(50) not null


-- Remove the column phone from the person table --
Alter table person
drop column phone


-- #DROP --
-- Delete the table persons from the database --
drop table person