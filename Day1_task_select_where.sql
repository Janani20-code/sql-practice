create database scopetech_practice;
 show databases;
 use scopetech_practice;
 create table student(student_id int auto_increment primary key,name varchar(30),age int,grade varchar(3),city varchar(20));
create table employee(emp_id int auto_increment primary key,name varchar(30),department varchar(30),salary int,city varchar(30));
insert into student(name,age,grade,city) values('janani',24,'A','sivagangai'),('monisha',25,'A','Madurai'),('Sweatha',24,'B','Manamadurai')
,('suba',24,'B','vaadipatti'),('kalai',23,'C','Theni')
insert into employee(name,department,salary,city) values('janani','IT',50000,'sivagangai'),('monisha','IT',50000,'Madurai'),('Sweatha','HR',40000,'Manamadurai')
,('suba','Sales',50000,'vaadipatti'),('kalai','HR',30000,'Theni')
select * from student;
select name,grade from student;
select * from employee where department='IT';
select * from employee where salary>30000;
select * from student where city='chennai';
select name,salary from employee;
select * from student where age>16;
select * from employee where city='madurai';
select name from student;
select name,department from employee;
select * from student where age between 15 and 17;
select * from student where city<>'chennai';
select * from employee where department<>'IT';
create table product(product_id int auto_increment primary key,product_name varchar(30),category varchar(30),price int,stock int,supplier varchar(30));
insert into product(product_name,category,price,stock,supplier)values('laptop','electronics',30000,30,'asus'),('mobile','electronics',20000,10,'samsung'),
('foundation','cosmetics',5000,20,'lakme'),('shirt','clothing',1000,25,'levis'),('note','stationary',500,30,'notebook');
select * from product;
select product_name,price from product;
select * from product where category='electronics';
select * from product where price>500;
select * from product where supplier='lakme';
select product_name,stock from product;
select * from product where stock<50;
select * from product where category='furniture';
select * from product;
select * from product where category<>'electronics';
select product_name,category from product;
select * from product where price between 500 and 5000;
select * from product where stock=20;
select * from product where category='grocery';
select * from product where price<10000;
select product_name,supplier from product;
select * from product where stock is not null;
