using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ms3
{
    public partial class Employee_Page_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void App_Acc_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Acc.aspx");
        }

        protected void App_Med_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Med.aspx");
        }

        protected void App_Unp_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Unp.aspx");
        }

        protected void App_Comp_Click(object sender, EventArgs e)
        {
            Response.Redirect("App_Comp.aspx");
        }
    }
}