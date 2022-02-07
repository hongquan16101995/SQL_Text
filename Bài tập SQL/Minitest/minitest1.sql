create database minitest;

use minitest;

create table loaitour(
id int auto_increment primary key,
maloai varchar(20) not null,
tenloai varchar(50) not null);

create table thanhpho(
id int auto_increment primary key,
tenthanhpho varchar(50) not null);

create table diemdulich(
id int auto_increment primary key,
tendiemden varchar(50) not null,
mota longtext,
giatrungbinh double,
thanhpho_id int not null,
foreign key (thanhpho_id) references thanhpho(id));

create table khachhang(
id int auto_increment primary key,
name varchar(20) not null,
socancuoc varchar(20) not null,
namsinh year not null,
thanhpho_id int not null,
foreign key (thanhpho_id) references thanhpho(id));

create table tour(
id int auto_increment primary key,
matour varchar(20) not null,
loaitour_id int not null,
giadiemden double not null,
ngaybatdau date not null,
ngayketthuc date not null,
foreign key (loaitour_id) references loaitour(id));

create table hoadon(
id int auto_increment primary key,
tour_id int not null,
khachhang_id int not null,
trangthai varchar(10) not null,
foreign key (tour_id) references tour(id),
foreign key (khachhang_id) references khachhang(id));

alter table tour
add column diemdulich_id int,
add constraint foreign key (diemdulich_id) references diemdulich(id);

-- nhập liệu
insert into loaitour (`maloai`,`tenloai`) values
('loai1', 'binhthuong'),
('loai2', 'vip');

insert into thanhpho (`tenthanhpho`) values
('Khánh Hòa'),('Lào Cai'), ('Hà Nội'),('Đà Nẵng'), ('Ninh Bình');

insert into diemdulich (`tendiemden`,`giatrungbinh`, `thanhpho_id`) values
('Nha Trang', '50000', 1),
('Sapa', '30000', 2),
('Ba Vì', '20000', 3),
('Hội An', '40000', 4),
('Tràng An', '20000', 5);

insert into khachhang (`name`,`socancuoc`, `namsinh`, `thanhpho_id`) values
('Toàn', '123456789', 1999,  1),
('Hoàng', '123452789', 1995, 2),
('Tuấn', '123456289', 1996, 3),
('Thủy', '113456789', 1998, 5),
('Tùng', '123486789', 1994, 4),
('Mạnh', '132456789', 1999, 1),
('Huy', '129456789', 1997, 2),
('Hoa', '120256789', 1992, 3),
('Tú', '123407789', 1995, 4),
('Lan', '123056789', 1994, 5);

insert into tour (`matour`,`loaitour_id`, `giadiemden`, `ngaybatdau`, `ngayketthuc`) values
('T01', '1', 100000, '2020-03-01', '2020-03-15'),
('T02', '1', 110000, '2020-03-03', '2020-03-15'),
('T03', '1', 200000, '2020-03-28', '2020-04-15'),
('T04', '2', 250000, '2020-04-01', '2020-04-15'),
('T05', '2', 300000, '2020-04-01', '2020-04-15'),
('T06', '1', 350000, '2020-04-28', '2020-05-14'),
('T07', '2', 500000, '2020-02-25', '2020-04-01'),
('T08', '2', 2000000, '2020-02-01', '2020-03-01'),
('T09', '2', 50000000, '2020-06-01', '2020-06-05'),
('T10', '2', 50000000,'2020-08-01', '2020-08-05');

insert into hoadon (`tour_id`,`khachhang_id`, `trangthai`) values
('1', '1', 'Đang đi'),
('1', '2', 'Đang đi'),
('2', '3', 'Đang đi'),
('3', '4', 'Đã xong'),
('4', '1', 'Đang đi'),
('3', '3', 'Đã xong'),
('5', '6', 'Đang đi'),
('8', '7', 'Chuẩn bị'),
('9', '2', 'Chuẩn bị'),
('6', '2', 'Đang đi');

-- thống kê số lương tour và thu nhập của các điểm du lịch
select diemdulich.tendiemden, if((sum(tour.giadiemden)) is null, 0 ,sum(tour.giadiemden)) as 'thunhap'  from diemdulich
left join tour on tour.thanhpho_id = diemdulich.id
left join hoadon on hoadon.tour_id = tour.id
group by diemdulich.tendiemden;

-- thống kê số lương tour và thu nhập của các thành phố
select thanhpho.tenthanhpho, sum(tour.giadiemden)  as 'thunhap' from thanhpho
join diemdulich on diemdulich.thanhpho_id = thanhpho.id
join tour on tour.diemdulich_id = diemdulich.id
join hoadon on hoadon.tour_id = tour.id
group by thanhpho.tenthanhpho;

-- tính số tour start trong tháng 3-2020
select count(ngaybatdau) as 'batdautrongthang3-2020' from tour
where month(ngaybatdau) = 3 and year(ngaybatdau) = 2020;

-- tính số tour end trong tháng 4-2020
select count(ngayketthuc) as 'ketthuctrongthang4-2020' from tour
where month(ngayketthuc) = 4 and year(ngayketthuc) = 2020;

-- tổng thu nhập các loại tour
select loaitour.id, loaitour.maloai, loaitour.tenloai, sum(tour.giadiemden) as TongThuNhap from loaitour
join tour on tour.loaitour_id = loaitour.id
join hoadon on hoadon.tour_id = tour.id
group by loaitour.id;

-- tạo view
create view test_max as
select khachhang_id, count(khachhang_id) as tongso from hoadon
group by khachhang_id;

-- khách hàng có nhiều tour nhất
select khachhang.name from khachhang
join test_max on test_max.khachhang_id = khachhang.id
where tongso = (select max(tongso) from test_max);

-- xóa khách hàng chưa đi lần nào
delete from khachhang where not exists
(select * from hoadon where hoadon.khachhang_id = khachhang.id);
