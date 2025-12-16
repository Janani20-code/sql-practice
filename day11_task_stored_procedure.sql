CREATE DATABASE practice_sql;
USE practice_sql;

-- Employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT,
    join_date DATE
);

-- Departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    order_amount INT,
    order_date DATE
);



INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Chennai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Mumbai'),
(4, 'Sales', 'Delhi'),
(5, 'Marketing', 'Hyderabad');

INSERT INTO employees (emp_id, emp_name, department, salary, manager_id, join_date) VALUES
(101, 'Arun', 'IT', 60000, NULL, '2021-03-15'),
(102, 'Divya', 'HR', 45000, 101, '2022-07-10'),
(103, 'Karthik', 'IT', 75000, 101, '2020-01-20'),
(104, 'Meena', 'Finance', 50000, 103, '2023-02-01'),
(105, 'Ravi', 'Sales', 40000, 103, '2022-11-05'),
(106, 'Priya', 'Marketing', 55000, 101, '2021-06-18'),
(107, 'Suresh', 'IT', 65000, 103, '2019-09-25'),
(108, 'Anitha', 'HR', 48000, 102, '2023-05-12');

INSERT INTO orders (order_id, emp_id, order_amount, order_date) VALUES
(1001, 101, 15000, '2024-01-10'),
(1002, 103, 25000, '2024-01-15'),
(1003, 105, 12000, '2024-02-05'),
(1004, 107, 30000, '2024-02-20'),
(1005, 101, 18000, '2024-03-01'),
(1006, 106, 22000, '2024-03-10');


SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM salary_log;


--1 STORED PROCEDURE 
-- Practice Questions

--1. Create a procedure to get all employees
delimiter $$
create procedure getallemployees()
begin
select * from employees;
end $$
delimiter ;
call getallemployees();

--2. Procedure to get employee by department
delimiter $$
create procedure getemployeedept(in dept varchar(50))
begin
select * from employees where department=dept;
end $$
delimiter ;
call getemployeedept('IT');

--3.Procedure to increase salary by emp_id
delimiter $$
create procedure increasesalary(in employee_id int)
begin
update employees set salary=salary+1000 where emp_id=employee_id;
end $$
delimiter ;
call increasesalary(103);

--4.Procedure to count employees in each department
delimiter $$
create procedure countemployees()
begin
select count(*),department from employees group by department;
end $$
delimiter ;
call countemployees();

--5.Procedure to get employees joined after a given date
delimiter $$
create procedure employeejoined(in joining_date date)
begin 
select * from employees where join_date>joining_date;
end $$
delimiter ;
call employeejoined('2022-03-01');


-- A. Procedures with MULTIPLE IN PARAMETERS

--Create a procedure to insert a new employee using:

--emp_id,emp_name,department,salary,manager_id,join_date
delimiter $$
create procedure insertnewemployee(in employeeid int,in employeename varchar(20),in dept varchar(20),in sal int,
in man_id int,in joiningdate date)
begin 
insert into employees (emp_id,emp_name,department,salary,manager_id,join_date) 
value(employeeid,employeename,dept,sal,man_id,joiningdate);
end $$
delimiter ;
call insertnewemployee(109,'janani','IT',30000,105,'2026-01-20')
select * from employees;

--2.Create a procedure that takes:
--department name,minimum salary and returns all employees matching both conditions.
delimiter $$
create procedure deptminsal(in dept varchar(20),in minsal int)
begin
select * from employees where department=dept and salary=minsal;
end $$
delimiter ;
call deptminsal('HR',45000);

--3.Create a procedure that takes:

--emp_id,bonus amount and adds bonus to employee salary.
delimiter $$
create procedure addbonus(in empid int,in bonus int)
begin
update employees set salary=salary+bonus where emp_id=empid;
end $$
delimiter ;
call addbonus(105,5000);
select * from employees;


-- B. Procedures with OUT PARAMETER

--Create a procedure that returns the total number of employees.
delimiter $$
create procedure tot_no_emp(out counting int)
begin 
select count(*) into counting from employees;
end $$
delimiter ;
set @counting=0;
call tot_no_emp(@counting);
select @counting;

--Create a procedure that returns the highest salary from employees table.
delimiter $$
create procedure highsalary(out maxsal int)
begin 
select max(salary) into maxsal from employees;
end $$
delimiter ;
set @maxsal=0;
call highsalary(@maxsal);
select @maxsal;

--Create a procedure that returns the total order amount for all orders.
delimiter $$
create procedure tot_order_amt(out tot_amount int)
begin 
select sum(order_amount) into tot_amount from orders; 
end $$
delimiter ;
set @tot_amount=0;
call tot_order_amt(@tot_amount);
select @tot_amount;

-- C. Procedures with IN + OUT PARAMETERS (IMPORTANT ⭐)

--Create a procedure that: takes emp_id as IN returns employee name as OUT
delimiter $$
create procedure takeinout1(in empid int,out empname varchar(20))
begin
select emp_name into empname from employees where emp_id=empid;
end $$
delimiter ;
set @empname=0;
call takeinout1(109,@empname);
select @empname;

--Create a procedure that: takes department name as IN returns employee count of that department as OUT
delimiter $$
create procedure takeinout2(in dept varchar(20),out counting int)
begin 
select count(*) into counting from employees where department=dept;
end $$
delimiter ;
set @counting=0;
call takeinout2('IT',@counting);
select @counting;

--Create a procedure that: takes emp_id as IN returns yearly salary (salary × 12) as OUT
delimiter $$
create procedure takeinout3(in empid int,out year_sal int)
begin 
select salary*12 as yearly_salary into year_sal from employees where emp_id=empid;
end $$
delimiter ;
set @year_sal=0;
call takeinout3(109,@year_sal);
select @year_sal;

--Create a procedure that: takes emp_id as IN returns whether the employee exists (count) as OUT
delimiter $$
create procedure takeinout4(in empid int,out counting int)
begin
select count(*) as present into counting from employees where emp_id=empid; 
end $$
delimiter ;
set @counting=0;
call takeinout4(109,@counting);
select @counting;

--D. IN + OUT + LOGIC (INTERVIEW LEVEL)

--Create a procedure that: takes emp_id as IN increases salary by 10% only if salary < 50,000 returns updated salary as OUT
delimiter $$
create procedure takeinout5(in empid int,out updated_salary int)
begin
declare current_sal int;
select salary into current_sal from employees where emp_id=empid;
if current_sal < 50000 then
update employees set salary=salary + salary*0.1 where emp_id=empid;
end if;
select salary into updated_salary from employees where emp_id=empid;
end $$
delimiter ;
drop procedure takeinout5;
set @updated_salary=0;
call takeinout5(109,@updated_salary);
select @updated_salary;
select * from employees;

--Create a procedure that: takes department name as IN returns average salary of that department as OUT
delimiter $$
create procedure takeinout6(in dept varchar(20),out avg_sal int)
begin
select avg(salary) into avg_sal from employees where department=dept;
end $$
delimiter ;
drop procedure takeinout6;
set @avg_sal=0;
call takeinout6('HR',@avg_sal);
select @avg_sal;

--Create a procedure that: takes emp_id as IN returns total order amount placed by that employee as OUT
delimiter $$
create procedure takeinout7(in empid int,out tot_amt int)
begin
select sum(order_amount) into tot_amt from orders where emp_id=empid;
end $$
delimiter ;
set @tot_amt=0;
call takeinout7(103,@tot_amt);
select @tot_amt;

-- BONUS CHALLENGE (OPTIONAL)

--1.Create a procedure that: takes emp_id as IN

--checks employee department if department is IT, increase salary by 5% return updated salary as OUT
delimiter $$
create procedure takeinout8(in empid int,out updated_sal int)
begin
declare current_dept varchar(20);
select department into current_dept from employees where emp_id=empid;
if current_dept='IT' then
update employees set salary=salary+salary*0.05 where emp_id=empid;
end if;
select salary into updated_sal from employees where emp_id=empid;
end $$
delimiter ;
drop procedure takeinout8;
set @updated_sal=0;
call takeinout8(104,@updated_sal);
select @updated_sal;