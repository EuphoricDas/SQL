-- Joins

select * 
from employee_demographics as d
inner join employee_salary as s
	on d.employee_id = s.employee_id;
    
    
select d.employee_id, age, occupation
from employee_demographics as d
inner join employee_salary as s
	on d.employee_id = s.employee_id;
    
-- Outer Join
-- Left Outer and Right Outer Join
select *
from employee_demographics as d
left join employee_salary as s
	on d.employee_id = s.employee_id;
    
select *
from employee_demographics as d
right join employee_salary as s
	on d.employee_id = s.employee_id;
    
-- self join

select es1.employee_id as emp_santa,
es1.first_name as first_name_santa,
es1.last_name as last_name_santa,
es2.employee_id as emp_name,
es2.first_name as first_name,
es2.last_name as last_name
from employee_salary es1
join employee_salary es2
	on es1.employee_id +1 = es2.employee_id;
    
-- Joinig multiple tables together

select *
from employee_demographics as d
inner join employee_salary as s
	on d.employee_id = s.employee_id
inner join parks_departments as pd
	on s.dept_id = pd.department_id;
    
select * from parks_departments
