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
    public partial class Process_Leaave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingLeaves();
            }
        }

        private void LoadPendingLeaves()
        {
            int approverId = Convert.ToInt32(Session["Employee_ID"]);

            string connStr = WebConfigurationManager
                             .ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    L.request_ID,
                    E.employee_id,
                    E.first_name + ' ' + E.last_name AS EmployeeName,
                    L.date_of_request,
                    L.start_date,
                    L.end_date,
                    L.final_approval_status,
                    CASE 
                        WHEN AL.request_ID IS NOT NULL THEN 'Annual'
                        WHEN UL.request_ID IS NOT NULL THEN 'Unpaid'
                        ELSE 'Other'
                    END AS LeaveType,
                    AL.replacement_emp
                FROM Employee_Approve_Leave EA
                JOIN Leave L 
                    ON EA.leave_ID = L.request_ID
                LEFT JOIN Annual_Leave AL 
                    ON L.request_ID = AL.request_ID
                LEFT JOIN Unpaid_Leave UL 
                    ON L.request_ID = UL.request_ID
                JOIN Employee E
                    ON E.employee_id = COALESCE(AL.emp_ID, UL.Emp_ID)
                WHERE EA.Emp1_ID = @ApproverID
                  AND EA.status = 'Pending'
                  AND (AL.request_ID IS NOT NULL OR UL.request_ID IS NOT NULL);
            ", conn))
            {
                cmd.Parameters.AddWithValue("@ApproverID", approverId);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                gvUpperboardLeaves.DataSource = dt;
                gvUpperboardLeaves.DataBind();
            }

            lblMessage.Text = "";
        }

        protected void gvUpperboardLeaves_RowCommand(object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName != "Process")
                return;

            int rowIndex = Convert.ToInt32(e.CommandArgument);
            var keys = gvUpperboardLeaves.DataKeys[rowIndex];

            int requestId = (int)keys.Values["request_ID"];
            string leaveType = keys.Values["LeaveType"].ToString();

            object replObj = keys.Values["replacement_emp"];
            int? replacementEmp = null;
            if (replObj != null && replObj != DBNull.Value)
            {
                replacementEmp = Convert.ToInt32(replObj);
            }

            int approverId = Convert.ToInt32(Session["Employee_ID"]);

            ProcessLeave(requestId, approverId, leaveType, replacementEmp);

            lblMessage.Text = "Leave request processed.";

            LoadPendingLeaves();
        }

        private void ProcessLeave(int requestId, int approverId,
                                  string leaveType, int? replacementEmp)
        {
            string connStr = WebConfigurationManager
                             .ConnectionStrings["UniHR_DB"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;

                if (leaveType == "Annual")
                {
                    cmd.CommandText = "Upperboard_approve_annual";
                    cmd.Parameters.AddWithValue("@request_ID", requestId);
                    cmd.Parameters.AddWithValue("@Upperboard_ID", approverId);
                    cmd.Parameters.AddWithValue("@replacement_ID",
    replacementEmp.HasValue ? (object)replacementEmp.Value : (object)DBNull.Value);

                }
                else if (leaveType == "Unpaid")
                {
                    cmd.CommandText = "Upperboard_approve_unpaids";
                    cmd.Parameters.AddWithValue("@request_ID", requestId);
                    cmd.Parameters.AddWithValue("@upperboard_ID", approverId);
                }
                else
                {
                    return;
                }

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void HomeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee_Home_Page(Upperboard).aspx");
        }
    }
}