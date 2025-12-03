<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Unp.aspx.cs" Inherits="ms3.App_Unp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unpaid Leave Application Screen</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Start Date:<br />
            <asp:Label ID="Start" runat="server" Text="Start Date"></asp:Label>
            <br />
            <br />
            End Date:<br />
            <asp:Label ID="End" runat="server" Text="End Date"></asp:Label>
            <br />
            <br />
            Document Description:<br />
            <asp:Label ID="Doc_Desc" runat="server" Text="Document Description"></asp:Label>
            <br />
            <br />
            File Name:<br />
            <asp:Label ID="F_name" runat="server" Text="File Name"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Unp_Submit" runat="server" Text="Submit" OnClick="Unp_Submit_Click" />
        </div>
    </form>
</body>
</html>
