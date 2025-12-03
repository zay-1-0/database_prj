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
    public partial class AddOfficialHoliday : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddHoliday(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString(); // Replace with your actual connection string

            try
            {
                // Get values from textboxes
                string holidayName = emp_id.Text.Trim(); // Note: TextBox ID suggests it's for holiday name
                string fromDateText = check_in.Text.Trim();
                string toDateText = Check_out.Text.Trim();

                // Validate inputs
                if (string.IsNullOrEmpty(holidayName))
                {
                    ShowWarning("Please enter a Holiday Name.");
                    return;
                }

                if (string.IsNullOrEmpty(fromDateText) || string.IsNullOrEmpty(toDateText))
                {
                    ShowWarning("Please enter both Start Date and End Date.");
                    return;
                }

                DateTime fromDate;
                DateTime toDate;

                if (!DateTime.TryParse(fromDateText, out fromDate))
                {
                    ShowWarning("Please enter a valid Start Date (format: MM/DD/YYYY).");
                    return;
                }

                if (!DateTime.TryParse(toDateText, out toDate))
                {
                    ShowWarning("Please enter a valid End Date (format: MM/DD/YYYY).");
                    return;
                }

                if (fromDate > toDate)
                {
                    ShowWarning("Start Date cannot be after End Date.");
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Add_Holiday", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Add parameters
                        command.Parameters.Add("@holiday_name", SqlDbType.VarChar, 50).Value = holidayName;
                        command.Parameters.Add("@from_date", SqlDbType.Date).Value = fromDate;
                        command.Parameters.Add("@to_date", SqlDbType.Date).Value = toDate;

                      

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();


                        if (rowsAffected > 0)
                        {
                            ShowWarning($"Holiday '{holidayName}' added successfully!", false); // false means success, not warning
                            
                        }
                  
                        else
                        {
                            ShowWarning("Holiday could not be added. Please check for overlapping dates or contact administrator.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowWarning($"Error: {ex.Message}");
            }
        }

        private void ShowWarning(string message, bool isError = true)
        {
            WarningLabel.Text = message;
            WarningLabel.ForeColor = isError ? System.Drawing.Color.Red : System.Drawing.Color.Green;
            WarningLabel.Visible = true;
        }

       

        protected void goToAdminHomePage(object sender, EventArgs e)
        {
            // Redirect to admin home page
            Response.Redirect("AdminHomePage.aspx");
        }
    
}
}