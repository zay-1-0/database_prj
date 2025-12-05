<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HR_HomePage.aspx.cs" Inherits="ms3.HR_HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR Home Page</title>
    <style>
        /* Body styling */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container for HR home page */
        .hr-container {
            background-color: #ffffff;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            border-top: 6px solid #FACC15;
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h1 {
            color: #1E3A8A;
            margin-bottom: 40px;
            font-size: 32px;
        }

        /* Buttons styling */
        .button-style {
            width: 250px;
            height: 60px;
            margin: 15px;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }

        .button-style:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.3);
        }

        /* Fade-in animation */
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="hr-container">
            <h1>Welcome, HR</h1>
            <asp:Button ID="Button1" runat="server" Text="Manage Leaves" OnClick="btnLeaves_Click" CssClass="button-style" />
            <asp:Button ID="btnDeductionsPayroll" runat="server" Text="Deductions & Payroll" OnClick="btnDeductionsPayroll_Click" CssClass="button-style" />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="button-style" OnClick="signOut" Text="Sign Out" />
        </div>
    </form>
</body>
</html>
