 create table book (
 id int auto_increment primary key,
 book_name varchar(50) not null,
 price double not null,
 quantity int default 0,
 type_book int not null,
 author varchar(50) not null,
 date_create datetime
 );
 
 -- nhập liệu
 insert into book(`book_name`,`price`, `quantity`, `type_book`,`author`, `date_create`)
 values
 ("sách 1", 10000, 10, 1, "tác giả 1", "2021-09-15 15:15:15"),  -- yyyy-MM-DD
 ("sách 2", 20000, 14, 1, "tác giả 2", now()),
 ("sách 3", 30000, 25, 2, "tác giả 3", "2021-10-22"),
 ("sách 4", 15000, 26, 1, "tác giả 1", now()),
 ("sách 5", 12000, 55, 2, "tác giả 2", now()),
 ("sách 6", 25500, 51, 3, "tác giả 3", "2021-12-22"),
 ("sách 7", 10300, 18, 1, "tác giả 1", now()),
 ("sách 8", 22000, 35, 2, "tác giả 2", "2021-12-12"),
 ("sách 9", 10000, 50, 3, "tác giả 3", now()),
 ("sách 10", 22000, 22, 3, "tác giả 1", "2021-11-22");
 
 -- test dữ liệu của datetime
 insert into book(`book_name`,`price`, `quantity`, `author`, `date_create`)
 values
 ("sách 1", 10000, 10,  "tác giả 1", "2021-09-16 ");
 
 -- hiển thị tất cả
 select * from book;
 
 -- tổng tiền sách
 select sum(price * quantity) as 'sum_price' from book;
 
 -- quyển sách có giá cao nhất/thấp nhất
 select * from book where price = (select max(price) from book);
 select * from book where price = (select min(price) from book);
 
 -- đơn giá trung bình của sách type 1
 select avg(price) as 'trung binh don gia' from book where type_book = 1;
 
 -- sách theo tác giả
 select * from book where author = "tác giả 1";
 
 -- sách theo khoảng giá
 select * from book where price > 20000 and price < 30000;
 
 -- sách theo thể loại
 select * from book where type_book = 1;
 
 -- sách theo giá tiền 
  select * from book where price = 10000;
  
-- sách theo ngày
  select * from book where date_create = "2021-09-16";

-- thêm khóa ngoại
alter table book
add constraint type_fk foreign key (type_book) references type_book(id);

-- tên thể loại của quyển sách 1
select * from book
left join type_book
on book.type_book = type_book.id
union
select * from book
right join type_book
on book.type_book = type_book.id;

select * from book
join type_book
on book.type_book = type_book.id;

select * from book
inner join type_book
on book.type_book = type_book.id;

create table type_book (
id int auto_increment primary key,
type_name varchar(50) not null);

insert into type_book (`type_name`) value 
("sách khoa học"),
("sách tiểu thuyết"),
("sách giáo khoa");

select * from book;
select * from type_book;

-- trả ra các bản ghi của type_book có tham chiều từ book sang
select * from type_book where exists
(select * from book where book.type_book = type_book.id);

-- xóa các bản ghi của type_book không tồn tại trong bảng book (không có tham chiếu từ book sang)
delete from type_book where not exists
(select * from book where book.type_book = type_book.id);

-- join sử dụng group by để lấy đúng giá trị cần lấy: id và name của tye_book
select type_book.id, type_name from type_book
join book
on book.type_book = type_book.id
group by book.type_book;

-- join bình thường giữa 2 bảng
select * from type_book
join book
on book.type_book = type_book.id;
-- group by book.type_book;