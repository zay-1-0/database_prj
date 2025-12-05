<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage_employee.aspx.cs" Inherits="ms3.HomePage_employee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Home Page</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            width: 350px;
            animation: fadeIn 1s ease-in-out;
        }

        h1 {
            color: #1E3A8A;
            font-size: 28px;
            margin-bottom: 30px;
        }

        .btn {
            width: 100%;
            padding: 12px;
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

        .btn-signout {
            background: #FACC15;
            margin-bottom: 25px;
        }

        .btn-signout:hover {
            background: #eab308;
        }

        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(-20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Button ID="SignOutButton" runat="server" Text="Sign Out" OnClick="signOut" CssClass="btn btn-signout" />
            <h1>Home Page</h1>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Retrieve my performance" CssClass="btn" />
            <asp:Button ID="Button2" runat="server" Text="Retrieve My attendance records" OnClick="Button2_Click" CssClass="btn" />
            <asp:Button ID="Button3" runat="server" Text="Retrieve last month’s payroll" OnClick="Button3_Click" CssClass="btn" />
            <asp:Button ID="Button4" runat="server" Text="Fetch all attendance deductions" OnClick="fetchDed" CssClass="btn" />
            <asp:Button ID="Button5" runat="server" Text="Apply for a Leave" OnClick="App_Leave" CssClass="btn" />
            <asp:Button ID="Button6" runat="server" Text="Status of annual and accidental leaves" OnClick="Button5_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>
