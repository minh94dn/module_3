create database student;
use student;
create table class(
id int auto_increment primary key,
`name` varchar(45)
);

create table student(
id int auto_increment primary key,
`name` varchar(45),
gender bit(1),
birthday date,
 email varchar(45),
 `point` int,
 username varchar(45),
 class_id int,
 foreign key(class_id) references class(id)
);

insert into class
values (1,"c1121g1"),
 (2,"c1221g1"),
 (3,"a082lil"),
(4,"a092lil");

insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (1,"nguyen ngoc cu",1,"1981/12/12",null,8,"cunn",1);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (2,"le hai chung",1,"1981/12/12",null,5,"cunn",1);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (3,"hoang huu hoang",1,"1990/12/12",null,6,"cunn",2);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (4,"dau dung",1,"1987/12/12",null,8,"cunn",1);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (5,"ta dinh huynh",1,"1981/12/12",null,7,"cunn",2);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (6,"nguyen minh hai",1,"1987/12/12",null,9,"cunn",1);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (7,"tran van nam",1,"1989/12/12",null,4,"cunn",2);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (8,"vo minh hieu",1,"1981/12/12",null,3,"cunn",1);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (9,"le xuan ky",1,"1981/12/12",null,7,"cunn",2);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (10,"le minh vu",1,"1981/12/12",null,7,"cunn",1);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (15,"nguyen van a",1,"1981/12/12",null,8,null,null);
insert into student (id,`name`,gender,birthday,email,`point`,username,class_id)
value (16,"tran van b",1,"1981/12/12",null,5,null,null);

select s.*,c.name as class_name from student s 
inner join class c on s.class_id = c.id;
select s.*, ifnull(c.name, 'chưa có lớp') as class_name from student s
left join class c on s.class_id = c.id;
select * from student where `name` like "% hai" or `name` like "% huynh";
select * from student where (`point`>5);
select * from student where `name` like "nguyen %";
select distinct(point) as loai_diem from student;
select * from student s
join class c on s.class_id=c.id where c.name='c1121g1'
order by point desc, s.name

