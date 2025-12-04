using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace University_HR_ManagementSystem
{
    public partial class RemoveHoliday : System.Web.UI.Page
    {
        protected void btnRemoveHoliday_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager
                .ConnectionStrings["UniHR_DB"]
                .ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("Remove_Holiday", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();

                    lblResult.Text = $"Done. Removed {rows} attendance record(s) on holidays.";
                }
                catch (Exception ex)
                {
                    lblResult.ForeColor = System.Drawing.Color.Red;
                    lblResult.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}