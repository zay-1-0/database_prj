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
    public partial class Rejected_medical_leaves : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load department employee count data
                loadMedidcalData();
            }
        }

        protected void goToAdminHomePage(object sender, EventArgs e)
        {
            Response.Redirect("Admin_HomePage.aspx");
        }

        private void loadMedidcalData()
        {
            try
            {
                string connStr = WebConfigurationManager
                                 .ConnectionStrings["UniHR_DB"]
                                 .ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * allRejectedMedicals";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    conn.Open();
                    da.Fill(dt);
                    leavesTable.DataSource = dt;
                    leavesTable.DataBind();
                  
                }
            }
            catch (Exception ex)
            {
            }
        }

    }
}