<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_attendance.aspx.cs" Inherits="ms3.update_attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Attendance</title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            font-size: x-large;
        }

        .form-row {
            margin: 8px 0;
        }

        input[type="text"], input[type="time"] {
            padding: 6px 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
            width: 200px;
            box-sizing: border-box;
        }

        .btn-main {
            background: #4a6cf7;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 8px;
        }

        .btn-main:hover {
            background: #3b57c4;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style2">
            <asp:Button ID="backButton" runat="server" OnClick="goToAdminHomePage" Text="Back" CssClass="btn-main" />
        </p>

        <p class="auto-style2">Update Attendance</p>

        <div class="form-row">
            <label for="emp_id" class="auto-style1">Employee ID</label><br />
            <asp:TextBox ID="emp_id" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label class="auto-style1">Check-in time &nbsp;&nbsp; Check-out time</label><br />
            <asp:TextBox ID="check_in" runat="server" TextMode="Time"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="Check_out" runat="server" TextMode="Time"></asp:TextBox>
        </div>

        <div class="form-row">
            <asp:Button ID="Button" runat="server" OnClick="updateAttendance" Text="Update" CssClass="btn-main" />
        </div>

        <div class="form-row">
            <asp:Label ID="WarningLabel" runat="server" CssClass="auto-style1" ForeColor="Red" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
