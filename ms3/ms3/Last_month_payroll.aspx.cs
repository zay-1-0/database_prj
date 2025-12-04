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
    public partial class Last_month_payroll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Employee_id"] == null)
            {
                litMessage.Text = "<p style='color:red;'>Error: Employee session ID not found. Please log in again.</p>";
                return;
            }

            string connstr = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();
            string sqlQuery = "SELECT * FROM dbo.Last_month_payroll(@EmployeeID)";


            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connstr)) //opens a connection to the database
            {
                using (SqlCommand viewPayroll = new SqlCommand(sqlQuery, conn)) //creates a new sql command object
                {
                    try
                    {
                        // Add parameters securely
                        viewPayroll.Parameters.AddWithValue("@EmployeeID", Session["Employee_id"]);


                        // Use SqlDataAdapter to fill the DataTable
                        using (SqlDataAdapter adapter = new SqlDataAdapter(viewPayroll))
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
                        PayrollGridView.DataSource = dt;
                        PayrollGridView.DataBind();

                        if (dt.Rows.Count == 0)
                        {
                            // No records found for the given month
                            // colour is blue using html
                            litMessage.Text = "<p style='color:blue;'>No Payroll records found last month: .</p>";
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
            Response.Redirect("HomePage_employee.aspx");

        }
    }
}