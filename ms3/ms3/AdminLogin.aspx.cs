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
    public partial class AdminLogin : System.Web.UI.Page
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

            string id = UserName.Text;
            string pass = Password.Text;

            if(id == "admin" && pass == "admin") Response.Redirect("AdminHomePage.aspx");
            else Response.Write("<script>alert('Wrong Password or ID.');</script>");

        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}