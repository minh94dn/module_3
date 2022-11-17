create database if not exists sale_management;
use sale_management;

create table customer(
  c_id int primary key, 
  `name` varchar(25), 
  c_age tinytext
);

create table `order`(
  o_id int primary key, 
  c_id int, 
  o_date datetime, 
  o_total_price int, 
  foreign key(c_id) references customer(c_id)
);

create table product(
  p_id int primary key, 
  p_name varchar(25), 
  p_price int
);

create table order_detail(
  o_id int, 
  p_id int, 
  od_qty int, 
  foreign key(p_id) references product(p_id), 
  foreign key(o_id) references `order`(o_id)
);

insert into customer 
values 
  (1, 'Minh Quan', 10), 
  (2, 'Ngoc Oanh', 20), 
  (3, 'Hong Ha', 50);
  
insert into `order` 
values 
  (1, 1, '2006/3/21', null), 
  (2, 2, '2006/3/23', null), 
  (3, 1, '2006/3/16', null);
  
insert into product 
values 
  (1, 'May Giat', 3), 
  (2, 'Tu Lanh', 5), 
  (3, 'Dieu Hoa', 7), 
  (4, 'Quat', 1), 
  (5, 'Bep Dien', 2);
  
insert into order_detail 
values 
  (1, 1, 3), 
  (1, 3, 7), 
  (1, 4, 2), 
  (2, 1, 1), 
  (3, 1, 8), 
  (2, 5, 4), 
  (2, 3, 3);
  
  -- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
  * 
from 
  `order`;
  
  -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select 
  c.`name`, 
  p.p_name 
from 
  order_detail as od 
  inner join `order` as o on o.o_id = od.o_id 
  inner join customer as c on c.c_id = o.c_id 
  inner join product as p on p.p_id = od.p_id;
  
  -- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
  c.`name` 
from 
  customer as c 
  left join `order` as o on c.c_id = o.c_id 
where 
  o.o_id is null;
  
  -- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select 
  o.o_id, 
  o.o_date, 
  (od.od_qty * p.p_price) as total_price 
from 
  order_detail as od 
  inner join `order` as o on o.o_id = od.o_id 
  inner join product as p on p.p_id = od.p_id 
group by 
  o.o_id;