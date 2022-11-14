create database `class-management`;
create table class(
  id int primary key, 
  `name` varchar(45)
);
create table teacher(
  id int primary key, 
  `name` varchar(45), 
  age int, 
  country varchar(45)
);
select 
  * 
from 
  class;
select 
  * 
from 
  teacher;
