create database baitap_17_01;

use baitap_17_01;

 create table candy (
 id int auto_increment primary key,
 candy_name varchar(50) not null,
 color varchar(20) not null,
 price double not null,
 quantity int default 0);
 
 -- nhập liệu
 insert into candy(`candy_name`, `color`, `price`, `quantity`)
 values
 ("kẹo 1", "blue", 10000, 10),
 ("kẹo 2", "yellow", 20000, 14),
 ("kẹo 3", "blue", 30000, 25),
 ("kẹo 4", "green", 15000, 26),
 ("kẹo 5", "pink", 12000, 55),
 ("kẹo 6", "grey", 25500, 51),
 ("kẹo 7", "red", 10300, 18),
 ("kẹo 8", "black", 22000, 35),
 ("kẹo 9", "red", 10000, 50),
 ("kẹo 10", "green", 22000, 22);
 
  insert into candy(`candy_name`, `color`, `price`)
 values
 ("kẹo 1", "blue", 10000);
 
 -- hiển thi full
 select * from candy;
 
 -- hiển thị theo max/min price
 select * from candy where price = (select max(price) from candy);
 select * from candy where price = (select min(price) from candy);
 
 -- hiển thị theo số lượng 10 -> 30
 select * from candy where quantity > 10 and quantity < 30;
 
 -- hiển thị theo màu
 select * from candy where color = "red";
 
 -- thay đổi kẹo màu đỏ thành màu vàng
 update candy set color = "yellow" where color = "red";
 
 -- tính giá kẹo trung bình
 select avg(price) as 'đơn giá trung bình' from candy;
 
 -- tổng tiền để mua kẹo
 select sum(price * quantity) as sum_price from candy;
 
 -- thay đổi giá kẹo màu blue
 update candy set price = 100000 where color = "blue";