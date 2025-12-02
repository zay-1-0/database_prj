using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ms3
{
    public partial class Employees_yesterday_Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAttendanceData();
            }
        }

        private void LoadAttendanceData()
        {
            try
            {
           
                string connStr = WebConfigurationManager
                                 .ConnectionStrings["UniHR_DB"]
                                 .ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    
                    string query = "SELECT * FROM allEmployeeAttendance";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);

                    GridViewYesterday.DataSource = dt;
                    GridViewYesterday.DataBind();

                    LabelInfo.Text = "Loaded rows: " + dt.Rows.Count;
                }
            }
            catch (Exception ex)
            {

                LabelInfo.Text = "Error: " + ex.Message;
            }
        }
    }
}
