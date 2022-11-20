create database demo;
use demo;

create table products(
  id int auto_increment primary key, 
  product_code int, 
  product_name varchar(45), 
  product_price double, 
  product_amount int, 
  product_description varchar(45), 
  product_status bit
);

insert into products(
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (1, 'Bàn', 100, 5, 'Tốt', 0), 
  (2, 'Ghế', 50, 10, 'Đẹp', 1), 
  (3, 'Tủ', 500, 3, 'Bền', 1);
  
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_product_code on products (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create unique index i_product_name_price on products (product_name, product_price);

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
  select 
  * 
from 
  w_product;
  
-- Tiến hành sửa đổi view
update 
  w_product 
set 
  product_price = 200 
where 
  product_name = 'Bàn';
  
-- Tiến hành xoá view
drop 
  view w_product;
  
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // 
create procedure sp_get_all_product() 
begin 
select 
  * 
from 
  products;
end //
delimiter ;
call sp_get_all_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter // 
create procedure sp_add_product(
  in `code` int, 
  in `name` varchar(45), 
  in price double, 
  in amount int, 
  in `description` varchar(45), 
  in `status` bit
) 
begin 
insert into products (
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) value (
  `code`, `name`, price, amount, `description`, 
  `status`
);
end // 
delimiter ;
call sp_add_product(4, 'Gương', 20, 2, 'Bền', 1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
 create procedure sp_set_product(in p_id int) 
 begin 
update 
  products 
set 
  product_name = 'Máy Tính' 
where 
  id = p_id;
end // 
delimiter ;
call sp_set_product(1);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product (in p_id int)
begin 
delete from 
  products 
where 
  id = p_id;
end // 
delimiter ;
call sp_delete_product (1);

