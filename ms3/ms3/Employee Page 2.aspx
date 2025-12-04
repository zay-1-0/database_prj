<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee Page 2.aspx.cs" Inherits="ms3.Employee_Page_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="margin-left: 320px">
            Apply For a Leave :<br />
            </p>
        </div>
        <asp:Button ID="App_Acc" runat="server" Text="Accidental Leave" OnClick="App_Acc_Click" />
        <asp:Button ID="App_Med" runat="server" Text="Medical Leave" OnClick="App_Med_Click" />
        <asp:Button ID="App_Unp" runat="server" Text="Unpaid Leave" OnClick="App_Unp_Click" />
        <asp:Button ID="App_Comp" runat="server" Text="Compensation Leave" OnClick="App_Comp_Click" />
        <asp:Button ID="Button5" runat="server" Text="Annual leave" OnClick="Button4_Click" />
    </form>
</body>
</html>
