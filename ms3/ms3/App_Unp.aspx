<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Unp.aspx.cs" Inherits="ms3.App_Unp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unpaid Leave Application</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <!-- Start Date -->
            Start Date:<br />
            <asp:TextBox ID="txtStart" runat="server" TextMode="Date"></asp:TextBox>
            <br /><br />

            <!-- End Date -->
            End Date:<br />
            <asp:TextBox ID="txtEnd" runat="server" TextMode="Date"></asp:TextBox>
            <br /><br />

            <!-- Document Description -->
            Document Description:<br />
            <asp:TextBox ID="txtDocDesc" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
            <br /><br />

            <!-- File Name -->
            File Name:<br />
            <asp:TextBox ID="txtFileName" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Submit Button -->
            <asp:Button ID="Unp_Submit" runat="server" Text="Submit" OnClick="Unp_Submit_Click" />


             <asp:Literal ID="litMessage" runat="server"></asp:Literal>
     <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />

        </div>
    </form>
</body>
</html>
