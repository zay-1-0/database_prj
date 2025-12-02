<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="WinterPerformance.aspx.cs"
    Inherits="ms3.WinterPerformance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Winter Performance</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Employees performance in all Winter semesters</h2>

     
        <asp:Label ID="LabelInfoPerf" runat="server" ForeColor="Red"></asp:Label>
        <br /><br />

 
        <asp:GridView ID="GridViewPerformance" runat="server"
            AutoGenerateColumns="true"
            BorderStyle="Solid"
            BorderWidth="1px"
            CellPadding="4"
            GridLines="Both">
        </asp:GridView>
    </form>
</body>
</html>
