using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class Employee_Page_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void App_Acc_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Acc.aspx");
        }

        protected void App_Med_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Med.aspx");
        }

        protected void App_Unp_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Unp.aspx");
        }

        protected void App_Comp_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Comp.aspx");
        }

        protected void App_Ann_Click(object sender, EventArgs e)
        {
            Response.Redirect("Apply_Annual_leave.aspx");
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