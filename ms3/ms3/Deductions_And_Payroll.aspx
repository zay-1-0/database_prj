<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deductions_And_Payroll.aspx.cs" Inherits="ms3.Deductions_And_Payroll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Deductions and Payroll</title>
    <style>
        /* Body styling */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        /* Main container */
        .container {
            max-width: 700px;
            width: 100%;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            text-align: center;
            color: #1E3A8A;
            margin-bottom: 30px;
            font-size: 28px;
        }

        /* Labels */
        label, asp\:Label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 8px;
        }

        /* DropDownLists and TextBoxes */
        asp\:DropDownList, asp\:TextBox {
            width: 100%;
            padding: 12px;
            border: 1px solid #60A5FA;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        asp\:DropDownList.ddl-employee {
            background-color: #f9fafb;
            color: #1E3A8A;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        asp\:DropDownList.ddl-employee:hover, asp\:DropDownList.ddl-employee:focus {
            border-color: #1E3A8A;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            outline: none;
        }

        /* Buttons */
        .btn {
            width: 100%;
            padding: 14px;
            margin-bottom: 15px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        /* Back button */
        .btn-back {
            background: #FACC15;
            margin-bottom: 30px;
        }

        .btn-back:hover {
            background: #eab308;
        }

        /* Date range styling */
        .date-range {
            display: flex;
            gap: 15px;
            align-items: center;
            margin-bottom: 20px;
        }

        .date-range asp\:Label {
            width: 90px;
            margin-bottom: 0;
            color: #1E3A8A;
        }

        .date-range asp\:TextBox {
            flex: 1;
        }

        /* Message label */
        #lblMessage {
            display: block;
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
            color: #dc2626;
            font-size: 16px;
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <!-- BACK BUTTON -->
            <asp:Button ID="btnBack" runat="server" Text="⟵ Back" CssClass="btn btn-back"
                OnClick="btnBack_Click" />

            <h2>Employee Deductions and Monthly Payroll</h2>

            <!-- Improved Select Employee -->
            <asp:Label ID="lblEmployee" runat="server" Text="Select Employee:" /><br />
            <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="ddl-employee" 
                AppendDataBoundItems="true">
                <asp:ListItem Text="-- Select an Employee --" Value="" />
            </asp:DropDownList><br />

            <!-- Deduction Buttons -->
            <asp:Button ID="btnDeductHours" runat="server" Text="Deduct Hours" CssClass="btn"
                OnClick="btnDeductHours_Click" /><br />
            <asp:Button ID="btnDeductDays" runat="server" Text="Deduct Days" CssClass="btn"
                OnClick="btnDeductDays_Click" /><br />
            <asp:Button ID="btnDeductUnpaid" runat="server" Text="Deduct Unpaid" CssClass="btn"
                OnClick="btnDeductUnpaid_Click" /><br />

            <!-- Date Range -->
            <div class="date-range">
                <asp:Label ID="lblFrom" runat="server" Text="From Date:" />
                <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" />
                <asp:Label ID="lblTo" runat="server" Text="To Date:" />
                <asp:TextBox ID="txtTo" runat="server" TextMode="Date" />
            </div>

            <asp:Button ID="btnGeneratePayroll" runat="server" Text="Generate Payroll"
                CssClass="btn" OnClick="btnGeneratePayroll_Click" /><br />

            <asp:Label ID="lblMessage" runat="server" Text="" />
        </div>
    </form>
</body>
</html>
