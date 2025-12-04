<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FetchDeduction_Attendance.aspx.cs" Inherits="ms3.FetchDeduction_Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        width: 800px; /* Increased width to accommodate the table */
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
    .Deduction-grid {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    .Deduction-grid th {
        background-color: #007bff;
        color: white;
        padding: 10px;
        border: 1px solid #ccc;
    }
    .Deduction-grid td {
        padding: 8px;
        border: 1px solid #ccc;
        text-align: center;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="input-group-container">
    
    <asp:Label ID="lblSemester" runat="server" Text="Enter Month :"></asp:Label>
    
    <asp:TextBox ID="month" runat="server" Width="100px"  placeholder="e.g., 1 referring to jan"></asp:TextBox>
    
    <asp:Button ID="GetTable" runat="server" Text="Fetch Deductions" OnClick="GetTable_Click" />
    
    <hr style="margin: 25px auto; border-top: 1px solid #eee;" />
    
    <asp:GridView ID="DeductionGridView" runat="server" 
        AutoGenerateColumns="true" 
        CssClass="Deduction-grid" 
        EmptyDataText="No Deduction records found for this month." />
     <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />

    <asp:Literal ID="litMessage" runat="server"></asp:Literal>
    
</div>
    </form>
</body>
</html>
