create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
  id int auto_increment primary key, 
  `name` varchar(45), 
  age int
);
create table `order`(
  id int auto_increment primary key, 
  date date, 
  total_price int, 
  customer_id int, 
  foreign key(customer_id) references customer(id)
);
create table product(
  id int auto_increment primary key, 
  `name` varchar(45), 
  price double
);
create table order_detail(
  product_id int, 
  order_id int, 
  qty varchar(45), 
  primary key(product_id, order_id), 
  foreign key(product_id) references product(id), 
  foreign key(order_id) references `order`(id)
);
