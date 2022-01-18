-- 7. Hiển thị danh sách học viên theo tên giảm dần
select * from student_manager order by student_name desc;

-- 8. Hiển thị danh sách học viên theo tuổi tăng dần
select * from student_manager order by age;

-- 9. Hiển thì số lượng học viên của mỗi lớp
select classes.class_name, count(*) from student_manager, classes
where classes.id_class = student_manager.classId
group by student_manager.classId, classes.class_name;

select classes.class_name, count(*) as 'Số lượng học sinh' from student_manager
join classes
on classes.id_class = student_manager.classId
group by student_manager.classId;

-- 10. Hiển thị lớp có học viên đông nhất
-- Cường: sử dụng thêm as để đổi tên và viết tên nặc danh
select cl.name as 'Lớp đông sinh viên nhất là : '
from `student-management`.students st,`student-management`.class cl
where st.IdClass = cl.idclass
group by st.IdClass, cl.idclass
having count(cl.name) >= (select max(t.tong)from (
select count(id) as tong from `student-management`.students
group by idclass) as t);

select classes.class_name from classes, student_manager
where classes.id_class = student_manager.classId
group by student_manager.classId
having count(classid) = (select min(count_student) from 
(select count(*) as count_student from student_manager
group by student_manager.classId) as count_table);

-- 11. Hiển thị lớp có học viên ít nhất: giống câu 10, đổi max thành min

-- 12. Thống kê theo address
select address, count(*) as 'count_address' from student_manager
group by address;

-- 13. Lớp có số học viên lớn hơn 1
select classes.class_name, count(*) as 'count_student' from student_manager, classes
where classes.id_class = student_manager.classId
group by student_manager.classId
having count(*) > 1;

-- 14. TP có học viên lớn hơn 1
select address, count(*) as 'count_address' from student_manager
group by address
having count(*) > 1;

-- 15. Học viên có tuổi lớn nhất
select student_name, age as 'age_max' from student_manager
where age = (select max(age) from student_manager);

-- 16. Học viên có tuổi nhỏ nhất: giống câu 15, đổi max thành min

-- 17. Xóa tất cả học viên có quê ở HN
delete from student_manager where address = "HN";

-- 18. Cập nhật giới tính của học viên có quê ở HN => nữ
update student_manager set sex = 0 where address = "HN";

-- 19. Hiển thị học viên có số tuổi lớn thứ 2
select * from student_manager 
where age = (select max(age) from student_manager 
where age < (select max(age) from student_manager));

-- 20. Giống câu 19, đổi max thành min




