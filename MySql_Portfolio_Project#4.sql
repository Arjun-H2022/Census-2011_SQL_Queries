-- SQL queries for indian census 2011 dataset, data source “Census 2011 ” from web
-- To display dataset_1 Query
SELECT * 
FROM census2011.`portfolio_project#4_sql_dataset#1`;

-- To display dataset_2 Query
SELECT *
From census2011.`portfolio_project#4_sql_dataset#2`;

-- Number of rows into our dataset_1
select count(*)
from census2011.`portfolio_project#4_sql_dataset#1`;

-- Number of rows into our dataset_2
select count(*)
from census2011.`portfolio_project#4_sql_dataset#2`;

-- Dataset for jharkhand and bihar
select *
from census2011.`portfolio_project#4_sql_dataset#1`
where State in ('Jharkhand' , 'Bihar');

-- Total population of india
select sum(Population) as Total_Population
from census2011.`portfolio_project#4_sql_dataset#1`;

-- Avg growth of Population in percentage  
select avg(Growth) as Avg_Growth
from census2011.`portfolio_project#4_sql_dataset#1`;

-- Avg growth of Population by State wise
select State,avg(Growth) as State_wise_Growth
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by State;

-- Avg Sex_Ratio of Population by State wise
select State,round(avg(Sex_Ratio)) as Avg_Sex_Ratio
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by Avg_Sex_Ratio desc;

-- Avg Literacy Rate
 select State,round(avg(Literacy)) as Avg_Literacy
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by Avg_Literacy desc;

-- Avg Literacy Rate where Avg_Literacy > 85
select State,round(avg(Literacy)) as Avg_Literacy
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
having round(avg(Literacy))>85
order by Avg_Literacy desc;

-- Top 3 State showing highest growth ratio
select State, avg(Growth) as avg_Growth
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by avg_Growth desc
limit 3;

-- Bottom 3 State showing Lowest Sex_Ratio
select State, avg(Sex_Ratio) as avg_Sex_Ratio
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by avg_Sex_Ratio asc
limit 3;

-- top and bottom 3 states in Literacy
drop table if exists topstates
create table topstates ( State nvarchar(255), topstates_1 float)
insert into topstates
select State,round(avg(Literacy)) as Avg_Literacy
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by Avg_Literacy desc;
select * from topstates order by topstates.topstates_1 desc limit 3;

drop table if exists bottomstates
create table bottomstates ( State nvarchar(255), bottomstates_1 float)
insert into bottomstates
select State,round(avg(Literacy)) as Avg_Literacy
from census2011.`portfolio_project#4_sql_dataset#1`
group by State
order by Avg_Literacy desc;
select * from bottomstates order by bottomstates.bottomstates_1 asc limit 3;

-- union opertor
select * from (
select * from topstates order by topstates.topstates_1 desc limit 3)a
union
select * from (
select * from bottomstates order by bottomstates.bottomstates_1 asc limit 3)b;

-- States starting with letter A and K
select distinct State
from census2011.`portfolio_project#4_sql_dataset#1`
where State like 'A%' or State like 'K%'

-- States starting with K and ending with A
select distinct State
from census2011.`portfolio_project#4_sql_dataset#1`
where State like 'K%' and State like '%A'

-- 
select distinct State
from census2011.`portfolio_project#4_sql_dataset#1`
where State like 'K%' and State like '%A'

-- Joining census2011.`portfolio_project#4_sql_dataset#1` and census2011.`portfolio_project#4_sql_dataset#2`

select a.District, a.State, a.Sex_Ratio, b.Population
from census2011.`portfolio_project#4_sql_dataset#1` a
inner join census2011.`portfolio_project#4_sql_dataset#2` b on a.District = b.District;






