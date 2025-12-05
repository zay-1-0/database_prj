<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eval_Emp.aspx.cs" Inherits="ms3.Dean_Pres_exc" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upperboard Leave Approvals</title>
    <style>
        .page-title {
            font-family: Arial;
            font-size: 22px;
            margin-bottom: 15px;
        }
        .grid {
            font-family: Arial;
            font-size: 14px;
        }
        .grid th {
            background-color: #f0f0f0;
            padding: 6px;
        }
        .grid td {
            padding: 4px 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div>
        Evaluate Employee:<br />
        <br />

        <asp:DropDownList ID="ddlEmployees" runat="server" /><br />
              <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />

        </div>

    </form>
</body>
</html>

