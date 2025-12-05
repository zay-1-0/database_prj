<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Last_month_payroll.aspx.cs" Inherits="ms3.Last_month_payroll" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Last Month Payroll</title>

    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 950px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        h1 {
            color: #1E3A8A;
            font-size: 32px;
            margin-bottom: 25px;
        }

        /* GridView Styling */
        .Payrol-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 15px;
        }

        .Payrol-grid th {
            background-color: #1E3A8A;
            color: white;
            padding: 12px;
            border: 1px solid #ccc;
        }

        .Payrol-grid td {
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9fafb;
            text-align: center;
        }

        .Payrol-grid tr:nth-child(even) {
            background-color: #eef3ff;
        }

        /* Message Styling */
        .message {
            margin-top: 20px;
            font-weight: bold;
            color: #1E3A8A;
        }

        /* Buttons */
        .btn {
            width: 60%;
            padding: 14px;
            margin-top: 25px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: #FACC15;
            color: #1E3A8A;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background: #eab308;
            transform: translateY(-3px);
        }

        /* Animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1>Last Month's Payroll Details</h1>

            <asp:GridView ID="PayrollGridView" runat="server"
                AutoGenerateColumns="true"
                CssClass="Payrol-grid"
                EmptyDataText="No Payroll records found for last month.">
            </asp:GridView>

            <!-- HOME Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page"
                CssClass="btn" OnClick="HomeButton_Click" />

            <div class="message">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div>

        </div>
    </form>
</body>
</html>
