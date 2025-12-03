<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Acc.aspx.cs" Inherits="ms3.App_Acc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accidental Leave Application Screen</title>
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
            <asp:Button ID="Acc_Submit" runat="server" Text="Submit" OnClick="Acc_Submit_Click" />
            <br />
        </div>
    </form>
</body>
</html>
