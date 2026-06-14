using Watsons.Forms.Dashboards;
using Watsons.Models;

namespace Watsons
{
    public partial class MainForm : Form
    {
        private UserControl? _currentDashboard;

        public MainForm()
        {
            InitializeComponent();

            // Đăng ký sự kiện đóng form để tự động đóng ca
            this.FormClosing += MainForm_FormClosing;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            // Hide old dashboard controls (replaced by new role-specific dashboard forms)
            if (tableDashboard != null)
            {
                tableDashboard.Visible = false;
            }

            // Cập nhật thông tin user
            lblUser.Text = $"User: {SessionInfo.HoTenNV} | Vai trò: {SessionInfo.VaiTro}";

            // Thiết lập quyền truy cập menu
            SetMenuPermissions();

            // Hiển thị welcome message theo role
            string welcomeMsg = GetWelcomeMessage();
            lblStatus.Text = $"{welcomeMsg} - Đăng nhập lúc {SessionInfo.NgayDangNhap:HH:mm:ss dd/MM/yyyy}";

            // Load Dashboard theo role
            LoadDashboardByRole();
        }

        private string GetWelcomeMessage()
        {
            if (SessionInfo.IsAdmin)
                return $"👑 Xin chào Quản trị viên {SessionInfo.HoTenNV}!";
            else if (SessionInfo.IsKeToan)
                return $"💰 Xin chào Kế toán {SessionInfo.HoTenNV}!";
            else if (SessionInfo.IsThuKho)
                return $"📦 Xin chào Thủ kho {SessionInfo.HoTenNV}!";
            else if (SessionInfo.IsNhanVien)
                return $"👤 Xin chào Nhân viên {SessionInfo.HoTenNV}!";
            else
                return $"Xin chào {SessionInfo.HoTenNV}!";
        }

        private void LoadDashboardByRole()
        {
            // Xóa dashboard cũ nếu có
            if (_currentDashboard != null)
            {
                panelDashboard.Controls.Remove(_currentDashboard);
                _currentDashboard.Dispose();
                _currentDashboard = null;
            }

            // Load dashboard form phù hợp với role
            if (SessionInfo.IsAdmin)
            {
                _currentDashboard = new AdminDashboardForm();
            }
            else if (SessionInfo.IsKeToan)
            {
                _currentDashboard = new AccountingDashboardForm();
            }
            else if (SessionInfo.IsThuKho)
            {
                _currentDashboard = new WarehouseDashboardForm();
            }
            else if (SessionInfo.IsNhanVien)
            {
                _currentDashboard = new EmployeeDashboardForm();
            }

            // Add dashboard form vào panel
            if (_currentDashboard != null)
            {
                _currentDashboard.Dock = DockStyle.Fill;
                panelDashboard.Controls.Add(_currentDashboard);
            }
        }

        // Old dashboard loading methods removed - now using dedicated Dashboard forms per role

        private void SetMenuPermissions()
        {
            // Admin có full quyền
            if (SessionInfo.IsAdmin)
            {
                return;
            }

            // Danh mục
            menuSanPham.Enabled = SessionInfo.CanManageProducts;
            menuKhachHang.Enabled = SessionInfo.CanManageCustomers;
            menuNhaCungCap.Enabled = SessionInfo.CanManageSuppliers;
            menuNhanVien.Enabled = SessionInfo.CanManageEmployees;

            // Nghiệp vụ
            menuBanHang.Enabled = SessionInfo.CanCreateSales;
            menuNhapHang.Enabled = SessionInfo.CanCreatePurchase;
            menuKeToan.Enabled = SessionInfo.CanViewAccounting;
            menuBaoCao.Enabled = SessionInfo.CanViewReports;

            // Ca làm việc chỉ cho Admin và Kế toán
            menuCaLamViec.Enabled = SessionInfo.IsKeToan;
        }

        private async void menuDangXuat_Click(object sender, EventArgs e)
        {
            var result = MessageBox.Show(
                "Bạn có chắc muốn đăng xuất?\n\n💡 Ca làm việc sẽ tự động đóng.",
                "Xác nhận",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question
            );

            if (result == DialogResult.Yes)
            {
                await AutoCloseShiftAsync();

                SessionInfo.Clear();
                this.Hide();
                var loginForm = new Forms.Auth.LoginForm();
                loginForm.FormClosed += (s, args) => this.Close();
                loginForm.Show();
            }
        }

        // Quick Actions
        private void btnQuick_PBH_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanCreateSales)
            {
                MessageBox.Show("Bạn không có quyền tạo phiếu bán hàng!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Sales.SalesForm();
            if (form.ShowDialog(this) == DialogResult.OK)
            {
                LoadDashboardByRole();
            }
        }

        private void btnQuick_PNK_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanCreatePurchase)
            {
                MessageBox.Show("Bạn không có quyền tạo phiếu nhập hàng!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Purchase.PurchaseForm();
            if (form.ShowDialog(this) == DialogResult.OK)
            {
                LoadDashboardByRole();
            }
        }

        // Menu Handlers - Danh mục
        private void menuSanPham_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanManageProducts)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.ProductsForm();
            form.ShowDialog(this);
        }

        private void menuKhachHang_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanManageCustomers)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.CustomersForm();
            form.ShowDialog(this);
        }

        private void menuNhaCungCap_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanManageSuppliers)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.SuppliersForm();
            form.ShowDialog(this);
        }

        private void menuNhanVien_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanManageEmployees)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.EmployeesForm();
            form.ShowDialog(this);
        }

        private void menuDonViTinh_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.IsAdmin)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.UnitsForm();
            form.ShowDialog(this);
        }

        private void menuLoaiSanPham_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.IsAdmin)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.CategoriesForm();
            form.ShowDialog(this);
        }

        private void menuHangSanPham_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.IsAdmin)
            {
                MessageBox.Show("Bạn không có quyền truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Master.BrandsForm();
            form.ShowDialog(this);
        }

        // Menu Handlers - Nghiệp vụ
        private void menuBanHang_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanCreateSales)
            {
                MessageBox.Show("Bạn không có quyền tạo phiếu bán hàng!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Sales.SalesForm();
            if (form.ShowDialog(this) == DialogResult.OK)
            {
                LoadDashboardByRole(); // Refresh dashboard after successful sale
            }
        }

        private void menuNhapHang_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanCreatePurchase)
            {
                MessageBox.Show("Bạn không có quyền tạo phiếu nhập hàng!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var form = new Forms.Purchase.PurchaseForm();
            if (form.ShowDialog(this) == DialogResult.OK)
            {
                LoadDashboardByRole(); // Refresh dashboard after successful purchase
            }
        }

        private void menuPhieuThu_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanViewAccounting)
            {
                MessageBox.Show("Bạn không có quyền truy cập kế toán!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var form = new Forms.Accounting.CashReceiptForm();
            form.ShowDialog(this);
            LoadDashboardByRole(); // Refresh dashboard
        }

        private void menuPhieuChi_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanViewAccounting)
            {
                MessageBox.Show("Bạn không có quyền truy cập kế toán!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var form = new Forms.Accounting.CashPaymentForm();
            form.ShowDialog(this);
            LoadDashboardByRole(); // Refresh dashboard
        }

        private void menuCaLamViec_Click(object sender, EventArgs e)
        {
            // Chỉ Admin và Kế toán mới được quản lý ca
            if (!SessionInfo.IsAdmin && !SessionInfo.IsKeToan)
            {
                MessageBox.Show("Chỉ Admin và Kế toán mới được truy cập chức năng này!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var shiftForm = new Forms.Accounting.ShiftManagementForm();
            shiftForm.ShowDialog(this);
        }

        // Menu Handlers - Báo cáo
        private void menuBaoCao_Click(object sender, EventArgs e)
        {
            if (!SessionInfo.CanViewReports)
            {
                MessageBox.Show("Bạn không có quyền xem báo cáo!", "Từ chối",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            ShowReportMenu();
        }

        private void ShowReportMenu()
        {
            var reportMenu = new ContextMenuStrip();

            // Tài chính
            var rptTaiChinh = new ToolStripMenuItem("💰 Báo cáo Tài chính");
            rptTaiChinh.Click += (s, e) => OpenFinancialReport();
            reportMenu.Items.Add(rptTaiChinh);

            reportMenu.Items.Add(new ToolStripSeparator());

            // Doanh thu
            var rptDoanhThu = new ToolStripMenuItem("📊 Báo cáo Doanh thu");
            rptDoanhThu.Click += (s, e) => OpenSalesReport();
            reportMenu.Items.Add(rptDoanhThu);

            reportMenu.Items.Add(new ToolStripSeparator());

            // Tồn kho
            var rptTonKho = new ToolStripMenuItem("📦 Báo cáo Tồn kho");
            rptTonKho.Click += (s, e) => OpenInventoryReport();
            reportMenu.Items.Add(rptTonKho);

            if (menuBaoCao.Owner != null)
            {
                var menuLocation = menuBaoCao.Owner.PointToScreen(menuBaoCao.Bounds.Location);
                reportMenu.Show(menuLocation.X, menuLocation.Y + menuBaoCao.Height);
            }
        }

        private void OpenSalesReport()
        {
            var form = new Forms.Reports.SalesReportForm();
            form.ShowDialog(this);
        }

        private void OpenInventoryReport()
        {
            var form = new Forms.Reports.InventoryReportForm();
            form.ShowDialog(this);
        }

        private void OpenFinancialReport()
        {
            var form = new Forms.Reports.FinancialReportForm();
            form.ShowDialog(this);
        }

        private void menuDoiMatKhau_Click(object? sender, EventArgs e)
        {
            var changePasswordForm = new Forms.Auth.ChangePasswordForm();
            if (changePasswordForm.ShowDialog(this) == DialogResult.OK)
            {
                // Đổi mật khẩu thành công, đăng xuất và quay lại login
                MessageBox.Show(
                    "Mật khẩu đã được thay đổi.\nVui lòng đăng nhập lại.",
                    "Đăng xuất",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Information
                );

                // Clear session
                SessionInfo.Clear();

                // Quay về login form
                this.Hide();
                var loginForm = new Forms.Auth.LoginForm();
                if (loginForm.ShowDialog() == DialogResult.OK)
                {
                    // Login thành công, reload MainForm
                    MainForm_Load(this, EventArgs.Empty);
                    this.Show();
                }
                else
                {
                    // Đóng app nếu không login
                    Application.Exit();
                }
            }
        }

        // removed inline SQL methods; now using DashboardService & ReportService

        // Tự động đóng ca khi đăng xuất hoặc thoát
        private async Task AutoCloseShiftAsync()
        {
            // Chỉ đóng ca cho user có ca đang mở (không phải Admin)
            if (SessionInfo.IsAdmin || string.IsNullOrEmpty(SessionInfo.MaNV))
                return;

            try
            {
                var shiftService = new Services.ShiftService();
                var currentShift = await shiftService.GetCurrentShiftAsync(SessionInfo.MaNV);

                if (currentShift != null)
                {
                    // Đóng ca với tiền thực tế = tiền cuối ca (không yêu cầu nhập)
                    var closeResult = await shiftService.CloseShiftAsync(
                        currentShift.MaCa,
                        currentShift.TienCuoiCa
                    );

                    // Không hiển thị message box để không làm gián đoạn logout
                    System.Diagnostics.Debug.WriteLine(closeResult.Success
                        ? $"✅ Đã tự động đóng ca: {currentShift.MaCa}"
                        : $"⚠️ Lỗi đóng ca: {closeResult.Message}");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"⚠️ Lỗi auto-close shift: {ex.Message}");
            }
        }

        // Xử lý khi đóng form (thoát đột ngột)
        private async void MainForm_FormClosing(object? sender, FormClosingEventArgs e)
        {
            // Chỉ xử lý khi user thật sự thoát (không phải do logout/đổi mật khẩu)
            if (e.CloseReason == CloseReason.UserClosing && !string.IsNullOrEmpty(SessionInfo.MaNV))
            {
                // Tự động đóng ca trước khi thoát
                await AutoCloseShiftAsync();
            }
        }
    }
}
