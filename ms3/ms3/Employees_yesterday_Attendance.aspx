<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Employees_yesterday_Attendance.aspx.cs"
    Inherits="ms3.Employees_yesterday_Attendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yesterday Attendance</title>
</head>
<body>
    <form id="form1" runat="server">
 
        <h2>Employees yesterday attendance records</h2>

    
        <asp:Label ID="LabelInfo" runat="server" ForeColor="Red"></asp:Label>
        <br /><br />


        <asp:GridView ID="GridViewYesterday" runat="server"
            AutoGenerateColumns="true"
            BorderStyle="Solid"
            BorderWidth="1px"
            CellPadding="4"
            GridLines="Both">
        </asp:GridView>
    </form>
</body>
</html>