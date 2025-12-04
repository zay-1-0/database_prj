<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveDayoff.aspx.cs" Inherits="ms3.RemoveDayoff" %>

<!DOCTYPE html>


<html>
<head runat="server">
    <title>Remove Unattended Day Off</title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <h2>Remove Unattended Day Off - Current Month</h2>

            <asp:Label ID="Label1" runat="server" Text="Employee ID: "></asp:Label>
            <asp:TextBox ID="txtEmployeeId" runat="server"></asp:TextBox>

            <br /><br />

            <asp:Button ID="btnRemoveDayOff" runat="server" 
                Text="Remove Unattended Day Off" 
                OnClick="btnRemoveDayOff_Click" />

            <br /><br />
            <asp:Label ID="lblResult" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>