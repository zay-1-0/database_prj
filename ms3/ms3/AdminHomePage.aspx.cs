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
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    


        protected void EmplyeeDetailsButton(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Emplyee_details.aspx");
        }


        protected void DepartmentCountButton(object sender, EventArgs e)
        {
            Response.Redirect("Department_employee_count.aspx");
        }

        protected void RejectedMedicalsButton(object sender, EventArgs e)
        {
            Response.Redirect("Rejected_medical_leaves.aspx");
        }

        protected void RemoveResigned(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Make sure you're calling the correct procedure
                    using (SqlCommand command = new SqlCommand("Remove_Deductions", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // First, let's execute without parameters to see if that works
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        ShowMessage($"Successfully removed deductions for {rowsAffected} resigned employee(s).");
                    }
                }
            }
            catch (SqlException ex)
            {
                ShowMessage($"Database error: {ex.Message}");
            }
            catch (Exception ex)
            {
                ShowMessage($"Error: {ex.Message}");
            }
        }


        protected void UpdateAttendance(object sender, EventArgs e)
        {
            Response.Redirect("update_attendance.aspx");
        }

        protected void AddHoliday(object sender, EventArgs e)
        {
            Response.Redirect("AddOfficialHoliday.aspx");
        }

        protected void InitiateAttendance(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Initiate_Attendance", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0) 
                        ShowMessage($"Attendance initiated successfully. {rowsAffected} new attendance record(s) created for today.");
                        else 
                        ShowMessage("Attendance has already been initiated for today.");
                    }
                }
            }
            catch (SqlException ex)
            {
                ShowMessage($"Database error: {ex.Message}");
            }
            catch (Exception ex)
            {
                ShowMessage($"Error: {ex.Message}");
            }
        }
        private void ShowMessage(string message)
        {
            WarningLabel.Text = message;
            WarningLabel.Visible = true;
        }

        protected void signOut(object sender, EventArgs e)
        {
            Response.Redirect("First_page.aspx");
        }

        protected void GoToAttendanceTools(object sender, EventArgs e)
        {
            Response.Redirect("AttendanceTools.aspx");
        }

        protected void GoToWinterPerformance(object sender, EventArgs e)
        {
            Response.Redirect("WinterPerformance.aspx");
        }

        protected void GoToYesterdaysAttendance(object sender, EventArgs e)
        {
            Response.Redirect("Employees_yesterday_Attendance.aspx");
        }
    }
}