a<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ms3.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        /* Center the whole form vertically and horizontally */
        body {
            background-color: #e6f2ff;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            width: 400px;          /* bigger form */
            padding: 40px;         /* spacing inside form */
            border: 2px solid #007bff;
            border-radius: 15px;
            background-color: #ffffff;
            box-shadow: 4px 4px 20px rgba(0,0,0,0.3);
        }

        .login-container h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .login-container label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }

        .login-container input[type="text"], 
        .login-container input[type="password"], 
        .login-container asp\:TextBox {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: 1px solid #007bff;
            font-size: 16px;
            box-sizing: border-box;
        }

        .login-container .btn {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-container .btn:hover {
            background-color: #0056b3;
        }

        /* Center the error message under the button */
        .message-container {
            text-align: center;
            margin-top: 15px;
        }

        .message-container asp\:Label {
            color: red;
            font-weight: bold;
            font-size: 16px;
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
            <asp:TextBox ID="Password" runat="server" TextMode="Password" Text=""  autocomplete="off" />

            <asp:Button ID="LoginButton" runat="server" Text="Log In" CssClass="btn" OnClick="Login_Click" />

           
            
                <asp:Label ID="lblMessage" runat="server" Text="" />
           
        </div>
    </form>
</body>
</html>

