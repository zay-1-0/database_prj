using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class ReplaceEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeesDropdown();
            }
        }



        private void BindEmployeesDropdown()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = @"
            SELECT 
                employee_id, 
                first_name + ' ' + last_name + ' (ID: ' + CAST(employee_id AS VARCHAR) + ')' AS DisplayText
            FROM dbo.Employee";

                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    txtEmp1.DataSource = reader;
                    txtEmp1.DataTextField = "DisplayText";
                    txtEmp1.DataValueField = "employee_id";
                    txtEmp1.DataBind();
                    txtEmp2.DataSource = reader;
                    txtEmp2.DataTextField = "DisplayText";
                    txtEmp2.DataValueField = "employee_id";
                    txtEmp2.DataBind();
                }
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                  
                    txtEmp2.DataSource = reader;
                    txtEmp2.DataTextField = "DisplayText";
                    txtEmp2.DataValueField = "employee_id";
                    txtEmp2.DataBind();
                }
            }

            

        }
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AttendanceTools.aspx");
        }
    }
}