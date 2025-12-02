using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace ms3
{
    public partial class HR_Leaves : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPendingLeaves();
            }

        }


        private void BindPendingLeaves()
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M3"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT 
                EAL.RequestID,
                

                CASE 
                   
                    WHEN AN.request_ID IS NOT NULL THEN 'Annual'
                    WHEN AC.request_ID IS NOT NULL THEN 'Accidental'
                    WHEN U.request_ID IS NOT NULL THEN 'Unpaid'
                    WHEN C.request_ID IS NOT NULL THEN 'Compensation'
                END AS LeaveType
            FROM Employee_Approve_Leave  EAL 

           
            LEFT JOIN Annual_Leave AN ON EAL.leave_ID = AN.request_ID
            LEFT JOIN Accidental_Leave AC ON EAL.leave_ID = AC.request_ID
            LEFT JOIN Unpaid_Leave U ON EAL.leave_ID = U.request_ID
            LEFT JOIN Compensation_Leave C ON EAL.leave_ID = C.request_ID 
 

            WHERE 
                EAL.Emp1_ID = @hr
                AND EAL.Status = 'Pending';
        ";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@hr", Session["HR_id"]);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                gvLeaves.DataSource = reader;
                gvLeaves.DataBind();
            }
        }




        protected void gvLeaves_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Process")
            {
                int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;

                int requestId = Convert.ToInt32(gvLeaves.DataKeys[rowIndex]["RequestID"]);
                string leaveType = gvLeaves.DataKeys[rowIndex]["LeaveType"].ToString();

              
                ExecuteLeaveProcedure(requestId, leaveType);

               
                BindPendingLeaves();

                lblLeaveMessage.ForeColor = System.Drawing.Color.Green;
                lblLeaveMessage.Text = $"{leaveType} leave request has been processed.";
            }
        }



        private void ExecuteLeaveProcedure(int requestId, string leaveType)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["M3"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand
                {
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure
                };

               
                switch (leaveType)
                {
                   
                    case "Annual":
                    case "Accidental":
                        cmd.CommandText = "HR_approval_an_acc";
                        break;
                    case "Unpaid":
                        cmd.CommandText = "HR_approval_Unpaid";
                        break;
                    case "Compensation":
                        cmd.CommandText = "HR_approval_comp";
                        break;
                    default:
                        return; 
                }

                
                cmd.Parameters.AddWithValue("@request_ID", requestId);
                cmd.Parameters.AddWithValue("@HR_ID", Session["HR_id"]);
               

                cmd.ExecuteNonQuery();
            }
        }



    }
}














    
