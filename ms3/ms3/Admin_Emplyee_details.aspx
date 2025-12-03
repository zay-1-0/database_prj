<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Emplyee_details.aspx.cs" Inherits="ms3.Admin_Emplyee_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
&nbsp;<strong><asp:Button ID="back" runat="server" OnClick="goToAdminHomePage" Text="back" />
            </strong><br />
            <br />
            <strong><span class="auto-style1">Employee details</span></strong><br />
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="Details_Table" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
