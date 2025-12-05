using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class Employee_Home_Page_Upperboard_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyperformanceView.aspx");
        }

        protected void fetchDed(object sender, EventArgs e)
        {
            Response.Redirect("FetchDeduction_Attendance.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyAttendance.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Last_month_payroll.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Apply_Annual_leave.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ret_Status_leaves.aspx");
        }

        protected void App_Leave(object sender, EventArgs e)
        {
            Response.Redirect("Leaves.aspx");
        }

        protected void Eval_Emp1(object sender, EventArgs e)
        {
            Response.Redirect("Eval_Emp.aspx");
        }

        protected void Proc_Lev(object sender, EventArgs e)
        {
            Response.Redirect("Process_Leaves.aspx");
        }
    }
}