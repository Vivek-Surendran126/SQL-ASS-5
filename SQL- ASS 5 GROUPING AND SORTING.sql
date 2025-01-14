create database populations;
use populations;

# Table creation
create table country ( ID int primary key, 
country_name varchar(100), population int , 
area varchar(100));

create table persons (ID INT primary key,
F_name varchar(100), L_name varchar(100), 
population int,  rating decimal(10,2),
Country_ID int, country_name varchar(100));

#Inserting values
insert into country (ID, country_name, population,
area) values (1, 'UK',1200000, 'Europe'),
(2,'Canada',800000,'North America'),
(3,'poland',1300000,'Europe'),
(4,'USA',1800000,'America'),
(5,'India',2500000,'asia'),
(6,'Australia',2000000,'Australia'),
(7,'china',4500000,'Asia'),
(8,'japan',700000,'Asia'),
(9,'france',900000,'Europe'),
(10,'germany',6500000,'Europe');

Insert into persons (ID, F_name, L_name, population,
rating, Country_ID, country_name) values
(1,'ram','kumar',1200000,4.7,1,'UK'),
(2,'raj','mohan',2500000,4.0,5,'India'),
(3,'meera','nandhan',2500000,4.0,5,'India'),
(4,'alexia','cox',2000000,4.2,6,'Australia'),
(5,'faye', 'bowen',800000,4.6,2,'canada'),
(6,'donna','brown',1800000,5.0,4,'USA'),
(7,'michelle','davies',1800000,5.0,4,'USA'),
(8,'sarah','thomas',6500000,4.8,10, 'germany'),
(9,'prasad','varkey',2500000,4.0,5,'India'),
(10,'jackey','rose',1200000,4.7,1,'UK');

select*from persons;

#1. Print first 3 charactors of country name
select left(country_name,3) as first_three_chars from country;

#2. Concatenating names
select concat(f_name,' ',L_name) as full_name from persons;

#3. Counting unique country names 
select count(distinct(country_name)) as no_countries from persons;

#4. Maximum population
select max(population) as max_population from country;

#5. Minimum population
select min(population) as min_population from persons;

#6. Inserting rows into persons table
insert into persons (ID, F_name, population,
rating, Country_ID, country_name) values (
11,'Deepak',2500000,4.0,5,'India'),
(12,'James',1200000,4.7,1,'UK');
select count(L_name) as nos_Lastname from persons;

#7. Number of rows
select count(ID) as Total_Rows from persons;

#8. Population for first 3 rows
select population from country limit 3;

#9. 3 Random rows
select*from country order by rand() limit 3;

#10. persons ordered by rating
select*from persons order by rating desc;

#11. Total population in each country
select country_name, sum(population) as total_population 
from country group by country_name;

#12. countries > 50000
select country_name from persons where population > 50000;

#13. countries with 2 or more persons
Select country_name, Count(ID) AS total_persons, AVG(rating) AS average_rating
from persons
group by country_name
having COUNT(ID) > 2
order by average_rating asc;

