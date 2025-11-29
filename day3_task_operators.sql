create database scopetech_practice3;
use scopetech_practice3;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO employees (name, department, salary, city, email) VALUES
('Arun', 'IT', 45000, 'Madurai', 'arun@gmail.com'),
('Banu', 'HR', 30000, 'Chennai', NULL),
('Charles', 'Finance', 52000, 'Coimbatore', 'charles@yahoo.com'),
('Divya', 'IT', 60000, NULL, 'divya@gmail.com'),
('Elango', 'Marketing', 28000, 'Madurai', NULL),
('Farzana', 'IT', 75000, 'Trichy', 'far@gmail.com'),
('Gokul', 'Support', 20000, 'Madurai', 'gokul@hotmail.com'),
('Harini', 'HR', NULL, 'Chennai', 'harini@gmail.com'),
('Imran', 'Finance', 48000, NULL, 'imran@yahoo.com'),
('Jenifer', 'Marketing', 31000, 'Bangalore', 'jen@gmail.com');
select * from employees where email is null;
select * from employees where city is null;
select * from employees where salary is null;
update employees set email="Not Provided" where email is null;
select name from employees where city is null;
select name from employees where salary is not null;
select * from employees where city is not null;
update employees set salary=0 where salary is not null;
delete from employees where email is null;
select * from employees where city is null and email is null;
select * from employees where department in ("IT","HR");
select * from employees where city in ("chennai","madurai");
select * from employees where salary in (20000,30000,45000);
select * from employees where name in("Arun","Divya");
select * from employees where department in ("Finance","Marketing");
select * from employees where email like "%@gmail.com" or email like "%@yahoo.com";
select * from employees where id in (1,3,5);
select * from employees where city in ("Madurai","Trichy","Bangalore");
update employees set salary=56000 where department in ("IT","support");
delete from employees where department="Marketing";
select * from employees where department not in ("IT","HR");
select * from employees where city not in ("Madurai","Chennai");
select * from employees where salary not in (20000,30000);
select * from employees where id not in (2,4,6);
select * from employees where name not in ("Arun","Gokul");
select * from employees where department not in ("Finance","Support");
update employees set salary=45000 where city<>"Madurai";
select * from employees where email not like "%gmail.com";
delete from employees where department not in ("Marketing","Support");
select * from employees where department is not null;
select * from employees where name like "A%";
select * from employees where name like "D%";
select * from employees where email like "har%";
select * from employees where city like "M%";
select * from employees where email like "%gmail.com";
select * from employees where name like "%a";
select * from employees where name like "%ai";
select * from employees where name like "%an%";
select * from employees where email like "%yahoo%";
select * from employees where department like "%n%";
select * from employees where name like "ar%";
select * from employees where name like "_a%";
select * from employees where city like "%chi%";
select * from employees where salary between 30000 and 60000;
select * from employees where id between 3 and 7;
select * from employees where left(name, 1) between 'A' and 'F';
select * from employees where left(department,1) between 'A' and 'M';
update employees set salary=100000 where salary between 20000 and 50000;
select * from employees where salary between 30000 and 60000 and city in ("Madurai","Chennai");
select * from employees where department like"F%" and email is not null;
select * from employees where name like "%a" and city="Madurai";
select * from employees where salary between 20000 and 50000 and email like "%gmail%"; 
select * from employees where name like "a%" and department not in("Finance","Support");
select * from employees;
