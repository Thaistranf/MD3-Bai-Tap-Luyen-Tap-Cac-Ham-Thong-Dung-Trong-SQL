use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject
where Credit = (select max(Credit) from subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.SubID, subject.SubName, subject.Credit, subject.Status, mark.Mark
from subject 
left join mark on subject.SubID = mark.SubID
where Mark = (select max(Mark) from mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.StudentID, student.StudentName, student.Address, student.Phone, student.Status, student.ClassID, avg(Mark)
from student
join mark on student.StudentID = mark.StudentID
group by student.StudentID, student.StudentName, student.Address, student.Phone, student.Status, student.ClassID
order by avg(Mark) desc;