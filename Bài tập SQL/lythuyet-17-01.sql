create table student1 (
id int auto_increment primary key,
student_name varchar(50) not null,
age int not null,
address varchar(50),
avarage_point double);

-- hiển thị tất cả sinh viên
select * from student1;

-- tạo dữ liệu
insert into student1 (`student_name`, `age`, `address`, `avarage_point`)
value
("A", 20, "HN", 6.7),
("B", 22, "HN", 7.7),
("C", 21, "VP", 9.2),
("D", 24, "HB", 4.3);

-- hiển thị sinh viên có điểm cao nhất/thấp nhất: đổi max thành min
select * from student1 where avarage_point = (select max(avarage_point) from student1);
select * from student1 where avarage_point = (select min(avarage_point) from student1);

-- xóa 1 sinh viên theo tên
delete from student1 where student_name = "D";

-- tìm kiếm 1 sinh viên theo tên
select * from student1 where student_name = "A";

-- thêm cột giới tính
alter table student1
add column gender varchar(20) not null;

-- set tất cả giới tính là nam
update student1 set gender = "Nam";
update student1 set gender = "Nữ" where id = 2;

-- hiển thị tất cả theo giới tính
select * from student1 where gender = "Nam";
select * from student1 where gender = "Nữ";

-- sắp xếp theo điểm trung bình
select * from student1 order by avarage_point;
select * from student1 order by avarage_point desc;
