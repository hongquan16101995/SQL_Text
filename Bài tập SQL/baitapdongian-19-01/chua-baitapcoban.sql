create database baitap4;

use baitap4;

create table loaihang (
maloaihang int auto_increment primary key,
tenloaihang varchar(50) not null);

create table nhacungcap (
macongty int auto_increment primary key,
tencongty varchar(50) not null,
tengiaodich varchar(50) not null,
diachi  varchar(50) not null,
dienthoai varchar(50) not null,
fax varchar(50) not null,
email varchar(50) not null);

create table khachhang (
makhachhang int auto_increment primary key,
tencongty varchar(50) not null,
tengiaodich varchar(50) not null,
diachi  varchar(50) not null,
dienthoai varchar(50) not null,
fax varchar(50) not null,
email varchar(50) not null);

create table nhanvien (
manhanvien  int auto_increment primary key,
tennhanvien varchar(50) not null,
ngaysinh date not null,
ngaybatdaulamviec date not null,
diachi varchar(50) not null,
dienthoai varchar(50) not null,
luongcoban double not null,
phucap double not null);

create table mathang(
mahang int auto_increment primary key,
tenhang varchar(50) not null,
soluong int not null,
donvitinh varchar(20) not null,
giahang double not null,
macongty int not null,
maloaihang int not null,
foreign key (macongty) references nhacungcap(macongty),
foreign key (maloaihang) references loaihang(maloaihang));

create table dondathang(
sohoadon int auto_increment primary key,
ngaydathang date not null,
ngaygiaohang date not null,
ngaychuyenhang date not null,
noigiaohang varchar(50) not null,
makhachhang int not null,
manhanvien int not null,
foreign key (makhachhang) references khachhang(makhachhang),
foreign key (manhanvien) references nhanvien(manhanvien));

create table chitietdathang(
sohoadon int not null,
mahang int not null,
giaban double not null,
soluong int not null,
mucgiamgia double,
primary key (sohoadon, mahang));

alter table chitietdathang
add constraint foreign key (sohoadon) references dondathang(sohoadon),
add constraint foreign key (mahang) references mathang(mahang);

-- 1. họ tên, địa chỉ, ngày làm việc của nhân viên
select tennhanvien, diachi, year(ngaybatdaulamviec) as 'namlamviec' from nhanvien;

-- 2. mặt hàng có giá lớn hơn 70000, số lượng ít hơn 25
select mahang, tenhang from mathang where giahang > 70000 and soluong < 25;

-- 3. mặt hàng do ai cung cấp
select mathang.tenhang, nhacungcap.tencongty from mathang, nhacungcap
where mathang.macongty = nhacungcap.macongty;

select mathang.tenhang, nhacungcap.tencongty from mathang
join nhacungcap on mathang.macongty = nhacungcap.macongty;

-- 4. tiền lương
select tennhanvien, (luongcoban + phucap) as 'tienluong' from nhanvien;

-- 5. tăng lương nhân viên có số lương >= 10
update nhanvien set luongcoban = (luongcoban * 1.5) 
where manhanvien = (select manhanvien from test where tongsoluong >= 10);

create view test as 
select nhanvien.manhanvien, sum(chitietdathang.soluong) as 'tongsoluong' from nhanvien
join dondathang on dondathang.manhanvien = nhanvien.manhanvien
join chitietdathang on dondathang.sohoadon = chitietdathang.sohoadon
-- where year(dondathang.ngaygiaohang) = 2022
group by nhanvien.manhanvien;

-- 8. nhân viên bán hàng nhiều nhất và số lượng hàng
select nhanvien.tennhanvien, max(test.tongsoluong) as 'nhieunhat' from nhanvien, test
where nhanvien.manhanvien = test.manhanvien;

-- 9. tăng phụ cấp cho nhân viên bán hàng nhiều nhất
update nhanvien set phucap = (phucap * 1.5) 
where manhanvien = (select manhanvien from test 
where tongsoluong = (select max(tongsoluong) from test));

-- 6. đếm mặt hàng được mua 1 lần trong năm 2022
select mathang.mahang from mathang
join chitietdathang on chitietdathang.mahang = mathang.mahang
join dondathang on dondathang.sohoadon = chitietdathang.sohoadon
where year(dondathang.ngaydathang) = 2022
group by chitietdathang.mahang
having count(chitietdathang.mahang) = 1;

-- 7. xóa khách hàng chưa đặt hàng
delete from khachhang where not exists
(select * from  dondathang 
where dondathang.makhachhang = khachhang.makhachhang);

-- 10. kiểm tra bán hàng
create view test2 as
select mathang.mahang, mathang.tenhang, dondathang.ngaydathang, chitietdathang.soluong from mathang
join chitietdathang on chitietdathang.mahang = mathang.mahang
join dondathang on dondathang.sohoadon = chitietdathang.sohoadon;

select test2.mahang, test2.tenhang,
sum(case month(ngaydathang) when 1 then test2.soluong else 0 end) as t1,
sum(case month(ngaydathang) when 2 then test2.soluong else 0 end) as t2
from test2 group by test2.mahang;
