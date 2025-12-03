using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
            string connectionString = "YourConnectionStringHere"; // Replace with your actual connection string

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Remove_Deductions", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Optional: Add output parameter to get number of records deleted
                        SqlParameter rowsAffectedParam = new SqlParameter("@RowsAffected", SqlDbType.Int);
                        rowsAffectedParam.Direction = ParameterDirection.Output;
                        command.Parameters.Add(rowsAffectedParam);

                        connection.Open();
                        int result = command.ExecuteNonQuery();
                        int rowsAffected = Convert.ToInt32(rowsAffectedParam.Value);

                        // Show success message
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
            Response.Redirect("Add_Holiday.aspx");
        }

        protected void InitiateAttendance(object sender, EventArgs e)
        {
            string connectionString = "YourConnectionStringHere"; // Replace with your actual connection string

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("Initiate_Attendance", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Optional: Add output parameter to get number of records inserted
                        SqlParameter rowsInsertedParam = new SqlParameter("@RowsInserted", SqlDbType.Int);
                        rowsInsertedParam.Direction = ParameterDirection.Output;
                        command.Parameters.Add(rowsInsertedParam);

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        int rowsInserted = rowsInsertedParam.Value != DBNull.Value ?
                            Convert.ToInt32(rowsInsertedParam.Value) : rowsAffected;

                        ShowMessage($"Attendance initiated successfully. {rowsInserted} new attendance record(s) created for today.");
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
    }
}