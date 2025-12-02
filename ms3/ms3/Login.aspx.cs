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

        }



        protected void Login_Click(object sender, EventArgs e)
        {


            String connStr = WebConfigurationManager.ConnectionStrings["M3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = Int16.Parse(UserName.Text);
            String pass = Password.Text;


            SqlCommand loginfun = new SqlCommand("HRLoginValidation", conn);

            loginfun.Parameters.Add(new SqlParameter("@employee_ID", id));
            loginfun.Parameters.Add(new SqlParameter("@password", pass));

            conn.Open();
            object result = loginfun.ExecuteScalar();
            conn.Close();


            if (result != null && (int)result == 1)
            {
                Session["HR_ID"] = id;
                Response.Write("Hello");
                Response.Redirect("HR_HomePage.aspx");
            }



        }
    }
}