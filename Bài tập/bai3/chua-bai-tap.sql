-- C3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ

select dongxe from dongxe where sochongoi > 5;

-- C4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
-- thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
-- thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km

select dangkycungcap.madkcc, nhacungcap.manhacc, nhacungcap.tennhacc from nhacungcap
join dangkycungcap on dangkycungcap.manhacc = nhacungcap.manhacc
join dongxe on dangkycungcap.dongxe = dongxe.dongxe 
join mucphi on dangkycungcap.mamp = mucphi.mamp
where (dongxe.hangxe = "Toyota" and mucphi.dongia = 15000)
or (dongxe.hangxe = "KIA" and mucphi.dongia = 20000);

-- C5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
-- cấp hoặc giảm dần theo mã số thuế

select * from nhacungcap
order by tennhacc asc, masothue desc;

-- C6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
-- yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
-- cung cấp là “20/11/2015”

select count(dangkycungcap.manhacc) as 'solandangky', nhacungcap.tennhacc from dangkycungcap
join nhacungcap on nhacungcap.manhacc = dangkycungcap.manhacc
where ngaybatdaucungcap = "2015/11/20"
group by dangkycungcap.manhacc;

-- C7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
-- chỉ được liệt kê một lần

select hangxe from dongxe
group by hangxe;

-- C8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
-- HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
-- tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
-- tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra

select dangkycungcap.madkcc, dangkycungcap.ngaybatdaucungcap, dangkycungcap.ngayketthuccungcap,
nhacungcap.manhacc, nhacungcap.tennhacc, nhacungcap.diachi, nhacungcap.masothue,
loaidichvu.tenloaidv, mucphi.dongia, dongxe.hangxe from dangkycungcap
join loaidichvu on dangkycungcap.maloaidv = loaidichvu.maloaidv
join dongxe on dangkycungcap.dongxe = dongxe.dongxe
join mucphi on dangkycungcap.mamp = mucphi.mamp
right join nhacungcap on dangkycungcap.manhacc = nhacungcap.manhacc;

-- dùng toàn bộ left join: Cường
select DK.MaDKCC, NCC.MaNhaCC, NCC.TenNhaCC, NCC.DiaChi, NCC.MaSoThue, DV.TenLoaiDV , DK.NgayBatDauCungCap, DK.NgayKetThucCungCap , dongxe.HangXe
from nhacungcap NCC 
left join dangkycungcap DK on DK.MaNhaCC = NCC.MaNhaCC
left join loaidichvu DV on DK.MaLoaiDV = DV.MaLoaiDV 
left join dongxe on DK.DongXe = dongxe.DongXe
left join mucphi on DK.mamp = mucphi.mamp;


-- C9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
-- thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”

select nhacungcap.manhacc, nhacungcap.tennhacc from nhacungcap
join dangkycungcap on dangkycungcap.manhacc = nhacungcap.manhacc
where dangkycungcap.dongxe = "Hiace" or dangkycungcap.dongxe = "Cerato"
group by nhacungcap.manhacc;

-- C10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
-- phương tiện lần nào cả

-- alias: đặt tên nặc danh cho 1 cột hoặc 1 bảng để dễ truy xuất hơn
-- xác nhận 1 giá trị có phải null hay không: giá trị = null; is null: nếu muốn là null; is not null: nếu muốn là không null
select test.manhacc, test.tennhacc from 
(select nhacungcap.manhacc, nhacungcap.tennhacc, dangkycungcap.madkcc as madk from nhacungcap
left join dangkycungcap on nhacungcap.manhacc = dangkycungcap.manhacc) as test
where test.madk is null;

-- k cần subquery: a Tiến
select nhacungcap.manhacc, nhacungcap.tennhacc from nhacungcap
left join dangkycungcap on nhacungcap.manhacc = dangkycungcap.manhacc
where dangkycungcap.madkcc is null;

-- dùng exists
select nhacungcap.manhacc, nhacungcap.tennhacc from nhacungcap
where not exists (select dangkycungcap.manhacc from dangkycungcap 
where dangkycungcap.manhacc = nhacungcap.manhacc);