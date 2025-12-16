CREATE DATABASE practice_sql1;
USE practice_sql1;

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


-- 1. BEFORE INSERT trigger on employees
-- Prevent inserting salary less than 30,000
delimiter $$
create trigger before_insert
before insert on employees
for each row
begin 
if new.salary <30000 then
	signal sqlstate '45000'
	set message_text = 'salary should not be less than 30000';
end if;
end $$
delimiter ;
insert into employees values(109,'janani','IT',30000,105,'2026-01-20');
insert into employees values(110,'oviya','hr',29000,105,'2026-01-20');

-- 2. AFTER INSERT trigger on orders
-- Display a message: "New order placed"
create table insert_order_log(orderid int,message varchar(50),action varchar(20),action_date date);
delimiter $$
create trigger after_insert_order
after insert on orders
for each row
begin
insert into insert_order_log(orderid,message,action,action_date) values(new.order_id,'new order placed','insert',now());
end $$
delimiter ;
insert into orders values(1007,102,36000,'2025-12-16');
select * from insert_order_log;

-- 3. BEFORE UPDATE trigger on employees
-- Do not allow salary to be updated to a value less than the old salary
delimiter $$
create trigger before_update_employees
before update on employees
for each row
begin 
if new.salary<old.salary then
signal sqlstate '45000'
set message_text='updated salary should be greater than the old salary';
end if;
end $$
delimiter ;
update employees set salary = 20000 where emp_id=102;

-- 4. AFTER DELETE trigger on employees
-- Log deleted employee ID into a separate table employee_delete_log
create table after_delete_log(empid int,empname varchar(20),action varchar(20),action_date date);
delimiter $$
create trigger after_delete
after delete on employees
for each row 
begin
insert into after_delete_log(empid,empname,action,action_date) values(old.emp_id,old.emp_name,'delete',now());
end $$
delimiter ;
drop trigger after_delete;
delete from employees where emp_id=109;
select * from after_delete_log;

-- 5. BEFORE INSERT trigger on employees
-- If join_date is NULL, set it to today’s date

delimiter $$
create trigger before_insert_emp
before insert on employees
for each row
begin
if new.join_date is null then
update employees set new.join_date=curdate();
end if;
end $$
delimiter ;
drop trigger before_insert_emp;

-- ==============================
-- 🟡 INTERMEDIATE TRIGGER TASKS
-- ==============================

-- 6. AFTER UPDATE trigger on employees
-- When salary is updated, insert old salary and new salary into a salary_log table


-- 7. BEFORE UPDATE trigger on employees
-- Allow salary update only if department is IT or HR


-- 8. AFTER INSERT trigger on orders
-- Automatically increase employee salary by 2% if order amount > 20,000


-- 9. BEFORE DELETE trigger on departments
-- Prevent deletion if any employee belongs to that department


-- 10. AFTER UPDATE trigger on employees
-- If manager_id changes, store old manager_id and new manager_id in manager_change_log



-- ============================
-- 🔵 ADVANCED TRIGGER TASKS
-- ============================

-- 11. AFTER INSERT trigger on employees
-- Automatically assign manager_id = 101 if department = 'HR'


-- 12. BEFORE UPDATE trigger on employees
-- Prevent updating department from IT to HR


-- 13. AFTER INSERT trigger on orders
-- If an employee places more than 3 orders, increase salary by 10%


-- 14. BEFORE INSERT trigger on orders
-- Prevent inserting order_amount greater than 50,000


-- 15. AFTER DELETE trigger on orders
-- Reduce employee salary by 5% if an order is deleted



-- ==============================
-- 🔴 SCENARIO-BASED (INTERVIEW)
-- ==============================

-- 16. Create a trigger to track total order amount per employee
-- Store result in a summary table


-- 17. Create a trigger that blocks deleting employees who are managers


-- 18. Create a trigger to automatically move employees to Sales
-- If salary is less than 45,000


-- 19. Create a trigger that prevents inserting duplicate employee names


-- 20. Create a trigger that logs every salary update
-- Capture date, time, user, old salary, and new salary
