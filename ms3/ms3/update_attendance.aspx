<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_attendance.aspx.cs" Inherits="ms3.update_attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style2">
            <asp:Button ID="backButton" runat="server" onClick="goToAdminHomePage" Text="back" />
        </p>
        <p class="auto-style2">
            Update Attendance
        </p>
        <p class="auto-style1">
            Emplyee ID</p>
        <p class="auto-style1">
            <asp:TextBox ID="emp_id" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            Check-in time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Check-out time</p>
        <p class="auto-style1">
            <asp:TextBox ID="check_in" runat="server"></asp:TextBox>
&nbsp;<asp:TextBox ID="Check_out" runat="server"></asp:TextBox>
        </p>
        <p class="auto-style1">
            <asp:Button ID="Button" runat="server" OnClick="updateAttendance" Text="update" />
        </p>
        <p class="auto-style1">
        <asp:Label ID="WarningLabel" runat="server" CssClass="auto-style1" ForeColor="Red" Visible="false"></asp:Label>
        </p>
    </form>
</body>
</html>
