<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ms3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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

        /* Login container */
        .login-container {
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
        .login-container h2 {
            color: #1E3A8A;
            margin-bottom: 40px;
            font-size: 32px;
        }

        /* Labels */
        .login-container label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #333;
        }

        /* Textboxes */
        .login-container input[type="text"], 
        .login-container input[type="password"], 
        .login-container asp\:TextBox {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border-radius: 10px;
            border: 1px solid #60A5FA;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* Button */
        .login-container .btn {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            background: linear-gradient(90deg, #1E3A8A, #60A5FA);
            color: white;
            font-weight: bold;
            font-size: 18px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }

        .login-container .btn:hover {
            background: linear-gradient(90deg, #60A5FA, #1E3A8A);
            transform: translateY(-3px);
            box-shadow: 0 12px 20px rgba(0,0,0,0.3);
        }

        /* Error message centered under the button */
        .message-container {
            text-align: center;
            margin-top: 20px;
        }

        .message-container asp\:Label {
            color: red;
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
            <h2>Login</h2>

            <label for="UserName">User Name:</label>
            <asp:TextBox ID="UserName" runat="server" />

            <label for="Password">Password:</label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" autocomplete="off" />

            <asp:Button ID="LoginButton" runat="server" Text="Log In" CssClass="btn" OnClick="Login_Click" />

            <div class="message-container">
                <asp:Label ID="lblMessage" runat="server" Text="" />
            </div>
        </div>
    </form>
</body>
</html>
