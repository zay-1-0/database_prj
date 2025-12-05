<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOfficialHoliday.aspx.cs" Inherits="ms3.AddOfficialHoliday" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Official Holiday</title>
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

        input[type="text"], input[type="date"] {
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

        <p class="auto-style2">Add Official Holiday</p>

        <div class="form-row">
            <label for="emp_id" class="auto-style1">Holiday Name</label><br />
            <asp:TextBox ID="emp_id" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label class="auto-style1">Start Date &nbsp;&nbsp; End Date &nbsp;&nbsp; Eg: dd/mm/yyyy</label><br />
            <asp:TextBox ID="check_in" runat="server" TextMode="Date"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="Check_out" runat="server" TextMode="Date"></asp:TextBox>
        </div>

        <div class="form-row">
            <asp:Button ID="AddButton" runat="server" OnClick="AddHoliday" Text="Add" CssClass="btn-main" />
        </div>

        <div class="form-row">
            <asp:Label ID="WarningLabel" runat="server" CssClass="auto-style1" ForeColor="Red" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
