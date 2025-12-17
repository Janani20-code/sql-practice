CREATE DATABASE practice_sql2;
USE practice_sql2;

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



-- 1️⃣ View to show all employee details
create view show_all_employees as select * from employees;

-- 2️⃣ View for IT department employees only
create view vw_it_employees as select * from employees where department='IT';


-- 3️⃣ View to show employees with salary greater than 50,000
create view high_salary_above_50000 as select * from employees where salary>50000;

-- 4️⃣ View to show employee name and join date with renamed columns
create view renamed_columns as select emp_name as employee_name ,join_date as joined_date from employees;


-- 5️⃣ View to display HR employees ordered by salary (highest first)
create view hr_employees as select * from employees where department='HR'
order by salary desc;

-- 6️⃣ View to show employee name and their total order amount
create view total_order_amount as
select e.emp_name,sum(o.order_amount) as total_order
from employees e join orders o on e.emp_id=o.emp_id group by e.emp_name;

-- 7️⃣ View to show employees who have placed orders
create view placed_orders as select e.emp_id,e.emp_name,e.department,o.order_amount from employees e join orders o on e.emp_id=o.emp_id;

-- 8️⃣ View to show department-wise employee count
create view department_wise as select department,count(*) from employees group by department;

-- 9️⃣ View to show department-wise average salary
create view dept_avg_sal as select department,avg(salary) from employees group by department;

-- 🔟 View to show employees and their manager name (self join)
create view manager_names as select e.emp_id,e.emp_name as employee_name,m.emp_name as manager_name
from employees e left join employees m on e.manager_id=m.emp_id;


-- 1️⃣1️⃣ View showing employees who joined after 2021
create view joining_after_year as select emp_name,department,join_date from employees where join_date>'2021-12-31';


-- 1️⃣2️⃣ View to show top 3 highest-paid employees
create view highest_paid as select emp_name,department,salary from employees order by salary desc limit 3;

-- 1️⃣3️⃣ View showing total orders placed by each department
create view tot_order_placed as select e.department,o.order_date,sum(o.order_amount) from orders o join
employees e on e.emp_id=o.emp_id group by department;

-- 1️⃣4️⃣ View showing employees who have NOT placed any orders
create view not_placed_order as select e.emp_name,e.department from employees e left join orders o on e.emp_id=o.emp_id
where o.emp_id is null;
select * from not_placed_order;

-- 1️⃣5️⃣ View for monthly order summary
create view monthly_order as select monthname(order_date) as month,count(order_id) as total_orders,
 sum(order_amount) as total_amount from orders group by monthname(order_date);
select * from monthly_order;


-- 1️⃣6️⃣ View for IT employees (to be queried later)
create view it_employees as select * from employees where department='IT';


-- Query from the above view: employees earning more than 65,000
select * from high_salary_above_50000 where salary >65000;


-- 1️⃣7️⃣ Drop a view safely
-- drop view if exists it_employees;