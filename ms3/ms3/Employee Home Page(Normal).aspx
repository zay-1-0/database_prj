<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee Home Page(Normal).aspx.cs" Inherits="ms3.Employee_Home_Page_Normal_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Welcome!<br />
            What would you like to do?<br />
            <asp:Button ID="Ret_Perf" runat="server" Text="Retrieve Performance" />
            <asp:Button ID="Ret_Att" runat="server" Text="Retrieve attendance" />
            <asp:Button ID="Ret_pay" runat="server" Text="Retrieve Payroll" />
            <asp:Button ID="Fetch_Ded" runat="server" Text="Fetch Deductions" />
            <asp:Button ID="View_Ann_Acc" runat="server" Text="View Annual/Accidental Leaves" />
            <asp:Button ID="App_Leave" runat="server" Text="Apply for a leave" />
            <br />

        </div>
    </form>
</body>
</html>
