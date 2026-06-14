namespace Watsons
{
    partial class MainForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.MenuStrip menuStrip;
        private System.Windows.Forms.ToolStripMenuItem menuHeThong;
        private System.Windows.Forms.ToolStripMenuItem menuDoiMatKhau;
        private System.Windows.Forms.ToolStripMenuItem menuDangXuat;
        private System.Windows.Forms.ToolStripMenuItem menuDanhMuc;
        private System.Windows.Forms.ToolStripMenuItem menuSanPham;
        private System.Windows.Forms.ToolStripMenuItem menuKhachHang;
        private System.Windows.Forms.ToolStripMenuItem menuNhaCungCap;
        private System.Windows.Forms.ToolStripMenuItem menuNhanVien;
        private System.Windows.Forms.ToolStripMenuItem menuDonViTinh;
        private System.Windows.Forms.ToolStripMenuItem menuLoaiSanPham;
        private System.Windows.Forms.ToolStripMenuItem menuHangSanPham;
        private System.Windows.Forms.ToolStripMenuItem menuBanHang;
        private System.Windows.Forms.ToolStripMenuItem menuNhapHang;
        private System.Windows.Forms.ToolStripMenuItem menuKeToan;
        private System.Windows.Forms.ToolStripMenuItem menuCaLamViec;
        private System.Windows.Forms.ToolStripMenuItem menuPhieuThu;
        private System.Windows.Forms.ToolStripMenuItem menuPhieuChi;
        private System.Windows.Forms.ToolStripMenuItem menuBaoCao;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripStatusLabel lblStatus;
        private System.Windows.Forms.ToolStripStatusLabel lblUser;
        private System.Windows.Forms.Panel panelMain;
        private System.Windows.Forms.Panel panelDashboard;
        private System.Windows.Forms.TableLayoutPanel tableDashboard;
        private System.Windows.Forms.GroupBox grpKPI;
        private System.Windows.Forms.Label lblKPI_DoanhThu;
        private System.Windows.Forms.Label lblKPI_GiaVon;
        private System.Windows.Forms.Label lblKPI_LoiNhuan;

        private System.Windows.Forms.GroupBox grpQuickActions;
        private System.Windows.Forms.Button btnQuick_PBH;
        private System.Windows.Forms.Button btnQuick_PNK;
        private System.Windows.Forms.GroupBox grpToday;
        private System.Windows.Forms.Label lblTodaySales;
        private System.Windows.Forms.Label lblTodayImports;

        private System.Windows.Forms.GroupBox grpRecentSales;
        private System.Windows.Forms.DataGridView dgvRecentSales;
        private System.Windows.Forms.GroupBox grpTopProducts;
        private System.Windows.Forms.DataGridView dgvTopProducts;
        private System.Windows.Forms.GroupBox grpAlerts;
        private System.Windows.Forms.ListBox lstAlerts;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            menuStrip = new MenuStrip();
            menuHeThong = new ToolStripMenuItem();
            menuDoiMatKhau = new ToolStripMenuItem();
            menuDangXuat = new ToolStripMenuItem();
            menuDanhMuc = new ToolStripMenuItem();
            menuSanPham = new ToolStripMenuItem();
            menuKhachHang = new ToolStripMenuItem();
            menuNhaCungCap = new ToolStripMenuItem();
            menuNhanVien = new ToolStripMenuItem();
            menuDonViTinh = new ToolStripMenuItem();
            menuLoaiSanPham = new ToolStripMenuItem();
            menuHangSanPham = new ToolStripMenuItem();
            menuBanHang = new ToolStripMenuItem();
            menuNhapHang = new ToolStripMenuItem();
            menuKeToan = new ToolStripMenuItem();
            menuPhieuThu = new ToolStripMenuItem();
            menuPhieuChi = new ToolStripMenuItem();
            menuCaLamViec = new ToolStripMenuItem();
            menuBaoCao = new ToolStripMenuItem();
            statusStrip = new StatusStrip();
            lblStatus = new ToolStripStatusLabel();
            lblUser = new ToolStripStatusLabel();
            panelMain = new Panel();
            panelDashboard = new Panel();
            tableDashboard = new TableLayoutPanel();
            grpKPI = new GroupBox();
            lblKPI_LoiNhuan = new Label();
            lblKPI_GiaVon = new Label();
            lblKPI_DoanhThu = new Label();
            grpQuickActions = new GroupBox();
            btnQuick_PNK = new Button();
            btnQuick_PBH = new Button();
            grpToday = new GroupBox();
            lblTodayImports = new Label();
            lblTodaySales = new Label();
            grpRecentSales = new GroupBox();
            dgvRecentSales = new DataGridView();
            grpTopProducts = new GroupBox();
            dgvTopProducts = new DataGridView();
            grpAlerts = new GroupBox();
            lstAlerts = new ListBox();
            menuStrip.SuspendLayout();
            statusStrip.SuspendLayout();
            panelMain.SuspendLayout();
            tableDashboard.SuspendLayout();
            grpKPI.SuspendLayout();
            grpQuickActions.SuspendLayout();
            grpToday.SuspendLayout();
            grpRecentSales.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dgvRecentSales).BeginInit();
            grpTopProducts.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dgvTopProducts).BeginInit();
            grpAlerts.SuspendLayout();
            SuspendLayout();
            // 
            // menuStrip
            // 
            menuStrip.Items.AddRange(new ToolStripItem[] { menuHeThong, menuDanhMuc, menuBanHang, menuNhapHang, menuKeToan, menuBaoCao });
            menuStrip.Location = new Point(0, 0);
            menuStrip.Name = "menuStrip";
            menuStrip.Size = new Size(1200, 24);
            menuStrip.TabIndex = 0;
            // 
            // menuHeThong
            // 
            menuHeThong.DropDownItems.AddRange(new ToolStripItem[] { menuDoiMatKhau, menuDangXuat });
            menuHeThong.Name = "menuHeThong";
            menuHeThong.Size = new Size(69, 20);
            menuHeThong.Text = "Hệ thống";
            // 
            // menuDoiMatKhau
            // 
            menuDoiMatKhau.Name = "menuDoiMatKhau";
            menuDoiMatKhau.Size = new Size(145, 22);
            menuDoiMatKhau.Text = "Đổi mật khẩu";
            menuDoiMatKhau.Click += menuDoiMatKhau_Click;
            // 
            // menuDangXuat
            // 
            menuDangXuat.Name = "menuDangXuat";
            menuDangXuat.Size = new Size(145, 22);
            menuDangXuat.Text = "Đăng xuất";
            menuDangXuat.Click += menuDangXuat_Click;
            // 
            // menuDanhMuc
            // 
            menuDanhMuc.DropDownItems.AddRange(new ToolStripItem[] { menuSanPham, menuKhachHang, menuNhaCungCap, menuNhanVien, menuDonViTinh, menuLoaiSanPham, menuHangSanPham });
            menuDanhMuc.Name = "menuDanhMuc";
            menuDanhMuc.Size = new Size(74, 20);
            menuDanhMuc.Text = "Danh mục";
            // 
            // menuSanPham
            // 
            menuSanPham.Name = "menuSanPham";
            menuSanPham.Size = new Size(158, 22);
            menuSanPham.Text = "Sản phẩm";
            menuSanPham.Click += menuSanPham_Click;
            // 
            // menuKhachHang
            // 
            menuKhachHang.Name = "menuKhachHang";
            menuKhachHang.Size = new Size(158, 22);
            menuKhachHang.Text = "Khách hàng";
            menuKhachHang.Click += menuKhachHang_Click;
            // 
            // menuNhaCungCap
            // 
            menuNhaCungCap.Name = "menuNhaCungCap";
            menuNhaCungCap.Size = new Size(158, 22);
            menuNhaCungCap.Text = "Nhà cung cấp";
            menuNhaCungCap.Click += menuNhaCungCap_Click;
            // 
            // menuNhanVien
            // 
            menuNhanVien.Name = "menuNhanVien";
            menuNhanVien.Size = new Size(158, 22);
            menuNhanVien.Text = "Nhân viên";
            menuNhanVien.Click += menuNhanVien_Click;
            // 
            // menuDonViTinh
            // 
            menuDonViTinh.Name = "menuDonViTinh";
            menuDonViTinh.Size = new Size(158, 22);
            menuDonViTinh.Text = "Đơn vị tính";
            menuDonViTinh.Click += menuDonViTinh_Click;
            // 
            // menuLoaiSanPham
            // 
            menuLoaiSanPham.Name = "menuLoaiSanPham";
            menuLoaiSanPham.Size = new Size(158, 22);
            menuLoaiSanPham.Text = "Loại sản phẩm";
            menuLoaiSanPham.Click += menuLoaiSanPham_Click;
            // 
            // menuHangSanPham
            // 
            menuHangSanPham.Name = "menuHangSanPham";
            menuHangSanPham.Size = new Size(158, 22);
            menuHangSanPham.Text = "Hãng sản phẩm";
            menuHangSanPham.Click += menuHangSanPham_Click;
            // 
            // menuBanHang
            // 
            menuBanHang.Name = "menuBanHang";
            menuBanHang.Size = new Size(69, 20);
            menuBanHang.Text = "Bán hàng";
            menuBanHang.Click += menuBanHang_Click;
            // 
            // menuNhapHang
            // 
            menuNhapHang.Name = "menuNhapHang";
            menuNhapHang.Size = new Size(78, 20);
            menuNhapHang.Text = "Nhập hàng";
            menuNhapHang.Click += menuNhapHang_Click;
            // 
            // menuKeToan
            // 
            menuKeToan.DropDownItems.AddRange(new ToolStripItem[] { menuPhieuThu, menuPhieuChi, menuCaLamViec });
            menuKeToan.Name = "menuKeToan";
            menuKeToan.Size = new Size(59, 20);
            menuKeToan.Text = "Kế toán";
            // 
            // menuPhieuThu
            // 
            menuPhieuThu.Name = "menuPhieuThu";
            menuPhieuThu.Size = new Size(192, 22);
            menuPhieuThu.Text = "💰 Phiếu thu tiền";
            menuPhieuThu.Click += menuPhieuThu_Click;
            // 
            // menuPhieuChi
            // 
            menuPhieuChi.Name = "menuPhieuChi";
            menuPhieuChi.Size = new Size(192, 22);
            menuPhieuChi.Text = "💸 Phiếu chi tiền";
            menuPhieuChi.Click += menuPhieuChi_Click;
            // 
            // menuCaLamViec
            // 
            menuCaLamViec.Name = "menuCaLamViec";
            menuCaLamViec.Size = new Size(192, 22);
            menuCaLamViec.Text = "⏰ Quản lý ca làm việc";
            menuCaLamViec.Click += menuCaLamViec_Click;
            // 
            // menuBaoCao
            // 
            menuBaoCao.Name = "menuBaoCao";
            menuBaoCao.Size = new Size(61, 20);
            menuBaoCao.Text = "Báo cáo";
            menuBaoCao.Click += menuBaoCao_Click;
            // 
            // statusStrip
            // 
            statusStrip.Items.AddRange(new ToolStripItem[] { lblStatus, lblUser });
            statusStrip.Location = new Point(0, 778);
            statusStrip.Name = "statusStrip";
            statusStrip.Size = new Size(1200, 22);
            statusStrip.TabIndex = 1;
            // 
            // lblStatus
            // 
            lblStatus.Name = "lblStatus";
            lblStatus.Size = new Size(1029, 17);
            lblStatus.Spring = true;
            lblStatus.Text = "Sẵn sàng";
            lblStatus.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblUser
            // 
            lblUser.Name = "lblUser";
            lblUser.Size = new Size(156, 17);
            lblUser.Text = "User: Admin | Vai trò: Admin";
            // 
            // panelMain
            // 
            panelMain.Controls.Add(panelDashboard);
            panelMain.Dock = DockStyle.Fill;
            panelMain.Location = new Point(0, 24);
            panelMain.Name = "panelMain";
            panelMain.Size = new Size(1200, 754);
            panelMain.TabIndex = 2;
            // 
            // panelDashboard
            // 
            panelDashboard.AutoScroll = true;
            panelDashboard.BackColor = Color.FromArgb(240, 242, 245);
            panelDashboard.Dock = DockStyle.Fill;
            panelDashboard.Location = new Point(0, 0);
            panelDashboard.Name = "panelDashboard";
            panelDashboard.Size = new Size(1200, 754);
            panelDashboard.TabIndex = 0;
            // 
            // tableDashboard
            // 
            tableDashboard.ColumnCount = 3;
            tableDashboard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.33F));
            tableDashboard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.34F));
            tableDashboard.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 33.33F));
            tableDashboard.Controls.Add(grpKPI, 0, 0);
            tableDashboard.Controls.Add(grpQuickActions, 1, 0);
            tableDashboard.Controls.Add(grpToday, 2, 0);
            tableDashboard.Controls.Add(grpRecentSales, 0, 1);
            tableDashboard.Controls.Add(grpTopProducts, 1, 1);
            tableDashboard.Controls.Add(grpAlerts, 2, 1);
            tableDashboard.Dock = DockStyle.Fill;
            tableDashboard.Location = new Point(15, 15);
            tableDashboard.Name = "tableDashboard";
            tableDashboard.RowCount = 2;
            tableDashboard.RowStyles.Add(new RowStyle(SizeType.Percent, 50F));
            tableDashboard.RowStyles.Add(new RowStyle(SizeType.Percent, 50F));
            tableDashboard.Size = new Size(1170, 722);
            tableDashboard.TabIndex = 0;
            // 
            // grpKPI
            // 
            grpKPI.BackColor = Color.White;
            grpKPI.Controls.Add(lblKPI_LoiNhuan);
            grpKPI.Controls.Add(lblKPI_GiaVon);
            grpKPI.Controls.Add(lblKPI_DoanhThu);
            grpKPI.Dock = DockStyle.Fill;
            grpKPI.FlatStyle = FlatStyle.Flat;
            grpKPI.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpKPI.ForeColor = Color.FromArgb(0, 122, 204);
            grpKPI.Location = new Point(10, 10);
            grpKPI.Margin = new Padding(10);
            grpKPI.Name = "grpKPI";
            grpKPI.Padding = new Padding(12);
            grpKPI.Size = new Size(369, 341);
            grpKPI.TabIndex = 0;
            grpKPI.TabStop = false;
            grpKPI.Text = "📊 KPI Tháng hiện tại";
            // 
            // lblKPI_LoiNhuan
            // 
            lblKPI_LoiNhuan.AutoSize = true;
            lblKPI_LoiNhuan.Font = new Font("Segoe UI", 10F);
            lblKPI_LoiNhuan.ForeColor = Color.FromArgb(0, 153, 51);
            lblKPI_LoiNhuan.Location = new Point(15, 85);
            lblKPI_LoiNhuan.Name = "lblKPI_LoiNhuan";
            lblKPI_LoiNhuan.Size = new Size(141, 19);
            lblKPI_LoiNhuan.TabIndex = 2;
            lblKPI_LoiNhuan.Text = "📈 Lợi nhuận: 0 VNĐ";
            // 
            // lblKPI_GiaVon
            // 
            lblKPI_GiaVon.AutoSize = true;
            lblKPI_GiaVon.Font = new Font("Segoe UI", 10F);
            lblKPI_GiaVon.ForeColor = Color.FromArgb(255, 140, 0);
            lblKPI_GiaVon.Location = new Point(15, 60);
            lblKPI_GiaVon.Name = "lblKPI_GiaVon";
            lblKPI_GiaVon.Size = new Size(127, 19);
            lblKPI_GiaVon.TabIndex = 1;
            lblKPI_GiaVon.Text = "📦 Giá vốn: 0 VNĐ";
            // 
            // lblKPI_DoanhThu
            // 
            lblKPI_DoanhThu.AutoSize = true;
            lblKPI_DoanhThu.Font = new Font("Segoe UI", 10F);
            lblKPI_DoanhThu.ForeColor = Color.FromArgb(0, 122, 204);
            lblKPI_DoanhThu.Location = new Point(15, 35);
            lblKPI_DoanhThu.Name = "lblKPI_DoanhThu";
            lblKPI_DoanhThu.Size = new Size(146, 19);
            lblKPI_DoanhThu.TabIndex = 0;
            lblKPI_DoanhThu.Text = "💰 Doanh thu: 0 VNĐ";
            // 
            // grpQuickActions
            // 
            grpQuickActions.BackColor = Color.White;
            grpQuickActions.Controls.Add(btnQuick_PNK);
            grpQuickActions.Controls.Add(btnQuick_PBH);
            grpQuickActions.Dock = DockStyle.Fill;
            grpQuickActions.FlatStyle = FlatStyle.Flat;
            grpQuickActions.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpQuickActions.ForeColor = Color.FromArgb(0, 122, 204);
            grpQuickActions.Location = new Point(399, 10);
            grpQuickActions.Margin = new Padding(10);
            grpQuickActions.Name = "grpQuickActions";
            grpQuickActions.Padding = new Padding(12);
            grpQuickActions.Size = new Size(370, 341);
            grpQuickActions.TabIndex = 1;
            grpQuickActions.TabStop = false;
            grpQuickActions.Text = "⚡ Thao tác nhanh";
            // 
            // btnQuick_PNK
            // 
            btnQuick_PNK.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            btnQuick_PNK.BackColor = Color.FromArgb(0, 153, 51);
            btnQuick_PNK.Cursor = Cursors.Hand;
            btnQuick_PNK.FlatAppearance.BorderSize = 0;
            btnQuick_PNK.FlatStyle = FlatStyle.Flat;
            btnQuick_PNK.Font = new Font("Segoe UI", 11F, FontStyle.Bold);
            btnQuick_PNK.ForeColor = Color.White;
            btnQuick_PNK.Location = new Point(25, 130);
            btnQuick_PNK.Name = "btnQuick_PNK";
            btnQuick_PNK.Size = new Size(320, 55);
            btnQuick_PNK.TabIndex = 1;
            btnQuick_PNK.Text = "📦 Tạo Phiếu Nhập Kho";
            btnQuick_PNK.UseVisualStyleBackColor = false;
            btnQuick_PNK.Click += btnQuick_PNK_Click;
            // 
            // btnQuick_PBH
            // 
            btnQuick_PBH.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            btnQuick_PBH.BackColor = Color.FromArgb(0, 122, 204);
            btnQuick_PBH.Cursor = Cursors.Hand;
            btnQuick_PBH.FlatAppearance.BorderSize = 0;
            btnQuick_PBH.FlatStyle = FlatStyle.Flat;
            btnQuick_PBH.Font = new Font("Segoe UI", 11F, FontStyle.Bold);
            btnQuick_PBH.ForeColor = Color.White;
            btnQuick_PBH.Location = new Point(25, 55);
            btnQuick_PBH.Name = "btnQuick_PBH";
            btnQuick_PBH.Size = new Size(320, 55);
            btnQuick_PBH.TabIndex = 0;
            btnQuick_PBH.Text = "\U0001f6d2 Tạo Phiếu Bán Hàng";
            btnQuick_PBH.UseVisualStyleBackColor = false;
            btnQuick_PBH.Click += btnQuick_PBH_Click;
            // 
            // grpToday
            // 
            grpToday.BackColor = Color.White;
            grpToday.Controls.Add(lblTodayImports);
            grpToday.Controls.Add(lblTodaySales);
            grpToday.Dock = DockStyle.Fill;
            grpToday.FlatStyle = FlatStyle.Flat;
            grpToday.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpToday.ForeColor = Color.FromArgb(0, 122, 204);
            grpToday.Location = new Point(789, 10);
            grpToday.Margin = new Padding(10);
            grpToday.Name = "grpToday";
            grpToday.Padding = new Padding(12);
            grpToday.Size = new Size(371, 341);
            grpToday.TabIndex = 2;
            grpToday.TabStop = false;
            grpToday.Text = "📅 Hôm nay";
            // 
            // lblTodayImports
            // 
            lblTodayImports.AutoSize = true;
            lblTodayImports.Font = new Font("Segoe UI", 10F);
            lblTodayImports.ForeColor = Color.FromArgb(0, 153, 51);
            lblTodayImports.Location = new Point(15, 60);
            lblTodayImports.Name = "lblTodayImports";
            lblTodayImports.Size = new Size(212, 19);
            lblTodayImports.TabIndex = 1;
            lblTodayImports.Text = "📦 Phiếu nhập: 0 | Giá trị: 0 VNĐ";
            // 
            // lblTodaySales
            // 
            lblTodaySales.AutoSize = true;
            lblTodaySales.Font = new Font("Segoe UI", 10F);
            lblTodaySales.ForeColor = Color.FromArgb(0, 122, 204);
            lblTodaySales.Location = new Point(15, 35);
            lblTodaySales.Name = "lblTodaySales";
            lblTodaySales.Size = new Size(182, 19);
            lblTodaySales.TabIndex = 0;
            lblTodaySales.Text = "\U0001f6d2 Đơn bán: 0 | Thu: 0 VNĐ";
            // 
            // grpRecentSales
            // 
            grpRecentSales.BackColor = Color.White;
            grpRecentSales.Controls.Add(dgvRecentSales);
            grpRecentSales.Dock = DockStyle.Fill;
            grpRecentSales.FlatStyle = FlatStyle.Flat;
            grpRecentSales.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpRecentSales.ForeColor = Color.FromArgb(0, 122, 204);
            grpRecentSales.Location = new Point(10, 371);
            grpRecentSales.Margin = new Padding(10);
            grpRecentSales.Name = "grpRecentSales";
            grpRecentSales.Padding = new Padding(12);
            grpRecentSales.Size = new Size(369, 341);
            grpRecentSales.TabIndex = 3;
            grpRecentSales.TabStop = false;
            grpRecentSales.Text = "\U0001f6d2 Đơn hàng gần đây";
            // 
            // dgvRecentSales
            // 
            dgvRecentSales.AllowUserToAddRows = false;
            dgvRecentSales.AllowUserToDeleteRows = false;
            dgvRecentSales.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvRecentSales.BackgroundColor = Color.White;
            dgvRecentSales.BorderStyle = BorderStyle.None;
            dgvRecentSales.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dgvRecentSales.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvRecentSales.Dock = DockStyle.Fill;
            dgvRecentSales.GridColor = Color.FromArgb(230, 230, 230);
            dgvRecentSales.Location = new Point(12, 30);
            dgvRecentSales.Name = "dgvRecentSales";
            dgvRecentSales.ReadOnly = true;
            dgvRecentSales.RowHeadersVisible = false;
            dgvRecentSales.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvRecentSales.Size = new Size(345, 299);
            dgvRecentSales.TabIndex = 0;
            // 
            // grpTopProducts
            // 
            grpTopProducts.BackColor = Color.White;
            grpTopProducts.Controls.Add(dgvTopProducts);
            grpTopProducts.Dock = DockStyle.Fill;
            grpTopProducts.FlatStyle = FlatStyle.Flat;
            grpTopProducts.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpTopProducts.ForeColor = Color.FromArgb(0, 122, 204);
            grpTopProducts.Location = new Point(399, 371);
            grpTopProducts.Margin = new Padding(10);
            grpTopProducts.Name = "grpTopProducts";
            grpTopProducts.Padding = new Padding(12);
            grpTopProducts.Size = new Size(370, 341);
            grpTopProducts.TabIndex = 4;
            grpTopProducts.TabStop = false;
            grpTopProducts.Text = "🔥 Sản phẩm bán chạy";
            // 
            // dgvTopProducts
            // 
            dgvTopProducts.AllowUserToAddRows = false;
            dgvTopProducts.AllowUserToDeleteRows = false;
            dgvTopProducts.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvTopProducts.BackgroundColor = Color.White;
            dgvTopProducts.BorderStyle = BorderStyle.None;
            dgvTopProducts.CellBorderStyle = DataGridViewCellBorderStyle.SingleHorizontal;
            dgvTopProducts.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvTopProducts.Dock = DockStyle.Fill;
            dgvTopProducts.GridColor = Color.FromArgb(230, 230, 230);
            dgvTopProducts.Location = new Point(12, 30);
            dgvTopProducts.Name = "dgvTopProducts";
            dgvTopProducts.ReadOnly = true;
            dgvTopProducts.RowHeadersVisible = false;
            dgvTopProducts.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvTopProducts.Size = new Size(346, 299);
            dgvTopProducts.TabIndex = 0;
            // 
            // grpAlerts
            // 
            grpAlerts.BackColor = Color.White;
            grpAlerts.Controls.Add(lstAlerts);
            grpAlerts.Dock = DockStyle.Fill;
            grpAlerts.FlatStyle = FlatStyle.Flat;
            grpAlerts.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpAlerts.ForeColor = Color.FromArgb(0, 122, 204);
            grpAlerts.Location = new Point(789, 371);
            grpAlerts.Margin = new Padding(10);
            grpAlerts.Name = "grpAlerts";
            grpAlerts.Padding = new Padding(12);
            grpAlerts.Size = new Size(371, 341);
            grpAlerts.TabIndex = 5;
            grpAlerts.TabStop = false;
            grpAlerts.Text = "🔔 Thông báo & Cảnh báo";
            // 
            // lstAlerts
            // 
            lstAlerts.BackColor = Color.White;
            lstAlerts.BorderStyle = BorderStyle.None;
            lstAlerts.Dock = DockStyle.Fill;
            lstAlerts.Font = new Font("Segoe UI", 9.5F);
            lstAlerts.ForeColor = Color.DarkRed;
            lstAlerts.Location = new Point(12, 30);
            lstAlerts.Name = "lstAlerts";
            lstAlerts.Size = new Size(347, 299);
            lstAlerts.TabIndex = 0;
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1200, 800);
            Controls.Add(panelMain);
            Controls.Add(statusStrip);
            Controls.Add(menuStrip);
            Icon = (Icon)resources.GetObject("$this.Icon");
            MainMenuStrip = menuStrip;
            Name = "MainForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Watsons Management System";
            WindowState = FormWindowState.Maximized;
            Load += MainForm_Load;
            menuStrip.ResumeLayout(false);
            menuStrip.PerformLayout();
            statusStrip.ResumeLayout(false);
            statusStrip.PerformLayout();
            panelMain.ResumeLayout(false);
            tableDashboard.ResumeLayout(false);
            grpKPI.ResumeLayout(false);
            grpKPI.PerformLayout();
            grpQuickActions.ResumeLayout(false);
            grpToday.ResumeLayout(false);
            grpToday.PerformLayout();
            grpRecentSales.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)dgvRecentSales).EndInit();
            grpTopProducts.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)dgvTopProducts).EndInit();
            grpAlerts.ResumeLayout(false);
            ResumeLayout(false);
            PerformLayout();
        }
    }
}
