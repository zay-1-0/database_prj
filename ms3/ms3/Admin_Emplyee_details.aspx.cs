using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ms3
{
    public partial class Admin_Emplyee_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadEmployeeData();
            }
        }

        protected void goToAdminHomePage(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }

        private void loadEmployeeData()
        {
            try
            {

                string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {

                    string query = "SELECT * FROM allEmployeeProfiles";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);

                    Details_Table.DataSource = dt;
                    Details_Table.DataBind();

                    
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}