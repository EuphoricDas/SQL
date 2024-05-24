 -- CTEs
 -- Common Table Expressions
 
 with cte_ex as
 (
 select gender, avg(salary) avg_sal, min(salary) min_sal,
 max(salary) max_sal, count(salary) count
 from employee_demographics d
 join employee_salary s
	on d.employee_id = s.employee_id
group by gender
)
select avg(avg_sal) from cte_ex; 

-- OR
with cte_ex(gender, avg_sal, max_sal, min_sal, count_sal) as
 (
 select gender, avg(salary) avg_sal, min(salary) min_sal,
 max(salary) max_sal, count(salary) count
 from employee_demographics d
 join employee_salary s
	on d.employee_id = s.employee_id
group by gender
)
select * from cte_ex;
-- We can only call the CTE immediately after writing it because
-- we're not saving it the memory or it's not a temp table or
-- view or stored procedure either

select avg(avg_sal)
 from(
 select gender, avg(salary) avg_sal, min(salary) min_sal,
 max(salary) max_sal, count(salary) count
 from employee_demographics d
 join employee_salary s
	on d.employee_id = s.employee_id
group by gender
) ex_subquery;


 with cte_ex1 as
 (
 select employee_id, gender, birth_date
 from employee_demographics 
 where birth_date > '1985-01-01'
),
cte_ex2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select * 
from cte_ex1
join cte_ex2
	on cte_ex1.employee_id = cte_ex2.employee_id
; 