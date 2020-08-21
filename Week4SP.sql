-- This procedure returns whether or not an employee makes more than $100,000 per year using the emp_no and @salary.

delimiter $$

create procedure more_than_hundredk(
in employee_number int(5),
out salary_result varchar(50)
)

begin
	declare salary_per_year varchar(25);
	
	select s.salary, s.emp_no
	from salaries s
	where s.emp_no = employee_number and s.salary = salary_per_year;
	
	if salary_per_year >= 100000 then 
	set salary_result = 'Makes More than $100k';
	else 
	set salary_result = 'Makes Less than $100k';
	end if;

end $$

-- This procedure returns the gender of a specific employee using the employees emp_no and @gender. 

delimiter $$

create procedure emp_gender(
in employee_number int(5),
out gender_result varchar(6)
)

begin
	declare gender_name char(10);
	
	select e.gender into gender_name
	from employees e
	where e.emp_no = employee_number
	limit 1;

	if gender_name = 'F' then
	set gender_result = 'Female';
	else 
	set gender_result = 'Male';
	end if;

end$$

-- This procedure returns the salary of an employee using the salaries emp_no.

delimiter $$

create procedure find_pay(
in employee_number int(5)
)

begin
	declare yearly_salary varchar(25);
	
	select s.salary as yearly_salary, s.emp_no as employee_number
	from salaries s
	where s.emp_no = employee_number;

end$$


-- This procedure returns whether or not an employee make $50000 or less per year using employees emp_no and @salary2.

delimiter $$

create procedure less_than_fiftyk(
in employee_number int(5),
out salary2_result varchar(50)
)

begin
	declare yearly_salary varchar(25);
	
	select s.salary, s.emp_no
	from salaries s
	where s.emp_no = employee_number and s.salary = yearly_salary;
	
	if yearly_salary <= 50000 then 
	set salary2_result = 'Makes Less than $50,000';
	else 
	set salary2_result = 'Makes More than $50,000';
	end if;

end$$

-- The procedure returns the age of the employee when hired using employees emp_no and @age.

delimiter $$

CREATE PROCEDURE age_when_hired(
in employee_number int(5),
out age_result int(3)
)

begin
	declare start_year int;
	declare birth_year int;

select year (e.hire_date), year (e.birth_date)
into start_year, birth_year
from employees e
where e.emp_no = employee_number
limit 1;

select start_year - birth_year into age_result;

end$$