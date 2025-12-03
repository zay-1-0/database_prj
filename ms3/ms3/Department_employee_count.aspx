<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department_employee_count.aspx.cs" Inherits="ms3.Department_employee_count" %>

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
            <strong><asp:Button ID="back" runat="server" OnClick="goToAdminHomePage" Text="back" />
            </strong>
        </div>
        <br class="auto-style1" />
        <br class="auto-style1" />
        <span class="auto-style1">Number of emplyees per department</span><br class="auto-style1" />
        <br class="auto-style1" />
        <asp:GridView ID="Depatment_Count_Table" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
