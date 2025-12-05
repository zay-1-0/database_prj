using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class HR_HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLeaves_Click(object sender, EventArgs e)
        {
            Response.Redirect("HR_Leaves.aspx");
        }

        protected void btnDeductionsPayroll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Deductions_And_Payroll.aspx");
        }

        protected void signOut(object sender, EventArgs e)
        {
            Response.Redirect("First_page.aspx");
        }
    }
}