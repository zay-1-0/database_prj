<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveApprovedLeaves.aspx.cs" Inherits="ms3.RemoveApprovedLeaves" %>

<!DOCTYPE html>








<html>
<head runat="server">
    <title>Remove Approved Leaves from Attendance</title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <h2>Remove Approved Leaves from Attendance</h2>

            <asp:Label ID="Label1" runat="server" Text="Employee ID: "></asp:Label>
            <asp:TextBox ID="txtEmployeeId" runat="server"></asp:TextBox>

            <br /><br />

            <asp:Button ID="btnRemoveApprovedLeaves" runat="server" 
                Text="Remove Approved Leaves" 
                OnClick="btnRemoveApprovedLeaves_Click" />

            <br /><br />
            <asp:Label ID="lblResult" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>