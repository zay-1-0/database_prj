using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace ms3 
{
    public partial class RemoveApprovedLeaves : System.Web.UI.Page
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
                    txtEmployeeId.DataSource = reader;
                    txtEmployeeId.DataTextField = "DisplayText";
                    txtEmployeeId.DataValueField = "employee_id";
                    txtEmployeeId.DataBind();
                }
            }

        }
        protected void btnRemoveApprovedLeaves_Click(object sender, EventArgs e)
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
            using (SqlCommand cmd = new SqlCommand("Remove_Approved_Leaves", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@employee_ID", employeeId);

                try
                {
                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();

                    lblResult.Text = $"Done. Removed {rows} approved leave record(s) from attendance for this employee.";
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