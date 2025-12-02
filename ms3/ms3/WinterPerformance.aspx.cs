using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ms3
{
    public partial class WinterPerformance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPerformanceData();
            }
        }

        private void LoadPerformanceData()
        {
            try
            {
                
                string connStr = WebConfigurationManager
                                 .ConnectionStrings["UniHR_DB"]
                                 .ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    
                    string query = "SELECT * FROM allPerformance";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);

            
                    GridViewPerformance.DataSource = dt;
                    GridViewPerformance.DataBind();

         
                    LabelInfoPerf.ForeColor = System.Drawing.Color.Green;
                    LabelInfoPerf.Text = "Loaded performance rows: " + dt.Rows.Count;
                }
            }
            catch (Exception ex)
            {
             
                LabelInfoPerf.ForeColor = System.Drawing.Color.Red;
                LabelInfoPerf.Text = "Error loading performance data: " + ex.Message;
            }
        }
    }
}
