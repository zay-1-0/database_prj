<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="ms3.AdminHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: xx-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong><span class="auto-style2">Welcome, Admin</span><br />
            <br />

            </strong>
            <asp:Button ID="Button1" runat="server" OnClick="EmplyeeDetailsButton" Text="Employee details" />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="DepartmentCountButton" Text="Number Of Employees Per Department" />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="RejectedMedicalsButton" Text="Rejected Medical Leaves" />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="RemoveResigned" Text="Remove Deductions of Resigned Employees" />
            <br />
            <asp:Button ID="Button5" runat="server" OnClick="UpdateAttendance" Text="Update Today's Attendance" />
            <br />
            <asp:Button ID="Button6" runat="server" OnClick="AddHoliday" Text="Add Official Holiday" />
            <br />
            <asp:Button ID="Button7" runat="server" OnClick="InitiateAttendance" Text="Initiate Today's Attendance" />
            <br />
            <br />
            <asp:Label ID="WarningLabel" runat="server" CssClass="auto-style1" ForeColor="Red" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
