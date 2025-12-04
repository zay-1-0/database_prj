<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ret_Status_leaves.aspx.cs" Inherits="ms3.Ret_Status_leaves" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Status Records</title>
    <style>
        /* Base styles for full height and consistent font */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            background-color: #f0f2f5;
        }

        /* Flexbox for vertical and horizontal centering of the form */
        #form1 {
            height: 100%;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        /* Style for the central container holding the controls (The 'middle box') */
        .input-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 80%; /* Use relative width for larger content */
            max-width: 900px; /* Cap the max width on large screens */
            text-align: center;
        }

        /* --- Title Styling --- */
        .main-title {
            margin-top: 0;
            margin-bottom: 25px;
            color: #1a1a1a;
            font-size: 1.8em;
        }

        /* --- GridView Styling --- */
        .leaves-grid {
            width: 100%; /* Takes full width of the input-container */
            border-collapse: collapse;
            margin-top: 20px;
        }
        .leaves-grid th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .leaves-grid td {
            padding: 8px;
            border: 1px solid #eee; /* Lighter border for data rows */
            text-align: center;
        }
        .leaves-grid tr:nth-child(even) {
            background-color: #f9f9f9; /* Zebra striping for readability */
        }
        
        /* Style for the literal messages */
        .message {
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="input-container">
            <h1 class="main-title">Submitted Leave Status</h1>

            <asp:GridView ID="LeavesGridView" runat="server" 
                AutoGenerateColumns="true" 
                CssClass="leaves-grid" 
                EmptyDataText="No leaves Submitted for this month." />
                
            <!-- FIX: Wrapped the Literal in a <div> and applied the CssClass to the wrapper. -->
            <div class="message">
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                 <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />

            </div>
        </div>
    </form>
</body>
</html>