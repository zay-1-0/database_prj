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
    public partial class App_Comp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Comp_Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            DateTime comp_date = DateTime.Parse(Comp_Date.Text);
            String reason = Reason.Text;
            DateTime org_date = DateTime.Parse(Org_date.Text);
            int rep_emp = int.Parse(Rep_Emp.Text);


            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

                cmd.CommandText = "Submit_compensation";

                cmd.Parameters.AddWithValue("@employee_ID", Session["Employee_ID"]);
                cmd.Parameters.AddWithValue("@Compensation_date", comp_date);
                cmd.Parameters.AddWithValue("@reason", reason);
                cmd.Parameters.AddWithValue("@date_of_original_workday", org_date);
                cmd.Parameters.AddWithValue("@replacement_emp", rep_emp);



                cmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(),
                    "Success",
                    "alert('Accidental leave submitted successfully!');",
                    true);
            }
        }
    }
}