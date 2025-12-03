<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Comp.aspx.cs" Inherits="ms3.App_Comp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Compensation Date:<br />
            <asp:Label ID="Comp_Date" runat="server" Text="Compensation Date"></asp:Label>
            <br />
            <br />
            Reason:<br />
            <asp:Label ID="Reason" runat="server" Text="Reason"></asp:Label>
            <br />
            <br />
            Date of Original Work Day:<br />
            <asp:Label ID="Org_date" runat="server" Text="Date of Original Work Day"></asp:Label>
            <br />
            <br />
            Replacement Employee:<br />
            <asp:Label ID="Rep_Emp" runat="server" Text="Replacement Employee"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Comp_Submit" runat="server" Text="Submit" />
        </div>
    </form>
</body>
</html>
