create database scopetech_practice2;
use scopetech_practice2;
create table student(student_id int auto_increment primary key,name varchar(30),age int,grade varchar(3),city varchar(20));
create table employee(emp_id int auto_increment primary key,name varchar(30),department varchar(30),salary int,city varchar(30));
insert into student(name,age,grade,city) values('janani',24,'A','sivagangai'),('monisha',25,'A','Madurai'),('Sweatha',24,'B','Manamadurai')
,('suba',24,'B','vaadipatti'),('kalai',23,'C','Theni')
insert into employee(name,department,salary,city) values('janani','IT',50000,'sivagangai'),('monisha','IT',50000,'Madurai'),('Sweatha','HR',40000,'Manamadurai')
,('suba','Sales',50000,'vaadipatti'),('kalai','HR',30000,'Theni')
create table product(product_id int auto_increment primary key,product_name varchar(30),category varchar(30),price int,stock int,supplier varchar(30));
insert into product(product_name,category,price,stock,supplier)values('laptop','electronics',30000,30,'asus'),('mobile','electronics',20000,10,'samsung'),
('foundation','cosmetics',5000,20,'lakme'),('shirt','clothing',1000,25,'levis'),('note','stationary',500,30,'notebook');
update student set city="chennai" where student_id=1;
update student set grade="A" where city="chennai";
update student set age=18 where name="monisha";
update student set city="madurai" where age>16;
select * from student;
update employee set salary=37000 where emp_id=3
update employee set department="Admin" where department="HR";
update employee set city="chennai" where salary>30000;
update employee set name="sweatharenya" where name="sweatha";
update product set price=7000 where product_id=3;
update product set stock=0 where category="electronics";
update product set supplier="oppo" where supplier="samsung";
update product set stock=100 where price<1000;
delete from student where student_id=2;
delete from student where city="chennai"
delete from student where age<15;
delete from student where name="priya";
delete from student where grade="F";
delete from employee where emp_id=4;
delete from employee where department="IT";
delete from employee where salary<20000;
delete from employee where name="Ravi";
delete from employee where city="Madurai";
delete from product where product_id=5;
delete from product where category="Grocery";
delete from product where stock=0;
delete from product where product_name="Laptop"
delete from product where price>30000;
select * from employee;
select * from product
