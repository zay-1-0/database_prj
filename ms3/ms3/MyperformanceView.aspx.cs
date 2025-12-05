using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class MyperformanceView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetTable_Click(object sender, EventArgs e)
        {
            string semesterValue = Semester.Text; // Get the semester input from the TextBox

            // Input validation
            if (semesterValue.Length==0) //makes sure the string is not empty
            {
                //makes the colour of the 
                litMessage.Text = "<p> Please enter a semester value (e.g., W24).</p>"; 
                return; //returns so it doesnt continue executing the rest of the code
            }

            // Ensure Employee ID is available
            //if hes not available the code will not run
            if (Session["Employee_id"] == null)
            {
                litMessage.Text = "<p style='color:red;'>Error: Employee session ID not found. Please log in again.</p>";
                return;
            }

            // Database connection setup
            string connstr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();
            string sqlQuery = "SELECT * FROM dbo.MyPerformance(@EmployeeID, @period)";

            // DataTable to hold the results
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connstr)) //opens a connection to the database
            {
                using (SqlCommand viewPerformance = new SqlCommand(sqlQuery, conn)) //creates a new sql command object
                {
                    try
                    {
                        // Add parameters securely
                        viewPerformance.Parameters.AddWithValue("@EmployeeID", Session["Employee_id"]);
                        viewPerformance.Parameters.AddWithValue("@period", semesterValue);

                        // Use SqlDataAdapter to fill the DataTable
                        using (SqlDataAdapter adapter = new SqlDataAdapter(viewPerformance)) 
                        //creates a new sql data adapter object
                        //which is used to fill the datatable with the results of the sql command
                        //simply put , it is used to execute the command and fill the datatable with the results
                        //multiple coloumns and rows can be returned
                        //filling the datatable with the results of the sql command
                        {
                            //opens the connection to the database so the command can be executed
                            conn.Open();
                            //using the adapter to fill the datatable with the results of the sql command
                            adapter.Fill(dt);
                        }

                        // 2. Bind the DataTable to the GridView in the ASPX page
                        PerformanceGridView.DataSource = dt;
                        PerformanceGridView.DataBind();

                        if (dt.Rows.Count == 0)
                        {
                            // No records found for the given semester
                            // colour is blue using html
                            litMessage.Text = "<p style='color:blue;'>No performance records found for semester: "+ semesterValue + ".</p>";
                        }
                    }
                    catch (Exception ex)
                    {
                        // 3. Display error message using the Literal control
                        // colour is red using html
                        litMessage.Text = $"<p style='color:red;'>Database/Query Error: Could not retrieve data. Details: {ex.Message}</p>";
                    }
                }
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