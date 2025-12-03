<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Med.aspx.cs" Inherits="ms3.App_Med" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Leave Application Screen</title>
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
            Type:<br />
            <asp:Label ID="Type" runat="server" Text="Type"></asp:Label>
            <br />
            <br />
            Insurance:<br />
            <asp:Label ID="Insurance" runat="server" Text="Insurance"></asp:Label>
            <br />
            <br />
            Disability Details:<br />
            <asp:Label ID="Dis_Det" runat="server" Text="Disability Details"></asp:Label>
            <br />
            <br />
            Document Description:<br />
            <asp:Label ID="Doc_Desc" runat="server" Text="Document Discription"></asp:Label>
            <br />
            <br />
            File Name:<br />
            <asp:Label ID="F_name" runat="server" Text="File Name"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Med_Submit" runat="server" Text="Submit" OnClick="Med_Submit_Click" />
        </div>
    </form>
</body>
</html>
