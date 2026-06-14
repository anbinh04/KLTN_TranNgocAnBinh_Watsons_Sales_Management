using System.Globalization;
using Watsons.Data;
using Watsons.Forms.Auth;

namespace Watsons
{
    internal static class Program
    {
        [STAThread]
        static void Main()
        {
            // Set global culture to Vietnamese for date (dd/MM/yyyy) and number formats
            var culture = new CultureInfo("vi-VN");
            CultureInfo.DefaultThreadCurrentCulture = culture;
            CultureInfo.DefaultThreadCurrentUICulture = culture;
            Thread.CurrentThread.CurrentCulture = culture;
            Thread.CurrentThread.CurrentUICulture = culture;

            ApplicationConfiguration.Initialize();

            // Kiểm tra kết nối database
            if (!DbConnection.TestConnection())
            {
                MessageBox.Show(
                    "Không thể kết nối đến database!\n\n" +
                    "Vui lòng kiểm tra:\n" +
                    "1. SQL Server đã chạy chưa?\n" +
                    "2. Connection string trong appsettings.json đúng chưa?\n" +
                    "3. Database QL_Watsons đã được tạo chưa?\n\n" +
                    "Chạy file Database\\DTB.sql để tạo database.",
                    "Lỗi kết nối",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error
                );
                return;
            }
            QuestPDF.Settings.License = QuestPDF.Infrastructure.LicenseType.Community;
            // Hiển thị form đăng nhập
            Application.Run(new LoginForm());
        }
    }
}
