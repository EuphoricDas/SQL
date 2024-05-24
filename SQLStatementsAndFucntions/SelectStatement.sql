select * 
from parks_and_recreation.employee_demographics;

select first_name,last_name,birth_date,
age, 
age*10 as 10x
from parks_and_recreation.employee_demographics;

select distinct gender
from parks_and_recreation.employee_demographics;

select distinct first_name,gender
from parks_and_recreation.employee_demographics;