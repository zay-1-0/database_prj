



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR_HomePage.aspx.cs" Inherits="ms3.HR_HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        h1 {
            color: #0078D7;
            margin-top: 50px;
        }
        .button-style {
            background-color: #0078D7;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            width: 250px;
            height: 60px;
            margin: 15px;
        }
        .button-style:hover {
            background-color: #005a9e;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <h1>Welcome, HR</h1>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Manage Leaves" OnClick="btnLeaves_Click" CssClass="button-style" />
            <asp:Button ID="btnDeductionsPayroll" runat="server" Text="Deductions & Payroll" OnClick="btnDeductionsPayroll_Click" CssClass="button-style" />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="button-style" OnClick="signOut" Text="Sign Out" />
            <br />
        </div>
    </form>
</body>
</html>
