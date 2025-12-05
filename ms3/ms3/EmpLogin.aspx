<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpLogin.aspx.cs" Inherits="ms3.EmpLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Login</title>
    <style>
        /* 1. Ensure HTML and Body take full viewport height */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light background for contrast */
        }
        
        /* 2. Center the form container (form1) both horizontally and vertically using Flexbox */
        #form1 {
            height: 100%;
            display: flex;
            justify-content: center; /* Horizontal centering */
            align-items: center; /* Vertical centering */
        }
        
        /* 3. Style the login box container */
        .login-box {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center; /* Center the 'Login' title and button */
        }
        
        /* 4. Style input fields for better presentation */
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        /* 5. Style labels and headings */
        .login-box h2 {
            margin-top: 0;
            color: #333;
        }
        
        .login-box label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h2>Login</h2>
            
            <label for="<%= Employee_ID.ClientID %>">ID:</label>
            <asp:TextBox ID="Employee_ID" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            
            <label for="<%= Employee_Password.ClientID %>">Password:</label>
            <asp:TextBox ID="Employee_Password" runat="server" TextMode="Password"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="OnLogin" CssClass="login-button" />
            
            <%-- Optional: Placeholder for error messages --%>
            <asp:Literal ID="litError" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>