-- Temp Tables

create temporary table temp
(first_name varchar(20),
last_name varchar(20),
fav_movie varchar(100)
);

select * from temp;

insert into temp values
('Binduja','Das','10 Things I Hate About You');

select * from temp;

create temporary table salary_over_50k
select * 
from employee_salary
where salary >= 50000;

select * from salary_over_50k
