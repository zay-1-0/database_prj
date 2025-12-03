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
    public partial class App_Unp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unp_Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            DateTime start = DateTime.Parse(Start.Text);
            DateTime end = DateTime.Parse(End.Text);
            String doc_des = Doc_Desc.Text;
            String file_name = F_name.Text;


            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

                cmd.CommandText = "Submit_medical";

                cmd.Parameters.AddWithValue("@employee_ID", Session["Employee_ID"]);
                cmd.Parameters.AddWithValue("@start_date", start);
                cmd.Parameters.AddWithValue("@end_date", end);
                cmd.Parameters.AddWithValue("@document_description", doc_des);
                cmd.Parameters.AddWithValue("@file_name", file_name);



                cmd.ExecuteNonQuery();
            }


        }
    }
}