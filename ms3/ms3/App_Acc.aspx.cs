using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class App_Acc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Acc_Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();
            DateTime start = DateTime.Parse(calStart.Text);
            DateTime end = DateTime.Parse(calEnd.Text);



            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

                cmd.CommandText = "Submit_accidental";

                cmd.Parameters.AddWithValue("@employee_ID", Session["Employee_ID"]);
                cmd.Parameters.AddWithValue("@start_date", start);
                cmd.Parameters.AddWithValue("@end_date", end);



                cmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(),
                    "Success",
                    "alert('Accidental leave submitted successfully!');",
                    true);

            }
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
                AND role_name IN ('Dean','Vice Dean','President','Vice President')", conn);
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