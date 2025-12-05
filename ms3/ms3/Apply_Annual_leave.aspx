<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply_Annual_leave.aspx.cs" Inherits="ms3.Apply_Annual_leave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Annual Leave Application</title>
    <style>
        /* Base styles for full height and centering (Matching theme) */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Flexbox for vertical and horizontal centering of the form */
        #form1 {
            height: 100%;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
        }

        /* The central card container */
        .card {
            width: 480px; /* Slightly adjusted width */
            padding: 40px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            box-sizing: border-box;
            text-align: center;
        }

        /* Title Styling */
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #004b8d;
            font-size: 1.8em;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        /* Input Label and Grouping */
        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-label {
            font-weight: bold;
            font-size: 14px;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        /* Date Row Layout */
        .date-input-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .date-input-col {
            width: 48%; 
        }

        /* Styling for all ASP.NET textboxes/dropdowns */
        .text-input, .date-input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box;
        }
        
        /* Submit Button Styling */
        .btn-submit {
            width: 100%;
            padding: 12px;
            background: #28a745; /* Green for primary submit action */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 15px;
        }
        .btn-submit:hover {
            background: #1e7e34;
        }

        /* Home Button Styling (Secondary Gray) */
        .btn-home {
            width: 100%;
            padding: 12px;
            background: #6c757d; /* Secondary Gray Color */
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px; 
            transition: background 0.2s;
        }
        .btn-home:hover {
            background: #5a6268;
        }

        /* Spacing for the message */
        .message-area {
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h2>Annual Leave Application</h2>

            <!-- Replacement Employee ID -->
            <div class="input-group">
                <label class="input-label" for="<%= Replace_emp_id.ClientID %>">Replacement Employee ID:</label>
                <asp:TextBox ID="Replace_emp_id" runat="server" CssClass="text-input"></asp:TextBox>
            </div>

            <p style="text-align: center; margin-bottom: 20px; color: #555;">Select your desired leave date range.</p>

            <div class="date-input-row">
                <!-- Start Date Input -->
                <div class="date-input-col">
                    <label class="input-label" for="<%= StartDate.ClientID %>">Start Date:</label>
                    <asp:TextBox ID="StartDate" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
                </div>

                <!-- End Date Input -->
                <div class="date-input-col">
                    <label class="input-label" for="<%= EndDate.ClientID %>">End Date:</label>
                    <asp:TextBox ID="EndDate" runat="server" TextMode="Date" CssClass="date-input"></asp:TextBox>
                </div>
            </div>
            
            <!-- Submit Button -->
            <asp:Button ID="SubmitDates" runat="server" Text="Submit Leave Request" OnClick="SubmitDates_Click" CssClass="btn-submit" />
            
            <!-- Message Area -->
            <div class="message-area"> 
                <asp:Literal ID="litMessage" runat="server"></asp:Literal>
            </div> 

            <!-- Home Button -->
            <asp:Button ID="HomeButton" runat="server" Text="Go to Home Page" OnClick="HomeButton_Click" CssClass="btn-home" />
        </div>
    </form>
</body>
</html>