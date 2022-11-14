create database `my_database1`;
drop database `my_database1`;
create database `student-management`;
create table `student-management`.`student`(
`id` int not null,
`name` varchar(45) null,
`age` int null,
`country` varchar(45) null,
primary key (`id`));
drop database `student-management`;