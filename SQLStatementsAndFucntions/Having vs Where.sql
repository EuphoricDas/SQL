-- Having vs Where

-- Doesn't work because the groupby happens first abd the
-- aggregate function can't execute
select gender, avg(age)
from employee_demographics
where avg(age) > 40
group by gender;

select gender, avg(age)
from employee_demographics
group by gender
having avg(age)>40;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation 
having avg(salary) > 75000
-- having only works on aggregated functions after the 
-- group by runs