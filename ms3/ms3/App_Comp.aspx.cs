using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace ms3
{
    public partial class App_Comp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadReplacementEmployees();
            }
        }

        private void LoadReplacementEmployees()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT Employee_ID, first_name + ' ' + last_name AS FullName FROM Employee", conn))
            {
                conn.Open();

                Rep_Emp.DataSource = cmd.ExecuteReader();
                Rep_Emp.DataTextField = "FullName";     // what user sees
                Rep_Emp.DataValueField = "Employee_ID"; // what is sent to DB
                Rep_Emp.DataBind();
            }

            Rep_Emp.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Employee --", "0"));
        }

        protected void Comp_Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            DateTime comp_date = DateTime.Parse(Comp_Date.Text);
            string reason = Reason.Text;
            DateTime org_date = DateTime.Parse(Org_date.Text);

            int rep_emp = int.Parse(Rep_Emp.SelectedValue); // <-- CORRECTED

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("Submit_compensation", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                int employeeID = Convert.ToInt32(Session["Employee_ID"]);
                cmd.Parameters.AddWithValue("@employee_ID", employeeID);


                cmd.Parameters.AddWithValue("@Compensation_date", comp_date);
                cmd.Parameters.AddWithValue("@reason", reason);
                cmd.Parameters.AddWithValue("@date_of_original_workday", org_date);
                cmd.Parameters.AddWithValue("@rep_emp_id", rep_emp);

                cmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(this.GetType(),
                    "Success",
                    "alert('Compensation leave submitted successfully!');",
                    true);
            }
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            int employeeID = Convert.ToInt32(Session["Employee_ID"]);

            string connStr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if employee is part of upper board roles
                SqlCommand cmdRole = new SqlCommand(
                    @"SELECT COUNT(*) 
              FROM Employee_Role 
              WHERE emp_ID = @EmpID 
                AND role_name IN ('Dean','Vice Dean','President')", conn);
                cmdRole.Parameters.AddWithValue("@EmpID", employeeID);

                int roleCount = (int)cmdRole.ExecuteScalar();

                if (roleCount > 0)
                {
                    Response.Redirect("Employee_Home_Page(Upperboard).aspx");
                }
                else
                {
                    Response.Redirect("HomePage_employee.aspx");
                }
            }
        }
    }
}
