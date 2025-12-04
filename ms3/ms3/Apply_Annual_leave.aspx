<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply_Annual_leave.aspx.cs" Inherits="ms3.Apply_Annual_leave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Annual Leave Application</title>
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

        /* Style for the central container holding the controls */
        .input-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 450px; /* Slightly wider to accommodate date fields comfortably */
            text-align: center;
        }
        
        /* Container for the start/end date inputs to put them side-by-side */
        .date-input-row {
            display: flex;
            justify-content: space-between; /* Distribute space evenly */
            margin-bottom: 25px;
            text-align: left;
        }

        .date-input-col {
            width: 48%; /* Allows two columns with space in between */
        }

        /* Style the labels */
        .input-container label {
            display: block; 
            margin-bottom: 8px;
            font-size: 1em;
            font-weight: 600;
            color: #333;
        }

        /* Style the text and date input fields */
        .input-container asp\:TextBox {
            width: 90%; 
            padding: 10px;
            margin-bottom: 15px; /* Added margin for non-date textboxes */
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        /* Style the button */
        .input-container asp\:Button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.2s;
        }

        .input-container asp\:Button:hover {
            background-color: #0056b3;
        }

        /* Style for the main title */
        .main-title {
            margin-top: 0;
            margin-bottom: 20px;
            color: #1a1a1a;
        }

        /* Specific style for the replacement ID box */
        .replacement-id-box {
            text-align: left;
            margin-bottom: 25px;
        }

        .replacement-id-box asp\:TextBox {
            margin-top: 5px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="input-container">
            <h1 class="main-title">Apply for Annual Leave</h1>
            
            <!-- Replacement Employee ID -->
            <div class="replacement-id-box">
                <asp:Label ID="lblReplaceId" runat="server" Text="Replacement Employee ID:"></asp:Label>
                <asp:TextBox ID="Replace_emp_id" runat="server"></asp:TextBox>
            </div>

            <p style="text-align: center; margin-bottom: 20px; color: #555;">Select your desired leave date range.</p>

            <div class="date-input-row">
                <!-- Start Date Input -->
                <div class="date-input-col">
                    <asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label>
                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <!-- End Date Input -->
                <div class="date-input-col">
                    <asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label>
                    <asp:TextBox ID="EndDate" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            
            <asp:Button ID="SubmitDates" runat="server" Text="Submit Leave Request" OnClick="SubmitDates_Click" />
            
            <!-- Placeholder for messages/errors -->
            <asp:Literal ID="litMessage" runat="server"></asp:Literal>
                <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" />
        </div>
    </form>
</body>
</html>