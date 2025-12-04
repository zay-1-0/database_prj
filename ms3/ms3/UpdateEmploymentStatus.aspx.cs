using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace University_HR_ManagementSystem
{
    public partial class UpdateEmploymentStatus : System.Web.UI.Page
    {
        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            lblResult.ForeColor = System.Drawing.Color.Green;

            if (!int.TryParse(txtEmployeeId.Text, out int empId))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Please enter a valid numeric Employee ID.";
                return;
            }

            string connStr = WebConfigurationManager
                .ConnectionStrings["UniHR_DB"]
                .ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("Update_Employment_Status", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Employee_ID", empId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblResult.Text = "Employment status updated for this employee based on today's leave status.";
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