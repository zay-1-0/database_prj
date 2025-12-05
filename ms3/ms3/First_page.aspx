<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="First_page.aspx.cs" Inherits="ms3.First_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>

    <style>
        /* Body styling */
        body {
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            font-family: 'Poppins', Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container */
        .home-container {
            width: 400px;
            padding: 50px 40px;
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            border-top: 6px solid #FACC15;
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            color: #1E3A8A;
            margin-bottom: 40px;
            font-size: 32px;
            letter-spacing: 1px;
        }

        /* Buttons */
        .btn {
            width: 100%;
            padding: 15px 0;
            margin-top: 20px;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            font-size: 18px;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
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
        <div class="home-container">
            <h2>Welcome</h2>
            <asp:Button ID="btnAdmin" runat="server" Text="Admin Login" CssClass="btn" OnClick="btnAdmin_Click" />
            <asp:Button ID="btnHR" runat="server" Text="HR Login" CssClass="btn" OnClick="btnHR_Click" />
            <asp:Button ID="btnEmployee" runat="server" Text="Employee Login" CssClass="btn" OnClick="btnEmployee_Click" />
        </div>
    </form>
</body>
</html>
