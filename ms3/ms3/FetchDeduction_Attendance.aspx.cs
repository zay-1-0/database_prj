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
    public partial class FetchDeduction_Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetTable_Click(object sender, EventArgs e)
        {
            int MonthValue = Int16.Parse(month.Text); // Get the semester input from the TextBox

            // Input validation
            if (MonthValue == 0) //makes sure the int is not zero or empty
            {
                //makes the colour of the 
                litMessage.Text = "<p> Please enter a Month (e.g., 1 for jan).</p>";
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
            string sqlQuery = "SELECT * FROM dbo.Deductions_Attendance(@EmployeeID, @month)";

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
                        viewPerformance.Parameters.AddWithValue("@month", MonthValue);

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
                        DeductionGridView.DataSource = dt;
                        DeductionGridView.DataBind();

                        if (dt.Rows.Count == 0)
                        {
                            // No records found for the given semester
                            // colour is blue using html
                            litMessage.Text = "<p style='color:blue;'>No deduction records caused by attendance found for month " + MonthValue + ".</p>";
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
                AND role_name IN ('Dean','Vice Dean','President', 'Vice President')", conn);
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