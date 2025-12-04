<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage_employee.aspx.cs" Inherits="ms3.HomePage_employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Home Page</title>
    <style>
        /* 1. Style the body/html to take up the full viewport */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            /* Optional: Centers the form element if not using flex on body */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; /* Stacks the form and any other body content */
        }

        /* 2. Style the form to take up the remaining height */
        #form1 {
            height: 100%;
            display: flex; /* Make the form a flex container too */
            justify-content: center; /* Center form content horizontally */
            align-items: center; /* Center form content vertically */
        }

        /* 3. Style the inner content div (where your controls are) */
        .content-container {
            /* Centers the text content inside the container */
            text-align: center; 
            /* Optional: Add some padding and a border to see the container */
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* Optional: Makes the buttons uniform and visually appealing */
        .content-container asp\:Button {
            margin: 5px 0; /* Add vertical spacing between buttons */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="content-container"> 
            <asp:Label ID="Label1" runat="server" Text="Home Page" style="font-size: 1.5em; font-weight: bold; margin-bottom: 15px; display: block;"></asp:Label>
            <br />
            <%-- The <br /> tags can be replaced with CSS margins for better spacing --%>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Retrieve my performance" Width="275px" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Retrieve My attendance records" Width="275px" OnClick="Button2_Click" />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Retrieve last month’s payroll " Width="275px" OnClick="Button3_Click" />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Fetch all attendance deductions" OnClick="fetchDed" Width="275px" />
            <br />
            <asp:Button ID="Button5" runat="server" Text="Apply for an annual leave" OnClick="Button4_Click" Width="275px" />
            <br />
            <asp:Button ID="Button6" runat="server" Text="Status of annual and accidental leaves" OnClick="Button5_Click" Width="275px" style="height: 26px" />
        </div>
    </form>
</body>
</html>