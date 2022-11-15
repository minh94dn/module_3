create database if not exists datHang;
use datHang;
create table phieu_xuat(
  so_px int auto_increment primary key, 
  ngay_xuat date
);
create table phieu_nhap(
  so_pn int auto_increment primary key, 
  ngay_nhap date
);
create table vat_tu(
  ma_vt varchar(45) primary key, 
  ten_vt varchar(45)
);
create table chi_tiet_phieu_xuat(
  phieu_xuat_so_px int, 
  vat_tu_ma_vt varchar(45), 
  don_gia_xuat varchar(45), 
  so_luong_xuat int, 
  primary key(phieu_xuat_so_px, vat_tu_ma_vt), 
  foreign key(phieu_xuat_so_px) references phieu_xuat(so_px), 
  foreign key(vat_tu_ma_vt) references vat_tu(ma_vt)
);
create table chi_tiet_phieu_nhap(
  phieu_nhap_so_px int, 
  vat_tu_ma_vt varchar(45), 
  don_gia_nhap varchar(45), 
  so_luong_nhap int, 
  primary key(phieu_nhap_so_px, vat_tu_ma_vt), 
  foreign key(phieu_nhap_so_px) references phieu_nhap(so_pn), 
  foreign key(vat_tu_ma_vt) references vat_tu(ma_vt)
);
create table nha_cc(
  ma_ncc varchar(45) primary key, 
  ten_ncc varchar(45), 
  dia_chi varchar(45)
);
create table sdt(
  ma_ncc varchar(45) primary key, 
  nha_cc_ma_ncc varchar(45), 
  foreign key(nha_cc_ma_ncc) references nha_cc(ma_ncc)
);
create table don_dh(
  ma_ncc int auto_increment primary key, 
  so_dh int, 
  ngay_dh date, 
  nha_cc_ma_ncc varchar(45), 
  foreign key(nha_cc_ma_ncc) references nha_cc(ma_ncc)
);
create table chi_tiet_don_dh(
  vat_tu_ma_vt varchar(45), 
  don_dh_ma_ncc int, 
  primary key(vat_tu_ma_vt, don_dh_ma_ncc), 
  foreign key(vat_tu_ma_vt) references vat_tu(ma_vt), 
  foreign key(don_dh_ma_ncc) references don_dh(ma_ncc)
);
