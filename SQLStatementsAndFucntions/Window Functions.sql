-- Window Functions

select gender, avg(salary)
from employee_demographics as d
join employee_salary as s
	on d.employee_id = s.employee_id
group by gender;

select d.first_name,d.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics as d
join employee_salary as s
	on d.employee_id = s.employee_id;
    
select d.first_name,d.last_name, gender, salary,
sum(salary) over(partition by gender order by d.employee_id) as rolling_total
from employee_demographics as d
join employee_salary as s
	on d.employee_id = s.employee_id;
    
select d.employee_id,d.first_name,d.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics as d
join employee_salary as s
	on d.employee_id = s.employee_id
