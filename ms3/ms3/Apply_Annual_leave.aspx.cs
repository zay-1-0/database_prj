using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace ms3
{
    public partial class Apply_Annual_leave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litMessage.Text = "<p style='color:green;'>Your Id is : " + Session["Employee_id"] + "</p>";
        }

        protected void SubmitDates_Click(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            


            int Replace_id = Int16.Parse(Replace_emp_id.Text);
            String startDate = StartDate.Text;
            String enddate = EndDate.Text; 

           
            if (Replace_id < 0)
            {
                litMessage.Text = "<p style='color:red;'>Error invalid Date or ID</p>";
                return;
            }
            

            if (Session["Employee_id"] == null)
            {
                litMessage.Text = "<p style='color:red;'>Error: Employee session ID not found. Please log in again.</p>";
                return;
            }

            litMessage.Text = "<p style='color:green;'>Your Id is : " + Session["Employee_id"]+","+Replace_id+"."+startDate+","+ enddate + "</p>";

            
                using (SqlConnection conn = new SqlConnection(connstr))
                {
                    using (SqlCommand Applying_proc = new SqlCommand("Submit_annual", conn))
                    {
                        Applying_proc.CommandType = System.Data.CommandType.StoredProcedure;

                        // Ensure parameters match SQL types specifically
                        Applying_proc.Parameters.Add("@employee_ID", System.Data.SqlDbType.Int).Value = Session["Employee_id"];
                        Applying_proc.Parameters.Add("@replacement_emp", System.Data.SqlDbType.Int).Value = Replace_id;
                        Applying_proc.Parameters.Add("@start_date", System.Data.SqlDbType.Date).Value = startDate;
                        Applying_proc.Parameters.Add("@end_date", System.Data.SqlDbType.Date).Value = enddate;
                        
                        try
                        {
                            conn.Open();
                            Applying_proc.ExecuteNonQuery(); // If it hangs here, it is 99% a SQL Table Lock
                            litMessage.Text = "<p style='color:green;'>Annual leave application submitted successfully.</p>";
                        }
                        catch (SqlException ex)
                        {
                            // In production, log this, don't show ex.Message to users (security risk)
                            litMessage.Text = "<p style='color:red;'>Database Error: " + ex.Message + "</p>";
                        }
                    }
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