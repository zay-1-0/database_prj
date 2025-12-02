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
    public partial class Deductions_And_Payroll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeesDropdown();
            }
        }



        private void BindEmployeesDropdown()
        {
            String connStr = WebConfigurationManager.ConnectionStrings["M3"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT EmployeeID, EmployeeName + ' (ID: ' + CAST(EmployeeID AS VARCHAR) + ')' AS DisplayText FROM Employees",
                    conn
                );

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlEmployees.DataSource = reader;
                ddlEmployees.DataTextField = "DisplayText";   // Show both name and ID
                ddlEmployees.DataValueField = "EmployeeID";   // Use ID internally
                ddlEmployees.DataBind();
            }

            ddlEmployees.Items.Insert(0, new ListItem("--Select Employee--", "0"));
        }

        protected void btnDeductHours_Click(object sender, EventArgs e)
        {

            int employeeId = int.Parse(ddlEmployees.SelectedValue);

            if (employeeId == 0)
            {
                lblMessage.Text = "Please select an employee.";
                return;
            }

            ExecuteProcedure("Deduction_hours", employeeId);
            lblMessage.Text = "Hours deduction successfully applied!";





        }

        protected void btnDeductDays_Click(object sender, EventArgs e)
        {
            int employeeId = int.Parse(ddlEmployees.SelectedValue);

            if (employeeId == 0)
            {
                lblMessage.Text = "Please select an employee.";
                return;
            }

            ExecuteProcedure("Deduction_days", employeeId);
            lblMessage.Text = "Days deduction successfully applied!";

        }

        protected void btnGeneratePayroll_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fromDate = DateTime.Parse(txtFrom.Text);
                DateTime toDate = DateTime.Parse(txtTo.Text);
                if (toDate < fromDate)
                {
                    lblMessage.Text = "❌ The 'To' date cannot be earlier than the 'From' date.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                String connStr = WebConfigurationManager.ConnectionStrings["M3"].ToString();
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("Add_Payroll", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@from", fromDate));
                    cmd.Parameters.Add(new SqlParameter("@to", toDate));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }


                lblMessage.Text = " Payroll generated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "❌ Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void btnDeductUnpaid_Click(object sender, EventArgs e)
        {
            int employeeId = int.Parse(ddlEmployees.SelectedValue);

            if (employeeId == 0)
            {
                lblMessage.Text = "Please select an employee.";
                return;
            }

            ExecuteProcedure("Deduction_unpaid", employeeId);
            lblMessage.Text = "Unpaid deduction successfully applied!";
        }

        private void ExecuteProcedure(string procedureName, int employeeId)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["M3"].ToString();
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(procedureName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmployeeID", employeeId);



                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }














    }
}