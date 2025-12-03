<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Acc.aspx.cs" Inherits="ms3.App_Acc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Replacement Employee:
            <br />
            <asp:Label ID="Rep_Emp" runat="server" Text="Replacement Employee"></asp:Label>
            <br />
            Start Date:<br />
            <asp:Label ID="Start" runat="server" Text="Start Date"></asp:Label>
            <br />
            End Date:<br />
            <asp:Label ID="End" runat="server" Text="End Date"></asp:Label>
            <br />
            <asp:Button ID="Acc_Submit" runat="server" Text="Submit" OnClick="Acc_Submit_Click" />
            <br />
        </div>
    </form>
</body>
</html>
