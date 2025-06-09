CREATE DATABASE QuanLyRapChieuPhim;
GO

USE QuanLyRapChieuPhim;
GO

CREATE TABLE HeThongRap (
    ma_he_thong_rap INT PRIMARY KEY,
    ten_he_thong_rap NVARCHAR(255),
    logo VARCHAR(255)
);
GO

CREATE TABLE CumRap (
    ma_cum_rap INT PRIMARY KEY,
    ten_cum_rap NVARCHAR(255),
    dia_chi NVARCHAR(255),
    ma_he_thong_rap INT,
    FOREIGN KEY (ma_he_thong_rap) REFERENCES HeThongRap(ma_he_thong_rap)
);
GO

CREATE TABLE RapPhim (
    ma_rap INT PRIMARY KEY,
    ten_rap NVARCHAR(255),
    ma_cum_rap INT,
    FOREIGN KEY (ma_cum_rap) REFERENCES CumRap(ma_cum_rap)
);
GO

CREATE TABLE Phim (
    ma_phim INT PRIMARY KEY IDENTITY(1,1),
    ten_phim NVARCHAR(255),
    trailer VARCHAR(255),
    hinh_anh VARCHAR(255),
    mo_ta NVARCHAR(MAX),
    ngay_khoi_chieu DATE,
    danh_gia INT,
    hot BIT,
    dang_chieu BIT,
    sap_chieu BIT,
    dien_vien_chinh NVARCHAR(255),
    dao_dien NVARCHAR(255)
);
GO

CREATE TABLE Banner (
    ma_banner INT PRIMARY KEY,
    ma_phim INT,
    hinh_anh VARCHAR(255),
    FOREIGN KEY (ma_phim) REFERENCES Phim(ma_phim)
);
GO

CREATE TABLE TheLoai (
    ma_the_loai INT PRIMARY KEY,
    ten_the_loai NVARCHAR(100)
);
GO

CREATE TABLE Phim_TheLoai (
    ma_phim INT,
    ma_the_loai INT,
    PRIMARY KEY (ma_phim, ma_the_loai),
    FOREIGN KEY (ma_phim) REFERENCES Phim(ma_phim),
    FOREIGN KEY (ma_the_loai) REFERENCES TheLoai(ma_the_loai)
);
GO

CREATE TABLE NguoiDung (
	ma_nguoi_dung INT PRIMARY KEY IDENTITY(1,1),
	ten_tai_khoan NVARCHAR(255) UNIQUE,
    ho_ten NVARCHAR(255),
    email VARCHAR(255),
    so_dt VARCHAR(20),
    mat_khau VARCHAR(255),
    loai_nguoi_dung VARCHAR(50)
);
GO

CREATE TABLE LichChieu (
    ma_lich_chieu INT identity(1,1) PRIMARY KEY,
    ma_rap INT,
    ma_phim INT,
    ngay_gio_chieu DATETIME,
    FOREIGN KEY (ma_rap) REFERENCES RapPhim(ma_rap),
    FOREIGN KEY (ma_phim) REFERENCES Phim(ma_phim)
);
GO

CREATE TABLE Ghe (
    ma_ghe INT PRIMARY KEY,
    ten_ghe VARCHAR(10),
    loai_ghe NVARCHAR(50),
    ma_rap INT,
    FOREIGN KEY (ma_rap) REFERENCES RapPhim(ma_rap)
);
GO

CREATE TABLE DatVe (
    tai_khoan INT,
    ma_lich_chieu INT,
    ma_ghe INT,
    gia_ve INT,
    create_at DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (tai_khoan, ma_lich_chieu, ma_ghe),
    FOREIGN KEY (tai_khoan) REFERENCES NguoiDung(ma_nguoi_dung),
    FOREIGN KEY (ma_lich_chieu) REFERENCES LichChieu(ma_lich_chieu),
    FOREIGN KEY (ma_ghe) REFERENCES Ghe(ma_ghe)
);
GO

CREATE TABLE BinhLuan (
    ma_binh_luan INT PRIMARY KEY IDENTITY(1,1),
    ma_nguoi_dung INT NOT NULL,
    ma_phim INT NOT NULL,
    noi_dung NVARCHAR(MAX) NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE(),
    trang_thai BIT DEFAULT 1,
    FOREIGN KEY (ma_nguoi_dung) REFERENCES NguoiDung(ma_nguoi_dung),
    FOREIGN KEY (ma_phim) REFERENCES Phim(ma_phim)
);
GO
go 
CREATE TABLE YeuThich (
    ma_yeu_thich INT identity(1,1),
    ma_nguoi_dung INT,
    ma_phim INT,
    PRIMARY KEY (ma_yeu_thich),
    FOREIGN KEY (ma_nguoi_dung) REFERENCES NguoiDung(ma_nguoi_dung),
    FOREIGN KEY (ma_phim) REFERENCES Phim(ma_phim)
);
GO
