<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deductions_And_Payroll.aspx.cs" Inherits="ms3.Deductions_And_Payroll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>



            <h2>Employee Deductions And Monthly Payroll</h2>

<asp:Label ID="lblEmployee" runat="server" Text="Select Employee:" /><br />
<asp:DropDownList ID="ddlEmployees" runat="server" /><br /><br />

<asp:Button ID="btnDeductHours" runat="server" Text="Deduct Hours" OnClick="btnDeductHours_Click" /><br /><br />


<asp:Button ID="btnDeductDays" runat="server" Text="Deduct Days" OnClick="btnDeductDays_Click" /><br /><br />

            
<asp:Button ID="btnDeductUnpaid" runat="server" Text="Deduct Unplaid" OnClick="btnDeductUnpaid_Click" /><br /><br />

<asp:Label ID="lblFrom" runat="server" Text="From Date:" />
<asp:TextBox ID="txtFrom" runat="server" TextMode="Date" />

<asp:Label ID="lblTo" runat="server" Text="To Date:" />
<asp:TextBox ID="txtTo" runat="server" TextMode="Date" />

<asp:Button ID="btnGeneratePayroll" runat="server" Text="Generate Payroll" OnClick="btnGeneratePayroll_Click" />


<br /><br />
<asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green" />














        </div>
    </form>
</body>
</html>
