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
    public partial class Department_employee_count : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load department employee count data
                loadDepartmentEmployeeCountData();
            }
        }

        protected void goToAdminHomePage(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }

        private void loadDepartmentEmployeeCountData()
        {
            try
            {

                string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

                using (SqlConnection conn = new SqlConnection(connStr))
                {

                    string query = "SELECT * FROM NoEmployeeDept";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);

                    Depatment_Count_Table.DataSource = dt;
                    Depatment_Count_Table.DataBind();


                }
            }
            catch (Exception ex)
            {

            }
        }

    }
}