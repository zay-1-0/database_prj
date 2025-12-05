using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace ms3
{
    public partial class App_Unp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Employee_ID"] == null)
            {
                Response.Redirect("EmpLogin.aspx");
            }
        }

        protected void Unp_Submit_Click(object sender, EventArgs e)
        {
            // Validation
            if (string.IsNullOrEmpty(txtStart.Text) || string.IsNullOrEmpty(txtEnd.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Please enter both start and end dates.');", true);
                return;
            }

            if (string.IsNullOrEmpty(txtFileName.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error",
                    "alert('Please enter the file name.');", true);
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            DateTime start = DateTime.Parse(txtStart.Text);
            DateTime end = DateTime.Parse(txtEnd.Text);
            string docDesc = txtDocDesc.Text;
            string fileName = txtFileName.Text;
            int employeeID = Convert.ToInt32(Session["Employee_ID"]);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("Submit_unpaid", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@employee_ID", employeeID);
                cmd.Parameters.AddWithValue("@start_date", start);
                cmd.Parameters.AddWithValue("@end_date", end);
                cmd.Parameters.AddWithValue("@document_description", docDesc);
                cmd.Parameters.AddWithValue("@file_name", fileName);

                cmd.ExecuteNonQuery();
            }

            ClientScript.RegisterStartupScript(this.GetType(), "Success",
                "alert('Unpaid leave submitted successfully!');", true);
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            int employeeID = Convert.ToInt32(Session["Employee_ID"]);

            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if employee is part of upper board roles
                SqlCommand cmdRole = new SqlCommand(
                    @"SELECT COUNT(*) 
              FROM Employee_Role 
              WHERE emp_ID = @EmpID 
                AND role_name IN ('Dean','Vice Dean','President')", conn);
                cmdRole.Parameters.AddWithValue("@EmpID", employeeID);

                int roleCount = (int)cmdRole.ExecuteScalar();

                if (roleCount > 0)
                {
                    Response.Redirect("Employee_Home_Page(Upperboard).aspx");
                }
                else
                {
                    Response.Redirect("HomePage_employee.aspx");
                }
            }
        }
    }
}
