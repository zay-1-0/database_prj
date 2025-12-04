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
    public partial class App_Acc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Acc_Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();
            DateTime start = DateTime.Parse(calStart.Text);
            DateTime end = DateTime.Parse(calEnd.Text);



            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

                cmd.CommandText = "Submit_accidental";

                cmd.Parameters.AddWithValue("@employee_ID", Session["Employee_ID"]);
                cmd.Parameters.AddWithValue("@start_date", start);
                cmd.Parameters.AddWithValue("@end_date", end);



                cmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(),
                    "Success",
                    "alert('Accidental leave submitted successfully!');",
                    true);

            }
        }
    }
}