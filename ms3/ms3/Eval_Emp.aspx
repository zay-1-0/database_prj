<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Eval_Emp.aspx.cs" Inherits="ms3.Dean_Pres_exc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Upperboard Leave Approvals</title>

    <style>
        /* 1. Reset and Base Styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); /* Cool gradient background */
        }

        /* 2. Center everything using Flexbox */
        #form1 {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* 3. The "Card" Container */
        .evaluation-card {
            background-color: white;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2); /* Deep shadow for pop effect */
            width: 400px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .evaluation-card:hover {
            transform: translateY(-5px); /* Subtle lift animation on hover */
        }

        /* 4. Title Styling */
        .page-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 25px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            display: inline-block;
        }

        /* 5. DropDown Styling */
        /* Note: We target select elements because asp:DropDownList renders as <select> */
        .styled-dropdown {
            width: 100%;
            padding: 12px;
            margin-bottom: 25px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            background-color: #fafafa;
            font-size: 16px;
            color: #555;
            cursor: pointer;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .styled-dropdown:focus {
            border-color: #007bff;
        }

        /* 6. Button Styling */
        /* We target input[type=submit] because asp:Button renders as that */
        .styled-button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.3);
        }

        .styled-button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 123, 255, 0.4);
            transform: translateY(-2px);
        }
        
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="evaluation-card">
            
            <!-- Replaced plain text with a styled heading -->
            <div class="page-title">Evaluate Employee</div>
            
            <!-- Added CssClass to your existing controls -->
            <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="styled-dropdown" />
            
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" CssClass="styled-button" />

        </div>

    </form>

</body>

</html>