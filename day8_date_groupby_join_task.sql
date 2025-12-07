CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);
INSERT INTO employees (emp_id, emp_name, department, salary, join_date) VALUES
(1, 'Ramesh Kumar', 'Sales', 45000, '2024-01-15'),
(2, 'Priya Devi', 'HR', 52000, '2023-11-10'),
(3, 'Arun Raj', 'IT', 65000, '2024-03-05'),
(4, 'Kavitha', 'Sales', 47000, '2024-02-20'),
(5, 'Suresh', 'Finance', 58000, '2023-12-01');
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Mouse', 'Electronics', 450.00),
(103, 'Office Chair', 'Furniture', 3500.00),
(104, 'Notebook', 'Stationery', 40.00),
(105, 'Water Bottle', 'Accessories', 120.00);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    product VARCHAR(50),
    amount INT,
    sale_date DATETIME,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
INSERT INTO sales (sale_id, emp_id, product, amount, sale_date) VALUES
(1, 1, 'Laptop', 1, '2024-03-10 10:15:00'),
(2, 1, 'Mouse', 2, '2024-03-12 16:40:00'),
(3, 2, 'Notebook', 10, '2024-01-25 11:00:00'),
(4, 3, 'Laptop', 1, '2024-04-05 14:20:00'),
(5, 4, 'Office Chair', 1, '2024-02-28 17:45:00'),
(6, 3, 'Mouse', 5, '2024-03-15 09:30:00'),
(7, 5, 'Water Bottle', 3, '2024-02-10 13:00:00'),
(8, 2, 'Office Chair', 1, '2024-01-30 10:50:00'),
(9, 4, 'Notebook', 15, '2024-03-22 18:10:00'),
(10, 1, 'Water Bottle', 4, '2024-04-09 19:05:00');

select sale_id,date_format(sale_date,"%M %Y") as sale_month from sales where sale_date like "2024-03%";
select emp_name from employees where join_date like "2024%";
select * from sales where time(sale_date)>"18:00:00";
select * from sales where sale_date >=date_sub(curdate(),interval 7 day);
select min(sale_date),max(sale_date)from sales; 
select Month(sale_date) as monthly,count(sale_date)as count_of_sales from sales group by Month(sale_date) order by Month(sale_date);
select emp_name from employees where join_date <"2024-01-01";
select date(sale_date),count(sale_id) from sales group by date(sale_date); 
select department,sum(salary) from employees group by department; 
select department,count(emp_id) from employees group by department;
select emp_id,avg(amount) from sales group by emp_id;
select product,sum(amount) from sales group by product;
select emp_id, max(amount) from sales group by emp_id;
select category,count(product_id) from products group by category;
select MonthName(sale_date),Year(sale_date),sum(amount) from sales group by Monthname(sale_date),year(sale_date);
select e.emp_name,s.product,s.sale_date,s.amount from employees e join sales s on e.emp_id=s.emp_id
select e.emp_name,s.product,p.price from employees e join sales s on e.emp_id=s.emp_id join products p on s.product=p.product_name;
select distinct e.emp_name from employees e left join sales s on e.emp_id=s.emp_id
select e.emp_id,e.emp_name,s.sale_id from employees e left join sales s on e.emp_id=s.emp_id where s.sale_id is null;
select p.product_name,sum(s.amount) from products p join sales s on p.product_name=s.product group by p.product_name;
select s.sale_id,e.emp_name,p.category,p.product_name,s.sale_date from employees e left join sales s on e.emp_id=s.emp_id left join products p on s.product=p.product_name;
select e.emp_id,e.emp_name,min(s.sale_date) from employees e left join sales s on e.emp_id=s.emp_id group by e.emp_id,e.emp_name order by e.emp_id;
select p.product_name from products p left join sales s on p.product_name=s.product where s.sale_id is null;
select e.emp_id,emp_name,count(s.sale_id) as total_sales from sales s join employees e on s.emp_id=e.emp_id group by emp_id,emp_name order by total_sales desc limit 1;
select e.department,count(s.sale_id) as total_sales from employees e left join sales s on s.emp_id=e.emp_id group by e.department; 

