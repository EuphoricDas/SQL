select * 
from employee_salary
where first_name = "Leslie";

select * 
from employee_salary
where salary <= 50000;

select * 
from employee_demographics
where gender != "Female";

select * 
from employee_demographics
where birth_date > '1985-01-01';

select * 
from employee_demographics
where birth_date > '1985-01-01' 
&& gender = "Male";

select * 
from employee_demographics
where birth_date > '1985-01-01' 
OR gender = "Male";

select * 
from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55;

-- LIKE
-- % and _
select * 
from employee_demographics
where first_name LIKE 'Jer%';

select * 
from employee_demographics
where first_name LIKE 'a%';

select * 
from employee_demographics
where first_name LIKE 'a__';

select * 
from employee_demographics
where first_name LIKE '%er%';

select * 
from employee_demographics
where first_name LIKE 'a___%';

select * 
from employee_demographics
where birth_date like '1989%'
