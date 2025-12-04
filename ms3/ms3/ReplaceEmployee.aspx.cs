using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ms3
{
    public partial class ReplaceEmployee : System.Web.UI.Page
    {
        protected void btnReplace_Click(object sender, EventArgs e)
        {
            lblResult.ForeColor = System.Drawing.Color.Green;

            if (!int.TryParse(txtEmp1.Text, out int emp1) ||
                !int.TryParse(txtEmp2.Text, out int emp2))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Please enter valid numeric IDs for both employees.";
                return;
            }

            if (!DateTime.TryParse(txtFromDate.Text, out DateTime fromDate) ||
                !DateTime.TryParse(txtToDate.Text, out DateTime toDate))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Please enter valid dates (e.g. 2025-12-01).";
                return;
            }

            string connStr = WebConfigurationManager
                .ConnectionStrings["UniHR_DB"]
                .ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("Replace_employee", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Emp1_ID", emp1);
                cmd.Parameters.AddWithValue("@Emp2_ID", emp2);
                cmd.Parameters.AddWithValue("@from_date", fromDate);
                cmd.Parameters.AddWithValue("@to_date", toDate);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblResult.Text = "Replacement applied successfully for the selected period.";
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