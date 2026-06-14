/* ============================================================================
    QL_Watsons - Dữ liệu mẫu (clean seeding)
    Chỉ chứa INSERT dữ liệu, không dùng PRINT/GO/loop
============================================================================ */

USE QL_Watsons;
GO

-- ============================================================================
-- 1. ĐƠN VỊ TÍNH
-- ============================================================================
INSERT INTO dbo.DonViTinh (MaDonVi, TenDonVi) VALUES 
('CAI', N'Cái'), ('CHAI', N'Chai'), ('HOP', N'Hộp'), ('TUB', N'Tuýp'), ('GOI', N'Gói'),
('LO', N'Lọ'), ('THUNG', N'Thùng'), ('BAO', N'Bao'), ('VIEN', N'Viên'), ('LOC', N'Lốc'),
('BO', N'Bộ'), ('TAM', N'Tấm'), ('CUON', N'Cuộn'), ('HU', N'Hũ'), ('BINH', N'Bình');

-- ============================================================================
-- 2. LOẠI SẢN PHẨM
-- ============================================================================
INSERT INTO dbo.LoaiSanPham (MaLoai, TenLoai) VALUES 
('LSP01', N'Chăm sóc da'), 
('LSP02', N'Chăm sóc tóc'), 
('LSP03', N'Trang điểm'), 
('LSP04', N'Nước hoa'),
('LSP05', N'Chăm sóc cơ thể'), 
('LSP06', N'Chăm sóc nam giới'), 
('LSP07', N'Sức khỏe & Vitamin'),
('LSP08', N'Mẹ & Bé'), 
('LSP09', N'Vệ sinh cá nhân'), 
('LSP10', N'Phụ kiện làm đẹp'),
('LSP11', N'Dưỡng môi'), 
('LSP12', N'Chống nắng'), 
('LSP13', N'Mặt nạ'), 
('LSP14', N'Serum'), 
('LSP15', N'Kem mắt');

-- ============================================================================
-- 3. HÃNG SẢN PHẨM
-- ============================================================================
INSERT INTO dbo.HangSanPham (MaHang, TenHang) VALUES 
('HG01', N'Cocoon'), ('HG02', N'Innisfree'), ('HG03', N'The Face Shop'), ('HG04', N'Senka'),
('HG05', N'Bioré'), ('HG06', N'L''Oréal'), ('HG07', N'Maybelline'), ('HG08', N'Lancôme'),
('HG09', N'Cetaphil'), ('HG10', N'La Roche-Posay'), ('HG11', N'Neutrogena'), ('HG12', N'Olay'),
('HG13', N'Dove'), ('HG14', N'Nivea'), ('HG15', N'Garnier'), ('HG16', N'SK-II'),
('HG17', N'Shiseido'), ('HG18', N'Sulwhasoo'), ('HG19', N'Laneige'), ('HG20', N'Vichy');

-- ============================================================================
-- 4. NHÂN VIÊN
-- ============================================================================
INSERT INTO dbo.NhanVien (MaNV, HoTen, ChucVu, Email) VALUES 
('NV001', N'Nguyễn Văn Quản Lý', N'Quản lý', 'quanly@watsons.vn'),
('NV002', N'Trần Thị Bán Hàng', N'Nhân viên', 'banhang@watsons.vn'),
('NV003', N'Lê Minh Thu', N'Nhân viên', 'minhthu@watsons.vn'),
('NV004', N'Phạm Văn Kho', N'Thủ kho', 'thukho@watsons.vn'),
('NV005', N'Hoàng Thị Linh', N'Kế toán', 'ketoan@watsons.vn'),
('NV006', N'Đặng Văn Long', N'Nhân viên', 'vanlong@watsons.vn'),
('NV007', N'Võ Thị Hoa', N'Nhân viên', 'thihoa@watsons.vn'),
('NV008', N'Bùi Minh Tâm', N'Trưởng ca', 'truongca@watsons.vn'),
('NV009', N'Ngô Thị Mai', N'Nhân viên', 'thimai@watsons.vn'),
('NV010', N'Trương Văn Đức', N'Bảo vệ', 'baove@watsons.vn'),
('NV011', N'Phan Thị Lan', N'Nhân viên', 'thilan@watsons.vn'),
('NV012', N'Hồ Minh Tuấn', N'Nhân viên', 'minhtuan@watsons.vn'),
('NV013', N'Lý Thị Nga', N'Thu ngân', 'thinga@watsons.vn'),
('NV014', N'Đỗ Văn Hùng', N'Nhân viên', 'vanhung@watsons.vn'),
('NV015', N'Vũ Thị Hằng', N'Nhân viên', 'thihang@watsons.vn');

-- ============================================================================
-- 5. TÀI KHOẢN
-- ============================================================================
-- MatKhauHash = SHA256('123456') = '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92'
INSERT INTO dbo.TaiKhoan (TenDangNhap, MatKhauHash, MaNV, VaiTro) VALUES 
('admin', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', 'NV001', 'Admin'),
('nhanvien', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', 'NV002', 'NhanVien'),
('ketoan', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', 'NV005', 'KeToan'),
('thukho', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', 'NV004', 'ThuKho'),
('truongca', '8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92', 'NV008', 'NhanVien');

-- ============================================================================
-- 6. TÀI KHOẢN KẾ TOÁN
-- ============================================================================
INSERT INTO dbo.TaiKhoanCap1 (MaTK, TenTK, TinhChat) VALUES
('1', N'Tài sản', 'No'), 
('2', N'Vật tư, hàng hóa', 'No'), 
('3', N'Nợ phải trả', 'Co'),
('4', N'Vốn chủ sở hữu', 'Co'), 
('5', N'Doanh thu', 'Co'), 
('6', N'Chi phí', 'No'),
('7', N'Thu nhập khác', 'Co'), 
('8', N'Chi phí khác', 'No');

INSERT INTO dbo.TaiKhoanCap2 (MaTK, TenTK, TKCha, TinhChat) VALUES
('111', N'Tiền mặt', '1', 'No'), 
('112', N'Tiền gửi ngân hàng', '1', 'No'), 
('131', N'Phải thu khách hàng', '1', 'LuongTinh'),
('156', N'Hàng hóa', '1', 'No'), 
('331', N'Phải trả người bán', '3', 'LuongTinh'),
('334', N'Phải trả người lao động', '3', 'Co'),
('411', N'Vốn đầu tư', '4', 'Co'),
('511', N'Doanh thu bán hàng', '5', 'Co'), 
('632', N'Giá vốn hàng bán', '6', 'No'), 
('711', N'Thu nhập khác', '7', 'Co'),
('811', N'Chi phí khác', '8', 'No');

INSERT INTO dbo.TaiKhoanChiTiet (MaTK, TenTK, TKCha, TinhChat) VALUES
('111.TM', N'Tiền mặt tại quỹ', '111', 'No'), 
('112.VCB', N'TGNH Vietcombank', '112', 'No'),
('112.TCB', N'TGNH Techcombank', '112', 'No'),
('112.ACB', N'TGNH ACB', '112', 'No'),
('156.HH', N'Hàng hóa trong kho', '156', 'No'), 
('511.BH', N'Doanh thu bán hàng', '511', 'Co'),
('632.GV', N'Giá vốn hàng bán', '632', 'No'), 
('411.VCSH', N'Vốn chủ sở hữu', '411', 'Co');

-- ============================================================================
-- 7. NHÀ CUNG CẤP
-- ============================================================================
INSERT INTO dbo.NhaCungCap (MaNCC, TenNCC, SDT, MaTK_CongNo) VALUES 
('NCC001', N'Công ty Cocoon', '0281111', NULL), 
('NCC002', N'Innisfree Việt Nam', '0282222', NULL),
('NCC003', N'The Face Shop VN', '0283333', NULL), 
('NCC004', N'Senka Distributor', '0284444', NULL),
('NCC005', N'Bioré Vietnam', '0285555', NULL), 
('NCC006', N'L''Oréal Vietnam', '0286666', NULL),
('NCC007', N'Maybelline VN', '0287777', NULL), 
('NCC008', N'Lancôme Vietnam', '0288888', NULL),
('NCC009', N'Cetaphil Distributor', '0289999', NULL), 
('NCC010', N'La Roche Posay VN', '0281010', NULL),
('NCC011', N'Neutrogena VN', '0281011', NULL), 
('NCC012', N'Olay Vietnam', '0281012', NULL),
('NCC013', N'Dove Vietnam', '0281013', NULL), 
('NCC014', N'Nivea VN', '0281014', NULL),
('NCC015', N'Garnier Vietnam', '0281015', NULL);

-- Tạo TK công nợ cho NCC
INSERT INTO dbo.TaiKhoanChiTiet (MaTK, TenTK, TKCha, TinhChat)
SELECT v.MaTK, v.TenTK, v.TKCha, v.TinhChat
FROM (VALUES
('331.NCC001', N'Phải trả Công ty Cocoon', '331', 'LuongTinh'), 
('331.NCC002', N'Phải trả Innisfree VN', '331', 'LuongTinh'),
('331.NCC003', N'Phải trả The Face Shop', '331', 'LuongTinh'), 
('331.NCC004', N'Phải trả Senka', '331', 'LuongTinh'),
('331.NCC005', N'Phải trả Bioré', '331', 'LuongTinh'), 
('331.NCC006', N'Phải trả L''Oréal', '331', 'LuongTinh'),
('331.NCC007', N'Phải trả Maybelline', '331', 'LuongTinh'), 
('331.NCC008', N'Phải trả Lancôme', '331', 'LuongTinh'),
('331.NCC009', N'Phải trả Cetaphil', '331', 'LuongTinh'), 
('331.NCC010', N'Phải trả La Roche Posay', '331', 'LuongTinh'),
('331.NCC011', N'Phải trả Neutrogena', '331', 'LuongTinh'), 
('331.NCC012', N'Phải trả Olay', '331', 'LuongTinh'),
('331.NCC013', N'Phải trả Dove', '331', 'LuongTinh'), 
('331.NCC014', N'Phải trả Nivea', '331', 'LuongTinh'),
('331.NCC015', N'Phải trả Garnier', '331', 'LuongTinh')
) AS v(MaTK, TenTK, TKCha, TinhChat)
WHERE NOT EXISTS (SELECT 1 FROM dbo.TaiKhoanChiTiet tk WHERE tk.MaTK = v.MaTK);

UPDATE dbo.NhaCungCap SET MaTK_CongNo = '331.' + MaNCC WHERE MaTK_CongNo IS NULL;

-- ============================================================================
-- 8. KHÁCH HÀNG
-- ============================================================================
INSERT INTO dbo.KhachHang (MaKH, HoTen, SDT, MaTK_CongNo, LoaiKH, DiemTichLuy) VALUES 
('KH000', N'🛒 Khách lẻ (Vãng lai)', '', NULL, 'Thuong', 0),
('KH001', N'Lê Thị A', '0909001', NULL, 'Thuong', 0), 
('KH002', N'Nguyễn Văn B', '0909002', NULL, 'VIP', 1000),
('KH003', N'Trần Thị C', '0909003', NULL, 'Si', 500), 
('KH004', N'Phạm Văn D', '0909004', NULL, 'Thuong', 250),
('KH005', N'Hoàng Thị E', '0909005', NULL, 'VIP', 1500), 
('KH006', N'Đặng Văn F', '0909006', NULL, 'Thuong', 100),
('KH007', N'Võ Thị G', '0909007', NULL, 'Si', 800), 
('KH008', N'Bùi Văn H', '0909008', NULL, 'VIP', 2000),
('KH009', N'Ngô Thị I', '0909009', NULL, 'Thuong', 50), 
('KH010', N'Trương Văn K', '0909010', NULL, 'Si', 600),
('KH011', N'Phan Thị L', '0909011', NULL, 'Thuong', 300), 
('KH012', N'Hồ Văn M', '0909012', NULL, 'VIP', 2500),
('KH013', N'Lý Thị N', '0909013', NULL, 'Thuong', 150), 
('KH014', N'Đỗ Văn O', '0909014', NULL, 'Si', 700),
('KH015', N'Vũ Thị P', '0909015', NULL, 'VIP', 3000), 
('KH016', N'Mai Văn Q', '0909016', NULL, 'Thuong', 80),
('KH017', N'Cao Thị R', '0909017', NULL, 'Si', 900), 
('KH018', N'Đinh Văn S', '0909018', NULL, 'Thuong', 200),
('KH019', N'Tô Thị T', '0909019', NULL, 'VIP', 1800), 
('KH020', N'Dương Văn U', '0909020', NULL, 'Thuong', 120);

-- Tạo TK công nợ cho KH
INSERT INTO dbo.TaiKhoanChiTiet (MaTK, TenTK, TKCha, TinhChat)
SELECT '131.' + MaKH, N'Phải thu ' + HoTen, '131', 'LuongTinh'
FROM dbo.KhachHang;

UPDATE dbo.KhachHang SET MaTK_CongNo = '131.' + MaKH;

-- Tạo TK công nợ cho NhanVien (TK 334 - Phải trả người lao động)
INSERT INTO dbo.TaiKhoanChiTiet (MaTK, TenTK, TKCha, TinhChat)
SELECT '334.' + MaNV, N'Phải trả NV - ' + HoTen, '334', 'Co'
FROM dbo.NhanVien
WHERE MaNV IN ('NV001', 'NV002', 'NV003', 'NV004', 'NV005');

UPDATE dbo.NhanVien SET MaTK_CongNo = '334.' + MaNV WHERE MaNV IN ('NV001', 'NV002', 'NV003', 'NV004', 'NV005');

-- ============================================================================
-- 9. SẢN PHẨM
-- ============================================================================
INSERT INTO dbo.SanPham (MaSP, TenSP, MaLoai, MaHang, MaDonVi, GiaNhap, GiaBanLe, GiaBanSi, GiaBanVIP, SoLuongTon) VALUES 
-- Chăm sóc da
('SP001', N'Tẩy trang Cocoon 140ml', 'LSP01', 'HG01', 'CHAI', 100000, 150000, 140000, 130000, 50),
('SP002', N'Kem dưỡng Innisfree 50ml', 'LSP01', 'HG02', 'HOP', 200000, 280000, 260000, 240000, 30),
('SP003', N'Sữa rửa mặt The Face Shop', 'LSP01', 'HG03', 'TUB', 80000, 120000, 110000, 100000, 100),
('SP004', N'Nước hoa hồng Senka 200ml', 'LSP01', 'HG04', 'CHAI', 150000, 220000, 200000, 180000, 40),
('SP005', N'Bioré Cleansing Oil 150ml', 'LSP01', 'HG05', 'CHAI', 180000, 250000, 230000, 210000, 25),
('SP006', N'Kem dưỡng Olay 50g', 'LSP01', 'HG12', 'HOP', 220000, 320000, 300000, 280000, 35),
('SP007', N'Nước tẩy trang Garnier 400ml', 'LSP01', 'HG15', 'CHAI', 130000, 190000, 175000, 160000, 60),
('SP008', N'Kem dưỡng La Roche Posay 40ml', 'LSP01', 'HG10', 'TUB', 300000, 450000, 420000, 390000, 20),
-- Trang điểm
('SP009', N'Son L''Oréal Color Riche', 'LSP03', 'HG06', 'CAI', 120000, 180000, 165000, 150000, 60),
('SP010', N'Mascara Maybelline', 'LSP03', 'HG07', 'CAI', 100000, 150000, 140000, 130000, 45),
('SP011', N'Phấn nước Laneige', 'LSP03', 'HG19', 'HOP', 280000, 420000, 390000, 360000, 28),
('SP012', N'Cushion Innisfree', 'LSP03', 'HG02', 'HOP', 190000, 280000, 260000, 240000, 32),
-- Nước hoa
('SP013', N'Nước hoa Lancôme 50ml', 'LSP04', 'HG08', 'CHAI', 1500000, 2200000, 2100000, 2000000, 10),
('SP014', N'Nước hoa L''Oréal 75ml', 'LSP04', 'HG06', 'CHAI', 800000, 1200000, 1100000, 1000000, 15),
-- Chăm sóc cơ thể
('SP015', N'Sữa tắm Dove 500ml', 'LSP05', 'HG13', 'CHAI', 70000, 110000, 100000, 90000, 80),
('SP016', N'Dưỡng thể Nivea 200ml', 'LSP05', 'HG14', 'CHAI', 90000, 140000, 130000, 120000, 55),
('SP017', N'Sữa tắm Olay 400ml', 'LSP05', 'HG12', 'CHAI', 85000, 130000, 120000, 110000, 65),
-- Chăm sóc tóc
('SP018', N'Dầu gội Dove 650ml', 'LSP02', 'HG13', 'CHAI', 110000, 165000, 150000, 140000, 70),
('SP019', N'Dầu xả Pantene 300ml', 'LSP02', 'HG06', 'CHAI', 95000, 145000, 135000, 125000, 48),
('SP020', N'Kem ủ tóc Dove 200ml', 'LSP02', 'HG13', 'HU', 120000, 180000, 165000, 150000, 38),
-- Chăm sóc da (tiếp)
('SP021', N'Sữa rửa mặt Cetaphil 237ml', 'LSP01', 'HG09', 'CHAI', 250000, 350000, 330000, 310000, 35),
('SP022', N'Toner La Roche Posay 200ml', 'LSP01', 'HG10', 'CHAI', 320000, 480000, 450000, 420000, 22),
('SP023', N'Gel rửa mặt Neutrogena 200ml', 'LSP01', 'HG11', 'TUB', 180000, 270000, 250000, 230000, 42),
('SP024', N'Essence SK-II 75ml', 'LSP14', 'HG16', 'CHAI', 2800000, 4200000, 4000000, 3800000, 8),
('SP025', N'Serum Vichy 30ml', 'LSP14', 'HG20', 'CHAI', 450000, 680000, 630000, 590000, 18),
-- Chống nắng
('SP026', N'Kem chống nắng Bioré 50ml', 'LSP12', 'HG05', 'TUB', 180000, 270000, 250000, 230000, 55),
('SP027', N'Kem chống nắng La Roche 50ml', 'LSP12', 'HG10', 'TUB', 320000, 480000, 450000, 420000, 28),
('SP028', N'Xịt chống nắng Neutrogena 140ml', 'LSP12', 'HG11', 'CHAI', 240000, 360000, 335000, 310000, 33),
-- Mặt nạ
('SP029', N'Mặt nạ Innisfree (hộp 10 miếng)', 'LSP13', 'HG02', 'HOP', 180000, 270000, 250000, 230000, 45),
('SP030', N'Mặt nạ The Face Shop (hộp 5 miếng)', 'LSP13', 'HG03', 'HOP', 100000, 150000, 140000, 130000, 68),
-- Dưỡng môi
('SP031', N'Son dưỡng Nivea 4.8g', 'LSP11', 'HG14', 'CAI', 35000, 55000, 50000, 45000, 120),
('SP032', N'Son dưỡng L''Oréal 3.7g', 'LSP11', 'HG06', 'CAI', 55000, 85000, 78000, 72000, 95),
-- Phụ kiện
('SP033', N'Bông tẩy trang (bịch 80 miếng)', 'LSP10', 'HG05', 'GOI', 25000, 40000, 38000, 35000, 150),
('SP034', N'Cọ trang điểm (bộ 7 cây)', 'LSP10', 'HG07', 'BO', 180000, 280000, 260000, 240000, 25),
('SP035', N'Gương trang điểm mini', 'LSP10', 'HG14', 'CAI', 85000, 130000, 120000, 110000, 40),
-- Thêm các sản phẩm khác
('SP036', N'Nước súc miệng Listerine 750ml', 'LSP09', 'HG06', 'CHAI', 95000, 145000, 135000, 125000, 52),
('SP037', N'Kem đánh răng Colgate 200g', 'LSP09', 'HG06', 'TUB', 45000, 70000, 65000, 60000, 180),
('SP038', N'Dầu dưỡng tóc Dove 40ml', 'LSP02', 'HG13', 'CHAI', 65000, 100000, 92000, 85000, 73),
('SP039', N'Kem ủ tóc Olay 180ml', 'LSP02', 'HG12', 'HU', 110000, 165000, 153000, 142000, 41),
('SP040', N'Sữa tắm Bioré 800ml', 'LSP05', 'HG05', 'CHAI', 135000, 205000, 190000, 175000, 59);

-- Tạo TK hàng tồn kho cho SanPham (TK 156 - Hàng hóa)
INSERT INTO dbo.TaiKhoanChiTiet (MaTK, TenTK, TKCha, TinhChat)
SELECT '156.' + MaSP, N'Hàng hóa - ' + TenSP, '156', 'No'
FROM dbo.SanPham
WHERE MaSP IN ('SP001', 'SP002', 'SP003', 'SP004', 'SP005', 'SP006', 'SP007', 'SP008', 'SP009', 'SP010');

UPDATE dbo.SanPham SET MaTK = '156.' + MaSP 
WHERE MaSP IN ('SP001', 'SP002', 'SP003', 'SP004', 'SP005', 'SP006', 'SP007', 'SP008', 'SP009', 'SP010');

-- ============================================================================
-- 10. LOẠI CHỨNG TỪ
-- ============================================================================
INSERT INTO dbo.LoaiChungTu (MaLCT, TenLCT) VALUES
('PT', N'Phiếu thu'), 
('PC', N'Phiếu chi'), 
('PNK', N'Phiếu nhập kho'), 
('PBH', N'Phiếu bán hàng'),
('PTN', N'Phiếu trả hàng nhập'), 
('PTB', N'Phiếu trả hàng bán'), 
('PXK', N'Phiếu xuất kho'), 
('PKK', N'Phiếu kiểm kê');

-- ============================================================================
-- 11. QUY ĐỊNH NGHIỆP VỤ
-- ============================================================================
INSERT INTO dbo.QuyDinhNghiepVu (MaQuyDinh, GiaTri, MoTa) VALUES
('SL_MUA_SI', '5', N'Số lượng tối thiểu để được giá sỉ'), 
('VIP_UPGRADE_DIEM', '1000', N'Số điểm để nâng hạng VIP'),
('DIEM_TO_VND', '1000', N'1000 điểm = 1000 VND'), 
('VND_TO_DIEM', '10000', N'10,000 VND chi tiêu = 1 điểm'),
('MAX_DISCOUNT_PERCENT', '50', N'Tỷ lệ giảm giá tối đa (%)'), 
('MIN_ORDER_VALUE', '50000', N'Giá trị đơn hàng tối thiểu'),
('MAX_DEBT_LIMIT', '10000000', N'Hạn mức công nợ tối đa'), 
('LOYALTY_EXPIRE_DAYS', '365', N'Số ngày điểm tích lũy hết hạn'),
('RETURN_DAYS', '7', N'Số ngày được trả hàng'), 
('WARRANTY_DAYS', '30', N'Số ngày bảo hành sản phẩm');

-- ============================================================================
-- 12. KHUYẾN MÃI
-- ============================================================================
INSERT INTO dbo.KhuyenMai (MaKM, TenKM, LoaiKM, TyLeGiam, SoTienGiam, DieuKienGiaToiThieu, TuNgay, DenNgay, SoLuong, TrangThai) VALUES
('GIAM10', N'Giảm 10% tổng hóa đơn', 'Percent', 10, 0, 200000, '2025-01-01', '2025-12-31', NULL, 1),
('GIAM50K', N'Giảm 50K cho đơn từ 500K', 'Amount', 0, 50000, 500000, '2025-01-01', '2025-12-31', NULL, 1),
('GIAM15', N'Giảm 15% cho khách VIP', 'Percent', 15, 0, 300000, '2025-01-01', '2025-06-30', NULL, 1),
('GIAM100K', N'Giảm 100K cho đơn từ 1 triệu', 'Amount', 0, 100000, 1000000, '2025-01-01', '2025-03-31', 100, 1),
('TET2025', N'Khuyến mãi Tết Nguyên Đán', 'Percent', 20, 0, 500000, '2025-01-20', '2025-02-10', 500, 1),
('FLASH20', N'Flash Sale giảm 20%', 'Percent', 20, 0, 100000, '2025-01-15', '2025-01-15', 200, 1),
('NEWMEMBER', N'Ưu đãi thành viên mới', 'Amount', 0, 30000, 150000, '2025-01-01', '2025-12-31', NULL, 1),
('BIRTHDAY', N'Quà tặng sinh nhật', 'Percent', 25, 0, 200000, '2025-01-01', '2025-12-31', NULL, 1),
('FREESHIP', N'Miễn phí vận chuyển', 'Amount', 0, 25000, 300000, '2025-01-01', '2025-12-31', NULL, 1),
('COMBO3', N'Mua 3 giảm 30%', 'Percent', 30, 0, 400000, '2025-01-01', '2025-06-30', NULL, 1),
('GIAM5', N'Giảm 5% mọi đơn hàng', 'Percent', 5, 0, 100000, '2025-01-01', '2025-12-31', NULL, 1),
('GIAM200K', N'Giảm 200K cho đơn từ 2 triệu', 'Amount', 0, 200000, 2000000, '2025-01-01', '2025-12-31', 50, 1),
('WEEKEND', N'Giảm 12% cuối tuần', 'Percent', 12, 0, 250000, '2025-01-01', '2025-12-31', NULL, 1),
('BLACKFRI', N'Black Friday Sale 35%', 'Percent', 35, 0, 600000, '2025-11-28', '2025-11-29', 300, 1),
('SUMMER', N'Khuyến mãi mùa hè', 'Percent', 18, 0, 350000, '2025-06-01', '2025-08-31', NULL, 1);

-- ============================================================================
-- 13. SỐ DƯ ĐẦU KỲ
-- ============================================================================
INSERT INTO dbo.SoDuDauKy (MaTK, NgayDauKy, DuNoDau, DuCoDau) VALUES
('111.TM', '2025-01-01', 50000000, 0), 
('112.VCB', '2025-01-01', 100000000, 0), 
('112.TCB', '2025-01-01', 75000000, 0),
('156.HH', '2025-01-01', 80000000, 0),
('411.VCSH', '2025-01-01', 0, 305000000), 
('131.KH002', '2025-01-01', 5000000, 0), 
('131.KH005', '2025-01-01', 3000000, 0),
('131.KH008', '2025-01-01', 7000000, 0), 
('131.KH012', '2025-01-01', 4000000, 0),
('331.NCC001', '2025-01-01', 0, 10000000), 
('331.NCC002', '2025-01-01', 0, 8000000),
('331.NCC006', '2025-01-01', 0, 15000000),
('331.NCC008', '2025-01-01', 0, 12000000);

-- ============================================================================
-- 14. DỮ LIỆU MẪU CHỨNG TỪ (SỬ DỤNG SP)
-- ============================================================================

-- Phiếu nhập kho 1
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0001', @MaNCC = N'NCC001', @MaNV = N'NV004', @DienGiai = N'Nhập hàng Cocoon tháng 1', @ThanhToanTienMat = 1000000,
    @JsonChiTietSP = N'[{"MaSP":"SP001","SoLuong":20,"DonGia":95000},{"MaSP":"SP003","SoLuong":30,"DonGia":75000},{"MaSP":"SP006","SoLuong":15,"DonGia":210000}]';

-- Phiếu nhập kho 2
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0002', @MaNCC = N'NCC002', @MaNV = N'NV004', @DienGiai = N'Nhập hàng Innisfree tháng 1', @ThanhToanTienMat = 0,
    @JsonChiTietSP = N'[{"MaSP":"SP002","SoLuong":25,"DonGia":195000},{"MaSP":"SP004","SoLuong":20,"DonGia":145000},{"MaSP":"SP029","SoLuong":40,"DonGia":175000}]';

-- Phiếu nhập kho 3
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0003', @MaNCC = N'NCC006', @MaNV = N'NV004', @DienGiai = N'Nhập hàng L''Oréal tháng 1', @ThanhToanTienMat = 2000000,
    @JsonChiTietSP = N'[{"MaSP":"SP009","SoLuong":35,"DonGia":115000},{"MaSP":"SP010","SoLuong":30,"DonGia":95000},{"MaSP":"SP013","SoLuong":8,"DonGia":1450000}]';

-- Phiếu nhập kho 4
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0004', @MaNCC = N'NCC013', @MaNV = N'NV004', @DienGiai = N'Nhập hàng Dove tháng 1', @ThanhToanTienMat = 500000,
    @JsonChiTietSP = N'[{"MaSP":"SP015","SoLuong":50,"DonGia":68000},{"MaSP":"SP018","SoLuong":45,"DonGia":105000},{"MaSP":"SP020","SoLuong":25,"DonGia":115000}]';

-- Phiếu bán hàng 1
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0001', @MaKH = N'KH001', @MaNV = N'NV002', @DienGiai = N'Bán lẻ cho khách', @ThanhToanTienMat = 1, @MaKM = NULL, @DiemSuDung = 0,
    @JsonChiTietSP = N'[{"MaSP":"SP001","SoLuong":2},{"MaSP":"SP003","SoLuong":3}]';

-- Phiếu bán hàng 2 (khách VIP)
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0002', @MaKH = N'KH002', @MaNV = N'NV002', @DienGiai = N'Bán cho khách VIP', @ThanhToanTienMat = 1, @MaKM = 'GIAM15', @DiemSuDung = 0,
    @JsonChiTietSP = N'[{"MaSP":"SP013","SoLuong":1},{"MaSP":"SP002","SoLuong":2}]';

-- Phiếu bán hàng 3 (bán sỉ)
DECLARE @jsonPBH3 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP015","SoLuong":10},' +
    N'{"MaSP":"SP018","SoLuong":8}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0003',
    @MaKH = N'KH003',
    @MaNV = N'NV003',
    @DienGiai = N'Bán sỉ cho khách',
    @ThanhToanTienMat = 0,
    @MaKM = NULL,
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH3;

-- Phiếu bán hàng 4
DECLARE @jsonPBH4 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP009","SoLuong":3},' +
    N'{"MaSP":"SP010","SoLuong":2},' +
    N'{"MaSP":"SP031","SoLuong":5}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0004',
    @MaKH = N'KH004',
    @MaNV = N'NV002',
    @DienGiai = N'Bán lẻ trang điểm',
    @ThanhToanTienMat = 1,
    @MaKM = 'GIAM10',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH4;

-- Phiếu bán hàng 5
DECLARE @jsonPBH5 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP006","SoLuong":4},' +
    N'{"MaSP":"SP008","SoLuong":2},' +
    N'{"MaSP":"SP022","SoLuong":3}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0005',
    @MaKH = N'KH005',
    @MaNV = N'NV003',
    @DienGiai = N'Bán combo chăm sóc da cao cấp',
    @ThanhToanTienMat = 1,
    @MaKM = 'GIAM100K',
    @DiemSuDung = 500,
    @JsonChiTietSP = @jsonPBH5;

-- Bổ sung thêm 10 phiếu nhập kho (PNK) và 10 phiếu bán hàng (PBH)
-- Phiếu nhập kho 5
DECLARE @jsonPNK5 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP021","SoLuong":20,"DonGia":240000},' +
    N'{"MaSP":"SP022","SoLuong":15,"DonGia":300000},' +
    N'{"MaSP":"SP026","SoLuong":30,"DonGia":160000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0005',
    @MaNCC = N'NCC009',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập Cetaphil/La Roche/Bioré',
    @ThanhToanTienMat = 1000000,
    @JsonChiTietSP = @jsonPNK5;

-- Phiếu nhập kho 6
DECLARE @jsonPNK6 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP019","SoLuong":40,"DonGia":90000},' +
    N'{"MaSP":"SP020","SoLuong":25,"DonGia":110000},' +
    N'{"MaSP":"SP038","SoLuong":35,"DonGia":60000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0006',
    @MaNCC = N'NCC013',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập hàng Dove/Pantene',
    @ThanhToanTienMat = 0,
    @JsonChiTietSP = @jsonPNK6;

-- Phiếu nhập kho 7
DECLARE @jsonPNK7 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP033","SoLuong":120,"DonGia":22000},' +
    N'{"MaSP":"SP034","SoLuong":20,"DonGia":170000},' +
    N'{"MaSP":"SP035","SoLuong":35,"DonGia":70000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0007',
    @MaNCC = N'NCC007',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập phụ kiện làm đẹp',
    @ThanhToanTienMat = 500000,
    @JsonChiTietSP = @jsonPNK7;

-- Phiếu nhập kho 8
DECLARE @jsonPNK8 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP031","SoLuong":150,"DonGia":30000},' +
    N'{"MaSP":"SP032","SoLuong":120,"DonGia":50000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0008',
    @MaNCC = N'NCC014',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập dưỡng môi Nivea/L''Oréal',
    @ThanhToanTienMat = 0,
    @JsonChiTietSP = @jsonPNK8;

-- Phiếu nhập kho 9
DECLARE @jsonPNK9 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP036","SoLuong":60,"DonGia":85000},' +
    N'{"MaSP":"SP037","SoLuong":200,"DonGia":40000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0009',
    @MaNCC = N'NCC006',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập vệ sinh cá nhân',
    @ThanhToanTienMat = 1500000,
    @JsonChiTietSP = @jsonPNK9;

-- Phiếu nhập kho 10
DECLARE @jsonPNK10 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP024","SoLuong":5,"DonGia":2600000},' +
    N'{"MaSP":"SP025","SoLuong":25,"DonGia":430000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0010',
    @MaNCC = N'NCC008',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập cao cấp SK-II/Vichy',
    @ThanhToanTienMat = 0,
    @JsonChiTietSP = @jsonPNK10;

-- Phiếu nhập kho 11
DECLARE @jsonPNK11 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP015","SoLuong":40,"DonGia":65000},' +
    N'{"MaSP":"SP016","SoLuong":35,"DonGia":85000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0011',
    @MaNCC = N'NCC013',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập chăm sóc cơ thể',
    @ThanhToanTienMat = 300000,
    @JsonChiTietSP = @jsonPNK11;

-- Phiếu nhập kho 12
DECLARE @jsonPNK12 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP009","SoLuong":50,"DonGia":110000},' +
    N'{"MaSP":"SP010","SoLuong":45,"DonGia":90000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0012',
    @MaNCC = N'NCC007',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập trang điểm',
    @ThanhToanTienMat = 0,
    @JsonChiTietSP = @jsonPNK12;

-- Phiếu nhập kho 13
DECLARE @jsonPNK13 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP021","SoLuong":30,"DonGia":230000},' +
    N'{"MaSP":"SP023","SoLuong":25,"DonGia":170000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0013',
    @MaNCC = N'NCC009',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập Cetaphil/Neutrogena',
    @ThanhToanTienMat = 500000,
    @JsonChiTietSP = @jsonPNK13;

-- Phiếu nhập kho 14
DECLARE @jsonPNK14 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP033","SoLuong":100,"DonGia":22000},' +
    N'{"MaSP":"SP035","SoLuong":40,"DonGia":75000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho
    @MaCT = N'PNK0014',
    @MaNCC = N'NCC005',
    @MaNV = N'NV004',
    @DienGiai = N'Nhập phụ kiện bổ sung',
    @ThanhToanTienMat = 0,
    @JsonChiTietSP = @jsonPNK14;

-- Phiếu bán hàng 6
DECLARE @jsonPBH6 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP021","SoLuong":2},' +
    N'{"MaSP":"SP026","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0006',
    @MaKH = N'KH006',
    @MaNV = N'NV002',
    @DienGiai = N'Bán lẻ chăm sóc da + chống nắng',
    @ThanhToanTienMat = 1,
    @MaKM = NULL,
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH6;

-- Phiếu bán hàng 7
DECLARE @jsonPBH7 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP009","SoLuong":2},' +
    N'{"MaSP":"SP010","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0007',
    @MaKH = N'KH007',
    @MaNV = N'NV003',
    @DienGiai = N'Trang điểm cơ bản',
    @ThanhToanTienMat = 1,
    @MaKM = 'GIAM5',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH7;

-- Phiếu bán hàng 8
DECLARE @jsonPBH8 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP033","SoLuong":3},' +
    N'{"MaSP":"SP035","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0008',
    @MaKH = N'KH008',
    @MaNV = N'NV003',
    @DienGiai = N'Phụ kiện làm đẹp',
    @ThanhToanTienMat = 1,
    @MaKM = 'FLASH20',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH8;

-- Phiếu bán hàng 9
DECLARE @jsonPBH9 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP015","SoLuong":4},' +
    N'{"MaSP":"SP018","SoLuong":3}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0009',
    @MaKH = N'KH009',
    @MaNV = N'NV002',
    @DienGiai = N'Combo sữa tắm + dầu gội',
    @ThanhToanTienMat = 1,
    @MaKM = 'NEWMEMBER',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH9;

-- Phiếu bán hàng 10
DECLARE @jsonPBH10 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP013","SoLuong":1},' +
    N'{"MaSP":"SP012","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0010',
    @MaKH = N'KH010',
    @MaNV = N'NV003',
    @DienGiai = N'Lancôme + Cushion',
    @ThanhToanTienMat = 0,
    @MaKM = 'BIRTHDAY',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH10;

-- Phiếu bán hàng 11
DECLARE @jsonPBH11 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP021","SoLuong":1},' +
    N'{"MaSP":"SP023","SoLuong":2}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0011',
    @MaKH = N'KH011',
    @MaNV = N'NV002',
    @DienGiai = N'Cetaphil + Neutrogena',
    @ThanhToanTienMat = 1,
    @MaKM = NULL,
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH11;

-- Phiếu bán hàng 12
DECLARE @jsonPBH12 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP026","SoLuong":2},' +
    N'{"MaSP":"SP027","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0012',
    @MaKH = N'KH012',
    @MaNV = N'NV003',
    @DienGiai = N'Chống nắng Bioré/La Roche',
    @ThanhToanTienMat = 1,
    @MaKM = 'WEEKEND',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH12;

-- Phiếu bán hàng 13
DECLARE @jsonPBH13 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP033","SoLuong":5},' +
    N'{"MaSP":"SP037","SoLuong":2}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0013',
    @MaKH = N'KH013',
    @MaNV = N'NV002',
    @DienGiai = N'Vệ sinh cá nhân + phụ kiện',
    @ThanhToanTienMat = 1,
    @MaKM = 'FREESHIP',
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH13;

-- Phiếu bán hàng 14
DECLARE @jsonPBH14 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP031","SoLuong":3},' +
    N'{"MaSP":"SP032","SoLuong":2}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0014',
    @MaKH = N'KH014',
    @MaNV = N'NV003',
    @DienGiai = N'Dưỡng môi Nivea/L''Oréal',
    @ThanhToanTienMat = 1,
    @MaKM = NULL,
    @DiemSuDung = 0,
    @JsonChiTietSP = @jsonPBH14;

-- Phiếu bán hàng 15
DECLARE @jsonPBH15 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP024","SoLuong":1},' +
    N'{"MaSP":"SP025","SoLuong":2}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang
    @MaCT = N'PBH0015',
    @MaKH = N'KH015',
    @MaNV = N'NV002',
    @DienGiai = N'Combo cao cấp SK-II + Vichy',
    @ThanhToanTienMat = 0,
    @MaKM = 'GIAM200K',
    @DiemSuDung = 1000,
    @JsonChiTietSP = @jsonPBH15;

-- Phiếu thu nợ
EXEC dbo.usp_TaoPhieuThuNo
    @MaCT = N'PT0001',
    @MaKH = N'KH002',
    @MaNV = N'NV002',
    @SoTien = 2000000,
    @DienGiai = N'Thu nợ khách hàng KH002';

-- Phiếu chi trả nợ
EXEC dbo.usp_TaoPhieuChiTraNo
    @MaCT = N'PC0001',
    @MaNCC = N'NCC001',
    @MaNV = N'NV005',
    @SoTien = 5000000,
    @DienGiai = N'Trả nợ NCC Cocoon';

-- ============================================================================
-- 15. CA LÀM VIỆC MẪU
-- ============================================================================
INSERT INTO dbo.CaLamViec (MaCa, MaNV, GioBatDau, GioKetThuc, TienDauCa, TongThuTM, TongChiTM, TienThucTe, TrangThai) VALUES
('CA001', 'NV002', '2025-01-05 08:00:00', '2025-01-05 17:00:00', 5000000, 8500000, 1000000, 12500000, 'DaDong'),
('CA002', 'NV003', '2025-01-05 08:00:00', '2025-01-05 17:00:00', 5000000, 6200000, 500000, 10700000, 'DaDong'),
('CA003', 'NV002', '2025-01-06 08:00:00', '2025-01-06 17:00:00', 5000000, 7800000, 800000, 12000000, 'DaDong'),
('CA004', 'NV003', '2025-01-06 08:00:00', NULL, 5000000, 0, 0, NULL, 'DangMo');

-- 16. BỔ SUNG DỮ LIỆU THÁNG 11 (TĂNG ĐỘ PHONG PHÚ CHO DASHBOARD)

-- Thêm 5 phiếu nhập kho (PNK0015 - PNK0019)
DECLARE @jsonPNK15 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP026","SoLuong":40,"DonGia":165000},' +
    N'{"MaSP":"SP027","SoLuong":30,"DonGia":460000},' +
    N'{"MaSP":"SP028","SoLuong":25,"DonGia":230000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0015', @MaNCC = N'NCC010', @MaNV = N'NV004', @DienGiai = N'Nhập chống nắng tháng 11', @ThanhToanTienMat = 0, @JsonChiTietSP = @jsonPNK15;

DECLARE @jsonPNK16 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP018","SoLuong":50,"DonGia":108000},' +
    N'{"MaSP":"SP019","SoLuong":60,"DonGia":88000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0016', @MaNCC = N'NCC013', @MaNV = N'NV004', @DienGiai = N'Bổ sung chăm sóc tóc 11', @ThanhToanTienMat = 500000, @JsonChiTietSP = @jsonPNK16;

DECLARE @jsonPNK17 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP033","SoLuong":150,"DonGia":21000},' +
    N'{"MaSP":"SP037","SoLuong":220,"DonGia":38000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0017', @MaNCC = N'NCC005', @MaNV = N'NV004', @DienGiai = N'Nhập vệ sinh/phụ kiện 11', @ThanhToanTienMat = 0, @JsonChiTietSP = @jsonPNK17;

DECLARE @jsonPNK18 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP001","SoLuong":30,"DonGia":97000},' +
    N'{"MaSP":"SP007","SoLuong":40,"DonGia":125000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0018', @MaNCC = N'NCC001', @MaNV = N'NV004', @DienGiai = N'Nhập Cocoon/Garnier 11', @ThanhToanTienMat = 1000000, @JsonChiTietSP = @jsonPNK18;

DECLARE @jsonPNK19 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP024","SoLuong":6,"DonGia":2550000},' +
    N'{"MaSP":"SP025","SoLuong":20,"DonGia":420000}' +
N']';
EXEC dbo.usp_TaoPhieuNhapKho @MaCT = N'PNK0019', @MaNCC = N'NCC008', @MaNV = N'NV004', @DienGiai = N'Nhập cao cấp tháng 11', @ThanhToanTienMat = 0, @JsonChiTietSP = @jsonPNK19;

-- Thêm 5 phiếu bán hàng (PBH0016 - PBH0020)
DECLARE @jsonPBH16 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP026","SoLuong":2},' +
    N'{"MaSP":"SP027","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0016', @MaKH = N'KH016', @MaNV = N'NV002', @DienGiai = N'Chống nắng tháng 11', @ThanhToanTienMat = 1, @MaKM = 'WEEKEND', @DiemSuDung = 0, @JsonChiTietSP = @jsonPBH16;

DECLARE @jsonPBH17 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP018","SoLuong":3},' +
    N'{"MaSP":"SP019","SoLuong":2}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0017', @MaKH = N'KH017', @MaNV = N'NV003', @DienGiai = N'Combo tóc 11', @ThanhToanTienMat = 1, @MaKM = 'GIAM10', @DiemSuDung = 0, @JsonChiTietSP = @jsonPBH17;

DECLARE @jsonPBH18 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP033","SoLuong":4},' +
    N'{"MaSP":"SP037","SoLuong":3}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0018', @MaKH = N'KH018', @MaNV = N'NV003', @DienGiai = N'Phụ kiện + vệ sinh 11', @ThanhToanTienMat = 1, @MaKM = 'COMBO3', @DiemSuDung = 0, @JsonChiTietSP = @jsonPBH18;

DECLARE @jsonPBH19 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP001","SoLuong":2},' +
    N'{"MaSP":"SP007","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0019', @MaKH = N'KH019', @MaNV = N'NV002', @DienGiai = N'Chăm sóc da 11', @ThanhToanTienMat = 1, @MaKM = 'GIAM5', @DiemSuDung = 0, @JsonChiTietSP = @jsonPBH19;

DECLARE @jsonPBH20 NVARCHAR(MAX) = N'[' +
    N'{"MaSP":"SP024","SoLuong":1},' +
    N'{"MaSP":"SP025","SoLuong":1}' +
N']';
EXEC dbo.usp_TaoPhieuBanHang @MaCT = N'PBH0020', @MaKH = N'KH020', @MaNV = N'NV003', @DienGiai = N'Đơn cao cấp 11', @ThanhToanTienMat = 0, @MaKM = 'BLACKFRI', @DiemSuDung = 0, @JsonChiTietSP = @jsonPBH20;

-- ============================================================================
-- 17. MỞ RỘNG SẢN PHẨM + GIA TĂNG GIAO DỊCH (≈300 dòng)
-- ============================================================================
-- 17. MỞ RỘNG DANH MỤC SẢN PHẨM VÀ GIAO DỊCH

-- Thêm 80 sản phẩm mới (SP041 - SP120)
-- 17a. Thêm sản phẩm mới
INSERT INTO dbo.SanPham (MaSP, TenSP, MaLoai, MaHang, MaDonVi, GiaNhap, GiaBanLe, GiaBanSi, GiaBanVIP, SoLuongTon) VALUES
('SP041', N'Sữa rửa mặt Olay 150ml', 'LSP01', 'HG12', 'TUB', 95000, 140000, 130000, 120000, 60),
('SP042', N'Gel dưỡng ẩm Olay 50g', 'LSP01', 'HG12', 'HOP', 160000, 230000, 215000, 200000, 40),
('SP043', N'Serum Innisfree 30ml', 'LSP14', 'HG02', 'CHAI', 280000, 420000, 395000, 370000, 25),
('SP044', N'Mặt nạ Senka 10 miếng', 'LSP13', 'HG04', 'HOP', 150000, 220000, 205000, 190000, 50),
('SP045', N'Toner Nivea 200ml', 'LSP01', 'HG14', 'CHAI', 80000, 120000, 110000, 100000, 70),
('SP046', N'Kem mắt Vichy 15ml', 'LSP15', 'HG20', 'TUB', 380000, 560000, 530000, 500000, 18),
('SP047', N'Serum Garnier 30ml', 'LSP14', 'HG15', 'CHAI', 190000, 280000, 260000, 240000, 45),
('SP048', N'Sữa tắm Innisfree 500ml', 'LSP05', 'HG02', 'CHAI', 110000, 165000, 155000, 145000, 55),
('SP049', N'Nước hoa hồng Laneige 200ml', 'LSP01', 'HG19', 'CHAI', 320000, 480000, 450000, 420000, 22),
('SP050', N'Xịt khoáng La Roche 150ml', 'LSP01', 'HG10', 'CHAI', 200000, 300000, 285000, 270000, 30),
('SP051', N'Kem chống nắng Olay 50ml', 'LSP12', 'HG12', 'TUB', 140000, 210000, 195000, 180000, 48),
('SP052', N'Xịt chống nắng Laneige 100ml', 'LSP12', 'HG19', 'CHAI', 280000, 420000, 395000, 370000, 20),
('SP053', N'Son dưỡng Cocoon 5g', 'LSP11', 'HG01', 'CAI', 45000, 70000, 65000, 60000, 110),
('SP054', N'Son lì Maybelline', 'LSP03', 'HG07', 'CAI', 120000, 180000, 170000, 160000, 70),
('SP055', N'Bảng phấn mắt L''Oréal', 'LSP03', 'HG06', 'HOP', 220000, 330000, 310000, 290000, 25),
('SP056', N'Phấn phủ Innisfree', 'LSP03', 'HG02', 'HOP', 150000, 220000, 205000, 190000, 40),
('SP057', N'Kem lót Maybelline', 'LSP03', 'HG07', 'TUB', 130000, 200000, 185000, 170000, 50),
('SP058', N'Mascara L''Oréal Volume', 'LSP03', 'HG06', 'CAI', 110000, 170000, 160000, 150000, 65),
('SP059', N'Kem dưỡng môi Laneige', 'LSP11', 'HG19', 'HU', 180000, 270000, 255000, 240000, 35),
('SP060', N'Sữa tắm Dove 900ml', 'LSP05', 'HG13', 'CHAI', 95000, 145000, 135000, 125000, 90),
('SP061', N'Sữa dưỡng thể Nivea 400ml', 'LSP05', 'HG14', 'CHAI', 90000, 140000, 130000, 120000, 85),
('SP062', N'Dầu gội La Roche 300ml', 'LSP02', 'HG10', 'CHAI', 160000, 240000, 225000, 210000, 32),
('SP063', N'Dầu xả Garnier 300ml', 'LSP02', 'HG15', 'CHAI', 85000, 130000, 120000, 110000, 60),
('SP064', N'Kem ủ tóc Innisfree 200ml', 'LSP02', 'HG02', 'HU', 150000, 220000, 205000, 190000, 28),
('SP065', N'Nước súc miệng Olay 500ml', 'LSP09', 'HG12', 'CHAI', 65000, 100000, 92000, 85000, 70),
('SP066', N'Khăn giấy ướt Bioré', 'LSP09', 'HG05', 'GOI', 25000, 40000, 38000, 35000, 150),
('SP067', N'Bàn chải trang điểm mini', 'LSP10', 'HG07', 'BO', 120000, 180000, 170000, 160000, 40),
('SP068', N'Gương soi LED', 'LSP10', 'HG14', 'CAI', 150000, 230000, 215000, 200000, 35),
('SP069', N'Kẹp tóc thời trang', 'LSP10', 'HG15', 'CAI', 25000, 40000, 37000, 34000, 120),
('SP070', N'Nước hoa SK-II 50ml', 'LSP04', 'HG16', 'CHAI', 2000000, 3000000, 2850000, 2700000, 8),
('SP071', N'Nước hoa Shiseido 50ml', 'LSP04', 'HG17', 'CHAI', 1600000, 2400000, 2250000, 2100000, 12),
('SP072', N'Nước hoa Sulwhasoo 50ml', 'LSP04', 'HG18', 'CHAI', 1900000, 2800000, 2650000, 2500000, 10),
('SP073', N'Serum SK-II 30ml', 'LSP14', 'HG16', 'CHAI', 2200000, 3300000, 3150000, 3000000, 6),
('SP074', N'Kem chống nắng SK-II 50ml', 'LSP12', 'HG16', 'TUB', 1200000, 1800000, 1700000, 1600000, 9),
('SP075', N'Sữa rửa mặt Shiseido 150ml', 'LSP01', 'HG17', 'TUB', 400000, 600000, 570000, 540000, 20),
('SP076', N'Serum Shiseido 30ml', 'LSP14', 'HG17', 'CHAI', 900000, 1350000, 1280000, 1210000, 15),
('SP077', N'Sữa tắm Sulwhasoo 400ml', 'LSP05', 'HG18', 'CHAI', 450000, 680000, 640000, 600000, 18),
('SP078', N'Nước hoa Laneige 30ml', 'LSP04', 'HG19', 'CHAI', 1200000, 1800000, 1700000, 1600000, 10),
('SP079', N'Toner Laneige 200ml', 'LSP01', 'HG19', 'CHAI', 260000, 390000, 370000, 350000, 24),
('SP080', N'Kem dưỡng SK-II 50g', 'LSP01', 'HG16', 'HOP', 1800000, 2700000, 2550000, 2400000, 7),
('SP081', N'Kem dưỡng Shiseido 50g', 'LSP01', 'HG17', 'HOP', 900000, 1350000, 1280000, 1210000, 12),
('SP082', N'Xịt khoáng Shiseido 150ml', 'LSP01', 'HG17', 'CHAI', 350000, 520000, 495000, 470000, 22),
('SP083', N'Mặt nạ SK-II 6 miếng', 'LSP13', 'HG16', 'HOP', 1600000, 2400000, 2280000, 2160000, 9),
('SP084', N'Serum Vichy Mineral 30ml', 'LSP14', 'HG20', 'CHAI', 450000, 680000, 640000, 600000, 20),
('SP085', N'Kem dưỡng Vichy 50g', 'LSP01', 'HG20', 'HOP', 420000, 630000, 595000, 560000, 22),
('SP086', N'Sữa rửa mặt Vichy 200ml', 'LSP01', 'HG20', 'TUB', 220000, 330000, 310000, 290000, 35),
('SP087', N'Nước súc miệng Colgate 750ml', 'LSP09', 'HG06', 'CHAI', 90000, 140000, 130000, 120000, 80),
('SP088', N'Kem đánh răng Colgate Kids', 'LSP09', 'HG06', 'TUB', 40000, 65000, 60000, 55000, 160),
('SP089', N'Dầu gội Nivea Men 600ml', 'LSP02', 'HG14', 'CHAI', 125000, 190000, 175000, 160000, 50),
('SP090', N'Sữa tắm Olay Men 500ml', 'LSP05', 'HG12', 'CHAI', 110000, 165000, 155000, 145000, 55),
('SP091', N'Gel vuốt tóc Dove 100ml', 'LSP02', 'HG13', 'HU', 60000, 95000, 90000, 85000, 90),
('SP092', N'Xịt khử mùi Dove 200ml', 'LSP05', 'HG13', 'CHAI', 80000, 130000, 120000, 110000, 70),
('SP093', N'Nước hoa mini Vichy 20ml', 'LSP04', 'HG20', 'CHAI', 600000, 900000, 860000, 820000, 18),
('SP094', N'Bông tẩy trang Laneige 80 miếng', 'LSP10', 'HG19', 'GOI', 35000, 55000, 52000, 49000, 140),
('SP095', N'Cọ trang điểm SK-II 5 cây', 'LSP10', 'HG16', 'BO', 250000, 380000, 360000, 340000, 20),
('SP096', N'Gương trang điểm Shiseido', 'LSP10', 'HG17', 'CAI', 160000, 240000, 225000, 210000, 25),
('SP097', N'Phụ kiện tóc Laneige', 'LSP10', 'HG19', 'CAI', 30000, 50000, 47000, 44000, 120),
('SP098', N'Mặt nạ Vichy 10 miếng', 'LSP13', 'HG20', 'HOP', 200000, 300000, 285000, 270000, 35),
('SP099', N'Kem chống nắng Vichy 50ml', 'LSP12', 'HG20', 'TUB', 260000, 390000, 370000, 350000, 28),
('SP100', N'Serum Laneige 30ml', 'LSP14', 'HG19', 'CHAI', 320000, 480000, 455000, 430000, 26),
('SP101', N'Sữa rửa mặt Laneige 150ml', 'LSP01', 'HG19', 'TUB', 180000, 270000, 255000, 240000, 34),
('SP102', N'Kem dưỡng Laneige 50g', 'LSP01', 'HG19', 'HOP', 350000, 520000, 495000, 470000, 22),
('SP103', N'Nước hoa Vichy 50ml', 'LSP04', 'HG20', 'CHAI', 1300000, 1950000, 1860000, 1770000, 10),
('SP104', N'Mascara Laneige', 'LSP03', 'HG19', 'CAI', 120000, 180000, 170000, 160000, 40),
('SP105', N'Phấn phủ Laneige', 'LSP03', 'HG19', 'HOP', 220000, 330000, 310000, 290000, 28),
('SP106', N'Son dưỡng Vichy', 'LSP11', 'HG20', 'CAI', 55000, 85000, 80000, 75000, 100),
('SP107', N'Sữa tắm Colgate 500ml', 'LSP05', 'HG06', 'CHAI', 85000, 130000, 120000, 110000, 65),
('SP108', N'Kem đánh răng SK-II 100g', 'LSP09', 'HG16', 'TUB', 80000, 130000, 120000, 110000, 90),
('SP109', N'Khăn giấy ướt Laneige', 'LSP09', 'HG19', 'GOI', 30000, 50000, 47000, 44000, 120),
('SP110', N'Sữa dưỡng thể Shiseido', 'LSP05', 'HG17', 'CHAI', 280000, 420000, 395000, 370000, 25),
('SP111', N'Gel rửa mặt SK-II 120ml', 'LSP01', 'HG16', 'TUB', 600000, 900000, 860000, 820000, 14),
('SP112', N'Serum Sulwhasoo 30ml', 'LSP14', 'HG18', 'CHAI', 850000, 1280000, 1210000, 1140000, 16),
('SP113', N'Kem dưỡng Sulwhasoo 50g', 'LSP01', 'HG18', 'HOP', 900000, 1350000, 1280000, 1210000, 12),
('SP114', N'Sữa tắm Vichy 500ml', 'LSP05', 'HG20', 'CHAI', 140000, 210000, 195000, 180000, 40),
('SP115', N'Nước hoa Sulwhasoo 30ml', 'LSP04', 'HG18', 'CHAI', 1400000, 2100000, 2000000, 1900000, 8),
('SP116', N'Mặt nạ Laneige 5 miếng', 'LSP13', 'HG19', 'HOP', 120000, 180000, 170000, 160000, 60),
('SP117', N'Kem lót Laneige', 'LSP03', 'HG19', 'TUB', 160000, 240000, 225000, 210000, 30),
('SP118', N'Phấn nước Vichy', 'LSP03', 'HG20', 'HOP', 260000, 390000, 370000, 350000, 26),
('SP119', N'Xịt khoáng Vichy 150ml', 'LSP01', 'HG20', 'CHAI', 220000, 330000, 310000, 290000, 30),
('SP120', N'Gương trang điểm Vichy', 'LSP10', 'HG20', 'CAI', 100000, 160000, 150000, 140000, 40);

-- Bổ sung giao dịch đa dạng để làm giàu biểu đồ
-- 17b. Tạo thêm chứng từ nhập/xuất/bán trong tháng 11

-- Các phiếu bổ sung đã xóa do dữ liệu không tồn tại (NCC016-020, KH021-030, SP không có)
-- usp_TaoPhieuXuatKho và usp_TaoPhieuTraHangBan chưa được implement trong DTB.sql

-- Phiếu thu/chi hợp lệ (chỉ dùng data tồn tại)
EXEC dbo.usp_TaoPhieuThuNo @MaCT = N'PT0002', @MaKH = N'KH002', @MaNV = N'NV002', @SoTien = 1050000, @DienGiai = N'Thu nợ bổ sung';
EXEC dbo.usp_TaoPhieuChiTraNo @MaCT = N'PC0002', @MaNCC = N'NCC001', @MaNV = N'NV005', @SoTien = 840000, @DienGiai = N'Trả nợ bổ sung';
EXEC dbo.usp_TaoPhieuThuNo @MaCT = N'PT0003', @MaKH = N'KH002', @MaNV = N'NV002', @SoTien = 1100000, @DienGiai = N'Thu nợ bổ sung';
EXEC dbo.usp_TaoPhieuChiTraNo @MaCT = N'PC0003', @MaNCC = N'NCC001', @MaNV = N'NV005', @SoTien = 880000, @DienGiai = N'Trả nợ bổ sung';
