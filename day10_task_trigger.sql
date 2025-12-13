create database trigger_practice;
use trigger_practice;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(30),
    Stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 10),
(2, 'Mouse', 50),
(3, 'Keyboard', 30);

create table product_log(product_id int,product_name varchar(30),action varchar(30),action_date datetime);

Delimiter $$
create trigger  after_product_insert
after insert on products
for each row
begin
insert into product_log values(new.productID,new.productname,'Insert',now());
end $$
delimiter ;

insert into products (productId,productname,stock)values (4,'mobile',20);
select * from product_log;

create table product_audit(product_id int,old_product_name varchar(20),new_product_name varchar(20),old_stock int,new_stock int,action varchar(20),action_date datetime);
delimiter $$
create trigger after_product_update
after update on products
for each row
begin
insert into product_audit values(old.productid,old.productname,new.productname,old.stock,new.stock,'update',now());
end $$
delimiter ;
update products set stock=25 where productid=4; 
select * from product_audit;

create table delete_log(product_id int,product_name varchar(20),action varchar(20),action_date datetime);
delimiter $$
create trigger after_delete_log
after delete on products
for each row
begin
insert into delete_log values(old.productid,old.productname,'Delete',now());
end$$
delimiter ;
delete from products where productid=4;
select * from delete_log;