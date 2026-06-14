/* ============================================================================
   QL_Watsons - Database Structure
   Chỉ chứa cấu trúc bảng, stored procedures, views, indexes
============================================================================ */

IF DB_ID(N'QL_Watsons') IS NULL
    CREATE DATABASE QL_Watsons;
GO

USE QL_Watsons;
GO

SET NOCOUNT ON;
GO

-- ============================================================================
-- I. DỌN DẸP
-- ============================================================================
PRINT N'I. Đang dọn dẹp CSDL cũ (nếu có)...';

-- Disable tất cả FK constraints trước khi drop
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';

DECLARE @sql NVARCHAR(MAX) = '';

-- Drop all tables
SELECT @sql += 'DROP TABLE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';'
FROM sys.tables;
IF @sql != '' EXEC sp_executesql @sql;

SET @sql = '';
SELECT @sql += 'DROP VIEW ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';'
FROM sys.views;
IF @sql != '' EXEC sp_executesql @sql;

SET @sql = '';
SELECT @sql += 'DROP PROCEDURE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';'
FROM sys.procedures;
IF @sql != '' EXEC sp_executesql @sql;
GO

-- ============================================================================
-- II. TẠO CÁC BẢNG CƠ BẢN
-- ============================================================================

PRINT N'II. Đang tạo các bảng Master Data...';
CREATE TABLE dbo.DonViTinh (
    MaDonVi NVARCHAR(10) PRIMARY KEY, 
    TenDonVi NVARCHAR(50) NOT NULL
);

CREATE TABLE dbo.LoaiSanPham (
    MaLoai NVARCHAR(10) PRIMARY KEY, 
    TenLoai NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.HangSanPham (
    MaHang NVARCHAR(10) PRIMARY KEY, 
    TenHang NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.SanPham (
	MaSP NVARCHAR(10) PRIMARY KEY, 
    TenSP NVARCHAR(200) NOT NULL, 
    MaLoai NVARCHAR(10) NULL,
	MaHang NVARCHAR(10) NULL, 
    MaDonVi NVARCHAR(10) NULL, 
    GiaNhap DECIMAL(18,2) DEFAULT 0,
	GiaBanLe DECIMAL(18,2) DEFAULT 0, 
    GiaBanSi DECIMAL(18,2) DEFAULT 0,
	GiaBanVIP DECIMAL(18,2) DEFAULT 0, 
    SoLuongTon INT DEFAULT 0,
	Anh VARBINARY(MAX) NULL,
    MaTK NVARCHAR(20) NULL,
	CONSTRAINT FK_SP_Loai FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham(MaLoai),
	CONSTRAINT FK_SP_Hang FOREIGN KEY (MaHang) REFERENCES HangSanPham(MaHang),
	CONSTRAINT FK_SP_DonVi FOREIGN KEY (MaDonVi) REFERENCES DonViTinh(MaDonVi),
	-- FK đến TaiKhoanChiTiet sẽ được thêm sau khi TK được tạo
	CONSTRAINT CK_SanPham_SoLuongTon_NonNegative CHECK (SoLuongTon >= 0)
);

-- ============================================================================
-- III. BẢNG TÀI KHOẢN KẾ TOÁN - TÁCH THÀNH 3 CẤP
-- ============================================================================

PRINT N'III. Đang tạo các bảng Kế Toán (3 Cấp)...';
CREATE TABLE dbo.TaiKhoanCap1 (
    MaTK NVARCHAR(1) PRIMARY KEY, 
    TenTK NVARCHAR(200) NOT NULL, 
    TinhChat NVARCHAR(20) NOT NULL,
    CONSTRAINT CK_TaiKhoanCap1_TinhChat CHECK (TinhChat IN ('No','Co','LuongTinh'))
);

CREATE TABLE dbo.TaiKhoanCap2 (
    MaTK NVARCHAR(3) PRIMARY KEY, 
    TenTK NVARCHAR(200) NOT NULL, 
    TKCha NVARCHAR(1) NOT NULL,
    TinhChat NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_TKC2_TKC1 FOREIGN KEY (TKCha) REFERENCES dbo.TaiKhoanCap1(MaTK),
    CONSTRAINT CK_TaiKhoanCap2_TinhChat CHECK (TinhChat IN ('No','Co','LuongTinh'))
);

CREATE TABLE dbo.TaiKhoanChiTiet (
    MaTK NVARCHAR(20) PRIMARY KEY, 
    TenTK NVARCHAR(200) NOT NULL, 
    TKCha NVARCHAR(3) NOT NULL,
    TinhChat NVARCHAR(20) DEFAULT 'LuongTinh',
    CONSTRAINT FK_TKCT_TKC2 FOREIGN KEY (TKCha) REFERENCES dbo.TaiKhoanCap2(MaTK),
    CONSTRAINT CK_TaiKhoanChiTiet_TinhChat CHECK (TinhChat IN ('No','Co','LuongTinh'))
);

-- ============================================================================
-- IV. BẢNG KHÁCH HÀNG, NHÀ CUNG CẤP, NHÂN VIÊN
-- ============================================================================

PRINT N'IV. Đang tạo các bảng Đối Tác...';
CREATE TABLE dbo.KhachHang (
    MaKH NVARCHAR(10) PRIMARY KEY, 
    HoTen NVARCHAR(100) NOT NULL, 
    SDT NVARCHAR(15) UNIQUE,
    MaTK_CongNo NVARCHAR(20) NULL, 
    LoaiKH NVARCHAR(20) DEFAULT 'Thuong', 
    DiemTichLuy INT DEFAULT 0,
    CONSTRAINT FK_KH_TKCongNo FOREIGN KEY (MaTK_CongNo) REFERENCES dbo.TaiKhoanChiTiet(MaTK) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE dbo.NhaCungCap (
    MaNCC NVARCHAR(10) PRIMARY KEY, 
    TenNCC NVARCHAR(100) NOT NULL, 
    SDT NVARCHAR(15),
    MaTK_CongNo NVARCHAR(20) NULL,
    CONSTRAINT FK_NCC_TKCongNo FOREIGN KEY (MaTK_CongNo) REFERENCES dbo.TaiKhoanChiTiet(MaTK) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE dbo.NhanVien (
    MaNV NVARCHAR(10) PRIMARY KEY, 
    HoTen NVARCHAR(100) NOT NULL, 
    ChucVu NVARCHAR(50),
    Email NVARCHAR(100) NULL,
    MaTK_CongNo NVARCHAR(20) NULL,
    CONSTRAINT FK_NV_TKCongNo FOREIGN KEY (MaTK_CongNo) REFERENCES dbo.TaiKhoanChiTiet(MaTK) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE dbo.TaiKhoan (
    TenDangNhap NVARCHAR(50) PRIMARY KEY, 
    MatKhauHash NVARCHAR(256) NOT NULL, 
    MaNV NVARCHAR(10) UNIQUE,
    VaiTro NVARCHAR(20) DEFAULT 'NhanVien',
    CONSTRAINT FK_TK_NV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

-- ============================================================================
-- V. BẢNG QUY ĐỊNH, KHUYẾN MÃI
-- ============================================================================

PRINT N'V. Đang tạo các bảng Business Rules...';
CREATE TABLE dbo.QuyDinhNghiepVu (
    MaQuyDinh NVARCHAR(20) PRIMARY KEY, 
    GiaTri NVARCHAR(50) NOT NULL, 
    MoTa NVARCHAR(200)
);

CREATE TABLE dbo.KhuyenMai (
    MaKM NVARCHAR(20) PRIMARY KEY, 
    TenKM NVARCHAR(200) NOT NULL, 
    LoaiKM NVARCHAR(10) DEFAULT 'Percent',
    TyLeGiam DECIMAL(5,2) DEFAULT 0, 
    SoTienGiam DECIMAL(18,2) DEFAULT 0,
    DieuKienGiaToiThieu DECIMAL(18,2) DEFAULT 0, 
    TuNgay DATE, 
    DenNgay DATE,
	SoLuong INT NULL, 
    DaSuDung INT DEFAULT 0, 
    TrangThai BIT DEFAULT 1,
	CONSTRAINT CK_KhuyenMai_DaSuDung_Max CHECK (SoLuong IS NULL OR DaSuDung <= SoLuong),
    CONSTRAINT CK_KhuyenMai_ValidDiscount CHECK (
		(LoaiKM = 'Percent' AND TyLeGiam BETWEEN 0 AND 100 AND SoTienGiam = 0)
		OR
		(LoaiKM = 'Amount' AND SoTienGiam >= 0 AND TyLeGiam = 0)
	)
);

-- ============================================================================
-- VI. BẢNG SỐ DƯ ĐẦU KỲ
-- ============================================================================

PRINT N'VI. Đang tạo bảng Số Dư Đầu Kỳ...';
CREATE TABLE dbo.SoDuDauKy (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    MaTK NVARCHAR(20) NOT NULL,
    NgayDauKy DATE DEFAULT '2025-01-01' NOT NULL,
    DuNoDau DECIMAL(18,2) DEFAULT 0, 
    DuCoDau DECIMAL(18,2) DEFAULT 0,
    SoLuongTonKho INT NULL,
    MaSP NVARCHAR(10) NULL,
    CONSTRAINT FK_SDDK_TKCT FOREIGN KEY (MaTK) REFERENCES dbo.TaiKhoanChiTiet(MaTK) ON UPDATE CASCADE,
    CONSTRAINT FK_SDDK_SP FOREIGN KEY (MaSP) REFERENCES dbo.SanPham(MaSP)
);

-- ============================================================================
-- VII. BẢNG CHỨNG TỪ VÀ BÚT TOÁN
-- ============================================================================

PRINT N'VII. Đang tạo các bảng Chứng từ & Bút toán...';
CREATE TABLE dbo.LoaiChungTu (
    MaLCT NVARCHAR(10) PRIMARY KEY, 
    TenLCT NVARCHAR(100) NOT NULL
);

CREATE TABLE dbo.ChungTu (
    MaCT NVARCHAR(20) PRIMARY KEY, 
    MaLCT NVARCHAR(10) NOT NULL,
    NgayCT DATETIME2 DEFAULT GETDATE(), 
    MaKH NVARCHAR(10) NULL, 
    MaNCC NVARCHAR(10) NULL, 
    MaNV NVARCHAR(10) NULL,
    DienGiai NVARCHAR(500) NOT NULL, 
    TongTienGoc DECIMAL(18,2) DEFAULT 0, 
    MaKM NVARCHAR(20) NULL,
    GiamGia DECIMAL(18,2) DEFAULT 0, 
    DiemSuDung INT DEFAULT 0,
    TongThanhToan AS (TongTienGoc - GiamGia) PERSISTED,
    CONSTRAINT FK_CT_LoaiCT FOREIGN KEY (MaLCT) REFERENCES dbo.LoaiChungTu(MaLCT),
    CONSTRAINT FK_CT_KH FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH),
    CONSTRAINT FK_CT_NCC FOREIGN KEY (MaNCC) REFERENCES dbo.NhaCungCap(MaNCC),
    CONSTRAINT FK_CT_NV FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV),
    CONSTRAINT FK_CT_KM FOREIGN KEY (MaKM) REFERENCES dbo.KhuyenMai(MaKM)
);

CREATE TABLE dbo.ButToan (
    MaBT INT IDENTITY(1,1) PRIMARY KEY, 
    MaCT NVARCHAR(20) NOT NULL, 
    NgayCT DATETIME2 NOT NULL,
    TKNo NVARCHAR(20) NOT NULL, 
    TKCo NVARCHAR(20) NOT NULL,
    SoTien DECIMAL(18,2) NOT NULL, 
    DienGiai NVARCHAR(500),
    SoLuong DECIMAL(18,3) NULL,
    DonGia DECIMAL(18,2) NULL,
    MaSP NVARCHAR(10) NULL,
    CONSTRAINT FK_BT_CT FOREIGN KEY (MaCT) REFERENCES dbo.ChungTu(MaCT) ON DELETE CASCADE,
    CONSTRAINT FK_BT_TKNo FOREIGN KEY (TKNo) REFERENCES dbo.TaiKhoanChiTiet(MaTK),
    CONSTRAINT FK_BT_TKCo FOREIGN KEY (TKCo) REFERENCES dbo.TaiKhoanChiTiet(MaTK),
    CONSTRAINT FK_BT_SanPham FOREIGN KEY (MaSP) REFERENCES dbo.SanPham(MaSP),
    CONSTRAINT CK_ButToan_TKNo_TKCo_NotEqual CHECK (TKNo <> TKCo),
    CONSTRAINT CK_ButToan_SoLuong_DonGia CHECK (
        (SoLuong IS NULL AND DonGia IS NULL AND MaSP IS NULL) 
        OR (SoLuong IS NOT NULL AND DonGia IS NOT NULL AND MaSP IS NOT NULL)
    )
);

-- ============================================================================
-- VIII. BẢNG NGHIỆP VỤ PHỤ
-- ============================================================================

PRINT N'VIII. Đang tạo các bảng Nghiệp vụ phụ...';
CREATE TABLE dbo.CaLamViec (
    MaCa NVARCHAR(20) PRIMARY KEY, 
    MaNV NVARCHAR(10) NOT NULL,
    GioBatDau DATETIME2 DEFAULT GETDATE(), 
    GioKetThuc DATETIME2,
    TienDauCa DECIMAL(18,2) DEFAULT 0, 
    TongThuTM DECIMAL(18,2) DEFAULT 0, 
    TongChiTM DECIMAL(18,2) DEFAULT 0,
    TienCuoiCa AS (TienDauCa + TongThuTM - TongChiTM) PERSISTED,
    TienThucTe DECIMAL(18,2), 
    TrangThai NVARCHAR(20) DEFAULT 'DangMo',
    CONSTRAINT FK_Ca_NV FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV)
);

-- ============================================================================
-- IX. STORED PROCEDURES - NGHIỆP VỤ
-- ============================================================================

PRINT N'IX. Đang tạo Stored Procedures nghiệp vụ...';
GO

CREATE PROCEDURE dbo.usp_TaoPhieuNhapKho
    @MaCT NVARCHAR(20), 
    @MaNCC NVARCHAR(10), 
    @MaNV NVARCHAR(10),
    @DienGiai NVARCHAR(500), 
    @ThanhToanTienMat DECIMAL(18,2), 
    @JsonChiTietSP NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON; SET XACT_ABORT ON;
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @TongTien DECIMAL(18,2); 
        DECLARE @MaTK_NCC NVARCHAR(20);
        DECLARE @Ngay DATETIME2 = GETDATE();

        DECLARE @ChiTiet TABLE (MaSP NVARCHAR(10), SoLuong INT, DonGia DECIMAL(18,2));
        INSERT INTO @ChiTiet (MaSP, SoLuong, DonGia)
        SELECT MaSP, SoLuong, DonGia FROM OPENJSON(@JsonChiTietSP) 
        WITH (MaSP NVARCHAR(10) '$.MaSP', SoLuong INT '$.SoLuong', DonGia DECIMAL(18,2) '$.DonGia');
        
        SELECT @TongTien = SUM(SoLuong * DonGia) FROM @ChiTiet;
        SELECT @MaTK_NCC = MaTK_CongNo FROM dbo.NhaCungCap WHERE MaNCC = @MaNCC;
        IF @MaTK_NCC IS NULL 
        BEGIN 
            RAISERROR(N'Không tìm thấy TK NCC.', 16, 1); 
            ROLLBACK TRAN; 
            RETURN; 
        END

        INSERT INTO dbo.ChungTu (MaCT, MaLCT, NgayCT, MaNCC, MaNV, DienGiai, TongTienGoc)
        VALUES (@MaCT, 'PNK', @Ngay, @MaNCC, @MaNV, @DienGiai, @TongTien);

        INSERT INTO dbo.ButToan (MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai, SoLuong, DonGia, MaSP)
        SELECT @MaCT, @Ngay, '156.HH', @MaTK_NCC, SoLuong * DonGia, 
               N'Nhập kho ' + @MaCT, SoLuong, DonGia, MaSP 
        FROM @ChiTiet;
        
        -- Tăng nợ phải trả NCC (phần chưa thanh toán)
        DECLARE @NoMoi DECIMAL(18,2) = @TongTien - @ThanhToanTienMat;
        IF @NoMoi > 0
        BEGIN
            UPDATE dbo.SoDuDauKy 
            SET DuCoDau = DuCoDau + @NoMoi
            WHERE MaTK = @MaTK_NCC;
            
            IF @@ROWCOUNT = 0
            BEGIN
                INSERT INTO dbo.SoDuDauKy (MaTK, NgayDauKy, DuNoDau, DuCoDau)
                VALUES (@MaTK_NCC, '2025-01-01', 0, @NoMoi);
            END
        END

        IF @ThanhToanTienMat > 0
        BEGIN
            INSERT INTO dbo.ButToan (MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai)
            VALUES (@MaCT, @Ngay, @MaTK_NCC, '111.TM', @ThanhToanTienMat, 
                    N'Trả tiền mặt khi nhập kho ' + @MaCT);
            UPDATE dbo.CaLamViec 
            SET TongChiTM = TongChiTM + @ThanhToanTienMat 
            WHERE MaNV = @MaNV AND TrangThai = 'DangMo';
        END

		UPDATE sp SET sp.SoLuongTon = sp.SoLuongTon + ct.SoLuong, sp.GiaNhap = ct.DonGia
		FROM dbo.SanPham sp
		JOIN @ChiTiet ct ON sp.MaSP = ct.MaSP;

        COMMIT TRAN;
        SELECT @MaCT AS MaChungTu, @TongTien AS TongTien, 'SUCCESS' AS Status;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        SELECT 'ERROR' AS Status, ERROR_MESSAGE() AS Message;
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE dbo.usp_TaoPhieuBanHang
    @MaCT NVARCHAR(20), 
    @MaKH NVARCHAR(10), 
    @MaNV NVARCHAR(10),
    @DienGiai NVARCHAR(500), 
    @ThanhToanTienMat BIT,
    @MaKM NVARCHAR(20) = NULL, 
    @DiemSuDung INT = 0,
    @JsonChiTietSP NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON; SET XACT_ABORT ON; 
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @TongTienGoc DECIMAL(18,2) = 0, @GiaVon DECIMAL(18,2) = 0,
                @TienGiamKM DECIMAL(18,2) = 0, @TienGiamDiem DECIMAL(18,2) = 0,
                @TongGiamGia DECIMAL(18,2) = 0, @TongThanhToan DECIMAL(18,2) = 0,
                @MaTK_KH NVARCHAR(20), @LoaiKH NVARCHAR(20), @DiemHienCo INT,
                @TK_GhiNhanNo NVARCHAR(20), @Ngay DATETIME2 = GETDATE(),
                @SL_MUA_SI INT = (SELECT CAST(GiaTri AS INT) FROM QuyDinhNghiepVu WHERE MaQuyDinh = 'SL_MUA_SI');

        SELECT @MaTK_KH = MaTK_CongNo, @LoaiKH = LoaiKH, @DiemHienCo = DiemTichLuy
        FROM dbo.KhachHang WHERE MaKH = @MaKH;
        IF @MaTK_KH IS NULL 
        BEGIN 
            RAISERROR(N'Không tìm thấy TK KH.', 16, 1); 
            ROLLBACK TRAN; 
            RETURN; 
        END

        DECLARE @ChiTiet TABLE (MaSP NVARCHAR(10), SoLuong INT, DonGia DECIMAL(18,2), GiaVon DECIMAL(18,2));
        INSERT INTO @ChiTiet (MaSP, SoLuong, DonGia, GiaVon)
        SELECT j.MaSP, j.SoLuong,
            CASE 
                WHEN @LoaiKH = 'VIP' THEN sp.GiaBanVIP
                WHEN j.SoLuong >= @SL_MUA_SI THEN sp.GiaBanSi
                ELSE sp.GiaBanLe
            END AS DonGia,
            sp.GiaNhap AS GiaVon
        FROM OPENJSON(@JsonChiTietSP) WITH (MaSP NVARCHAR(10) '$.MaSP', SoLuong INT '$.SoLuong') j
        JOIN dbo.SanPham sp ON j.MaSP = sp.MaSP;

		IF EXISTS (SELECT 1 FROM dbo.SanPham sp JOIN @ChiTiet ct ON sp.MaSP = ct.MaSP 
                   WHERE sp.SoLuongTon < ct.SoLuong)
        BEGIN 
            RAISERROR(N'Không đủ hàng tồn kho.', 16, 1); 
            ROLLBACK TRAN; 
            RETURN; 
        END

        SELECT @TongTienGoc = SUM(SoLuong * DonGia) FROM @ChiTiet;
        SELECT @GiaVon = SUM(SoLuong * GiaVon) FROM @ChiTiet;

		IF @MaKM IS NOT NULL
		BEGIN
			DECLARE @LoaiKM NVARCHAR(10), @TyLeGiam DECIMAL(5,2), @SoTienGiam DECIMAL(18,2);
			SELECT @LoaiKM = LoaiKM, @TyLeGiam = TyLeGiam, @SoTienGiam = SoTienGiam
			FROM dbo.KhuyenMai
			WHERE MaKM = @MaKM AND @TongTienGoc >= DieuKienGiaToiThieu AND TrangThai = 1 
				  AND GETDATE() BETWEEN TuNgay AND DenNgay;
            IF @LoaiKM = 'Percent' AND @TyLeGiam > 0
            BEGIN
                SET @TienGiamKM = @TongTienGoc * (@TyLeGiam / 100);
				UPDATE dbo.KhuyenMai SET DaSuDung = DaSuDung + 1 WHERE MaKM = @MaKM;
            END
            ELSE IF @LoaiKM = 'Amount' AND @SoTienGiam > 0
            BEGIN
                SET @TienGiamKM = @SoTienGiam;
				UPDATE dbo.KhuyenMai SET DaSuDung = DaSuDung + 1 WHERE MaKM = @MaKM;
            END
        END

        IF @DiemSuDung > 0
        BEGIN
            DECLARE @DiemToVND INT = (SELECT CAST(GiaTri AS INT) FROM QuyDinhNghiepVu WHERE MaQuyDinh = 'DIEM_TO_VND');
            IF @DiemSuDung > @DiemHienCo 
            BEGIN 
                RAISERROR(N'Không đủ điểm tích lũy.', 16, 1); 
                ROLLBACK TRAN; 
                RETURN; 
            END
            SET @TienGiamDiem = @DiemSuDung * @DiemToVND;
        END

        SET @TongGiamGia = @TienGiamKM + @TienGiamDiem;
        SET @TongThanhToan = @TongTienGoc - @TongGiamGia;
        IF @TongThanhToan < 0 SET @TongThanhToan = 0;
        
        SET @TK_GhiNhanNo = CASE WHEN @ThanhToanTienMat = 1 THEN '111.TM' ELSE @MaTK_KH END;

        INSERT INTO dbo.ChungTu (MaCT, MaLCT, NgayCT, MaKH, MaNV, DienGiai, TongTienGoc, MaKM, GiamGia, DiemSuDung)
        VALUES (@MaCT, 'PBH', @Ngay, @MaKH, @MaNV, @DienGiai, @TongTienGoc, @MaKM, @TongGiamGia, @DiemSuDung);

        INSERT INTO dbo.ButToan (MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai, SoLuong, DonGia, MaSP)
        SELECT @MaCT, @Ngay, @TK_GhiNhanNo, '511.BH', SoLuong * DonGia, 
               N'Doanh thu bán hàng ' + @MaCT, SoLuong, DonGia, MaSP 
        FROM @ChiTiet;

        IF @GiaVon > 0
        BEGIN
            INSERT INTO dbo.ButToan (MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai)
            VALUES (@MaCT, @Ngay, '632.GV', '156.HH', @GiaVon, N'Giá vốn bán hàng ' + @MaCT);
        END
        
        IF @ThanhToanTienMat = 1
        BEGIN
            UPDATE dbo.CaLamViec SET TongThuTM = TongThuTM + @TongThanhToan 
            WHERE MaNV = @MaNV AND TrangThai = 'DangMo';
        END
        ELSE
        BEGIN
            -- Tăng nợ KH phải trả (bán trả chậm)
            UPDATE dbo.SoDuDauKy 
            SET DuNoDau = DuNoDau + @TongThanhToan
            WHERE MaTK = @MaTK_KH;
            
            IF @@ROWCOUNT = 0
            BEGIN
                INSERT INTO dbo.SoDuDauKy (MaTK, NgayDauKy, DuNoDau, DuCoDau)
                VALUES (@MaTK_KH, '2025-01-01', @TongThanhToan, 0);
            END
        END

        DECLARE @VNDToDiem INT = (SELECT CAST(GiaTri AS INT) FROM QuyDinhNghiepVu WHERE MaQuyDinh = 'VND_TO_DIEM');
        DECLARE @DiemTichLuyMoi INT = FLOOR(@TongThanhToan / @VNDToDiem);
        
        UPDATE dbo.KhachHang
        SET DiemTichLuy = DiemTichLuy - @DiemSuDung + @DiemTichLuyMoi
        WHERE MaKH = @MaKH;

		UPDATE sp SET sp.SoLuongTon = sp.SoLuongTon - ct.SoLuong
		FROM dbo.SanPham sp
		JOIN @ChiTiet ct ON sp.MaSP = ct.MaSP;

        COMMIT TRAN;
        SELECT @MaCT AS MaChungTu, @TongThanhToan AS TongThanhToan, 'SUCCESS' AS Status;
    
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        SELECT 'ERROR' AS Status, ERROR_MESSAGE() AS Message;
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE dbo.usp_TaoPhieuThuNo
    @MaCT NVARCHAR(20), 
    @MaKH NVARCHAR(10), 
    @MaNV NVARCHAR(10),
    @SoTien DECIMAL(18,2), 
    @DienGiai NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON; SET XACT_ABORT ON; 
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @MaTK_KH NVARCHAR(20); 
        DECLARE @Ngay DATETIME2 = GETDATE();
        
        SELECT @MaTK_KH = MaTK_CongNo FROM dbo.KhachHang WHERE MaKH = @MaKH;
        IF @MaTK_KH IS NULL 
        BEGIN 
            RAISERROR(N'Không tìm thấy TK KH.', 16, 1); 
            ROLLBACK TRAN; 
            RETURN; 
        END

        INSERT INTO dbo.ChungTu (MaCT, MaLCT, NgayCT, MaKH, MaNV, DienGiai, TongTienGoc)
        VALUES (@MaCT, 'PT', @Ngay, @MaKH, @MaNV, @DienGiai, @SoTien);
        
        INSERT INTO dbo.ButToan (MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai)
        VALUES (@MaCT, @Ngay, '111.TM', @MaTK_KH, @SoTien, @DienGiai);
        
        -- Cập nhật số dư nợ khách hàng (thu nợ = giảm nợ phải thu = giảm DuNoDau)
        UPDATE dbo.SoDuDauKy 
        SET DuNoDau = DuNoDau - @SoTien
        WHERE MaTK = @MaTK_KH;
        
        -- Nếu chưa có bản ghi số dư, báo lỗi (không thể thu nợ khi chưa có nợ)
        IF @@ROWCOUNT = 0
        BEGIN
            RAISERROR(N'Không tìm thấy số dư đầu kỳ cho KH này.', 16, 1);
            ROLLBACK TRAN;
            RETURN;
        END
        
        UPDATE dbo.CaLamViec SET TongThuTM = TongThuTM + @SoTien 
        WHERE MaNV = @MaNV AND TrangThai = 'DangMo';
        
        COMMIT TRAN;
        SELECT @MaCT AS MaChungTu, @SoTien AS SoTien, 'SUCCESS' AS Status;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        SELECT 'ERROR' AS Status, ERROR_MESSAGE() AS Message;
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE dbo.usp_TaoPhieuChiTraNo
    @MaCT NVARCHAR(20), 
    @MaNCC NVARCHAR(10), 
    @MaNV NVARCHAR(10),
    @SoTien DECIMAL(18,2), 
    @DienGiai NVARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON; SET XACT_ABORT ON; 
    BEGIN TRY
        BEGIN TRAN;
        DECLARE @MaTK_NCC NVARCHAR(20); 
        DECLARE @Ngay DATETIME2 = GETDATE();
        
        SELECT @MaTK_NCC = MaTK_CongNo FROM dbo.NhaCungCap WHERE MaNCC = @MaNCC;
        IF @MaTK_NCC IS NULL 
        BEGIN 
            RAISERROR(N'Không tìm thấy TK NCC.', 16, 1); 
            ROLLBACK TRAN; 
            RETURN; 
        END

        INSERT INTO dbo.ChungTu (MaCT, MaLCT, NgayCT, MaNCC, MaNV, DienGiai, TongTienGoc)
        VALUES (@MaCT, 'PC', @Ngay, @MaNCC, @MaNV, @DienGiai, @SoTien);
        
        INSERT INTO dbo.ButToan (MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai)
        VALUES (@MaCT, @Ngay, @MaTK_NCC, '111.TM', @SoTien, @DienGiai);
        
        -- Cập nhật số dư nợ nhà cung cấp (trả tiền = giảm nợ phải trả = giảm DuCoDau)
        UPDATE dbo.SoDuDauKy 
        SET DuCoDau = DuCoDau - @SoTien
        WHERE MaTK = @MaTK_NCC;
        
        -- Nếu chưa có bản ghi số dư, báo lỗi (không thể trả nợ khi chưa có nợ)
        IF @@ROWCOUNT = 0
        BEGIN
            RAISERROR(N'Không tìm thấy số dư đầu kỳ cho NCC này.', 16, 1);
            ROLLBACK TRAN;
            RETURN;
        END
        
        UPDATE dbo.CaLamViec SET TongChiTM = TongChiTM + @SoTien 
        WHERE MaNV = @MaNV AND TrangThai = 'DangMo';
        
        COMMIT TRAN;
        SELECT @MaCT AS MaChungTu, @SoTien AS SoTien, 'SUCCESS' AS Status;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRAN;
        SELECT 'ERROR' AS Status, ERROR_MESSAGE() AS Message;
        THROW;
    END CATCH
END;
GO

-- ============================================================================
-- X. VIEWS BÁO CÁO
-- ============================================================================

PRINT N'X. Đang tạo Views báo cáo...';
GO

CREATE VIEW dbo.vw_SoNhatKyChung
AS
    SELECT MaCT, NgayCT, TKNo, TKCo, SoTien, DienGiai, MaSP, SoLuong, DonGia
    FROM dbo.ButToan
GO

CREATE VIEW dbo.vw_BangCanDoiPhatSinh
AS
    WITH AllTK AS (
        SELECT MaTK, TenTK, TinhChat, 1 AS Cap, NULL AS TKCha FROM dbo.TaiKhoanCap1
        UNION ALL
        SELECT MaTK, TenTK, TinhChat, 2 AS Cap, TKCha FROM dbo.TaiKhoanCap2
        UNION ALL
        SELECT MaTK, TenTK, TinhChat, 3 AS Cap, TKCha FROM dbo.TaiKhoanChiTiet
    ),
    PhatSinh AS (
        SELECT TKNo AS MaTK, SUM(SoTien) AS PhatSinhNo, 0 AS PhatSinhCo 
        FROM dbo.ButToan GROUP BY TKNo
        UNION ALL
        SELECT TKCo AS MaTK, 0 AS PhatSinhNo, SUM(SoTien) AS PhatSinhCo 
        FROM dbo.ButToan GROUP BY TKCo
    ),
    TongPhatSinh AS (
        SELECT MaTK, SUM(PhatSinhNo) AS TongPhatSinhNo, SUM(PhatSinhCo) AS TongPhatSinhCo
        FROM PhatSinh GROUP BY MaTK
    ),
    SoDuDauKyGroup AS (
        SELECT MaTK, SUM(DuNoDau) AS DuNoDau, SUM(DuCoDau) AS DuCoDau
        FROM dbo.SoDuDauKy GROUP BY MaTK
    )
    SELECT
        tk.MaTK, tk.TenTK, tk.Cap, tk.TKCha,
        ISNULL(sdk.DuNoDau, 0) AS DuNoDau, 
        ISNULL(sdk.DuCoDau, 0) AS DuCoDau,
        ISNULL(ps.TongPhatSinhNo, 0) AS PhatSinhNo, 
        ISNULL(ps.TongPhatSinhCo, 0) AS PhatSinhCo,
        IIF( tk.TinhChat = 'No', 
            (ISNULL(sdk.DuNoDau, 0) + ISNULL(ps.TongPhatSinhNo, 0) 
             - ISNULL(sdk.DuCoDau, 0) - ISNULL(ps.TongPhatSinhCo, 0)), 0
        ) AS DuNoCuoi,
        IIF( tk.TinhChat = 'Co' OR tk.TinhChat = 'LuongTinh', 
            (ISNULL(sdk.DuCoDau, 0) + ISNULL(ps.TongPhatSinhCo, 0) 
             - ISNULL(sdk.DuNoDau, 0) - ISNULL(ps.TongPhatSinhNo, 0)), 0
        ) AS DuCoCuoi
    FROM AllTK tk
    LEFT JOIN SoDuDauKyGroup sdk ON tk.MaTK = sdk.MaTK
    LEFT JOIN TongPhatSinh ps ON tk.MaTK = ps.MaTK
    WHERE ISNULL(sdk.DuNoDau, 0) != 0 OR ISNULL(sdk.DuCoDau, 0) != 0 OR
          ISNULL(ps.TongPhatSinhNo, 0) != 0 OR ISNULL(ps.TongPhatSinhCo, 0) != 0
GO

CREATE VIEW dbo.vw_CongNoKhachHang_TongHop
AS
    SELECT MaTK, TenTK, 
           (DuNoDau + PhatSinhNo - DuCoDau - PhatSinhCo) AS CongNoPhaiThu
    FROM dbo.vw_BangCanDoiPhatSinh 
    WHERE TKCha = '131'
GO

CREATE VIEW dbo.vw_CongNoNhaCungCap_TongHop
AS
    SELECT MaTK, TenTK, 
           (DuCoDau + PhatSinhCo - DuNoDau - PhatSinhNo) AS CongNoPhaiTra
    FROM dbo.vw_BangCanDoiPhatSinh 
    WHERE TKCha = '331'
GO

-- ============================================================================
-- XI. STORED PROCEDURES BÁO CÁO
-- ============================================================================

PRINT N'XI. Đang tạo SP Báo cáo...';
GO

CREATE PROCEDURE dbo.usp_XemBaoCaoCanDoi
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM dbo.vw_BangCanDoiPhatSinh ORDER BY MaTK;
END
GO

CREATE PROCEDURE dbo.usp_XemSoCai
    @MaTK NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT MaTK, DuNoDau, DuCoDau 
    FROM dbo.SoDuDauKy 
    WHERE MaTK = @MaTK;
    
    SELECT NgayCT, MaCT, DienGiai, TKNo, TKCo, SoTien
    FROM dbo.ButToan
    WHERE TKNo = @MaTK OR TKCo = @MaTK
    ORDER BY NgayCT;
END
GO

CREATE PROCEDURE dbo.usp_BaoCaoLoiNhuanDonGian
    @TuNgay DATE = NULL,
    @DenNgay DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;
    IF @TuNgay IS NULL SET @TuNgay = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1);
    IF @DenNgay IS NULL SET @DenNgay = EOMONTH(GETDATE());

    DECLARE @DoanhThu DECIMAL(18,2);
    DECLARE @GiaVon DECIMAL(18,2);

    SELECT @DoanhThu = ISNULL(SUM(SoTien), 0)
    FROM dbo.ButToan
    WHERE TKCo = '511.BH' AND CAST(NgayCT AS DATE) BETWEEN @TuNgay AND @DenNgay;
      
    SELECT @GiaVon = ISNULL(SUM(SoTien), 0)
    FROM dbo.ButToan
    WHERE TKNo = '632.GV' AND CAST(NgayCT AS DATE) BETWEEN @TuNgay AND @DenNgay;

    SELECT 
        @DoanhThu AS TongDoanhThu,
        @GiaVon AS TongGiaVon,
        (@DoanhThu - @GiaVon) AS LoiNhuanGop;
END
GO

-- ============================================================================
-- XII. TẠO USER VÀ PHÂN QUYỀN
-- ============================================================================

PRINT N'XII. Đang tạo user và phân quyền...';

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'WatsonsAppUser')
    CREATE LOGIN WatsonsAppUser WITH PASSWORD = 'Watsons@SecureP@ss2025!', 
    CHECK_POLICY = ON, CHECK_EXPIRATION = OFF;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'WatsonsAppUser')
    CREATE USER WatsonsAppUser FOR LOGIN WatsonsAppUser;

-- Cấp quyền db_datareader và db_datawriter (READ/WRITE tất cả bảng)
ALTER ROLE db_datareader ADD MEMBER WatsonsAppUser;
ALTER ROLE db_datawriter ADD MEMBER WatsonsAppUser;

-- Cấp quyền EXECUTE tất cả stored procedures
GRANT EXECUTE TO WatsonsAppUser;

-- Cấp quyền VIEW DEFINITION (xem cấu trúc objects)
GRANT VIEW DEFINITION TO WatsonsAppUser;

-- Cấp quyền tạo/sửa/xóa bảng nếu cần (tùy chọn - bỏ comment nếu muốn)
-- ALTER ROLE db_ddladmin ADD MEMBER WatsonsAppUser;

GO

-- ============================================================================
-- XIII. INDEXES & CONSTRAINTS
-- ============================================================================

PRINT N'XIII. Thêm Indexes và Constraints...';
GO

-- Thêm FK từ SanPham đến TaiKhoanChiTiet (sau khi TK đã được tạo)
ALTER TABLE dbo.SanPham
ADD CONSTRAINT FK_SP_TK FOREIGN KEY (MaTK) REFERENCES dbo.TaiKhoanChiTiet(MaTK) ON UPDATE CASCADE ON DELETE NO ACTION;
GO

CREATE INDEX IX_SanPham_LoaiHang ON dbo.SanPham(MaLoai, MaHang)
INCLUDE (GiaBanLe, GiaBanSi, GiaBanVIP, SoLuongTon);

CREATE INDEX IX_ButToan_TKNo ON dbo.ButToan(TKNo, NgayCT) INCLUDE(SoTien, MaCT);
CREATE INDEX IX_ButToan_TKCo ON dbo.ButToan(TKCo, NgayCT) INCLUDE(SoTien, MaCT);
CREATE INDEX IX_ChungTu_Loai_Ngay ON dbo.ChungTu(MaLCT, NgayCT);
CREATE INDEX IX_KhuyenMai_HieuLuc ON dbo.KhuyenMai(TuNgay, DenNgay, TrangThai);
CREATE INDEX IX_SoDuDauKy_MaTK_Ngay ON dbo.SoDuDauKy(MaTK, NgayDauKy);

GO

-- ============================================================================
-- XIV. HOÀN TẤT
-- ============================================================================

PRINT N'';
PRINT N'============================================================================';
PRINT N'  ✓ Hoàn tất tạo database QL_Watsons';
PRINT N'';
PRINT N'  Để nạp dữ liệu mẫu, chạy file DATA_INSERT.sql';
PRINT N'============================================================================';
