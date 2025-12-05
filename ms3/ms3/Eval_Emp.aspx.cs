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
    public partial class Dean_Pres_exc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindEmployeesDropdown();
                
            }
        }


        private void BindEmployeesDropdown()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();
            int myEmployeeId = Convert.ToInt32(Session["Employee_ID"]);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT 
                E2.employee_id,
                E2.first_name + ' ' + E2.last_name + ' (ID: ' + CAST(E2.employee_id AS VARCHAR) + ')' AS DisplayText
            FROM Employee E2
            WHERE E2.dept_name = (
                SELECT dept_name 
                FROM Employee 
                WHERE employee_id = @MyID
            );
        ";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MyID", myEmployeeId);

                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    ddlEmployees.DataSource = reader;
                    ddlEmployees.DataTextField = "DisplayText";
                    ddlEmployees.DataValueField = "employee_id";
                    ddlEmployees.DataBind();
                }
            }

            ddlEmployees.Items.Insert(0, new ListItem("--Select Employee--", "0"));
        }




    }
}