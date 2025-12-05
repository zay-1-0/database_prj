<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ms3.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        /* Body with gradient background */
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #1E3A8A, #60A5FA);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Login box container */
        .login-container {
            width: 400px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        /* Heading */
        h2 {
            font-size: 28px;
            color: #1E3A8A;
            margin-bottom: 30px;
        }

        /* Labels */
        label, asp\:Label {
            display: block;
            font-weight: 600;
            color: #1E3A8A;
            margin-bottom: 8px;
            text-align: left;
        }

        /* Input fields */
        asp\:TextBox, input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #60A5FA;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        asp\:TextBox:focus, input:focus {
            border-color: #1E3A8A;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            outline: none;
        }

        /* Login button */
        .btn {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            margin-bottom: 15px;
        }

        .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        /* Error message styling */
        .message-container {
            margin-top: 10px;
        }

        .message-container asp\:Label {
            color: #dc2626;
            font-weight: bold;
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
        <div class="login-container">
            <h2>Admin Login</h2>

            <label for="<%= UserName.ClientID %>">User Name:</label>
            <asp:TextBox ID="UserName" runat="server" />

            <label for="<%= Password.ClientID %>">Password:</label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" autocomplete="off" />

            <asp:Button ID="LoginButton" runat="server" Text="Log In" CssClass="btn" OnClick="Login_Click" />

            <div class="message-container">
                <asp:Label ID="lblMessage" runat="server" Text="" />
            </div>
        </div>
    </form>
</body>
</html>
