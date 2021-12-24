﻿CREATE DATABASE QuanLiCaPhe
GO

USE QuanLiCaPhe
GO

--MonAn
--BanAn
--PhanLoaiMonAn
--Account
--HoaDon
--ThongTinHoaDon

CREATE TABLE BANAN
(
	SoBan INT IDENTITY PRIMARY KEY,
	TenBan NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	TrangThai NVARCHAR(100) NOT NULL, --Trống, có người, đã được đặt
)
GO

CREATE TABLE TAIKHOAN
(
	TenHienThi NVARCHAR(100) NOT NULL DEFAULT N'Admin',
	TenDangNhap NVARCHAR(100) PRIMARY KEY,
	MatKhau NVARCHAR(1000) NOT NULL,
	LoaiTaiKhoan INT NOT NULL DEFAULT 0, --1:admin, 0:nhân viên
)
GO

CREATE TABLE PHANLOAIMONAN
(
	ID INT IDENTITY PRIMARY KEY,
	Loai NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
CREATE TABLE MONAN
(
	ID INT IDENTITY PRIMARY KEY,
	TenMon NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	IDPhanLoai INT 
	FOREIGN KEY REFERENCES dbo.PHANLOAIMONAN(ID) NOT NULL,
	Gia FLOAT DEFAULT 0 NOT NULL,

	FOREIGN KEY (IDPhanLoai) REFERENCES dbo.PHANLOAIMONAN
)
GO

CREATE TABLE  HOADON
(
	ID INT IDENTITY PRIMARY KEY,
	NgayVao DATE DEFAULT GETDATE() NOT NULL,
	NgayRa DATE,
	IDBan INT 
	FOREIGN KEY REFERENCES dbo.BANAN(SoBan) NOT NULL,
	TrangThai INT NOT NULL DEFAULT 0, --1:Đã Thanh Toán, 0: Chưa Thanh Toán.


)
GO

CREATE TABLE THONGTINHOADON
(
	ID INT IDENTITY PRIMARY KEY,
	IDHoaDon INT NOT NULL,
	IDMonAn INT NOT NULL,
	SoLuong INT NOT NULL DEFAULT 0

	FOREIGN KEY (IDHoaDon) REFERENCES dbo.HOADON(ID),
	FOREIGN KEY (IDMonAn) REFERENCES dbo.MONAN(ID),
)
GO