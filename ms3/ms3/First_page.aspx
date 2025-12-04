<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="First_page.aspx.cs" Inherits="ms3.First_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>


    <style>
        body {
            background-color: #e6f2ff;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .home-container {
            width: 450px;
            padding: 40px;
            background-color: white;
            border-radius: 15px;
            border: 2px solid #007bff;
            box-shadow: 4px 4px 20px rgba(0,0,0,0.3);
            text-align: center;
        }

        h2 {
            color: #007bff;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .btn {
            width: 100%;
            padding: 15px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            font-size: 20px;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
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
