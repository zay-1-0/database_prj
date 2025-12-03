<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyperformanceView.aspx.cs" Inherits="ms3.MyperformanceView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Retrieve Performance</title>
    <style>
        /* Base styles for full height and consistent font */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: sans-serif; 
            background-color: #f0f2f5;
        }

        /* Flexbox for vertical and horizontal centering of the form */
        #form1 {
            height: 100%;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        /* Style for the central container holding the controls */
        .input-group-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 450px; /* Increased width to accommodate the table */
            text-align: center; 
        }
        
        /* Style the label for better display */
        .input-group-container label {
            display: block; 
            margin-bottom: 8px;
            font-size: 1.1em;
            color: #333;
        }

        /* Style the textbox */
        .input-group-container asp\:TextBox {
            width: 80%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            text-align: center;
        }

        /* Style the button */
        .input-group-container asp\:Button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.2s;
        }

        .input-group-container asp\:Button:hover {
            background-color: #0056b3;
        }

        /* --- GridView Styling (New/Modified) --- */
        .performance-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .performance-grid th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: 1px solid #ccc;
        }
        .performance-grid td {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="input-group-container">
            
            <asp:Label ID="lblSemester" runat="server" Text="Enter Semester Number:"></asp:Label>
            
            <asp:TextBox ID="Semester" runat="server" Width="100px" MaxLength="3" placeholder="e.g., W24"></asp:TextBox>
            
            <asp:Button ID="GetTable" runat="server" Text="Get Performance" OnClick="GetTable_Click" />
            
            <hr style="margin: 25px auto; width: 80%; border-top: 1px solid #eee;" />
            
            <asp:GridView ID="PerformanceGridView" runat="server" 
                AutoGenerateColumns="true" 
                CssClass="performance-grid" 
                EmptyDataText="No performance records found for this semester." />
            
            <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            
        </div>
    </form>
</body>
</html>