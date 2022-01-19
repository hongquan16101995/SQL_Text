create database baitap_19_01;

create table product (
id int auto_increment primary key,
product_name varchar(50) not null,
nha_cung_cap varchar(50) not null,
price double not null,
quantity int not null,
date_create date not null,
category_id int,
foreign key (category_id) references category(id));

create table category (
id int auto_increment primary key,
category_name varchar(50) not null);

select * from product;
select * from category;

-- tạo view
create view view_price as 
select product_name, price from product;

select * from view_price;

update view_price set product_name = "cá mập" where price = 100000;

-- tạo stored procedure
DELIMITER //
create procedure cal_price()
begin
	select * from product;
end; 
DELIMITER;
call cal_price();

-- tạo procedure có tham số: IN
DELIMITER//
create procedure cal_price1(IN so_luong int)
begin
	select (price * so_luong) from product;
end;
DELIMITER;
call cal_price1(10);

-- tạo procedure có tham số: OUT
DELIMITER//
create procedure cal_price2(OUT sum int)
begin
	select sum(price* quantity) into sum from product;
end;
DELIMITER;
call cal_price2(@sum_price);
select @sum_price;

-- tạo procedure có tham số: INOUT
DELIMITER//
create procedure cal_price3(INOUT sum int,  IN new_quantity int)
begin
    set sum = sum + (select sum(price * new_quantity) as test_sum from product where id = 1);
end;
DELIMITER;
set @sum_price = 100;
call cal_price3(@sum_price, 10);
call cal_price3(@sum_price, 10);
call cal_price3(@sum_price, 10);
select @sum_price;

-- test procedure
DELIMITER //
create procedure test_price()
begin
	select * from category;
	select * from product;
end; 
DELIMITER;
call test_price();
