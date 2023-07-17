CREATE DATABASE quyenSach
CHARACTER SET "utf8mb4"
COLLATE "utf8mb4_general_ci";

USE quyenSach;

CREATE TABLE tuasach(
	id int auto_increment,
	tuasach text not null,
	tacgia varchar(150) not null,
	tomtat text not null,
	
	PRIMARY KEY (id)
);

CREATE TABLE dausach(
	id int auto_increment,
	ma_tuasach int not null,
	ngonngu varchar(100) not null,
	bia varchar(255) not null,
	trangthai varchar(100) not null,
	
	PRIMARY KEY (id)
);

CREATE TABLE cuonsach(
	id int auto_increment,
	ma_dausach int not null,
	tinhtrang varchar(150) not null,
	
	PRIMARY KEY (id)
);

ALTER TABLE dausach ADD CONSTRAINT Fk_ma_tuasach_dausach FOREIGN KEY (ma_tuasach) REFERENCES tuasach(id);
ALTER TABLE cuonsach ADD CONSTRAINT Fk_ma_dausach_cuonsach FOREIGN KEY (ma_dausach) REFERENCES dausach(id);

INSERT INTO tuasach 
VALUES (1, "còn được gọi là lời nói đầu hay lời giới thiệu", "Vo Dinh Nhan", "về mục đích, tôn chỉ, cách viết, hoàn cảnh ra đời,…"),
	(2, " Arun Sundarajan giải thích sự chuyển biến đến trạng thái mà ông mô tả là 'chủ nghĩa tư bản dựa trên đám đông' ", "Tan Loc", "về mục đích, tôn chỉ, cách viết, hoàn cảnh ra đời,…"),
	(3, "còn được gọi là lời nói đầu hay lời giới thiệu", "Nhu Y", "về mục đích, tôn chỉ, cách viết, hoàn cảnh ra đời,…");

INSERT INTO dausach 
VALUES (1, 1, "Viet Nam", "Day la bia 1", "chua duoc muon"),
	(2, 2, "Viet Nam", "Day la bia 2", "chua duoc muon"),
	(3, 2, "Viet Nam", "Day la bia 3", "chua duoc muon"),
	(4, 3, "Viet Nam", "Day la bia 4", "chua duoc muon"),
	(5, 1, "My", "Day la bia 1", "da muon"),
	(6, 1, "Thai Lan", "Day la bia 2", "chua duoc muon"),
	(7, 3, "Viet Nam", "Day la bia 3", "da muon"),
	(8, 3, "Viet Nam", "Day la bia 4", "chua duoc muon");
 
-- 1) 
CREATE PROCEDURE layToanBoTuaSach()
BEGIN
	SELECT * FROM tuasach;
END

CALL layToanBoTuaSach();

-- 2)
CREATE PROCEDURE layToanBoDauSach_TuaSach()
BEGIN
	SELECT * 
	FROM dausach
	JOIN tuasach ON dausach.ma_tuasach = tuasach.id
	ORDER BY dausach.id ASC;
END

CALL layToanBoDauSach_TuaSach();

-- 3)
CREATE PROCEDURE layThongTinNhungDauSachChuaDuocMuon()
BEGIN
	SELECT count(*)
	FROM dausach
	JOIN tuasach ON dausach.ma_tuasach = tuasach.id
	WHERE dausach.trangthai = "chua duoc muon";
END

CALL layThongTinNhungDauSachChuaDuocMuon();




