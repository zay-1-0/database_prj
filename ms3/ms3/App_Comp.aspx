<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="App_Comp.aspx.cs" Inherits="ms3.App_Comp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Compensation Leave Application</title>
</head>

<body>
    <form id="form1" runat="server">

        <div>

            <!-- Compensation Date -->
            Compensation Date:<br />
            <asp:TextBox ID="Comp_Date" runat="server" TextMode="Date"></asp:TextBox>
            <br /><br />

            <!-- Reason -->
            Reason:<br />
            <asp:TextBox ID="Reason" runat="server"></asp:TextBox>
            <br /><br />

            <!-- Date of Original Work Day -->
            Date of Original Work Day:<br />
            <asp:TextBox ID="Org_date" runat="server" TextMode="Date"></asp:TextBox>
            <br /><br />

            <!-- Replacement Employee -->
            Replacement Employee:<br />
            <asp:DropDownList ID="Rep_Emp" runat="server"></asp:DropDownList>
            <br /><br />

            <!-- Submit Button -->
            <asp:Button ID="Comp_Submit" runat="server" Text="Submit" OnClick="Comp_Submit_Click" />


             <asp:Literal ID="litMessage" runat="server"></asp:Literal>
     <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />

        </div>

    </form>
</body>
</html>
