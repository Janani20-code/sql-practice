create database stored_procedure;
use stored_procedure;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees (name, department, salary) VALUES
('Rahul', 'IT', 25000),
('Meena', 'HR', 30000),
('Suresh', 'Finance', 28000),
('Priya', 'IT', 35000),
('Arun', 'Marketing', 27000);

--1)	Create a procedure to display all records from a table.
--o	Table: employees
delimiter $$
create procedure getallrecords()
begin
	select * from employees;
end $$
delimiter ;
call getallrecords();

--2)	Create a procedure to display employee details by department.
--o	Input: department name (IN deptName)
delimiter $$
create procedure getdepartment()
begin
	select department from employees;
end $$
delimiter ;
call getdepartment();

--3)	Create a procedure to count employees in a department.
--o	Output the count (OUT totalCount)
delimiter $$
create procedure getcountofdata(out total int)
begin
	select count(*) into total from employees;
end $$
delimiter ;
set @total=0;
call getcountofdata(@total);
select @total;

--4)	Create a procedure to insert a new employee.
--o	Inputs: name, department, salary
delimiter $$
create procedure insertdata(in empname varchar(50),in empdept varchar(50),in empsal int)
begin
	insert into employees(name,department,salary) values(empname,empdept,empsal);
end $$
delimiter ;
call insertdata("janani","IT",50000);
select * from employees;

--5)	Create a procedure to update salary of an employee.
o	Inputs: employee id, new salary
delimiter $$
create procedure getupdatedata(in empid int, in emp_sal int)
begin
	update employees set salary=emp_sal where id=empid;
end $$
delimiter ;
call getupdatedata(3,30000);

--6)	Create a procedure to delete an employee by ID.
delimiter $$
create procedure getdatadel(in empid int)
begin
	delete from employees where id=empid;
end $$
delimiter ;
call getdatadel(1)

--7)	Create a procedure to show employees having salary greater than a given value
delimiter $$
create procedure getsalarydetails(in emp_sal int)
begin
	select salary from employees where salary>emp_sal;
end $$
delimiter ;
call getsalarydetails(20000);

--8)	Create a procedure to display the highest salary employee.
Delimiter $$
create procedure gethighestsalary()
begin
	select id,name,max(salary) from employees group by id order by max(salary) desc limit 2;
end $$
delimiter ;
call gethighestsalary();
drop procedure gethighestsalary;
--9)	Create a procedure to display the lowest salary employee.
delimiter $$
create procedure getlowestsalary()
begin
	select id,name,min(salary) from employees group by id order by min(salary) asc limit 1;
end $$
delimiter ;
call getlowestsalary();

--10)	Create a procedure to display employees with salary between two values.
delimiter $$
create procedure getsalarybetweenvalues()
begin
	select id,name,salary from employees where salary between 20000 and 40000 order by salary;
end $$
delimiter ;
call getsalarybetweenvalues();

--11)	Create a procedure to increase salary by a percentage (%) for a department.
delimiter $$
create procedure increasesalary(in dept varchar(30))
begin
	select department,salary*0.10 from employees where department=dept;
end $$
delimiter ;
call increasesalary("finance");

--12)	Create a procedure to count total employees in the company.
delimiter $$
create procedure totalemployees(out total int)
begin
	select count(*) as total_employees into total from employees;  
end $$
delimiter ;
set @total=0;
call totalemployees(@total);
select @total;

--13)	Create a procedure with IF ELSE
delimiter $$
create procedure usingifelse(in empid int)
begin
	declare sal int;
    select salary into sal from employees where id=empid;
	if sal>30000 then
		select 'High salary' as result;
    else
		select 'Normal Salary' as result;
    end if;
end $$
delimiter ;
call usingifelse(3);

--14)	Create a procedure with CASE WHEN
--o	CASE based on department:
--o	IT → “Tech Team”
--o	HR → “Human Resource Team”
--o	Finance → “Accounts Team”
--o	Else → “Other Department”
delimiter $$
create procedure usingdept(in emp_dept varchar(30))
begin
	select *,
    case
    when department="IT" then 'Tech Team'
    when department="HR" then 'Human Resource Team'
    when department="Finance" then 'Accounts Team'
    else 'other department'
    end as emp_department
    from employees where department=emp_dept;
end $$
delimiter ;
call usingdept('HR');
drop procedure usigndept;

--15)	Create a procedure that returns average salary for each department.
delimiter $$
create procedure averagesalary()
begin
	select department,avg(salary) from employees group by department order by avg(salary) desc;
end $$
delimiter ;
call averagesalary();

--16)	Procedure to find employees whose names start with a given letter.
delimiter $$
create procedure startletter()
begin
	select * from employees where name like "A%";
end $$
delimiter ;
call startletter();

--17)	Procedure to show total salary spent for a specific department.
delimiter $$
create procedure totalsalary(in dept varchar(30))
begin
	select department,sum(salary) as total_salary from employees where department=dept group by department;
end $$
delimiter ;
call totalsalary('HR');

--18)	Procedure to list employees sorted by salary (ASC or DESC).
delimiter $$
create procedure employeesort()
begin
	select * from employees order by salary desc;
end $$
delimiter ;
call employeesort();

--19)	Procedure to check if an employee exists by ID and print message.
--o	IF EXISTS → "Employee Found"
--Else → "Not Found"
delimiter $$
create procedure checkingemployee(in emp_id int)
begin
declare empcount int;
	select count(*) into empcount from employees where id=emp_id;
    if empcount>0  then
		select "employee found" as result;
	else
		select "not found" as result;
	end if;
end $$
delimiter ;
call checkingemployee(7);

--20)	Procedure to get top 3 highest salary employees.
delimiter $$
create procedure highsalary()
begin
	select id,name,department,max(salary) from employees group by id,name,department limit 3;
end $$
delimiter ;
call highsalary();
