<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deductions_And_Payroll.aspx.cs" Inherits="ms3.Deductions_And_Payroll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Deductions and Payroll</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf0f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 700px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #0056b3;
            margin-bottom: 30px;
        }

        label, asp\:Label {
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #0056b3;
        }

        asp\:DropDownList, asp\:TextBox {
            width: 100%;
            padding: 8px;
            border: 1px solid #007ACC;
            border-radius: 4px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .btn {
            background-color: #007ACC;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #005fa3;
        }

        #lblMessage {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            text-align: center;
        }

        .date-range {
            display: flex;
            gap: 10px;
            align-items: center;
            margin-bottom: 15px;
        }

        .date-range asp\:Label {
            width: 80px;
            margin-bottom: 0;
        }

        .date-range asp\:TextBox {
            flex: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Employee Deductions and Monthly Payroll</h2>

            <asp:Label ID="lblEmployee" runat="server" Text="Select Employee:" /><br />
            <asp:DropDownList ID="ddlEmployees" runat="server" /><br />

            <asp:Button ID="btnDeductHours" runat="server" Text="Deduct Hours" CssClass="btn" OnClick="btnDeductHours_Click" /><br />
            <asp:Button ID="btnDeductDays" runat="server" Text="Deduct Days" CssClass="btn" OnClick="btnDeductDays_Click" /><br />
            <asp:Button ID="btnDeductUnpaid" runat="server" Text="Deduct Unpaid" CssClass="btn" OnClick="btnDeductUnpaid_Click" /><br />

            <div class="date-range">
                <asp:Label ID="lblFrom" runat="server" Text="From Date:" />
                <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" />
                <asp:Label ID="lblTo" runat="server" Text="To Date:" />
                <asp:TextBox ID="txtTo" runat="server" TextMode="Date" />
            </div>

            <asp:Button ID="btnGeneratePayroll" runat="server" Text="Generate Payroll" CssClass="btn" OnClick="btnGeneratePayroll_Click" /><br />

            <asp:Label ID="lblMessage" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
