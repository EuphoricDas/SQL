-- Stored procedures

select *
from employee_salary
where salary >= 50000;

create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

call large_salaries();

delimiter $$
create procedure large_salaries_1()
begin
	select *
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >=10000;
end $$
delimiter ;

call large_salaries_1();


delimiter $$
create procedure large_salaries_2(e_id int)
begin
	select *
	from employee_salary
    where employee_id = e_id;
end $$
delimiter ; 

call large_salaries_2(1)
