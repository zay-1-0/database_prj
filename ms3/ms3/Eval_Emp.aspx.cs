using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ms3
{
    public partial class Dean_Pres_exc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployees();
            }
        }

        private void LoadEmployees()
        {
            string connStr = ConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT employee_id, first_name FROM employee";   // change table/columns if different

                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();

                ddlEmployees.DataSource = cmd.ExecuteReader();
                ddlEmployees.DataTextField = "first_name";
                ddlEmployees.DataValueField = "employee_id";
                ddlEmployees.DataBind();
            }

            ddlEmployees.Items.Insert(0, "-- Select Employee --");
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlEmployees.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please select an employee.');</script>");
                return;
            }

            string employeeID = ddlEmployees.SelectedValue;
            int rating = int.Parse(ddlRating.SelectedValue);
            string comment = txtComment.Text.Trim();
            string semester = ddlSemester.Text.Trim();

            // Validate semester format: S24, F25, W24
            if (!System.Text.RegularExpressions.Regex.IsMatch(semester, "^[SFW][0-9]{2}$"))
            {
                Response.Write("<script>alert('Semester must be in format S24, F25, or W24.');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("Dean_andHR_Evaluation", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@employee_ID", employeeID);
                cmd.Parameters.AddWithValue("@rating", rating);
                cmd.Parameters.AddWithValue("@comment", comment);
                cmd.Parameters.AddWithValue("@semester", semester);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Write("<script>alert('Evaluation submitted successfully!');</script>");
        }


        protected void HomeButton_Click(object sender, EventArgs e)
        {
            // redirect back to the appropriate page
            Response.Redirect("Employee_Home_Page(Upperboard).aspx");  // change to your actual homepage
        }
    }
}
