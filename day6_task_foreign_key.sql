create database ecommerce_order_management
use ecommerce_order_management
create table users(user_id int primary key,name varchar(20),email varchar(30),phone varchar(10),address varchar(30))
create table products(product_id int primary key,product_name varchar(20),price int,category varchar(20))
create table orders(order_id int primary key,user_id int,order_date date,status varchar(20),foreign key (user_id) references users(user_id))
create table payments(payment_id INT primary key,order_id INT,amount DECIMAL(10,2),payment_method VARCHAR(20),
payment_date DATE,foreign key (order_id) references orders(order_id))
create table inventory(inventory_id INT primary key,product_id int,quantity INT,stock_status VARCHAR(50),foreign key (product_id) references
products(product_id))
INSERT INTO users (user_id, name, email, phone, address) VALUES
(1, 'Arjun', 'arjun@gmail.com', '9876543210', 'MG Street, Chennai'),
(2, 'Priya', 'priya@yahoo.com', '9123456780', 'Anna Nagar, Chennai'),
(3, 'Karan', 'karan@gmail.com', NULL, 'Bangalore Main Road'),
(4, 'David', 'david@outlook.com', '9988776655', 'Street No 5, Mumbai'),
(5, 'Test', 'testexample.com', '9000001111', NULL);
INSERT INTO products (product_id, product_name, price, category) VALUES
(101, 'Samsung Mobile', 18000, 'Electronics'),
(102, 'Nike Shoes', 3500, 'Footwear'),
(103, 'Laptop Pro 15', 65000, 'Electronics'),
(104, 'Shirt Slim Fit', 1200, 'Clothing'),
(105, 'Bluetooth Speaker', NULL, 'Electronics');
INSERT INTO orders (order_id, user_id, order_date, status) VALUES
(501, 1, '2025-01-10', 'Pending'),
(502, 3, '2025-01-11', 'Shipped'),
(503, 2, '2025-01-11', 'Delivered'),
(504, 1, '2025-02-01', NULL),
(505, 4, '2025-02-05', 'Cancelled');
INSERT INTO payments (payment_id, order_id, amount, payment_method, payment_date) VALUES
(9001, 501, 18000, 'UPI', '2025-01-10'),
(9002, 503, 3500, 'Card', '2025-01-11'),
(9003, 502, 65000, 'Cash', '2025-01-12'),
(9004, 505, NULL, NULL, '2025-02-05');
INSERT INTO inventory (inventory_id, product_id, quantity, stock_status) VALUES
(1, 101, 50, 'In Stock'),
(2, 103, 5, 'Low Stock'),
(3, 104, 0, 'Out of Stock'),
(4, 102, NULL, NULL),
(5, 105, 30, 'In Stock');
select * from users where name like"A%"
insert into users (user_id,name,email,phone,address) values(6,'janani','jana@example.com','9878965432','namakkal main road');
update users set email='kamal@gamil.com' where user_id=6;
select * from users where phone is null;
delete from orders where user_id=3;
select * from users where address like "%street%";
select * from users limit 5;
select * from users where email like "%gmail.com";
insert into users (user_id,name,email,phone,address) values(7,'barbie','jana@example.com','9878965456','namakkal main road');
update users set phone="Nprovided" where phone is null;
Select * from users where name in('Raj', 'Karan', 'David');
Select * from users where name NOT IN ('Admin', 'Test'); 
Delete from users where email not like “%@%”;
Select * from users order by name;
Update users set address='Coimbatore' where user_id=2;
Select * from users where length(name)>=5;
select * from products where category="electronics"
insert into products values(106,"eyeliner",300,"cosmetics");
update products set price=350 where product_id=106
delete from products where price is null;
select * from products where price > 1000;
select * from products where product_name like "s%";
select * from products order by price desc limit 3;
insert into products (product_id,product_name,price) values (107,"lipbalm",250);
update products set price=price*0.1;
select * from products where category in ("clothing","footwear");
select * from products where category not in ("mobile","laptop");
delete from products where category is null;
select * from products order by price desc;
update products set category="Home appliances" where product_id=2;
select * from products where product_name like "pro%";
select * from orders;
select * from orders where order_date=curdate();
insert into orders values(506,3,"2025-02-10","shipped");
update orders set status="shipped" where order_id=504;
delete from orders where status is null;
select * from orders where user_id in (1,2);
select * from orders where status not in ("shipped","delivered");
select * from orders order by order_date desc limit 5;
insert into orders (order_id,user_id,order_date) values(507,2,'2025-02-20');
select * from orders where order_date like "2025-01%";
update orders set order_date='2025-03-06' where order_id=505;
select * from orders order by order_id desc;
delete from orders where status="cancelled";
select * from orders where status is null;
update orders set status="pending";
select * from orders where order_id >3 and user_id <2;
select * from payments where amount>5000;
insert into payments values(9005,506,4000,"UPI","2025-03-10");
update payments set payment_method="cash" where payment_id=9004;
delete from payments where amount is null;
select * from payments where payment_method in ("upi","card");
select * from payments where payment_date like "2025-01%";
select * from payments order by amount limit 3;
insert into payments (payment_id,order_id,amount,payment_date) values(9006,504,8000,"2025-03-15");
update payments set amount=amount*0.05;
select * from payments where payment_method not in ("cash","upi");
delete from payments where order_id=504;
select * from payments order by payment_date;
update payments set amount=5000 where payment_id=9002;
select * from payments where amount is null;
truncate table payments;
select * from inventory;
select * from inventory where stock_status="In stock";
insert into inventory values(6,106,25,"out of stock");
update inventory set quantity=20 where inventory_id=3;
delete from inventory where quantity is null;
select * from inventory where quantity>50;
select * from inventory where product_id in (101,103,105);
select * from inventory where inventory_id not in (5,6,2);
insert into inventory(inventory_id,product_id,quantity) values(7,106,35);
select * from inventory order by quantity desc;
delete from inventory where stock_status is null;
update inventory set quantity=quantity+10;
select * from inventory where stock_status="low";
truncate table inventory;
select * from users;
select * from users where phone is null;
delete from users where email not like "%@%";