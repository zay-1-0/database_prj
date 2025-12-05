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
            string connectionString = WebConfigurationManager.ConnectionStrings["UniHR_DB"].ToString();

            try
            {
                // 1. Read and validate inputs
                string holidayName = emp_id.Text.Trim();
                string fromDateText = check_in.Text.Trim();
                string toDateText = Check_out.Text.Trim();

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

                if (!DateTime.TryParse(fromDateText, out DateTime fromDate))
                {
                    ShowWarning("Please enter a valid Start Date.");
                    return;
                }

                if (!DateTime.TryParse(toDateText, out DateTime toDate))
                {
                    ShowWarning("Please enter a valid End Date.");
                    return;
                }

                if (fromDate > toDate)
                {
                    ShowWarning("Start Date cannot be after End Date.");
                    return;
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // 2. CHECK IF HOLIDAY TABLE EXISTS
                    bool tableExists = false;

                    using (SqlCommand checkTable = new SqlCommand(
                        @"SELECT CASE WHEN OBJECT_ID('Holiday', 'U') IS NOT NULL THEN 1 ELSE 0 END", connection))
                    {
                        tableExists = (int)checkTable.ExecuteScalar() == 1;
                    }

                    // 3. IF TABLE DOES NOT EXIST → CREATE IT
                    if (!tableExists)
                    {
                        // Run Create_Holiday
                        using (SqlCommand createCmd = new SqlCommand("Create_Holiday", connection))
                        {
                            createCmd.CommandType = CommandType.StoredProcedure;
                            createCmd.ExecuteNonQuery();
                        }
                    }

                    // 4. INSERT HOLIDAY USING Add_Holiday PROC
                    using (SqlCommand command = new SqlCommand("Add_Holiday", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add("@holiday_name", SqlDbType.VarChar, 50).Value = holidayName;
                        command.Parameters.Add("@from_date", SqlDbType.Date).Value = fromDate;
                        command.Parameters.Add("@to_date", SqlDbType.Date).Value = toDate;

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ShowWarning($"Holiday '{holidayName}' added successfully!", false);
                        }
                        else
                        {
                            ShowWarning("Holiday could not be added. It may overlap an existing holiday.");
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