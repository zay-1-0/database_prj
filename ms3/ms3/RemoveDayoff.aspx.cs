using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ms3 
{
    public partial class RemoveDayoff : System.Web.UI.Page
    {
        protected void btnRemoveDayOff_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtEmployeeId.Text, out int employeeId))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Please enter a valid numeric Employee ID.";
                return;
            }

            string connStr = WebConfigurationManager
                .ConnectionStrings["UniHR_DB"]
                .ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("Remove_DayOff", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@employee_ID", employeeId);

                try
                {
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();

                    lblResult.Text = $"Done. Removed {rows} unattended day-off record(s) for this employee in the current month.";
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