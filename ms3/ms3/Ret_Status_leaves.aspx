<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ret_Status_leaves.aspx.cs" Inherits="ms3.Ret_Status_leaves" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Status Records</title>
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
            min-height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        /* 3. The "Card" Container */
        .card-container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2); /* Deep shadow */
            width: 80%;
            max-width: 900px;
            text-align: center;
            transition: transform 0.3s ease;
            overflow: auto;
        }

        .card-container:hover {
            transform: translateY(-5px); /* Subtle lift animation */
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

        /* 5. GridView Styling */
        .modern-grid {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 14px;
            text-align: left;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }

        .modern-grid th {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px 15px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-align: center;
        }

        .modern-grid td {
            padding: 12px 15px;
            border-bottom: 1px solid #dddddd;
            color: #555;
            text-align: center;
        }

        .modern-grid tr:nth-of-type(even) {
            background-color: #f8f9fa;
        }

        .modern-grid tr:hover {
            background-color: #f1f1f1;
        }

        /* 6. Button Styling */
        .styled-button {
            padding: 10px 24px;
            background-color: #6c757d; /* Secondary gray color for Home */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(108, 117, 125, 0.2);
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .styled-button:hover {
            background-color: #5a6268;
            box-shadow: 0 6px 12px rgba(108, 117, 125, 0.3);
            transform: translateY(-2px);
        }

        /* Message Styling */
        .status-message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-container">
            <h1 class="page-title">Submitted Leave Status</h1>

            <asp:GridView ID="LeavesGridView" runat="server" 
                AutoGenerateColumns="true" 
                CssClass="modern-grid" 
                EmptyDataText="No leaves Submitted for this month." />
                
            <div class="status-message">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div>

            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" CssClass="styled-button" />
        </div>
    </form>
</body>
</html>