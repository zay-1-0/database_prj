using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = ""; 
            }
        }



        protected void Login_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            int id = int.Parse(UserName.Text);       
            string pass = Password.Text;             

            string sql = "SELECT dbo.HRLoginValidation(@employee_ID, @password)";

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@employee_ID", id);
                cmd.Parameters.AddWithValue("@password", pass);

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    conn.Close();

                    
                    bool loginSuccess = (result != null) && (bool)result;

                    if (loginSuccess)
                    {
                        Session["HR_ID"] = id;
                        Response.Redirect("HR_HomePage.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}