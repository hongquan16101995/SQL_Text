/*Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ*/
select *
from dongxe
where sochongoi >= 5;
/*Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
*/
select NhaCungCap.MaNhaCC,TenNhaCC, SoDT, MaSoThue
from NHACUNGCAP left join DangKyCungCap on NhaCungCap.MaNhaCC = DangKyCungCap.MaNhaCC left join DongXe on DangKyCungCap.DongXe = DongXe.DongXe left join MucPhi on DangKyCungCap.MaMP = MucPhi.MaMP
where (HangXe = 'Toyota' and DonGia = 15000) or (HangXe = 'KIA' and DonGia = 20000);
/*Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế*/
select *
from NhaCungCap
order by TenNhaCC asc, masothue desc;
/*Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
cung cấp là “20/11/2015”
*/
select tennhacc, count(nhacungcap.manhacc) as solan
from nhacungcap left join dangkycungcap on dangkycungcap.manhacc = nhacungcap.manhacc
where ngaybatdaucungcap = '2015/11/20'
group by tennhacc;

/*
Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
chỉ được liệt kê một lần
*/
select hangxe
from dongxe
group by hangxe;