using System;

namespace ms3 
{
    public partial class AttendanceTools : System.Web.UI.Page
    {
        protected void btnGoRemoveHoliday_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveHoliday.aspx");
        }

        protected void btnGoRemoveDayOff_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveDayOff.aspx");
        }

        protected void btnGoRemoveApprovedLeaves_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveApprovedLeaves.aspx");
        }

        protected void btnGoReplaceEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReplaceEmployee.aspx");
        }

        protected void btnGoUpdateEmploymentStatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateEmploymentStatus.aspx");
        }

        protected void GoBack(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");

        }
    }
}