use furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien as nv where substring_index(nv.ho_ten, ' ',-1) like 'H%' or substring_index(nv.ho_ten, ' ',-1) like 'T%' or substring_index(nv.ho_ten, ' ',-1) like 'K%';

