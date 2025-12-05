using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class EmpLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void OnLogin(object sender, EventArgs e)
        {
            string connstr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            SqlConnection conn = new SqlConnection(connstr);

            int id = Int16.Parse(Employee_ID.Text);
            string password = Employee_Password.Text;

            if (id < 0 || password.Length == 0)
            {
                Response.Write("<script>alert('Invalid input');</script>");
                return;
            }

            SqlCommand checking = new SqlCommand("SELECT dbo.EmployeeLoginValidation(@EmployeeID, @Password)", conn);

            SqlCommand getRole = new SqlCommand("Select * " +
                "from Employee_Role " +
                " where (emp_ID = @EmpID) and (role_name='Dean' or role_name='Vice Dean' or role_name='President')", conn);

            getRole.Parameters.AddWithValue("@EmpID", id);


          

            int temp = -100;

            checking.Parameters.AddWithValue("@EmployeeID", id);
            checking.Parameters.AddWithValue("@Password", password);
            try
            {
                conn.Open();

                object result = checking.ExecuteScalar();

                if (result == null || result == DBNull.Value)
                {
                    Response.Write("<script>alert('Login validation function returned no value.');</script>");
                    return;
                }

                // The function should return 1 (Success) or 0 (Failure) (or maybe -1 if INT)
                int isValid = Convert.ToInt32(result);

                if (isValid == 1)
                {

                    temp = 1;
                    // Successful Login Logic: Store Session ID, redirect, etc.
                    Session["Employee_id"] = id;

                    // Example: Response.Redirect("HomePage.aspx");
                }
                else
                {
                    // Failed Login Logic
                    Response.Write("<script>alert('Invalid Employee ID or Password.');</script>");
                }
            }
            catch (Exception ex)
            {
                // Log the exception (ex.Message) instead of displaying it to the user
                Response.Write("<script>alert('A database error occurred: " + ex.Message + "');</script>");
            }

            finally
            {
                conn.Close();
            }

           
            

            try
            {
                conn.Open();


                object roleResult = getRole.ExecuteScalar();


                // The function should return 1 (Success) or 0 (Failure) (or maybe -1 if INT)
                int isRole = roleResult != null ? 1 : 0;

                if (isRole == 1 && temp==1)
                {
                    // Successful Login Logic: Store Session ID, redirect, etc.
                    Response.Redirect("Employee_Home_Page(Upperboard).aspx");
                    Response.Write("<script>alert('Login Successful!');</script>");
                    // Example: Response.Redirect("HomePage.aspx");
                }
                else if(isRole==0 && temp==1)
                {
                    Response.Redirect("HomePage_employee.aspx");
                    Response.Write("<script>alert('Login Successful!');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Employee ID or Password.');</script>");
                }
            }
            catch (Exception ex)
            {
                // Log the exception (ex.Message) instead of displaying it to the user
                Response.Write("<script>alert('A database error occurred: " + ex.Message + "');</script>");
            }

            finally
            {
                conn.Close();
            }










        }
    }
}

