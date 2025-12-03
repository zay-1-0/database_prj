using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ms3
{
    public partial class update_attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void goToAdminHomePage(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }
        protected void updateAttendance(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString(); // Replace with your actual connection string

            try
            {
                // Get values from textboxes
                int employeeId;
                if (!int.TryParse(emp_id.Text.Trim(), out employeeId))
                {
                    ShowMessage("Please enter a valid Employee ID.");
                    return;
                }
                TimeSpan? checkInTime = ParseTime(check_in.Text);
                TimeSpan? checkOutTime = ParseTime(Check_out.Text);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Update_Attendance", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters
                        command.Parameters.Add("@Employee_id", SqlDbType.Int).Value = employeeId;

                        if (checkInTime.HasValue)
                            command.Parameters.Add("@check_in_time", SqlDbType.Time).Value = checkInTime.Value;
                        else
                            command.Parameters.Add("@check_in_time", SqlDbType.Time).Value = DBNull.Value;

                        if (checkOutTime.HasValue)
                            command.Parameters.Add("@check_out_time", SqlDbType.Time).Value = checkOutTime.Value;
                        else
                            command.Parameters.Add("@check_out_time", SqlDbType.Time).Value = DBNull.Value;

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowMessage("Attendance updated successfully!");
                        }
                        else
                        {
                            ShowMessage("No attendance record found for this employee today.");
                        }
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

        private TimeSpan? ParseTime(string timeText)
        {
    
            TimeSpan time;
            if (TimeSpan.TryParse(timeText, out time))
                return time;

            // Try parsing with different formats
            DateTime dateTime;
            if (DateTime.TryParse(timeText, out dateTime))
                return dateTime.TimeOfDay;

            ShowMessage($"Invalid time format: {timeText}. Please use HH:MM or HH:MM:SS format.");
            return null;
        }

        private void ShowMessage(string message)
        {
            WarningLabel.Text = message;
            WarningLabel.Visible = true;
        }
    }
}